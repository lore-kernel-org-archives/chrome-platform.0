Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386184;
	b=VZud57hDMY0Wn22nXtUfSyv1eLKYLw1PGqnNxvi8/9fc8Vna7SO7ApPjkOJIDvm1KnYf
	 JUzyrnQY8WzZA+STtIh7me/816oGWQnYOgXFR0pEEZhMOXzFhs4yLfznc0RlJ9BRt2r2F
	 28geUbv6n5sV7bnPwA4lAHabnj56Vvs74nd53A3AhOXRcE5XtyAMZrq6vL/w7GHLSe8WR
	 C53xoV/rDxPb3gShAsM+A6RW7wbRDp4fmCmpz52KAWjXr4UKhYMzd70svrSzt/+/blIg0
	 CVAmFBW7zBGMXIH7nzhwjruA4IMmy61+D+NPUn9FinqQj0jtkfuXMed/HhMEwdZa1yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hwCzX3wFkjwi9d1zxYJZk9eA77a7avCCt18YWRijvq4=;
	b=GuHLdpGIZIyxGpNjS/DzBXiawMIynpXroCM0KD8JyRqed0Q2FRssNvsOQPjkBPcc3tjY
	 wYNFR56maQVqiliwIPUJF5BaLOW0vGcsNgcYZV49jKFkakoNmCtbdcIUr5OKc8jLpEbex
	 D/7ckbM+NHlBTfDWvizUSO9gFGCbIcVHiYnEhFiQ0E29XJdKcwsbO7zpiYysuJD6SfKIE
	 TTTdW65ygR5WKgP/3sZZaTtmxXg6w+k5WVmjuKz8XGSqucjKZNEagND+39I2RjHsR9cJf
	 ihfAddoMNCnAaw23+ANWZM+8wnBw+eSO6E5KgATOC6LDLDR+8sRDo1/E/bPWyvnQ1iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BWuEeFiG;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C46606A32A
	for <chrome-platform@lists.linux.dev>; Wed, 11 Nov 2026 08:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C46606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BWuEeFiG
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed1f1a7695so11502735ad.2
        for <chrome-platform@lists.linux.dev>; Wed, 11 Nov 2026 00:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794386183; x=1794990983; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwCzX3wFkjwi9d1zxYJZk9eA77a7avCCt18YWRijvq4=;
        b=BWuEeFiGIfSsuh7aPHhBTYpvvW2BtMV4i2dgpyY7C46cEUABFTP0hVyTnv8ywGLlwn
         qFDEpIwXF/DDJTQUu8tV4gAIdo7+5DPpKFJhMt72s7hND89EmJFMPkZQEsIg/PSWpX2Z
         vQGKtH6iF0rAYbJoseNMGISrlMdFy3ZQRAKIgQAVgFx1s/kZL1J/SdVVV8rEl7+k7pke
         qvWb7BD0XDrvLm9u3/UfMMJ1YtxiwF6Hs4t90Rh07CeSVV/gmjVVGGc+2XvE+tqrewOC
         mum6H+4D0lPdDuJ5jJyy4BWBLyDP2Bp5rhSiH0mktnTlNg1gdZN+7M2cMgjlssi5tGRJ
         N0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386183; x=1794990983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwCzX3wFkjwi9d1zxYJZk9eA77a7avCCt18YWRijvq4=;
        b=W3+Zl6qKfIJVQWCg5nzFU2LTSBD+w1mVC0wDwQWmyHPTnFGMxgzlp/P0wnfaDA+31N
         NqVHq2rEaPvEzhZX5YkzQ1XTJJbhv7japU+kSm+TSOkZFKcM9pXFfLY9NWZ3ZxB6dCrj
         xdV9yB1yp7kBFONMzJ/bk+XfufQs6pfnxKuZ3r4XHar1bnBfTI4VII3NPeVXAraLMcGE
         eO7lSdIOACQBHVSgkSk3k5ex6Um/Rd76v+OinT7YMFAqkEj09Sgc5sNzRLtAOIoPUbTx
         Qq8Zkgjoglhl4pvxuFeEkD/CAQx4ljkoelRp8DsOa4rSaD7f8MfyNZUTDkTabkpiXvgi
         LWkg==
X-Forwarded-Encrypted: i=1; AL+hErHCG2nrd4EgD5W+cg5/iX70ObGlw3OsTkVqKvonmvt7QnTcnUpm2DYcjVhhdSGCDVcTQ1EkZk3rtXsigyf0H6Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z+KQZej4bT8580IOrU5vafirU7WBB/TpzN4jSsSOd/lDq5yhtPR
	nKn/1wPksqCTCGAXXMLIeH/cHAA5xMjNitCcmY2LeagJ7sndZuHEd4m8jpEBDWtrFg==
X-Gm-Gg: AYBFou1e96bDkgX93jtjj+N8i9bn1fhpT8/S+U+zANfp8tv9SdLrftqmXI9lOfRw0xe
	IKXDcbOyqWLxMRFs2dhXmzHBYWUBcnnFbfxp9MDAhRUh9hZatBEkMXXRB7Kzw2lmfnzxVYtvLLN
	i7g+sRd4NsW9xaBussIMOCQNeHU6QJZb7D+3R61MFiylxd0TFbp3YqtrDvudXsNWCB9K2L8K+Fn
	hFAOvLb+CpEsn3RK+vyPxPuTCPoLZPklDpWhIcPcjb8jq4KAm/PwMKmYn0wSAVUTupKV3fOox0C
	BQnkFAm+PoUyS1Mzx7wXocurHra74KZtWiXG8lYl1V+4oT1Vn7XI3CVfC21nOn+CmexFD30djDP
	JNeC9YSQoI8XzBz1TL8Q7fq2nxbP1naTXcu3ds510H0afUWaJpnk6PgpFidq255dhQK8mQPd0Hq
	BVxpz2C5eOMsUwegFpkHXWpzqu0H4Gv6zPusa85AfXR2N6zK1mzscsUILUJURae+Z3pAbZxyCgz
	l3dhdb0PqmrXdsiH4Wam0N02l+dnGqRMselnebwldJ75jctOeI7M4iFybNln7o1t45MbDlrXz71
	vIQ1kF5FtWAgEIHOdQBCEy793ZGO/Q4IsULENqDOSbxXJXpBAkiutiFmKmuURpENpc1c6WZh0cm
	S5JRxrPGAxJf6rUknIyfyds2unuk9axB0tWqevY631kzxkWXq6kdyxaeUO1JDVvchlBht0KiAES
	eBsEZYxvIPerfb
X-Received: by 2002:a17:902:da87:b0:2ed:294c:2b9c with SMTP id d9443c01a7336-2edd7ac1ea6mr22278895ad.51.1794386181887;
        Wed, 11 Nov 2026 00:36:21 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6dd43bbsm17865115ad.57.2026.11.11.00.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:36:20 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Wed, 11 Nov 2026 08:36:18 +0000
From: Benson Leung <bleung@chromium.org>
To: Di Wu <diwux@google.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, bleung@chromium.org, groeck@chromium.org,
	tzungbi@kernel.org, linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: use sysfs_emit() in show callbacks
Message-ID: <avQpArYRzrCb5MDq@google.com>
References: <20261111072608.3490763-1-diwux@google.com>
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
	protocol="application/pgp-signature"; boundary="jEief8IRC6172HB4"
Content-Disposition: inline
In-Reply-To: <20261111072608.3490763-1-diwux@google.com>


--jEief8IRC6172HB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 07:26:08AM +0000, Di Wu wrote:
> Replace sprintf() and snprintf() with sysfs_emit() in the sysfs show
> and ext_info read callbacks. sysfs_emit() is aware of the sysfs buffer
> PAGE_SIZE limit and is the preferred helper for show callbacks.
>=20
> Signed-off-by: Di Wu <diwux@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  .../iio/common/cros_ec_sensors/cros_ec_sensors_core.c  | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/=
drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> index d03e40c91582..624d4b32b034 100644
> --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> @@ -149,9 +149,9 @@ static ssize_t cros_ec_sensor_get_report_latency(stru=
ct device *dev,
>  	if (ret < 0)
>  		return ret;
> =20
> -	return sprintf(buf, "%d.%06u\n",
> -		       latency / 1000,
> -		       (latency % 1000) * 1000);
> +	return sysfs_emit(buf, "%d.%06u\n",
> +			  latency / 1000,
> +			  (latency % 1000) * 1000);
>  }
> =20
>  static IIO_DEVICE_ATTR(hwfifo_timeout, 0644,
> @@ -165,7 +165,7 @@ static ssize_t hwfifo_watermark_max_show(struct devic=
e *dev,
>  	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
>  	struct cros_ec_sensors_core_state *st =3D iio_priv(indio_dev);
> =20
> -	return sprintf(buf, "%d\n", st->fifo_max_event_count);
> +	return sysfs_emit(buf, "%d\n", st->fifo_max_event_count);
>  }
> =20
>  static IIO_DEVICE_ATTR_RO(hwfifo_watermark_max, 0);
> @@ -465,7 +465,7 @@ static ssize_t cros_ec_sensors_id(struct iio_dev *ind=
io_dev,
>  {
>  	struct cros_ec_sensors_core_state *st =3D iio_priv(indio_dev);
> =20
> -	return snprintf(buf, PAGE_SIZE, "%d\n", st->param.info.sensor_num);
> +	return sysfs_emit(buf, "%d\n", st->param.info.sensor_num);
>  }
> =20
>  const struct iio_chan_spec_ext_info cros_ec_sensors_ext_info[] =3D {
>=20
> base-commit: b70566610b48ba49dec636019da4d696db64b085
> --=20
> 2.56.0.455.g6c5a503b38-goog
>=20

--jEief8IRC6172HB4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCavQpAQAKCRBzbaomhzOw
wnMVAP9z09pQgMCDirHGoNohxo1OdmFC8Hu9n9+XFZhqMxV9XgEAu7GyPH/nMTCS
qVL+/Vey4OZJEroKyiCXHqlZZf2WJgc=
=nQzv
-----END PGP SIGNATURE-----

--jEief8IRC6172HB4--
