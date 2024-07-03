Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD9F33D5
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987490; cv=none; b=Nd2doCEUYWSl2ifL8EAy9cg8tJKWpBmgITol85FA+4L9L/q0ZnqVX7+QKBkKXF7qnqozk3LNAcRLnHZ/uTGKr6YGQahVcHEZJSKITf986Qyx0buW1mOxv10I5Uway5PEhyihjHXm+ZAqRF93mOfpU47kLAeJBP+dbnPfkifB3K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987490; c=relaxed/simple;
	bh=Qt2lzxBmiYbmS37M2+dHBvyq9puRTUhHeoY6sL+Q6c4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLlqBV9Y1qwYPt9E7xDKJcqE9ggB3Z9+8gWDZ4rKUgaLD2l3sl5Kixfh8HUS0o/b7wycS3B1UKubrC4D5zn8g+HFwYmxjf5+ltl7mb4rVzmB1/F6gtMlBCK7/bCna+TUvvPAZawI5qvFQ7DoSRhxyPKX9w8FP/Ungx9YmU1nSAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zDPiyI29; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zDPiyI29"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4ef7c2e6bcbso143857e0c.1
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719987487; x=1720592287; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDID+M36pQUm2cmeBBQ6vdpVx/t6wAJFJWrrhENY1cM=;
        b=zDPiyI29eRK3rfU6bn+rBprtmShcFIJKblIYI9SE37SI8d6kohaifY1xnJ/RLUlGX5
         wDPAxuy0d9vTe/e1guUKO+g4TFX2KngRw93G0OObNcs7fPAIiKbM0luMD5p2LYvO4FhT
         t8AVjU6RJItwaY24hmOyMIaRQ6Nh7J9/TfG/Pq/c0ASDrbKffV51vjUEnYX8BmqaSeo7
         gyHGeGVTFbycDVDbnkRlUvGYA6Ul6/nqIgYL74PU4obg/QyiDrC2+GntXhToq/jK/2Bh
         2NfpcOZ4Qx6IvaO8gXOaqitIIRsBkSs3z3mlRigDDIewUPBtm5l+SMyFYOtPF5KezSE0
         a2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987487; x=1720592287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDID+M36pQUm2cmeBBQ6vdpVx/t6wAJFJWrrhENY1cM=;
        b=C/zMyTbm+cMXkHsoaHDrvXTIyD9rmK09LDd74D4Kvki0rerCYUa+te0NE/2b/WHPlq
         coU87RW9ptNHKO3ub3POily7SYbIcwb/klfiyepW8GlDcSA257K/QtM9Bs+tNlGLVSUc
         HGmlxUNi4Kb6zR6Uw9gfPNlGyYgm81nS1jVvyOoC2QN/+fHhM3eJ6fPmN3yT2s8NLnRp
         Zgp8tHOzBs2y7GNDAeOUpH9oadVyhk1Y+ZwBIWkId1+KsNr/xE2a+vN3zzOw7CTm5dj4
         Cos+Ky0UAPSTWg82JSQb7nvq++Z4xgMHT9HFxyEt0bfFqkbIdL723or5rmh/jM/va/OO
         kr1A==
X-Forwarded-Encrypted: i=1; AJvYcCUO5Stvc6/9QFbcpvYNR7HG3eGehiXBQO4fBjJTAXWFPM8kc9B5EYLg8habK59yRDl6M5t9EG7+DKjBZ8Mh+/0mbyJLmNm5yNOerKnqcliR
X-Gm-Message-State: AOJu0YwGxHaOrlJfI9QHQ7m1pYMjdxfPkTjKe8tf7rUNQV5LyKtbPssL
	k505hqWFaa2VgkezxOtxmrn0kOosfQ1T7gcqpR/5XGpOeYRIYb7MbmiUpLHetnSi7cFALtSoQV2
	3FS0r604dXPV5S1uBGYK2XorIkevrv0xC2y4MuA==
X-Google-Smtp-Source: AGHT+IFWEngRuJMya3YyI1MxdVDX8TFMu0H0KHjpjrNbdQmmK4XlBgtxHsOPkFzlaci8++w8+a9EApIoTNTcq1nnVlY=
X-Received: by 2002:a05:6122:3224:b0:4eb:2012:f5ed with SMTP id
 71dfb90a1353d-4f2a56e4202mr10742434e0c.1.1719987487130; Tue, 02 Jul 2024
 23:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-5-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-5-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:17:54 +0300
Message-ID: <CA+GgBR9qakqbwVHbLSYVA7ZOo1DW2ehzMZMcF=PuNU6ZoYAijg@mail.gmail.com>
Subject: Re: [PATCH 05/20] iio: accel: adx1372: make use of iio_get_masklength()
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
> Use iio_get_masklength() to access '.masklength' so it can be annotated
> as __private when there are no more direct users of it.
>

Typo in commit title   adx1372  ->  adxl372

With that addressed:

Reviewed-by: Alexandru Ardelean <aardelean@baylibre.com>

> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/iio/accel/adxl372.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/accel/adxl372.c b/drivers/iio/accel/adxl372.c
> index c4193286eb05..ef8dd557877b 100644
> --- a/drivers/iio/accel/adxl372.c
> +++ b/drivers/iio/accel/adxl372.c
> @@ -1050,7 +1050,7 @@ static int adxl372_buffer_postenable(struct iio_dev=
 *indio_dev)
>         st->fifo_format =3D adxl372_axis_lookup_table[i].fifo_format;
>         st->fifo_axis_mask =3D adxl372_axis_lookup_table[i].bits;
>         st->fifo_set_size =3D bitmap_weight(indio_dev->active_scan_mask,
> -                                         indio_dev->masklength);
> +                                         iio_get_masklength(indio_dev));
>
>         /* Configure the FIFO to store sets of impact event peak. */
>         if (st->peak_fifo_mode_en) {
>
> --
> 2.45.2
>
>
>
