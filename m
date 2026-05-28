Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B5F3ACEE1
	for <chrome-platform@lists.linux.dev>; Thu, 28 May 2026 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962999; cv=none; b=RFj3SxYGf+IKghe4/StjMYDSAF8dVcVqFtAKm8kRaZe2aAZkjc1ZGCnx5bev46XgjUclGFcsRl11S99H7XIHKCkoGrHCcgldDajhF/xToXXXOZYGEy0nDHS9EXM8xGdX7bnkYEEb2cRytwfCjA5jf328xW430Wf4F6UohmyoIMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962999; c=relaxed/simple;
	bh=jDJJEw1aEW13FPk5Ox8KXXR1xi9c6g3zuF8G653rRWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuZMupAyHndrnWGwuKYQA5QSJdDv/OWXMN3zYm/XG6WJUpNJbvvRbxUvVJQ7cMvTZ7SnsAqsZj/Gh4MyWV/1Tv5gSZ7QkG30qvd+8Yqsm5ldytIp6B8PvMDOcUuOS+IBFybelIB9KIL9dQ/a671ieGgT4tNsziY9N5mONJNzOoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Tfn8GDp6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Tfn8GDp6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so66495205e9.1
        for <chrome-platform@lists.linux.dev>; Thu, 28 May 2026 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779962995; x=1780567795; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3dEoQrHmxD3QAsur3ni9bkWOs/bYRX+l4pg8imj6MVM=;
        b=Tfn8GDp6NUm5T8oJU5XF275VO17Z1Q61QsFtUjaAipDcJjZ+z4TDdwguBWAymC9w5C
         blTcFeD8e71xJEK6roFbvgplx7eJSOf4zH9t1bF1jVtHPH1T/EB1UO7NTZ5oVOX+KRKb
         TGL9FAlGVrQ4RLfDuYvomTx+EIhUlkB8SQwMI2vB3i1RMD5G0Q5RrnLagbcRxdDyfikA
         Tt2t9pvTpuCHxc5yxPQiAJtQjHhfXce95lj7Bp8eeyg61AlH/KnEhySwWrFC/gSfIJ+O
         3H3ydiQJLzJKjFGu0CZbDbTKvM6XjSoUaPEsKBO/GlHs1Genv7psVR9mpapl0jagpS8a
         YusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962995; x=1780567795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dEoQrHmxD3QAsur3ni9bkWOs/bYRX+l4pg8imj6MVM=;
        b=jaWK8ENt3Xy5takHr/nMxcg3xEJdr0sO36T0KBemIA4TqEf7nEy/p3+yg78ayhaYup
         4wKnuzt7iCi68l3axhZe1WPsZce2vycr0gZ/a7n3Mtvm5GjK2QFvAxbVBQfqe7IID4AJ
         hUqF0vAWXppA4Un+gFDS/ZxZLowrjnf4toN5CrWfGTmkh1Fd4NUXBEGnq41WkkisaGvx
         UY9bw4Sf73HHKfvTvCyIRuhkSpMTfqy+XCqa2zRMTpKPXsflrNctjVarOfLfFoaVKVJn
         bKip6faBeOOXFucKhC/NvjyLaG6heeeanNAZsNJYbK5Zz1tGtzm3bCfD06QVNHsg7peY
         XAzg==
X-Forwarded-Encrypted: i=1; AFNElJ/AzbDVFH5MMH8nPVtlHQj+BscpN/tm9bbeLUP6kG6gXXt/nY7xxdL9i88SMmohCoxsPblXW6u77g+PcnXj5Lw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwD8aCjhOAxD+BI2qaTq99Z/GuVkvAOGeq1RxzZzS6LGW1cR1vw
	cYb16D8B2c7hHuxl5p/FILZLa9OJ95e/fRRsbfE0qo6phaBiKDvPRhZvV3rCw6e15ic=
X-Gm-Gg: Acq92OFldmhDJPj/SYfuWUk8zP7/X3beit3WmN1853dpY9Z+cMH2ckK6EVlepnlTSSV
	b10MCIWPIu9zMDTPFRpzhFBVIpb7CMgkOKCRT0OU0P+2CQOeYTfcJx92Da0YgkE8fD4qz6aZSTP
	rFZjCthTiVb2DjtJbfOBNtXJJu4EJ9CU1sLPH5Mz55oQOZW4sFhXoZCxS/G2TJXO4B0S2/AKto8
	glLCT+GJzMImNOvvJ9KTYTcS2Gp9aItLv69/5SjCLP4dv16pBov8wpGOZHL2GUP3VejyMWkUU5C
	1KxXva0cNxaZPqUeo6ettIyGfLRb6m82r9GE0bFIPxQfVnLt02pdTJQCAM62U2s+CstqzUjQeeD
	/tRwISVo8E0TcgKmkGyG5Sf80XxVY/crZlSb/SNKwzrp1XD8XfJhjn1BGOQ4uoKOXiEsetx0ocg
	Z962t5u1y5pyNCT4+1LFe0QFilvmDd/2M+lo9EEKKoViJ3baApPXskW5P3NhY2BFPUw0LNKOpgu
	aP5AJ9dRlI/nlG0fzIBt/CMMw==
X-Received: by 2002:a05:600c:528c:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-490947a4918mr14900895e9.7.1779962994786;
        Thu, 28 May 2026 03:09:54 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49092654e10sm28651945e9.7.2026.05.28.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:09:53 -0700 (PDT)
Date: Thu, 28 May 2026 12:09:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v1 0/3] gpio: Use named initializers for
 platform_device_id arrays
Message-ID: <ahgUGOsIxlFrf9mD@monoceros>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
 <177995803708.5037.5318741720946502441.b4-ty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2z3wzt7537jwqmcu"
Content-Disposition: inline
In-Reply-To: <177995803708.5037.5318741720946502441.b4-ty@oss.qualcomm.com>


--2z3wzt7537jwqmcu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/3] gpio: Use named initializers for
 platform_device_id arrays
MIME-Version: 1.0

Hello Bartosz,

On Thu, May 28, 2026 at 10:47:55AM +0200, Bartosz Golaszewski wrote:
> On Wed, 27 May 2026 16:57:26 +0200, Uwe Kleine-K=F6nig (The Capable Hub) =
wrote:
> > this series targets to use named initializers for platform_device_id
> > arrays. In general these are better readable for humans and more robust
> > to changes in the respective struct definition.
> >=20
> > This robustness is needed as I want to do
> >=20
> > 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devic=
etable.h
> > 	--- a/include/linux/mod_devicetable.h
> > 	+++ b/include/linux/mod_devicetable.h
> > 	@@ -610,4 +610,7 @@ struct dmi_system_id {
> > 	 struct platform_device_id {
> > 		char name[PLATFORM_NAME_SIZE];
> > 	-	kernel_ulong_t driver_data;
> > 	+	union {
> > 	+		kernel_ulong_t driver_data;
> > 	+		const void *driver_data_ptr;
> > 	+	};
> > 	 };
> >=20
> > [...]
>=20
> I fixed your SoB as requested and fixed up patch 2/3 as one of the driver=
s it
> touched no longer exists in my tree.

Right, I noticed that conflict when rebasing my stack to next-20260527
and assumed you'd cope for that.

Thanks!
Uwe

--2z3wzt7537jwqmcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoYFG4ACgkQj4D7WH0S
/k5FBQf+Ibzmukpa6UhZfcZUhGe0XaS6TZpmFiyy9QMJVqt3bKHdEafowQgl32yf
5w0pLkWFfORjHv+FEfH+wollsB7//hBHnEOT2nlVo2tI9s4lxfmJlJBAQYUSOPIs
vKiKxxRT5p4uRCRhV1JWg2TBVimsUw9GG2tTXHK9jOMI2SU3iYsKoSbmQLN9Rctw
k7N3zinvmqjGvYrYWYSdwN8ocBYa0b4JZGH2N3QabvS92i9doS2RMU46QIoCixGR
OLNW6wEonHxnaNjpK36WFWNH/6tXbxKMuWBDM9R3xtDtWoaLDHnMOQNCSsGVMqOI
9uMi39yy5eMdBL5EINcaVkZvXFD54A==
=ul7F
-----END PGP SIGNATURE-----

--2z3wzt7537jwqmcu--
