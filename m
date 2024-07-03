Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4585934
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987951; cv=none; b=LedqHz1IRKygK+7grOofFzDAtrRfewksvviXvjjqBTE/AFe27ZRr03zd2K3w3QGCc5tvI572HXRcAOlLDYKaJyeh7Z+o5YLKrohSJ58JpgslXN4Pgk8BACO7DF+gGXLX6fgHolFOmVIYRqGIX45PMKtlyFL4Y2QeerTOpwMK4wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987951; c=relaxed/simple;
	bh=V8ELZwvPStHN7XtCJGOkalWpd40eiTtMCjpah1Ju8hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvPl/ImqPrf6k42liFmZd5C+v+P9YWGX+IRelfjniSz/AvHI6dVOTlO/ng5XAxVM3abzhuyY8ZYVT/SvpomMA43BqDlsHNwCdZy1x+LRSm7M/s6GR5nKF8u1MH5J0pvs/nXhN0ldg65Gn4CxU00LOPoJF45UGNrgqfI/TWyIIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NbIpkh4o; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NbIpkh4o"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-48f990612f9so270827137.2
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719987949; x=1720592749; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFaaWFettnsz/DdIfBTX7g1ECK6NJ71HmUEH6b4ppNs=;
        b=NbIpkh4o9Yxdg2k+9IjebNCwvIhBJ4AiB6XxJ9/2IhocowBb4+6fdotlxyK9I27Bgl
         r4zF1pnt8kl/jgwpfxMPzl47hxcqNTZkKzoYy0AOGzAhznGzjthRKYSBpJ0TPQaEh16b
         wSdQGFkvyooVHetTcXwchJ3tfmm1ukxUFn7e9nNky/jj1QkH9H3z8TVrntimr6LD8AJq
         VvdHh/WFdfL+qRLZuEf4Atva4QOjgedWL5wbZbh/BRfHKPsngSKeAp/jk6s5vGfh5bou
         7iC7InHBNS8zcIMLbsq/Mg+qdYlvdM6lcD+HqINKbxe2no9XfzMmE0W/CrKEZ5y3dgBE
         09LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987949; x=1720592749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFaaWFettnsz/DdIfBTX7g1ECK6NJ71HmUEH6b4ppNs=;
        b=tGZwpm5YXmiBf2QeqwOGu+AvlyHdyo465KuvJUOW8iRzyXe7OmZiH7i/xtJcqHBFri
         mpDceYwNrlBqtxrLwhGA+24b4W76Gj57pYyKtYoXnNHSsECr44sczg7QDL84lQriiKs7
         02BueKlme0sp8AUhGNzAkSK9PYo+usAGeD55D3SfoR/r41TBqgtaVuQXTmZQdYk169Vm
         QZ8OlG+YNLjqRDi1UUlcGE0EvQSFQHfnD3Ek4HCFReupqGylLFNRQo6IPI5KYgpKkavn
         O8K5XF403gH3L9E2qw3NQWi1gPZmel902UL/v8b8OKeMjpXSlF6M1z7vR8jWg19UenZA
         Zs0A==
X-Forwarded-Encrypted: i=1; AJvYcCXlE0m4m367wQUQfHdxx+IGxv50ZLTlst7tAgHgboBF7lEprZMM1sdhfyolJNiRaj8itEF4uVy6kGNfYH+U1WGj63JdtAJd4JpUNlomSehq
X-Gm-Message-State: AOJu0YxReOThCz5EUz/R/P96vSGYOwaWDmwADB9nurHd+g7VT/07KsF6
	KkyMnxF8SNBZWDHgmVqEEQfcAVzcGRoEwbDTbqLokU0bkBTXxgwBZY6d6iO25+vy5HbGbt8jxlk
	xB+Q9FYkQoRZZUhjwvRb0OpQ3F9u2MHTTQUF+TA==
X-Google-Smtp-Source: AGHT+IGObAsAdZCKi1a7+byYQ8mnkYslfL1K9ff4GGvlkclRQwUCAOn/metQfKX8+qRDQYMW+idWufXuEbjUv1x5+rw=
X-Received: by 2002:a05:6102:418e:b0:48f:df2c:6d5b with SMTP id
 ada2fe7eead31-48fdf2c7245mr723867137.2.1719987948849; Tue, 02 Jul 2024
 23:25:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-9-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-9-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:25:36 +0300
Message-ID: <CA+GgBR-x2RHT45Bp4D5VC66JAdZj_dcPRPVUbZMwALFXeA7m6g@mail.gmail.com>
Subject: Re: [PATCH 09/20] iio: accel: fxls8962af-core: make use of iio_for_each_active_channel()
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
> accessing '.masklength' so it can be annotated as __private when there
> are no more direct users of it.
>

Reviewed-by: Alexandru Ardelean <aardelean@baylibre.com>

> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/iio/accel/fxls8962af-core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls=
8962af-core.c
> index 4fbc01bda62e4..7adb8937cb4b6 100644
> --- a/drivers/iio/accel/fxls8962af-core.c
> +++ b/drivers/iio/accel/fxls8962af-core.c
> @@ -968,8 +968,7 @@ static int fxls8962af_fifo_flush(struct iio_dev *indi=
o_dev)
>                 int j, bit;
>
>                 j =3D 0;
> -               for_each_set_bit(bit, indio_dev->active_scan_mask,
> -                                indio_dev->masklength) {
> +               iio_for_each_active_channel(indio_dev, bit) {
>                         memcpy(&data->scan.channels[j++], &buffer[i * 3 +=
 bit],
>                                sizeof(data->scan.channels[0]));
>                 }
>
> --
> 2.45.2
>
>
>
