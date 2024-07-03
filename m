Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7229161FD8
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987733; cv=none; b=L5UWDknT0qbIEKQsVAkWYmyro16LMJr77ZxyiZFjLH1VBV9VvwwEOf1fK6rKK2WMJAf0cOnuLtAvrxM+6XTgDqXb2Et5qV3jv0Us7aqmvnk+++Jb9tlIHcc084OxMtmsDp6HP7yY3Lp2kZs1mhWn3VEmEdDAC/GHBe7Nuui4ECQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987733; c=relaxed/simple;
	bh=XZdsue1IOxPXtH6rQLFlCm6icV7WKAp+6Op3Ei/cy+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l65Y0qgjmvZaHER8yxnBcSvrCMZThIUMGq98vnZDx8OK45L/BOINR5lYtG7iHLpJPfIyZYrQYgAd874eytZO5ZvoA55BvKKW8qyDicvYdLpKQZ2mnC1w7aeQzawPR0li+X4EEqPTDbb8rbLe5AKLc3sDLyi59dZ3rc4uQeYjz/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tdm7qAqw; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tdm7qAqw"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4f2e0a2bf79so11557e0c.2
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719987730; x=1720592530; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBEWRqpgrXvyx1qgXgTOG9V3qv/r9LpDWANmRNgSxM0=;
        b=tdm7qAqw7oNr3iKj7nFofw+4JKdDF3/XMmyrSOv2L8VzAhkwWBzFYRr3+8UCDJFEtD
         0Uoca33Rsko2tETl+5XB2pNv8kv3kUPUimyn3DxUSjvs8gcz0BTEto7fcsuSWDCXOLV/
         ulqc+VnPBVa8wulHsL7yCv+tRXTUKYdxxCJhY1XV0hhMb9Qlwrnob1CZNOrsb5vsq/XU
         NhYQqXj3AAN9XaP6Vkhgpr7lrgD64qiM5Di8s8pnR1US4QxXXE9WKlUwN1jo9ZeWvDjN
         kfr1wJEIK9oIQItGlqFzooUBtfyw+8CPda/kEH01Yp2fzLU5QtTCLmxkGymmJJqxnbqJ
         8p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987730; x=1720592530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBEWRqpgrXvyx1qgXgTOG9V3qv/r9LpDWANmRNgSxM0=;
        b=IqDc69DkZnwqSgpGmu/IU7410Nme1U1Vrky/QH2VOV+NBgReDbOyeOmpMivGREYI/B
         9ER49SJ06cVwrklbGBXox24m9PRdG5GdAcqKI7C/kFwQcJ+BCyM24gVufiIhrFJ4ec4m
         wR089WGdGwg46KwxWJVuREJkO2cxxV/vtnv4BvRJMVnpz43PmZs3bE27lh/hU8iR2vQV
         f25QumpQE3GlwB/mB1sJ0s+00I5rrCD+JBMyrpHtTQgZg0/hxbHrmvsg1daSFeT1V1Zg
         v//ZNtAmXmETzszzSQlIAntMO0zoVftZmvc9fgfYVxQtxvdycX8ySJgxBFwsawrJv7+p
         e0hA==
X-Forwarded-Encrypted: i=1; AJvYcCWJFn6D5DMIpEBG+MU+4A/JyfGcd9+mA75K78iH/pb6W/vUCQbU69DjBnTY84uyHdtT/x4XjInLO7vZvbE25XktO//4YQiLz1jwEsH9JzfQ
X-Gm-Message-State: AOJu0Yy6VMQG6qTCrfUYX1owNrs3WndgJ/4sd8tZCyY9z1lNM72ybPae
	yamFxKag2GlKz/D3tQj7YoPId6gTdVKoV6nxBT8zIdFmT0ZbjlcTa+AM9Jn2RsFyVHxFAnv0Prh
	SrDCVQRmgRhW3ZejHiHjsbUcXGfKNDG9IT6F73I1MIcERP0gkK0c2yg==
X-Google-Smtp-Source: AGHT+IEjA+wy+jAwLZCcCRVwwsk42Iz8nk5t41mgUdbYSB5CMR/5n9Hq9GQdG9ybjgyMQCUw9l4XB1sl+wqswq73kHc=
X-Received: by 2002:ac5:cb63:0:b0:4ec:f2b9:65c9 with SMTP id
 71dfb90a1353d-4f2a555e9a9mr10758649e0c.0.1719987730370; Tue, 02 Jul 2024
 23:22:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-16-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-16-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:21:57 +0300
Message-ID: <CA+GgBR8BZV+bRyKWYmakeFM5VS0QLsPZz1a0G_H76SCHU4n4iw@mail.gmail.com>
Subject: Re: [PATCH 16/20] iio: adc: ad799x: make use of iio_get_masklength()
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
> Use iio_get_masklength() to access '.masklength' so it can be annotated
> as __private when there are no more direct users of it.
>

At this point, I am wondering if it would make sense to go a little
further with the abstraction and find a wrapper for the
"bitmap_weight(indio_dev->active_scan_mask, indio_dev->masklength)"

Maybe it's doable at a later point.

Reviewed-by: Alexandru Ardelean <aardelean@baylibre.com>

> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/iio/adc/ad799x.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
> index 0f0dcd9ca6b60..0f107e3fc2c85 100644
> --- a/drivers/iio/adc/ad799x.c
> +++ b/drivers/iio/adc/ad799x.c
> @@ -237,7 +237,8 @@ static int ad799x_update_scan_mode(struct iio_dev *in=
dio_dev,
>         if (!st->rx_buf)
>                 return -ENOMEM;
>
> -       st->transfer_size =3D bitmap_weight(scan_mask, indio_dev->masklen=
gth) * 2;
> +       st->transfer_size =3D bitmap_weight(scan_mask,
> +                                         iio_get_masklength(indio_dev)) =
* 2;
>
>         switch (st->id) {
>         case ad7992:
>
> --
> 2.45.2
>
>
>
