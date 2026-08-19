Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AB73E3D8B
	for <chrome-platform@lists.linux.dev>; Wed, 19 Aug 2026 07:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125310; cv=pass; b=aTZs2s0ZcNLPCq/1fLd6QE49zNL+hSgTm6DGEC9oy1DOki9h27t3FsMFkqiHjnwOJTi2agNjm9iIB4QCHPkSnp7rrlGtr56YT0mOnTjV9JsMT3NPpMy3ziWbjl3uku5mBOMO/ryDVcoa80HIWbXyUDLeKyyhDhvPFrpp1/3GKyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125310; c=relaxed/simple;
	bh=i8g1kh5bGRn9T0dWTjOgak9HjdcyEv47iojLtZJK1TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssPnQviu1faBXeqmdEvE2RaK9lAVJrF+3tki0B+cA1GSZm3CcB3Bk57iENuvkJyubEffa2BPeABzprAkKSXXIPnV7thFBhTd722qkmb9FQHKE9XD/UgHx0DlomHhpb0p9lowVZIhYRE+7Hnf4ijKmK1IixO2HPgWf+Tn6GmUPOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdGkfYj0; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdGkfYj0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c20ce3c118aso129582266b.0
        for <chrome-platform@lists.linux.dev>; Wed, 19 Aug 2026 00:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787125305; cv=none;
        d=google.com; s=arc-20260327;
        b=atZt5s2PsiW3+eWnEFd/CJ+sDa5ByFSXKBYQO/g5Ona5lK/jSseyBb/b3C/rp2JNwx
         Z0/p32U5XlgubrWabb92fnmh2JV14NIr4GEiQhiFHu9FvaCSbOVoh/frSnLsf7O802kS
         VXoybH3lpi80EluKqzmUbTl14z0PxRIB8/r3t81y25y6WduMyBH8EkoeYteX0ucXv405
         A9WvuTP7A8AzQ2I36MdTeXhsfid/q5hwuLRqmRoDb92jlbATYLczUcHBNqNLJDO3M9PF
         h8bVxUSyvNOjjwTIZDoHAfoil9drqWrmFICHRHszdkUPHyF82pm1r0FnwZdM1vHMBRNH
         csZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2XM8VjGIfz5XNFSi41BuHFpvUKE6C2ApVU9tTkW8ke8=;
        fh=aAbF7bQRiuY5FkSZGTRHThgg9u9/B/4SDDUJmJI6X1I=;
        b=ffuUrV0OmEAfy6FUIQom7AUz9PteqNoW6LzVsBBRuNATVQiaqMvWlaqiUs6jQi7Vgx
         /FtXnN0O84RTPwq0v2il9Tb1TsJ9SuFx2g6SNavDRO6E7swrl6IW3xpzQq8IF8HIRrGh
         92v3Z/nDp9fFhMM3+9fWHaA5PkBmV7tCsvXjXqq80GHXJKADIT9XYA9qwpQ0VnIsmERl
         1hnCtRBxj52JFV3qv1sTPcxUbL5nLiKQJXF1mdm2Zj+UZB/SdLbLsWASxPccbs4K2Dmv
         7QcV1D/129qLZTymaUQY+vy0QTVTaMuGOQQgPQUgXIs6BdHMTkQBjcyBqAmrLDbMcX8F
         QzoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125305; x=1787730105; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2XM8VjGIfz5XNFSi41BuHFpvUKE6C2ApVU9tTkW8ke8=;
        b=QdGkfYj0gfLRVQUd+7apD7jfqw56AeeCRSsGviaodN5thyZBf/pMwdpxNUO3Qbtmus
         ZsjYI+nFFcuaq3qIbiTTTHtJ5rUp+BcnM4flPwieYL8Ve2SfiEWJ2SftQuOIiIJjqduy
         8tXq9aQ1DTq8YHeJmAfJtUvvmCZU67VXbPHo0oMPxZIgkujlrGljX4waWUfwO3KY6HnD
         kqRq/mp/Hi8sz0kjK4CQU8PWAAHAHRD+L8JbeY1sJy4v3ewJlA1siFIzQZ6F2dqvRrlT
         lisGpzF30dpQ6oL3DOEdsOk6TIaFIjdfZqVGjdiVGXx4ss4kAEnba7pj2aZOpBJGb++e
         PnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125305; x=1787730105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2XM8VjGIfz5XNFSi41BuHFpvUKE6C2ApVU9tTkW8ke8=;
        b=NOWSaTMhQDiHEIKjCsERDSA1HbDxgnbuMxPyJ6pHnzcfXUspSXzBuHYMnD/EmDfZtF
         H4qlujedwTspHxD5oyCRBXsu9mTNngcrvZZTToP36EcXdc3ckh7XYPRuuahz11D4MAaA
         l3Vi+9kV28vK1FpCb4r97KuojZYc3ZsfE2A9PiEaxMbwicgDgEDj1TGeTwTQYJ86IdqI
         1bTInaG/4TUpgAYB8YseNirdLxM4CVRAfAX5ul2/Qx1Qk+K3oLP4s2MtSRs2vSjZsvSB
         38FE5hOHqpAEKNMRAeOYMlNYsEnnvVjgVxPLEc3FhE2SmXe1TdVqW/dWAwH4pCkbjQP9
         QlAw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6BIJyAGACWa94NdwHKULZZ56OeyLnVW5bMgKLZ8LrOn8Pp8qNML3YpoHR9O+VvKpNWxq4PAOJNZehuxbwL1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZy8wok+vi/w9VoN/cEJshWoZITDDOKk4Xm6S0eqdghPD/lxWx
	a1IKfFvf6Qzck7G6t1WbhdoN/fSDvAR+5Q3rS8DfJgjVN1ThxEIY3qI9zFdqh+FJhglpKt6LJ3d
	2RQv7pelyWvF7cRBjZOzhQeLUYdiYSkM=
X-Gm-Gg: AR+sD13ZABUvMHp4MekZfA2GWEUPSFCuth1VHuuZ1kvh4rYzK0EqqAn1WnW90YGmdXM
	7JQl2MHubOgjCEylpTkgk6G7GTnV1RevEVX47EykTUJUXHVNPaUJQawEAU2P0odrRKA4trfhZbX
	IY0tDMGXCewd39TH46bc0viwIJdUEiqsinLu2XzIHeIJRntsNMOcnOzzclNOpuP/R/aQs5hjS0a
	+mahzW/FOp/eRhm03eYXbD5+G47LhgNNyZKxr6bz2/ufm5gfdNkci6ZPD3s4LLvNwCZHMFLrPl0
	YQpdV0uJkLWOJoJHkDD5D0DaIh1lxV3+YuQrlgTIggQoKaso1l7Mz96Yuw==
X-Received: by 2002:a17:907:1ca1:b0:c21:7c98:d9ec with SMTP id
 a640c23a62f3a-c237e153a0cmr174800166b.5.1787125304729; Wed, 19 Aug 2026
 00:41:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
From: Ike Panhc <ikepanhc@gmail.com>
Date: Wed, 19 Aug 2026 15:41:33 +0800
X-Gm-Features: AcwNN1XvW54R3BtlIAEO0ZYWyRgIsnsmisrbLic33f3L9pxDYLLAY4SdpzDzLc8
Message-ID: <CADwxbCUVY7OP-BgBW-xd-AZCn_Msh8TPmiRX0__F2f-SHw2O-w@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] leds: Add support for hardware-initiated
 hardware control trigger transition
To: Rong Zhang <i@rong.moe>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 2, 2026 at 1:27=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> Some laptops can tune their keyboard backlight according to ambient
> light sensors (auto mode). This capability is essentially a hardware
> control trigger. Meanwhile, such laptops also offer a shrotcut for
> cycling through brightness levels and auto mode. For example, on
> ThinkBook, pressing Fn+Space ("shortcut") cycles keyboard backlight
> levels in the following sequence:
>
>   1 =3D> 2 =3D> 0 =3D> auto =3D> 1 ...
>
> Recent ThinkPad models should have similar sequence too.
>
> However, there are some issues preventing us from using a private
> hardware control trigger:
>
> 1. We want a mechanism to tell userspace which trigger is the hardware
>    control one, so that userspace can determine if auto mode is on/off,
>    as well as turing it on/off programmatically without obtaining the
>    trigger's name via other channels
> 2. Writing brightness has the side effect of disabling hardware control,
>    but the hardware control trigger remains active, resulting in the
>    software and hardware being out of sync. Most LED drivers that
>    supports hardware control also suffer from the same issue
> 3. Turing on/off auto mode via the shortcut cannot activate/deactivate
>    the corresponding hardware control trigger, making the software state
>    out of sync
> 4. Even with #3 solved, deactivating the hardware control trigger has
>    the side effect of emitting LED_OFF, breaking the shortcut cycle,
>    especially "auto =3D> 1"
>
> This series tries to demonstrate a path on solving these issues:
>
> - Introduce an attribute "trigger_may_offload", so that userspace can
>   determine:
>   - if the LED device supports hardware control (supported =3D> visible)
>   - which trigger is the hardware control trigger selected by the LED
>     device
>   - if the trigger is selected ("<foo_trigger>")
>   - if the trigger is offloaded ("[foo_trigger]")
>     - A callback offloaded() is added so that LED triggers can report
>       their hardware control state
> - Remove hardware control trigger when writing brightness
> - Add led_trigger_notify_hw_control_changed() interface, so that LED
>   drivers can notify the LED core about hardware-initiated hardware
>   control transitions. The LED core will then determine if the
>   transition is allowed and switching between "none" (i.e., no trigger)
>   and the device's private trigger accordingly
>   - This capability is restricted to the device's private trigger. If
>     the current trigger is neither the private trigger nor "none", no
>     transition will be made
>   - This interface is gated behind Kconfig LEDS_TRIGGERS_HW_CHANGED and
>     LED device flag LED_TRIG_HW_CHANGED
> - Tune the logic of trigger deactivation so that it won't emit LED_OFF
>   when the deactivation is triggered by hardware
>
> The last three patches are included in the series to demonstrate how
> these interfaces are supposed to be utilized, so that ideapad-laptop
> can expose the auto mode of ThinkBook's keyboard backlight. They can be
> submitted separately once the dust settles, if preferred.
>
> The last patch in the series depends on commit 5029bff09e79
> ("platform/x86: ideapad-laptop: Fix driver unregistration order") from
> platform-drivers-x86/for-next.
>
> [ Summary of other approaches ]
>
> < custom attribute >
>
> Pros:
> - simplicity, KISS
> - no need to touch the LED core
> - extensible as long as it has a sensor-neutral name
>   - a sensor-related name could potentially lead to a mess if a future
>     device implements auto mode based on multiple different sensors
>
> Cons:
> - must have zero influence on brightness_set[_blocking] callbacks
>   in order not to break triggers
>   - potential interference with triggers and the brightness attribute,
>     can't solve #2
> - weird semantic (an attribute other than "brightness" and "trigger"
>   changes the brightness)
>
> < private hardware control trigger (this series) >
>
> Pros:
> - mutually exclusive with other triggers and the brightness attribute
>   (hence less chaos)
> - semantic correctness
> - acts as an aggregate switch to turn on/off auto mode even a future
>   device implements auto mode based on multiple different sensors
>   - extensibility (through trigger attributes)
>
> Cons:
> - complexity
>
> [ Previous discussion threads ]
>
> https://lore.kernel.org/r/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fastma=
il.com
> https://lore.kernel.org/r/1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@=
rong.moe
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v4:
> - Drop the RFC prefix
> - Add a new patch in the series to address a concern from Sashiko
>   - [PATCH v4 08/12] leds: trigger: Do not attach trigger to a removing L=
ED
>   - Without it, following patches will expose a race condition
>   - https://sashiko.dev/#/patchset/20260719-leds-trigger-hw-changed-v3-0-=
5fb55722e36e@rong.moe
> - Address other concerns from Sashiko
>   - Reject insane hardware brightness
>   - Do not notify the LED trigger core when the registration of the
>     private trigger has failed
> - Enable LEDS_TRIGGERS_HW_CHANGED by default when
>   LEDS_BRIGHTNESS_HW_CHANGED is enabled
> - Add missing #include (Thanks Ilpo J=C3=A4rvinen)
> - Remove needless #include (ditto)
> - Remove needless code alignment (ditto)
> - Link to v3: https://patch.msgid.link/20260719-leds-trigger-hw-changed-v=
3-0-5fb55722e36e@rong.moe
>
> Changes in v3:
> - Integrate https://lore.kernel.org/all/20260712-leds-hw-control-brightne=
ss-set-v1-1-1de593b09d26@rong.moe/
>   into the series
>   - Adopt __led_trigger_is_hw_controlled() in the rest of the series
> - Rearrange the series so that the code using the offloaded() callback is
>   introduced before the driver implementation (thanks Thomas Wei=C3=9Fsch=
uh)
> - Reword documentations and commit messages (ditto)
> - Adopt guard() and lockdep (ditto)
> - Address concerns from Sashiko
>   - Fix a race condition in ideapad_kbd_bl_led_cdev_brightness_set()
>   - Fix trigger re-registration of ideapad_kbd_bl_auto_trigger
>   - https://sashiko.dev/#/patchset/20260618-leds-trigger-hw-changed-v2-0-=
c28c44053cf3%40rong.moe
> - Make registration failures of ideapad_kbd_bl_auto_trigger non-fatal
> - Link to v2: https://patch.msgid.link/20260618-leds-trigger-hw-changed-v=
2-0-c28c44053cf3@rong.moe
>
> Changes in v2:
> - Restrict the led_trigger_notify_hw_control_changed() interface to
>   private triggers only
>   - Drop PATCH v1 1/9 ("leds: Load trigger modules on-demand if used as
>     hw control trigger"), not relavant any more
> - Gate the led_trigger_notify_hw_control_changed() interface behind
>   Kconfig LEDS_TRIGGERS_HW_CHANGED and LED device flag
>   LED_TRIG_HW_CHANGED
> - Fix lock ordering inversion
> - ideapad-laptop:
>   - Only call led_trigger_notify_hw_control_changed() when needed
>   - Serialize keyboard backlight notifications
> - Reword commit messages and documentations
> - Link to v1: https://patch.msgid.link/20260227190617.271388-1-i@rong.moe
>
> ---
> Rong Zhang (12):
>       leds: Move led_trigger_is_hw_controlled() to the right place
>       leds: class: Remove hardware control trigger when writing brightnes=
s
>       leds: trigger: Add offloaded() callback and provide trigger_may_off=
load attribute
>       leds: cros_ec: Implement offloaded() trigger callback
>       leds: turris-omnia: Implement offloaded() trigger callback and decl=
are hw_control_trigger
>       leds: trigger: netdev: Implement offloaded() callback
>       leds: trigger: Enforce strict checks in led_trigger_is_hw_controlle=
d()
>       leds: trigger: Do not attach trigger to a removing LED
>       leds: trigger: Add led_trigger_notify_hw_control_changed() interfac=
e
>       platform/x86: ideapad-laptop: Decouple hardware & classdev brightne=
ss for keyboard backlight
>       platform/x86: ideapad-laptop: Serialize keyboard backlight notifica=
tions
>       platform/x86: ideapad-laptop: Fully support auto keyboard backlight
>
>  Documentation/ABI/testing/sysfs-class-led          |  25 ++
>  .../ABI/testing/sysfs-class-led-trigger-netdev     |   3 +
>  Documentation/leds/leds-class.rst                  |  72 ++++++
>  drivers/leds/led-class.c                           |  39 ++-
>  drivers/leds/led-triggers.c                        | 150 +++++++++++-
>  drivers/leds/leds-cros_ec.c                        |   6 +
>  drivers/leds/leds-turris-omnia.c                   |   7 +
>  drivers/leds/leds.h                                |   2 +
>  drivers/leds/trigger/Kconfig                       |  10 +
>  drivers/leds/trigger/ledtrig-netdev.c              |   8 +
>  drivers/platform/x86/lenovo/Kconfig                |   1 +
>  drivers/platform/x86/lenovo/ideapad-laptop.c       | 270 +++++++++++++++=
++----
>  include/linux/leds.h                               |  19 ++
>  13 files changed, 546 insertions(+), 66 deletions(-)
> ---
> base-commit: c7acedb2db001160b1ec41cdcc759dd664150666
> change-id: 20260506-leds-trigger-hw-changed-96a62188cbdf
>
> Thanks,
> Rong
>

Review and test on my ideapads. Though I don't have ambient light
sensor on my machines,
Everything looks good from my side.

Acked-by: Ike Panhc <ikepanhc@gmail.com>

Many thanks,
Ike
