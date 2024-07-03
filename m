Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7C9130A4D
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988862; cv=none; b=FnoaZI/g+VFidsv1ZpM2g/GwNhD/8VqIgAwQMlRu8RRLMWp5R9OI+q6QB6p9q7s7B1naBAed7Fw5ZDMvBSn8syqCRKbv2apmuLrbi56AsoMwcMP+670EAf3wpdVjEBVWHhtevdNkJxn5G9KN3DEPb0KUx0lTuTpcp4dvWFC6gaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988862; c=relaxed/simple;
	bh=b3Gra3xPgSzh01tKGQkwhscHUYlX2gaWUGiLZ4F8iFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HETgpUnezj2fd+AqvaGo2Ng/SPnLxHeMF9OG7M/2nZavV+csWgQLhecuFY4fMaz+wbJSmrfWriHLbw8Y2kb+N+Pf+kpgfgZShh7upOQiwldKZk2J69TfDB/rs+BCVJzBLpao6XweK8I3G2VO6sbf0wrW80QgUJKGmChe3g36co0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1On9Sifs; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1On9Sifs"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4ef5aea0604so131893e0c.2
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719988859; x=1720593659; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuVsBlN1Ampw/0MbAn1EX5JTwHlSMtoeNHSIezCoekE=;
        b=1On9SifsZh0V85YmO4OzAT6hu5aEALbaGwx5aB3CZkAkZbh064adT4P6gn4PRbT+1s
         kgTXz8eteFajwS3yuK2EzNzvyhxBE42Cwq4ShwQ40KbOJ5TtQu99SWFzIhcMWH+Lu+vq
         U8K1e9JiCZ9zBaHUB7J20R8z7YHXK7kkem/zH08rGX03qZnxVz3WsQaYxcM9DDoK0F0J
         Qv0NYrZpwfxc/VqmjaKvTMe1ILpMu3gZHq8fO5pSHZJJb8RDkcTVpKlctYgynx18iDfM
         n/y3+3ScNZ4iW7b7FdiwvTMA88xtIYWitCCmDrZQnEEkxuU7yLktT7z+ed6M+Urkx/1S
         QvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719988859; x=1720593659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuVsBlN1Ampw/0MbAn1EX5JTwHlSMtoeNHSIezCoekE=;
        b=mUNeYhnr9fLOMgTkqGbYNvVjZLvzjASePL7DgX90ICub6rDISC+BX03sr31bjQrEuW
         KYGRVDTftmGhRfGeeQaM7XLvA4MmQ+npzoNLjKG7zKak+3Dia5wthYWPMvJF4o1sQt+5
         RMajGdfNIHIx2fpzCAi6j8Z/YtE68nj9VA9Mdhj7yWGhxbZRTT2+PiYcIzigSbMgEGNV
         yeQQ1A499SEkUE8O7sK4jrrY6nId6qh3PH8uoTzMb9ISJNx/6smbH4qrkfSyDmUeqr5D
         pZdbEHFtCxC8kcV9oAi0e1nNigOGb3zB96Fzumah8kU6T2PxQmZAJoYoFXx87VJ4Aw3u
         PSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+h54FlYOH9NWGbzRuPagOP9YBg8eUwtu1grSP2B3jd+ppxzH4FnxDD2G0usGmw4r7C8Lg4NKu7V/zxFCokDs0nVjyUHfXHPoYqbWEzp3D
X-Gm-Message-State: AOJu0YzBxVHLofauzeba4Uo1GDEb9hTI7SoWFMbMB5invwqsFrY3af8x
	6ZsPdtx1z33qn1+RHlvmz2W9IhacayF6YKWDmCCEKmxB5D0RRMR3WIMca6n9ocw+nnY3E4Y3alf
	Gy+wPS6LLLHbrN4TD0cV4jWtiY3xd7S0Df9L+mg==
X-Google-Smtp-Source: AGHT+IFmD6afXbtOVApkewoPxD88vcrnBe2vVb7JKdaC8OuHe6uJaw0g7oLJ41hraaYg8zdjI5DUtty1osY5QrryZ3g=
X-Received: by 2002:a05:6122:698:b0:4f2:e302:4577 with SMTP id
 71dfb90a1353d-4f2e30248e1mr474701e0c.1.1719988859113; Tue, 02 Jul 2024
 23:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-14-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-14-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:40:46 +0300
Message-ID: <CA+GgBR-TFpWtGGC7S=McaDOFiyCo=nJCunAMVsY8fjv03_-pzA@mail.gmail.com>
Subject: Re: [PATCH 14/20] iio: adc: ad7266: make use of iio_get_masklength()
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
>  drivers/iio/adc/ad7266.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/adc/ad7266.c b/drivers/iio/adc/ad7266.c
> index 874d2dc34f928..accb78d4c3086 100644
> --- a/drivers/iio/adc/ad7266.c
> +++ b/drivers/iio/adc/ad7266.c
> @@ -123,7 +123,8 @@ static int ad7266_update_scan_mode(struct iio_dev *in=
dio_dev,
>         const unsigned long *scan_mask)
>  {
>         struct ad7266_state *st =3D iio_priv(indio_dev);
> -       unsigned int nr =3D find_first_bit(scan_mask, indio_dev->maskleng=
th);
> +       unsigned int nr =3D find_first_bit(scan_mask,
> +                                        iio_get_masklength(indio_dev));
>
>         ad7266_select_input(st, nr);
>
>
> --
> 2.45.2
>
>
>
