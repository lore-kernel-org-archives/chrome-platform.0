Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0FF35E95E;
	Thu, 18 Jun 2026 11:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781668; cv=none; b=HoOkECRSibv56QRrUL0AJqTqQo2j2Zspe5BAISDVCTtOQI1ovvlFThv2h7+ttHYuqzg9Y28GqDrL0KQbJnWQWiQQw1mtSSNXOQK9uM+DqO0rbbUSsrRzg7kCYe5+aU6mKrOkbk5MKqCFKyXjDsItVBmWrF8XEHREjIEOVAdvgr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781668; c=relaxed/simple;
	bh=fV2Ku084fb8I5+qtyQv0NaTJ/litgoCToccqa3um+4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvxEBMybVMMuuYG5rjkvR6sXWd/TssiQ+0RoeFCjgtVs6/z1CSPSs4wRf4cot//VwjiytN9AsRqbIg+q4XZmIdb0ddciHj32PF7NPrsRyNaZSmSJIsNhpDU04kSri+KrIvoBfH/OWL463h3CSsphVjH2u3wPSY/HDFth8/+Y7Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbWgJeup; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbWgJeup"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295F71F000E9;
	Thu, 18 Jun 2026 11:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781781666;
	bh=aME+qwnw7tnKkV20gvXHpjEoxPYztAAPzj3bCVoXdIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YbWgJeup3DU4YG61Q6JDJrcI8cuDysimvPbfOTUk3bRHTXaVpbszPD7EX5H2Xl5gx
	 i3t0Sn4tMsOaXl+FQuEd0X5novsQu9wSj2Q4jVfHU5mc5k67eL0sCIUIXWyULgI3Of
	 EGIfB8mp3LcrPQ4A0Ixou6Fi4IWBr++mlVJi1lQgfuaEPB8mtrDBqoD+23CSzVScSW
	 CKxvI22m6lGA5Gr7WQb4Cm3JKMLyOtuC7ED/P9RLkM9w3g8nICJORtv67ItjVbAABq
	 L84PAjgRegic2/pK3qbLC0za5ZmvLNW1Qh83kUDzUZc2eiWJhCk8zM2C+AuYtnP5VE
	 VF2Y+ROnVOssA==
Date: Thu, 18 Jun 2026 12:21:02 +0100
From: Lee Jones <lee@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Andrei Kuchynski <akuchynski@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: cros_ec: Read EC features during probe to
 catch transfer error
Message-ID: <20260618112102.GE1672911@google.com>
References: <20260608211518.2214740-1-akuchynski@chromium.org>
 <20260608211518.2214740-3-akuchynski@chromium.org>
 <20260618084037.GA1672911@google.com>
 <ajO6_zXQKxbdCxhz@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajO6_zXQKxbdCxhz@google.com>

On Thu, 18 Jun 2026, Tzung-Bi Shih wrote:

> On Thu, Jun 18, 2026 at 09:40:37AM +0100, Lee Jones wrote:
> > On Mon, 08 Jun 2026, Andrei Kuchynski wrote:
> > 
> > > cros_ec_check_features() does not return an error if the underlying
> > > EC_CMD_GET_FEATURES command fails. Consequently, when the Fingerprint
> > > device fails to respond, the probe function ignores the failure and falls
> > > back to installing it as 'cros_ec' device instead of 'cros_fp'.
> > > This leads to a sysfs duplicate filename collision later when the real
> > > 'cros_ec' device attempts to register:
> > > 
> > >   cros-ec-spi spi5.0: EC failed to respond in time
> > >   cros-ec-dev.19.auto: cannot get EC features: -110
> > >   sysfs : cannot create duplicate filename '/class/chromeos/cros_ec'
> > >         : sysfs_do_create_link_sd+0x94/0xdc
> > >         : ec_device_probe+0x150/0x4f0
> > > 
> > > Fix this by explicitly calling the newly introduced cros_ec_read_features()
> > > function. If the transfer fails, abort the broken device initialization.
> > > Move the initialization of class_dev before this call to prevent a missing
> > > release() callback warning on the error path.
> > > 
> > > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > > ---
> > >  drivers/mfd/cros_ec_dev.c | 18 +++++++++++-------
> > >  1 file changed, 11 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> > > index 39430dd44e30c..a8c6300248d59 100644
> > > --- a/drivers/mfd/cros_ec_dev.c
> > > +++ b/drivers/mfd/cros_ec_dev.c
> > > @@ -203,6 +203,17 @@ static int ec_device_probe(struct platform_device *pdev)
> > >  	ec->features.flags[1] = -1U; /* Not cached yet */
> > >  	device_initialize(&ec->class_dev);
> > >  
> > > +	/*
> > > +	 * Add the class device
> > > +	 */
> > > +	ec->class_dev.class = &cros_class;
> > > +	ec->class_dev.parent = dev;
> > > +	ec->class_dev.release = cros_ec_class_release;
> > > +
> > > +	retval = cros_ec_read_features(ec);
> > 
> > This depends on the other patch.
> > 
> > Once it's been Reviewed / Acked, I'd be happy to take both and submit an IB.
> 
> FWIW: I gave my A-b tag in v1 and it has been carried to [PATCH v2 1/2]
> platform/chrome: cros_ec_proto: Introduce cros_ec_read_features helper.

I see it.  Thank you.

Note to self: Take the set after -rc1

-- 
Lee Jones
