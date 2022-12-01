Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1408610798
	for <chrome-platform@lists.linux.dev>; Thu,  1 Dec 2022 22:52:48 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id q12so3251511pfn.10
        for <chrome-platform@lists.linux.dev>; Thu, 01 Dec 2022 14:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u+GlEJaTRGydAzKEA1KTMHQ/xuICP4OQMpko1BA8XIg=;
        b=XPVXtTyHEysZOnnWvGQAaaVfsqyZR2ETSAYTP61Rdu8YxUZucOqj52A3xq1SGO+u0h
         ELLq+skCWfHle+15JIkPWxJErRpzj9WCSL1S4A6QewOFwiK+eN/WfiZFZ/5CUUHo5VQ4
         XRrFPAeV0J8wk9aCtu+ECfIFe7phYNlBFQz/JhuiUv8uRBe56t2AGDShjACnuDLqDxqy
         theaR0MNEA9WHGOVFbRmpRvrx0Hef33eevnPp4+LQCoMk1o653IQ37eIx1Q4mN/+lBuc
         r6jKawOWfgaQvW65kCH667JQ/pARSgdAg1c7lU9dGcxhGb5cs86w3X9p7vBJk8/+KsYi
         6Y5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+GlEJaTRGydAzKEA1KTMHQ/xuICP4OQMpko1BA8XIg=;
        b=1VnY0KH6yO9SBKtW0RAkw7/5QB6CNm/+I1e/Jx1ZIhcCvfl8uIOUqg6PV5seFvO9bm
         Es0i8CARROy7FuWr0OFx6mX/Uogyg4BQLrQT13TmcyhHyN+hxhnl8+T3buK6bDyQ7CJ1
         jTcXdGlqGlnRLwq5gAU9W6JcVDEyzauyDXDxD0Nlaoyzv1sNFyeRHpE99FmCYlkWcMK6
         fc0aOWgTbrncN7sXMGk8tCp8sfCwbNz7cWum3UwNJJin4kORmZsYHJejYGk/98QxFi+A
         fDVafa/u/1waz7TVuB0yeClimgN09wb7KuNDjCecE6n+Al9D3xORMZOE5QClqVBy7Ftb
         DX1g==
X-Gm-Message-State: ANoB5pmtIft3I2xOIMBQRoE20S7cKkvnNEK+VabqTffqUNj/emubKDDH
	q5FUKRTD4CTTP21u6xg8AsRE+CLHafdM0+wvPodr+A==
X-Google-Smtp-Source: AA0mqf4/Rdlo9twsxywVaqCZLl1ql+AO14cGIHtfU9aOaBMox3gTH/JTcrnCLroC46cSvuayrVe2q2uGMrykuuA0Rh4=
X-Received: by 2002:a63:4087:0:b0:477:15c8:ff67 with SMTP id
 n129-20020a634087000000b0047715c8ff67mr46291956pga.275.1669935168163; Thu, 01
 Dec 2022 14:52:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221130231936.1666390-1-wonchung@google.com> <CACeCKad16bs_f6bLthTAoEL28tPvf1S10WDeM7ugeaS9g7R25w@mail.gmail.com>
 <CANLzEksD=dKgPuCUD74b3YQKCApbZKO_t7Q=tyNKONvAOQ89hw@mail.gmail.com> <CACeCKad7RGVPGdrd9WNpRhn3n99R5TG9zFJpCrMj7CDLK18rMA@mail.gmail.com>
In-Reply-To: <CACeCKad7RGVPGdrd9WNpRhn3n99R5TG9zFJpCrMj7CDLK18rMA@mail.gmail.com>
From: Won Chung <wonchung@google.com>
Date: Thu, 1 Dec 2022 14:52:36 -0800
Message-ID: <CAOvb9ygJ9afqLaeJRuCK+zFMH2vxjA4JGXAu2qZUvqqyUzhnmQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Create new USB driver for RGB keyboard
 in ChromeOS devices
To: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 1, 2022 at 1:36 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Hey Benson,
>
> On Thu, Dec 1, 2022 at 1:00 PM Benson Leung <bleung@chromium.org> wrote:
> >
> > Hi Prashant,
> >
> >
> > On Thu, Dec 1, 2022 at 12:10 PM Prashant Malani <pmalani@chromium.org> wrote:
> > >
> > > Hi Won,
> > >
> > > On Wed, Nov 30, 2022 at 3:19 PM Won Chung <wonchung@google.com> wrote:
> > > >
> > > > Without any driver bound to RGB keyboard, it may not be suspended
> > > > properly, preventing USB xHCI to be suspended and causing power drain.
> > > > Create new USB driver for RGB keyboard so that it can be suspended
> > > > properly.
> > >
> > > This seems like overkill. Can't you set this from USB's sysfs nodes
> > > like power/control [1] ?
> > >
> > > [1] https://www.kernel.org/doc/html/latest/driver-api/usb/power-management.html#the-user-interface-for-dynamic-pm
> > >
> > >
> > > Best regards,
> > >
> > > -Prashant
> >
> > We're seeing some behavior where a bound driver is needed in order for
> > this USB device to properly enter suspend state. Just manipulating the
> > power/control and other sysfs nodes for this usb device when there's
> > no driver in the kernel doesn't seem to affect the device's ability to
> > drop into a usb low power state.
>
> That seems like an issue with the device then, which should be debugged
> from the device side and/or its interaction with the USB subsystem.
>

Hi Prashant,

As Benson mentioned, I can check on my test Vell device that changing
power/control does not suspend the device.
Should it be controllable even without a driver bound?

The RGB keyboard seems to be able to enter sleep with a suspend signal.
Fyi, here are the related bugs for more context: b/242087721 and b/249173368

Thank you,
Won

> >
> > Also, I synced with Won about this offline, but the primary concern is
> > not this prism usb device runtime suspending, it's actually it's
> > ability to enter suspend state during system suspend. Right now, this
> > internal usb device is keeping the whole system from entering lower
> > S0iX states because it's not sleeping. This driver patch doesn't
> > address that yet, but I'd like Won to dig down and see if he can get
> > it suspending at suspend time too.
>
> Auto-suspend / dynamic PM should take care of that FWIU (but I may be mistaken).
