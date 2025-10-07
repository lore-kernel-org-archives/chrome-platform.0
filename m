Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A943B227B9F
	for <chrome-platform@lists.linux.dev>; Tue,  7 Oct 2025 19:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759866227; cv=none; b=ZGtc/XZwaSKdHHk2ZjtyHPOjOC99KJdYdcbSGmwqOItepKt0mV2nFr4RamzkBd/2DqjrfOoC8xK9R5ylRzOqJxvCw9t88c+3mzJwpZ8AnJC2Ci6TyUOJqfb35wETkW+Z9ZCgmwvHq723bNB0JdHcpQmYvdJmPVL3+/qIaf1T4tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759866227; c=relaxed/simple;
	bh=xZMyj1txn9yNEkPj4jndX7PoAnwBnvLHxpXeVdkrCq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkkF74nSNeRkRI4wi6vING/RtJzyOZC/9Zn4v8ZXvG5FNqLsMwv/ocPjiGYdt8mfV7WOpoaE+UdG7afEC28htfFxD+ZS4BLfWsgNTa8Ffuqsw8Y1Z3x1dXElg01e+X7raUY29Udqov/0VWWQDUuZ7bPy5VEChXRH+wj0o8LB8FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Luv3jbWn; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Luv3jbWn"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so4362598a12.0
        for <chrome-platform@lists.linux.dev>; Tue, 07 Oct 2025 12:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759866225; x=1760471025; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tPY6o7kS39nLiixzOv3LoRY6a9yECDfRcVUGAGn0FOs=;
        b=Luv3jbWnVm9smuA6Hog+KtELhLUOdA6qpXiLLDnIhlXDzIs2i19Kc/9iEslZpYsIV0
         909Y51UmvXexTnzRGq619XOG34G2ma2sFyQetm6z5fhog7CgesWiW51acL0NUlz1SBcX
         YO1mjbPIvvjvBhjQj/azEOed+YaAz6zfh2DJuPSl9U8B94HjvgdHps/NhRPJd/hQL7oX
         L1L4q0yx3adkvpqbgXks0iaoIByIE8EKAqyp5Izph7Cj3NeWYbUA3vujr/YTcYPPkBee
         XWQ5uWNm9wgcjbj5ddJBSpfeTAnURlkNDw6WjcXnvYjU5tSD7JVZYAqLw8AzhY+Is8FH
         4c/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759866225; x=1760471025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPY6o7kS39nLiixzOv3LoRY6a9yECDfRcVUGAGn0FOs=;
        b=uDwI+xXE03o2R8NugjMcQax6R+A9zncbf248yoF1gs1XBCKCrDTldwGcNvOSvb3krI
         VkMnEnrBVQ0W/YUn/WvtnjKHQrQQUooionE9lHQOn8biH2uCznFyMQklLeAhYBPErKkt
         DBg9R97AD4WlYtrBimx/dnjH7ctpOWSM48uOO6eTNXwwKmMJ8wJxcXv1mClrVKIhs2Zy
         NyY3bqEF0D8KWqolweA+p9OMLQM7Klb2ZdtTLvJr0F7lXN4HXTuN0QQkqZPtL5jr3YrO
         SfNY92qIPXSEoTaqNEAfm3azKuj7EMHo2sxPNZo/aly67CnI1u8Ib9wBElnOuQSq3cRT
         Zxsw==
X-Forwarded-Encrypted: i=1; AJvYcCXL/Fa3BGusZ87d0YOIVSePEhmCQ+8GFLjl5k3MCMsRnX8++pTrxjYl9a+CzCVNts2wyFHRsXYELZjahxr6QW8=@lists.linux.dev
X-Gm-Message-State: AOJu0YysoGZC7fe9LqaJDx36wHaGoX1Y7s1SCgcqsc5Q23FLv9ElbKih
	K/apU6seDM32UKBCT1cgQqMG5f1ik/bRnuA+EF9p3PBkgWe091ibGzfxKt89xLTpSw==
X-Gm-Gg: ASbGncv1LhdNcOSM2QqzSYAoIGXAIBGVebd2aLKpd3IGdvGu1aQAhUhVTATQxfSFNpS
	FUbSQ3E6CcF5RZCBBvu/6kZAz18S3QwwTj7kvrUzVu4Li2+/htoEJo3jVeMaheVuR4GTLiMoW7p
	dFa9DTmkUyNW2lp9hIM9TGqvpuutPJ6BI8lUqevNsS9r7NiHxkereUx5H82nM/elNIlZ42PMzLS
	mg5xKabKgJUhTBCouJualmdL+SCPCLARcnHsVWlRGuQzRdJ+IEbvilVVNDm0AN4hzt0lQq+jD02
	vBZ5XnaiYHKETVapbZkY0KPTkDOGLpEOWFL2ZfnT5J76zpuZ9M+O+EBbJ52UyCCTWVVING9oTjR
	OFpQILWy/J7TFDdmy8xQrH69ELJBKK02EYmXvzqw4D2S0yfl3lG1qsvnDuCs4RIlycuHZQsD2ff
	Gm3t9zzUCVoVvkpVuHG+Ei
X-Google-Smtp-Source: AGHT+IE5SIvyP4eUf3ipqqD5UvRzEUwKrkkptQOc7fcVjGhgP5yFTG0+Dw+sZtrUtx3Ml6RCP26bLg==
X-Received: by 2002:a17:902:d60d:b0:269:8407:5ae3 with SMTP id d9443c01a7336-290272f8283mr11547605ad.54.1759866224509;
        Tue, 07 Oct 2025 12:43:44 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b93f1sm173669135ad.71.2025.10.07.12.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:43:43 -0700 (PDT)
Date: Tue, 7 Oct 2025 19:43:40 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org,
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org,
	tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
Message-ID: <aOVtbDOl1w4RXEfi@google.com>
References: <20251001193346.1724998-1-jthies@google.com>
 <20251001193346.1724998-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AVuZMM5ghkB0dxRG"
Content-Disposition: inline
In-Reply-To: <20251001193346.1724998-4-jthies@google.com>


--AVuZMM5ghkB0dxRG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 07:33:43PM +0000, Jameson Thies wrote:
> On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
> defined in the OF device tree or an ACPI node. If it is defined by
> either OF or ACPI, it does not need to be added as a subdevice of
> cros_ec_dev.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/mfd/cros_ec_dev.c | 40 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index dc80a272726b..b0523f6541d2 100644
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
> @@ -177,6 +173,16 @@ static const struct mfd_cell cros_ec_vbc_cells[] =3D=
 {
>  	{ .name =3D "cros-ec-vbc", }
>  };
> =20
> +static int ucsi_acpi_match(struct device *dev, const void *data)
> +{
> +	struct acpi_device_id ucsi_acpi_device_ids[] =3D {
> +		{ "GOOG0021", 0 },
> +		{"", 0},
> +	};
> +	return !!acpi_match_device(ucsi_acpi_device_ids, dev);
> +}
> +
> +
>  static void cros_ec_class_release(struct device *dev)
>  {
>  	kfree(to_cros_ec_dev(dev));
> @@ -264,6 +270,30 @@ static int ec_device_probe(struct platform_device *p=
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
> +	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM)) {
> +		struct device *acpi_dev =3D device_find_child(ec->ec_dev->dev,
> +							    NULL,
> +							    ucsi_acpi_match);
> +
> +		if (!!acpi_dev) {
> +			put_device(acpi_dev);
> +		} else if (!of_find_compatible_node(NULL, NULL,
> +						    "google,cros-ec-ucsi")) {
> +			retval =3D mfd_add_hotplug_devices(
> +				ec->dev, cros_ec_ucsi_cells,
> +				ARRAY_SIZE(cros_ec_ucsi_cells));
> +			if (retval)
> +				dev_warn(ec->dev,
> +				    "failed to add cros_ec_ucsi: %d\n", retval);
> +		}
> +	}
> +
>  	/*
>  	 * UCSI provides power supply information so we don't need to separately
>  	 * load the cros_usbpd_charger driver.
> --=20
> 2.51.0.618.g983fd99d29-goog
>=20

--AVuZMM5ghkB0dxRG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOVtawAKCRBzbaomhzOw
wmRYAQC++OoC5q1mBE/1huCJjMRFkqmQs/g8WPoS9w/QsoyC0gD8DywFVX8m6bXV
rSfJcTnDduy80Nfk8IhLCFhVH1L3cAY=
=Cikw
-----END PGP SIGNATURE-----

--AVuZMM5ghkB0dxRG--
