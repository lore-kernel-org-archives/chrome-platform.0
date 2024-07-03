Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EDB2A1D8
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 06:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719987339; cv=none; b=Fu0G46V1tyR1g2ucL1pd6AgS1Qbvinf2Xcist9/cZ459LAatWZTi/xuEbBtT5Pdq5HmAXWovGLrcqsh4d+DsHwJXLONaBBRBFv48JUt9IQxEmri8Q/0R0JxTqtAGJ3937WEq3pc/mbsmhKc3A4HmOScaxGbdPaaCSCykKoE/C5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719987339; c=relaxed/simple;
	bh=enrI7x/wMroG4ij0zIBOqks55RgX80qAadRtM0RUHvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQNf3l+SPNwxs0jDMlCoW880uhZTMaCKht9Rn3VBJyooaORRwpDFfIeRnhMXuWQJiwYyZKgbbaE4J0FS1AxHihmxEm5bjyEUOqX9fAwmR80xiaaXX2rvzhEgwROh6O38Iv/pwPRjJyIBfT2hm6WOA0NVLj2nsV3Y/YNYEx9pUX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qNwMguvj; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qNwMguvj"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4ef54591b7eso104533e0c.0
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jul 2024 23:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719987337; x=1720592137; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ospkLhGDdrrJDke8gZMbmwgf9pCpLuO1ElewomPagbk=;
        b=qNwMguvjEugFtd3JUQaPl01h+OHT3lWRnszot9Ie81EpxsS6xhIsr0whqt3ABHrH6x
         pRV0bjjidL/asyYqLXIoJKKFkViKgG59EDg5pMgvuHIPJBhJ5Uz5d3VEEkofnuqDZm63
         9zVoUCuurJQD1auPtrY6bpWuVz45zRWpLpgzkFnCc72byHxyVkXc4LghcP5adtoYhQet
         kRIUvGOwpuivTzsFn7+6bawI3B6V8/8KFb1RyxTL5FRXoCmDUYB9ULaTHxaC00sKLih2
         vDSIhrf7e0NCNUsIRjDmhAdoQ6YJ9WHf4ud7484NY5j8hPWHZ9CJMxl+cuWIjWZWv7ZE
         yK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987337; x=1720592137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ospkLhGDdrrJDke8gZMbmwgf9pCpLuO1ElewomPagbk=;
        b=M6UJat3JSIu+YHG863fGQ3P6aA0WXDRCX9c9OjNGShcriY5Q5+TVVU+gDSJ1AeGeZV
         prSSMrsW8cFS0aw4ZFpiePBifrSuxKWm8JcBF+eV+W963IW/yhymZnHbFvALXCFxdpQP
         N7G5kdVwLeSNzvNMhvXKtemgyKPiL6Vxsxw3XZ5lTKck1bu5oEFX9PYKpieruutzWJxu
         lIDnmT6XNDpfue7zzex4Y0lmtHGIZVspFTR3I2xei2PiUg6iJnVFZ0iFbww3Z138YIv8
         lyYsTGOwQDMKG3Fa3NJW9sDExYqISCm4k2bGNLcEBBF82qpChMaKeKua/8I+cEIlvec4
         Yt7w==
X-Forwarded-Encrypted: i=1; AJvYcCXqgmq9xLZbtT4mlr78yPWGhK4cQiRultkaHearKsk45pCNotEyFogY75JjTSkEN1i0o8X8IDHeOuu/S2CovjYGlnX5ZaLEIuQbpzDqYsi8
X-Gm-Message-State: AOJu0YxPPGWuyXeaDjDovFaAW4zSH2eQBWG5rjo5Z81Hg+buVTYTc7j1
	fxsYH+ZJcofjQS8/F42tbdy6fVumj49Qy3YO8uzk7PK7A7Vrdu8+clfc5pVTN7HgeOo/J7yhmPo
	fQLyBE6f5xfXqG+f8epcU1MiQ8WaNO1XKfOz4tw==
X-Google-Smtp-Source: AGHT+IECBllyXchrdYoUNpWJzOOGJLXZiZZgbO0ohge60b39fTNOUnMTou8zvpGywZa32X/20c/kSBBa3MkQ6KaQi0c=
X-Received: by 2002:a05:6122:1d13:b0:4f2:aa91:34eb with SMTP id
 71dfb90a1353d-4f2aa913b3cmr10069449e0c.1.1719987337036; Tue, 02 Jul 2024
 23:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com> <20240702-dev-iio-masklength-private-v1-4-98193bf536a6@analog.com>
In-Reply-To: <20240702-dev-iio-masklength-private-v1-4-98193bf536a6@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 3 Jul 2024 09:15:24 +0300
Message-ID: <CA+GgBR8p3T+AbRJNxBeTEdQOPkeXV4BouRG1HiCENo_8JOG0zQ@mail.gmail.com>
Subject: Re: [PATCH 04/20] iio: accel: adxl367: make use of iio_get_masklength()
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

Reviewed-by: Alexandru Ardelean <aardelean@baylibre.com>

> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/iio/accel/adxl367.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/accel/adxl367.c b/drivers/iio/accel/adxl367.c
> index 5cf4828a5eb5..1c046e96aef9 100644
> --- a/drivers/iio/accel/adxl367.c
> +++ b/drivers/iio/accel/adxl367.c
> @@ -1220,7 +1220,7 @@ static int adxl367_update_scan_mode(struct iio_dev =
*indio_dev,
>                 return ret;
>
>         st->fifo_set_size =3D bitmap_weight(active_scan_mask,
> -                                         indio_dev->masklength);
> +                                         iio_get_masklength(indio_dev));
>
>         return 0;
>  }
>
> --
> 2.45.2
>
>
>
