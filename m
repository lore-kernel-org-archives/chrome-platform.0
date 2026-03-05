Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A965C377EB4
	for <chrome-platform@lists.linux.dev>; Thu,  5 Mar 2026 12:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712096; cv=pass; b=W6mK/BgiqdoHhgFoF0NWl8xewlncpfG1LhkCWPjXEdpInNOqZCTaQ/opxyqIDCFDoJDPxieFF9yYw7tCC6p5hZKSl6nEYtKcBHd63tycJQhl9o2Z7BW1x4V+w2WX8o7Cuk/43lafjzTwnlOx5NOKkBenxmo959cMmUNhojkkOuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712096; c=relaxed/simple;
	bh=fJckT8yqyDP9d7bZq/BlUrMTFgunpZGJI3qIhZjTRNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=foMoNUg9BAJYB9iSlxb82Vg/gXr34kWAtj41YVjs5mvD0XoCwAVD+rmF3FMFk9fsch7zpV5FzprmJWS++YicDu8g1AHLnWssXohdRrR/19A7joQ2htWBlrDsEBQSqZH/xzczKLoIJe52n1i2npoLYrsgYcMCbva5x0lmZpQRxvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1neF5nr; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1neF5nr"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a13323ba85so772435e87.3
        for <chrome-platform@lists.linux.dev>; Thu, 05 Mar 2026 04:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772712092; cv=none;
        d=google.com; s=arc-20240605;
        b=b1s7qicuEFJNvN79UIIuq9mWzVvSePM9XG9JUdC9feZnnOH3D1bfzmMazNAQWzlfXS
         BWU3byQlrriTPl4lhufa1CF5Re9oZkA8bwmCuVXCtyIymJhkDLjgbcoReEZlKkaT/59U
         XkCtwFr6O25JB/09CBx4fnH9reS7otMfbXMYE7k2in/9mWKmBvMRWyDnSXNFGelAlUZj
         km4IfFz8lf4nP+ms02MBejPyPSjQtGlDjjJCjtDPVk5FnVKagYG+7+V8+5c2DqD112fi
         DvPilz8CuS4tOMlsY/I4dUy5XUCrRgkzQ8/kFhhvRB1nxCB/yYi1B+BS90fvG1zXChhn
         5E/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/b0ZfvA+v+UK39LcW4WvCDnwwWSmpfxg8Iz5XcxVRNk=;
        fh=EB1fVdN+W6tuxtLmuIMYVZR4Ln+UF4qjUvA2Z/GCkgw=;
        b=eeddCpYgvpdTADvxuFVGnC+C+u0Ib5+f1f1wZ0rVHOv5QG8Ywh7ddIwNbq/B/hBxpN
         oWgtFg7yvAH3iRQyg34KJAKX0qXBIOIPRWAihbSnRE0lBbOyA/EE+jEVJmDk62PXUc/N
         voGO6rWWxi05YxNHmPPwwq5lw4EtuuS13X8HIZhUAg4+vJy7IGo9Pw5RAXzCjFh9Zx0s
         kGB9c3YshOt7a6vvwGYcCMMlXRt/1RFNp+nvDnr5oS+S5T6d0BIwZl3yd3xe6HkFEcOm
         7GewqnQqFlQpTQb2Red9D4z8t77uLBY2MFzwBChHYFeiZGHkb+TxsFIaWXhvU2WGPBz2
         PqCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772712092; x=1773316892; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b0ZfvA+v+UK39LcW4WvCDnwwWSmpfxg8Iz5XcxVRNk=;
        b=d1neF5nrbqU9Gx+LU2A2cSvgdZWw8gdbIi93gHuzwtm94GkbgYhx4LpY/fDavItwFj
         g7pIxIj2AomoxL6FgtEJ3M0glBnscE7j7C4fZ7Yl/B74CpI+eMg8EcEEtOhwXSTyAWo4
         8sGHeqnMGRQ0ca/p2n55FG4KuWExQwkesPTzrwffWiJXbs6I8oMopEPbVccvRxGBMeUz
         NmNiwkHZeBj6+OxLFffH9QgacxWoaHUcj9XgUXJknWhmsJfFrmReAFnwbU+D95osfDy/
         GJapQIkZz8M3Tx/QsN0z17mya7mEy1rHknPHLQrPiLvQ5Hm3KEAZtepWkrstcdvR9ZKp
         mfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772712092; x=1773316892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/b0ZfvA+v+UK39LcW4WvCDnwwWSmpfxg8Iz5XcxVRNk=;
        b=WCYI3ygmHY95ie/PRWG3/kOyYGzEB3RlNQXwvf5PHf86Dvw1tgW9AkVE5SoeIHtVyo
         Tm5H8h3spLrqwjYn2NyTsNVHMZ269KosRdIL2MRNkXIg43Oj//5T78GpS4/ciMh/gYJd
         Te/IGXMm02rnyFI3KWWKIeJIww3Mg7iEqEgpyvRKNPrKgfhNjEyvw3wRoGJYalE/Dr0m
         dCe+CmH5WD/nUOXhvlzcByJO53Q/koMRvqHTqPKbff8jp4Re18fPnHhrJSgUfiR/tbwx
         0pTT6GTC0geqJ6GLXEtgR2D8ILW31eG5AC5BYyKXoqzMv00soI0Xhr4+DCYNM3xM3KGO
         cG9g==
X-Forwarded-Encrypted: i=1; AJvYcCW7QsD2QvqXjFCyLBPQADula5XMx7VyOkFvPs431SGqTc/RBrPxtk6VFp6q35+gUNrbbbhUrCXUpDbTyqdddvI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1Jz0NgNsXVbUVXEHMxpcYB3ulZoQNtWOQfVwqtEO+Mtps2yGP
	PVkO2rd8yJ4PZXZhDVHuUGHfQOq7LYzY3inpD/epIW8igg5K8EOa89Au7encT9gxwRmV5WG51rF
	MGh/qmYa9Gx6t3EGoJo/i8zjszklkbJg=
X-Gm-Gg: ATEYQzxswaWUVXpbroMX4bpPW0wHmaYq8t6Tf257ZEGw50J3OQq0cchepFLrNK9jmOW
	x9cMJt6Wp2QXaxTWuqbfS4B9WtCtw2ak3DoJrLFKfAF17b47Sf7IHzkeyalk1MTgLHXNz8OOEiT
	fMtDhNlkEBU+v8jWnw2y2LnpIOAb+MKMtX3BfS2RpPOfbVUYw0baVy4uSNglTMqukroryIVwtkK
	M9hKizmSrKRHOo4y4f0+6kVo0H46wds7RUDyyjIZPuyVZr9D+ByEtAjrN5qZgouQ4/z9JZAsLC9
	asMD1R8xW9ab4hHeoXZgi9NQiv13iiVLIth/GPc6
X-Received: by 2002:a05:6512:2509:b0:5a1:3207:6946 with SMTP id
 2adb3069b0e04-5a132076a97mr844258e87.33.1772712091492; Thu, 05 Mar 2026
 04:01:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260227190617.271388-1-i@rong.moe> <b1d43b71-38c1-48cb-91ae-4598ecd2f588@app.fastmail.com>
In-Reply-To: <b1d43b71-38c1-48cb-91ae-4598ecd2f588@app.fastmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Thu, 5 Mar 2026 21:00:53 +0900
X-Gm-Features: AaiRm51uv1O5U6vCPlvzY0s-1QWOok1biN3kPBxxUIId3nnM0tVkHJ4v_2WE-9k
Message-ID: <CABxCQKtnqEsjsf1BtwJnf1M3+Y82NugL+u51ruXhQ8kHNGvAJA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] leds: Add support for hw initiated hw control
 trigger transition
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Rong Zhang <i@rong.moe>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	"Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rong and Mark,

On Thu, Mar 5, 2026 at 5:05=E2=80=AFAM Mark Pearson <mpearson-lenovo@squebb=
.ca> wrote:
>
> Hi Rong,
>
> On Fri, Feb 27, 2026, at 2:05 PM, Rong Zhang wrote:
> > Hi all,
> >
> > Some laptops can tune their keyboard backlight according to ambient
> > light sensors (auto mode). This capability is essentially a hw control
> > trigger. Meanwhile, such laptops also offer a shrotcut for cycling
> > through brightness levels and auto mode. For example, on ThinkBook,
> > pressing Fn+Space cycles keyboard backlight levels in the following
> > sequence:
> >
> >   1 =3D> 2 =3D> 0 =3D> auto =3D> 1 ...
> >
> > Recent ThinkPad models should have similar sequence too.
> >
> > However, there are some issues preventing us from using hw control
> > trigger:
> >
> > 1. We want a mechanism to tell userspace which trigger is the hw contro=
l
> >    trigger, so that userspace can determine if auto mode is on/off or
> >    turing it on/off programmatically without obtaining the hw control
> >    trigger's name via other channels
> > 2. Turing on/off auto mode via the shortcut cannot activate/deactivate
> >    the hw control trigger, making the software state out-of-sync
> > 3. Even with #1 resolved, deactivating the hw control trigger after
> >    receiving the event indicating "auto =3D> 1" has a side effect of
> >    emitting LED_OFF, breaking the shortcut cycle
> >
> > This RFC series tries to demonstrate a path on solving these issues:
> >
> > - Introduce an attribute called trigger_may_offload, so that userspace
> >    can determine:
> >    - if the LED device supports hw control (supported =3D> visible)
> >    - which trigger is the hw control trigger
> >    - if the hw control trigger is selected
> >    - if the hw control trigger is in hw control (i.e., offloaded)
> >      - A callback offloaded() is added so that LED triggers can report
> >        their hw control state
> > - Add led_trigger_notify_hw_control_changed() interface, so that LED
> >   drivers can notify the LED core about hardware initiated hw control
> >   state transitions. The LED core will then determine if the transition
> >   is allowed and turning on/off the hw control trigger accordingly
> > - Tune the logic of trigger deactivation so that it won't emit LED_OFF
> >   when the deactivation is triggered by hardware
> >
> > The last two patches are included into the RFC series to demonstrate ho=
w
> > to utilize these interfaces to add support for auto keyboard backlight
> > to ThinkBook. They will be submitted separately once the dust settles.
> >
> > Currently no Kconfig entry is provided to disable either interface. If
> > needed, I will add one later.
> >
> > [ Summary of other approaches ]
> >
> > < custom attribute >
> >
> > Pros:
> > - simplicity, KISS
> > - no need to touch the LED core
> > - extensible as long as it has a sensor-neutral name
> >   - a sensor-related name could potentially lead to a mess if a future
> >     device implements auto mode based on multiple different sensors
> >
> > Cons:
> > - must have zero influence on brightness_set[_blocking] callbacks
> >   in order not to break triggers
> >   - potential interference with triggers and the brightness attribute
> > - weird semantic (an attribute other than "brightness" and "trigger"
> >   changes the brightness)
> >
> > < hw control trigger (this series) >
> >
> > Pros:
> > - mutually exclusive with other triggers (hence less chaos)
> > - semantic correctness
> > - acts as an aggregate switch to turn on/off auto mode even a future
> >   device implements auto mode based on multiple different sensors
> >   - extensibility (through trigger attributes)
> >
> > Cons:
> > - complexity
> >
> > [ Previous discussion threads ]
> >
> > https://lore.kernel.org/r/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fast=
mail.com
> >
> > https://lore.kernel.org/r/1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.came=
l@rong.moe
> >
> > Thanks,
> > Rong
> >
> > Rong Zhang (9):
> >   leds: Load trigger modules on-demand if used as hw control trigger
> >   leds: Add callback offloaded() to query the state of hw control
> >     trigger
> >   leds: cros_ec: Implement offloaded() callback for trigger
> >   leds: turris-omnia: Implement offloaded() callback for trigger
> >   leds: trigger: netdev: Implement offloaded() callback
> >   leds: Add trigger_may_offload attribute
> >   leds: trigger: Add led_trigger_notify_hw_control_changed() interface
> >   platform/x86: ideapad-laptop: Decouple HW & cdev brightness for kbd
> >     backlight
> >   platform/x86: ideapad-laptop: Fully support auto kbd backlight
> >
> >  .../obsolete/sysfs-class-led-trigger-netdev   |  15 ++
> >  Documentation/ABI/testing/sysfs-class-led     |  22 ++
> >  .../testing/sysfs-class-led-trigger-netdev    |  13 --
> >  Documentation/leds/leds-class.rst             |  72 ++++++-
> >  drivers/leds/led-class.c                      |  23 +++
> >  drivers/leds/led-triggers.c                   | 176 +++++++++++++++-
> >  drivers/leds/leds-cros_ec.c                   |   6 +
> >  drivers/leds/leds-turris-omnia.c              |   7 +
> >  drivers/leds/leds.h                           |   3 +
> >  drivers/leds/trigger/ledtrig-netdev.c         |  10 +
> >  drivers/platform/x86/lenovo/Kconfig           |   1 +
> >  drivers/platform/x86/lenovo/ideapad-laptop.c  | 194 ++++++++++++++----
> >  include/linux/leds.h                          |   6 +
> >  13 files changed, 492 insertions(+), 56 deletions(-)
> >  create mode 100644 Documentation/ABI/obsolete/sysfs-class-led-trigger-=
netdev
> >
> >
> > base-commit: a75cb869a8ccc88b0bc7a44e1597d9c7995c56e5
> > --
> > 2.51.0
>
> Thanks for your work on this.
>
> For the series: As it's a RFC, I'm not bothering with notes on any typo's=
 or grammer stuff.
>
> Overall I think the implementation works and I understand it better from =
our initial discussions. Thank you for putting this together.
>
> I'm not a huge fan of the term offloaded - I would lean towards just call=
ing it hw_control (or similar). But I see it was used in the ledtrig-netdev=
 driver so I don't feel strongly about this.
>
> Vishnu - can you check out how this would work with the Thinkpad implemen=
tation that you've been working on, please? I think that will be helpful to=
 highlight any design issues.

I will use this patch and do the changes needed for the Thinkpad and
let you know soon.


>
> Mark



--=20

Regards,

      Vishnu Sankar
