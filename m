Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8A32951CE
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 19:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869509; cv=none; b=CAVAb/GzNnWqEbDRNBEDShTEC7+XpbCNkqjLGz6XTq60Dsiss4rgPqtOKJo289bJptlGY2LytwwWho7+ozZK4zemEat6S1HmNVdBkpnNE7vG4khsZi1P/dTLa2xnScEGuxA7T2FzDXkRN9sYBdxWFKcHOUyLYgLvXVjC2uvTbUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869509; c=relaxed/simple;
	bh=Ske+BDAj21huhvtbIRDfyBrEs+/jQGWomwPZgUuFL2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSemBY8QGYtvLB4zoZCBu7MYDpDt5U84JeBYAuit1PtgxTZL0dK0TyZ6usFSkPSXNtSKEoDGTZjJmqnVkdhknMDB34EYNhzWZuxo2sVx5kjAHuGjlpK34OTUpggb48I+boLj13dbwIOvIpIKHkbfBWfeRBuZhc/gAJ8b3P6NIqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2yk3Rf4I; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2yk3Rf4I"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af51596da56so4444082a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 12:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869507; x=1746474307; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KaMu0L4wBURz9xq4JXnOvgxpR2Jhc7zGFIG2V5tCWLw=;
        b=2yk3Rf4ISpD2Hq+8K0UnpogHjSvWLPo2+A5SpB8Ya8WMsmQ7sQSTE1VHmFz+egqIFk
         lsxHppXmVJkR5NzMvrAkU8sWvoaYNrnl6G354HQcGEj+a/S9lcJsfgGujBzD+OBieCEW
         pYmVCwm0BmIjgW8o+oa/v5t1lz1EKFJNe+ZXL3zVjx6OsD8eGIe5Wp6UpxlD/DRh1gjt
         yWgPkIb05AXs+jBQWWxztYTW2xyU7r40jwBbmwKes/6oMc2JWm5j7UF+A3Iv6eQVUR6U
         YOwLHW9Rzxchfc8j5ySCjwXAlXKdbg8kn95bobYrOOnsmhyOydiH9ikZC/ITdpVeTR0x
         dsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869507; x=1746474307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaMu0L4wBURz9xq4JXnOvgxpR2Jhc7zGFIG2V5tCWLw=;
        b=ifyqbZ/w9fQVRwvxaWBPvzMzbWBHtw4muvE6DrL5bho2/P9SqOx0PRAGAy1UW3hvKH
         PHZGZMd0XBR34JyDU9EhbnCogn9rnvBm2PvoysGSYe246mS+uAYBUjfVt2ym2PvDWsUo
         5EmSxrmjlyPf3SDpjvGITXKqFDRx5V9M1khM/l3iNX//4ngQgxIT2PXMhU1XzHTtKG4J
         +X/oVilwwSejwXXnFu+ZnMT30tlA3JhsWYGkhA4KR2KUy7Zo7t2lMz7bWkeKlZ+9UscX
         27+8IAPgRux3W6727W7ZUeywxOJ/AS1CL1TyZozAFJ6D9c1GG0EW3vKsKD2DQAgCUzAQ
         mEuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQQnrLMskPDd0NN7+LxRdDdiXu/h3DUft6A0nF9XYhR3yJWKRTKfh2zQS76OZiDfOQPyxvjTp7kEPG/l2Jyi0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+z0Gh7ADPBWymXI8zF8BlDg2IwfzA0IT/X8vT/gwshvCraQ8X
	+7/XubiL1r72Y3USHSp4sR8InoJeGHqRs5yv7uQ/Oj4xNiyyqkfX3qHzoNQRRw==
X-Gm-Gg: ASbGncsv1CoEeZqKnaNErQjlfgP0NcG7jbaQF2dmB+zt1Iv+DUOROPgxxXO57RB0LNj
	06V5xvM9iIOaG409t6OaN8JduwkMfoUC43BmLBmNM0JRKZUiHcAJnn7EjeSvloecmHqJkxzNkqJ
	hwjznc014yk44uUXfRdOAt9j/bHl+VRxcSsSm4KQAgijxyTuPOfMN7rCcI6Q1rcp2jtq8xCAXd5
	q7pGQM77RXCoL89e69DQwg6Hu5r/bHl/TTlWztVpNs6B6uWRADRCJNyJXF7+WBiZ9opyWInFD0r
	WPP0hXSG6Ii1K5P/I89Jc85fMEipeQAiSGMspBdLnO7zhyFiw9RhH6yjucQJ3m/MIprTp2Qp7Q=
	=
X-Google-Smtp-Source: AGHT+IG6R82DFa9jAy922lzUHN2EAVQRNR18xiowU6WDSy9TAXdGrX8+WhcNG0tMNBGpq3fQ1R7ExQ==
X-Received: by 2002:a05:6a20:43a1:b0:1f5:75a9:526c with SMTP id adf61e73a8af0-2093c7e3860mr1003669637.13.1745869507413;
        Mon, 28 Apr 2025 12:45:07 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9abf2sm8338322b3a.122.2025.04.28.12.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:45:06 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:45:01 +0000
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
Subject: Re: [PATCH v2 8/8] platform/chrome: of_hw_prober: Support
 touchscreen probing on Squirtle
Message-ID: <aA_avWpDUMAvbRBu@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3yxgRYuYXTrM4tBx"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-9-wenst@chromium.org>


--3yxgRYuYXTrM4tBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:46PM +0800, Chen-Yu Tsai wrote:
> The MT8186 Squirtle Chromebook is built with one of two possible
> touchscreens. Let the prober probe for them.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/chromeos_of_hw_prober.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/pl=
atform/chrome/chromeos_of_hw_prober.c
> index 10dbaede0541..f3cd612e5584 100644
> --- a/drivers/platform/chrome/chromeos_of_hw_prober.c
> +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
> @@ -59,6 +59,7 @@ static int chromeos_i2c_component_prober(struct device =
*dev, const void *_data)
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
>  DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
> =20
> +DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(touchscreen);
>  DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
> =20
>  static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trac=
kpad =3D {
> @@ -76,6 +77,17 @@ static const struct chromeos_i2c_probe_data chromeos_i=
2c_probe_hana_trackpad =3D {
>  	},
>  };
> =20
> +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_squirtle_=
touchscreen =3D {
> +	.cfg =3D &chromeos_i2c_probe_simple_touchscreen_cfg,
> +	.opts =3D &(const struct i2c_of_probe_simple_opts) {
> +		.res_node_compatible =3D "elan,ekth6a12nay",
> +		.supply_name =3D "vcc33",
> +		.gpio_name =3D "reset",
> +		.post_power_on_delay_ms =3D 10,
> +		.post_gpio_config_delay_ms =3D 300,
> +	},
> +};
> +
>  static const struct hw_prober_entry hw_prober_platforms[] =3D {
>  	{
>  		.compatible =3D "google,hana",
> @@ -93,6 +105,10 @@ static const struct hw_prober_entry hw_prober_platfor=
ms[] =3D {
>  		.compatible =3D "google,squirtle",
>  		.prober =3D chromeos_i2c_component_prober,
>  		.data =3D &chromeos_i2c_probe_dumb_trackpad,
> +	}, {
> +		.compatible =3D "google,squirtle",
> +		.prober =3D chromeos_i2c_component_prober,
> +		.data =3D &chromeos_i2c_probe_squirtle_touchscreen,
>  	}, {
>  		.compatible =3D "google,steelix",
>  		.prober =3D chromeos_i2c_component_prober,
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--3yxgRYuYXTrM4tBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/avQAKCRBzbaomhzOw
wuHsAP9k0n2/zZ8JMwMbW9PvC1L4S+rXwkDzn4vNgVA9gpUADgEAqqQGBGFcOCTo
ivudInVAQKMFJJvenfbspzj/SwoyHA8=
=MQA+
-----END PGP SIGNATURE-----

--3yxgRYuYXTrM4tBx--
