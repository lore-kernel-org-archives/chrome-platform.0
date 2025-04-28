Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1654E297A68
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 19:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869545; cv=none; b=uWo8FxjHMVDPNv9+N8K8NaaHOq0v7RnVQCTNqE34uQ96vBmdRs6/VD2e+Cl8mvRdv4OtERL0hb9pySL2BJ+N72lFd4jxbvT8FamT7DSBUguw4lF4/vSJN35G1FjTjqH962QBb1ain5TjjnIchKJpa8P7MBpeg7s3lidUuN4lyFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869545; c=relaxed/simple;
	bh=YggQZ1TyVDh4eowW2USUjCGtu+akNt8AE6k6QX1iIxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhIgMXuK35fHWAG5fiVoFXYSfsfC9NkRyXn5F+mbtVlw6DFD22lru9wMFZO85R0NlJkeau9bwmjxHSZChCgHV18yIilrbbZtnR/nAiOcd8zsLYAtHU4VGVVMKTFVEH+z5g8De+V03drrIiwKi1sazKcqnBOtiL5EV8TCbJyDs0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t24IbYuQ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t24IbYuQ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736a7e126c7so4815646b3a.3
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 12:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869543; x=1746474343; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGHxp6lqAYRQInWBjVpHf7WApOQAlT577yEtZ4eKCyA=;
        b=t24IbYuQf24hQuihE+tBtdsk+UWRUYxalXRhsuggRIF+PFg96O/AjPOnZYRY7jUKtM
         21GHk4RWM8LnnkUV4lFfDreHQ5UHTCOnYifbTSObtACvY7i13lgGEY1FoByT1qIIWA9B
         LXQob6kwnzaTbmm2GTvbXWClGCai51UoPobgmIhFg+n54ertuLI/BWjUvJxfYFL72940
         DSzqOdWEK3YRj0DyfWU0KBF06VE4CMbTgUSEc2cB4c2h7rSSWHH0KQceizEmvqU657Pi
         f8GkaIkDe4SsgJ9sgPx4Wd6Oe3JYFve4PReYJ0AnSzPK5rkNSXTkfw6zYDNxBd0jmcuK
         X0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869543; x=1746474343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGHxp6lqAYRQInWBjVpHf7WApOQAlT577yEtZ4eKCyA=;
        b=fIdd8sHRZnLdGt4FSM0J1H+FLmmkekawwpbw27mpt9jUiLe2O6mZm8HDa5+7sFxlUf
         PDD5cTmY+YAdIwPe5cUnZZ0+fZCr0n5YfMEge4fOcOw0rfFjD5PiOYpnHxXoFkiSXGgs
         Oyv2neXUyLAFrE3+NJtmYG++aJxI9DENQL5qpG/hwW7sDnkH6cmOQpMWLftICIopnlsZ
         l83WsC3gGywNDVaSB1LMdJGCifAA5zISjLBLd//NCUIN/slfPl24JibK13elmh7aGN4Z
         NnTQmpfBBvKGZW7YvQfvmhzqCYGUXEje86YLNywC0iNMzDTwQ639wkMatXz62CtkomDX
         UYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf1jXApIZwsQH4CDACUFC9voVo2nPicZjJzX5/cxXhAvY93B0Cy7V2qx7quyuA2E33KC4d4UtKh8SYdXaIAlk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzX3g1bzrRXfWRu3DQagYzOnfaPU69l6DK7GF3yOIUSnh/svOX
	+EnwEJqCXUP8orX1ZoHRAG+HsDlqy1xynHuCTCrTw9XufBA5sKq1BhAVaskRcA==
X-Gm-Gg: ASbGncuqrPEMWP4sWd78Ai71XyG5FEgfQVpr5Llgya7vHQ4feib+2cT+XEPWEsT5Tmv
	ISeo9jkdaAEL/EhgRfoGcY1lExc+LeDtsZ2rzILRgBmW2FxJ49XVM7W7dpDbhVh2GY/WedIMQxF
	t2OSDJMOaWhNgcoFJERhYHGvZL5UDNP70aSICeh8Xz5aT1lQ7SLx2KcYHv2WyuUnGK5bNZ7/LqG
	3dYGPPPKaEuGBIa+Lw1mzIUoGiMOBrw6lhjcpIZyKVrNpvJ4VNIK9qNL27JFP0Z/FewAiWmey+4
	24V157Vmb6reS874NXmRSesQ44uKY0wMQ14IVDqUytpe1uQGpfpREGiGwmo3NdJ6cNIlbItc4wN
	vcCo0xPaw
X-Google-Smtp-Source: AGHT+IFYlvYhne57m4K5klZLGQL12xu5rF8UHasgAgtYn7L+ZI+rW0iA6PRZDAtjG6kMT4NaEVhDYg==
X-Received: by 2002:a05:6a00:4644:b0:736:4d05:2e2e with SMTP id d2e1a72fcca58-73ff7280114mr12876072b3a.6.1745869543146;
        Mon, 28 Apr 2025 12:45:43 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2593f621sm8429207b3a.39.2025.04.28.12.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:45:41 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:45:37 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 7/8] platform/chrome: of_hw_prober: Support trackpad
 probing on Corsola family
Message-ID: <aA_a4Whqm35-pdKk@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8X7Hm8zNZQujXZIe"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-8-wenst@chromium.org>


--8X7Hm8zNZQujXZIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:45PM +0800, Chen-Yu Tsai wrote:
> Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
> families) have second source trackpads that need to be probed.
> The power supply for these are always on and their reset/enable
> lines are not exposed.
>=20
> Add them to the probing list.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Rebased and resolved conflicts with "spherion" trackpad prober
> ---
>  drivers/platform/chrome/chromeos_of_hw_prober.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/pl=
atform/chrome/chromeos_of_hw_prober.c
> index 019578bc7ad0..10dbaede0541 100644
> --- a/drivers/platform/chrome/chromeos_of_hw_prober.c
> +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
> @@ -57,6 +57,7 @@ static int chromeos_i2c_component_prober(struct device =
*dev, const void *_data)
>  	}
> =20
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
> +DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
> =20
>  DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
> =20
> @@ -88,6 +89,18 @@ static const struct hw_prober_entry hw_prober_platform=
s[] =3D {
>  		.compatible =3D "google,spherion",
>  		.prober =3D chromeos_i2c_component_prober,
>  		.data =3D &chromeos_i2c_probe_hana_trackpad,
> +	}, {
> +		.compatible =3D "google,squirtle",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,steelix",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,voltorb",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_dumb_trackpad,
>  	},
>  };
> =20
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--8X7Hm8zNZQujXZIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/a4QAKCRBzbaomhzOw
wjG2AP4ijnSVnwRAZNpFtMiKPIOjyp13MuNiw9PMzfMbCr+MRwEA9hFqvOc+hmFl
cJV85xxmxWaYDZTsW2Gw5ByJNl+JBAo=
=LvH0
-----END PGP SIGNATURE-----

--8X7Hm8zNZQujXZIe--
