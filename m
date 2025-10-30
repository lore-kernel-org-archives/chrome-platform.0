Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E4329E7B
	for <chrome-platform@lists.linux.dev>; Thu, 30 Oct 2025 20:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855471; cv=none; b=EtUOoTKwFIPAq8s6Sd52inUjhlQlRovkVhMHVNxCRQusXswkPgUFBXGmrfRCgQ0EFMas/MkZegCMKfTIQwOi/bMtU6RrDq8JHg/CpFXXhyQ2J1Stdl5Ptihcoi23ymcD6Nk43mTwW5RdnxviDHRMs+YsG61CpaBaFJ8ybBbzGkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855471; c=relaxed/simple;
	bh=9kRtTIBc07WnTizjvaJzLZPcLgBCogzq2Ghqk4DD7Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7TIkd/tjRGFA4JZrNWXZ/eo0rDiUdcU1BYPeX3O/+1LZshcdpV0k751t7311chprOODno9kkNI7VK5QELy5meuV75pzZAywL0VRQkFDlDy5i1qzYlecfa8l9YObx/VRQ+JTz54MCQNKDUi72vSQbfMar/jWgLc0BYF5TJo+6vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BQ0MPvOp; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BQ0MPvOp"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so1563602b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 30 Oct 2025 13:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855469; x=1762460269; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=151EPhAD4JHY/5K1q8Ff6wP++DpVmKl/O93jobS2q2s=;
        b=BQ0MPvOpaiZiAQLkbpivFgfrFF+fAqjG3OBkVfwFkKpTLpLuiJhjGXA06GqEHxQbsi
         qdBD+eaJ2Hw8cr7rId+fo8sGdriPhv4OXYzk9IUXccbuK3DnuxbgPt92vmkk6E5tyn0/
         A6BR6NCRqVZ0VXQrm2E+rKkftGMI9Iy3810/8sAWwCmKF5oDiuYJz1xDWm/8l8cSppPf
         V/EbEDpv319HVaMtbg6lZ+9/YeRj/kaGU049imxS44hBSqzOBeAxBfPZSDURT88qNP9k
         oTMx5yR1gUbconZBa4w5Uc/xnq1aVBKC52VEDnFwl4aeTvg3Bioq6AvDYrbpjICBYAhM
         Xr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855469; x=1762460269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=151EPhAD4JHY/5K1q8Ff6wP++DpVmKl/O93jobS2q2s=;
        b=poThR78HPv3zXTUMhBlq6pDptl7y5+ZFpBn2zUr2K79aBO6SOwqQl5tmP8qBU/WDAr
         yG8BtzOUSQZnyOnVPFsYL7NEZoF5zbrDrf2OI9hB81uNEPPQawbkQrvDsIMgdANsSwPu
         3qwWyX4POKf2sPZ3yA6dHy+5UwOJHYlf4UBPyb8ESypQZKBeULuJLveuz6yrNQc1AfeV
         rtgFni3BX7cj/SryJad7h1TgT0JYdTGW9rHejaIlZ9CxFyJQFmEKiCqhonxLBBN1n7cV
         yk6a3MHcsKgHNB8F2d+IfirFyla2hQ0g2u634f3gWTF3AdA3hlSzSIm4UNOhDnQlnTx4
         1UFA==
X-Gm-Message-State: AOJu0Yz4/grLwjKX4u9OPLTPOrwQd5qCenkV8ducWdHwQt26m1lMbIC9
	PaAENs7c3u7J//18dri5zQi/fR8DcRAKMQx+Mmmd12P4mG3NYc1HM7q3DWaTcdXaeQ==
X-Gm-Gg: ASbGnctirRZKI0fgdJOnQ7BGJj/3g3qIHyu5yyaV3Sp9cybc7HqbJs4U+BormSGuaC3
	3r86jNWE2D1hF4wZFu0ZC3bDRwUfjbCPedvViZpfw9yvruN0Pa3f0G6FJSGjP0F9nqzFUrwtARX
	86jUJkVebJbWR5SCZ58L2E5n/Y9N2yCGx87XGRR5lZL8OikUMxy6x2owzqb45a0iJa7h6iXYZrN
	ZnAaLzGMQKQhzEoeN5LWl4U69jImNWCyLj+4AQyLVKfJsXBRMLLfQg1ciXN+oZTSQPh8Ibi1VQE
	m4xIMrIQISsOD3aB1PRlzh+EDXQwV6UasBfiVKEK3R6ly5OImMzqcfZ3irZXLZJaeV8No2B5ttm
	UZh3d7zymGajtN+MR5xsWGdreCcIsdKpbXbOFR1lfLg8tIkHQFxXIfrJesGnl6mHVbU6ARIU12h
	hwxUy1xEvp9k2HID0AUhyAC8v+W4B8SzUd
X-Google-Smtp-Source: AGHT+IH6AU4NoorV5ouyjbLnksFBmEWlixg+IUFM1/RrhbDecyv2diBUOjwkESjNW4zqwzRv5X8ETA==
X-Received: by 2002:a17:903:32c8:b0:28e:a70f:e879 with SMTP id d9443c01a7336-2951a36c289mr14370265ad.1.1761855468555;
        Thu, 30 Oct 2025 13:17:48 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf49easm199598005ad.9.2025.10.30.13.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 13:17:47 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:17:43 +0000
From: Benson Leung <bleung@google.com>
To: Brady Norander <bradynorander@gmail.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH] platform/chrome: cros_ec_lightbar: Check if ec supports
 suspend commands
Message-ID: <aQPH5_gLKFbVDeSH@google.com>
References: <20251023234239.23882-2-bradynorander@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G7TLzwSYCEpVDVLw"
Content-Disposition: inline
In-Reply-To: <20251023234239.23882-2-bradynorander@gmail.com>


--G7TLzwSYCEpVDVLw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 07:42:40PM -0400, Brady Norander wrote:
> The Chromebook Pixel 2013 (Link)'s ec does not support the lightbar manua=
l suspend commands.
> As a result, attempting to suspend the device fails and prints the follow=
ing error:
>=20
>     cros-ec-lightbar cros-ec-lightbar.3.auto: PM: dpm_run_callback(): pla=
tform_pm_suspend returns -22
>     cros-ec-lightbar cros-ec-lightbar.3.auto: PM: failed to suspend: erro=
r -22
>     PM: Some devices failed to suspend, or early wake event detected
>=20
> Check the return value of lb_manual_suspend_ctrl in cros_ec_lightbar_prob=
e and disable manual
> suspend control if an error is returned.
>=20
> Signed-off-by: Brady Norander <bradynorander@gmail.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

>=20
> diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platfor=
m/chrome/cros_ec_lightbar.c
> index 87634f6921b7..1b7e4c4e18bc 100644
> --- a/drivers/platform/chrome/cros_ec_lightbar.c
> +++ b/drivers/platform/chrome/cros_ec_lightbar.c
> @@ -30,6 +30,13 @@ static unsigned long lb_interval_jiffies =3D 50 * HZ /=
 1000;
>   */
>  static bool userspace_control;
> =20
> +/*
> + * Whether or not the lightbar supports the manual suspend commands.
> + * The Pixel 2013 (Link) does not while all other devices with a
> + * lightbar do.
> +*/
> +static bool has_manual_suspend;
> +
>  static ssize_t interval_msec_show(struct device *dev,
>  				  struct device_attribute *attr, char *buf)
>  {
> @@ -550,7 +557,7 @@ static int cros_ec_lightbar_probe(struct platform_dev=
ice *pd)
>  		return -ENODEV;
> =20
>  	/* Take control of the lightbar from the EC. */
> -	lb_manual_suspend_ctrl(ec_dev, 1);
> +	has_manual_suspend =3D (lb_manual_suspend_ctrl(ec_dev, 1) >=3D 0);
> =20
>  	ret =3D sysfs_create_group(&ec_dev->class_dev.kobj,
>  				 &cros_ec_lightbar_attr_group);
> @@ -569,14 +576,15 @@ static void cros_ec_lightbar_remove(struct platform=
_device *pd)
>  			   &cros_ec_lightbar_attr_group);
> =20
>  	/* Let the EC take over the lightbar again. */
> -	lb_manual_suspend_ctrl(ec_dev, 0);
> +	if (has_manual_suspend)
> +		lb_manual_suspend_ctrl(ec_dev, 0);
>  }
> =20
>  static int __maybe_unused cros_ec_lightbar_resume(struct device *dev)
>  {
>  	struct cros_ec_dev *ec_dev =3D dev_get_drvdata(dev->parent);
> =20
> -	if (userspace_control)
> +	if (userspace_control || !has_manual_suspend)
>  		return 0;
> =20
>  	return lb_send_empty_cmd(ec_dev, LIGHTBAR_CMD_RESUME);
> @@ -586,7 +594,7 @@ static int __maybe_unused cros_ec_lightbar_suspend(st=
ruct device *dev)
>  {
>  	struct cros_ec_dev *ec_dev =3D dev_get_drvdata(dev->parent);
> =20
> -	if (userspace_control)
> +	if (userspace_control || !has_manual_suspend)
>  		return 0;
> =20
>  	return lb_send_empty_cmd(ec_dev, LIGHTBAR_CMD_SUSPEND);
> --=20
> 2.51.0
>=20

--G7TLzwSYCEpVDVLw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaQPH5wAKCRBzbaomhzOw
wnilAPsFQWOTspSuE+PX5XiXmMjyns4hNOhg0x58FJLn58jiJwEAsI1jRBUsHJT+
JIDeSbVH1XoEGPGuD70T0bjJxKLb6AA=
=1HoK
-----END PGP SIGNATURE-----

--G7TLzwSYCEpVDVLw--
