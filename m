Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77377F6
	for <chrome-platform@lists.linux.dev>; Fri,  2 Dec 2022 00:30:09 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id mn15so2468098qvb.13
        for <chrome-platform@lists.linux.dev>; Thu, 01 Dec 2022 16:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XtB7qSqiIzlg8ss9ldhy5DqRNqK+3OXWrV3JxhE5L/Q=;
        b=NShPh6Ldo6cB9Y7/znInI3jzj6Ptq2/otJBs0262+9AWk8MYfYjMQfa2K6i2/34orr
         GmzzjpcDdTZBw+e1rAyA/G21UiefhbIN1Byy436S0o1TpcmSx5QNtNJyWwMADtjJfSnO
         aakdUkAsRdnbvcyg0/DM198QVoHyC4d1KEEUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtB7qSqiIzlg8ss9ldhy5DqRNqK+3OXWrV3JxhE5L/Q=;
        b=NKlsMySrUj0rFJ62ttWSBtoOQeV6kpTXTl1t5JnMEgZC/L6d1MlteJUeCEpBoD7l7s
         0ZD3I3uWyMs6WMMS6nnR8azQq0B3Mtenpg3hx9VoNaQXR+0NwoYHuAsXPurUlgY+WkWh
         E6n90adBX5Lye7McyHHLc3OwDh/aLACZdrxYDKVMebFAmLcK5ee15sk4UFHVnvbqsoZ8
         ka+ZTPVpsqFlLpsVKILtcWw8myBoDhcPAcoP9W7HeYyCPDqFMmnprYnCHO8juab0h3wO
         Hbh3Q6R9H4HtLVTMd4yJZ7f7ISJZ7mXwape2U0NOPtZCbGpssYjZMHVK+MVSG98EX8hS
         suIA==
X-Gm-Message-State: ANoB5plr94FcDKd2UYqEZrQX/SkOzown/ncmeif3js3WtRlkgxiZeoY5
	N5x4sWrrMeknNCaWEW+hu80655T3LIQFwfdaN3lENg==
X-Google-Smtp-Source: AA0mqf6pXA5paunfIyUQM4dR0nhu88sVVy/J9X/OwrIZwSH+1q9zgBsefaDBHJtmmDWMiwBxjk4He6NieG7Y4WhlN/Y=
X-Received: by 2002:ad4:4c03:0:b0:4bc:182e:78c2 with SMTP id
 bz3-20020ad44c03000000b004bc182e78c2mr44392547qvb.2.1669941008652; Thu, 01
 Dec 2022 16:30:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221130231936.1666390-1-wonchung@google.com> <CACeCKad16bs_f6bLthTAoEL28tPvf1S10WDeM7ugeaS9g7R25w@mail.gmail.com>
 <CANLzEksD=dKgPuCUD74b3YQKCApbZKO_t7Q=tyNKONvAOQ89hw@mail.gmail.com>
 <CACeCKad7RGVPGdrd9WNpRhn3n99R5TG9zFJpCrMj7CDLK18rMA@mail.gmail.com> <CAOvb9ygJ9afqLaeJRuCK+zFMH2vxjA4JGXAu2qZUvqqyUzhnmQ@mail.gmail.com>
In-Reply-To: <CAOvb9ygJ9afqLaeJRuCK+zFMH2vxjA4JGXAu2qZUvqqyUzhnmQ@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 1 Dec 2022 16:29:57 -0800
Message-ID: <CACeCKae3SGt9ihq-B2s6V2HiiHU+dSL6pRaxY15aaLoJUNQYmg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Create new USB driver for RGB keyboard
 in ChromeOS devices
To: Won Chung <wonchung@google.com>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 1, 2022 at 2:52 PM Won Chung <wonchung@google.com> wrote:
>
> On Thu, Dec 1, 2022 at 1:36 PM Prashant Malani <pmalani@chromium.org> wrote:
> > >
> > > We're seeing some behavior where a bound driver is needed in order for
> > > this USB device to properly enter suspend state. Just manipulating the
> > > power/control and other sysfs nodes for this usb device when there's
> > > no driver in the kernel doesn't seem to affect the device's ability to
> > > drop into a usb low power state.
> >
> > That seems like an issue with the device then, which should be debugged
> > from the device side and/or its interaction with the USB subsystem.
> >
>
> Hi Prashant,
>
> As Benson mentioned, I can check on my test Vell device that changing
> power/control does not suspend the device.
> Should it be controllable even without a driver bound?

Um, it should be(?); usb_enable_autosuspend() [1] and `echo auto >
power/control` [2]
both seem to call the same runtime PM function. I've not looked into
runtime PM code
deeper than that, but it may be worthwhile to examine what's causing the suspend
to get blocked.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/driver.c#L1637
[2] https://elixir.bootlin.com/linux/latest/source/drivers/base/power/sysfs.c#L113
