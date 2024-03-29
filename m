Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A105013AA48
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711742776; cv=none; b=DoLmlLgCXMZmlMDAhNjkh5vejGM9Sa/FKdu6kIdPJaXy/nW+A3qXy/9DRxggcDXCwjuxLtyBXFSooC5HiDSvZ7eGgAogJCorXOiiO4mOMcRpIFbpkYAVFbixT3d6ulnGhpP/qjSoVE8KV1f6ABw00iCVacn+ls7XduTKEzgxG3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711742776; c=relaxed/simple;
	bh=JVZETo+D+/j7EHIklh7NmOhv6pq+zB/Xpv/SD0UOxqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llA6w1rbXF/KMbU4ym8rE67mOkxDdC8ZphSwHqL3tIMFZ5liTXh/353y1DcGQPxLY2bCeqMng2e2U899eIFkiJJefuizB++7m2bDzRIlzjmAlBX3ZETCJjQSbUm37Q8XU/yqrADTuZ162TDSjmsq++O+zn6E0u1II+5TGc99ChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A5eWWsoL; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A5eWWsoL"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1deddb82b43so169775ad.0
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711742774; x=1712347574; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ME6h+FGwPpoiLOPiIo4YgT09yOaLcy6hI+xIBJNUDPM=;
        b=A5eWWsoLi4SEVenNF4kJeBB7QcAomLd/QFlRlbrwroMhZrs3/D5+OTIIh2hSrKmiV4
         i++cIOpjTHfhRFCo+L2GZSl119lW37SJ/fLMWsZqD60IrCtJx07wPBzHsuZgRFZErBwA
         O/7LzKNoREz5HUYRFW5fNBfUhFgwMiUa4mw4SBxDcpEA+kxnR0gP6j3iWWQQCkDT2JgQ
         SkuNOzamGYZ/BjrbhuTeibQrOTr/jbTA6Z8jKtDfjKOPJHTCSzriQ1+2/ww5Xlc4764Y
         bciEI4u452CdMuVaqPm0bDeZrqHWBlYQepGtJ6BFmuJsAYhkpSJ+k5ltvfgj3+bR5oHt
         Rf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711742774; x=1712347574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME6h+FGwPpoiLOPiIo4YgT09yOaLcy6hI+xIBJNUDPM=;
        b=i1ZQoD+ASYHrSiU746TqG20END2lFtP6fAAGTKrHFR957PsOGb46w9JYlv5WZzYC+A
         P9FOHje5cyERR3iYWWZ/V8670821zm+PtjGira1Uka5DAGcb8WM+aQ1JzLHcgcWtQpvU
         yr/K7KAugt+fYP9Qq0KxPhEV9hMJu6YX44mburlaPvaeA/KVeamZV8vLJh7f5bjoE30Y
         rRX6Z82cPKOaawj/XQRyHJbsixeekUyJWHFgqKG2D+5fTClrp6uRWEaFOeuVHgNi7xzO
         wH0OM/8y3tROQ0cCaAKvuabcl14GFEQw9wTtdAF00lQHitzhvQFlOzvnTGxgNU27GYC+
         2xVw==
X-Forwarded-Encrypted: i=1; AJvYcCVxB4XHv+WAx/TPLHrLTrt62nEhie5aRZ1jrpfMOA3VK2/sfL8QPcTRy3QW19iGdtjkzkZavErPTff6Cp8rAeUoCKmiPyfaJLinBBox1E4E
X-Gm-Message-State: AOJu0Yzo0s+xTAk7w5/Llmq4u39GbpJesd7iC8ZZQPnoRuTR1rcSueuU
	RETXZwYM/V1oekfFCoLM1En+c/96TkyIbE78IQNL9KgKCEHRpJwnT9X80YgPsg==
X-Google-Smtp-Source: AGHT+IFadMcTqCENqH+IwvG7y9B7d3SQmXd4yfvo+gKLzrDANhZAHeI8x8Ishtr16ARjGSFR5NV6Kg==
X-Received: by 2002:a17:902:dad1:b0:1e0:bc5e:5ed7 with SMTP id q17-20020a170902dad100b001e0bc5e5ed7mr218138plx.21.1711742773197;
        Fri, 29 Mar 2024 13:06:13 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id g29-20020a63565d000000b005f05b06229dsm3279633pgm.41.2024.03.29.13.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:06:12 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:06:08 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 02/18] gpio: cros-ec: provide ID table for avoiding
 fallback match
Message-ID: <ZgcfMGaUdRAF3ual@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-3-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dZbc6vNr4SmSaBx6"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-3-tzungbi@kernel.org>


--dZbc6vNr4SmSaBx6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:14PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.  Also allow automatic module loading by adding
> MODULE_DEVICE_TABLE().
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/gpio/gpio-cros-ec.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-cros-ec.c b/drivers/gpio/gpio-cros-ec.c
> index 842e1c060414..0c09bb54dc0c 100644
> --- a/drivers/gpio/gpio-cros-ec.c
> +++ b/drivers/gpio/gpio-cros-ec.c
> @@ -12,6 +12,7 @@
>  #include <linux/errno.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -197,11 +198,18 @@ static int cros_ec_gpio_probe(struct platform_devic=
e *pdev)
>  	return devm_gpiochip_add_data(dev, gc, cros_ec);
>  }
> =20
> +static const struct platform_device_id cros_ec_gpio_id[] =3D {
> +	{ "cros-ec-gpio", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_gpio_id);
> +
>  static struct platform_driver cros_ec_gpio_driver =3D {
>  	.probe =3D cros_ec_gpio_probe,
>  	.driver =3D {
>  		.name =3D "cros-ec-gpio",
>  	},
> +	.id_table =3D cros_ec_gpio_id,
>  };
>  module_platform_driver(cros_ec_gpio_driver);
> =20
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20

--dZbc6vNr4SmSaBx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcfMAAKCRBzbaomhzOw
wrsVAQCbmcMHhqo3HMCc1DY+LRw0jrWTP50JPwOqZsPjGwy82QEAu8/TS+FucMH8
GTihTZMhngYGKB4GIJj5N6Y9bkNkogU=
=WVNx
-----END PGP SIGNATURE-----

--dZbc6vNr4SmSaBx6--
