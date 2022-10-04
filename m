Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9122210D
	for <chrome-platform@lists.linux.dev>; Tue,  4 Oct 2022 08:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD40C433C1;
	Tue,  4 Oct 2022 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664873149;
	bh=HJ+VDJjc7oJkRAoYu0qqBQh30QWqD085DxRbxFtXWP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMr3kCEWwDzYsyvIlGj3kpWUQf5KZBNfiwsMIOrkQdQvL4P5CEj9ovFOTLmNVVlZb
	 hvbtTsxvSIituEt/Q9lB6/ihxTUkSVC32L/tHVF2ruW62eRn7aViJ26fYNluwtSWw2
	 E88EIytuuV329oh3DpVEHiItnjI/gzO1jeEEqB8w=
Date: Tue, 4 Oct 2022 10:45:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Jack Rosenthal <jrosenth@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>,
	chrome-platform@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH v11] firmware: google: Implement cbmem in sysfs driver
Message-ID: <YzvyugFKS+DpIL+2@kroah.com>
References: <20220929234432.3711480-1-jrosenth@chromium.org>
 <YzaNjlqc0GqmJt68@kroah.com>
 <YzdqUX/zPvtyCmNm@chromium.org>
 <YzftVZj+2RCcIDN7@kroah.com>
 <CAODwPW_2bM9d3NzcFDeAYtJeBhWBt10AUOajpNEKmnBOD=Qe2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW_2bM9d3NzcFDeAYtJeBhWBt10AUOajpNEKmnBOD=Qe2w@mail.gmail.com>

On Mon, Oct 03, 2022 at 05:56:35PM -0700, Julius Werner wrote:
> > No, this is a device, make these device attributes, don't polute sysfs
> > with random symlinks from a device into the firmware location, that's
> > not ok.
> >
> > And again, your current code means that tools like udev and libraries
> > will not see these attributes at all.  Stick with what every other
> > device in the kernel does please, consistancy is good.
> >
> > > What exactly do we break here by adding symlinks?  udev won't look into
> > > /sys/firmware, right?
> >
> > Exactly.  You want that to work.
> 
> I feel like there might be some misunderstanding here... we're not
> adding these symlinks for udev. Of course, if someone wanted to match
> one of these entries with udev, they would do that by matching the
> device entry directly, and there is an `id` device attribute for that.
> We're not breaking that use case, and for those tools we totally agree
> that the normal device node matching by attribute makes most sense.

Ok, if you aren't adding a symlink for udev, then don't add a symlink at
all as no one will need it :)

symlinks are either for showing a real device relationship or for when
we mess things up and need to keep a compatible view of the sysfs tree
because we moved things and userspace tools would break if we didn't.
Don't add them if you do not absolutely need them.

> But we have a different use case where userspace tools that need to
> access one specific ID are frequently called on-demand (e.g. from the
> command line or by another process), not only once on device
> registration like udev. For that kind of use case, always searching
> through every single node to find the right ID is cumbersome and
> time-wasting.

Really?  Iterating over all devices in /sys/bus/BUSTYPE/devices/ is
slow?  Have you tested it and found a performance issue?  This is all in
memory, how slow is it really?

> We're just trying to create a convenience symlink to
> make that use case easier and faster. The sysfs device framework
> itself already has plenty of convenience symlinks like that... e.g. if
> I wanted to find all devices on the coreboot bus, without symlinks I'd
> have to iterate through everything in /sys/devices/ and compare each
> `subsystem` attribute to check if it matches that bus. But for
> convenience sysfs automatically creates symlinks in
> /sys/bus/coreboot/devices/. Not sure how this case is so different?

See above.  You are a device, use the bus symlinks properly for your bus
and all is fine.  Don't try to link to /sys/firmware/ just because your
userspace programmers don't like to use a loop :)

> If you really don't like the links, do you have an alternative
> suggestion how we could allow our tools to find a single ID quickly
> without having to iterate through all entries every time? (I guess
> using the device name works but it's a bit cumbersome because then the
> bus driver has to dig in deep and inspect device-type-specific details
> on registration that would normally only be handled by the device
> driver.)

Again, just go over the list of devices in your bus and all is good.
How slow/complex is it really and why is your tiny bus/device special
from all the rest of the kernel to deserve special treatment here?  What
is so unique about it?

> > Also, I asked before, but some note about "exposing all of these bios values to userspace is not a security issue at all" would be nice, if only to point at in a few years and say "wow we were naive"...
> 
> To clarify this one some more, it's not so much that there can be no
> security implications at all from this, but more that these spaces
> have always been accessible through the /dev/mem interface already. So
> we're not opening any new holes, we're just providing a new Kconfig
> that allows exposing a subset of the attack surface that can already
> be exposed via /dev/mem in a more controlled way. Of course users
> should still understand the implications of each of these nodes before
> they're granting access permissions to it, that's why we're creating
> them with umask 0600.

/dev/mem is locked down on many systems for good reason.  You are now
allowing systems that previously did not let anyone access /dev/mem to
read these values even if they are root.  I hope you have updated your
selinux policies to handle this properly, and again, please document the
heck out of it so that we all know what this is really doing.

thanks,

greg k-h
