Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0F113A418
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743613; cv=none; b=EpCWnthhjFE5Od3wKpEEXGixNDto4q5zKZolppgiWWvQ8hwjD751LSlgMzIgwegRo6+ySrdJta/hre2QkTgWTStw/D8zH8O2nbSh1wCvxK3MLjWGR/7rPN00SvMzLCyzqvojR7rEFLj1G9LpJcb6Zp4tAI+KY6T1cwCBZjqybD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743613; c=relaxed/simple;
	bh=TMlSCVvARv+/QQk1peCI1QhFYmOokgWDjrBUu16e/Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5tyxQfD0Xa/FDu73G6Q90WciULionn2y6tIY4a1kpdc0UNCSMVQJmE8QAXcENQ9KUaKKfSGxpmb7HAc1KJ3qkoWE/usXF106zpgAHPwYT0eZKqVW9yRWEJdU6TS3gzFTvu0/xy8MrQn7a+DCEfOrHjJGQV/iPoC5ATaV8G4DiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YAPaVGFf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YAPaVGFf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dee917abd5so137495ad.1
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743609; x=1712348409; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dw2UKEsmEQ1dbfFsl/Q4xKQKdTjVuPNAKBUI0kl2qao=;
        b=YAPaVGFfERxB+fgLsQ0cYv92J9HhdyvGG/e0khqj5c1DiqWBYj05mr7rqfyH6jjT3l
         gZ2kMmapLnRle2/YQBsscBqNrI1bxx8gyTGYz3kzi8KrcTcwXp8+/XJbGhWDWDFC8QZI
         gY+5JC6KWeUb/19jh755i7WNkpJ586+wWkMmonKx/G6qxIYXF0C3xPvPOg1drLw8rjCa
         vaCG319GfqsY6OmoIB9+CjSvj6YyWi4AHcEyWQb4IBJ8cyB8Htm/k8y7HVYl0MIdCPRu
         lguaf6obxNTls4eWqiJpIZ5MoJf5RnBOk3p8zbLh8DIydJkhxkhbcL3AyccaRIL4rqC5
         BLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743609; x=1712348409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dw2UKEsmEQ1dbfFsl/Q4xKQKdTjVuPNAKBUI0kl2qao=;
        b=fTwPbLhH+H0Nckgde/qNcThFYY7DhHNYctkzgvdFUr2k7ZtmNBwYKYO4Xxi/SBtA1X
         kAFs7kukoB/ytss9P9vkiH7QCT3GXd/BSVnWHIu0ubWeJs+tPD/1dmrtB4NOZZm+MZdn
         5nvUQZtkgnzeo/cKL0FcwvkpS6PA8fgELMBG2TdU3Ii2KZWSG1NtWocDTawaaPsmqob0
         uaq/uVPD4oEcIuU65n5cYLwhEH7dOaKKBs/1HmRlUI6gdT5VkYwV4xYRp+ggcpp9qM/K
         GtCaXusSF5eh3MUv6u2UZZKjFEMRg/5qLesuy5zVzdBGTswGHPcLO7sC0MVSXZOYgz0/
         4w9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUv633UjGmcultf0/kpFXKCSH74GGeZ1lnBiToBFLcDWEUiRUCn4/Azd3wzsWVXnvdf7V/zmFOLDNc4uzqZmaSZlzH/eN8Kn0GMdcGADc05
X-Gm-Message-State: AOJu0YxPqrWux5b+TWWGJP80R+SzO0qETJAbrPisyah4GtQZlOPE8ZYk
	2fJlyzsAERTmvPLibTYP2GvzxSXMfekM0GiErGwQSDncX6/J8xBtv/sFSBEZDEaSvZhohLH07mI
	3Ig==
X-Google-Smtp-Source: AGHT+IEZytbvJa5yNZVS6rHrzZ0f3+OwdvhypA97X7iN+ES1iLWIZ7fwGbVEbMh3zlHPs2bYBDBciQ==
X-Received: by 2002:a17:902:ccd0:b0:1e2:4092:467c with SMTP id z16-20020a170902ccd000b001e24092467cmr72007ple.2.1711743608655;
        Fri, 29 Mar 2024 13:20:08 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id h11-20020a17090aa88b00b0029bacd0f271sm5499074pjq.31.2024.03.29.13.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:20:07 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:20:00 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 14/18] platform/chrome: cros_kbd_led_backlight: provide
 ID table for avoiding fallback match
Message-ID: <ZgcicEucsO_vcVqk@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-15-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EXWDu5FgItCHGBBn"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-15-tzungbi@kernel.org>


--EXWDu5FgItCHGBBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:26PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> Also shrink the name for fitting to [2].
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
> [2]: https://elixir.bootlin.com/linux/v6.8/source/include/linux/mod_devic=
etable.h#L608
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_kbd_led_backlight.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/p=
latform/chrome/cros_kbd_led_backlight.c
> index 793fd3f1015d..b83e4f328620 100644
> --- a/drivers/platform/chrome/cros_kbd_led_backlight.c
> +++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
> @@ -9,6 +9,7 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_data/cros_ec_commands.h>
> @@ -247,17 +248,23 @@ static const struct of_device_id keyboard_led_of_ma=
tch[] =3D {
>  MODULE_DEVICE_TABLE(of, keyboard_led_of_match);
>  #endif
> =20
> +static const struct platform_device_id keyboard_led_id[] =3D {
> +	{ "cros-keyboard-leds", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, keyboard_led_id);
> +
>  static struct platform_driver keyboard_led_driver =3D {
>  	.driver		=3D {
> -		.name	=3D "chromeos-keyboard-leds",
> +		.name	=3D "cros-keyboard-leds",
>  		.acpi_match_table =3D ACPI_PTR(keyboard_led_acpi_match),
>  		.of_match_table =3D of_match_ptr(keyboard_led_of_match),
>  	},
>  	.probe		=3D keyboard_led_probe,
> +	.id_table	=3D keyboard_led_id,
>  };
>  module_platform_driver(keyboard_led_driver);
> =20
>  MODULE_AUTHOR("Simon Que <sque@chromium.org>");
>  MODULE_DESCRIPTION("ChromeOS Keyboard backlight LED Driver");
>  MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:chromeos-keyboard-leds");
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--EXWDu5FgItCHGBBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcicAAKCRBzbaomhzOw
wq0OAP400FBKzZ1bg529Vae52rOmu0AJp1mCnVBHtVPTH8qVHwEA+RXCK2NfrrFX
QgDUxhT14YgEhhADRBiy0dbP4DnQAg8=
=Ey5M
-----END PGP SIGNATURE-----

--EXWDu5FgItCHGBBn--
