Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D90D132116
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988927; cv=none; b=MO2A0zVHlEWJPYD88HEWaDawF9Xh5qvRR9DzLW8DZQFoEX6bJbVDnvkFOy8Sb8m6tfoGK4HmrdNbOlMW5Xtdbapg9iK3FVkmXeFJVJesynEi2Ikc8uFr1oEU0Y2qu8Uq5mqXe6vSxgURTTe2iNUFyd2KWoQeLfhDXBdO0zQyNvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988927; c=relaxed/simple;
	bh=drhV+l/kmhfJs7deaiqhoqZiBYjVrhtJk0lA/W3ld+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJOeagCL/zOfRZf/Syz6zth4ZnvCMbLwPsXoGD+PtCrzOm6ZYabH8E4aVfcgOOWrUBW3QxCaa1xRSZXhA7P5useiGAwzR9crQKZJdE73t0m9n8VOaH1g2J/bHxaUnIe7FJ/usjLshOQD2559lL1BW48OFlDqlKlkIyJPg0G6gKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cDVJisfm; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cDVJisfm"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-48f6b596fdcso219700137.2
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719988924; x=1720593724; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yur5x8y8+Q54jThB7cQ+pODfMdCJaF6otUCUrfdMD2I=;
        b=cDVJisfmbez8WTwRQOTiK+NtSDU+GqBfOiKo+tV5RIS81ML+JCL6ewpU3ESpPumdeW
         OxLHBpHCbcz5Xw4gsI8sNgivOqhl4y7n0Vj3mW3MPuC2GoI+jSnm8f5/kp3swrHn/23h
         jlOqEbN6zytAEGx7N/QyK19nIq4BIGGV8F2JgZ3N6+Um5V/KaL5opKiLkuiHGTcpUguo
         wWHT6S8uGWT5oHlIsHI6IIQDnqqM//Csv9eaez029o/d0Er7E7t8wodPJHXFFxHj+a1Z
         MMLF4DV6IGzgnBEPUMkjTdA0/wwraQdZwByqYruC3j0wjOehbTJ0k+AJb3brjLK5cqrH
         7r2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719988924; x=1720593724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yur5x8y8+Q54jThB7cQ+pODfMdCJaF6otUCUrfdMD2I=;
        b=TZ3xWxXpFH29EFaVbNnx47Cvfu8sg1ngeRvOmsXB9ax7IIB1+vxs9p8tht51A1dOt3
         WXfM/FfOKxN3ngOJKACeOvmZBw18EtrPwhdz9Nr23SL0by83+0S70WxNZAuKawZ5XV3C
         XThQD7iqiKMEZwB5YsdqSaBBslvfSHTdUKYfCqjpkkjS/WDYAORpO0OwbHU1OLx4T5yo
         bIiRLE9ijvT9Hb7eTYSc7eg13BeWlKxTUR01eOdzcE+waVuW64+H0nUqGjbLmM52kECs
         IWjBdAccgkrR3K2nQMp8x1anzQSqyXgC0/4d3LAAqsaJdKBF8LOfrVRiiEPZDLMkq/8+
         DMfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzxQ/JDVg7ajfvjBobTvsfdRjLJ/CBBAwkPlxnaHVDAJew9dP8RFovuf7li9dUD41cFjIqCLHZt2cTaRYgLaix6lBBOortKXkJO7vlJrjj
X-Gm-Message-State: AOJu0YyC/kstGssBURk87R2oTJ9rX8Z4/1Y2bl9IQtT55EAbge85bUcv
	JIIuopU6ZebF2KuzcPKVGqaL4qyp9JP3TGFa8FJYg8zPwX5UD5OPeC+vQSTpIh8YWUF3sJe5M/K
	29WgTzQnBY6iJcbkCMwEbZZF50fwZGJmMQdq6rohyBWZzxAkX/KwDDQ==
X-Google-Smtp-Source: AGHT+IGU4zJdFJrDIOvSRVl1gGVAB4S58FwSZgbCuX9M66AtIbG8KbGOLxeZ/4CsuVGL4OM88BGVexB1wvd6cPcHaVw=
X-Received: by 2002:a05:6122:4b0a:b0:4eb:152e:cf92 with SMTP id
 71dfb90a1353d-4f2a5503197mr10200692e0c.0.1719988924050; Tue, 02 Jul 2024
 23:42:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-19-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-19-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:41:53 +0300
Message-ID: <CA+GgBR8ERS31zCavAhwBDOga1hnYJH1QfUdQSuaP2RLrXZw-fA@mail.gmail.com>
Subject: Re: [PATCH 19/20] iio: imu: adis16475: make use of iio_for_each_active_channel()
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
>  drivers/iio/imu/adis16475.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/iio/imu/adis16475.c b/drivers/iio/imu/adis16475.c
> index cf73c6f46c79d..1cc2a66a78ff3 100644
> --- a/drivers/iio/imu/adis16475.c
> +++ b/drivers/iio/imu/adis16475.c
> @@ -1608,8 +1608,7 @@ static int adis16475_push_single_sample(struct iio_=
poll_func *pf)
>                 return -EINVAL;
>         }
>
> -       for_each_set_bit(bit, indio_dev->active_scan_mask,
> -                        indio_dev->masklength) {
> +       iio_for_each_active_channel(indio_dev, bit) {
>                 /*
>                  * When burst mode is used, system flags is the first dat=
a
>                  * channel in the sequence, but the scan index is 7.
>
> --
> 2.45.2
>
>
>
