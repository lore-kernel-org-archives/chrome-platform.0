Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6495218EFD1
	for <chrome-platform@lists.linux.dev>; Tue, 25 Nov 2025 00:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764030031; cv=none; b=Rlfr1F2aRiBlwD4rxeosvAAj6m01iK7rGg0zUZZYB2qp93v+Ky2sDkBqeo1PH6fxM141g9XtYQJd5Kn+C7W2LoIrS4ZSIij1gUvYJwkJfK/yWsanoJhNIxhit1di5DTdD7FzCIY4uSr8UMujCSmzK3USBvhM9WpIULQ2waF+6sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764030031; c=relaxed/simple;
	bh=t4r7jmeIwiXR7uP9kXz0A+chP9tNeXQGYI8lqGYMM30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZ1Fum4V7/lpBO0sXLcuvbmzO+3wR9zmLFncrdqdh9PWHcIYSXZx6hyZ+S0PchlLubsPzO4IEDTRiC3YgS1rcZKHw95fkiJcnKqiQwsz1nSPuVROJk9wbYXf4mcNevN0NzK5rU/KQ+ujOlNhGzMXulpAPZ24AEj5M2Q4jCPluuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dnB40JKH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dnB40JKH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-298456bb53aso61565335ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 16:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764030029; x=1764634829; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKiIQNBIFj3XpDlrxQGdfdvj6eMXs/LlHefgD1OOL0U=;
        b=dnB40JKHR7B8Ks+it4Sa7486rppxIqkyCj68wEg+1Se/Mwox/XB4VfqjFXAYZaJj5o
         x6J6aBeqQCiSrow3FZTo0mYltSzDoXFziqNOXgn6GfQ4UYhb/FjDJ2lvo6iQs54u1W32
         8B00frYGf6nOwKpvtwOCJz8ubcSMWBrtEPCG89bjLSwk/4VC5/oAdBdEZ80ZxoJHtFwG
         EFdEZjf6mgIqH4JUwrfiBJd7X16ypwcMcDsLXEFRCtcdWWq6SsgBwgcxmy3iFU/PjhCK
         oCBV9Ss9H0G1NMf6u7xLIbcfNyMqgfPjYCJufImoYnd1Jl3aA8BvhjuioZxSugHfC9vu
         uH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764030029; x=1764634829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKiIQNBIFj3XpDlrxQGdfdvj6eMXs/LlHefgD1OOL0U=;
        b=hae3ASd+cfk5q5jLs4JjTvqM1b09sXcAsxWQ4SnLdENsh94/8XAFEUao3LIFq2HW2M
         MpjXgK5dC0UPCSYVnDHKcrchz8Crpg4l0gM1lgk6ELZBHEoxSj6peuSobxz633E9hgMA
         rVc8TODpPRqP/gSPKUWqQQc9zxALMP32qB66XtfjJzzl5jk8qfjrfXIa5PeBEbwK0cF1
         36sIQPRWn0qqn6p3UM4p24CrDErJcrkG4UejRJziD4gYtdGi+UZRAq+Zw/5DvWmv6+KR
         LfAhp3//r61QaNApS/A31W+mr5dv8fL/mEligMJ7Q6WO8We8B8X8nga5Gte99jEkL8q2
         InGg==
X-Forwarded-Encrypted: i=1; AJvYcCW+vxXWxTuRf4iVcjsbC1+2xOUNuhB/OczofpFRSE4TLbLfd4n0OtLs/Y34bfYA5WjluS15AY3XwOedXQwTsFI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDnR+/FlUnn9U/jLOjN1/I14BGpT1LK0kftCxKi63a97rHndof
	VizKzmk/XuePh0VDRZyAbkl9wsStbUjcLE+Xie7fDuw2p3LDmGeZP8eTC2i62zvJ9Q==
X-Gm-Gg: ASbGncvDeF6oKr/SGPC/C9iAffpUUw0Do7Yu0M/5ynmFDeE6TauJ4SrL0KKr6+q3Reg
	M7chcRDx8smPuT9ZcR2YdZ1nosCM11xTO1WGTDNByLmv0EdXzD+TAyAtPcuDGzriY0jaahn7+QL
	ueB2/BYjFozAE7XkAA/pQoerwo8IIxKOyJfXxbbZHzwMVQU4EjOKPg1Sgw9KBIBo4YpJzCzAbZR
	c+P/x+xDuvuLUIF1NOEY53M0G1BrJah6W9VMATNB9N05p/8NGzSCJYwQFVKTsLoaPscbSl9Jd5/
	RQALzoIgRMtAJtKJH7wTf1Erpz912cIaHLM0Ohq9QgFyRsr1XDCwfbvhX1Yop4izGXcC+GjobV4
	fSgfY6uJUNMOVKqZimuGzz0P3ZH3eLveoTmffXUr4c7DOGp5/GMpqWhK5e83Fyw6LX214r6E7bt
	YrK+w7WLKkdMrhfhel4hd+JUqO9RJnrYvKdTVG5bS1ludVY1oIpA0x6l0=
X-Google-Smtp-Source: AGHT+IGDYsNsGZwIu4ltamYCleJnMoAmy+tNHW0XfaQO+7UUVPvCkzBT5sV+yAlt4K8NKohqKMNe8Q==
X-Received: by 2002:a17:902:f706:b0:295:7f1d:b02d with SMTP id d9443c01a7336-29b6c50eaa9mr142998705ad.22.1764030028255;
        Mon, 24 Nov 2025 16:20:28 -0800 (PST)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727a36bbfsm14706794a91.0.2025.11.24.16.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 16:20:26 -0800 (PST)
Date: Tue, 25 Nov 2025 00:20:23 +0000
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
Subject: Re: [PATCH v5 4/4] usb: typec: Expose alternate mode priority via
 sysfs
Message-ID: <aST2RyOIjHiTv6J3@google.com>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
 <20251124124639.1101335-5-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PRHLhYo6a0QDr1AR"
Content-Disposition: inline
In-Reply-To: <20251124124639.1101335-5-akuchynski@chromium.org>


--PRHLhYo6a0QDr1AR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 12:46:39PM +0000, Andrei Kuchynski wrote:
> This patch introduces a priority sysfs attribute to the USB Type-C
> alternate mode port interface. This new attribute allows user-space to
> configure the numeric priority of alternate modes managing their preferred
> order of operation. If a new priority value conflicts with an existing
> mode's priority, the priorities of the conflicting mode and all subsequent
> modes are automatically incremented to ensure uniqueness.
>=20
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  Documentation/ABI/testing/sysfs-class-typec | 11 +++
>  drivers/usb/typec/class.c                   | 90 ++++++++++++++++++++-
>  include/linux/usb/typec_altmode.h           |  1 +
>  3 files changed, 101 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/=
ABI/testing/sysfs-class-typec
> index 38e101c17a00..737b76828b50 100644
> --- a/Documentation/ABI/testing/sysfs-class-typec
> +++ b/Documentation/ABI/testing/sysfs-class-typec
> @@ -162,6 +162,17 @@ Description:	Lists the supported USB Modes. The defa=
ult USB mode that is used
>  		- usb3 (USB 3.2)
>  		- usb4 (USB4)
> =20
> +What:		/sys/class/typec/<port>/<alt-mode>/priority
> +Date:		July 2025
> +Contact:	Andrei Kuchynski <akuchynski@chromium.org>
> +Description:
> +		Displays and allows setting the priority for a specific alternate mode.
> +		The priority is an integer in the range 0-255. A lower numerical value
> +		indicates a higher priority (0 is the highest).
> +		If the new value is already in use by another mode, the priority of the
> +		conflicting mode and any subsequent modes will be incremented until th=
ey
> +		are all unique.
> +
>  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
> =20
>  What:		/sys/class/typec/<port>-partner/accessory_mode
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index a5327e444265..049d1829be98 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -445,11 +445,88 @@ svid_show(struct device *dev, struct device_attribu=
te *attr, char *buf)
>  }
>  static DEVICE_ATTR_RO(svid);
> =20
> +static int increment_duplicated_priority(struct device *dev, void *data)
> +{
> +	if (is_typec_altmode(dev)) {
> +		struct typec_altmode **alt_target =3D (struct typec_altmode **)data;
> +		struct typec_altmode *alt =3D to_typec_altmode(dev);
> +
> +		if (alt !=3D *alt_target && alt->priority =3D=3D (*alt_target)->priori=
ty) {
> +			alt->priority++;
> +			*alt_target =3D alt;
> +			return 1;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int find_duplicated_priority(struct device *dev, void *data)
> +{
> +	if (is_typec_altmode(dev)) {
> +		struct typec_altmode **alt_target =3D (struct typec_altmode **)data;
> +		struct typec_altmode *alt =3D to_typec_altmode(dev);
> +
> +		if (alt !=3D *alt_target && alt->priority =3D=3D (*alt_target)->priori=
ty)
> +			return 1;
> +	}
> +	return 0;
> +}
> +
> +static int typec_mode_set_priority(struct typec_altmode *alt, const u8 p=
riority)
> +{
> +	struct typec_port *port =3D to_typec_port(alt->dev.parent);
> +	const u8 old_priority =3D alt->priority;
> +	int res =3D 1;
> +
> +	alt->priority =3D priority;
> +	while (res) {
> +		res =3D device_for_each_child(&port->dev, &alt, find_duplicated_priori=
ty);
> +		if (res) {
> +			alt->priority++;
> +			if (alt->priority =3D=3D 0) {
> +				alt->priority =3D old_priority;
> +				return -EOVERFLOW;
> +			}
> +		}
> +	}
> +
> +	res =3D 1;
> +	alt->priority =3D priority;
> +	while (res)
> +		res =3D device_for_each_child(&port->dev, &alt,
> +				increment_duplicated_priority);
> +
> +	return 0;
> +}
> +
> +static ssize_t priority_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t size)
> +{
> +	u8 val;
> +	int err =3D kstrtou8(buf, 10, &val);
> +
> +	if (!err)
> +		err =3D typec_mode_set_priority(to_typec_altmode(dev), val);
> +
> +	if (!err)
> +		return size;
> +	return err;
> +}
> +
> +static ssize_t priority_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", to_typec_altmode(dev)->priority);
> +}
> +static DEVICE_ATTR_RW(priority);
> +
>  static struct attribute *typec_altmode_attrs[] =3D {
>  	&dev_attr_active.attr,
>  	&dev_attr_mode.attr,
>  	&dev_attr_svid.attr,
>  	&dev_attr_vdo.attr,
> +	&dev_attr_priority.attr,
>  	NULL
>  };
> =20
> @@ -459,11 +536,15 @@ static umode_t typec_altmode_attr_is_visible(struct=
 kobject *kobj,
>  	struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj));
>  	struct typec_port *port =3D typec_altmode2port(adev);
> =20
> -	if (attr =3D=3D &dev_attr_active.attr)
> +	if (attr =3D=3D &dev_attr_active.attr) {
>  		if (!is_typec_port(adev->dev.parent)) {
>  			if (!port->mode_control || !adev->ops || !adev->ops->activate)
>  				return 0444;
>  		}
> +	} else if (attr =3D=3D &dev_attr_priority.attr) {
> +		if (!is_typec_port(adev->dev.parent) || !port->mode_control)
> +			return 0;
> +	}
> =20
>  	return attr->mode;
>  }
> @@ -2484,6 +2565,7 @@ typec_port_register_altmode(struct typec_port *port,
>  	struct typec_altmode *adev;
>  	struct typec_mux *mux;
>  	struct typec_retimer *retimer;
> +	int ret;
> =20
>  	mux =3D typec_mux_get(&port->dev);
>  	if (IS_ERR(mux))
> @@ -2502,6 +2584,12 @@ typec_port_register_altmode(struct typec_port *por=
t,
>  	} else {
>  		to_altmode(adev)->mux =3D mux;
>  		to_altmode(adev)->retimer =3D retimer;
> +
> +		ret =3D typec_mode_set_priority(adev, 0);
> +		if (ret) {
> +			typec_unregister_altmode(adev);
> +			return ERR_PTR(ret);
> +		}
>  	}
> =20
>  	return adev;
> diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_=
altmode.h
> index f7db3bd4c90e..2c3b6bec2eca 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -28,6 +28,7 @@ struct typec_altmode {
>  	int				mode;
>  	u32				vdo;
>  	unsigned int			active:1;
> +	u8				priority;
> =20
>  	char				*desc;
>  	const struct typec_altmode_ops	*ops;
> --=20
> 2.52.0.rc2.455.g230fcf2819-goog
>=20

--PRHLhYo6a0QDr1AR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaST2RwAKCRBzbaomhzOw
wnRnAQCjwa0q7CdVmOeRFQA1UGaN+cYQsOaeJZpLNsTtC46T2AD/QQ9UC3NwUqp8
tCwLd6MXxidHtGCxVcDu+BxYqOjwkgc=
=1A1B
-----END PGP SIGNATURE-----

--PRHLhYo6a0QDr1AR--
