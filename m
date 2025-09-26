Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15731E8337
	for <chrome-platform@lists.linux.dev>; Fri, 26 Sep 2025 21:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758922503; cv=none; b=MEll6cMckipkC0krhB+Z5CG2V/KUDhNCCBBkM8Ggw8UrA21/nquYPAM82dt8S1DpSYISkdio+MiKh9TBuyStJv+VwYy3sVn7Km7x3SQPYYs1DxxPla/l92VESCiCf3Qs2up+6eTUM5xYPGoPh9Mphmf/JXhMn3g48ZR8DGp/Wyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758922503; c=relaxed/simple;
	bh=CuhyMLcUTJVMoZM8X/pPFZcmKWe7ZzT8bRCR9N/QlQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAHiCjnZq03797d7Iav74eKgRkkbmpRdHiGfuTVBlE9H+SC8M+lNVZTRkeVFcxOyOxCHZWi1MqVun4FzhSzOjIpKu9QVJ2Iyz5CLZG6CbDeSsWXvKh0qnKfJRG+Rzza9VGlE11XiCNpnqXQG2xjmjDBwFSEjzAYWaePsNkA7DSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lRg3sUcu; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lRg3sUcu"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b5565f0488bso1889748a12.2
        for <chrome-platform@lists.linux.dev>; Fri, 26 Sep 2025 14:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758922501; x=1759527301; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEtNbUaDsC70pZbi6UNhEORE7Q8iZgqKHtWH7qzvc7E=;
        b=lRg3sUcuXciBA/2OKQMbKw6hd8DzUKiUB/8LEN5Pf1/R8ai3qZ1JaClpdBBqjKii7E
         NgJ1+Ynl2vnUa2bG7TDF/LAGZ/m9I9+6RS4WLEdu+L5P2wu6sDe2sEHE0/jSGRxRl0Ou
         YWJr4fSltES/HCykKJ8r4XPSj2yFdiOU0RoronJqe/3qkYJuPfjP6iyuwzvUmpP1X1lb
         e+a8nnOCrzWjCAyzGeLZWmbaPfFnruXu1OQWTRpQJCVp+w85r6kYV5fEe/bFqY4EsYez
         DMASpbcuiplUZ0YQpFNTDgj0m3EsdcwU5htE7NjFqnCTurUuOY0mRUZocIK1P/KOzZ0V
         H/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758922501; x=1759527301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEtNbUaDsC70pZbi6UNhEORE7Q8iZgqKHtWH7qzvc7E=;
        b=Jz/Z3ptLffmI/8h+WN3hncFUz/458WPfGj/PQRIhkdsaV8pgBsAuKb75cnQF2wXp+p
         QDDecRUeUBFCuyRbaRMKZsXkcKlbl15CcN8zmoFzEl3NEXjYH5Gkf/FJTVNwwrVCagIC
         lGpSnKmLs8LJI9LQv2eq5Fc09rgkRH0RpM+qWskGSmTzmnM0A2CKBsTjzr4mqXv2hZfB
         L+pNm+iHYVUfQ2IGYRIC9ir+t8HT3j1FnzsSDb4IBXcXaVymDDs/celXqeZhk3W5r0jH
         T0lBjXcORbsGrqgKYrHMwRt8pfWWX5G85Hbzu1FuoyOA/bGOTRbywA0eW9BY7RM2QcKv
         79aQ==
X-Forwarded-Encrypted: i=1; AJvYcCX32MkOUkxvJGqgU1XItzul3gjkhvEOdK7ZnwUZBjsDsoJP+fAKSBoYiOVRhE40NJi8rZjkxNdjbs6x1g9u2XA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVti6UgQEAVMeKThNJh+1XXKHU6eHg2GYT6zGNxq2foGg4A7Vy
	/e8v8X6Vh3+Mm4uclO5hHwHo9+bMuB34YuzFEoboPuIde1Ylr1RUHi+NwMTsepLY6A==
X-Gm-Gg: ASbGncuRF218p8K778ML6Bi+s/c8jK5Ng013feBb4LIJPWnB1QwQkB2q7pC1I06gzW/
	4j9KfHPLA5GJuyW9hJdS9tqsRhgqUXiFBMJSnL+Qg5gA2qg/kLuMcREdeUJ97BZMKA84UbKsK+W
	vND6SwkAPpZnf7jdDtMBUkDXAU6vN85Fp1djeV2Ldp+mhMQBJ2jqM0zQXXkPm9ix9PWWm1VaAH5
	59uEaa6RJda7+i+jU9CXp5c4IZjkPgLSUsybZY7Ob0Ww5a9harslk7ddTgweMmDF9bVl6H6RWBc
	RF0yjR3iiLI+jbwKu9esya4ZpOXgHsBaSOLJtldxKAduu+ewgrhtiO/y8AxYq0wuk4q39bslry3
	+RtmA6yb9JWTjJhfx3WzStbDCAuT9FcOlNKFeHH5ct/pX2VBoI47Wp15y/4XmRAfSeRKAKa59
X-Google-Smtp-Source: AGHT+IE0IQntdW0RMNRR6iYb0bv6GJIoHFJIwWi2tFa6+D4C0gs3Bm57aWR8mTol9EAr3NW5YEoP9A==
X-Received: by 2002:a17:90b:3d0d:b0:335:21bf:3b99 with SMTP id 98e67ed59e1d1-33521bf3e0dmr6035196a91.32.1758922500610;
        Fri, 26 Sep 2025 14:35:00 -0700 (PDT)
Received: from google.com (36.19.127.34.bc.googleusercontent.com. [34.127.19.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bda12eesm9634391a91.7.2025.09.26.14.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 14:34:59 -0700 (PDT)
Date: Fri, 26 Sep 2025 21:34:55 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, bleung@chromium.org,
	abhishekpandit@chromium.org, tzungbi@kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] platform/chrome: cros_usbpd_notify: defer probe when
 parent EC driver isn't ready
Message-ID: <aNcG_3_eBHX8Q0bl@google.com>
References: <20250926202234.3064386-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6AFJdRw8RKMCXLY7"
Content-Disposition: inline
In-Reply-To: <20250926202234.3064386-1-jthies@google.com>


--6AFJdRw8RKMCXLY7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Fri, Sep 26, 2025 at 08:22:34PM +0000, Jameson Thies wrote:
> The cros-usbpd-notify-acpi probe currently does not exit when it fails
> to get a pointer to the ChromeOS EC device. It is expected behavior on
> older devices, where GOOG0004 is not a parent of GOOG0003.
>=20
> Update the cros-usbpd-notify-acpi probe to check for a GOOG0004 parent
> fwnode. If the device has correct device hierarchy and fails to get an
> EC device pointer, defer the probe function.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/cros_usbpd_notify.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platfo=
rm/chrome/cros_usbpd_notify.c
> index 313d2bcd577b..2681bf9d0159 100644
> --- a/drivers/platform/chrome/cros_usbpd_notify.c
> +++ b/drivers/platform/chrome/cros_usbpd_notify.c
> @@ -6,6 +6,7 @@
>   */
> =20
>  #include <linux/acpi.h>
> +#include <linux/fwnode.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -15,6 +16,7 @@
>  #define DRV_NAME "cros-usbpd-notify"
>  #define DRV_NAME_PLAT_ACPI "cros-usbpd-notify-acpi"
>  #define ACPI_DRV_NAME "GOOG0003"
> +#define CREC_DRV_NAME "GOOG0004"
> =20
>  static BLOCKING_NOTIFIER_HEAD(cros_usbpd_notifier_list);
> =20
> @@ -98,8 +100,9 @@ static int cros_usbpd_notify_probe_acpi(struct platfor=
m_device *pdev)
>  {
>  	struct cros_usbpd_notify_data *pdnotify;
>  	struct device *dev =3D &pdev->dev;
> -	struct acpi_device *adev;
> +	struct acpi_device *adev, *parent_adev;
>  	struct cros_ec_device *ec_dev;
> +	struct fwnode_handle *parent_fwnode;
>  	acpi_status status;
> =20
>  	adev =3D ACPI_COMPANION(dev);
> @@ -114,8 +117,18 @@ static int cros_usbpd_notify_probe_acpi(struct platf=
orm_device *pdev)
>  		/*
>  		 * We continue even for older devices which don't have the
>  		 * correct device heirarchy, namely, GOOG0003 is a child
> -		 * of GOOG0004.
> +		 * of GOOG0004. If GOOG0003 is a child of GOOG0004 and we
> +		 * can't get a pointer to the Chrome EC device, defer the
> +		 * probe function.
>  		 */
> +		parent_fwnode =3D fwnode_call_ptr_op(dev->fwnode, get_parent);
> +		if (parent_fwnode) {
> +			parent_adev =3D to_acpi_device_node(parent_fwnode);
> +			if (parent_adev &&
> +			    acpi_dev_hid_match(parent_adev, CREC_DRV_NAME)) {
> +				return -EPROBE_DEFER;
> +			}
> +		}
>  		dev_warn(dev, "Couldn't get Chrome EC device pointer.\n");
>  	}
> =20
>=20
> base-commit: 48633acccf38d706d7b368400647bb9db9caf1ae
> --=20
> 2.51.0.618.g983fd99d29-goog
>=20

--6AFJdRw8RKMCXLY7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaNcG/wAKCRBzbaomhzOw
wm89AP9E/FYHxEtt1/NnX8XvJnCoxHEU2t9EDTS6TVAs90BjYQEA/kSSEDpTCdjE
EKAB+Yq3VhIcS2lR6wbkdfrXvSSVEwU=
=mcNw
-----END PGP SIGNATURE-----

--6AFJdRw8RKMCXLY7--
