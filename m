Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0050D25485F
	for <chrome-platform@lists.linux.dev>; Thu,  9 Oct 2025 19:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760037130; cv=none; b=YmSP/0otSgdRWL/r1SM1C8qiTY0w4oebSlYMcCl0RfQfRhruV/pT5+HLXMdHYUQRC0sKtlrz3D9uTEly8JC7QAyDOPBB+LAjDtEMh0Al7x1EVISgJhc0HVbi1F4ipyfaCk+ULIbKATS9ylSnkNYnwx/0ILAu0iXY88jDeFEPTEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760037130; c=relaxed/simple;
	bh=n1pgm9KXQpsmFTJTlrRTqqoc3StRiW8H6U0QmRxjVIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZ0mFXxZwK2y2NSqgTzm2HjDag7QtcvOmx1aIe1Zq/1xmqPMtmdE5yQNlaEpqkEYl+E+kX0ExJlkb31xVvXhIFSO1MnhjjJhSbvDWB7sxJKcf/iXg2ildypWy41QHYta4pM/qcpBUT6Io+iY5NeXsTL5s0zZs4UhkP2jAY3rhsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=13sTjHA0; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="13sTjHA0"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77f343231fcso1064310b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 09 Oct 2025 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760037127; x=1760641927; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EwOoGI07ldKNXakHc31vPQT9U2zxbYTfJdNYRER5vcU=;
        b=13sTjHA0DyXrjdEa6PjQ8QTXI68Myx26h5jlI1ovXQeD5I5/cTYYurgI83ruPnaXWF
         2evvoSLm8E3qiKDzkhUmyMVVobwtffRcDiVwEsjDo+/39SEQ82aJxFkFL0MwCA7KZ6ac
         hxNib1xVpiRsi6ME+M0h5MU6m7c4WKVNKR2ArMK1pvvoGWpjqB/yvRFrlze6THfrr9IB
         VlzxQfw9TRIfyakO4GTm2qAobiHUkGryeZ+eWhPtuNrtPz3dVa3rcGcR+natz9xdKNr+
         Eem+ukpSxwqUFaSDMf8ApNT1xcjn06IfhdsB/A6WOJZrI9BHnDWzjRGCmNvznecbVxUU
         INKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760037127; x=1760641927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwOoGI07ldKNXakHc31vPQT9U2zxbYTfJdNYRER5vcU=;
        b=fs/zWN5BayTi9sH4lAjFdyv3E7cRRoF/uXE60olokerqbn/AntG3YPnyV4LR4BPgH5
         VI/NFqgra68OzNCEv441THS/p23ebw+iKLab1yC2IqVr2pRYSrl7zTpWZpvgZxYlIQ0c
         f8rwp4qKakr9GqxpvM28H6SeEaUkG/0wRVsRVH8/HrdBvD06jKdqQbZuZhEEHl0VvqBc
         kROXI5w59D8lCeb0XIsx+5Q00Feed20+WYfE8jQkE7qFLVQiVcncNm0DFNtaa3j8KMay
         BrGapLkvELKWpEbc8bENXsZgq5kcb3gzNqS8Bjt7Ou0r0GjieMDUhmTuaIegV+LzXGnd
         U9UA==
X-Forwarded-Encrypted: i=1; AJvYcCVkLc2Qrco/A/10gimxWo4iQqXdk9JylYZlItIE1f/W4KBY5+cTm4I/Zdj6RYbsO5h1CEL9INZ9PRDHJlYxpsQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdM7xZaUJQBJG9XuO0lAYugOWh0XKxUMDn7iwdkzX2D8ZwRbxp
	beD+Xu2dugOe1hUPFHtFYG7MeGTOMlB+r9mymkQy9A//4cZXskHVhzir9YnkmT6s0A==
X-Gm-Gg: ASbGncutPxGRqBDvbiftdNDd6Lig/r9ZxhHlskgR5BSbCbaRiU/exW5Po0QeiZAvIGn
	UbaSk+eFHPlceTXRpdliSHl3qvk12urLicLPPvdr4d6cAbELtmhU5OrDVJNNQmnFoGmLHVrcih2
	Ffk9yCcqplrS88nYV41c5CEoPJ8MVwpX5vW88aT3LNE1vblx9S+qWrRqMKJe19wy+VYJUaPFf1g
	FKsdmAGwlSOtyDcL9d88b8LCUh7gxvU8hcxxpUXhi/WCQTzu7gkyLzeoTzRPuVpb+pAVVSBH48s
	RsJhsJHMMmwRdvFVKxJHM9/z3wOAaRZjvwFdqH/JmT8LoVcJHQjiewRHycBuNKXnHkIOHFnvQGW
	RGno59UfvFssHYmGZ9/x6c3J55lpdgasyfDZM8BRrQsVMdFpnRWLsz2dHOju+XzXO+nNEu4fXWC
	qNbtBCnpDgZA==
X-Google-Smtp-Source: AGHT+IH72sDrXwwkrDO6FWG06LbsT+R2CV7vzjUVeXBnwqtete9TvLbCDH2IOKZiEWq/Wu1NWkJrRA==
X-Received: by 2002:a05:6a00:2389:b0:77f:68a4:a88 with SMTP id d2e1a72fcca58-7938762f6cdmr9925673b3a.21.1760037126658;
        Thu, 09 Oct 2025 12:12:06 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09659esm480905b3a.45.2025.10.09.12.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:12:05 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:12:02 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org,
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org,
	tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
Message-ID: <aOgJAtdd_M62cnR6@google.com>
References: <20251009010312.2203812-1-jthies@google.com>
 <20251009010312.2203812-3-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ck64/QEIf9Tlz/RB"
Content-Disposition: inline
In-Reply-To: <20251009010312.2203812-3-jthies@google.com>


--ck64/QEIf9Tlz/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 01:03:07AM +0000, Jameson Thies wrote:
> Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
> compatible devices and "GOOG0021" ACPI nodes.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index eed2a7d0ebc6..62b80ad85a68 100644
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
> @@ -235,7 +237,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *=
udata)
>  static int cros_ucsi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct cros_ec_dev *ec_data =3D dev_get_drvdata(dev->parent);
>  	struct cros_ucsi_data *udata;
>  	int ret;
> =20
> @@ -244,8 +245,11 @@ static int cros_ucsi_probe(struct platform_device *p=
dev)
>  		return -ENOMEM;
> =20
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
> @@ -326,10 +330,24 @@ static const struct platform_device_id cros_ucsi_id=
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
> 2.51.0.710.ga91ca5db03-goog
>=20

--ck64/QEIf9Tlz/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOgJAgAKCRBzbaomhzOw
wtyVAP0TLJub+b5vagwrk3iMRa/VWY57prIisehNkOjcgtnzmwD9FkRZPL6JqvbZ
fL2S6Q1rkPu0rq5K0Fteq+E+dV7jbgw=
=d2GV
-----END PGP SIGNATURE-----

--ck64/QEIf9Tlz/RB--
