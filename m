Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A485130A4D
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988904; cv=none; b=IVp3qd5CAZ72K4dUO6UEPtItrt+EVhp4syNS1o8X/8wteww2OakHbWih4JC7H+X1mSp5TAwh5gtDRee+fTbxv3lRFXmdNg9kYfP1OZ0MPvl6kjJo0RSoUNczh6PJaO8IBjU3qh9xbkWjoa0S29ew4LIgHWs3Wj4L7VPNgJggAPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988904; c=relaxed/simple;
	bh=bMJccecekkBOVLBKBVwDQI6O/15WUEit6u9QoGrRMKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+Z3HkZy4FqbJJ7FkdfXN4m7T3pEEk0ZLytr0In4ETFj5/lGceHD3T51dKc6+8o2iE4I2rdGMsxnLEuUKXCkmRuXhNquvv8374fQO6FNdohTXxfmsQ0l+mWckushmD0A9SYGsch/Wf5XP2F1sunROXD+KK4/EH/gyGgMRegT2KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VOarEWWb; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VOarEWWb"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-48f375e7554so233245137.1
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719988902; x=1720593702; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vLgF0+RXMLNkLXXNsHGCbj/O0dwlYR16fZtiGDJBZ4=;
        b=VOarEWWb8o70icMsCm4LiggyMuFzGUDShMSW7sSUsb6h1oNYwugPlEjJ0HNRFdSQ6K
         q14wh5IKd1EZcSwYF9/kTEircz8cInfLTu5UGf9nd3wktfqaMg/DAAAZaW67ugdLjZj7
         /CIXJihBzPbvZQ5fWGosJExrMlsC/LMR6cHPEbNcEIoxeORZnsj6aM3ZqFYoRweFoR6X
         7xU+6GSBIDXa91Vomt32NcmvLsqhk9XPzPabekxfaHrmK1t8GY6g2m4CS4SWgbrU0eyk
         T4cguWCj+W4J/NXWGYfz0E/rV1hfSVDCk1fkbWm3q1xA3I5vaizlj0/50q69BtBAdBmb
         7v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719988902; x=1720593702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vLgF0+RXMLNkLXXNsHGCbj/O0dwlYR16fZtiGDJBZ4=;
        b=Sgng/NLdATRYuvgOYQix9HLJG47phjM/X14BrmBDv0vifbKo19Vj25WPZErKYNRZyM
         jnOFqlF/01Ye5qGJ0rctT0rpXi0IHvGRgtvHgTYpiY2pEpjkix9bcGrk1NPFUMvnaB96
         yCNcO70fIvj3MopBhDSxlzCf2GijVmUld5PJ9wuV4la3rHSAyIsF6Gcg94FWvIyTIB3W
         VuOOAPmPvspjyzzGooGDvHaxzP2Ju80ndGaS1u5PBIy3yV+NyfRq+fDbHtQktbik+wuC
         6Q40k+LyGXBRBefua/NXRoIy9XoBLYB9kvmdNvOfUr/QDQFLIBNQRo0ZYviEJ4fpCoGr
         b1EA==
X-Forwarded-Encrypted: i=1; AJvYcCWUz4owWps/EERpeliJZ1KXvudlPUNjZ5gE9Xx6GX6ltmt1jhVaYDcQZIwTjgHT47vN5yWEQcOnaWGyoyf5wqMcwHCL6bpxg37W6U8ElHYU
X-Gm-Message-State: AOJu0Ywovhrw5uOJs6yvGYQyDuXIos2gCo/NFXR4bBQrk4hyo2QNwXzp
	lrhm5QDRVdgrzTcyVRcHlGGQfztFJrMcdmZS/XQZuwI1qWxdrTGYbRPlkR61YkHBaFX7i+i9/PI
	t2VAsD1cNvcsCL0tR+Oq0hwfqOILQHjM7InZD1g==
X-Google-Smtp-Source: AGHT+IHGMiHK00ERdKXHAtg/IXadbm+bfVQrAHKqajcWok4pbyn+FZp8dsrbD42BALRcZB0eIZA2QvAekMrooHu+E+0=
X-Received: by 2002:a05:6102:a4b:b0:48f:8cd0:831c with SMTP id
 ada2fe7eead31-48faf03f703mr10165225137.1.1719988901931; Tue, 02 Jul 2024
 23:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-17-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-17-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:41:31 +0300
Message-ID: <CA+GgBR_8s++E59xFBpatkB7KzHNQKC88MtJCy98xbv9n-0KzFQ@mail.gmail.com>
Subject: Re: [PATCH 17/20] iio: adc: ad_sigma_delta: use new '.masklength' accessors
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
> Make use of iio_get_masklength) and iio_for_each_active_channel() to
> access '.masklength' so it can be annotated as __private when there
> are no more direct users of it.
>

Reviewed-by: Alexandru Ardelean <aardelean@baylibre.com>

> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/iio/adc/ad_sigma_delta.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_=
delta.c
> index a2b87f6b7a07..62653d7fe39b 100644
> --- a/drivers/iio/adc/ad_sigma_delta.c
> +++ b/drivers/iio/adc/ad_sigma_delta.c
> @@ -350,7 +350,7 @@ static int ad_sd_buffer_postenable(struct iio_dev *in=
dio_dev)
>
>         if (sigma_delta->num_slots =3D=3D 1) {
>                 channel =3D find_first_bit(indio_dev->active_scan_mask,
> -                                        indio_dev->masklength);
> +                                        iio_get_masklength(indio_dev));
>                 ret =3D ad_sigma_delta_set_channel(sigma_delta,
>                                                  indio_dev->channels[chan=
nel].address);
>                 if (ret)
> @@ -363,7 +363,7 @@ static int ad_sd_buffer_postenable(struct iio_dev *in=
dio_dev)
>                  * implementation is mandatory.
>                  */
>                 slot =3D 0;
> -               for_each_set_bit(i, indio_dev->active_scan_mask, indio_de=
v->masklength) {
> +               iio_for_each_active_channel(indio_dev, i) {
>                         sigma_delta->slots[slot] =3D indio_dev->channels[=
i].address;
>                         slot++;
>                 }
> @@ -525,7 +525,7 @@ static bool ad_sd_validate_scan_mask(struct iio_dev *=
indio_dev, const unsigned l
>  {
>         struct ad_sigma_delta *sigma_delta =3D iio_device_get_drvdata(ind=
io_dev);
>
> -       return bitmap_weight(mask, indio_dev->masklength) <=3D sigma_delt=
a->num_slots;
> +       return bitmap_weight(mask, iio_get_masklength(indio_dev)) <=3D si=
gma_delta->num_slots;
>  }
>
>  static const struct iio_buffer_setup_ops ad_sd_buffer_setup_ops =3D {
>
> --
> 2.45.2
>
>
>
