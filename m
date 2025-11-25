Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F551531C1
	for <chrome-platform@lists.linux.dev>; Tue, 25 Nov 2025 00:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764029772; cv=none; b=Sz+ELNz280xpSMnA0ad9MiqdscJ2YoMQJyfr0mCi9+oFJYqPXaB6NQVnFr/ynpJIJi3TODMklr6CvBKDuubSv9fHRczB7btYlgqA6dzHXmFh6oznr+wwXRk0LxVoRBqOCNDisYfpY4uSM3k1nOnzLyB0PhWMxJ+lKS7pvr1SUhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764029772; c=relaxed/simple;
	bh=88K+dT75g4DX+0i8vO0KhQGeYUQrLnAqYrXSdijTo0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+TMNl80oJKF4wwA5qDTfLkbOLRg/7eW6p9srOw3DMV2klydBznpqk/ACDTukL+NPyhaqbaFUa2BBOa0g4DJBD9RyOeQkk6JUELLHJ/2opAjwRTdUxj+q/+XTzYyb6Dc9vRGA+oAyuoEFIWq7oL/M83WECIIdHrv8iLUyh++EmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GESMrmNN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GESMrmNN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29853ec5b8cso59795635ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 16:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764029768; x=1764634568; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sLyiccFRketBV3KSBd0kecIXR8DpgWP+Guf8h/gF8aE=;
        b=GESMrmNNOUcFazOi10VHrMz1ID81qzS2HCFprj/UAYQfJb0yVQHkGJlfLt3xBRsJQE
         ZSXeJK0bLE4NtE4PlmPIKsiZkNAaGc5cGSnKlu1Z8rafCvKit4jS6ShSgVj7slEguMl2
         Wc6t5LQPz1plXnTJtKUcgijgrnw6mcaTQyCBErsGJGGgL9YJ4bpUG1UEFA/nU7NEYQvK
         vf7sl/3KNRCInNRuF9SsF4f6FFUgTV4TcNHhKAebZqY3aRDppbEIy+if3kkO3C2zv2ll
         IPDdAAq/hLoYkpI1yu0SYP2d0jxhIeRTFebkm0TnZRZ1QR/dv7/qgHaDnajaNvDyzxNE
         951A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764029768; x=1764634568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLyiccFRketBV3KSBd0kecIXR8DpgWP+Guf8h/gF8aE=;
        b=Apb1JP6NEtGFcNkbPW0exBY9SUvY7lOPH/bB/YzOAIRxrwxfnwbY5yvDKf3unf7GRl
         An/pcQvZnWipxJnnXAA4hHzoJOttD8Kdo4pOHsQzyc4RihtrOAIR2qef1uzWqnyir9qz
         SWca0a6r/OKJABMPEJYHGblIX8qbOSelZPphkFVNF0zuOT6xUkcZ3qs6bXLOaBb/QyuM
         b22kbx0vZezoE40nNr3Nvsj5R503pm2R5yNxNsUWD6+7pJR5y/xLnYBEPNGY1VbzV+oL
         j4BPtfPc0WkpmPiNX6U/BwsT6tHuVfaVSzqu6IeJWBtGNGaJhaHiifBgkqvSNGXXma4/
         Cslg==
X-Forwarded-Encrypted: i=1; AJvYcCXUHuL9HYIdFp6rFj/QwxzDysbxv5I92jYSrk/kXN4kBYwJMyvgKRZPdMD1PDniHFiZ5VZ6cO2YLX1tRDrTPWo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2erSkHzJfN/Av5W2lKCmX6Vw5/q7O5OZ1Va8awALWHE00heqZ
	8rNX3wANoMPV8xpWfMZzeHkHN1k0NsyR2ynYQhr2E8U3TzU/MFU2X8VSGf5uFhLxew==
X-Gm-Gg: ASbGncuUpjd+QRcXkF7fvkLi7u9DXQHYDMiMUIDWtGZZHD/e+7UkRtT1Bomi1Tnxwua
	P6IIixc95I3CBwlYII4L1ddkVrj7suK3ee1oz+OxiR/dqspwvQXqGguJ2uOLbnDXTZ8NH5D0l2+
	i9ZxBlLJqbtcPOJZWB/YJWiQsx5BF9Fu/7QwD4PwPEM5wH/aJfQmd0pTxmTPRhOB70NC0hQdLn4
	ETgOL6+y9V3Lon7+x7o5pcWFuWjuzrxo9+xc4EJ3NS4nbl5heclAPwHlbOn56VNxgL2J6gjs4RC
	iZdXANeXciTCg82HWiYR5rxOEhRc9bnRQoFj2wi1vLfApxgNrZ2GRHA63R7kfLrKOXjI6Ev+KZY
	mO78Dzvf6kktgF51NpNLkpOaAdRbTh0PJemKeHgBQzXve5tAGH+1sHI/fqNlVofzbJnURyZUsK9
	jJNer5GFt9rtIftdPY8sGpnvPWLXNWtCWl3Cz6KpS/2y4w
X-Google-Smtp-Source: AGHT+IGtdLfcLagv9EE4VeSiSV3iYZFaLH51pSBBmFPOYtCNlvtT3y5HX/LP7IIpmk258K5p2Ee90w==
X-Received: by 2002:a17:90b:3c8e:b0:340:ca7d:936a with SMTP id 98e67ed59e1d1-34733f22173mr15245146a91.18.1764029768076;
        Mon, 24 Nov 2025 16:16:08 -0800 (PST)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727be2fa7sm14650194a91.6.2025.11.24.16.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 16:16:06 -0800 (PST)
Date: Tue, 25 Nov 2025 00:16:03 +0000
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
Subject: Re: [PATCH v5 3/4] usb: typec: ucsi: Set no_mode_control flag
Message-ID: <aST1Q4P6noMUNH3u@google.com>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
 <20251124124639.1101335-4-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3g51RXmLcEl65vM"
Content-Disposition: inline
In-Reply-To: <20251124124639.1101335-4-akuchynski@chromium.org>


--h3g51RXmLcEl65vM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 12:46:38PM +0000, Andrei Kuchynski wrote:
> This flag indicates that the PPM allows the OPM to change the currently
> negotiated alternate mode using the SET_NEW_CAM command.
>=20
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 9b3df776137a..82c3efd72639 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1700,6 +1700,7 @@ static int ucsi_register_port(struct ucsi *ucsi, st=
ruct ucsi_connector *con)
> =20
>  	cap->driver_data =3D con;
>  	cap->ops =3D &ucsi_ops;
> +	cap->no_mode_control =3D !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_=
OVERRIDE);
> =20
>  	if (ucsi->version >=3D UCSI_VERSION_2_0)
>  		con->typec_cap.orientation_aware =3D true;
> --=20
> 2.52.0.rc2.455.g230fcf2819-goog
>=20

--h3g51RXmLcEl65vM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaST1QgAKCRBzbaomhzOw
wu9PAQDdKItmjykXpe6LqnMszjGxdJRCEusikaqeHLi1zowtagEAi+/gREG4Ve6j
IsJX8A/1r97W3g3/o2N3KiBzUS5j4Ao=
=OYnM
-----END PGP SIGNATURE-----

--h3g51RXmLcEl65vM--
