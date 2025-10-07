Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0109C204F93
	for <chrome-platform@lists.linux.dev>; Tue,  7 Oct 2025 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759862156; cv=none; b=sPU7sbw2NOVfmJnSK7MlVvo7F9UyuF3V8N6OtdgdW1LicgfYQKdtGZ0FJeKk3owuJb/6iMgKH/WT7sw82c5GBT5n/MFfzLRaaKtYjP8BB6DHOGP8tASr05W1udDLNt0XALd7x6NbIsVbwx2jIvPbLKkCqPkzPyVhhcqnIXllZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759862156; c=relaxed/simple;
	bh=4JT/QULipmJSuak3v2YGIjJbR5SBESiMORm3G/f9XSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLk91Qb/GUbzRqi+mYMEuaby1igjFcHUpLhwwQ+QFDT1TBjOzMZZdw8XyT2+u/9+uSyGLz9LTZecEX5OM4rLMjf0f/7gc6qCOOLWTKSIPf10CcxFjJ2MYYxoAVmNiQj5qc44+u6Eqal5wk2/mfmg+PPT9ohASzitYv10hQxdQkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IVC6vdMG; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IVC6vdMG"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-780fc3b181aso3743217b3a.2
        for <chrome-platform@lists.linux.dev>; Tue, 07 Oct 2025 11:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759862154; x=1760466954; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7C2SoEPm9B9jK8sU90jS5ZDxJhsIg3KL3H032u/5uNQ=;
        b=IVC6vdMGCJQYmd0knMTwTX9ruQnI4Ng2bnj4c0IsFxtYYc7BEyFLJaYWJBEAhzyMCM
         oCbyaW1SqJkqdwZ0PfKfah2nsExEQ49LR/jbkI7//6GDLlI5x3iJ5kWy7O7ziA5uzVpv
         2/haJKHUkkV5ZUASz8ORALE4OkhIHxSgLDOiSl3n2yyzyPIRfHD5LKYu85Db7dvfqtpn
         k46Te/uB7+437ssA/iKhHdapxJD1d1D5vvONF+Rt59Z6Cy+OgP7S/lGSlrICwUo1FO3t
         KFEYnrREz/CFn5GaVjjZJbqmcQFbVQjrwC4bWLUenjuoXHL0Qv+Yvbgl+mzQZXpEycYV
         ZfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759862154; x=1760466954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7C2SoEPm9B9jK8sU90jS5ZDxJhsIg3KL3H032u/5uNQ=;
        b=MB6Dzv6yJcdKBR0PwOBFqe7/oeTKtYMr05PbcmZ1GkjS3I6tbJTzzbxqpgFaXp6xIz
         UJAW56u7U+d96yGxixeiwlFAdnD1ZROtXNGFBR8Yy5pyRE39JgwJO+o5e6WOlrT2nG50
         48IrKFmHzlgtyYvBvO7U3nattGIR3GpbUuR9DE/EVq7dU6O/ovQWW98gtyCyfI9aAZQt
         2i3H408hNz56IxB4+AlJNMpgjy0y3saHG6+JVMP0X9EEyykkCc5zHUGEVh7FxqDSGg6I
         oF7uY1dTem2BYXhrgxNxIEJ0QmJRnLl+Z/WpKxi9gFTr1g9BEa6kipts4SUifHxfngJX
         KfCg==
X-Forwarded-Encrypted: i=1; AJvYcCWYUZTsdfVHwP9nleTHEiR4H0sBff0spyvNPYj7BaWwLIXrvhozBOb611nriHpU95DCu1D+09hP1DHxVMw+aSY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKTg3Gzze73QX/AbU+BNDCNN9CZFv34cX9KvVlxRRY++KmZNeo
	TOgQqSqAgfq944tcVR7rJer8eSTr3HYV2KS32LpgyLyAu2B1GDDcdmgRIHZegRbOsQ==
X-Gm-Gg: ASbGncv4W7WxJRtf6JWdlkDesdTbCtYCz4giwSW7tvR90v2sKdv/r3aoekb/c/SXisK
	KKU3brnGehHlRxZ5IlsG0BlCU5rif2Smzo8Lh7VLNpeVMW/WJnMuzLiXDqRXKBNEOsz+43BgMN6
	XZ2SoPTfABhOOUjQDI58LOWkgF4Zz1ZPPF3mnBw/iwFY0jiQoeWz1l0UovzO8jnj/71gzyMbJGr
	AaFADWMvK/CGxmpoP64t5vH79Au3azPExLIj8u04ogtN57Bj/M/5zmlcP1JrfPdU7zS5EmQjgCi
	Agibx91bUVtZKsF0HJyrRS56KcLXy5jVhgsD+avw5JUdFElmEG+A7yPxHbKDGfwlmbFYz8E7bTz
	b0Hxm/pZNqa1ogPUPVplLloa7oyxx436eYT6Trt8rH4hllcbn+p5qz++AE21Q27eHG47Ab7dLTg
	LnvR3VvtWMRs49IYmberstJAKVWGLTPyQ=
X-Google-Smtp-Source: AGHT+IFR7pcMvNAZM4pc9ANqYSFpgUbp4tdFKKtCYXX8gVUIZT7dsSt6Ae5g7sCeSROI8LDmUD6EzQ==
X-Received: by 2002:a05:6a21:32a3:b0:303:b64b:e44 with SMTP id adf61e73a8af0-32da83e38bemr550247637.43.1759862153880;
        Tue, 07 Oct 2025 11:35:53 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b62ce55205csm13318218a12.18.2025.10.07.11.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:35:52 -0700 (PDT)
Date: Tue, 7 Oct 2025 18:35:49 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, bleung@chromium.org,
	abhishekpandit@chromium.org, tzungbi@kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/chrome: cros_usbpd_notify: defer probe when
 parent EC driver isn't ready
Message-ID: <aOVdhVEvbmO08sRO@google.com>
References: <20251007004043.4109957-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9nd5cbOCazPp9GCo"
Content-Disposition: inline
In-Reply-To: <20251007004043.4109957-1-jthies@google.com>


--9nd5cbOCazPp9GCo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

Minor nit, please provide a summary of differences since v1 below the --- in
the future.

On Tue, Oct 07, 2025 at 12:40:43AM +0000, Jameson Thies wrote:
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
> index 313d2bcd577b..c90174360004 100644
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
> +		parent_fwnode =3D fwnode_get_parent(dev->fwnode);
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

--9nd5cbOCazPp9GCo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOVdhQAKCRBzbaomhzOw
wpZdAP4+NwGYtyo6TrPhGDCmSHTaVNVV5YcF2Hukb49L7QrLxwEA/nxtp0oBH+KU
nGwgVvMvWyfD49Ls92gS8t2juKMUcg4=
=qeKA
-----END PGP SIGNATURE-----

--9nd5cbOCazPp9GCo--
