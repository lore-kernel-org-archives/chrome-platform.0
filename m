Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351930;
	b=ynSBJN2pIs+rXxlddzOlVcWsSYLlmQPNQEUuzRl7pBcPrIEr+HnGTncdZZGukS4SNeCD
	 +uPG9IUKtKwKDvbYSLDX1seSZrXseS+ur0kt17KO4wsGigp2wAe5kYPFP9JWkQmUbEIB+
	 IcXyP5vN8QV5fPteJvbpEtmr7KT3VkByvgA1dynLk98WwwFPgK8aWSvTZDbouL26c8ymd
	 RIPbkNqjH7j5PMZaXAVoEW9eyrnK4tppUVODvAss87uMXIvl343SDhMh4tNUSWmaAkCxl
	 NG+KcxWzhB0UJ/yeSp+K3PwUvlQXmc2sHi36rIL/jULFqL/ASr/9iFSSO3nSS6OcqYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
	b=EtnHjBl1cF798BZh+WNW3Q42a9eKR6jtub9UzO521IvOE2TCm/qzQ97ygdE36YNtGQMu
	 v2If3MuJz2ciP3EfWIpZs13YglVaJHatoKzVhDchs8XitpFZUx3RvMsrb/W6VHOkQLkBI
	 i3hgvETcOA0HaN0KZJVZxFi7Dmp+TIvwd6AMjYN55ewqkmB8Cii0sreGwNXiWITb74lbS
	 pXVT/8wPM4F//ZnY0R6nPi7R+UbQhSo+kQG7u6XHfV7GFjfx+cdZ3rHH8bMpLI2gP99G5
	 wsmfcX98g32Skw/VXtcNwV8hiFwMFDmMrUSKnzxma6zxs+JtQsAx+ghOjESNLKj58Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FBYVXY+V;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9C606A31C
	for <chrome-platform@lists.linux.dev>; Tue, 10 Nov 2026 23:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC9C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FBYVXY+V
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1423655a91.1
        for <chrome-platform@lists.linux.dev>; Tue, 10 Nov 2026 15:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794351929; x=1794956729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
        b=FBYVXY+V1hkoDwpB4vZ/M4sCC9WhUp0etGbiGVwBSzPhaBUjZcDKczap4zwADsjvAp
         mCe1wWr/9MvNhWW/VsLFjI/YQONNv3BbthYHX2wTN2hZ1NKW2FBKqDEH6PWKSzEfMb+A
         rXTojpByyMUW7pALzmBUabHenWHc/TOcEkvVr2zd+t7bUN3C/MQNQaHdcvYYQGijCWUD
         LNiD2zNfiNxflwf706ztvhJteUy9+vPyzWFVOokujzKd9629ZQ270at5dMqgXiaN76+6
         VearkkPz3okjaErfIE3jJq8fh1RZceAjs/OYXXMjqd8UV//+nonZVwIo8k5nonFdHFVa
         NVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351929; x=1794956729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
        b=KlGHRoWZN1OhyZ88Wida8r3FMibog+Fa1zTajZrdtNHBCv4/MunbXrYQkZff16BU/X
         hOM6BzJAOX1VvGxnco/awV2DjniUc3szy9823VqD+GOMYMy7UmK17rbVl998UexNtvzS
         4v8qsO/erCM9NvinKCzZnKjv4ClhM1LrdDRBSA/1SKOA4edOSI/QYfLCci7gwarpFRcS
         f6dy/+t1hXlpCYlAfgGkc8i5jrW9uS8x8t+TBa1BfXaV7aE67iIn9Ko8KgvUqRzAaCSZ
         r1AbcShyLCmfITpVq25MtmNzqmJiMHA+RPDhxXIeFBF6Bl4P077AnoZe6+C9hGR0UH3N
         EJ9g==
X-Forwarded-Encrypted: i=1; AL+hErGSz2QaMR4Uskhe+8JajGHfv05vFwLdz5PJaoFiKNcWSq1iLi9WSTN3jKDVRadRiWd4Un1IiborjeLA6jxmdUw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+OM2xbTbWIvUBcEVpAw1KNelOzgR4VX5CvZ+6GBHtDzFdI9ckv
	+CV6hkcIgxXqDmbNwPdkJvn0HejtUlKfXTYvvBcrDLrA1ALEfDo0zXXLp/60mslAqA==
X-Gm-Gg: AYBFou2CsNNs83Vjg2kCETPMn4l8dt6D0k4mRV0nnV4LaFub5gUqS7hh6PPDZEAcmJV
	9pc9dP/9K/59YST/loPRX34Gcno5SKiPijkndmaeIKJd/gqvZi1jfCFF5vAphnVJEh2B/dZIeSA
	Sd+s2imLV6WbswJY44Jaw9IwJxR1UyedJyIxGu7i+OU+Zo0dNjlx7be3yibJKe7o8Jwajt6zASG
	CWFMCaAhe7YS/mIF6dWjBQT0geaF1L6LxfIE34SYkB8zT8mOatMaUPDkV4vSwbAnwAvSU8kQ3tK
	PXNo7mFa7YrMqbThT+z2IBrytqkcFvUiBStAAV07xZW98/6hC6sekkRAVA/g5nKFJ0antxHYUBd
	/emO1NO7u+e4HD2qyXWnOZZ2w8HDg/PTsqtidwbokIMoCxWT6vAOgmzXa5wIWHCyQ2LNQWTTcL1
	q4BLzXE5mItvpp4CZC3S56Ouc0ujVtmZ85T3f9Bu763q2AcpZ1PIN3D4njTq5HBYXfXrqRyYOBB
	bKCWAIPb95WCmX6oRNVRHwQiCMSA9vSFahCVkZpMOlwP9GwnpyDODW8wyZAeJ1PwU6UjKLa5dny
	FpG6CjFAe85GzA49Hs/ie9nfnfRavqsdaeQSAvlu3VLXUcR5FlcEfWfrCCgx4ayJXqwrf4SBkgD
	ZctQCuYgpw2iuuOO2hzLRUALJvjaEGmVqvoip6DBEij5kK3g46EcX4IwuWq2GTC7kH2HujlA7xF
	7ctsUGoPDY+D0W
X-Received: by 2002:a17:90a:d00b:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b182e0c1a7mr350381a91.1.1794351928487;
        Tue, 10 Nov 2026 15:05:28 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm1476956a91.11.2026.11.10.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:05:25 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Tue, 10 Nov 2026 23:05:22 +0000
From: Benson Leung <bleung@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 09/20] mfd: Drop unused assignment of
 platform_device_id driver data
Message-ID: <avOjMhYL-jo5qWnx@google.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="QGZX1VfFPgOu+2d7"
Content-Disposition: inline
In-Reply-To: <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>


--QGZX1VfFPgOu+2d7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:54:34PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The drivers explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop these
> unused assignments
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/mfd/cros_ec_dev.c | 2 +-
>  drivers/mfd/mt6397-core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 529a23b804f7..96aac158fd8b 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct platform_device_id cros_ec_id[] =3D {
> -	{ DRV_NAME, 0 },
> +	{ DRV_NAME },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_id);
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 5d5f816492aa..e74936ac206f 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -435,7 +435,7 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
> =20
>  static const struct platform_device_id mt6397_id[] =3D {
> -	{ "mt6397", 0 },
> +	{ "mt6397" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, mt6397_id);
> --=20
> 2.56.0.rc1
>=20

--QGZX1VfFPgOu+2d7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCavOjMQAKCRBzbaomhzOw
wggAAP4v7fnaGuBxjdQU0SnWBJUfK3YeW/iId1LRt/eBXC0OmQEAioUu55g6cEtn
WOAUBxWTSFHNLgkeLCTw0+Pu3PdU8As=
=e1Q6
-----END PGP SIGNATURE-----

--QGZX1VfFPgOu+2d7--
