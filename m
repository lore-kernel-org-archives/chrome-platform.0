Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E356256C87
	for <chrome-platform@lists.linux.dev>; Thu,  9 Oct 2025 19:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760037218; cv=none; b=dddryMeJl/jYx501s4cznY155Y5gCj18YOEgTx732TIghvrqEsqEsaYYItwr+F1ART/iqwJqU+2qR3n0NpDPM1zukXbdguoL16cfzksTUy92mVhC7Z/1qQrty8HOVWjYYnuCbpSXbuLXhNL0D3XEi4ow1rm7QJUCj6qRrCNe4R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760037218; c=relaxed/simple;
	bh=DrVzT4qQlnwhzZJ7Zk7bJ5ieuCE6DLcCPb5WQwSENjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDdvII7nr3IhLrWxpKwL660SP3l/rngix2q/yL9RCV5QsOejpRpW2R7IAfHPDaXu3iLw+l0S97mbTd6rI/LUXttAu57mI3k1XZq+KiGQc22/c7upn3p1Qs76TlW4wg5UinrXB3qugn4h85wdq36wEDJtSqLCFZJcq0r4Uqdc6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o2ipJ28u; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o2ipJ28u"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1325577b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 09 Oct 2025 12:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760037216; x=1760642016; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iOSCy56bqYjv1nF3mp941PWU8Gn0Ei1sbikd3uwYoDs=;
        b=o2ipJ28uebOJuBUwNIIktcUl7Zt1j+qm8TZmgnldX+ygIqurohXAYvo1erOIk24WYm
         RvQibeBgBnbcckq4Xgvncw5+7O7iqSEJMz9p4j90lwsZTER3EvdSw/OAybW5WcXCWz4x
         STftIZ7GLnr5xFZVIVG2/9XrKQ7h1o1Pw9S3o6T1OSscyCQMmPREWpVPhSC64sHpla5i
         oDPsuIrHmy/Yg/yz8WMCvW1Hrscjs5F1Oa4Bwm9bjB2fDkH86fqz6kneLVeOUN7XgbQL
         wDkIuzuq0z5ITX2iLJhFnfG9j46pEg8HZLpsygqFgAi5khCyHFJ2JKSOOsvMo3ZGzsDx
         Hh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760037216; x=1760642016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOSCy56bqYjv1nF3mp941PWU8Gn0Ei1sbikd3uwYoDs=;
        b=m7PV/hyebFHF0v1UpxbaBmhSj6oVSh0Apst8uiUYFPZ64tDPWsk4gai0PcXDhaIIuq
         BCgXyHzAa0zWQhsE/CAzWoMYKVOGzSVHY11E/6/Ch9rCCstmB1tJ6jBOmezDOGBOxGly
         MTBRGE1zy2/hDdcWOz6MrrjIyDDIr9asiLs9JEpfWFQC1bSwk1Drqe9S6eaU8PDJ5750
         Fv481OFTTLjLMuQR0coCpF/JMB1PjOXJqstnzdCzH+WwetE4+ay9tbo/nKbHrn9pER/0
         wY1DKCz0X4WoSswnah9nsM+swLAjmLkxBUc4ho8jA45ANe4JgNppgE8ZPo3cltpFMqsS
         Vifg==
X-Forwarded-Encrypted: i=1; AJvYcCWIa9BAE36bIfmKu5+3VbFdnutvFvFLMhzLKMJS7joBte5oKzwm4sOkV8+dtM40AikdNDc+600kxczwPwbqzn0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVPu5mD3S8fODs30Tmh1nKeGsrtmMOetQqIPg1tleCUw7W6bhY
	0n8+eAiwb9ZFqEU8/YvjoW4jtDrzWiBLHYSubGlsKlXG1D9yb4oUmqaE4f+sg/M0yg==
X-Gm-Gg: ASbGncvArt0dpGqkjrd+oOEFWgUfvIwUG9uDVFmVA32oHGxRuAOQbUP3q58QAHlpfe5
	AI27SnVkC4KPV+AJr3mPnmKf38XPcRAZgJSO5F28skNEf+H6gTOwiWRBccuckLYDJ1bRpt6Xh/r
	O2WeRk+PsX6nH8xC7QA1NnoCibic4aVVzT+h+JqUdBy6vnZUnirnVFBu8C9mp0Dk8dv2+YUXccB
	TBaThCzC4fUBylPxDZtBXxjd/qfO3W+AziEvKSEcpeQ7aCEpftDq1CSlco06mYtFAya4lroaey3
	/yJ0T4OUvWbl8tHQMQ4HeC1+nbeEcqYDsonOlj7glVd/5dFrJrACTvt8M3LI2MbYvxaPO4Jr88g
	vxw5dWZxzsIL+6hD/BtxcUwcFNB+NDNhpvz6keDngU5Ahudsfn5TIJn/++kbb//ZX6wUl7ZT9dh
	efmYYiTDNzsw==
X-Google-Smtp-Source: AGHT+IEEnUYCsb1ig8WOq5UjpbnlJYhdXQVdJ1T9XijXib3yOVoxgg9VmVsHFrdAuk8oT5KR1DKNRA==
X-Received: by 2002:a05:6a20:6a22:b0:246:3a6:3e47 with SMTP id adf61e73a8af0-32da8e2ba5cmr10180448637.12.1760037216071;
        Thu, 09 Oct 2025 12:13:36 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992dd7ee5bsm455211b3a.85.2025.10.09.12.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:13:34 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:13:31 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org,
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org,
	tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
Message-ID: <aOgJW2gOuwulIMny@google.com>
References: <20251009010312.2203812-1-jthies@google.com>
 <20251009010312.2203812-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gdyhNSmhYhPSv1Bb"
Content-Disposition: inline
In-Reply-To: <20251009010312.2203812-4-jthies@google.com>


--gdyhNSmhYhPSv1Bb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 01:03:08AM +0000, Jameson Thies wrote:
> On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
> defined in the OF device tree or an ACPI node. If it is defined by
> either OF or ACPI, it does not need to be added as a subdevice of
> cros_ec_dev.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/mfd/cros_ec_dev.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index dc80a272726b..1928c2ea2b8f 100644
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
> 2.51.0.710.ga91ca5db03-goog
>=20

--gdyhNSmhYhPSv1Bb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOgJWwAKCRBzbaomhzOw
wpmvAP9BRKC8tzJCIcuD4p8sAtDTojfzvAT7272ct6sdoX/8gQD/U725yeINVisu
v5I0X5yXr45fO2RNjUgA0hRB+v4oWgQ=
=DzaU
-----END PGP SIGNATURE-----

--gdyhNSmhYhPSv1Bb--
