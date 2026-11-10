Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352081;
	b=P77QHJ9uFr7Ajs3NsQe5T9knOWkW2prZreOrMXaOyx7xpVAIYS0AThepyoRaeP4eUfLR
	 G7XGBN2MZBsfYPXTlFcZ6KuuxJDs+IiSTBT2UUmil8VsjQErOSbN+/mHJZ6a1zwqN/NNO
	 Ndkj9/pXrRmavTFMPSR6HZLLb+0kc209C1Yq89rU5oCjZoxfDeGGxeb0G7oZ29WCno02A
	 IA80A1YyaKqmlugoF/q0CSpMBdX6vKSjbk9gdDP5UxzFBZ8rghGSZ/Td96XxOWVP30voI
	 o5rHcne1z8sjMNivg2YlQMDUUh2bkLLAr/3QwlCXgtCVN6/CVUsX1PCZpYXsJ1XjpJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=;
	b=L2X8qnVxaDfZPoq/ciq3Z9DjRMtXZDf13UjHg2cwyFxsyb38ozwxAQu/AVHfnD+ETJ0f
	 32v5GdEXJ9isYQ4A6BMSDQcxQupEll96KzG7OEqunKCa/niWSb4Y1Fs6X0SjD2Glfc0dA
	 97L53Y3POKH0eJGNu30fEnnF1/SxVbubFpaAoyZgxhd5MB1hTRyghc6Fo2wah0UFUg6cD
	 TPThB+I8QWNVtw5ezSAFRog9Fqhn5IKN+4dwSx0e7+1zqD1Tuunea0X/ZNyEIlOuLglLW
	 2ckVv1aQZH83zw8g9cEyCFBwkDiq4p1ZYxry5fisOerGCCILF73rE1aQrFCCqHxWfPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X0Sn6MsA;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E782D606A321
	for <chrome-platform@lists.linux.dev>; Tue, 10 Nov 2026 23:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E782D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X0Sn6MsA
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a594d313a3so1508267b3a.1
        for <chrome-platform@lists.linux.dev>; Tue, 10 Nov 2026 15:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794352080; x=1794956880; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=;
        b=X0Sn6MsAWwmjqszIDAmCtwGVRUECCSC9e0EETJtZVVEPGXSxjD8ZPnKD9v2WT5hNLh
         n+pUdA/2lqS2tyu5Ui/DkwSTLEAdOkh7foxUji8IEDlybh4eJNo0bgK1nCTkTyDraTYw
         SxoLrrcry0M/AVOy7dVP0GJlyTum/czP9p/UblAwpQ4vPlomh18L3QArMsvckCbMviN0
         /W1+lPBBTSHJsGfzHyPFKDkZzKJkWLb9B3SsBssAW06cnpCaw/b/E9GRLfsqFi+lpc1U
         qJlIFVcPZMnobwW3Xzh0UCFibVqlFlwC1gEuc+2vFgdbxLQo579pnx/SGRwz8JtqwsO/
         zWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352080; x=1794956880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVEFKKD3xKoYjscZTTZOnv3dy+z1R/lLnwgShBmxMt0=;
        b=FeHH/7YOdBW937iPrNnxr1ohkN4kPzAWPENsog6NjOZYTFQByZoLgeN3t9eownU5No
         LPj2aueKbxjSYGhgDzvBH6D4VHzzA2p8lZ3opDwjkusE+vGqlL0SbVLNWyAUvKEfNmII
         3JRIAS8SSL3O3wBqV1lm+k+RC4pqmUAUpdHdZBobMbds+5sfLyzDxtb5as0f0O+Z3TOw
         GjLQgNuoEQYKOiOcM/pE/L88TNwJ6Xhhnd7peoWLS2bIv5W68LsQC0cKfdW4XtIt//lz
         9QM7O5akpU48qHU+i4BULSAosQxqL76Hxv6w7zvTAzjdQpbverx0n9tPLClVMB/JbWGm
         0f2w==
X-Forwarded-Encrypted: i=1; AL+hErERKwzFelizmKnITooQUuWQFb70joZjcIoMFticnXK0DH7ukOzfJT6d60VKZEWJISV+PclMMCutF2BNPoFWKjY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+d08MVAlT5x03clhW0qIYI9idxqdpVry8pP2kJy66gKZUmDHJS
	BrnLaqFm89PGsTgpCQjUUcQmajC/jD0qktJ1qag/T4amU0zwBRNHMFBZPWIrg+HeZQ==
X-Gm-Gg: AYBFou3LVTN7Wgb5JCqN7UybZ5xohFWoXXPpGS3rmCVhP1vc3wheZug8vAPsXtztddk
	t1BSrbbZPSlBhuCp3IJDeVsYyne9f7cDBSja11D8T7ENI9zAteBEGxNKXjPcbUxlGI3QF5P8J6w
	BSkNGnIvMu3kKYd2HGaPDRBz0rXFqUZan5l2cAqUv3Z8lhnaIz3MshsaARXjccKiXoIDQqiOJoP
	3i1EVIpqLWRj3f9wTushQv7Oe6ajngnc0s0jyVn/g6F8S4nF5pUPeQqVEou9MJN8N3pvDEmze33
	ZgANloF9pxyClVyP9meOKkoZCM0qBlS7SImIxtk3p9kWcWG1/on5EHlc9+z1Gd29YugBwQU+FwM
	o/a1ev5hpjmhIdBvLUFzPuEj7gY8mT7LHIi175MhMD6lg/g3hRX8igS8fhsu9PSTZyAu01qoMYX
	mEd4YK+A3MHWpmqKB4h9M0Ho/clMWtqafqrel6VuAytrztV7XzKKZRnZuY7ztSqm6P+qdmmwze4
	0MUHsN6/E3GEyVQZl4KyHsYafrKtWaKyzHKQgIaFQd/LnP9LC2t/RrGbrGG8dG86VtLQCFOTfyn
	MqNLcgck34E8yzcxB/6cAnRTsi2agX1+Ee+DWFN1Aw5KyoKBxRn6ZeSjHK//4u28peISkgcFaSa
	9S6CIfGWacpsF15K5dwD01N7icriw8QQc3tQkdeiZvusqxebya9XDeTn7+fMHaTkVPxsHybSC95
	+h/5U/KXJf7SldqQ==
X-Received: by 2002:a05:6a00:2290:b0:891:3e34:e06f with SMTP id d2e1a72fcca58-8bc1c2a9279mr528151b3a.44.1794352079387;
        Tue, 10 Nov 2026 15:07:59 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa506bca4sm1426781b3a.0.2026.11.10.15.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:07:58 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Tue, 10 Nov 2026 23:07:55 +0000
From: Benson Leung <bleung@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 15/20] mfd: Use named initializers for
 platform_device_id array
Message-ID: <avOjy_fN7YtF3qfm@google.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="19MCwox2Lta4/77f"
Content-Disposition: inline
In-Reply-To: <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>


--19MCwox2Lta4/77f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:54:40PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> platform_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Also drop a tailing comma after a list terminator to match the common
> style for these device-id arrays.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/mfd/ab8500-core.c | 8 ++++----
>  drivers/mfd/cros_ec_dev.c | 2 +-
>  drivers/mfd/mt6397-core.c | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
> index d5602b2f4a0e..8638fc8472f7 100644
> --- a/drivers/mfd/ab8500-core.c
> +++ b/drivers/mfd/ab8500-core.c
> @@ -1252,10 +1252,10 @@ static int ab8500_probe(struct platform_device *p=
dev)
>  }
> =20
>  static const struct platform_device_id ab8500_id[] =3D {
> -	{ "ab8500-core", AB8500_VERSION_AB8500 },
> -	{ "ab8505-core", AB8500_VERSION_AB8505 },
> -	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
> -	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
> +	{ .name =3D "ab8500-core", .driver_data =3D AB8500_VERSION_AB8500 },
> +	{ .name =3D "ab8505-core", .driver_data =3D AB8500_VERSION_AB8505 },
> +	{ .name =3D "ab9540-i2c", .driver_data =3D AB8500_VERSION_AB9540 },
> +	{ .name =3D "ab8540-i2c", .driver_data =3D AB8500_VERSION_AB8540 },
>  	{ }
>  };
> =20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 96aac158fd8b..3c7e7f1efd0f 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct platform_device_id cros_ec_id[] =3D {
> -	{ DRV_NAME },
> +	{ .name =3D DRV_NAME },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_id);
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index e74936ac206f..385121867da5 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -435,8 +435,8 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
> =20
>  static const struct platform_device_id mt6397_id[] =3D {
> -	{ "mt6397" },
> -	{ },
> +	{ .name =3D "mt6397" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, mt6397_id);
> =20
> --=20
> 2.56.0.rc1
>=20

--19MCwox2Lta4/77f
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCavOjygAKCRBzbaomhzOw
wvFsAQC87smEjajHkfFGbCeGY6Cj/9mvC0xw3nuIrtpr77YwHgEA6ablXqCzLa70
BlcM4GE7l2ZF2r9VzxPGW7WUD7O+TgI=
=nN+Y
-----END PGP SIGNATURE-----

--19MCwox2Lta4/77f--
