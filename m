Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973706;
	b=PNHO+I0KQb57uhaj4bFQZonOi1pKbdqLyyGZVqy3mLsj73xjBn5bUnKTltAqgm91+9vV
	 lSgM6K7W+oqRJHxSpkhQltvPoi3pWgEih7BCsogCNmq/5VN610k4b6/WOKL7ZqJjzktnQ
	 usnJP8WECNdi/8ruPKWI3jXfbCY7P0I6WTK7z3Jytqsz9YhO3vZk4z1utSQ1ZBg5b7euT
	 ytk6m2zDTC7PVjPTQeEg5S5s7SCav+q3pBfCjegDX9Hgc1WqxOPwrcUpl5zIrGK0W3EWy
	 bCTJlkrpKYcDmQmqeNHgLtspsDWUHg+cx5BXTcvSxprH4Lw3c8MvdTpjGN/q98ZGWsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kOOQLfeBwDY0iWXFrU8Q51s+d5tc2TqUDyd6PHmR+Fs=;
	b=00yRV8Tv2Jk3/7JC4zB8mZbRGpezJJNcR4wJ0Sa0crQ2HKHxjI+ij0PGx3kO5gvmLQ2C
	 D6mGpSE+Nh6DSj+h0tTV2SaV00vxZB2PVEz26UpMbSPtWI9Spge0qlOV7UGVGS83CgpiR
	 WLkyATyG0q6XGaz//Fkw4d4jqqM+M8VSAkUdehP6lClS4L3fHurNZLQKFMTNm1x+qn/yz
	 GqmKXwuPeWrsR20uOTIvC0w0AsmpQwuP5plE8FC+qYbhOemvJjTdchxn5j6yCnY+ABHnf
	 0i3WXL1Yv2OrQBJ8Vr7RgztyRDUdiftBCGu5dov/L9pu4gY7E+v4gh8XNoSllt1Hy1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ibWnE9c0;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B339606A32A
	for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 03:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B339606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ibWnE9c0
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so262677b3a.3
        for <chrome-platform@lists.linux.dev>; Tue, 17 Nov 2026 19:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794973706; x=1795578506; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kOOQLfeBwDY0iWXFrU8Q51s+d5tc2TqUDyd6PHmR+Fs=;
        b=ibWnE9c084JhC0krgDA2S/CRARRRfS3JwkP/sQad4i1pOqo3riBNn1gxIz3HUw1r0Y
         ryLqabcei78Jvzq4u1AZPXbd5xhfSJv5b072usJ5D3huk1KFdwi5t8oZkN4HYl3QtQHo
         t5ps2zarWThzEOY3g4y16d6D6hFF8xV9ouPKLJ+RkzSybCnnmb2WtkYr+0AMn3PPgQ99
         uxtThjig7wDE8JIlZjhIFbSxcz/EA+V3uZ0dF+k7wdZsAR2KSW5X++LzpEsdBbK03XRT
         +5c4K6BA/CbgjEBaFUSfBrj3gMYnBP6537vyioLk/VU4E7nujZ+sEKRifJUDCB+8WXZS
         lePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973706; x=1795578506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOOQLfeBwDY0iWXFrU8Q51s+d5tc2TqUDyd6PHmR+Fs=;
        b=khr3k60VPp/7qHDW77MzOC6Eipp5BrnuOV9U4cBcgv+yJ30jHQNPAA9Fx0Tf3c0L1k
         mj1KGSuwjv7OF83m0DPi0U+JhjSMAf2sQrqqaD5yTb69/KpgFZEg3+5XDA6kL366DM7l
         uJKyEk0h8S+dJ77OyJ6OF9PparZ7wNNGoU+flYqLLVggUtn3dwyYb/rhTiXchk996bWj
         6Qqi0GuGpIpPB69I+OQQ4D2HRLWpbAS88Neimy3qMsVs6jubnZEAzI8dtLrR+d52Gm4c
         0k6cERZUL5+oZXO6hJUeDwhgKSN5XJJS6VAIkBwhi07qSdxz3vyd0NHCkRFUAsPV9Z32
         keGw==
X-Forwarded-Encrypted: i=1; AL+hErG4mrFOICK3HZRq/61G7/b36IWDWzDcmSvWboIDjru4swWMisguKyBfqeKZWPetBsVpullgJFnLfij+Hiay8W0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/8cQFOvmgDCOwn3KnWo8FWSf20hMfxCWFZsTfaIhtkzuXBe/Km
	yAx/SCbaEaDK34NonJUt+wcyVz+omyPvG1cx83c9E3HzZmV6Yll1o6cb6KLJeKKovA==
X-Gm-Gg: AYBFou3mvRToJPrBwloNBgCDT2R7NY6GB/uJGErDF9Fp7m7CRJuSpvTDxy/BXMzpNuF
	9o6cFz+oDz2B+o4uhi+Akr8nrsPhEw+UVRKWDD4o6nLJMickR3q1xzFuRyq0TrkF207gQhig80E
	6ggNTwf3gzQZi2hj3P75zODqBepw1MP6pMx2dCMdjUQDBarAb9kJwjo5jsKOWx7bj9mv0FvfPMf
	Q3hpE6XLa1G7cXr1uTZ0cEWov49Ak3Ab0HrLo2gtAu2G8oSEymH66Ru8JyDC2HvqxmGJqN13dNO
	ngfo+dKzoEcv+/Gper8u1SmHu7oUcrF1LoF/eDw+vWtkP9BZFEI5vMXd0EQGELCUCX5h8JXNtUj
	uPRSLEbye8Za0iYvr+IqiKw951qIGSImL9Vmrsw30PyGTfZqK1UA9C4DXLxlpJfobzFOC8ce0Jn
	KGDohJ9AzjvwZwgIzL2tkwmfRZBxhNFC2h/RKb23f6PMfxsAe5nqzHRaxYC6Hri+tCuXtAP7SD8
	JRR1GzsGnKCmjpd0fKeulDVqHvM5s3/cvzvaOQfoo+bscQcy92cwLXyD8i92g5JUP/Uk2/Y0+7o
	y0nqL1o/Qz9kb64n6PWMsC38qdo0huQFPw0PIjHTxbTta4+l3MQWeS3nWet3GZ/s7FPXa5SI3aR
	b9+SAD/eJzgPNZIuVVkJB7eE1whifDMLZwnAXqdU+80w5DIWafnMQWu5Fd/rAHuuntLzGdUsjTt
	wBIrs/SNFF4otD
X-Received: by 2002:a05:6a21:8210:b0:3e1:885f:b4ab with SMTP id adf61e73a8af0-3fe872c98b9mr1476685637.8.1794973704719;
        Tue, 17 Nov 2026 19:48:24 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3bb9f3e4sm380752a12.13.2026.11.17.19.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:48:22 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Tue, 17 Nov 2026 19:48:20 -0800
From: Benson Leung <bleung@chromium.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: bleung@chromium.org, lee@kernel.org, tzungbi@kernel.org,
	groeck@chromium.org, jthies@google.com,
	chrome-platform@lists.linux.dev, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: cros_ec: Drop OF node reference in ec_device_probe()
Message-ID: <av0gBCp63QZ2F8gy@google.com>
References: <20261118013935.1573-1-laixiangwu@cmss.chinamobile.com>
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
	protocol="application/pgp-signature"; boundary="4fjyoe2kkllcO+TQ"
Content-Disposition: inline
In-Reply-To: <20261118013935.1573-1-laixiangwu@cmss.chinamobile.com>


--4fjyoe2kkllcO+TQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Xiangwu,

Thanks for catching this OF node reference leak problem. A few comments bel=
ow.

On Wed, Nov 18, 2026 at 09:39:34AM +0800, Xiangwu Lai wrote:
> ec_device_probe() calls of_find_compatible_node() only to check
> whether a "google,cros-ec-ucsi" node exists in the device tree, but
> the reference held by the returned node is never dropped.
>=20
> Keep the node pointer in a local variable and release the reference
> with of_node_put() right after the lookup.
>=20
> Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defin=
ed in OF or ACPI")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
> ---
>  drivers/mfd/cros_ec_dev.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 529a23b80..593297df5 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -184,6 +184,7 @@ static int ec_device_probe(struct platform_device *pd=
ev)
>  	struct device *dev =3D &pdev->dev;
>  	struct cros_ec_platform *ec_platform =3D dev_get_platdata(dev);
>  	struct cros_ec_dev *ec =3D kzalloc_obj(*ec);
> +	struct device_node *np;
>  	struct ec_response_pchg_count pchg_count;
>  	int i;
> =20

ec_device_probe() already has a "struct device_node *node;" declared
immediately before this context. Please don't add another device_node point=
er
here just for this. Instead, scope it to the block below using
"__free(device_node)".

> @@ -269,10 +270,12 @@ static int ec_device_probe(struct platform_device *=
pdev)
>  	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
>  	 * the driver should be added as an mfd subdevice.
>  	 */
> +	np =3D of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi");
> +	of_node_put(np);
> +
>  	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
>  	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
> -	    !acpi_dev_found("GOOG0021") &&
> -	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
> +	    !acpi_dev_found("GOOG0021") && !np) {
>  		retval =3D mfd_add_hotplug_devices(ec->dev,
>  						 cros_ec_ucsi_cells,
>  						 ARRAY_SIZE(cros_ec_ucsi_cells));

Moving the of_find_compatible_node() to before the "if" condition breaks
the short-circuit evaluation, causing every ec_device_probe() call (includi=
ng
secondary MCUs such as FP/ISH/SCP/TP and non-UCSI Chromebooks) to walk
the entire Device Tree unnecessarily looking for "google,cros-ec-ucsi".

We want to only run this search if we passed the other 3 checks in the if.

Also, testing "!np" after calling of_node_put(np) evaluates a pointer after
its reference has already been dropped.

Instead, please look into using the automatic cleanup attribute
__free(device_node) added in:
9448e55d032d ("of: Add cleanup.h based auto release via __free(device_node)=
 markings")

Scope the device_node pointer inside of the block (so we keep the short cir=
cuit)
and the cleanup will automatically drop the reference when leaving scope.

Something like this:
	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
	    !acpi_dev_found("GOOG0021")) {
		struct device_node *np __free(device_node) =3D
			of_find_compatible_node(NULL, NULL,
						"google,cros-ec-ucsi");
		if (!np) {
			retval =3D mfd_add_hotplug_devices(ec->dev,
							 cros_ec_ucsi_cells,
							 ARRAY_SIZE(cros_ec_ucsi_cells));
			if (retval)
				dev_warn(ec->dev,
					 "failed to add cros_ec_ucsi: %d\n",
					 retval);
		}
	}

Thanks!
Benson
=20

--4fjyoe2kkllcO+TQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCav0gBAAKCRBzbaomhzOw
woP9AQCyMO9vyhePX5Mo6ySbyd6lVvlJLWQmBZ/JkBQ5++mtEgD9Fn8urRODY8Dl
tKHn5MQbfnC2KA+qSjaW58BRnL5tUgg=
=LNBZ
-----END PGP SIGNATURE-----

--4fjyoe2kkllcO+TQ--
