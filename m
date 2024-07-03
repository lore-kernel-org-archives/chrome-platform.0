Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4061C69A
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987210; cv=none; b=HDOk4o6GnMnBlPsUYvAxpAVasMRqgGNCQYawfgyDIhnJ4acyQeCzM/9h2WveOGtnhyrBgKoLp9Zh24cW7FH/A1/bNzmk8ujXD1Qv3dDw2y6SfeSdCy/tv1WQ32yfPMNo2KPjSkL3DLE83XiXOb6t12uzr6NJnT5kxEi5tw7u/Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987210; c=relaxed/simple;
	bh=TVhn/9aqzM8gK9S7x7lDaUKf5V6ug6GSOL7HoxXi2G8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Db0NUGMu5w/sXFjDBkT/s6vuXwvL/DH6yEZHI/HFY1NtWemFhrN5TYr/JY3Q27B2jLmOlbxsNxmGnGKd9I7WWpiQvflgVRusXMhs5zXcpZtdE6tjQqKlV5A+Fc+Qo3IDXnc/hmZyeS2TAmT5bn1shNRjZdKB2YZ3vIhtoaWztLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=R26JiGy8; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R26JiGy8"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-80f6e73157eso206123241.3
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719987207; x=1720592007; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrh4omEoCsgnk9OB2fwqZ/ZZhUeolysIiLRrWxFuJG8=;
        b=R26JiGy8MfqXR3mZlmqMVP+iJFlnAidcYb4YBy9nmyfERuG1eMsHUeQjWMQM2fndr2
         P8A4logGmRYP+W9/gu1YY3Eor6OrmGqPpVqyb47Hj8FzvFsuc30DZp2YsaulyI1tWmxi
         eo2fjKij6mf4yM6bgj3smh2JIRmIw1OT8UeoPt5ZAqJ2Mc8KODymsEMK8w5sxFtnJboC
         wk3vJ/C1c8CPucxNAoWSn8evufbuugz1S4ogr+VmT8w8aqfwa7R5pyOCOs3BV7jaRY2E
         AiMPj/qwdgpjyQ6ncASxA8Pj8G0meNIs3cUJWBl6+ci1MnQqxz2aq640U/ysX1kHSxbS
         VHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987207; x=1720592007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrh4omEoCsgnk9OB2fwqZ/ZZhUeolysIiLRrWxFuJG8=;
        b=DUTQV4KvWW3eJsKYlriD6Yf3QLo/WxI/Qnvzyd7EQIRP1R9xRCnFLWP/qeRMoANemX
         oiFKp++IfB35B6q96YnIlo+fd51auFeOuoPySq0bc/tC4Sdw4VKd5mTilduhaFtBiFMn
         P7acwUDGTwyM1ckCsu98dljv+bRGGigko2eFHg8MbgS7evYToGe2RFfuAGOXOAlDXvfn
         SxTTHFMgc77XX2ZhJIA1jFSY3LExqkTyQHAu8/Xn+LO+hIxqSbq3RoGVDSQcZ66SbJfH
         FKeC3/jY6PsNEv/eUzjhhpIahiWka6XX/x7TbC9C1f8r4vvvNJXJS0YtUjOfa+tJUDdW
         RvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3zS/7Lc+QQUdFOvLgAQg1uUKJuq88aNv1xpC1OWDAW+rv8Tn34pRs+rwcxk16ArJk2AKuPbqhxngGIkAngmF1D2Ak4YfeLxkWuIMjcNsC
X-Gm-Message-State: AOJu0YyA5i62G59ZAg4D67MPlC4OJn5xVSWXbwvByLq9B9K5CigdDDth
	dwo2uwwcLcn+ic5604iModhhFK7fLiroxjsCzEtmzybDw64Vvyg9KiwR+E7k/DFcd1WdCIA8hLQ
	u4kyAPsKsxsZXhxD26PIhI1xAmnQhgk2v40t5Yg==
X-Google-Smtp-Source: AGHT+IHA9tyTcp/bqG+kwwVde3E1Sqakwf3LRDVH/oAwKgHm7Oq/LYBV6T61+//W+6tik9hUgMSQECJ8b9CmdmFyxYk=
X-Received: by 2002:a05:6102:c90:b0:48d:b0a3:fe25 with SMTP id
 ada2fe7eead31-48faf03411cmr10952763137.1.1719987207363; Tue, 02 Jul 2024
 23:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-2-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-2-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:13:14 +0300
Message-ID: <CA+GgBR9ZLNJps0KCKD4Z767_NaUeKO-eiZPD0rpjfxS20LdDCA@mail.gmail.com>
Subject: Re: [PATCH 02/20] iio: core: make use of iio_get_masklength()
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

Well, in `industrialio-core.c` it mostly helps to use the accessor in
order to make grepping easier.

Reviewed-by: Alexandru Ardelean <aardelean@baylibre.com>

> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/iio/industrialio-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-c=
ore.c
> index 2f185b3869495..e392a10aaf320 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -1907,7 +1907,7 @@ static void iio_sanity_check_avail_scan_masks(struc=
t iio_dev *indio_dev)
>         int i;
>
>         av_masks =3D indio_dev->available_scan_masks;
> -       masklength =3D indio_dev->masklength;
> +       masklength =3D iio_get_masklength(indio_dev);
>         longs_per_mask =3D BITS_TO_LONGS(masklength);
>
>         /*
>
> --
> 2.45.2
>
>
>
