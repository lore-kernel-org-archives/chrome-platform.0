Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD1221FBD
	for <chrome-platform@lists.linux.dev>; Thu, 30 Oct 2025 20:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855780; cv=none; b=aavaI3NpgiVNxUmnc8C0Q0zCyTG6XcSQcAX1/y8/nqR1Ed1nI6FugKPR4R6SyPfyzko5PW9jCXwhGsYrtnMwnxpKPN7KgFj2WavdQ+5V+RcUrW3xlP8dSr0e+3HhFoPMDubuNDy8dNAo6wENGUhIrQZFd+C+iCfdrp3mQubxxRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855780; c=relaxed/simple;
	bh=cfhHMOfNjevmyHvD/oCQ9inxlGzQLoRgTSqIuWo8eHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPP0MMm5iVa8tiCiB+v5KHMVwyc6UZGi3uSFdd+m4mM0IScZ98GoBdmKR4tnrB/muVrD26U8C05ydcHBOdcc6G5W/C9ovewnZizUPfTorkDiKchlukaS6ynCaOSYovChrw7zyr+YFU96yBW60mSeIhABdqAErVtNH+QQHG3aAEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eT6k0IZe; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eT6k0IZe"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b593def09e3so1121200a12.2
        for <chrome-platform@lists.linux.dev>; Thu, 30 Oct 2025 13:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855778; x=1762460578; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x/vVU4Df2ozvtXxUgCd8mZJ2CDfvtPv8jSi6/d8MOys=;
        b=eT6k0IZewxd37exz84OBGyYzLYf9J643famch2WAj8FOVEXzKGPmtgvkpMijxN+Hei
         ZHxDniiFHuHc6Qqz42Z8H9WUmai6nS72ljM5qDdF/Q/IMf0sX4ewLekQRGspfa7oNUCO
         QGBoPTZaUqXjjfwdHDw/pUIpD8ektpRcQZ64AuJ33j99oWSNVwzevqqDKnmP/Xl1xhXD
         6ukcJHgsn61OiYkOLOlWIBthRFIRoCKtI0Ogogd2wHb7zfwUi9aoZeq1nOdjadbNf00D
         SWJ/6aW1pZgZ86fZwtDgGT8np9fjT10r50QYYhAVchnnjxf7TX9YjoVbBlVtcgp6PKAN
         3SXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855778; x=1762460578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/vVU4Df2ozvtXxUgCd8mZJ2CDfvtPv8jSi6/d8MOys=;
        b=SeivjjvgOX6Rk6k1QguaN7y4gLgDtLOKKlNy5ZvU8NnBenF11A5Hb883o5PU3gZCDk
         d5ktAYf8R34mXSpY8asp5t/qt47OxL7OFbSUP3WhzXKCPz/UbVzRCkQrizumUUf/wf4X
         P8ONEasKGoLXRhQ9uMxsKOCMSzs9E8pl9FXW5F3j0Rsk5Ewa77Tt+2K2rIrqM9Z0b6R8
         XC+nfjPefCpXR4n9LSA7J5hWK78VO/SCo60t5X3KvIqPA3XSFBeiKLwiLb5IDvLmUOg/
         6gnZSsbwsCR4QhaG21ydI/5o5RMwVri/5qyW/kTemH+RxWqGyEccRU5QgwYvjHjnCLsk
         oVKA==
X-Gm-Message-State: AOJu0YyFAe+486WaDwe1jeXfbmqzB/nj73h8HmRcQbPJeF4ycTZOgi+B
	RCiCLQ1q4g7WgDrlfkViA4H9Nnwz3a+12Ds7EiQRfwg06/A5RiahdO8fn28oF9fe3Q==
X-Gm-Gg: ASbGnctKPTQct9OVu+YjOrb8Hm8OUX47eCJ1pXzwVnDng8wP+30B2BNkN1oOT+AKlwj
	CcohRe80QO8H8wP+yPbZULLWv0pyFEi8y6EXYnNYk6Xa/ZMgdQAPyHti2ok+WAKP8o2/WTv6s+H
	aXlME4diOV/P8P1QfHXQx/8UdjRYr968Y5FjOCDOlVX1gSGX9cDhXyAlxQoOHQ9wadQhl4iZxt7
	6lze/c4xhmZ+VIINpVEa0Lyo/231lBi0cd0Mnjh8eqnyOBPju/MzlVf56sQ9o3LDkTK0ebMjMLo
	zReiq86DmVSUYW0T9/uLgTbQNC/gsbAuFRrc+hSctpNpZiBPyAe6OW8DqXwhz5JsInjoXT7ZPqH
	n/db14hXJErsVJWBKucoRPYRUplYg7P7PjJz3ycGqmo+ppWXb9VGgyJDSJ3/MeUr9HfXyu19sQV
	r7c1UsIUmL4oh23up7DkSw8SudN6+6PelpzJqVpzd2eUc=
X-Google-Smtp-Source: AGHT+IGSPsJU7324IKH66yjFys/HafmZv0MH5748eAne4tLXZM3PCM4QkUg8/m/9D+BrnD3BVoAmqw==
X-Received: by 2002:a17:902:eccc:b0:295:2276:66f8 with SMTP id d9443c01a7336-29522766ea7mr2803545ad.54.1761855778106;
        Thu, 30 Oct 2025 13:22:58 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d230basm196520445ad.46.2025.10.30.13.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 13:21:59 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:21:55 +0000
From: Benson Leung <bleung@google.com>
To: Brady Norander <bradynorander@gmail.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_lightbar: Check if ec
 supports suspend commands
Message-ID: <aQPI4y-S5oN8sqWU@google.com>
References: <20251030195910.8625-2-bradynorander@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vbb82ZDnwpATQbIz"
Content-Disposition: inline
In-Reply-To: <20251030195910.8625-2-bradynorander@gmail.com>


--vbb82ZDnwpATQbIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 03:59:11PM -0400, Brady Norander wrote:
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
> suspend control if -EINVAL is returned.
>=20
> Signed-off-by: Brady Norander <bradynorander@gmail.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>=20
> v2:
> - Only catch -EINVAL from lb_manual_suspend_ctrl()
>=20
>  drivers/platform/chrome/cros_ec_lightbar.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platfor=
m/chrome/cros_ec_lightbar.c
> index 87634f6921b7..893d269f6384 100644
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
> +	has_manual_suspend =3D (lb_manual_suspend_ctrl(ec_dev, 1) !=3D -EINVAL);
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

--vbb82ZDnwpATQbIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaQPI4wAKCRBzbaomhzOw
whlyAQDI4hhncz2W9jDRg/A9M7GIAwRs/Co+1e51mSCoyrzMGQD/cMM+Pp8h+SjP
laY4QySVe9IcJ+HUE9Q0qpGZ65aJGAQ=
=pyYL
-----END PGP SIGNATURE-----

--vbb82ZDnwpATQbIz--
