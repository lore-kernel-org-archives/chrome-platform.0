Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB13921323B
	for <chrome-platform@lists.linux.dev>; Tue,  4 Feb 2025 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679666; cv=none; b=RRtbCWRHQt9YdanzmbdcJPwEF79TUtoHdXMV8YmAyGpiOvCbxWBrnzAJET1Ec1v5wtiP1RkBR8Z+ce1XzJ8VER3raXfD13HqEH2NilANeIH8eXO0mhkZcVgOFAz9m56cwTwKnECSnHuQYwdAktUIWxepZZttXWGBKvowDpM6uHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679666; c=relaxed/simple;
	bh=nkmIb6gcYyVx/3Djk3nNOz89r23xu2R1V/QjE/EEIwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITjPzdI31MjOgHXkKsvg3iUITTotIGqXd4qH37JqcCI2URx4LAnLdR/dtocd2uSHN17tiNPIfLmd+PbrxDM2z5I9xTrSKGo/YN9yx9BlVtvc4bVpYzsSthviZZFgMXnZQpgYLFwNy56olcTqY+1jKm/DtuIqwx5bEDYLXQkfWeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NtfbcJpN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NtfbcJpN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21634338cfdso40248545ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 04 Feb 2025 06:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738679664; x=1739284464; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rXBnAvLX+ryoogexm0ZNIasCmV+KVvCRmhOSBuvjXgQ=;
        b=NtfbcJpNcPFyZiKsyDEu4Y9wmjMVpi8Qr8moZp4RjS3xaosOYVWTWldsidpjJz1YCl
         d/wz7eNSAVoZOk+GCcnEEn0mAvrXU5x1VOeRjyOkfy+UBZDjk8pxcJnl0t+rN2fXIeap
         wHMsmAE8y9d5HUTXTRxnzp1+oQgudHO8oBGT5jlqdi4zS2VEa3sCCr7h4uSW9+BXiI7e
         Rzkd2cIVgYygStVT1pdnSzu4bZW0q8ca9zC2xLc+RSFPmwKVPcrotnzItmuEsH+pUsRe
         R2aaAXXj7T6Pp1fGSqUIXjRM/L67x+409/EWKMI/pkreVhZEyRqw3hX3aJ8aju5WnIbO
         kYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679664; x=1739284464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXBnAvLX+ryoogexm0ZNIasCmV+KVvCRmhOSBuvjXgQ=;
        b=I+DRq2ROLN0aWuCYb2Q4995aDx9nDENVm3ANWDcLv7FSIfGTkx+3KBiF+atT/2Pa89
         3u/jIhJur7lZl+jQrn9TlX262Jg0UKSSHydZGthbDlw7SHV1nIBPKwxsTzuYATTrAK71
         YyNwGaqFWYwpRSkzZwaB1toMZCqnXeTNAiwuI8HFvgK5c8nMotl18Nv7iBXfltt/L4Dh
         9Kl2LrLpA46FD/gEil31i8eAKsGJnl7HMObe0cAQEKKHPqwJIOGSsW4Mkq0DAjMHoIGs
         QuYcJg94IpbmS+omeXbLf6d9tyZWdtRDo7RgX6+0I7UxBgJQjU33Wcz97eng4vJ472Ph
         temQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxyGOWdV8hG9uSdk8/OhphEUvWfPosNNQa3WHydxItlB6Erk8K6rSN9FoAbfdsDTBuMFJ7ywhz/ODuT1jVp8Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvhM5IYEDHdpo4JH1Ww+kWetUz9IFuI/i6Cmbshj3TM1GFSuBm
	cEi7gVU97ANwDbw4ubekKky36EVICk9kndSl/9wWNqFG6eGs3FXU3zj/FNjIlSX5gHyanXiMdXO
	Kaw==
X-Gm-Gg: ASbGnctGF6o6dygBKw4MGHBSvh0SxD6kTxani+24LtKztlLRLTzmvH66kXRpApQBlRE
	C19Lrq/Re+hHC57W0G9bHOvjK4Hc+tX/nj5EG+Y5z+buG7MtjuJchqAnG269LFbXCeFEu1C/+5O
	yyPGidtX4zUFkBfHvtsjAUlyT0yrV0nyyxQOe0hXiXlS1asqm2QV5uXukR2sAj/y81cUI6Q5bAO
	p6sCwTXx2X4Kt7PhTSgdy8Xbv0O2rthyrBWTWkfDOBOHTPZyAeKfiKHu8t/eiGR9s+gZtlzewlH
	PgRKco1Dr9eFB5bWqadtd3+vB1BjgAsK7KjayGmg9kuUsCF5
X-Google-Smtp-Source: AGHT+IGbmxeYbuSf4UFOcHr1yWL53zmkYtj0nTTb0gGeRj7tw8tZqugXM9pf8gJeuVWCt7aVFIhFpg==
X-Received: by 2002:a05:6a00:ad8d:b0:72d:2444:da2d with SMTP id d2e1a72fcca58-72fd0bfa867mr35103510b3a.9.1738679663479;
        Tue, 04 Feb 2025 06:34:23 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69b9cb5sm10859616b3a.107.2025.02.04.06.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:34:22 -0800 (PST)
Date: Tue, 4 Feb 2025 14:34:18 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: ukaszb@chromium.org, tzungbi@kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	dmitry.baryshkov@linaro.org, abhishekpandit@chromium.org,
	akuchynski@chromium.org
Subject: Re: [PATCH v1 2/2] usb: typec: ucsi: resume work after EC init
Message-ID: <Z6Ilasq-FdKlfsYx@google.com>
References: <20250204024600.4138776-1-jthies@google.com>
 <20250204024600.4138776-3-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RwNGK21nKrpya7o2"
Content-Disposition: inline
In-Reply-To: <20250204024600.4138776-3-jthies@google.com>


--RwNGK21nKrpya7o2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Tue, Feb 04, 2025 at 02:45:59AM +0000, Jameson Thies wrote:
> A manual EC sysjump will restart the PPM and break communication with
> the UCSI driver by disabling notifications in the initial PPM state.
> Update cros_ec_ucsi to listen for PPM init events and treat them as a
> system resume to re-establish communication with the PPM (ChromeOS EC).
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index c605c8616726..5f17fcbda059 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -205,12 +205,19 @@ static int cros_ucsi_event(struct notifier_block *n=
b,
>  {
>  	struct cros_ucsi_data *udata =3D container_of(nb, struct cros_ucsi_data=
, nb);
> =20
> -	if (!(host_event & PD_EVENT_PPM))
> -		return NOTIFY_OK;
> +	if (host_event & PD_EVENT_INIT) {
> +		/* Late init event received from ChromeOS EC. Treat this as a
> +		 * system resume to re-enable communication with the PPM.
> +		 */
> +		dev_dbg(udata->dev, "Late PD init received\n");
> +		ucsi_resume(udata->ucsi);
> +	}
> =20
> -	dev_dbg(udata->dev, "UCSI notification received\n");
> -	flush_work(&udata->work);
> -	schedule_work(&udata->work);
> +	if (host_event & PD_EVENT_PPM) {
> +		dev_dbg(udata->dev, "UCSI notification received\n");
> +		flush_work(&udata->work);
> +		schedule_work(&udata->work);
> +	}
> =20
>  	return NOTIFY_OK;
>  }
> --=20
> 2.48.1.362.g079036d154-goog
>=20

--RwNGK21nKrpya7o2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ6IlagAKCRBzbaomhzOw
wsAOAP9KwEvwMM4veP7t/EEWT3nOr5yfNc4lDarAH4iwqV80RwEA7MMH1Rgjl5m7
yTBLmkCapqpKmyZDXJcwWYAq381pmAM=
=4d2D
-----END PGP SIGNATURE-----

--RwNGK21nKrpya7o2--
