Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D3885934
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987845; cv=none; b=RjPb/6qdr8xlxC5/UR/rcv9aM4iiHyOVduQkZkDTnIZRPbCrrc5UXVIxDzW7rpIvkAjdL6nZ9h7H+FtSXYEegjx5tsbwEvxQmU8PpbDwdMf4x4QU34RWkWwwplajjXWqkXgaI6KxXVpy3u8sZpib7Ni26MfEoJC0QcGrHI574SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987845; c=relaxed/simple;
	bh=MEOJ88XvyP4x4YpTAbmio5cpISsYZT4lPvcy33vcuZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pc0o5KZp7iwzXIDci+cCeoOT7tFuXL6jui4LI6BIZuWXTRdz5xaV4erkx/4qe1FFgyFMaB3b37S0ht2Kj7ws1WyahNL14kMsH5rA4gdzPP0/OTa8ug82UCcUbrp7savei+4d02b3MNk0+2rfme6nOIkVtAelcc8+Piu8NtWrZ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IoR/B/WI; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IoR/B/WI"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4f2ca380572so44527e0c.1
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719987842; x=1720592642; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B90T9+qJnSvewQnG3SRs23eyBpPBHimMd3xTTqkFe80=;
        b=IoR/B/WIqeYZL/m5hG1k7G3Yw0EViqKI/s69Yva6FGLv0mLi8QO1IPJmwtr52FBlQN
         O8pQNAm44LTzbEA7Gg/R2vOsHl3GBIqhmrNaplkzmSORJnISLziAWUxVuQ5yVbjOXt6w
         WHbNPn/AfLShRarqOE7cTUSc8RS+NwE29n5TtQkzUPkCSx9htcnDaS97u+1fZXyYis1N
         CQGY5+ety9IolBqAB2zc1sb8T/XqZPhbvw4FgfDj4MT3yD9c6YONxRVHkvxfAKLm3tlY
         euROelaWh6FwjKVQsVvezWIqB8qT2/SL80RXjntih2m7Xoy7AxPgUhMS54TFTLGFDsw0
         Ty9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987842; x=1720592642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B90T9+qJnSvewQnG3SRs23eyBpPBHimMd3xTTqkFe80=;
        b=Wi0IUh3s6+GB0X1g0lOFmsO+8cHz7fsipCrs7ou6SSXLUAEixemS+SVka5+tg9Mn/W
         HtFxXVnE+2Fqydav8SFflg4GCQ9/+vY8A6THidXegfqAVYSCjlzbjaqHJV/OHx02MZr8
         WxxKjxSdF81SKoxKi5x2ra3tpos4KrIlSLBPcrJpjx8IgLZ0QP8ZD3xS5wUGvjOTtit6
         LbzXNJ0RyDAJ+HA2RLd/4ZGYMODDNS4klo9/oWiFWruIqZQKBKqgdsx13q03n6hIEWn7
         g8bxhp2ZkQYd8hHaXHb+Q3D0hLx+Lw55dZ5b0kLevkiu1U2lzlmID0jWRVQixlQy7wzd
         4w5w==
X-Forwarded-Encrypted: i=1; AJvYcCXJWW3wMfx1VzP9WlafRJ3FF0gaDryft1iaZGasiMbV7fCskAq6ByOp0qEHzgRVsKdB/qoNxE5b2O+uiFCcXNCqNlHIh0uyYY/PpnbNh418
X-Gm-Message-State: AOJu0Yx/G2GCHSw958Uwb9p8/iiz/KOHDRwdrlryQfI9b3gdHpzBqJmW
	QNTlQjW3y4XVqNhYr5n3VdLaqxNlqTO/U2DJx6NfT+kkZl5HT6kmaa8FLXmUNBr0YIhLJhj0PWa
	c5uLQK+HiMLwacmNpONg7QJ/eJ05EpZap+WJuEg==
X-Google-Smtp-Source: AGHT+IEvoaDw6GoXfUAvbDw4QpnNY30WWBvZAY+2S6VYPqlblqVVWDho20/AIINjpZRw8gNL7XP031dwLiyilOrhXek=
X-Received: by 2002:a05:6122:134d:b0:4ec:ef7d:b99 with SMTP id
 71dfb90a1353d-4f2a5561d1fmr10725772e0c.0.1719987840954; Tue, 02 Jul 2024
 23:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-6-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-6-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:23:48 +0300
Message-ID: <CA+GgBR9vdx1=yNPUsmuiEHzUSpHvi=7_vb7EWYix9B_204nApg@mail.gmail.com>
Subject: Re: [PATCH 06/20] iio: accel: bma180: make use of iio_for_each_active_channel()
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
>  drivers/iio/accel/bma180.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
> index 6581772cb0c46..2445a0f7bc2ba 100644
> --- a/drivers/iio/accel/bma180.c
> +++ b/drivers/iio/accel/bma180.c
> @@ -876,8 +876,7 @@ static irqreturn_t bma180_trigger_handler(int irq, vo=
id *p)
>
>         mutex_lock(&data->mutex);
>
> -       for_each_set_bit(bit, indio_dev->active_scan_mask,
> -                        indio_dev->masklength) {
> +       iio_for_each_active_channel(indio_dev, bit) {
>                 ret =3D bma180_get_data_reg(data, bit);
>                 if (ret < 0) {
>                         mutex_unlock(&data->mutex);
>
> --
> 2.45.2
>
>
>
