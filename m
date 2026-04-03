Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD0521D3CC
	for <chrome-platform@lists.linux.dev>; Fri,  3 Apr 2026 22:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255552; cv=none; b=kGtHyr++GEa8013SN2JvPeTTD0SrkP06O5eJ/+qGRqffTrMh6VtRVHZdi3KBhtXjWwRhckxsdQ8Fv2OwGY6ysNG6FPkSnbyijJKyaCNE5yB/suooWnqs5/1vS73m4ifVz9rRIqnFmP+83mIeAIYex9TlnpmJR+MxO83p6H8kyyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255552; c=relaxed/simple;
	bh=PUY7Ao1dViFJq0V/09RACofNIjA6vO+kp5JHosW0HXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ytp+Hxb6XA4eOsvZxhXyMDAGSrCUM1NuSThBmUXmBDUQmNBBZ+Baz3KJzuhj5CnOwOcM2kj8XA4mgqmyzsuUlWplJlZKmZDIJxymRdiIuxTvHgJHf7rCcdlRn5B6Aj/oaOnHWS3UL3tAH1EELfQY5+1pOam7LEe+4tjoWJXP3qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nbTPig8b; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nbTPig8b"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c76b6f9a50eso783591a12.2
        for <chrome-platform@lists.linux.dev>; Fri, 03 Apr 2026 15:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775255551; x=1775860351; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oiOg/fcdJb/cFQuSKXLVClXxe1MxDJIioDXQZdJyu4g=;
        b=nbTPig8boy41IwddiVQDDNiavlvnTpq+5E/8mMykVApzutD0bhEyfIuf69cC617NDW
         NkV/1hBnORKTuRr0y4YjtQLJV1fmGnsRS6k5Wv37nGS/gQG8wrC9K6gdnluhD23xpz6e
         oudaoOZnAqntd2ndvyOvAonSNmJRMOzb9rEIVaNwy9w034MzCfvCniiVhLk9NWh6KuTY
         dbN/cBT5Z0bPHt56uByNV+WaT3pjqwmp8OZGJJMDw7TGCyPtLzixsSKV32n/tYbg3zHv
         Q8MSXBm845/K8lRyyrWCOW6VS92iV06acmI69S0Vn3ToDh7UnGTFc/PIsBlPXMqb9u3b
         sbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255551; x=1775860351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiOg/fcdJb/cFQuSKXLVClXxe1MxDJIioDXQZdJyu4g=;
        b=HNsGkTEo9YZ7asO/kz7Vqo9mXbFwx1vtGmqRdQrIhRJluyIe8YNwHoz2mRZBhtPAFE
         s4KPvVJ4gbbIZCFCc+cqZCZdkAeQAhyQck5wG2IMxboygon4VJCgUUb7XcgeYE0g3evt
         yVxYtQdWVKuXWS40hl4w2xAAFu2BY9TyAobAQnpP/AK1QOOC5CpHbH0WSDJOTm5wlxuj
         SeXqK5GVDQaXnJCjPmrCI1SqUexI/BkYj5DsKrTDAZsqma9Tgy6TCB6PhXOPBXsZ/IzR
         4+gi7Bb2cjoG3RsnosbktMg3qF/UX1KuxqW1+6ZFtY6Y3BhPburw+ljGFFjGIv40CUK0
         eIGg==
X-Forwarded-Encrypted: i=1; AJvYcCWbM49gCVIrQMUqSg0RFCv38q9pfmVaMOHfVdXzjK2S4LfIlUIuH/3yRHaf8oQ6mLR9KdF2IlBRGG8FSUyoslg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6guWgvLGA3316RLt/XIv+YOOl+9BoWQqHv4W2I6ov8lAPalp2
	cxkKGpoarSTDIBK/BVVBzkCvPeDQo/zujG0aGPMfYmnmP8DHGN8am/DR2O5GROyrqQ==
X-Gm-Gg: ATEYQzzdjbjxvYcCURhqVAxNHNiLk7iHEdZdS3DKnOn8GB9VvaGXrpPYqdlp1Wd/JLL
	s5uEuJ9kbX0m7hlGUp0hLD9r4hjrxLw7tcvHtBafj595tQp7HaFiidaEIFF7TJh8S+y4qs9oaZo
	GxIA6/vmraasHcSUsEyINtymPbzddHkuM9nLzo8rKjAWxVwuUj3f8JcfpdiaBAqyZz6HeRTpV3/
	GU38Bt3WrUyagVDdJkkWRo69+dllqlfjuCNG/+dCxVY7MGidLpoItWHFELprNxMD7tD5i71pD7L
	FBcbOa2lbsNqhlpTxMQX5mL6omALBcdwr81GQZPDiNOJSWmkPM+2+Fvph20jI1m0dbi1TcLxJju
	obPY3Q6h0S46MfWZvLQQX/eGx+/8TeZ8m2pyFNimv3OpYTtuKZeokZznnJDyTPu1ZT7n1BcL9os
	2l9K+8paDFqdCOUx8ixJVcpqYE08mDwo0ZjXR/ZXtU10tjCmkvazUx3mk4
X-Received: by 2002:a05:6a20:2454:b0:398:9c2b:c92c with SMTP id adf61e73a8af0-39f2ee0bf50mr3843312637.27.1775255550199;
        Fri, 03 Apr 2026 15:32:30 -0700 (PDT)
Received: from google.com (21.59.127.34.bc.googleusercontent.com. [34.127.59.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6491157sm5463823a12.9.2026.04.03.15.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:32:28 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:32:25 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: lee@kernel.org, bleung@chromium.org, tzungbi@kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	abhishekpandit@chromium.org, akuchynski@chromium.org,
	ukaszb@chromium.org
Subject: Re: [PATCH v1 1/1] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
Message-ID: <adA_-fsV_N1m5i_v@google.com>
References: <20260403222253.1888991-1-jthies@google.com>
 <20260403222253.1888991-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="crLSh1IVmUphWX56"
Content-Disposition: inline
In-Reply-To: <20260403222253.1888991-2-jthies@google.com>


--crLSh1IVmUphWX56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 10:22:53PM +0000, Jameson Thies wrote:
> On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
> defined in the OF device tree or an ACPI node. If it is defined by
> either OF or ACPI, it does not need to be added as a subdevice of
> cros_ec_dev mfd. cros_ec_ucsi will load from the OF or ACPI node.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/mfd/cros_ec_dev.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 39430dd44e30..70d64b7c6243 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2014 Google, Inc.
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/kconfig.h>
>  #include <linux/mfd/core.h>
> @@ -131,11 +132,6 @@ static const struct cros_feature_to_cells cros_subde=
vices[] =3D {
>  		.mfd_cells	=3D cros_ec_rtc_cells,
>  		.num_cells	=3D ARRAY_SIZE(cros_ec_rtc_cells),
>  	},
> -	{
> -		.id		=3D EC_FEATURE_UCSI_PPM,
> -		.mfd_cells	=3D cros_ec_ucsi_cells,
> -		.num_cells	=3D ARRAY_SIZE(cros_ec_ucsi_cells),
> -	},
>  	{
>  		.id		=3D EC_FEATURE_HANG_DETECT,
>  		.mfd_cells	=3D cros_ec_wdt_cells,
> @@ -264,6 +260,23 @@ static int ec_device_probe(struct platform_device *p=
dev)
>  		}
>  	}
> =20
> +	/*
> +	 * FW nodes can load cros_ec_ucsi, but early PDC devices did not define
> +	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
> +	 * the driver should be added as an mfd subdevice.
> +	 */
> +	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
> +	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
> +	    !acpi_dev_found("GOOG0021") &&
> +	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
> +		retval =3D mfd_add_hotplug_devices(ec->dev,
> +						 cros_ec_ucsi_cells,
> +						 ARRAY_SIZE(cros_ec_ucsi_cells));
> +
> +		if (retval)
> +			dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d\n", retval);
> +	}
> +
>  	/*
>  	 * UCSI provides power supply information so we don't need to separately
>  	 * load the cros_usbpd_charger driver.
> --=20
> 2.53.0.1213.gd9a14994de-goog
>=20

--crLSh1IVmUphWX56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCadA/+QAKCRBzbaomhzOw
wikdAP9ktVUzfFXrj+jR6CUf8rMjtGACDXOcsqPF81El4A6evAD/a+tUnxfuh56m
G6xxSRqXLwVx67Oua0SVwyZnQqFRZAY=
=rV1T
-----END PGP SIGNATURE-----

--crLSh1IVmUphWX56--
