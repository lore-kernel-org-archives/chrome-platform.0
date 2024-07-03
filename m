Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B14D8AD
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987031; cv=none; b=B01mdQt3+9ppPurORHhx36FtzZJ7TktqJFBZcA6sEOFaCccZYZx08S64nkzvMpWAY8z6ZW/HqZd+ggdGneduRWbFMR3uzprVzQL1hCYmsAZ3i8YBmh9aHtedJv2/dbIulGlEeEQ++89gTy8oocNvrv/Ja8KH91Z+vlA/adCKX7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987031; c=relaxed/simple;
	bh=pc8ANiJ80l8AyWFumFO0M/7xAzIYJdDQhrWSCZ3cT1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXqyjAbEosh0ITuir8DnZdbdGhS/75Z+g30f+TLihd9BddZlXl88qutIaSsWS/7Anct2LUgf++ezYIC6iOUkTypCPUswJaqQT0pxgNqFKSoeEOuQHVomlViz6RjGHjAnoJk7jjTGWOjdj+VJzjdQmQ5jKB0vSi59klH1E7x8Ewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LBBJhKaI; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LBBJhKaI"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-80f6307b117so105594241.0
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719987028; x=1720591828; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuQlEn1bKXmTtw08wuy4xcpjyoCGwx/Gk1HDM4Uta84=;
        b=LBBJhKaI0BLGxnZqWv+Bs1lTdAvHLeLr9/BaIVtk3pbnV+JYwFy9fZFxsHRlL+p21D
         djTihlQfCK4w/joqB/Xq15zzmMFsbrM65IG3+OK74wpa47mB9+1FE0bMBMvSfKGa4Qjm
         8omL/VsmAWSk/ZnyFsmCPK26FHsZrnZQq+FxCV7FsClrLLqACxB/wHr4eM0E9mHWBy40
         wOphkJQbVkg09UEbKgKAydUZRtUNtkwjuv33cue/eE1cYL0CSRhMD1zqKN4/dTky8Bny
         MO1HfA9btcOdgUFlh2ogOakGF7w0FnRcLp7Y5ddsssByXN0A4rVcfbaUNMqLXadsr4lh
         o31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987028; x=1720591828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuQlEn1bKXmTtw08wuy4xcpjyoCGwx/Gk1HDM4Uta84=;
        b=v1p2tof5gxovoWJAwskto4jxFu4c1XVK9bsUxGJGqfRbxXoGrKriDD6FfKS1Scx+xD
         NCLlcPsyW3jxqlNRUj6+jECMDv4g5JDFFRnWjxE0XEJE+S4GvAfIf9TPzSxQZuJXtHd3
         dnkj9my9s5twYkKnrJXVXicl0852htQtxLbrzvRq5+sBFMIZRfRU6jcOwpigvbodXgyh
         KzhVXm9bT4qXT8HxcNlXhaQZQTK/fPKx43PtSspi+/ei83vkcKHJqfD173LiYOiGNFb5
         YqCMhQr0iHIBTjjVWKeyQJyzhBuXkJoMWQgbCLigXulRj9NvpLDziVgBTz+ZCbkhbcZn
         EHWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmT8t7yWrpRri2w++u2Flfbjssalq0A6zGtFJp2gtBRMR+9OLGxws9Qj+IDd5Ro8MLd1AqeEP175cO5BdoIlYuCQLejFCbKdpVeTO0W3Uu
X-Gm-Message-State: AOJu0YyfWDDtff1MXrHgPfrtWnap8WGvAlZkvjxQu8aos5apub2PfIid
	P+GIHPr/Ezhdqklp4bfbvlux1chG1x1yWtGb9sZAuXVUfLwk7gP/bg+g7Ez4Zfp4aGC5EskX42b
	o4VbQ0CFmTqpsYcvvJLciBcruHbbsLXTEuNSJvg==
X-Google-Smtp-Source: AGHT+IGUm6vh2ZK/ADqj6mBXlm0rx9uk8jTZJpwdWSND65/86xD95RZbIo+NssVjVNwmhp3zcwo1NixrZZhNFtJGqd8=
X-Received: by 2002:a05:6102:5090:b0:48f:19af:d2a4 with SMTP id
 ada2fe7eead31-48faf0db435mr11426822137.2.1719987027726; Tue, 02 Jul 2024
 23:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-1-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-1-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:10:15 +0300
Message-ID: <CA+GgBR-anzo8VvTT2yc4dK35YBOCXV914QL1xcocgMfc71U1yQ@mail.gmail.com>
Subject: Re: [PATCH 01/20] iio: core: add accessors 'masklength'
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
> 'masklength' is supposed to be an IIO private member. However, drivers
> (often in trigger handlers) need to access it to iterate over the
> enabled channels for example (there are other reasons). Hence, a couple
> of new accessors are being added:
>
>  * iio_for_each_active_channel() - Iterates over the active channels;
>  * iio_get_masklength() - Get length of the channels mask.
>
> The goal of these new accessors is to annotate 'masklength' as private
> as soon as all drivers accessing it are converted to use the new
> helpers.
>

Reviewed-by: Alexandru Ardelean <aardelean@baylibre.com>

> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  include/linux/iio/iio.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 894309294182d..dd6bbc468283e 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -855,6 +855,24 @@ static inline const struct iio_scan_type
>         return &chan->scan_type;
>  }
>
> +/**
> + * iio_get_masklength - Get length of the channels mask
> + * @indio_dev: the IIO device to get the masklength for
> + */
> +static inline unsigned int iio_get_masklength(const struct iio_dev *indi=
o_dev)
> +{
> +       return indio_dev->masklength;
> +}
> +
> +/**
> + * iio_for_each_active_channel - Iterated over active channels
> + * @indio_dev: the IIO device
> + * @chan: Holds the index of the enabled channel
> + */
> +#define iio_for_each_active_channel(indio_dev, chan) \
> +       for_each_set_bit((chan), (indio_dev)->active_scan_mask, \
> +                        iio_get_masklength(indio_dev))
> +
>  ssize_t iio_format_value(char *buf, unsigned int type, int size, int *va=
ls);
>
>  int iio_str_to_fixpoint(const char *str, int fract_mult, int *integer,
>
> --
> 2.45.2
>
>
>
