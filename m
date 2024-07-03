Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5540779B6F
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987894; cv=none; b=NOMT1MTss4c4NzoR/An8cBzU9naTujyGqghPhGxGF/8m2fRI08YWrZo4inSBeZYIgC7kHckriqjd5ZOXNKNiWAYus+a1HjwI7OFvYIJXYqA5Be80KTv8CaLbn8nrwKR4Wgta7anyLMlqfUbxRtQpoMlcbPvL2R9vSunANde9ziQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987894; c=relaxed/simple;
	bh=Lq0UPT3vUQwvMnkgN5ANXQqvkRrFxjXL3a8v7cYbbKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXdl4+QVntkt6dZyPAIu9Qv9JSmvZm1qCJnMptSVnorcxEwUSXFN9xdvJdpzBaNWX/vTHYqEhNyZNdLPxaLV1YzsjL6e5nB177xJuR00Qi/gBY2rm732Y7QTVrulNfY8zmNmLWEfuMmOvhRqc45/js0FH9uyqEuxD7Y9vSbIao0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LjtVCkeC; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LjtVCkeC"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-80fc44acfb5so116481241.2
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719987892; x=1720592692; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEAcm2StCwwyeYic14Aly2kc9DLmMiiXY5kGptpy0bM=;
        b=LjtVCkeCehRIeTjerQL0iDMnIbQDRd3q6Z0eQ63fcIk0hwWX12/NAoMCF3eTDT6/hL
         6G20dK50F+l38W6iFohdKuNoCtcaQJZgn39nx42oWk9XC8ZvFrgNFgIZJT16vhCc+tBB
         Q3laHfLTsjZlLKi3hempKmCiISMziJwDyEFU6elH00DwGgPU9XCzaiZNIIl03zK3X2Cn
         3+iIZs/7NsxbiIoWWphXHTb2qYHdHKPIWxU2ChQNin4tUc17VmfU3sg9KzqD7tVDv819
         mPg6c0EwP57TauRPtpy8KLwdxZjXVZ19+qyNFr+unBhWaSL7IS6xiwdaOA4HFUe0172j
         f+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987892; x=1720592692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEAcm2StCwwyeYic14Aly2kc9DLmMiiXY5kGptpy0bM=;
        b=I5nfZPAtUrtqUN6VItKV0+hCWvtysD0krPk51um4pCBkp8hZx1jL61QLzfQb9kux/t
         kBOfZhbKYwkfaCg+mhVQXYDqdLUPcqGbY7ioXf2edpSt78zBmjPVLgFNrZfH3NtZqeu3
         H5HCqPb9NHsS1H5aqS83haxo8X2cJH9gqDZYfuLhRvOiZ9x+wXhjPNW+oEhp7WdTDL1N
         r+OD2CqAMyyjwJZB02aYbFgJlVnKHqLbCzmExCcSkIxfDObDP1hfCdaOxvMGX2kxFyJX
         v7H/37D71pt5px7rK8ArDbBQNwKVWrnNvwMt0x6CmsEcIkif7y3UCvRmhSLzr28C5b8F
         KIaw==
X-Forwarded-Encrypted: i=1; AJvYcCUWy1ouwsXVRrxpR26THWgW5bFwJrn4V1BKLsi0XPzjjAyUkKQoRAxkE6IvaOTjJMIQYF0w5cnuf0c0rtGjaC/MhLnwtLJyQxMxudktK2Hg
X-Gm-Message-State: AOJu0YzTEFj4JB2uYJTX0CUKxY2a3C8S2UEKvHNwoggde+MIH6K/ocdH
	MhJwsuehS3r8p1gSMOjA4GMPFw/qyZbtVlf/NnkPrhvYtPjhjI0DMAWB5qzMiYYyxHs15s5DG5w
	kJvgy01hBUAyReUCsZXaeEAHFfA+SNdcT/daYFA==
X-Google-Smtp-Source: AGHT+IHzDhYnFR47ftpP+Gt0lHBcil5vtvlxM8vVGY5EFzQWbzo51CBClp9XHZNsLZkA20Z2tXq5nPi0G0RMWbj9Yig=
X-Received: by 2002:a05:6102:5090:b0:48f:19af:d2a4 with SMTP id
 ada2fe7eead31-48faf0db435mr11451472137.2.1719987890841; Tue, 02 Jul 2024
 23:24:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-7-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-7-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:24:38 +0300
Message-ID: <CA+GgBR8kZjenSU96tf0QAeJc_yX8Lefy1CGhNZUJFmciiE3yiw@mail.gmail.com>
Subject: Re: [PATCH 07/20] iio: accel: bmc150-accel-core: make use of iio_for_each_active_channel()
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
>  drivers/iio/accel/bmc150-accel-core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bm=
c150-accel-core.c
> index ae0cd48a3e293..03121d020470e 100644
> --- a/drivers/iio/accel/bmc150-accel-core.c
> +++ b/drivers/iio/accel/bmc150-accel-core.c
> @@ -1007,8 +1007,7 @@ static int __bmc150_accel_fifo_flush(struct iio_dev=
 *indio_dev,
>                 int j, bit;
>
>                 j =3D 0;
> -               for_each_set_bit(bit, indio_dev->active_scan_mask,
> -                                indio_dev->masklength)
> +               iio_for_each_active_channel(indio_dev, bit)
>                         memcpy(&data->scan.channels[j++], &buffer[i * 3 +=
 bit],
>                                sizeof(data->scan.channels[0]));
>
>
> --
> 2.45.2
>
>
>
