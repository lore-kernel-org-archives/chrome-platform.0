Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0593C062A
	for <chrome-platform@lists.linux.dev>; Tue,  5 May 2026 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778003255; cv=none; b=J+Ofj8vXjJLFVsDNkglz1tGwE1cK8MiZdcEqsx9rIr3q3NFl+SFLWf/F5tkPamuhRxFBheHMxs290Un4ZoAkIN3hFaPWwGuokYWbzG1jUaSb1VV+BXwyLMlC3362HO6fDKk4Vtt5koa9ECRa4/qixNxXwYebWjbZt+wjYCIyokA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778003255; c=relaxed/simple;
	bh=lwsN6Ij/KA7Fw1q7jKImkYdqw44KrNH+364KKSge1SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiwqu1kDVHs/m0UtQCp237wShdRE7d+8/qo7l5DtCFP+GDuXChSM+HyRBG7qp89VmC8jolwEuccaDB3Ya1M95Pn4eNQZzba1a7BtI1M2dZ6QKmvHCW/xZaLUc4webFolnOziWICK6zjABkzsPTGuaIwLKtMoVXYg4nbn3EH+wE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QPgN3VWj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QPgN3VWj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8367df48711so1226574b3a.1
        for <chrome-platform@lists.linux.dev>; Tue, 05 May 2026 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778003254; x=1778608054; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jgpomHj2+eyNGfRuF2OuoOdQ3+F2BeBzWU4tDvGhfTU=;
        b=QPgN3VWjjZwwA/uByq0kldxy9D7NMUSoYf5x4zSNVZR7KcCj6IdQwGja5MAPyH8wNk
         hcyw1ah6Z44gFlRZ1agsIox/t4FwGBXGCAPHjIZY8RKhUwbPH5M3iaILsHV5biKSot36
         Gyg/GMXZBd48RUixyRaF6l/8JmkoW15jtVrCs3Ins60EaIzTHAaWj7sZh2t0mfiQ1GsA
         ZP8i84v/rNCvIIuwuxPG90vvghFESZRH2BCzLjq1pHDKZIWQ3qRIJXMPLOmPbI4o36Nc
         bRbIL78RFapNgGi/Z/5nZsMidqk5hwpjRbECLXrx59LPsuqwnPfOwRizuN5Po/s3S4rs
         QcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778003254; x=1778608054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgpomHj2+eyNGfRuF2OuoOdQ3+F2BeBzWU4tDvGhfTU=;
        b=k2JHRTlzu7pQjEQvIF4GLsTGVABLt6RBRXOBmD5rPY4TpNYwCpIaheloaSvFJ7SgrT
         4RMi2Cr3Jns+hW5QdATnHtxA6ykuW6aKv6MTAxX6Y1ue4YNPPYQ9M3pMU4kxo3FqZuDT
         sqVCC7egPy0T0xBI6IOXnuj35v5n95TdoEIpMQn1AYn+joqoGlfH7mkWP354ncPrS/Sc
         eWoM3vbDEVKJle3q69fY12wjgy1Cc+2vFMIxPshmKryTEGFTOzbuQddihc9v887NaBow
         tLfMJTnp2GHFswql0jM4SUwQWXy29e15nrelJl5myw66SMxJqpALMDV5vjm+grW1AGQ0
         YHhA==
X-Forwarded-Encrypted: i=1; AFNElJ8XVKAPYYzoTvIO0agzTpx1ecYRWucgmyLGO4iUcz7cVJxS52Va5HCYZwm7+oheKzNWFt+Wk8yJokJXBtjjPYg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZwpS2/RmEf5QaG3alnoxaTTcsKPYaat4TckMEu04e6p52qTGk
	4RvoyUZJsIFq25uecvTUigtrTcdkgLjifgVSSOHt3Aq6JcEx0O32EmhQHD/x1eivyg==
X-Gm-Gg: AeBDiesWYvLFa+HgA8Z6ftISArJptAY+PU0tFlM9pwoz7MOM+hTAzQFZ9o+gRqzO5AT
	uQQP8ADl75diLRrCrM29nqgQ6ndb5B3PBNFn68djtBYrAzEN6muz9Aqpi2KjO5gpqFR2JIG9hWd
	l7GOBiazkba12eh5QxqnWaOeTgbwS9ilDWzMpISU2i2LuZ4nRUhEGRGApxepK/7l7KvXiHvZi2J
	D9D9lTLxpm0GLqqBcuvjckjBw/55+pop2d//lP3s03ZSw6C7e1R5ADxDwA9eRfZDj/a5AJt/Uih
	gAJsqxKATrNbjxJ7QEArCkSdz/aoa1AjiPtOWm7YB2qRQNKURuKwS5vVDidxocJ0AOtO6lQKwuC
	Xal6Jitt/MYDUQELQN+/IKNKoW0gMOblo7VDich9WHgEo9kRSJ0NHUZxE1+IZUrQCCV/H/gtAQR
	Oh/TuQdn9BII4pdRJHDwSHXmTIpzR3UuHVSf01xpPx4Avy3cIjHx2RXjWeJBOl8t7ppf0k8/47E
	aP1Qw==
X-Received: by 2002:a05:6a00:987:b0:82f:98c:1465 with SMTP id d2e1a72fcca58-83923e981dfmr4030032b3a.27.1778003253088;
        Tue, 05 May 2026 10:47:33 -0700 (PDT)
Received: from google.com (51.86.127.34.bc.googleusercontent.com. [34.127.86.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm2840483b3a.38.2026.05.05.10.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:47:31 -0700 (PDT)
Date: Tue, 5 May 2026 17:47:28 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Init mutex in
 Thunderbolt registration
Message-ID: <afotMJqvwYevy6U-@google.com>
References: <20260505053403.3335740-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="89axrARWOPcEMaPt"
Content-Disposition: inline
In-Reply-To: <20260505053403.3335740-1-tzungbi@kernel.org>


--89axrARWOPcEMaPt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 05:34:03AM +0000, Tzung-Bi Shih wrote:
> cros_typec_register_thunderbolt() missed initializing the `adata->lock`
> mutex.  This leads to a NULL dereference when the mutex is later
> acquired (e.g. in cros_typec_altmode_work()).
>=20
> Initialize the mutex in cros_typec_register_thunderbolt() to fix the
> issue.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 3b00be26b16a ("platform/chrome: cros_ec_typec: Thunderbolt support=
")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks for the fix!

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/cros_typec_altmode.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platf=
orm/chrome/cros_typec_altmode.c
> index 557340b53af0..66c546bf89b5 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.c
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -359,6 +359,7 @@ cros_typec_register_thunderbolt(struct cros_typec_por=
t *port,
>  	}
> =20
>  	INIT_WORK(&adata->work, cros_typec_altmode_work);
> +	mutex_init(&adata->lock);
>  	adata->alt =3D alt;
>  	adata->port =3D port;
>  	adata->ap_mode_entry =3D true;
> --=20
> 2.54.0.545.g6539524ca2-goog
>=20

--89axrARWOPcEMaPt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCafotMAAKCRBzbaomhzOw
wiYUAP9t4B8VrD/q+NsAmZTAXx6uBt1fGtt47f6A5GGpcwUnvAEAgl/jN09WGS/J
0KFFd/pfEjUIqc1NiX5N3z7ao1t1bQM=
=JajR
-----END PGP SIGNATURE-----

--89axrARWOPcEMaPt--
