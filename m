Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8A78F76
	for <chrome-platform@lists.linux.dev>; Tue,  4 Oct 2022 00:56:47 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id u10so18911204wrq.2
        for <chrome-platform@lists.linux.dev>; Mon, 03 Oct 2022 17:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8tjQGCNWhmrOu3vq58tYQOF/c8aYravyKnkN1oYb0Eg=;
        b=jp98/LOIpfLGwPMBOX1R9g+Ef7YlESeewoVmqk3ui8bstcimWWb2L1W/QzUSIOhYOK
         /TW0rbjwJ0JXImVslnXW8qD3LpO/ojsNgkyJ59iHx/HOPelu7WL3twZg5YhRP1aH3Ai+
         17X7kL96dURneTsElhpnKwJscpUKgb03MFx5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8tjQGCNWhmrOu3vq58tYQOF/c8aYravyKnkN1oYb0Eg=;
        b=0aV/wUr+O+ln+aLnflUPjC4BAGWmnFEPwZGVAaB+tkSgSZ/zzZmazLVnUclsDb/+At
         Ufnd3cZKNN8JTr3qV5jLGOHYpFhLRFgkXGYyjfe85VGyU2IPitdqnkoRCBrmMMqmoZB2
         1lfzwYsqcz2UVqgFGFubll6yk0n6p7VUJyup3dad2JZHc+Z5ZtQAT3icu78kPAakua1V
         NxLF+FcnKtawuE7kmpv86TkdmCxucfG8nhO3jNyG9JFE+nHdMMqYrkIqShxcFhYqoYXS
         AD/KjLCS8IY7Gzv+aLHR8UXmYMxG3KooBp6mC8CTpT7ArPh1leylXV3fEu/SWbdRFGfK
         tH8A==
X-Gm-Message-State: ACrzQf3Li+MS/4GoU0/wX85cYBg9iV1NQAEhkZ1TKwnPlIo3EuOwxiz1
	6sNjjV9ysQ/m9fdq56iPSLeeZ5ubB74kLyp54JQHUw==
X-Google-Smtp-Source: AMsMyM7PJYr/z2XJnQHpo9AQt4mqanONQWcZzrhwiTjHvr4RJxDln/z6pV4+mbKEVYTb+EVm5Ou5YjEp2Y2Eeg6jLbo=
X-Received: by 2002:a05:6000:1547:b0:22b:5c7:a241 with SMTP id
 7-20020a056000154700b0022b05c7a241mr14481584wry.207.1664845006108; Mon, 03
 Oct 2022 17:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929234432.3711480-1-jrosenth@chromium.org>
 <YzaNjlqc0GqmJt68@kroah.com> <YzdqUX/zPvtyCmNm@chromium.org> <YzftVZj+2RCcIDN7@kroah.com>
In-Reply-To: <YzftVZj+2RCcIDN7@kroah.com>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 3 Oct 2022 17:56:35 -0700
Message-ID: <CAODwPW_2bM9d3NzcFDeAYtJeBhWBt10AUOajpNEKmnBOD=Qe2w@mail.gmail.com>
Subject: Re: [PATCH v11] firmware: google: Implement cbmem in sysfs driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jack Rosenthal <jrosenth@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Stephen Boyd <swboyd@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> No, this is a device, make these device attributes, don't polute sysfs
> with random symlinks from a device into the firmware location, that's
> not ok.
>
> And again, your current code means that tools like udev and libraries
> will not see these attributes at all.  Stick with what every other
> device in the kernel does please, consistancy is good.
>
> > What exactly do we break here by adding symlinks?  udev won't look into
> > /sys/firmware, right?
>
> Exactly.  You want that to work.

I feel like there might be some misunderstanding here... we're not
adding these symlinks for udev. Of course, if someone wanted to match
one of these entries with udev, they would do that by matching the
device entry directly, and there is an `id` device attribute for that.
We're not breaking that use case, and for those tools we totally agree
that the normal device node matching by attribute makes most sense.

But we have a different use case where userspace tools that need to
access one specific ID are frequently called on-demand (e.g. from the
command line or by another process), not only once on device
registration like udev. For that kind of use case, always searching
through every single node to find the right ID is cumbersome and
time-wasting. We're just trying to create a convenience symlink to
make that use case easier and faster. The sysfs device framework
itself already has plenty of convenience symlinks like that... e.g. if
I wanted to find all devices on the coreboot bus, without symlinks I'd
have to iterate through everything in /sys/devices/ and compare each
`subsystem` attribute to check if it matches that bus. But for
convenience sysfs automatically creates symlinks in
/sys/bus/coreboot/devices/. Not sure how this case is so different?

If you really don't like the links, do you have an alternative
suggestion how we could allow our tools to find a single ID quickly
without having to iterate through all entries every time? (I guess
using the device name works but it's a bit cumbersome because then the
bus driver has to dig in deep and inspect device-type-specific details
on registration that would normally only be handled by the device
driver.)

> Also, I asked before, but some note about "exposing all of these bios values to userspace is not a security issue at all" would be nice, if only to point at in a few years and say "wow we were naive"...

To clarify this one some more, it's not so much that there can be no
security implications at all from this, but more that these spaces
have always been accessible through the /dev/mem interface already. So
we're not opening any new holes, we're just providing a new Kconfig
that allows exposing a subset of the attack surface that can already
be exposed via /dev/mem in a more controlled way. Of course users
should still understand the implications of each of these nodes before
they're granting access permissions to it, that's why we're creating
them with umask 0600.
