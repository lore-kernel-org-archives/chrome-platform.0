Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3982513BAD4
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 20:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743719; cv=none; b=pc0Ehq73yc6sUps2nAuDwlZFBT+65VS8ESDC2rRFoDZ3TmCIWu9l0wQ8sfzA1esohGTf7llfvYotSgkBbdmuU2EBWW5boxzkfhOAmBBtH27ae3Tl5HF2PG2ULYX9GGdvyc2HQcZAoTh5XXnzlyR5jSDzuUiUhK28Gjg/Rghy0H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743719; c=relaxed/simple;
	bh=UNaKjzakgC3/YqdJUQaCrQMV5+3RTvaedPtnhZgej14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpazxx7ZBraRPoeqZLlEoOMyWmDUXXn+OGxzk3o/Oa4GHj7zIh+9hrYEPadhlnr79DQ/I4soa0jcaRACc4EvuEYISg7afE2JE8WHJXloLqnL4n0hiXO/gM7DVdUrgOzG2i8qAv/zzb3ST0ZEXhfzhRxzeELlny+ImoVW2hUEMfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WnlfGhb4; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WnlfGhb4"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1deddb82b43so171575ad.0
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 13:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743717; x=1712348517; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SLn+lLgkDX5fY2sRI7cVb/miAMO8Hgz/20wFvN6AVl8=;
        b=WnlfGhb4I48OcBvlDC996PjPBSKfFKE2YMOxr7wfHa5v2z+Se6EI8t2USQZcaO1xqV
         Gsel/wbsw9D6Um325NLnrHABMPHfsppPkMAm7hOiVTHBnji9sVmnJSuwmMeM0GA5KD09
         zGNQ/8frLVGU/lGQEwCwcSdZJ3JkO1sxU99kQOX+vD6J9Sf1YF6Z3F61c1/+kt2FtigQ
         uRxKvTY5jVOb/FGB0u4kkJ2SJ82ZNeURV9xKfTmO/LchpAnsqNOty1uR5Fdw28P6o98W
         D8PfW56Amh2QioiOjjafPuSPVHobsyewNRF3YQqlYG9J6buJtJ7TlZPeUBXFO0liH+NF
         pBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743717; x=1712348517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLn+lLgkDX5fY2sRI7cVb/miAMO8Hgz/20wFvN6AVl8=;
        b=Gqdj5NyH3MSncFt60PO5jEea5JIDAl/sfoodaj5cdRZpdemjD/9JKv+k2yQTP77oqy
         oSD3ibdFpqzXblWJIjifYFp9q5fq4lep9IR+DtbJpr71ZREXs8psnPlIznNIBQdpKUXh
         ji5hDlFABKjeW6HCvGmTUO4t4Xm4tm1OASZF6aIV6n5D732yay1+rgy+HVskqXR2rAoU
         Zej5Bi6g8kC5UkX8PdwEaR9TH7nzfbdUFvSzdAFeuEgM5QPzYO2G0dze+Z0CSAfUk6vX
         7RmpXl9UawqHur7NpPiTX3q2Q1eoaNcsTUp9j6jZoYmZOcmuyTiGYKyjw74F4r7I9Ckj
         Hejg==
X-Forwarded-Encrypted: i=1; AJvYcCU8BDK46iSnS4vFqMD7Kkm21bNS3arwNXptys0Et9Wgpqpyjvhqr278eJiquAuxe9V6903L3JaKmNAru+5T2qv+rGnxJ1KNfqOkjuov5gq6
X-Gm-Message-State: AOJu0YwTxxVtmHj53Fog21pw/uMcVeu/0N2SIY7Kqf4oUFKMI2+F16FJ
	xsegvqypVX9S00fT1aE/QJ/drSCsSOX2UUOwGMJEINndo8/OLQIEghdJme/jtw==
X-Google-Smtp-Source: AGHT+IEMJwj2jd4/l859KGpWpENBcoKXmdmgnTzTcBXMh2Vl4SpUYa4OQU9H7SXbsGL7YqZVJFFicA==
X-Received: by 2002:a17:902:cec6:b0:1e0:f525:a831 with SMTP id d6-20020a170902cec600b001e0f525a831mr275700plg.28.1711743717066;
        Fri, 29 Mar 2024 13:21:57 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id bw28-20020a056a02049c00b005dcaa45d87esm2911148pgb.42.2024.03.29.13.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:21:56 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:21:52 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 16/18] platform/chrome: wilco_ec: debugfs: provide ID
 table for avoiding fallback match
Message-ID: <Zgci4OqaNBLBl2yF@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-17-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lXtHlkwSH46+O9d2"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-17-tzungbi@kernel.org>


--lXtHlkwSH46+O9d2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:28PM +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>=20
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/wilco_ec/debugfs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/debugfs.c b/drivers/platfor=
m/chrome/wilco_ec/debugfs.c
> index 93c11f81ca45..983f2fa44ba5 100644
> --- a/drivers/platform/chrome/wilco_ec/debugfs.c
> +++ b/drivers/platform/chrome/wilco_ec/debugfs.c
> @@ -10,6 +10,7 @@
>  #include <linux/ctype.h>
>  #include <linux/debugfs.h>
>  #include <linux/fs.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/wilco-ec.h>
>  #include <linux/platform_device.h>
> @@ -265,17 +266,23 @@ static void wilco_ec_debugfs_remove(struct platform=
_device *pdev)
>  	debugfs_remove_recursive(debug_info->dir);
>  }
> =20
> +static const struct platform_device_id wilco_ec_debugfs_id[] =3D {
> +	{ DRV_NAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, wilco_ec_debugfs_id);
> +
>  static struct platform_driver wilco_ec_debugfs_driver =3D {
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  	},
>  	.probe =3D wilco_ec_debugfs_probe,
>  	.remove_new =3D wilco_ec_debugfs_remove,
> +	.id_table =3D wilco_ec_debugfs_id,
>  };
> =20
>  module_platform_driver(wilco_ec_debugfs_driver);
> =20
> -MODULE_ALIAS("platform:" DRV_NAME);
>  MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Wilco EC debugfs driver");
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20

--lXtHlkwSH46+O9d2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgci4AAKCRBzbaomhzOw
wia/AP41p7WV0zGE8a4VlHRNVebcAVah1YwJhtCsuzSE1aniUwEA0q9rvwuwO+b9
QHhNI8FMZWtiwak8zvmc3GzQq3ODqgk=
=NyE4
-----END PGP SIGNATURE-----

--lXtHlkwSH46+O9d2--
