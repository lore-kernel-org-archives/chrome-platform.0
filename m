Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9A812F5A5
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988022; cv=none; b=jkl/RVJO79wuYLrXo0YkmKjqCOWVRyFJH4NNAaINSOMencu9vkg/3nd0it/jp84AY0ypmdlaVmiXUONJJH1nAgWFvhJorsP6aQri//VlUHA5MgE8IUC/2BJxNU6dchDghnBkb6VFb+G/yblyoRST/QKYDmhjWZPwGznPGvFK4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988022; c=relaxed/simple;
	bh=mNOyp5nt5YSj5nivXwurSKYbgySZf1yfj1skRNEAivk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPV6GAP3v26kY0PleipC91DyPajUaqxt6HQlGN+T72bweWgbN5nfoOuNB2jQbdyUS/+VShdTEzcIFwZyFwDUj2s2wYN4WqPtHbfyEHG46F+yYP5opcYESNy9qefGiCActNdUWqg3mIh1o8kPVhPu1j1/iy5LvjI1k9CP4nZ05Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RSiBv3vc; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RSiBv3vc"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-80fe1e7ea8fso119276241.3
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719988020; x=1720592820; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWNmlHwbvik2jfktevuXdcU+OyRMPbGqVNPwaYztXVo=;
        b=RSiBv3vcDnQCDvOzv9a15n1xcNO/jSM9z5FwGdwzxdajFCUQ8uJwMR0/rhdP/G0uB4
         laXcykvoq0+m9HXKY9C8jzSkdtdGDg19mXmVfMPbmwvXSaLc5fl3CaMHsbJaMburG5Ob
         21EDaUEptAxk+vaTVAdXQWo8HdoRQDjlIlOkfh2CmqcxjjNbeP2DCLJQdJI+yXHP/nM7
         RcNyjUl/pM+6N+VRHz8/AD3gFnWqVGPzan/ck4mp4sf4xBQyRs411SceyHV+pMjtyAt8
         n+khLaMV6ALvBfhGBVnmjFrKcZERxqEM8bAzftknV5+8QQY2+iqxZb7/pflSRgjczJ62
         XmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719988020; x=1720592820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWNmlHwbvik2jfktevuXdcU+OyRMPbGqVNPwaYztXVo=;
        b=cvqSlDpURvpPDydOZu3XugPtTg7GaO76L3vMdeYVUFWl41HJxoUbKYdUF7shBQNdud
         2ozS1J5IITeLQkYVgxRZVeOHrXfDODB+A4i69eBFqFM35NyLbKQw9qIurkLKzIXho55j
         TOn85LyGuiosx2G3LgokO9IYPDt+piPOQsz9DPjzf5aqcszate53J49wDcRhe7Z1qyMi
         EXljGilQ3OE4R8OJztqz1rt3QD0t8AsgERoCUN7QL6nbvQ8xuo+2o/JF/b3IUNsjF9HK
         Jk0zoVhfjakS9/U1UlP1QDJjvKoltN69qDYIe8pciagxiXtCa/WSAteinLS4xT7k8HRv
         Saww==
X-Forwarded-Encrypted: i=1; AJvYcCX+NY+qRnEpyswkt7QDjPMK/Dgg879X4EWir2Q/CtMPTv/bB3Xfegali71mrAnk3znpQREvre7W9GPTz0YAJ8Iq25cWgpUm5QW4n8hBsH08
X-Gm-Message-State: AOJu0Yy/KFbRQmATeZUrrwEMR3ULfddAUwRDEOZv7uSwKo6jpcnqRIqm
	mHBHPJLEqWu+v/SSVG2v1hn1Thp6wGaQ6byZAY5OcPCvb0/i2oA2kNWWu7Z9qOcFOsL/PBdgpGs
	TYemRL8FsOCx1yhL9nPkgO/5OW81wNJ14w/INig==
X-Google-Smtp-Source: AGHT+IFUY3OQXhLxn/wAGRSfyMZhXQUVvO5Xb6CsftE08qTuXYM6tQItJApnb2zB5pS9urRkiT+bere4b5ywBs9xtFE=
X-Received: by 2002:a05:6102:5107:b0:48f:8cd0:832c with SMTP id
 ada2fe7eead31-48faef5ebfamr10426671137.0.1719988020151; Tue, 02 Jul 2024
 23:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-13-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-13-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:26:46 +0300
Message-ID: <CA+GgBR_Rn=phiaktV98LyaVaJjuwFRCdrPq23DyCMoWHOZgxjw@mail.gmail.com>
Subject: Re: [PATCH 13/20] iio: accel: stk8ba50: make use of iio_for_each_active_channel()
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

On Tue, Jul 2, 2024 at 7:03=E2=80=AFPM Nuno Sa via B4 Relay
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
>  drivers/iio/accel/stk8ba50.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/iio/accel/stk8ba50.c b/drivers/iio/accel/stk8ba50.c
> index 6d3c7f444d21d..a32a77324e92d 100644
> --- a/drivers/iio/accel/stk8ba50.c
> +++ b/drivers/iio/accel/stk8ba50.c
> @@ -330,8 +330,7 @@ static irqreturn_t stk8ba50_trigger_handler(int irq, =
void *p)
>                         goto err;
>                 }
>         } else {
> -               for_each_set_bit(bit, indio_dev->active_scan_mask,
> -                                indio_dev->masklength) {
> +               iio_for_each_active_channel(indio_dev, bit) {
>                         ret =3D stk8ba50_read_accel(data,
>                                                   stk8ba50_channel_table[=
bit]);
>                         if (ret < 0)
>
> --
> 2.45.2
>
>
>
