Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294B613BAD2
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743557; cv=none; b=YbvKXbLslfUuVnHq33ocLir9PlGlcqF0Li1y39T78uexYYDsvxrdHewacLFjmQ3pNtCmb1zBIbHLLAUYTcH5l5m9MNu3Z2svmV8rPKAqfnjMI8Ml4yRMZ2+TzzulSrs3GFmnfy6/mLVpL4JVJuUpw56tjiwJJ8SRhEgjyk58kug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743557; c=relaxed/simple;
	bh=rlVT+A7P0+M7DQSgYFKJUFHaX4Xww7TPrMUaIZ3nnas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neTcqXYnYBWHWDJGzw9RByMlLcEINbTgROl0d/YR5KFOmToi+LGTCLd4R3seeVC3Ke3Q1ksAUoRqHi3N1qQnXgSQDxo9iWnhXZMmAsWx7eZJ0T28Q/LWNR3slDKAOBLHFUtIWpAGbkjoljAn1IfMvxTUXTXy9+Zd6/aQvn4PlIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HN5qj4+X; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HN5qj4+X"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dee917abd5so137325ad.1
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743555; x=1712348355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xc1B/KzNb5fuAu79OocVzaBbGY8Smo5+Ca0wgrVA1PI=;
        b=HN5qj4+XS+VnTbwaagnKmOOm/ZgPO4xpOSYhZjyUz+7e0Z1WviMmm/IOw62UE6o43w
         hRpq1U5JRQJILeeawOR8XZwKCsXL3HhGbvcqKSd7W4KGkLLqZtfq8+viIxUF6Lyk9xJY
         YqtiCJ5xsF3YM0Hn5h4cXxphNbclNwGa7WrxjQteSIWTYP05IrJzI8oL9OYukpydixel
         3rIkXBkWmkdlg5Q2R3YmVJBLv4rpm6oPcwAiK2ZUw6RGqslJwjbatiG7vcsgKK+L8hjy
         IADH9nG4mbdpdCiXrQoN/qiMN6SGDlUZgq6LsWS/wtsH6yDCGDOkG+XyljskITKlTcbN
         Cd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743555; x=1712348355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xc1B/KzNb5fuAu79OocVzaBbGY8Smo5+Ca0wgrVA1PI=;
        b=ZeaeZ0wegiY5k2i8/Mjo5mBzJa7Y+vke3MoK1akvVO/15YLPkz1Jy8ETp1Y3J2/Mar
         ZGWRHBs1eAxxIeiZ41aqqkkwomd9+ntFUczHaKEd3hctdwMfGz0Pe3L3nYZ8AsjCDk2t
         8ncWFlFF3QvVlpgsX81P5pyxFM87fbYGya1Df1bWz9JAynFl9G9GwFaTWaibx55WMBFD
         yHxFnF02fzNI9KV2DSr2scImnBm+Bd83Jv/fun+nmeF24XhwQXKKVuiZGpEXu4MoJDad
         ExoUTNoRqzjFX/ofRbqPMp5dgLMIXoGipWwbLrgaP1YGE6KbeLIbkOwPNtiWx4YVy975
         T/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSj+HnVp3FXjLoGFGqMe/D819hY+lmeTmzK82mqNaYjYAUfQpyKZDpIfBJApf9K2+K/W7c20Oz7CzDt4xogvyoVBKV2av5wDf0HxEX6FL0
X-Gm-Message-State: AOJu0Yz3Ky1FdrU3lMx6zMnzWF5dN3oXmVdxBS7SKiWpzAcj96M/V3Pp
	iDFF3h6Vx5BwZUBpzFOUiP4mtf/KiDx5Vi1M6X0tdPfMS+iNtjrDzelZkomh/A==
X-Google-Smtp-Source: AGHT+IGPHfOm4VyHRdbt+OF49JdkIGYmbMfYA6a7eigDoydW913jtuONF1p9hINFOSPxQt7YYfJW2g==
X-Received: by 2002:a17:902:da89:b0:1e0:a8b8:abbd with SMTP id j9-20020a170902da8900b001e0a8b8abbdmr272383plx.28.1711743555062;
        Fri, 29 Mar 2024 13:19:15 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id sb8-20020a17090b50c800b002a1f5b8e787sm3726pjb.14.2024.03.29.13.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:19:14 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:19:10 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 13/18] platform/chrome: cros_ec_vbc: provide ID table for
 avoiding fallback match
Message-ID: <ZgciPjZH4JP1nD_R@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-14-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LnnzVqJRKlkZ2tEc"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-14-tzungbi@kernel.org>


--LnnzVqJRKlkZ2tEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:25PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_vbc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platform/chr=
ome/cros_ec_vbc.c
> index 274ea0c64b33..787a19db4911 100644
> --- a/drivers/platform/chrome/cros_ec_vbc.c
> +++ b/drivers/platform/chrome/cros_ec_vbc.c
> @@ -6,6 +6,7 @@
> =20
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -133,16 +134,22 @@ static void cros_ec_vbc_remove(struct platform_devi=
ce *pd)
>  			   &cros_ec_vbc_attr_group);
>  }
> =20
> +static const struct platform_device_id cros_ec_vbc_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_vbc_id);
> +
>  static struct platform_driver cros_ec_vbc_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D cros_ec_vbc_probe,
>  	.remove_new =3D cros_ec_vbc_remove,
> +	.id_table =3D cros_ec_vbc_id,
>  };
> =20
>  module_platform_driver(cros_ec_vbc_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Expose the vboot context nvram to userspace");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--LnnzVqJRKlkZ2tEc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgciPgAKCRBzbaomhzOw
wm9pAP971js6nk1ojT1TFykJTGPn9mT3ynf2ygoMhjcr/EzN+QD+MNHAfGc/6M3n
6a8WNJXTO+xfhNM17z3PnpAKZ8MXrQE=
=sfxZ
-----END PGP SIGNATURE-----

--LnnzVqJRKlkZ2tEc--
