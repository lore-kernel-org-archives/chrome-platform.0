Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446707C
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 02:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110B7C34114;
	Wed,  8 Jun 2022 02:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654654622;
	bh=ZqeGTyfh/Ani8+K+9DA5ei1T7FyK6i6XD9rV4VeyryM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVw5jD9hmlhBw7cna50eKtb6BeRDtHouoqUONkWwUvYQztv3TxoS0mvnCy9XqEVN+
	 gH5gWRcVQtW8NoEhTpTp+QlmDyPb3/lbCpAEUWtNqkuNDmkhvYl5DMQQa+4yew+jlq
	 p1UNiKj4ki0Kfj5RfksRxlDEmjZjX4aUzqAoBczz5Q3sLTnGZl+70w8IKLgnmTH3GZ
	 m2NhqtJ+O3Tvdjm9Y66iXUZ11vA46jlLN0MhG22GajiM5m91pboCr8f12QVqa4YYn+
	 Y2QlDuHMd3P6d68y6srF/whAFIiHwnsSIj5XjHgQ5VsRwiaGgFkoU5aoYTueZ6dBnK
	 agh5XPsIuAP1g==
Date: Wed, 8 Jun 2022 02:16:58 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/15] platform/chrome: cros_ec_proto: handle empty
 payload in getting proto info
Message-ID: <YqAGmpdTfZsa7Lux@google.com>
References: <20220607145639.2362750-1-tzungbi@kernel.org>
 <20220607145639.2362750-9-tzungbi@kernel.org>
 <CABXOdTdx7jKLbHa3X7aOz3wUMpwWWHkncfKuRyGzonkA92Rg=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXOdTdx7jKLbHa3X7aOz3wUMpwWWHkncfKuRyGzonkA92Rg=w@mail.gmail.com>

On Tue, Jun 07, 2022 at 11:47:56AM -0700, Guenter Roeck wrote:
> On Tue, Jun 7, 2022 at 7:57 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > cros_ec_get_proto_info() expects to receive
> > sizeof(struct ec_response_get_protocol_info) from send_command().  The
> > payload is valid only if the return value is positive.
> >
> > Add Kunit tests for returning 0 in send_command() and handle the case in
> > cros_ec_get_proto_info().
> >
> That should be two separate patches.

Ack, will separate them in next version.  I put them together because I wrote
Kunit test first to make sure the second half takes effect (somehow TDD).

Could I still put the Kunit patch first (even if it introduces Kunit test
failure)?

> 
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> > No v1.  New in the series.
> >
> >  drivers/platform/chrome/cros_ec_proto.c      |   5 +
> >  drivers/platform/chrome/cros_ec_proto_test.c | 132 +++++++++++++++++++
> >  2 files changed, 137 insertions(+)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> > index 893b76703da6..6f5be9e5ede4 100644
> > --- a/drivers/platform/chrome/cros_ec_proto.c
> > +++ b/drivers/platform/chrome/cros_ec_proto.c
> > @@ -314,6 +314,11 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
> >                 goto exit;
> >         }
> >
> > +       if (ret == 0) {
> > +               ret = -EPROTO;
> > +               goto exit;
> > +       }
> > +
> 
> I think you can move that into the if() statement above (which already
> checks for ret >=0),
> making it a special case of that situation.

Nope, there is no "ret >= 0" (you could be confusing with
cros_ec_get_host_event_wake_mask()).

The result flow roughly like:

ret = send_command(...);
if (ret < 0)
  goto exit;

mapped = cros_ec_map_error(...);
if (mapped) {
  ...
  goto exit;
}

if (ret == 0) {
  ...
  goto exit;
}
