Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B4C33CFC
	for <chrome-platform@lists.linux.dev>; Fri,  7 Jun 2024 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717779155; cv=none; b=NgKXN9PDd/ofNlRmr007fJ9H64VRc6WSnPJPaUUIQm1DEHX6l2WK4/YGp+N4IZaif9RV1zH37b/d/5VVLWSO3XIcEYJYMxlzlpoAdCBcXxX6WpGEwCE/pZSVZ7VfnzRpg5edyW3KREp8O4c8CoP/9hBFMzory1j2GxrFNj8mhYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717779155; c=relaxed/simple;
	bh=jzan/YNt+iph6kDhBYAQyNeRgRoEW/pl77UxjZOc1qU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5Ex+Be5Iht9bW1q4FYHd9AwsG4x5gMZZytT9umHCo0oLNyosfK7lwdZQynVe+jnx+PWYubdAQa3XbtnambhNWEpZZIfpyO6TA9txpZEuqlf74d97aKhsRRPygs+mtGSv5cNf5qAl4+rZlUDDpv4ve2Fmx9Hp2Bfvc47mhs529Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NYYMQOok; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NYYMQOok"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35dce6102f4so1929252f8f.3
        for <chrome-platform@lists.linux.dev>; Fri, 07 Jun 2024 09:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717779150; x=1718383950; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bc5Fab9HJb5cr3eXsyaeU1ehshedHKC3eXMoebONp4U=;
        b=NYYMQOokyziLIyapPusePoB/ERKc75Mbuomoz9qk3dEbksszJL/lavZE0FfwovKzq1
         hmzFH4ArmK6WeeuGHYKri1gQJdyBGNW7KzD9gUCPeBcB8W3bHyNaglu6KKj48IgAQUlN
         01ocSrbV0T9FIFcX6lPwT7jgKhyub1f2OblmS/1c3/z1S0rafkIC2ueIr7wxQKqx/pZJ
         +07hDBPyR7wq+6rnKKdzqVLApla5+twgC2RdhAYRxGz7csvCUnljC6wzI463I+YPN16R
         2f1PsmbwQfPB9grx+WeLcI4Pt7uS21YF5ipQeN/Vu6pXWaojBbSWBei+DoaxQZzqXwky
         8Pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717779150; x=1718383950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bc5Fab9HJb5cr3eXsyaeU1ehshedHKC3eXMoebONp4U=;
        b=rWTKjhkuN79E5LKh0PeRlznN3Koxqb9pCOJxtlXgqvXxRgX9wocGqqX9CYavLnLwer
         I7ay+hJj+LfyKJBeEARP9HVRRzQ8SrW1BYM5z8Furv8M36PgC2ZCpt+8X0wbPSOv01Jh
         XcfxAg9et08tTlL/qnGquh4+wDATEHB1qsrcf0ppiuV89PzhSkcK5MO0S55EqMjpuuVR
         X57g6Ds2mWQhYvgO0mkxmY08YQJiWMdB7oKg6ap7KaMvUP0iAup7vDQ3p+XpmPfKFlde
         H/DPbDz8C5ykdCkIP9nahz28F+OEad/x9q0gXnK2oEy53kku7qU1is+2LxmUjhrGjaz1
         3/KA==
X-Forwarded-Encrypted: i=1; AJvYcCXNg/tJrYoET+P/f0oc5FtAo55tJ8tso7mBUAi4ueLA+ngnDfBKpzyYCEsr56YJr673+CmyVrYr8QChoWvXW9GeNITGHKdPE6EmfieBGYEt
X-Gm-Message-State: AOJu0YxGxBrzGZif8LKwAQm4vbF3TL1r//PIyJvekzscGFpVxbXBHoXv
	EAREqmTkaElgjmLTPJJV1nciLOQ00BvGRYtB0Li88HAwNchaNu41FEjA81c88Wry6qaeF2AAF9h
	pyEE=
X-Google-Smtp-Source: AGHT+IFx+YYu803ec7W+G74FTtSx4WrjApVrFi0xZp6/mRweE6i0Z2RLQm7zQoHi354T3EksuDSixg==
X-Received: by 2002:a5d:6892:0:b0:35f:f1d:f4e9 with SMTP id ffacd0b85a97d-35f0f1df7famr378461f8f.28.1717779150418;
        Fri, 07 Jun 2024 09:52:30 -0700 (PDT)
Received: from localhost (p200300f65f283b0017c92b05fa289d44.dip0.t-ipconnect.de. [2003:f6:5f28:3b00:17c9:2b05:fa28:9d44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c364bcdsm57203535e9.19.2024.06.07.09.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 09:52:30 -0700 (PDT)
From: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@baylibre.com>
X-Google-Original-From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Fri, 7 Jun 2024 18:43:23 +0200
To: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, linux-pwm@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] pwm: cros-ec: Don't care about consumers in
 .get_state()
Message-ID: <loyvxce22gz6gwcp7vgjbttbtasmoyjwf6bdash4kqzhsf4na7@zf627ythm2ge>
References: <20240607084416.897777-5-u.kleine-koenig@baylibre.com>
 <20240607084416.897777-6-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mhwn6reey4op4eyi"
Content-Disposition: inline
In-Reply-To: <20240607084416.897777-6-u.kleine-koenig@baylibre.com>


--mhwn6reey4op4eyi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2024 at 10:44:15AM +0200, Uwe Kleine-K=F6nig wrote:
> The get_state() callback is never called (in a visible way) after there
> is a consumer for a pwm device. The core handles loosing the information
> about duty_cycle just fine.
>=20
> Simplify the driver accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
>  drivers/pwm/pwm-cros-ec.c | 33 +--------------------------------
>  1 file changed, 1 insertion(+), 32 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
> index 606ccfdaf4cc..ba4ee0b507b7 100644
> --- a/drivers/pwm/pwm-cros-ec.c
> +++ b/drivers/pwm/pwm-cros-ec.c
> @@ -25,15 +25,6 @@
>  struct cros_ec_pwm_device {
>  	struct cros_ec_device *ec;
>  	bool use_pwm_type;
> -	struct cros_ec_pwm *channel;
> -};

I forgot to drop the kernel doc comment. Unless I get some feedback that
makes me send a v2, I'll squash the following into this patch when
applying:

diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
index fcc33a2cb878..189301dc395e 100644
--- a/drivers/pwm/pwm-cros-ec.c
+++ b/drivers/pwm/pwm-cros-ec.c
@@ -20,7 +20,6 @@
  *
  * @ec: Pointer to EC device
  * @use_pwm_type: Use PWM types instead of generic channels
- * @channel: array with per-channel data
  */
 struct cros_ec_pwm_device {
 	struct cros_ec_device *ec;

Best regards
Uwe

--mhwn6reey4op4eyi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZjOKYACgkQj4D7WH0S
/k4gHwf+IZdctA9vZgZrUZACvGGOpgs2zu3k4EIKxgfFK1nwlxmXo2yYY+JpGCP8
UMzDV4Xen8UDwVhfjQtvMkZ0ZepmO60NNQqHSkbaws5CbtyeF6vvlktE0+w22Y+Y
71+B8ShFk6pOS4YVEFNPh+kB+LjhRZ0MwdmxJUWBguxqHGIEruOrHVds0jiPlcnW
2JSnIkNiQF5Tpt1lDtY634BVhb8Io/E6ZTYR7MPtD/BqAXwNg+jheyNGFSYUAeu/
jsorkAXn+rwz03Fkrk5x05dNUXY3ikxUywJrZbTliqjKIP+BjQ4F2a623fygl0tt
MzmI9xu7YcT3VDE3vitmLOR7c5c5Aw==
=bXer
-----END PGP SIGNATURE-----

--mhwn6reey4op4eyi--
