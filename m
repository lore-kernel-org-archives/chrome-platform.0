Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040E634FF59
	for <chrome-platform@lists.linux.dev>; Fri,  3 Apr 2026 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775256467; cv=none; b=B6cRcXZ7SzkNjE5pHGdnQeqsAmoa8aqpjv75SxjUI7sn2SJLX4inUUv2YqmoKwpK1gjKmllsBUHYvSpMf8P2xCJ8UjCk5V9yj22G61sWiwxzAhWIi6fpIN+7zFSDgcD8ULMDJJ2SPCqKvj0kBHAhUsr7U4BZj4B97qFBaiy3TTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775256467; c=relaxed/simple;
	bh=23jZLb1BbMRl4vVbPZVhrG0tF5G2ahmVNt+nZWQBrj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMwLII6ZCgnaaogiUnMPsO7ynMbi7t1jni/ucGX+lrjy0roevxhMZK3hjbSwMJOAcS67CUJf0WNeASNHKcNMj7462oAwxqUr4hTc0aD9KPJIotQT0ZENwi/PAxjDi8otfGAToSRWvFNnDP4akMMwzlQbm1WrM6TRx2o78zQso9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CCahV501; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CCahV501"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82cf96ca071so968729b3a.1
        for <chrome-platform@lists.linux.dev>; Fri, 03 Apr 2026 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775256464; x=1775861264; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4z6d+6/MCDVIyWyvyF5t9cjT1g5478mQCP1zANwoYI0=;
        b=CCahV501/fLiryGLtlsmdqrEOKKRXqHCbAGBhpAN0OCB3REFjAI2NCBR/SJJb6jBFM
         iOlpsJdoFIAbaMgc5u1gloYVONrt/rhTvvf5mRNU2hC032Xrk148qv5h0fBxktIrxqFw
         DzHvJUK9wlbxhdvMqjTweBS8XISdB2Jzqv+hqdTq7RgQyUaIMuM3CLrVj3V7F+RV8hzB
         gKMm/MGwRlmmA2iHgGLi0x1U4X+dafVu8FlhacZlUEujm3Pl+g18Mht2PXsV71aJ0bOu
         Lq4SpXvdZF0JWL6z6X6zdEhVIpPhPrv1+CcozgS1ImZHEXo6lAHtC1nvG6A6e5dJstod
         hK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775256464; x=1775861264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4z6d+6/MCDVIyWyvyF5t9cjT1g5478mQCP1zANwoYI0=;
        b=Q9nF6voaMGuL6ytKYMKoDwWFhEr1WPNazhhFVF66rOeF/Y6Eq5cUiIPzHeTTbBHvCh
         T+eRj20Y4upgG6WpC4O0ObRKqSLixip+XPdZrTn7KoEn5PYfZJNkV8UZdceo1SVRhRO+
         Yx/SP/XMwuSctRvHq6dk2IOKubWQSIc8ZjxCoOtDnKlGvANf0tHpX8upTfPXYVD/L1hw
         tXxkK6OZ5JdguRAr5PUKGxV6U9myAaQeK+rch9mXX4e4E+byEG7UtRCTN46AP66TaQXk
         PePa0D2MCZTIy4flJVjQTayjOi95C2ACe0zQqAftjUqdPLg+oZu6s65jobr9E7D97IMY
         Dp9g==
X-Forwarded-Encrypted: i=1; AJvYcCVkrA8qgJoIGg7EDMMpg+MLFLkgI7ijOmWaisnaapGQot8VBAuzyzidtKkZ3zAY2oHeOgoRWFTcjLYO/sAvQxg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpD6SLRrbTqgQyf1OuiDHCAlE69fnmBiqDYEbpLZ78yjv7hVVO
	0tJsGilzFEvlpWvwFK4/gYj+UVUwr8MVUXXwu4JyWKEcqAQEivxCFOL0WBxuy9Rfkg==
X-Gm-Gg: AeBDietmMSuAWKMgIDeY7W12pYkxsivz+b9MQYf+DJ3EOng962Tfl5lSnNHSn26i5Zd
	A4AAhAtOv9RocNYqJ8NRO4Pf4U97VV6obRhR8QBdkn2m4J4w7k8pFATFGXZjtplMnM56Wa+2t83
	M/SIdSCs85lMSlTLk6FAZ+H9I9b4koQo17USvXkmb/NfbkALs2XmlKB9X0zy57ji3vjaS93ifhZ
	UtE7DBGZ5I+23rhCfk932maZsQYNafYrqHX7x7uKthV2T7pgkKDv98eSQ1VAjX1gnbE4ljFOXDz
	Dr8d/Bkb4R8yYeatuCHBpRIo/xyLgtw8IL75k2lcmtaD51l8CVPIoxUNzLuzTaDJphE7BlD04IF
	jPCTMeD0qNERTqgioyAihBlSKd5DNjxt+8WTbQ/4+qcnz8oQvMzA8WZOmWEIbZdawkoE2ai+Ugn
	3WwyVOXyBx5bAo+BFuf8PXsy5zvCGwjZJsxGMouRl62Eui76LrxHwsm87E1hdnY+BGYUI=
X-Received: by 2002:a05:6a00:27a4:b0:82c:ebbd:9eca with SMTP id d2e1a72fcca58-82d0da3d529mr3892740b3a.11.1775256463733;
        Fri, 03 Apr 2026 15:47:43 -0700 (PDT)
Received: from google.com (21.59.127.34.bc.googleusercontent.com. [34.127.59.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9a24039sm6887661b3a.0.2026.04.03.15.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:47:42 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:47:39 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	abhishekpandit@chromium.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org,
	gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
Message-ID: <adBDi6Yk8ebiGwPF@google.com>
References: <20260403223357.1896403-1-jthies@google.com>
 <20260403223357.1896403-3-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g0BQnNgQsp6LXI7n"
Content-Disposition: inline
In-Reply-To: <20260403223357.1896403-3-jthies@google.com>


--g0BQnNgQsp6LXI7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 10:33:27PM +0000, Jameson Thies wrote:
> Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
> compatible devices and "GOOG0021" ACPI nodes.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index 6bca2dce211c..251aa7251ce6 100644
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
> @@ -257,7 +259,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *=
udata)
>  static int cros_ucsi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct cros_ec_dev *ec_data =3D dev_get_drvdata(dev->parent);
>  	struct cros_ucsi_data *udata;
>  	int ret;
> =20
> @@ -265,9 +266,16 @@ static int cros_ucsi_probe(struct platform_device *p=
dev)
>  	if (!udata)
>  		return -ENOMEM;
> =20
> +	/* ACPI and OF FW nodes for cros_ec_ucsi are children of the ChromeOS E=
C. If the
> +	 * cros_ec_ucsi device has an ACPI or OF FW node, its parent is the Chr=
omeOS EC device.
> +	 * Platforms without a FW node for cros_ec_ucsi may add it as a subdevi=
ce of cros_ec_dev.
> +	 */
>  	udata->dev =3D dev;
> +	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode))
> +		udata->ec =3D dev_get_drvdata(dev->parent);
> +	else
> +		udata->ec =3D ((struct cros_ec_dev *)dev_get_drvdata(dev->parent))->ec=
_dev;
> =20
> -	udata->ec =3D ec_data->ec_dev;
>  	if (!udata->ec)
>  		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
> =20
> @@ -348,10 +356,24 @@ static const struct platform_device_id cros_ucsi_id=
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
> 2.53.0.1213.gd9a14994de-goog
>=20

--g0BQnNgQsp6LXI7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCadBDiwAKCRBzbaomhzOw
woFGAQCVsZvOh86t3yXOAhw5d8edARY9zTI1JOnJ37uMGnJSaQEAiaxqyGhDdjUP
8/3JD9T1+a3vPCb+6DOOeB4GNbHyrAw=
=rXtP
-----END PGP SIGNATURE-----

--g0BQnNgQsp6LXI7n--
