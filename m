Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3151B61FFB
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987989; cv=none; b=carbQJRrFmQVzpMBQoeq5pUt8jM8IqusyhZkgIV9QlAh2+KM93z6hEccSoCVX46hQ8YKI4oTNxrpHEYA543W8k+dJvn0g7OzARZ+gO85e5Toi/vn75ruWSsskdFyYWsRHONIWnAuHC9f7xWCPlmigjbbDMxj5E5Kev1WiqCZ1QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987989; c=relaxed/simple;
	bh=IPaXlrtvEWY4XmSWWnalLsC3CtYjJseAzPp1WvLsvYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdLkFOzc/zyUm9wVHKrNvPGcNNoGWaseML8Nq0NswzAyv80o9ZJyHmnf4ReDpvcMhh9Auj/RMkUH0CIxd5ACuJLy/SUr9XbPdDCS1+JqYa++BjBDMiVco9vBwIjy/Ch/RD6TFtn2ID4iVFjO8Hg//Zb6FUXaMZC/zwKTlWIjXuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ltHpUtpI; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ltHpUtpI"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-810214fd29eso1655241.3
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719987987; x=1720592787; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sne0kbDH+CE2KyZ6pihV0DRumsxIF74y33+jT/BOnEM=;
        b=ltHpUtpIlcDI7BddUSAqqWAGzFB1F757Nb4FwfSEV/E34qyNO+4iCnS+lX02rYgzc5
         LfjSEoMb+cMSyN8uMSrAtszYTSdhicCkGC1QyEdGn9q7gC92ZqvixjNjaRemJ4+v3afx
         BYB61TBFiC5Ow+fGBYoqohXePpaLeIAiucVnNj7/jhtamXfNGDis5w5HRBWnR1mob14R
         iR0VxzmoSlcgWi5Tv3kqCGqcxE5n0zZ14tWCRCfbKqNv4aComCvXcFZLrkdwOP6iP3Kf
         XuvObbaJfOk0y5adnr/4JUcDshFj1VVmux3PF/mWXBmgkDBDQLdsOdkMsbhsdJ312lYg
         WL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987987; x=1720592787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sne0kbDH+CE2KyZ6pihV0DRumsxIF74y33+jT/BOnEM=;
        b=Y7w1pyF7vviM959ve6p4LnRPUxGlMgJEbqZ6lNDtfq/qq0itE3EO056fshDdNaiDol
         8Tva9AhRASkTTedZ0hPwEJt47vMnzLVyLnfV/qH9gcJYUZgLKbTkiyFts/d//WoF/r8b
         4uzSONWRrulfKTB0A1mBVYHwKJuwUFGw6sB8AWOj4tBN7cL+OwEoQuF7i23hQ2BEojfD
         IhWVLmieFg4/RPDb3MdvTL3601Dm0xDcSIYyL6C+uCi6nGlNYbdSlEKlh1Od8LCejPck
         Ss6zKdqExEiHI5DyIsp5CeBNtrSfN0m7CeobpQKBFGgsqj4+1ClceXDwzDkXiAugWIks
         WEGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/V56A4ZE74JtjTHJKyWjiLUzMHsYatKsrBLzk6v9Yujg9IKZ9MkuU3exj6SMYZPrp+3qjlVPvnT2yQWOdgRO0UghHn6cSsloUXK3LgCV/
X-Gm-Message-State: AOJu0Yxwi9GJNTtv4zt4E+yKUJJAgTyovBCR0QRjTlDrP5pEyF9E5IsH
	1SjyKFrTKzJ+717wOP/xZ0CUw5fURqtfGXU+I+8uAU2366abL0KOlzMZGQdxEGxqa1+AizNkDJw
	CAcIAkKvgW4737yYCwgchuWLWB/M3Wi/n8bQxow==
X-Google-Smtp-Source: AGHT+IHV7uCAspqYexpyv/SktQQ4BYJXqCHn4QagF4ADMhb6Z4Ltp07c/8lFKyHFQ7r043Pz++ddER57r6T5Fq8YbI8=
X-Received: by 2002:a05:6102:e0d:b0:48d:c235:54b4 with SMTP id
 ada2fe7eead31-48faef3e72bmr11468217137.0.1719987987166; Tue, 02 Jul 2024
 23:26:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-11-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-11-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:26:14 +0300
Message-ID: <CA+GgBR_oj7XticpwcNAt3gE+Kr85vGzPo8UPNE5VOX2qddSFZg@mail.gmail.com>
Subject: Re: [PATCH 11/20] iio: accel: sca3300: make use of iio_for_each_active_channel()
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
>  drivers/iio/accel/sca3300.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/iio/accel/sca3300.c b/drivers/iio/accel/sca3300.c
> index 306482b70fad..fca77d660625 100644
> --- a/drivers/iio/accel/sca3300.c
> +++ b/drivers/iio/accel/sca3300.c
> @@ -494,8 +494,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, v=
oid *p)
>         int bit, ret, val, i =3D 0;
>         s16 *channels =3D (s16 *)data->buffer;
>
> -       for_each_set_bit(bit, indio_dev->active_scan_mask,
> -                        indio_dev->masklength) {
> +       iio_for_each_active_channel(indio_dev, bit) {
>                 ret =3D sca3300_read_reg(data, indio_dev->channels[bit].a=
ddress, &val);
>                 if (ret) {
>                         dev_err_ratelimited(&data->spi->dev,
>
> --
> 2.45.2
>
>
>
