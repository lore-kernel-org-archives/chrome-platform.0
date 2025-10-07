Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F79B78F59
	for <chrome-platform@lists.linux.dev>; Tue,  7 Oct 2025 19:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759865097; cv=none; b=tQP/H1rSUK2abadaiccESj+j434JrRePP8f5ij+EnDLEt11RaPR6oZRXSVgsrqukkkZQGJocCRpledd0XRbO2D4GSniilv9QNO2gsYr6rZEdWlHfgk4L4Srgg5jYeFP5P1lKbat8U0vRs7EZy6dmcTW76PsJUVsAQXSzxXtNLx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759865097; c=relaxed/simple;
	bh=dD0JZH8qQiXuX7vo0YlEQxSWSwH2d/FXSZejAOfRdM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLXMks0bBcuQhZS1vNbOjgQEOTPn3RPo9NKBqur2BRrYPLqXWbi9nxQGdMh7gAULH/kd1qJ0dBgy767ywQc1GyJETci+lrPMdEF8GIQ9q1kqkfj9qVlxCOXA3ehp/5mH64L97beYQSh5F/I/y8IRKKF6AS865ToysPlR8faC67A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=35YrnAEj; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="35YrnAEj"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b57d93ae3b0so4499179a12.1
        for <chrome-platform@lists.linux.dev>; Tue, 07 Oct 2025 12:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759865094; x=1760469894; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ9KABoIGHmAAq7lJx8BVSL+/smAc9YPHctbNZgG1VU=;
        b=35YrnAEjJqpAlbRgMpIlwUPJiwkq+L2cbBIotcCZWZDoJq6chn/5Fqpa6XjeGuTbYK
         yshA5ehb4JBtBq37FRuYetVfkxQTctWlLeVrTHmSwAmHxUCBwRIZbgfVqCZ+cPH+Fwbj
         WVT6/54kZuK0/HynooBztqRxqBG2vCooTqc4uZv9QC1v3yZYzli9xd/Wb1bGG3JEbMMF
         Fl9+o4pWi/NZkVUVIYvkEqpjg/rxU5U49m0IL881+pDgJZFDA2PyTDIoWN6+qPl/pNKJ
         TgoKIkrJR452LphfCxYF5T6ODYQfZzbhsIEwbcuee4ymABQSNeyHaYKnIr6V6ieV6zUJ
         XUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759865094; x=1760469894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQ9KABoIGHmAAq7lJx8BVSL+/smAc9YPHctbNZgG1VU=;
        b=tnq/PooGavpz1Fbzk+WKrBpAhgRT8SB+DUy+gIgovFDKhJCVeg5nawAWbnvTujtcex
         zuwP0CKbddLr9dzB3dcjmY1J0FS1ETbGFbTo92ax0kJlGft060mvbW4op3aaWXOaly20
         lSN+C/Xi8R0TbNenGFSWWUMmRiazp6MeE6F6hVPUOEUHD/hiLXvpBfenDyDdfIc1MozN
         5KbRPKUb/9FF6EQD04rMYSg/dG8DMKMRXhJO7Etp+F4vQVRdDN+DrA5oRUib8eaw1GYT
         dAJ6f9TGGrb530DQ5d/B0is9NaYSy+N5XgNRaT9uaQ/ec6goh3BSs7DhSw8i0k7TtDWM
         Qzow==
X-Forwarded-Encrypted: i=1; AJvYcCUq6DY5nJgP1f/LAzzvK0YZkNLHcN01mZP3l9dv9/40UpnAuRtdzqXVcs0hFQZP3Sdwp47CuDpFPG5ifTAxzAE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjV8D56BRT6q7l8oM/rhI0iuAl4WmM1KsXRdhEhynAPcMeOJjV
	0/WOY+KkPV5Fdsb9inAFfYC+FUInf9gygq5mElmNzSkWegHbcMRKDxSvADDWIEJ9tg==
X-Gm-Gg: ASbGncsSpR3nBLMscLOVjtxx8BTxGUMkNLl6Xr9yuUXIiuZ4+WAfTh+nFuTu2IqcwD1
	YLyRwXvgUekgI1gxYTrrBmRPX339lH91LMIuE5IJi54h40aePAhTXzXBnBGBxYHHekIpCdZBfrL
	bkr13vyOzZpZ4tpAFBFOkqciggfTaG3E2c3VTy3KCw6wyuw7S+ymn8rHs2JEcvIJsgMma2Uo27e
	JQ2Rg19PIRgXgMeyWJhpPgRvy3mmfRVQ1RphVHlL4h6dP37RuoF8p18yY+DVL+eE3uyXPAbCsdW
	9nKjMsZrEpJxwCnDNH6YXwsvjpTNmplu16Ir8Vt9PQnW6JULtQ0XsLA7p5K8NK39DXWp9a12VCj
	PjXewzU+F/xMM2D+toI0dnDIudNyLYxoOq9e45yDrS/Hc9nKAjkucCYuEEnY/A1pn+/+gtQIGd0
	tKAO+azRhmkgRHgEwEhDuw
X-Google-Smtp-Source: AGHT+IH4bjNuCX7ZdvPaK3cW5l8x1vte/cfxRiFYzrrFsjftCuyV/+FzdaN9VlSY6ubV6FYziu7+FQ==
X-Received: by 2002:a17:903:fa7:b0:267:a8d0:7ab3 with SMTP id d9443c01a7336-29027321dbcmr9907575ad.61.1759865093972;
        Tue, 07 Oct 2025 12:24:53 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b8796sm173717855ad.77.2025.10.07.12.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:24:52 -0700 (PDT)
Date: Tue, 7 Oct 2025 19:24:49 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org,
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org,
	tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
Message-ID: <aOVpAb3Cd5u-D6I3@google.com>
References: <20251001193346.1724998-1-jthies@google.com>
 <20251001193346.1724998-3-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A+Gspdh5QmYIfiJs"
Content-Disposition: inline
In-Reply-To: <20251001193346.1724998-3-jthies@google.com>


--A+Gspdh5QmYIfiJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 07:33:42PM +0000, Jameson Thies wrote:
> Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
> compatible devices and "GOOG0021" ACPI nodes.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index eed2a7d0ebc6..3d19560bbaa7 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -5,11 +5,13 @@
>   * Copyright 2024 Google LLC.
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/container_of.h>
>  #include <linux/dev_printk.h>
>  #include <linux/jiffies.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -235,7 +237,7 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *=
udata)
>  static int cros_ucsi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct cros_ec_dev *ec_data =3D dev_get_drvdata(dev->parent);
> +	struct cros_ec_dev *ec_data;
>  	struct cros_ucsi_data *udata;
>  	int ret;
> =20
> @@ -244,8 +246,13 @@ static int cros_ucsi_probe(struct platform_device *p=
dev)
>  		return -ENOMEM;
> =20
>  	udata->dev =3D dev;
> +	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode)) {
> +		udata->ec =3D dev_get_drvdata(pdev->dev.parent);
> +	} else {
> +		ec_data =3D dev_get_drvdata(dev->parent);
> +		udata->ec =3D ec_data->ec_dev;
> +	}
> =20
> -	udata->ec =3D ec_data->ec_dev;
>  	if (!udata->ec)
>  		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
> =20
> @@ -326,10 +333,24 @@ static const struct platform_device_id cros_ucsi_id=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> =20
> +static const struct acpi_device_id cros_ec_ucsi_acpi_device_ids[] =3D {
> +	{ "GOOG0021", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, cros_ec_ucsi_acpi_device_ids);
> +
> +static const struct of_device_id cros_ucsi_of_match[] =3D {
> +	{ .compatible =3D "google,cros-ec-ucsi", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cros_ucsi_of_match);
> +
>  static struct platform_driver cros_ucsi_driver =3D {
>  	.driver =3D {
>  		.name =3D KBUILD_MODNAME,
>  		.pm =3D &cros_ucsi_pm_ops,
> +		.acpi_match_table =3D cros_ec_ucsi_acpi_device_ids,
> +		.of_match_table =3D cros_ucsi_of_match,
>  	},
>  	.id_table =3D cros_ucsi_id,
>  	.probe =3D cros_ucsi_probe,
> --=20
> 2.51.0.618.g983fd99d29-goog
>=20

--A+Gspdh5QmYIfiJs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOVpAQAKCRBzbaomhzOw
wtlBAP4vEF/xKiUvUfs4+ARveJWRsFz4t8iYVw+Koi4pU1PHPAD+IawlbfoNt1Pf
mV1uQAwlPekA9rhkiai1x3r/epmHaQM=
=fbBI
-----END PGP SIGNATURE-----

--A+Gspdh5QmYIfiJs--
