Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54C7C
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 02:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC66C34115;
	Wed,  8 Jun 2022 02:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654654636;
	bh=dFIQHND7/de6ERt33/EJw1YFoRsUBtTJPGMBARvM1fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYSHXrCZEtji0UMMxEA6ZIX76EWxraIEyNwA/Tk6tJAJ5ewGG2PmwN4+EXBHz1EX4
	 vcfD1HCPwGljjiQ5kYe1rhOUPU4F2kEHrJKKLeCh6M9SJkwr5tP8PnL3fWeOpSV27l
	 n0Jew4dSxH/FjA8pWHoiBak3gqfnJscuynFcC3i5/YseJTX0Di9CKCWEcGl/PLWZWg
	 2SfkkbhF26U+YERsW+R02lHSaxt6We1a2uuWsW9Z92bFwHSGE0r1cnw0ORiVBQ8qXp
	 4uZwzmTJaQaF/hbXpWgmzMwg01pCjbZjuCzL0YLUHahWxN1tZ8fpeaqn9QqUIcVw3F
	 NaVKcAdQ6YU8A==
Date: Wed, 8 Jun 2022 02:17:13 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/15] platform/chrome: use krealloc() for `din` and
 `dout`
Message-ID: <YqAGqZgauTnn76KD@google.com>
References: <20220607145639.2362750-1-tzungbi@kernel.org>
 <20220607145639.2362750-13-tzungbi@kernel.org>
 <CABXOdTebXS3c823jWYx9r8mU4LwNfhLo833s7_krK4JW0fSgUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXOdTebXS3c823jWYx9r8mU4LwNfhLo833s7_krK4JW0fSgUw@mail.gmail.com>

On Tue, Jun 07, 2022 at 12:06:23PM -0700, Guenter Roeck wrote:
> On Tue, Jun 7, 2022 at 7:57 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > Use krealloc() to re-allocate `din` and `dout`.  Don't use devm variant
> > because the two buffers could be re-allocated multiple times during
> > runtime.  Their life cycles aren't quite aligned to the device's.
> 
> While this saves a few lines of code, it is runtime-expensive:
> krealloc() copies the old data, which is a waste of time/resources.
> Maybe it would be better to just use kfree() followed by kzalloc().

Ack.  I wasn't aware of the memcpy().  Let's don't use it.

> > @@ -469,9 +469,9 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
> >   */
> >  int cros_ec_query_all(struct cros_ec_device *ec_dev)
> >  {
> > -       struct device *dev = ec_dev->dev;
> >         u32 ver_mask = 0;
> >         int ret;
> > +       u8 *din, *dout;
> >
> >         /* First try sending with proto v3. */
> >         if (!cros_ec_get_proto_info(ec_dev, CROS_EC_DEV_EC_INDEX)) {
> > @@ -492,21 +492,15 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
> >                 }
> >         }
> >
> > -       devm_kfree(dev, ec_dev->din);
> > -       devm_kfree(dev, ec_dev->dout);
> > -
> > -       ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
> > -       if (!ec_dev->din) {
> > -               ret = -ENOMEM;
> > -               goto exit;
> > -       }
> > +       din = krealloc(ec_dev->din, ec_dev->din_size, GFP_KERNEL);
> > +       if (!din)
> > +               return -ENOMEM;
> 
> I would suggest assigning the values directly; the new variables don't
> really add value.

checkpatch.pl generated a warning for it.  See [1].

Will remove the krealloc()s anyway.

[1]: https://github.com/torvalds/linux/commit/972fdea2e6ece7578915d386a5447bc78d3fb8b8
