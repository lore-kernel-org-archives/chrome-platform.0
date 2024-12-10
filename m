Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F102080C1
	for <chrome-platform@lists.linux.dev>; Tue, 10 Dec 2024 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733830573; cv=none; b=C1K9LBXRs9yhggmou+iPr/W6m8Nsn27zP60Qr5XjaCvuQ73Zo/hO4mfD0cdBLa5JWWqQwm3mq7Xlk4pFGxkD7ZmzslagKCqNJE93JICZFED479ai5zarFHqFsADZoLAePXbkf92NLId87ZCNaPWA//MHbTaTrHeB9UffYdJKZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733830573; c=relaxed/simple;
	bh=oaPGkXtDmGIa1Utt4YEVi0gnj9eQn5kXOq7ajCUrVo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWlTStSSnNDROcLXpWF7FRs6TSKgP5bDf/ktiSm9hP8Bcu2cat2HYWhAEvzsdheicnegzd08rUX3LcLVnL1e0LKX6lBPWeDXUPiM1Ep/BODYqFnSgI8crStgYFncgWsbPQqlKqngXYCyFv8Uvn+uzNVzIaS+lWARw1opIaBixnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PcuEjv4s; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PcuEjv4s"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434f0432089so23082265e9.2
        for <chrome-platform@lists.linux.dev>; Tue, 10 Dec 2024 03:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733830569; x=1734435369; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JqKUzXwjX0F7r+Pi0kkbJdiIPF6Jc1OuE2o60vzqu8c=;
        b=PcuEjv4sYEFzkzERBvOXUWLxeqaZ1zOI31mSteyHN6YGlhmQC+6TfLMNdS4kE2thTU
         Sdb2FEhkhVKOw0bYfw8Ca22mHbm960zQBgWsJdNpNxiZrtV8uXv+20QXjz/g22D5XKc/
         pdfFeaJjyhUcPLUSq9U50EpjIM3ZIjgKfStgGVMfq1I1N/XrnZhtZq85E7wFKc8Mr9yw
         FAFPH1+hEgeAaKApg+nH7lV2Dt2SVx6Czbq9FG2GfU2CSOXIaJ+wqDbNcn0IvREW9bEJ
         x3TpENCzoXU4mG0XMfR9vmdHNtWFj2YgXDIaXTiaKkdsYocjVop5o/c8cEFUhblwNZff
         CdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733830569; x=1734435369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqKUzXwjX0F7r+Pi0kkbJdiIPF6Jc1OuE2o60vzqu8c=;
        b=B9tgn7OOQP/8KWimag/t6ZxPf1ngJhrFGt4AoxdRwYy1SHNf21En7UeczmCSus4nIo
         izstHTqfaCFeNkxix2dBFEWjxXlFKoyjlL6QrDiyR+G9dGkdqQW0IJIMnNS1rL/ricsc
         DsrrUUvVcwKHzjTVNbzBrSs94SzOu4YlMh4IeX5Zls5tt/4srlRjaz9Y/Yr3PTRU+I1i
         cPAWmgpQ3IVdmh/xGycoZCV4F4wRKzL4Q89ThVtlDoe/uwl25idjKTNyXiA9ZFquP9oA
         i/qkm81pUhQq6vz64EibO8MG/Ot4bV3Zht8Ny8+1ltZQogINF5eA8GarZ1jznxgSTt1B
         Mw6w==
X-Forwarded-Encrypted: i=1; AJvYcCW5cNSHh8psHIfmQuJh1lq6GyA/ectd8GgFwDTcqZyW5KdScbJk2nZjbYTZnGtVqp531jFgQpVGF6YdMGpdI6o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBt0aosFipytLKy/B3cNVHqrulsqz5+w0dWEGMY+DYuigiOKov
	wzFCx95QiPhQ0LSM0ujPxApLrvIz6EVTmaVk9hHAS0WRZLjAB0IaUCYZkS1/ios=
X-Gm-Gg: ASbGnctakDm1pIci4xiaiNVH9B06aQQAQGF71xsha8p5lD4a88ldl4bXNe6RX7tTgUN
	pZhgJb0CziN3KNfK7lQNLSbP74D0+MlLMp4xutGYo3lKmiUc8oPvRQogW/U/z7iQaQBXFKCEJwH
	e9Kfj6GelcjosF3+aubQl9p8giJCral2T8aPKeM8a2SjxwXIMDaZcPts8GwA3eNuhPYHzBODGG4
	TJ9Cqyz8ceWc2+08lwuJBjAsDO5Zz5Nnbsr+/FRaSM/omiD+65uXnb5SGd8tT9ilB8k2cVBdS0G
	8OEN/hBN
X-Google-Smtp-Source: AGHT+IGh7g2pVXebpfQV4PmKNUur7y2GP5+AqT7SSiHWrmQPOSvjOJ9wNL9tjTeTIPE0PA3lkSPX8g==
X-Received: by 2002:a7b:cd15:0:b0:436:aaf:7eb9 with SMTP id 5b1f17b1804b1-4360aaf8122mr11447515e9.20.1733830569176;
        Tue, 10 Dec 2024 03:36:09 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434eba653a0sm113983275e9.22.2024.12.10.03.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 03:36:08 -0800 (PST)
Date: Tue, 10 Dec 2024 12:36:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <chanwoo@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Andy Shevchenko <andy@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] extcon: Switch back to struct platform_driver::remove()
Message-ID: <2rfj7ohbduvtnjga4bnmjfb7m2bn7j7nnjhvakr63mqf2htzvf@n7wrknk5yfyi>
References: <20241127091036.444330-2-u.kleine-koenig@baylibre.com>
 <CAGTfZH3Lv1Cn7dNgA7GL6f4OW=ENXS9mG+p03NAUbbNMg05DtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tulza6hxfbxjqqub"
Content-Disposition: inline
In-Reply-To: <CAGTfZH3Lv1Cn7dNgA7GL6f4OW=ENXS9mG+p03NAUbbNMg05DtQ@mail.gmail.com>


--tulza6hxfbxjqqub
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] extcon: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello,

On Sun, Dec 08, 2024 at 09:49:16PM +0900, Chanwoo Choi wrote:
> On Wed, Nov 27, 2024 at 6:30=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> > diff --git a/drivers/extcon/extcon-usbc-cros-ec.c b/drivers/extcon/extc=
on-usbc-cros-ec.c
> > index 805a47230689..529ac5898e38 100644
> > --- a/drivers/extcon/extcon-usbc-cros-ec.c
> > +++ b/drivers/extcon/extcon-usbc-cros-ec.c
> > @@ -525,12 +525,12 @@ MODULE_DEVICE_TABLE(of, extcon_cros_ec_of_match);
> >
> >  static struct platform_driver extcon_cros_ec_driver =3D {
> >         .driver =3D {
> > -               .name  =3D "extcon-usbc-cros-ec",
> > +               .name =3D "extcon-usbc-cros-ec",
>=20
> If there is  no change, this line is changed.
> Please don't touch this line.

I'm not 100% sure I understand what you say here. I guess you oppose to
fix the coding style as a side product of my patch.

Note that it's probably easiest to just not apply my patch as Linus
Torvalds fixed all .remove_new in his tree generating conflicts if
subsystems take similar patches.

Best regards
Uwe

--tulza6hxfbxjqqub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdYJ6QACgkQj4D7WH0S
/k7MeggAndfpB9zUQxBfBWgzl0ledQrTVIXFgRRuBtLVgRKnIgoINvwEkDoXYGzN
K5K2+PBUpPAsJYou7fuYCLbwDzgZZSqM1VWqrTerFkewCisXRkRL7myI4a7lSrX+
4TeYdGeRc9Cw4JDKnatMWGhLWKd5jI8YIQFhGwlAulaXs2jFa2I3ms8D3efs/w35
6wobhFbFA9ejcwBNs92teAYD0iuKqYiU6DHmguGnBLRYbPsFzcOg8egRmHoBfho1
UHmFRUdFmFoHIilSSgtNXER/hNrtCE2T5HRuAwv87+tPi04mBXCGFoemIkB+ojmp
YLqZkPtoX2Hb7PdpZG4X+loX/0u5OA==
=VQHZ
-----END PGP SIGNATURE-----

--tulza6hxfbxjqqub--
