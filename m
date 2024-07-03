Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830838DE0
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719988663; cv=none; b=sj2PvnwswwySlgrUZ/Cs9fu51zKSj4EsFb6SN3iVeVbq7Y7C9hrUFyC7rZaigZBt5XeGxkeeD+oJWXAXUbR5jc97FkYGFHAaTagShkMUQejuxTrksEcuWDwSSKHzuz8pgdqdCqLWqu2KgYST8IGvXgOubm5lJ1J9FQmW6vaCAOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719988663; c=relaxed/simple;
	bh=BfK2sctA4fXWt5YF8HGcx+xtorjZmDBoYhjYgwAwrro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3ULWb8UN3NUvMPUpTHqw2BRYVi79Azxpv/YtAyvoDUedLmCHEV0VgLkLg1tB45rblu2rDLLv1JreVzEFjbDfKEikTseQElrVtNxZWYdhwlZLFFiR3Zh9mv5qGr6GhFA+s6gDiosEBaaSld+AmMr26orLhCiWyiCtJG8tm2tTAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=20bWB1qE; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="20bWB1qE"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4ef52fec1adso180942e0c.3
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719988659; x=1720593459; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IjFZvsAsiC/WDBViow/MC9bkSbwquCEh+ciUVx1+JU=;
        b=20bWB1qEhE6PfeViR9Qo0wnOt6xsg6w5uRLiA3LDbyLnLYAswqaim/ndn86JkBmFZp
         jJmrTklNw0iLE+lIKnCC+UbCxCP2aOtQa8WcY73O8YHIrird1bc3o4hopVrRCUfgKDjg
         15BqrALPtVY3kfpWgJdvexrh5yswWO/UJ5ky020L6HiGuwb5ywFfV7PPGwt/ssgyoVrw
         XT3zwDFqCAcOeAIG6iQUjxrtF7gfAIwDm12bkqOkFHjmMTGgnTNMewqK30eAFcvOLiRt
         Uk67lBfThtT8jzkv5crwl5HrghIa4paAl6t5K5hGGOvGuyQdxzqyxdxfQQwevkdkpZDk
         4sFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719988659; x=1720593459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IjFZvsAsiC/WDBViow/MC9bkSbwquCEh+ciUVx1+JU=;
        b=JoTuRdtbYCQ7UvyugMVEXvz8v03ckcdCV7+Z4GgnRxWhH+vo4UmxVpwrPN9VMZN+Kl
         dI4rdrD5xUSKhXZO12z8NtIqt5ZAw7XUB9p9FWqnnEwAjUBAHYnMQ5oAaNGG+YEPKHDj
         G9YRTXhFlqTW1EEcwSNdwK9qyniwUFYiUctKNfOeLSYELrcvysONeiSeyx6OwjZYQVye
         +zw0WTX0qaMz80wA8rZqnhAuX4PkozkTk2ZDSeTUvA/qey59uoYbXbDauqCJLTuYzCol
         +KPdb520Pwcm09TkozWBtqJjozxwaOJWGWzqGOtqB/RdcAzS6wdFuL+bRjsnqqq5YXEk
         eysw==
X-Forwarded-Encrypted: i=1; AJvYcCWR9DbC8xe/C0uCT/Vtiebza6EGAiODKV0UJ5NNMLU/B9BCRQCC3+YEBawJQFZgp/jVJL9k1nbIZLc6oVGPXdRnysvfV/vQnkmCDeqqhSId
X-Gm-Message-State: AOJu0Yxr85/qtMFNJoVZ6jeUPucLdQaaDTu4ET/eWwLi9ND56q/MH3PR
	RSkgYMjqkyIGk9boM7u552UriX7AHekrMeKf3ZAbB2iEGZm3yEgduI1o+vwYGzPQsC8bwudViAy
	ZiceKsE0p32H6xbp4u2yZjgkMf6HB5xS7AJNrww==
X-Google-Smtp-Source: AGHT+IE9OriilIOAIOnvVh1+BI3Jr+CXeyRZR0cx7sw/8Ki2Nzc/UgN0Ds8lRHXMzmaV801nFcRN9n0rklzw1fG10fY=
X-Received: by 2002:a05:6122:3224:b0:4eb:2012:f5ed with SMTP id
 71dfb90a1353d-4f2a56e4202mr10773231e0c.1.1719988658902; Tue, 02 Jul 2024
 23:37:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-8-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-8-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:37:26 +0300
Message-ID: <CA+GgBR-uazN8==3FHWo6Vb_Y3YEoMMnOLqJnfXtAsrS7Pc6B1g@mail.gmail.com>
Subject: Re: [PATCH 08/20] iio: accel: cros_ec_accel_legacy: make use of iio_get_masklength()
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
> Ue iio_get_masklength() to access '.masklength' so it can be annotated
> as __private when there are no more direct users of it.
>

I would have suggested maybe a "iio_for_each_active_channel()" here
instead, but after looking into the driver a bit more, it looks like
it's part of a broader rework.

Reviewed-by: Alexandru Ardelean <aardelean@baylibre.com>

> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/iio/accel/cros_ec_accel_legacy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/accel/cros_ec_accel_legacy.c b/drivers/iio/accel=
/cros_ec_accel_legacy.c
> index 0f403342b1fc..f7e4dc02b34d 100644
> --- a/drivers/iio/accel/cros_ec_accel_legacy.c
> +++ b/drivers/iio/accel/cros_ec_accel_legacy.c
> @@ -62,7 +62,7 @@ static int cros_ec_accel_legacy_read_cmd(struct iio_dev=
 *indio_dev,
>                 return ret;
>         }
>
> -       for_each_set_bit(i, &scan_mask, indio_dev->masklength) {
> +       for_each_set_bit(i, &scan_mask, iio_get_masklength(indio_dev)) {
>                 *data =3D st->resp->dump.sensor[sensor_num].data[i] *
>                         st->sign[i];
>                 data++;
>
> --
> 2.45.2
>
>
>
