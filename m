Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550D21FC8
	for <chrome-platform@lists.linux.dev>; Fri, 24 Jun 2022 03:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E38FC341C7;
	Fri, 24 Jun 2022 03:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656041945;
	bh=hvDGrtKuAmkd+sf5FsC2kG2pzlnLQfPD66t4zrguroY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BdW9aYWTna/FgxG26tzKfPxIIv0eFwJPbhVl1P7F3ufU/qTD4whyEnVjNhh0Jwoge
	 WJeBFYalCNyUJtib10S95jOdCwyIeUwhEg6qrauIsDYBgiauuewCT4RPjJ0ZQGuBpm
	 NowzND0ibKJpg0Y8kOAcjviWjmRtc6/CCRhlVRgz5GgwqmyhpiBx7/1J1h98Mu7PUU
	 twY7tQJCLAJO2R5wtBfhO+G9mPXmHRjuATKrckxfutAPY/FWcjE/TfIy5ekx3c1fg2
	 50I+7msYSYsoOGC3rODa+mtahpIlNyEE6wLs+cMkfdBGRoCs3N5XsH5Y4nZjbtv//D
	 a7BeMi3sawfjg==
Date: Fri, 24 Jun 2022 03:39:01 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/11] platform/chrome: cros_ec_proto: separate
 cros_ec_wait_until_complete()
Message-ID: <YrUx1UXR4OnuTgAN@google.com>
References: <20220615051248.1628156-1-tzungbi@kernel.org>
 <20220615051248.1628156-6-tzungbi@kernel.org>
 <CABXOdTeYf=KsaMeEMOcevRjitvkLDKPeTELfDSmCxyG0OWWjgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXOdTeYf=KsaMeEMOcevRjitvkLDKPeTELfDSmCxyG0OWWjgQ@mail.gmail.com>

On Wed, Jun 15, 2022 at 01:50:26PM -0700, Guenter Roeck wrote:
> On Tue, Jun 14, 2022 at 10:13 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > -static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
> > +static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *result)
> >  {
> > -       int ret = cros_ec_xfer_command(ec_dev, msg);
> > +       struct cros_ec_command *msg;
> > +       struct ec_response_get_comms_status *status;
> > +       int ret = 0, i;
> > +
> > +       msg = kzalloc(sizeof(*msg) + sizeof(*status), GFP_KERNEL);
> > +       if (!msg)
> > +               return -ENOMEM;
> >
> > -       if (msg->result == EC_RES_IN_PROGRESS) {
> > -               int i;
> > -               struct cros_ec_command *status_msg;
> > -               struct ec_response_get_comms_status *status;
> > +       msg->command = EC_CMD_GET_COMMS_STATUS;
> > +       msg->insize = sizeof(*status);
> >
> > -               status_msg = kmalloc(sizeof(*status_msg) + sizeof(*status),
> > -                                    GFP_KERNEL);
> > -               if (!status_msg)
> > -                       return -ENOMEM;
> > +       status = (struct ec_response_get_comms_status *)msg->data;
> >
> > -               status_msg->version = 0;
> > -               status_msg->command = EC_CMD_GET_COMMS_STATUS;
> > -               status_msg->insize = sizeof(*status);
> > -               status_msg->outsize = 0;
> > +       /* Query the EC's status until it's no longer busy or we encounter an error. */
> > +       for (i = 0; i < EC_COMMAND_RETRIES; ++i) {
> > +               usleep_range(10000, 11000);
> >
> > -               /*
> > -                * Query the EC's status until it's no longer busy or
> > -                * we encounter an error.
> > -                */
> > -               for (i = 0; i < EC_COMMAND_RETRIES; i++) {
> > -                       usleep_range(10000, 11000);
> > -
> > -                       trace_cros_ec_request_start(status_msg);
> > -                       ret = (*xfer_fxn)(ec_dev, status_msg);
> > -                       trace_cros_ec_request_done(status_msg, ret);
> 
> I'll have to spend more time on this; I don't immediately see (from
> the diff) the replacement for the traces, and I don't see what
> happened with xfer_fxn.

They are replaced by calling cros_ec_xfer_command() (see below) which does the
same things.

> > -                       if (ret == -EAGAIN)
> > -                               continue;
> > -                       if (ret < 0)
> > -                               break;
> > -
> > -                       msg->result = status_msg->result;
> > -                       if (status_msg->result != EC_RES_SUCCESS)
> > -                               break;
> > -
> > -                       status = (struct ec_response_get_comms_status *)
> > -                                status_msg->data;
> > -                       if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
> > -                               break;
> > -               }
> > +               ret = cros_ec_xfer_command(ec_dev, msg);
> > +               if (ret == -EAGAIN)
> > +                       continue;
> > +               if (ret < 0)
> > +                       break;
