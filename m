Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996231CD15
	for <chrome-platform@lists.linux.dev>; Tue, 25 Nov 2025 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764029630; cv=none; b=Ypig2LNVBjAe24GJgwXieoJZyVJI4T6K/hCNK/129jB+fNgJ46VJhPa5ycTPs2iID2GlX+mOpP26K8c+jfWDQ0FnjyVZ405fkv+0bKHLoAmgdveIDYtOTtvx0GZBYYKEnm5TOESpFjpeu4k3ylnBoCN9srRHaxTVTt7EVfqGmS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764029630; c=relaxed/simple;
	bh=gRzVQa8IVbeE/BIBpTVfPatwgFtyMI6IyU5NqB8p9uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Emfkc25UmJ4SvnFb44eQyM1fYrqNlgKbY15yfOidUV4ZZenuC2z3i/Y7OP023g9jZmkFAGzhJ9HgJzGbWzcpCKDaXz9mhm+AoxjbB/noomxeWiT7plgbFu+QKzAg6LrUuQxDQqmS0x6MFcV4CLcMtA52NQgFqhhNwpSVtXL+gNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xWAU/Yws; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xWAU/Yws"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso3956808a91.2
        for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 16:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764029627; x=1764634427; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YhWYyo5D4/dh4SDt0h6HiWezG31XdYLPCdnS+Z5TsGA=;
        b=xWAU/Yws4dbETQ/0O/Sz3jrNPJJlvDVZvNxWCvqxg24/tJ4vZInDcspvCLcsDXhc0p
         XHdn0HCaVrFxuipw1ZMwxFr3fJ4ZhCBxhbX/7EB7OxFmENe0lV4z0OzPYJ/wvjo/SxbH
         n710WoIphtBF59Ew+/OkZyDQE41Fv9+j2xC5FbioaTwIQ+y/I8l0LD8Ka7VTzHhiuo52
         djV+FFW5qJbOM1UOyGiKAKnzRhwaN+iPoEZaG2X7X9YW8oZRCQ9KnTH65kXE4F23aTDl
         0KaKOSL6IjdBg/3yILjqy1Mvw6SICKMqnVk0LFfsB3Aq02STntrkyOYOTqArGPixN+SD
         MrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764029627; x=1764634427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhWYyo5D4/dh4SDt0h6HiWezG31XdYLPCdnS+Z5TsGA=;
        b=UM+5V/q8T0hsuXOHt6YoWlo6uk9+5C6+AiqXK/YGewySK5b9ap4VeqLBOj3Z3dSoOV
         Dw/K3fBll3ljd6JWubMfAe0A1vyFC2ykGb7sPoEwNzh9ARc1kGXffDCGmVLbGVcQbzlg
         ab7i20Cd7Cch7VlIkcKTD6dUQso0QniIPm6raw+Yo+sC8VItyZzPG1OeBdog0XWcfDNH
         ivNWeqjeGpxe3aDV9Gk210bmh/Awa4JBQEGZ4xdAnKJsD4LYhszeB9MK0w5YUh2zgvMQ
         OZzMP1mdFHf2EmCqMjxAkL19qU7+MkHKMz1ymjDn0CtWdUuWSlccfwucHwSZKcr+Bmyq
         Wktw==
X-Forwarded-Encrypted: i=1; AJvYcCWVUidlEWqyixT1awZ/R4HFAS9OWRIo5UIylj1tl303wlRgL0UqMqi+sM8QFWdihBM3HBu3YMIvREKvmhflV0U=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrzlsc50eUFt9WYjRFs6fjS2zWAj7dl816Ta6bqLqO/Q3Su/Dy
	27ogzGl5vXWuOdrDR156SIo3xYzsaSodLJ1qHxI/OM0kjlaHVRVp87oWzjeSvxARYg==
X-Gm-Gg: ASbGncsqcsDiKM8Zbx1FFuXrjjn67pVu7iPeTOuPEcbDWqXX1Ch8qLp/XNRf0PL/pE6
	1/EQiBmQ0HWYH83lOAFQd3UjQNEJbkZhZVp3w7JO8ZXjYSotXGhN0E82JO9IGavN63VZYZbAMsP
	1T29JBlEjJgzxHw4ZGgkuJfNoUhKGDTDfbEza0CR16OSPueMP4nq41W4xGx9mtIUNfQ6sgLVeww
	nx1IoTtWgA0n1NmFIOI8kykATndfFb21fVQ+5NhIH54awXiV3O+PB3Hfc/8SVsua1YH/sRx5Zdp
	G53Uq5/GRIbd3Y3J3rIGMZYlnjtXyuAwKURh54h1Nj2N9PEOfxGlFEjh1N2bUQHykDHrksKaXBu
	3eRWwj8qGmi/hTWWoz6zNBmv5nEFn/2m82T23gJSP36y+sKg1mI7KAieoz5WYjoD2icFP3IsmId
	IYyo02on2qndUSN1XHC5KgtzoZJcbcLd2f/sPLx3K2L/t2
X-Google-Smtp-Source: AGHT+IFcZkGFuY/+13Asuxe6Rkfxx3Lh350rBOGyPACyZGK4zGjjhSOeQx6OGjqSoKhnKWlQZCmWrQ==
X-Received: by 2002:a17:90b:5404:b0:32e:87fa:d975 with SMTP id 98e67ed59e1d1-3475ed7d8a1mr659726a91.34.1764029626432;
        Mon, 24 Nov 2025 16:13:46 -0800 (PST)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-347447d32aasm7632740a91.2.2025.11.24.16.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 16:13:44 -0800 (PST)
Date: Tue, 25 Nov 2025 00:13:41 +0000
From: Benson Leung <bleung@google.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] usb: typec: Add mode_control field to port
 property
Message-ID: <aST0tXPULUBWSzPU@google.com>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
 <20251124124639.1101335-2-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IZXYd/uVQB8DWaEB"
Content-Disposition: inline
In-Reply-To: <20251124124639.1101335-2-akuchynski@chromium.org>


--IZXYd/uVQB8DWaEB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrei,

On Mon, Nov 24, 2025 at 12:46:36PM +0000, Andrei Kuchynski wrote:
> This new field in the port properties dictates whether the Platform Policy
> Manager (PPM) allows the OS Policy Manager (OPM) to change the currently
> active, negotiated alternate mode.
>=20
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/class.c | 9 ++++++---
>  drivers/usb/typec/class.h | 1 +
>  include/linux/usb/typec.h | 2 ++
>  3 files changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 9b2647cb199b..a5327e444265 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -457,11 +457,13 @@ static umode_t typec_altmode_attr_is_visible(struct=
 kobject *kobj,
>  					     struct attribute *attr, int n)
>  {
>  	struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj));
> +	struct typec_port *port =3D typec_altmode2port(adev);
> =20
>  	if (attr =3D=3D &dev_attr_active.attr)
> -		if (!is_typec_port(adev->dev.parent) &&
> -		    (!adev->ops || !adev->ops->activate))
> -			return 0444;
> +		if (!is_typec_port(adev->dev.parent)) {
> +			if (!port->mode_control || !adev->ops || !adev->ops->activate)
> +				return 0444;
> +		}
> =20
>  	return attr->mode;
>  }
> @@ -2694,6 +2696,7 @@ struct typec_port *typec_register_port(struct devic=
e *parent,
>  	}
> =20
>  	port->pd =3D cap->pd;
> +	port->mode_control =3D !cap->no_mode_control;
> =20
>  	ret =3D device_add(&port->dev);
>  	if (ret) {
> diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> index db2fe96c48ff..2e89a83c2eb7 100644
> --- a/drivers/usb/typec/class.h
> +++ b/drivers/usb/typec/class.h
> @@ -62,6 +62,7 @@ struct typec_port {
>  	struct mutex			partner_link_lock;
> =20
>  	enum typec_orientation		orientation;
> +	bool				mode_control;
>  	struct typec_switch		*sw;
>  	struct typec_mux		*mux;
>  	struct typec_retimer		*retimer;
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 309251572e2e..59d5fd7e4ff4 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -287,6 +287,7 @@ enum usb_pd_svdm_ver {
>   * @prefer_role: Initial role preference (DRP ports).
>   * @accessory: Supported Accessory Modes
>   * @usb_capability: Supported USB Modes
> + * @no_mode_control: Ability to manage Alternate Modes
>   * @fwnode: Optional fwnode of the port
>   * @driver_data: Private pointer for driver specific info
>   * @pd: Optional USB Power Delivery Support
> @@ -304,6 +305,7 @@ struct typec_capability {
>  	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
>  	unsigned int		orientation_aware:1;
>  	u8			usb_capability;
> +	bool			no_mode_control;
> =20
>  	struct fwnode_handle	*fwnode;
>  	void			*driver_data;
> --=20
> 2.52.0.rc2.455.g230fcf2819-goog
>=20

--IZXYd/uVQB8DWaEB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaST0tQAKCRBzbaomhzOw
wvAyAPsFTPOAmywnQb75krUo1aYVq4PgmKWzLzFN3HTOaNgQyAD/c/c/9MpVPVBM
qAob6yGyNUn/I13r6tOOfZsRtvj2ZgA=
=mJq0
-----END PGP SIGNATURE-----

--IZXYd/uVQB8DWaEB--
