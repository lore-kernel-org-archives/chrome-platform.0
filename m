Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066D112E1CE
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987975; cv=none; b=eWxpqkad9Mp6iztmC9dFTuF512Mm0pqQuMBHsDPdalJcemBCyGr5a1W6ynnSLAflv3STKTBg9QhVRXFzLEi9jjefOaGxOXARyQs+1dGspxH0Frb+2PrZfo0WK8A3MD6hm7Yx45P/nOyaMelHwnrwLd5I/FBrHGUE7SBQMUQcUIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987975; c=relaxed/simple;
	bh=+JUZDJwt7GmXY/xHCkVHzO3t0qk1bmMRJ0xUj29PKY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k93zyikEW/wQzohV/UDVTvoAgnCz+Fj5QqsVzN2zBUe6f9EdGPK3l4kkdElS2sRVD0ATHmmMmDu05t68x6eBL8TXN+uw9gQClckGQ6o9uOWNavYvaEAH501AwNTEu0lRJoHK1dmFVib/PrYsk3ipvLivXACOXSXV3ZCaPw9ij9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WV11F2nQ; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WV11F2nQ"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-80f5d511679so107460241.1
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719987973; x=1720592773; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSEt4ErQh+yCUcOjOlUjrmraXPGAWlNM6sPGDlobEU8=;
        b=WV11F2nQIYXFqxe/VYHfTHSs0p6GRfIt8pgb4rq8Ikg+OdUAxUl/KHGAbrAgNgQR9Y
         FYEo9kGRUhNQp2ddh12Yozx4j+34IEj84HYWYCBJjh2l025BVxC7FNy4fAL5zvsFE0UN
         PkPZbWQn1leXkw9/suX/q98Y6j5p6n82Q68lDLqGKNEm4SzHwDIQSjvOluf6mx/QrTrH
         oUxOmGbhhkv+WRVl+8O/Y2U8fC/hXCAnsdR8g5hIs+HS/SxeXVfmSCARJTCmJ9XK0wrP
         dohNa53KXPAjPRE3ruf8t8TuUFmKYIc8EDMyravUe0w7yukaG0/Vul8vXlfPAi5EqOoh
         qPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987973; x=1720592773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSEt4ErQh+yCUcOjOlUjrmraXPGAWlNM6sPGDlobEU8=;
        b=Sqnm9hvE74TF9whki0cBh0W6npEQbfR8cC6+gi/TSdAznyuAMIjP77mQOOPCUwBmUG
         Xd8Eic+OZn1+LJQu68rB1aRQs1ecDBVNdsAWR5l1LUJElMsLIG8vkR//JLPZj0qVk2rB
         4jVIPapgpAUkVIJbCpj2EU+L0PYxyNreud4oyY6iupcx168fED1IH5Pw7FTJo6TyDYW9
         7KzlUbnE72tQZQKR/CaTU2Kp2CCdHxKxdyXnHooBr/34QhkiAotzx9HB0ZOyYjvjE2/E
         SO/qjPXXRSevEItOMHdsqoxlKCqBlkobuFw4tgRQWEIQARvb/csw6OloRa6uHPOCku1z
         G30Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtZWEXfsjxvoBwyan0lkmY+ABxWASE8ZJgSh+fj2ErluIU3mRmvOkiVEO5AQwluG/GbEQothw1/BhQQB++BXLYXbsM4/7A7ug/8WOXl+hI
X-Gm-Message-State: AOJu0YyjICI0PIn+G+HOBjKxHPP9YIQ1psePdjZKVlJFU/wE6btBzHAx
	gVrb3UXrk7mRgGJJvbGVWyuEYwh6ypM98sozjX+4YBUyBaLmNubzTU6b/UYZfJl/PlNOmipL5F9
	dsLlBMUpNAVTbZb532XGka3x9DAs5ypRfUszbYw==
X-Google-Smtp-Source: AGHT+IFigxZLH8FjIQ1Jvmk16KcKFcIpIFcKLlY1yHGB5gQmsCe1MwzxYPP5Yq1ftaRafP/l+O8BTo7ykPwhe+0VBFQ=
X-Received: by 2002:a05:6102:418e:b0:48f:df2c:6d5b with SMTP id
 ada2fe7eead31-48fdf2c7245mr724438137.2.1719987972800; Tue, 02 Jul 2024
 23:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-10-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-10-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:26:00 +0300
Message-ID: <CA+GgBR8T7hYoetJNJBt=PtGiUYkTc1x1fnOuMGv_z7a9nL=LnQ@mail.gmail.com>
Subject: Re: [PATCH 10/20] iio: accel: msa311: make use of iio_for_each_active_channel()
To: nuno.sa@analog.com
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 7:02=E2=80=AFPM Nuno Sa via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:
>
> From: Nuno Sa <nuno.sa@analog.com>
>
> Use iio_for_each_active_channel() to iterate over active channels
> accessing '.masklength' so it can be annotated as __private when there ar=
e
> no more direct users of it.
>

Reviewed-by: Alexandru Ardelean <aardelean@baylibre.com>

> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/iio/accel/msa311.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/iio/accel/msa311.c b/drivers/iio/accel/msa311.c
> index b8ddbfd98f112..8861010256f2e 100644
> --- a/drivers/iio/accel/msa311.c
> +++ b/drivers/iio/accel/msa311.c
> @@ -900,8 +900,7 @@ static irqreturn_t msa311_buffer_thread(int irq, void=
 *p)
>
>         mutex_lock(&msa311->lock);
>
> -       for_each_set_bit(bit, indio_dev->active_scan_mask,
> -                        indio_dev->masklength) {
> +       iio_for_each_active_channel(indio_dev, bit) {
>                 chan =3D &msa311_channels[bit];
>
>                 err =3D msa311_get_axis(msa311, chan, &axis);
>
> --
> 2.45.2
>
>
>
