Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3412CE55A
	for <chrome-platform@lists.linux.dev>; Tue, 25 Nov 2025 00:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764029730; cv=none; b=GoqExP0qvYQxxzHO9VgKZnSFJcktGM2MosmUpsHiCmVaGNTQH5JGU6ALfQnbiCSQGpSPKptUlDJERtxDda+VWJqsjiVjEbbcQZ/kQP0yQMowHLMM1FKsLM3NDYfMEViKLFSxXJFMboOkE8Jky1WY4i4cf85iro0Q/g7H1iPlCss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764029730; c=relaxed/simple;
	bh=M2QyDO/Ls3kyrjY+oZ6+0A/VI/hwZn34k06mJO8/ChY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFg7jgELXv5jREmlALmMFweMY+UVDaeo9k4ELdQPKhH5NjTHS3Bed3RqDtegDuMXzfPqCLVBZOJBk4o7ufP0EUZ5/NqZNYBITNPLBpqbt8rdvqEj51uFF3pnPrCQCSovyloRCAZpe3lhKYLsC4hCMgCTSqnemXBgLamDinTzXs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VZRGnyGp; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VZRGnyGp"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34381ec9197so4348196a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 16:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764029728; x=1764634528; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z75TCqXiDeNiJ1V7BhWMq+8kmv0G4dkLwgIfeG61ojE=;
        b=VZRGnyGppo3hkLbazemdhNAdh7CZEWxNTsjcXw9hDvBnOtqKuYajQxvXfyQ/ojGisH
         SrIhMzk4xCYAfYYxvUbUf6Rbjm7zPV1jX5fzwOMPwaFjPfAlDCvbPxOtrV1YMsURuFg8
         3LZqezhd3rd3pT31uMs7Uwt4wHwhziHnViKzhGCcAMG3sYxVZnIBGAtuJT2+L1o1vn1j
         g3dazL1w1fNrJKFgeaICVgVcewfxWdA3aIMPuI56cj4FGvVy+f4xJmG5+0PQstmf5Hmt
         qtpqsaV1CXExMp4iP1I7pQ5VfipAYii9pCMW+t6smGMpKTW4TCyuXldrhD88HhdsS89w
         qBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764029728; x=1764634528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z75TCqXiDeNiJ1V7BhWMq+8kmv0G4dkLwgIfeG61ojE=;
        b=GztpuVNLKyW9ZW3RM3FamVYNEzXkG6QbRBrd7ORyXA0bntmAj0fu8Ou3kOyu2Y24w5
         X3SQgQhIeuLITHCQDiwY6RcvSuJGlEWq8zXASbxhgQTbQL7BML3/Ap66OLVYkfQY8aRJ
         Hw4mfgg2tfljvmLDif09JmSvYA6XGvXMY2fFMS6O4pHBvT1/llXqGz4p9nt+iQMYbM8O
         GX2caVAh0IKY3rCiIrFyXwSDODa6nb8e5rtqRZEAyG1iJLdi945+tJO4BzHTVrWoWjSq
         ODh6PH297raxwclixZdilwHrVhoG0tWkTkEBiQgTMXnXHl6WVhljBNpvhXjngo6f5AGj
         EynQ==
X-Forwarded-Encrypted: i=1; AJvYcCXobPNhFj1k3OIZAPP4O5Ue/2XCCQQdveefMpbn/A+aU0m9q/4YzzTQz7FkEb/uJ7XHW8DPnPY1wA1N3G4TqK4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6cbVPvbJnahtdW+3qyZDdrJG8e7gIengI8GCXo5eDHjcrYRJN
	IlDsF+vq74oGlupOTYwBunjn4S1S83NY/XWqPlRH6fFqp5rwpdWTbDwCK11WlXwqng==
X-Gm-Gg: ASbGncujvgs6t9YAcLvj1mzvAK0//e4gbMUBZEvhSttHsH3+VloFE0jKoXB1ODvgr2f
	ymySy58kzJOBX1wFE+8H43mz32AdJpnU/VC6ih1VnobzslFv/ELAlkMZbeFMEdaFx2vzUk8Ls3c
	h2LtHqDoPzRQk6x2b8c1cdX4oJzA3kjgwGdYwH5eaka8oHPlYgdFo2CpddscKSoIj4xXcGStNHD
	q163PAeKzKBDsYyAmRehg+ONC4uaAaBS9okSAtFvCn0Dk1/FK+T5JpeixPdahW2gEIguQ//PshS
	THmOFxBS3XlayKZpFzVa7J0NlwHcWKn+P2pwSCX67dzCyfP5VshxpcdONkf8CmaiZqg+yqTqynU
	Y2DiX84r2qCA/NLqghpm2TrIIxf7Oc/kyldtkbGml8gM02igBaAS30Y5MsNr3iSxudNBrs3PK6m
	LfQi8K50388KB8HEUAbd8HL8t8oG+yMWzxjD5QP1C50AOn
X-Google-Smtp-Source: AGHT+IEXdnepa2ycG6iOsvpDqbdObTbNWIRhpbI2lUk6w/VA/v7ttzN3xAcFJ11ipO773Q0QjnnD3A==
X-Received: by 2002:a17:90a:ec8f:b0:340:bc27:97b8 with SMTP id 98e67ed59e1d1-34733e71c77mr13581520a91.10.1764029727967;
        Mon, 24 Nov 2025 16:15:27 -0800 (PST)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472693bd15sm14766119a91.13.2025.11.24.16.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 16:15:26 -0800 (PST)
Date: Tue, 25 Nov 2025 00:15:23 +0000
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
Subject: Re: [PATCH v5 2/4] platform/chrome: cros_ec_typec: Set
 no_mode_control flag
Message-ID: <aST1GwCm4aPqCWVh@google.com>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
 <20251124124639.1101335-3-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7PfsJrJt7aahXr+c"
Content-Disposition: inline
In-Reply-To: <20251124124639.1101335-3-akuchynski@chromium.org>


--7PfsJrJt7aahXr+c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrei,

On Mon, Nov 24, 2025 at 12:46:37PM +0000, Andrei Kuchynski wrote:
> This flag specifies that the Embedded Controller (EC) must receive explic=
it
> approval from the Application Processor (AP) before initiating Type-C
> alternate modes or USB4 mode.
>=20
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index b712bcff6fb2..c0806c562bb9 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_da=
ta *typec)
> =20
>  		cap->driver_data =3D cros_port;
>  		cap->ops =3D &cros_typec_usb_mode_ops;
> +		cap->no_mode_control =3D !typec->ap_driven_altmode;
> =20
>  		cros_port->port =3D typec_register_port(dev, cap);
>  		if (IS_ERR(cros_port->port)) {
> --=20
> 2.52.0.rc2.455.g230fcf2819-goog
>=20

--7PfsJrJt7aahXr+c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaST1GwAKCRBzbaomhzOw
wvFFAQCuGbxz6xVli+GKaG/ptObNPicCsYYsw9JeZWvQTFU4XAEAqOIJD+ai4Uuu
O6BLLAU4psq5ZdQXWlVEG1RtiPxTmww=
=obta
-----END PGP SIGNATURE-----

--7PfsJrJt7aahXr+c--
