Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8F813B5B6
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743318; cv=none; b=NeK1Yfl3U/Cog57mMey3U8v+B1y8dGXitgkXttFCfX3c1T2kGbrC9sYf67cINH3yPkqHdAAA+udSWoc3AQoS+xeYQxcSlh79ex3bkzJiyr5/GZ6jDexEkIi4UWcwl14/pc6LZhsSZnXGKmcCgj9ZD59hwSMS4VZ72um+tP1bxIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743318; c=relaxed/simple;
	bh=dXWldQQUfRjIiALMG2fpm7IzG1GZYymi2LOeiMlqhfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsJ96HPN2Tdjmhfg+/szTOPsb4ghTDNbQl5bMUN8cY3luHK0DI6IYBHqMDBz983UdWQvhIEk+oaoySEBkxh4voc8fA/DGkmMHtB5o52K0DsTNkMSPdBfkyThlVFBVewz3IXzgaTGDSoGcBNX/GSGKmMSxTnAkpNmvFQ6xILaS/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZBrJWvYf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZBrJWvYf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dee917abd5so136945ad.1
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743316; x=1712348116; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yN1pkTi7aGGxVn5vpEISrBEiKtfH60LTekrIRie/ugU=;
        b=ZBrJWvYfVVPMgZliSyvdIDDCfgYid/NqUrWvlv33/bDTvDDSeKTjp8IhHZVYADy0vo
         OdRKkMVZ5qzlMtlFzIwt/InRkYt1lMOe7UsM+ChM5/HqX9tyTOLw0P+o2EC9iMyfE3oz
         cU+IsNksVk8zTVmwEoM1IDHJ/wuBtldFHdIXI21Hx1k2jXcF+6FqZF25oLjc3YDrrH1E
         tgTJeV0d3XUb3AwEmNmD81l8dbzAUG/zlZKLhsbkIcDLRdvPm9lneEZZ5tDtgBo0HBQu
         TOhf6pZQrfJjeA7r7MGJ0cEr4VYawsPkTLVSBjEF1wUPIzCqI0/U5HCo9/xqOSXq0v0f
         Zcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743316; x=1712348116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yN1pkTi7aGGxVn5vpEISrBEiKtfH60LTekrIRie/ugU=;
        b=xNSV1zZ57Qk9D2sDxeUcJii0MWdAndN+hfXJW4odk9oi+t2SPne0/jSOfS42t22gXN
         o6Ht5wEhKv3hlvTftC4Va9sKoV6hM/jywOLF4crOAbbTVP4m9uxmI9lstfjFxpskAmsD
         U2G0qzMCGW4eEOK+30NkpexjzHqT9z3+jpqv5h1uwFab+GTBr59g8WiqqNnc81FyQ7zy
         oRiYi0ncJ17+ic33ISf83dNttjfIBf4rsvY+rZJz8xu9PenEgrL8UtUL2+G+6bsHGaOQ
         Zr4w2AgOMdh+UrZok7Rny3TH+xwaprWJxY9kWlzxYsW2m2fQeblg9KRT/+ubUqgWa/Nj
         HRnw==
X-Forwarded-Encrypted: i=1; AJvYcCX7B/Ft6Xm/vPqgbes4Y28Ac6fmQNfk1Zby59L9oIzbhnwRT7hX2QhM8J+lMHCpBvxHKTOgqI/NllUZJnGM/R7TaM/zUuPLQuudIP8LyNKG
X-Gm-Message-State: AOJu0YwuJzzh1NnllPKeBuB7+zCxU56mi9S2xR5m5CZvARvQGy1jAZHI
	u6fhyyHYQeRjUK4xRcFVsI9wKv91Va1XQ3XufAk6mcmrwnFFhnQYJp7oa1ue4g==
X-Google-Smtp-Source: AGHT+IELgYsPgtgZHiC/GgmdWaxQgiRaeVrDrmbZyhMqlUMmBsEI5Rbq2xP36HxYbxYmBe5WHyb+Dw==
X-Received: by 2002:a17:902:d50b:b0:1e0:c472:9c36 with SMTP id b11-20020a170902d50b00b001e0c4729c36mr215001plg.5.1711743316290;
        Fri, 29 Mar 2024 13:15:16 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id n12-20020aa78a4c000000b006e5359e621csm3373144pfa.182.2024.03.29.13.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:15:15 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:15:11 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 10/18] platform/chrome: cros_ec_sysfs: provide ID table
 for avoiding fallback match
Message-ID: <ZgchTzDnQ3lSMekc@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-11-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hUV5Tr+K+hDD5f4j"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-11-tzungbi@kernel.org>


--hUV5Tr+K+hDD5f4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:22PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_sysfs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/c=
hrome/cros_ec_sysfs.c
> index 93e67ab4af06..9c944146ee50 100644
> --- a/drivers/platform/chrome/cros_ec_sysfs.c
> +++ b/drivers/platform/chrome/cros_ec_sysfs.c
> @@ -8,6 +8,7 @@
>  #include <linux/device.h>
>  #include <linux/fs.h>
>  #include <linux/kobject.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -347,16 +348,22 @@ static void cros_ec_sysfs_remove(struct platform_de=
vice *pd)
>  	sysfs_remove_group(&ec_dev->class_dev.kobj, &cros_ec_attr_group);
>  }
> =20
> +static const struct platform_device_id cros_ec_sysfs_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_sysfs_id);
> +
>  static struct platform_driver cros_ec_sysfs_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D cros_ec_sysfs_probe,
>  	.remove_new =3D cros_ec_sysfs_remove,
> +	.id_table =3D cros_ec_sysfs_id,
>  };
> =20
>  module_platform_driver(cros_ec_sysfs_driver);
> =20
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Expose the ChromeOS EC through sysfs");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--hUV5Tr+K+hDD5f4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgchTwAKCRBzbaomhzOw
wvBqAQDen0/do0dgzoX5uwMVMdBEGV3WYcnAuC5mW+EvIGvD9gEA6Mkzg3IFKEY5
dNVkS3JCON7V/qjfWBgjb7L2I5P7oAY=
=500V
-----END PGP SIGNATURE-----

--hUV5Tr+K+hDD5f4j--
