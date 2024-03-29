Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CEB21100
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743397; cv=none; b=elnKxOZ2PEkS08Xm7WUowbfypwQxGaQ/oNLBzwgv7AfM5jMqMTLlGyfmF2+AGdLVCkpWztFQHsB/reLohEb9XQw09VvchwauqXT2Gxu485EsDnY2g5mMBaq/MjKkYnh2SwgNz9n4X0oMHw3He3ZCxjEplKoONuVc97lk/xy68Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743397; c=relaxed/simple;
	bh=iurDl9jNzThi2nWfJN/vDf4QGMwJVgsII7gq9vDVmOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGgGs550tJ5PEEFyuh+EwmRwXXjE0e/QYaUrtWZnY1c233wqnLJsbbuGglRJa9i3gUfmh3q6yZu35SlmGZa40MGhc7WlzQ7pcUv7V2E0wmJVQTaJoS2EnkKJNmQUpLFViMWVfy1bOyRb2jc09c3YVa3OCn0eSkKEfkyypSTaxTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hZbyg2M9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hZbyg2M9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1deddb82b43so170935ad.0
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743394; x=1712348194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ug/Nx0Nw3Mb6s6W+35FMxXK5lFsNQqLVjSaEYeIaBk=;
        b=hZbyg2M98etnSSAtPKb/x4Ow+LsirRkO+LhduGEoHBtZdWjT5exK8sgHBPE+Xajzz7
         3GvxlbyLptu/oBgVLEQxCPnEhoQIqiMtQwaVyae2eAvt8F77+FyxVQy5+ATZ7YuXLBZ6
         gZC4dkwfe6AbHwutco5fPQujifsPJXL2YSM77IckmcuUi2VHD8m03oEYx3bEKSJeQz8q
         XJOA9aCwL73Sp+83IXHOIchK5tVGVO43H8RgcEMzQzdSKd6yygoVjoLDnawa8Melwqv4
         HjWQ/rAs6n/HTcgf6cKToTZXupFMcFXfi0UihP7G7JMCHt2ghlYHSOU6y6f6Rm7nBLba
         vq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743394; x=1712348194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ug/Nx0Nw3Mb6s6W+35FMxXK5lFsNQqLVjSaEYeIaBk=;
        b=bI1l1jTi7an1pdMSmAP1e0sTRiXNIMyjpEOLfAjMm6GYNsrEYRwQ8p9vL3Vmsk+kZM
         SkhbVPN5FOS4WRaBgzS2w1NTXtqyIRY+JrkQHY6wQNlqI/AF1ZriajwK0tE/Tvb4ziKZ
         5aKlzd04L/w6Utzuu0IWMx0dmJ/PvDfmLT90T4EfNZjQL5E+Iw8o7TegOZZBWUpsu1hZ
         BQFf0iHiUapPVZYn4B20F7YG+yk61o+XYN5OXRavbL4AQk0AVb5BmDZXlEH8in42lqxG
         /v8zh8xCKTWQPqVvacyMVEi6S/dA9jxuLwUH5X5H+vYJmzGDiGxGnA3aNykN+t97AeUa
         yfzw==
X-Forwarded-Encrypted: i=1; AJvYcCV2hYpeBtVFhJXsn2HlOeTFoZ87FMHPPn8y4IQuXUrULTXmZsNI4uuYkbcBv3elR/nZQRZ3c1eTfD3gbCfXKi+q03H7neKUxVBOsQZJ7XOw
X-Gm-Message-State: AOJu0YzsFgqNsizTgSKXp6XZ583I3JlJx/E3DbkorVwLQrmkrTA/42uF
	PC9TJHDitHNnIrEO5bz0rkPkIIugThLd7UTXJCHTxax4xE9WEa+4PgDMl1HnnQ==
X-Google-Smtp-Source: AGHT+IGaS23rXNTO3GSlC5fiIYhhJWJkLcIM7K1oz40WmiVvyxUfsN5SX67N9WEjb/a2JD4P5U+fPg==
X-Received: by 2002:a17:902:ec83:b0:1e0:a5ea:6860 with SMTP id x3-20020a170902ec8300b001e0a5ea6860mr268318plg.24.1711743393382;
        Fri, 29 Mar 2024 13:16:33 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id fk12-20020a056a003a8c00b006ea858e6e78sm3399982pfb.45.2024.03.29.13.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:16:32 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:16:28 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 11/18] power: supply: cros_pchg: provide ID table for
 avoiding fallback match
Message-ID: <ZgchnIUMSnbpIFit@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-12-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rNlrJ3uzdAY9E2PQ"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-12-tzungbi@kernel.org>


--rNlrJ3uzdAY9E2PQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:23PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/power/supply/cros_peripheral_charger.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/power/supply/cros_peripheral_charger.c b/drivers/pow=
er/supply/cros_peripheral_charger.c
> index a204f2355be4..d406f2a78449 100644
> --- a/drivers/power/supply/cros_peripheral_charger.c
> +++ b/drivers/power/supply/cros_peripheral_charger.c
> @@ -5,6 +5,7 @@
>   * Copyright 2020 Google LLC.
>   */
> =20
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/notifier.h>
>  #include <linux/platform_data/cros_ec_commands.h>
> @@ -367,16 +368,22 @@ static int __maybe_unused cros_pchg_resume(struct d=
evice *dev)
> =20
>  static SIMPLE_DEV_PM_OPS(cros_pchg_pm_ops, NULL, cros_pchg_resume);
> =20
> +static const struct platform_device_id cros_pchg_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_pchg_id);
> +
>  static struct platform_driver cros_pchg_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  		.pm =3D &cros_pchg_pm_ops,
>  	},
> -	.probe =3D cros_pchg_probe
> +	.probe =3D cros_pchg_probe,
> +	.id_table =3D cros_pchg_id,
>  };
> =20
>  module_platform_driver(cros_pchg_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("ChromeOS EC peripheral device charger");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20

--rNlrJ3uzdAY9E2PQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgchnAAKCRBzbaomhzOw
wvQUAQDFLWqdSf5h9aYvqQDJdspoU8KMSBpjENexGMOgS8BcJwEA6Q7aPmkms44D
Yxc+iiCcTh4l5osXYKOfRPdXas2PuwA=
=ovPB
-----END PGP SIGNATURE-----

--rNlrJ3uzdAY9E2PQ--
