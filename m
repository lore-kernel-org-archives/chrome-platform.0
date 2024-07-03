Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0EC130A68
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988876; cv=none; b=JmX15WmnOQ8ex5HoNlPRuB3ChSQKfvQE+Xjm60aRstKZC/4hq9h7BpJ1pzi3nyTt7XO+/PnvkxDJHxuTIaolLx5s85nUMfrxYQ7NpPsRIUZ1GEGTKpsItXwvUW4XerZnAMd0gkxa8TB25Mc6R8EDZ67CAZ6ZOTbqkWNIa4Yf/OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988876; c=relaxed/simple;
	bh=kBvPam+wtayiSsEsdaSLKUSxp572N6R2tEegVuUGmvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsJVHwyC8Vb8c7uIsB/a/SLLJZcvQMGIAcBsc63GOAXzisELhtSuUvGyeO8O7q5FZst9WAEmvE+JaOG2rqIEEDsVvIGwOMTqErMfw7apBbe9jR1gJQJEQcb8ww/vjgbGA2eI3vZCF8uEI0gWzpvrFZruqjeUbvgI0h10R5T/4CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=abmO92DZ; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="abmO92DZ"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-80f5d511679so108411241.1
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719988874; x=1720593674; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+qfVxRO7lMpS4F3CssNI8YSPE1wk4OZAzwHLiNC6kY=;
        b=abmO92DZ252CFyufAoa7ZoTJYzCbT6qsA5zp1NM+sUvJv+CIjznL9GUy8XTFVC0Og5
         3Yds+mqZAhkBPDtJm9ezet+wsmFCmGQoWm0DOTpggUwew0izxm9NbyRAV2zGFBOrc12M
         h8Ehc7eHRZEJm0ewaftsX8N9oWIDv4JmcKN5SDuleDqWaEqkQelofOLZkhejYbPs3zXE
         U0ZhjCBjMISR43G1c+U2A1e4TEu2p9WezRmV3M6e4hUeUgBPwP6TgD3XKSJOLGD/aXg9
         JtvKBQ3C2UqyyQczqDcVU0kEmLZKtPkrKjolRMEWehq4kgaD5EzZes08A0xphkUdwoJn
         E90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719988874; x=1720593674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+qfVxRO7lMpS4F3CssNI8YSPE1wk4OZAzwHLiNC6kY=;
        b=KaxxyeSG8qnHjRhqPn50+/1tmKM12bBk3qhe/bfkTgCcNO5WrGwCcs9RNcSOH/pmbC
         FV9v5+vbWXruRCQql/KYPlbdynV+f2g2hGNYzh+qGUymzs2oE4uGi3PUFtskXYec4GNI
         LorINC4K/L2MyBNuCjTnWdVlaCv5Z2Xun37f2FS3hA3+UDcaLPeZFeY2OhSEDW09BJGI
         EUEBR43Z8b2Y8A9EFyTTtvw3IGH8uqnah1ceomTTts6C5Zyg/70B7rxRyoSEMFffgxwm
         k2bmVGUpYHkdnqIaV0/l4YE/EVV4oC+rPtuNPRWnrArj8sKZaUKOaPB4sqNkk7c/zBXK
         Taww==
X-Forwarded-Encrypted: i=1; AJvYcCVD1E6xuHIspvzWxCLPiLb/PvxTdZSPxUWiZArukPjXTEbetKhD+FoOxZ3fTL6+4I8w4GKWtrw/zyjYedk2sSdbqVs6B92NEF1amQ9OXIFj
X-Gm-Message-State: AOJu0YyCWsa8TltcuqFMiVHv9dyzheBIpxcGHVt3AuiQtpTM9fTf9UXy
	06nrZfW2yWsRD6iqBS99eS6IWkYMbgVdQZusQBFt+3xk34wqfX/SI1coaOoFii3jKdAXjnhm0EV
	q6tWuYlxfqlWfDJ1FUGB8KCt1xExzEeEos7W7wA==
X-Google-Smtp-Source: AGHT+IH6Q0YmNOMEoKTlGeEUWjrK7NdshvcMztrcr/4H1N2bIOLPyNtsDH89Im/x3UHKPSOSeRr8A5vLzJZSUUt3OaY=
X-Received: by 2002:ac5:c806:0:b0:4ea:fea2:4b78 with SMTP id
 71dfb90a1353d-4f2a5318e04mr9726610e0c.0.1719988873784; Tue, 02 Jul 2024
 23:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-15-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-15-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:41:01 +0300
Message-ID: <CA+GgBR9U=qz6D2Q-shbauEEaRAF9db7qb-Vy7GiQQAGJw9LxoQ@mail.gmail.com>
Subject: Re: [PATCH 15/20] iio: adc: ad7298: make use of iio_get_masklength()
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

Reviewed-by: Alexandru Ardelean <aardelean@baylibre.com>

> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/iio/adc/ad7298.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/adc/ad7298.c b/drivers/iio/adc/ad7298.c
> index c0430f71f592..0128436367db 100644
> --- a/drivers/iio/adc/ad7298.c
> +++ b/drivers/iio/adc/ad7298.c
> @@ -109,7 +109,8 @@ static int ad7298_update_scan_mode(struct iio_dev *in=
dio_dev,
>         int scan_count;
>
>         /* Now compute overall size */
> -       scan_count =3D bitmap_weight(active_scan_mask, indio_dev->masklen=
gth);
> +       scan_count =3D bitmap_weight(active_scan_mask,
> +                                  iio_get_masklength(indio_dev));
>
>         command =3D AD7298_WRITE | st->ext_ref;
>
>
> --
> 2.45.2
>
>
>
