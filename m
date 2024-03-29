Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B9113A3FF
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743796; cv=none; b=k1cFnsqQ5L+W13OEuqoJePsQ/auJVhi4ewVH3VIYrXiK0RpW/A7V15z8sTGnoIKttTTLjMdIgYqhEaqZVzq73AaxNhcIId/ctCOeJ9Z8oL5VhDjGwyiCvf29Y3v3TzFRBE/IZO8Nlw/0erFwYjMTfjl3WHgTPqt2JNkK/v+VpRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743796; c=relaxed/simple;
	bh=VkyUGxPzPrKZfFXaNY77PCh9MVkCj7rwoCyNYewVKIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3aYLQ8w3URei9GmwSn/h+eEb4hgPQB7UB3xB32Ad4Ga9cr9VgHO53yzW7MRRafw4yDGgDtt1mzRHED+zyf89390wzmEQNBSnVuGPr87aUBn5rJymPrOb1FFCgaRfctGW9w22UwJqjeuyjYoMdIhWIpUCx16kCaS26cn2WwnZAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pB8iMtTN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pB8iMtTN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e21ddc1911so206615ad.0
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743795; x=1712348595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RYuuDc1UrjHcFRqSoVGgtV+0yOfl9L+kGntncI1D1g0=;
        b=pB8iMtTNLFuF55cxLSRyQQ/HFh2aLmE3DyPhBoItFEIf1H9GSkYmKDDzSc2VSweH6G
         MnEtk8rYpRB2HW6uy6BAK7wXvImpBroSaRBn5qIAKzdjUCrruzgx6iX+Qywq8TVHPDbx
         0GzlfLWJEcOszTzrCuLaG8YdVpfiZQG5UmsbHJKbJqpBh27G0IZKbu+iG17o/KEg1vqi
         FUx97nSYM9UPvJTzWqkY7e00j/XSrUUQp5Ifr5QSSOKu5bU9Xq4uBD65w34sOVPK3v7O
         qadoHXchYZgHquRfLwURV0ARSdHboafOBkqANtIby5Yg5JZmZ8H3hLdxnBNijx2Zl56M
         SRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743795; x=1712348595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYuuDc1UrjHcFRqSoVGgtV+0yOfl9L+kGntncI1D1g0=;
        b=uzIVhrKQA6+rQOjGysBqVVlxiOLxg2fu3u7wqsELVMhTjEkXWUG/0VRs8nxTMrHuq4
         bMqnPo4WFmfEls2n5YxKlbpwUDnWFVGqvO3nld9u5lFSaeGSRQWD6bwXHO38io/9MKy8
         AFCH9LRtCqV5GMkhwJcUXtbcvs7my6nqU7AZpqtWJFRzFJmLu3ljfs215cNp2IzyiCN9
         3TadKHz/vD3uNf6hdKZhHEFASuNEECd5oI3WOHa7CJWT5VCHactK+jWEKIWFtLY1XsHu
         ctYPLWPV+celOvBVZs+5N4pdLux5o8d1cqeVGfartP09cgyxjsJX29VIRPy8Wyxyhj6q
         DL9A==
X-Forwarded-Encrypted: i=1; AJvYcCW+9G2/FVvy/xHSgXSD6PAUstFt8GZysdhtX1OJbGgy51075hdmfXehKB9fO9HTsH5pMrlefEiwy500mDsXRW5+hd2fMqb6oEUJv2Oz81+R
X-Gm-Message-State: AOJu0YyXvsuhSQ8nPvD1EkKo3/r+1rdHEaQzUSIg4HOT4DlJq2Qx/X1k
	tOy9gQiVPnvHqdle6kvoH3AxjfSVcT6juJ+ZHK5Xe00KBCgwTQHdY3cbY11RgQ==
X-Google-Smtp-Source: AGHT+IHvn0nqKtbTLUczx8b9ivGiOUqI3uBM94lI6ODQwFeaMdSnffR810G0Ri5UnlVGIBY3mSBZgw==
X-Received: by 2002:a17:902:f54f:b0:1e0:e2c2:47f3 with SMTP id h15-20020a170902f54f00b001e0e2c247f3mr217682plf.9.1711743794601;
        Fri, 29 Mar 2024 13:23:14 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902d50300b001dcb654d1a5sm3839491plg.21.2024.03.29.13.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:23:13 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:23:10 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 18/18] platform/chrome/wilco_ec: core: provide ID table
 for avoiding fallback match
Message-ID: <ZgcjLj9weWwqvtf3@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-19-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NN08j5j8NnmF0xd5"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-19-tzungbi@kernel.org>


--NN08j5j8NnmF0xd5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:30PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/wilco_ec/core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/c=
hrome/wilco_ec/core.c
> index 9b59a1bed286..3e6b6cd81a9b 100644
> --- a/drivers/platform/chrome/wilco_ec/core.c
> +++ b/drivers/platform/chrome/wilco_ec/core.c
> @@ -10,6 +10,7 @@
>  #include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/ioport.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/wilco-ec.h>
>  #include <linux/platform_device.h>
> @@ -150,6 +151,12 @@ static const struct acpi_device_id wilco_ec_acpi_dev=
ice_ids[] =3D {
>  };
>  MODULE_DEVICE_TABLE(acpi, wilco_ec_acpi_device_ids);
> =20
> +static const struct platform_device_id wilco_ec_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, wilco_ec_id);
> +
>  static struct platform_driver wilco_ec_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
> @@ -157,6 +164,7 @@ static struct platform_driver wilco_ec_driver =3D {
>  	},
>  	.probe =3D wilco_ec_probe,
>  	.remove_new =3D wilco_ec_remove,
> +	.id_table =3D wilco_ec_id,
>  };
> =20
>  module_platform_driver(wilco_ec_driver);
> @@ -165,4 +173,3 @@ MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
>  MODULE_AUTHOR("Duncan Laurie <dlaurie@chromium.org>");
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("ChromeOS Wilco Embedded Controller driver");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--NN08j5j8NnmF0xd5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcjLQAKCRBzbaomhzOw
wn4sAQD1CpsNqowknTOlUVIhoHGxpEueNDKHe4Vzw+5F/F27PAEAxS+PxEJRIFrz
NYo97I9Ikic/3Zo89drm0AL8dD7gtAo=
=cQau
-----END PGP SIGNATURE-----

--NN08j5j8NnmF0xd5--
