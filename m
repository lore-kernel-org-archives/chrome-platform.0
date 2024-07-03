Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684D130A68
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988972; cv=none; b=l8h0V3tCN0+IzJJIjxE6lNXcqOpplpyxnzQXQkoGoxnvEvNMLqWkVYql1vOqRoNMoNVUqFkGGIDkjcJNbwsBGdjijXg5CHI9OTf1ewjx91+ybe5XwvD3ClHa+bTylj08H/Ntp4NtPWKcWFL1lZ1Zh4j5LPah1RWDpKRmB+L2f3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988972; c=relaxed/simple;
	bh=PdwtN+Rbxelkr4Xw5fQ4J8100LEDw0GCaAdRl9JJ3GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uc9hO1wqOUOQXElVhSluRKK/4BR24Au+tj9iWu8LK4mO4pAyAdhfwamPJESMmHp6EwqVL+vpIwDJ/Xn+Y6negylerw2Fnr0THsz44ZA7SPi4Xj9rDg8yGvBJvHGpzGBbbqwnB19WLxDhnJbwxVkW9rtWXBaHJUn+SK6onKjp7ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3PbTBo6L; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3PbTBo6L"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4ef63c6be17so169005e0c.0
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719988969; x=1720593769; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BWoe3r8T20wkxLXJ9U4Y3vjxspmRkp94Q3dB56o7kw=;
        b=3PbTBo6L1iKDzo63LV9vg/oXIaX3wXXYjV5RNQexEPBZQSsCEz/jr7e4lL5qEKT5tw
         7kyaWw3KQW1VVpt72p9trKrhse8YDHJRpWklH4Eage3egtR92HJLbNiyicriA3NqDz2M
         9DGqv4z/53QsHil6/9gKqLKIVrltTNeT65G5b7TsfV1OrAIblAosMTHT7jSN0H5lI7Fs
         Cjrz1EDCeFJakUTnctEPAKYbKhaYrn3DixmXKPs9g1BR6AuChDLctYE+6WP3fWV2sCk6
         kQbxjQzHzVDuWYqy+42k9+geAvl5dbQSx84TAuWfTuwkq+o50i8v4A0GpAVMT54OleKL
         1Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719988969; x=1720593769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BWoe3r8T20wkxLXJ9U4Y3vjxspmRkp94Q3dB56o7kw=;
        b=C0AX9K3mcYJanbBbhoLLZTyjbKtoyuvh0BxbPFO2mYNzN30XnxChdQgBkrHlQqCP1c
         vDezdlAn+utONW0zy3bWbtdTSZq5SaQpezpYNM38vgvQ0xe4LQRn2/GMMBGnjJdvQDO+
         oseaLnyYE+u5i4H2B0jtBSrcuN7ixt3LhetY8dimkFnk7ORsk9QpL7xceKSEOygOVgwH
         /XbagkXE7VkwVbsxw5otVG6ezK8U5s6tbJ7/7MEnh2zO58QX1fhWJepbVLhHsJFJRoxY
         5ihsf+DlDVqYq0UYUBENNkPhSc+kuPuRMLOLhfuu+CBY7b2Ev/2Ai8FL7bHuILmL7odY
         W5nw==
X-Forwarded-Encrypted: i=1; AJvYcCWkRvdQANlWyiRxlWj0N88GkQcf6MQ+TbuRHAk60P6LUDodi8HqVZj1Qr2y9jk9sltCXrNxmX0aVYKoPYcSfats6e60l3Uquup0d+pmn6md
X-Gm-Message-State: AOJu0YwvvfkXkWlsnV4+U1Sjwj9jRPR3h9ttl6m6grNG/DmE1awrT8rl
	WBQNT6newn87QVfMkTuQZFUZBKklTAFZW0ORSi2qGp5XnAS0DF1gCB9Bdto/O6Ild0oplpXujrk
	AEYpvox13k51aKOLDl5QU51uvTgKlrZ7rkJtQ5g==
X-Google-Smtp-Source: AGHT+IHgEiNF2c/I5ttLf/dG1qkuSt8wiZrHpmF098bQrHHOFu8xkCJVjtcHyToLzuSleFqfYMgS8eGjf+ziCjEcnxI=
X-Received: by 2002:a05:6122:3224:b0:4eb:2012:f5ed with SMTP id
 71dfb90a1353d-4f2a56e4202mr10781037e0c.1.1719988969594; Tue, 02 Jul 2024
 23:42:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-20-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-20-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:42:38 +0300
Message-ID: <CA+GgBR9iiWdgihgQU+kxedhqUzMK7qYJynxCpwwkutrWevO9Jw@mail.gmail.com>
Subject: Re: [PATCH 20/20] iio: imu: adis16480: make use of iio_for_each_active_channel()
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
>  drivers/iio/imu/adis16480.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
> index 56ca5a09fbbfc..2f08268bd724a 100644
> --- a/drivers/iio/imu/adis16480.c
> +++ b/drivers/iio/imu/adis16480.c
> @@ -1410,7 +1410,7 @@ static irqreturn_t adis16480_trigger_handler(int ir=
q, void *p)
>                 goto irq_done;
>         }
>
> -       for_each_set_bit(bit, indio_dev->active_scan_mask, indio_dev->mas=
klength) {
> +       iio_for_each_active_channel(indio_dev, bit) {
>                 /*
>                  * When burst mode is used, temperature is the first data
>                  * channel in the sequence, but the temperature scan inde=
x
>
> --
> 2.45.2
>
>
>
