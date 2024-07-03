Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDBB1304B0
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988005; cv=none; b=JQVBVBqSiGSbtAfBMtymIOTzzenvO6gUXB3k041xGgxd+vTtuMx9GXdlkJEPWhZJGj8He6JWc8jOstkMe5sud4a97PI+fdnxZ/lD6R3yL0FpG+RehaMvYwxvbZjktW5x/Ya+g5tLav+ZcyRCB95ammBeI7TwmlgfVRF1VuSVgG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988005; c=relaxed/simple;
	bh=Pk/QR1QRQCMZ2xFaECQBqXPCVHDzzRYa8n34BAZd6G0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+6Zn+Fy/pQ466le8mTgaMIrDKzp8YHJB5rWv/9IfYS3uepw+TCVSNOYuDA4OY6yKf2NwgKud5tzf031tiqIeMhEJG8CRG/oC/Jr86MolCvUUxGtSwMjBHIf5twlEVDGCAo6PVf6U1vu9Kl0oKosXAs6m/4OJ3srKuEjs62sCUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3DZvV3a3; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3DZvV3a3"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-48f375e7554so232391137.1
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719988003; x=1720592803; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeniwkoXAnUgaJ87uJT/b8fqh8VW1xJWs7CU9qOvv4U=;
        b=3DZvV3a3sI/+2RHXk8bJW7ulbAfI6J5OyZGYMVW2ozvr6D0O+a5fV768D4qYClotqq
         3kcT4u3gykVHYSFGzEFo3S3cgECj4jda92lks5iSqDq5krRDjpYTvkOkHjZuB2Eq3vhb
         6U8vLueObmEMXHsHFh6iWp6YawCyJ8iYzKy9+7Ptt9YGCD4nEdzAAAnTyiDXrhHROQ5H
         XkuVRaDKRCDCorwzenlgEtzUnmFEKBiPA1skHohEkzReJKrpBOJz1wh+FXbgqID93b4A
         F/eX/wc3bn1+fOGd7ZcsTne0mpU7x0kWL9GkqiJwsdDTj9Q+9K3AUgWQ4KBERsNvAJb7
         9X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719988003; x=1720592803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZeniwkoXAnUgaJ87uJT/b8fqh8VW1xJWs7CU9qOvv4U=;
        b=fhDmn8qduuICmDCcfGNyDbA0PZk4Ew7skGEIRgBs9sayVVu7A+fu9gT9hRzIKNn/in
         pKfgQoCVT0oIThm+sUhyvFR8QmNI1bqvMC6atM5MWlsVPJ0nm/Fgg4+bA/GyCtueLBM7
         AylfePt0Bn1+4HFBDfW8NRkPjSOxu5rkfz0+lHFwRbYiaQd0Ix9EeUenaLqEEEhFUzov
         UyPqA2JPEPHGJnoaooXoza9g7qplotzj9loqnyf1QWg/JZbacmYM6USn0rESVYMUDY9q
         1ruND0ERJOuEXGvVZR0SW9Ld7cMMUVep3qYdfzSfdyBqe1dr2FNEU2nOEMvm75mcW4Ze
         hmJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnqyQwviJjoCti9ZelBtsMr9I7G/3jXYwmJvaMctkTdune4MFw+z3VsK3o0yPg8g2zvcENNMEd+4iDiTEN4lotjrgTNCuF4PxUB1cdAWoN
X-Gm-Message-State: AOJu0Yw2s7YFbJYX6DIjXcYXqaBsbOdW+XQywDTg8KulKcLE+c3rV41v
	lJN/JUvRrDJUbk/GV2IebITu2POKKt+982ZrLvWm6aQU/B6fUfb/VczobB5C1jOvjc/2EYXI1+G
	D+TQauJuCkLBK+cXRr/Kih42jy73e+ghPpICe9g==
X-Google-Smtp-Source: AGHT+IGUXb9ngGHkkPuOkbjBMdicrLFhyex2By2jj3YkauKsdM6etom92MfQD0RMY5Z70Km8QtheStFu2YApca3rVv4=
X-Received: by 2002:a05:6102:2ac1:b0:48f:1db0:e268 with SMTP id
 ada2fe7eead31-48faf139718mr10136984137.3.1719988003057; Tue, 02 Jul 2024
 23:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-12-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-12-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:26:29 +0300
Message-ID: <CA+GgBR86+DgLh=e_Tu7XWDEcjwt1UUMvcTkwN6xmsuaeaODT_A@mail.gmail.com>
Subject: Re: [PATCH 12/20] iio: accel: stk8312: make use of iio_for_each_active_channel()
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
>  drivers/iio/accel/stk8312.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/iio/accel/stk8312.c b/drivers/iio/accel/stk8312.c
> index b3534d5751b95..abead190254b5 100644
> --- a/drivers/iio/accel/stk8312.c
> +++ b/drivers/iio/accel/stk8312.c
> @@ -448,8 +448,7 @@ static irqreturn_t stk8312_trigger_handler(int irq, v=
oid *p)
>                         goto err;
>                 }
>         } else {
> -               for_each_set_bit(bit, indio_dev->active_scan_mask,
> -                                indio_dev->masklength) {
> +               iio_for_each_active_channel(indio_dev, bit) {
>                         ret =3D stk8312_read_accel(data, bit);
>                         if (ret < 0) {
>                                 mutex_unlock(&data->lock);
>
> --
> 2.45.2
>
>
>
