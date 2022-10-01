Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F346C23A7
	for <chrome-platform@lists.linux.dev>; Sat,  1 Oct 2022 07:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F85C433D6;
	Sat,  1 Oct 2022 07:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664609584;
	bh=ZWSAXWIc+fo9iToKEaqGYonGMxMMKfGxQOOCqApi5y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1TOby2CTh+qHGkZvhlqDPVeRg644mWXwqCQrHY3y2Rvm2ZpUnhHus64j1q9su95s3
	 AYxv/6FUuHD1DQeePzOg9iLmdjekPlwKnwSiiY9vsbBDItByomOrfQmp7Rb4fAVzzv
	 T3BezeS/iAUnbSFRxnp+03N+hkubOXU1GmsYSX1U=
Date: Sat, 1 Oct 2022 09:33:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v11] firmware: google: Implement cbmem in sysfs driver
Message-ID: <YzftVZj+2RCcIDN7@kroah.com>
References: <20220929234432.3711480-1-jrosenth@chromium.org>
 <YzaNjlqc0GqmJt68@kroah.com>
 <YzdqUX/zPvtyCmNm@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzdqUX/zPvtyCmNm@chromium.org>

On Fri, Sep 30, 2022 at 04:14:41PM -0600, Jack Rosenthal wrote:
> On 2022-09-30 at 08:32 +0200, Greg KH wrote:
> > symlink?  Ick, no, do not do that at all please.
> > 
> > As these are device attributes, just stick with them.  Don't do a crazy
> > symlink into a non-device-attribute portion of the sysfs tree, by doing
> > that you break all userspace tools and stuff like libudev will never
> > even see these attributes.
> 
> I guess I can fill in some info here about the use case needed:
> userspace tools (in this case, a tool called "crossystem") needs to look
> up a CBMEM entry by ID and read it.  So, being able to find a fixed path
> like /sys/firmware/cbmem/<id>/mem is significantly easier than scanning
> all /sys/bus/coreboot/devices/coreboot*/id to find the right device
> first.

No, this is a device, make these device attributes, don't polute sysfs
with random symlinks from a device into the firmware location, that's
not ok.

And again, your current code means that tools like udev and libraries
will not see these attributes at all.  Stick with what every other
device in the kernel does please, consistancy is good.

> What exactly do we break here by adding symlinks?  udev won't look into
> /sys/firmware, right?

Exactly.  You want that to work.

> Or, is there another good alternative that we could use to find a CBMEM
> entry by its id without needing to scan thru all coreboot bus type
> devices?  Setting the device name to something more predictable (e.g.,
> "cbmem-<id>") would require the coreboot bus type to "look ahead" and
> notice it's a CBMEM entry before registering the device, which wouldn't
> exactly be all that clean.

All devices on a bus can call themselves whatever they want, of course
they should be naming themselves based on their device type, why
wouldn't they?

Or put an attribute of the type in the directory of the coreboot device
and iterate on that.  It's a simple udev rule for matching on an
attribute value on a bus.

> > > +What:		/sys/firmware/cbmem/
> > > +Date:		August 2022
> > > +Contact:	Jack Rosenthal <jrosenth@chromium.org>
> > > +Description:
> > > +		Coreboot provides a variety of data structures in CBMEM.  This
> > > +		directory contains each CBMEM entry, which can be found via
> > > +		Coreboot tables.
> > 
> > What happened to the coreboot name?
> 
> I removed it as it seemed like from your last message you didn't want
> it?

I do not recall saying that, I was just confused that it had not been
used before.

Please do not use cbmem.

thanks,

greg k-h
