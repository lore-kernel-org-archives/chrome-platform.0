Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B652F70
	for <chrome-platform@lists.linux.dev>; Tue,  2 Apr 2024 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712048340; cv=none; b=FDBNFevZNmerYHbw2ZJM8AVE952Uuae64wsq30fut2nlM0K0y7WTdXwcAPsHHECLrtgsttt1KHsZy5kkrImeQOEgHmiMkvQNFsrN6so0169TdrC2FnernHmA3ceTqQ4czxHDJcgZq2Pd6bUumRgujaCwMbb04MKYoJ9/t6tNRY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712048340; c=relaxed/simple;
	bh=HNm6Lh879crSqV0ZGzaJmrt3ssAvgX20Rq/oXJRJF9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ta2kf/arxFNJEq/qOk894Yja/UhJrB3QCf/PQ8t8iqjv7oG4LmDheL17AwlYkXVc22ZAv3RnYEXXB4Mn/kxn9czif4X0QE9TjjVZdt99ykIJbjOoxvEYJJWxsojzEpCvu8t1LVNWCxyeiUjtrirBQTpt7sLYcpodBkA3qkDcduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zGqgfJs+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zGqgfJs+"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d71765d3e1so49637401fa.0
        for <chrome-platform@lists.linux.dev>; Tue, 02 Apr 2024 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712048337; x=1712653137; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EQziKXdKEAMdx/dPCGDP7jmLVDHvzi4KCtf8hrHXHs=;
        b=zGqgfJs+zbmKyJyeh7qW2DDa+w5SzCby1XspfRcK5Cwzp3G8mmF7SxMygPqJeIq5v1
         kFBMI0UB2Cp0Xa0ZkuTCM/pEtrawE8Ef+rwUDOsCbakxIfEckC3TZBmekqId17HFcgMu
         Jrstj23VuoxkxHwqoiHSo4PpAC0m2+j1NJvIpqW0XISR9rTxdvnvA/gb2FYjqfqi7dJs
         cD2ISmLbZWu8MOSwFEiT4hmFca7I/g7nGGqO5OMLee5ymCPPBO49Bd0T9e5q9gF8kDnW
         5CFq4jsFnv8+dlDF1rm5mlcTFqH/kcKJAJztpH/96tsomRgkfWIzvRHKz56VMGI/NLHu
         oOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712048337; x=1712653137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EQziKXdKEAMdx/dPCGDP7jmLVDHvzi4KCtf8hrHXHs=;
        b=O4+X6NiRtzufdZl/vbVOcW6p2b9tPfBHwxFQHXBPSFN5qZzBNyx2a6bTSd2SsjEe2q
         ujIdrm3KjdOnsD59FMy8sBBubzbZ3OMap0pJg4U281c2Xci2T/QLMQyQUYz/q/W7X21a
         11l9vLgSvsZf/xNr3dh5iCho1N0H3atFPHgmDF5SJLOqi3Rgp+VJG32XwdtwHH+jwh/0
         5FWLRzR8UU/aI0T1THmMU+T0JdsITLbb7aXS/EBFOUw4EOfAAffWc1/WiPVrjifdrs7e
         twFOq+x9LV1u8OtJsot/HfPYGZGXUGrucNgjB/Uh15S1uzuK9nf++2GP6nfBF0tMUT5u
         sAkw==
X-Forwarded-Encrypted: i=1; AJvYcCVn7KuUsnrQVttDJxQaHbfrUcdYEC7TQCZ2nrbeW3EzLO/jzSZhb+1Gaox7Xz7JEKwbfga2OXSumQ6w4herkcPM0PGoBuJm5llywOxiylYz
X-Gm-Message-State: AOJu0YwLRuCDTwsm5JVj3Zj74IE7mcGjD7MAfERT4LSDhJ+LiUGSzAuS
	nsDALUWtrmrzSCPEv7vh8tKcZgYnPbm+oB/QwpmstLHG23iUcOC/UESNEOtTnm2eCUm+N80tgy4
	pejMNpl51leuS08QapBcb6DSLdP+wS1nDNW823A==
X-Google-Smtp-Source: AGHT+IHgVoVAQjY0SVm1Am+geVCD8kGxkvgjD4vTaFUHh5+1OWnpBP+5APV4hCgBud/LOc79OuLkSI2vz2dPlk4j4wE=
X-Received: by 2002:a2e:8699:0:b0:2d4:6815:fc6f with SMTP id
 l25-20020a2e8699000000b002d46815fc6fmr7057550lji.30.1712048337278; Tue, 02
 Apr 2024 01:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240401030052.2887845-1-tzungbi@kernel.org> <20240401030052.2887845-3-tzungbi@kernel.org>
In-Reply-To: <20240401030052.2887845-3-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Apr 2024 10:58:46 +0200
Message-ID: <CAMRc=Md+v=zWGa=pYUzKkBMipJj_NgYW08XTfvdCFyErOVdvYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] gpio: cros-ec: provide ID table for avoiding
 fallback match
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org, 
	hverkuil-cisco@xs4all.nl, mchehab@kernel.org, sre@kernel.org, 
	chrome-platform@lists.linux.dev, pmalani@chromium.org, 
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pm@vger.kernel.org, krzk@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 5:01=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.  Also allow automatic module loading by adding
> MODULE_DEVICE_TABLE().
>
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from v1:
> - No code changes.
> - Add R-b tags.
>
>  drivers/gpio/gpio-cros-ec.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpio/gpio-cros-ec.c b/drivers/gpio/gpio-cros-ec.c
> index 842e1c060414..0c09bb54dc0c 100644
> --- a/drivers/gpio/gpio-cros-ec.c
> +++ b/drivers/gpio/gpio-cros-ec.c
> @@ -12,6 +12,7 @@
>  #include <linux/errno.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -197,11 +198,18 @@ static int cros_ec_gpio_probe(struct platform_devic=
e *pdev)
>         return devm_gpiochip_add_data(dev, gc, cros_ec);
>  }
>
> +static const struct platform_device_id cros_ec_gpio_id[] =3D {
> +       { "cros-ec-gpio", 0 },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_gpio_id);
> +
>  static struct platform_driver cros_ec_gpio_driver =3D {
>         .probe =3D cros_ec_gpio_probe,
>         .driver =3D {
>                 .name =3D "cros-ec-gpio",
>         },
> +       .id_table =3D cros_ec_gpio_id,
>  };
>  module_platform_driver(cros_ec_gpio_driver);
>
> --
> 2.44.0.478.gd926399ef9-goog
>

Applied, thanks!

Bart
