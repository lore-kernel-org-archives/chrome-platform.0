Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5EC10782
	for <chrome-platform@lists.linux.dev>; Thu,  1 Dec 2022 21:36:45 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id l2so2685227qtq.11
        for <chrome-platform@lists.linux.dev>; Thu, 01 Dec 2022 13:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=quISd2pvnqmw/9o3WvzMsMR0W9P1ncFjwjxtR6uCSwc=;
        b=Tsuz+a1y7dxwXx0w+7ppxovTf/QgqSilAje86IwDPKGmK9k6yZmBA8duaBYj7V8F4P
         QvzKrzA32dGkk3LlNOPgpK3qsFFMCZh5+iMix2N0HwM5YJqIYxwoRhioDi1dr3fXIGvn
         8sYlJ4PQLj/QsdfFN74H8i2QKJJOnvg8d3iG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=quISd2pvnqmw/9o3WvzMsMR0W9P1ncFjwjxtR6uCSwc=;
        b=Ss0XZgPyXnEnXygzBxojncs2D4P4EzqYUbrI59u2KnMZnjGvakWZauFfObUNjBqzoG
         DT0KQTsAqaY3OmZ4S//i1LVmEd7yLHC4yejeCknDxEoiGuh9aefiijMOtIfplBWvZoi2
         mzeON9jc1iz9+vmuSp1gVRz27hISL1YrO3MVQPMYjmUp5WSgHhzgnsuo19O0oRToaq4e
         aU/49j9I6QHrFbt27ukxsaxehMJe2VMvuJVwQk0W0ZyPleK/0iXO2NoMOUvh2A0s/wyG
         s+E6AunF1sWGRnBDdPkTS4Ruv+ZmCudIkYXLyOSN2pQw2Tl57vsg3QBOoik3t/TFXVaC
         6QNA==
X-Gm-Message-State: ANoB5pl5FY9QHUmya/3JbmKc9JP+LbWtPzUjLo3MHww9955fJRdEJovM
	JiEvAC8XHou5zU/HG63J/SgTHKPZQSi2DCCvinLy8w==
X-Google-Smtp-Source: AA0mqf5han2nODM1TVLqeIK1N63h/oWnWVnwyyUnaPkAUSrRFLX2YZBCX6cW18RsykD2s9X5bkAaSL3JHHPueJy019w=
X-Received: by 2002:a37:f509:0:b0:6fb:ff0f:e7e0 with SMTP id
 l9-20020a37f509000000b006fbff0fe7e0mr17496799qkk.747.1669930604365; Thu, 01
 Dec 2022 13:36:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221130231936.1666390-1-wonchung@google.com> <CACeCKad16bs_f6bLthTAoEL28tPvf1S10WDeM7ugeaS9g7R25w@mail.gmail.com>
 <CANLzEksD=dKgPuCUD74b3YQKCApbZKO_t7Q=tyNKONvAOQ89hw@mail.gmail.com>
In-Reply-To: <CANLzEksD=dKgPuCUD74b3YQKCApbZKO_t7Q=tyNKONvAOQ89hw@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 1 Dec 2022 13:36:33 -0800
Message-ID: <CACeCKad7RGVPGdrd9WNpRhn3n99R5TG9zFJpCrMj7CDLK18rMA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Create new USB driver for RGB keyboard
 in ChromeOS devices
To: Benson Leung <bleung@chromium.org>
Cc: Won Chung <wonchung@google.com>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hey Benson,

On Thu, Dec 1, 2022 at 1:00 PM Benson Leung <bleung@chromium.org> wrote:
>
> Hi Prashant,
>
>
> On Thu, Dec 1, 2022 at 12:10 PM Prashant Malani <pmalani@chromium.org> wrote:
> >
> > Hi Won,
> >
> > On Wed, Nov 30, 2022 at 3:19 PM Won Chung <wonchung@google.com> wrote:
> > >
> > > Without any driver bound to RGB keyboard, it may not be suspended
> > > properly, preventing USB xHCI to be suspended and causing power drain.
> > > Create new USB driver for RGB keyboard so that it can be suspended
> > > properly.
> >
> > This seems like overkill. Can't you set this from USB's sysfs nodes
> > like power/control [1] ?
> >
> > [1] https://www.kernel.org/doc/html/latest/driver-api/usb/power-management.html#the-user-interface-for-dynamic-pm
> >
> >
> > Best regards,
> >
> > -Prashant
>
> We're seeing some behavior where a bound driver is needed in order for
> this USB device to properly enter suspend state. Just manipulating the
> power/control and other sysfs nodes for this usb device when there's
> no driver in the kernel doesn't seem to affect the device's ability to
> drop into a usb low power state.

That seems like an issue with the device then, which should be debugged
from the device side and/or its interaction with the USB subsystem.

>
> Also, I synced with Won about this offline, but the primary concern is
> not this prism usb device runtime suspending, it's actually it's
> ability to enter suspend state during system suspend. Right now, this
> internal usb device is keeping the whole system from entering lower
> S0iX states because it's not sleeping. This driver patch doesn't
> address that yet, but I'd like Won to dig down and see if he can get
> it suspending at suspend time too.

Auto-suspend / dynamic PM should take care of that FWIU (but I may be mistaken).
