Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D954212F5A5
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987922; cv=none; b=B932JMMHPrZJbvdRo2hmewIRirajRsemzXBFg9OK61iNNBSYQ6Q3T38kEn0J3/LlhUCEnR9Y2ZoyG8Qj0EerFkHi229vG8vvqKQGpiMJYtYM8uauJUVKnpU0vKs3m02TiaOONWLp/1z92mRhWNRFg+j76UfpYV1uE5agKUTyP2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987922; c=relaxed/simple;
	bh=SrLTe6LNmI2Qy4X/PzXDMolrYFHBCUpGkJfFvmvRLIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pu+GnRC3q0GzR6v6MWtqst+4wFBKGV6HEI5yaq3QHEwyMHG1R53ZVzlHWRdwWVbNTKllNgCjs+GRqeQe/cgh2SDHjRXrbSCmIRP79CCGa/w8BJuC6Vaxm72N6PfyNWVBTZB+jgMccyiRN1oopB/+mBf/piB+pG6Skh5/gY0YxB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YjW1M0ys; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YjW1M0ys"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-81019fe58a5so7976241.2
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719987919; x=1720592719; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvgJF+jSfrrN97GOeIPVuJO7l3DhQ7LOCIyaWiYq2PU=;
        b=YjW1M0ysJULgpqsm4meVGoly2sAKySyFui4KbonLBRTkuRrb6oZbKF7jIVmSy9Punt
         Gs/s6XgKwakMzyJLP9jxkBFDAclMXlf5T9JxSXDdbUQZ3YPC7SNkwul0B2sKpMVjsrEb
         x8sHo0YPZSG0i87HYTG1hA/8iIuULCQFv38SGVLSSx0jI8n3LYEsSaUSEnrnMI2LtuH6
         hVaPQgRwgmbn/Jhvoe/FaxrCCTzGDBMYjI9JoIvBOzeOrH9IBfAiyGLTKshHxH++Ne24
         +SIk+F60NGReckDiwXcC2Upw1awfm4shofFkyXAA46Ziw79lOQgfE92ntU1O2qxTWCCH
         lB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987919; x=1720592719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvgJF+jSfrrN97GOeIPVuJO7l3DhQ7LOCIyaWiYq2PU=;
        b=eWND61dbbWxEwSrMdIsbGCaojxVB3TTq9/VPLfph9YQdgV4SrHk0rKofXU7EFDnVNI
         KyXJAy0P0J/NmBM0B8ub+/VAxPbrIKBbdBpynV+xTCoMImteyRsBUbJblrU7EeHuXZxn
         nmD+0ShePcngT7/TTvh/ZO4qNXTTRdUwS25WUypdOK4Q2g/3fXMlMLqHEMP6aTiwzs/3
         pVIb72jr1PS2vN7uRTSzFrTq70N5eCpSHkigSWyrJi8kzMJdHIdCJGOprOGZXObBeq3T
         fV2GRAMPjYNFoHpPZXEuJ7ZMwh087G7U2+a01eiBLYKE3BbSvKj7iiwBRaG5MFbuQx9u
         /rFg==
X-Forwarded-Encrypted: i=1; AJvYcCW3KsvmlmZBqqEnpfvdrWtDrGQoh/nORXJIPO++SJvB+SF0uEAL+X2miWLccAvAKKx3229toiePnBp9sOxJJW3HtZGpr1P2sKinbKX5hacn
X-Gm-Message-State: AOJu0YzlzdLkrNWW3IgBYVL1mKbYlW9r7VsO0f0C8jCwupBvelHRzvcJ
	pMz5ksrXGeu01ZFAjmfPF+7owZLvS+Ej1N+vwaVaVqPvuBhz5nv/QkJxleSppxdRJ4iqsQarxx2
	z+kaw/zCH75EZg3PbnFrHufxgyHarRLi3Q0ESSw==
X-Google-Smtp-Source: AGHT+IHYNLQvtj5+CJIO/cfA6L9JD/1DgDPWhTVKUxMwnEjcfHfpgCjYxSNosU5sdlNMpwJkZNpkosw7ioo+idsbx+M=
X-Received: by 2002:a05:6122:698:b0:4f2:e302:4577 with SMTP id
 71dfb90a1353d-4f2e30248e1mr451020e0c.1.1719987919481; Tue, 02 Jul 2024
 23:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-18-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-18-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:25:06 +0300
Message-ID: <CA+GgBR-Xo97D7vvgYGJckHDXwPfqdTeDDysgdFNUe9+myH+8Jw@mail.gmail.com>
Subject: Re: [PATCH 18/20] iio: adc: at91_adc: make use of iio_for_each_active_channel()
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
>  drivers/iio/adc/at91_adc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> index eb501e3c86a5..af4b0224076f 100644
> --- a/drivers/iio/adc/at91_adc.c
> +++ b/drivers/iio/adc/at91_adc.c
> @@ -268,9 +268,7 @@ static irqreturn_t at91_adc_trigger_handler(int irq, =
void *p)
>         struct iio_chan_spec const *chan;
>         int i, j =3D 0;
>
> -       for (i =3D 0; i < idev->masklength; i++) {
> -               if (!test_bit(i, idev->active_scan_mask))
> -                       continue;
> +       iio_for_each_active_channel(idev, i) {
>                 chan =3D idev->channels + i;
>                 st->buffer[j] =3D at91_adc_readl(st, AT91_ADC_CHAN(st, ch=
an->channel));
>                 j++;
>
> --
> 2.45.2
>
>
>
