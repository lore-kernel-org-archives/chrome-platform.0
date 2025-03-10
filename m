Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36871229B1A
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 13:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612585; cv=none; b=ucpGfsI/q/Iak5u+6dfZPd0DTFX4dC4bUR1ZGFI0JOeCsIkVxveqlNa5LarO4AqrAZUVJlqC1Xet6uMkDEJSDlUpOTC9VaPlSPcpQecwXOlcOq4h7sHOrmM+n2TPaVQ85XfmtGkRyOP0rJjKmgA607E2xlIPAZWD/aamYxK8NfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612585; c=relaxed/simple;
	bh=M8qonvUQhRRmrlcJ0hhHz3omTRWoZtZPhcLCp42I2ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZL1dPfTUvErOeuo0+WIdQahK+pZMa4xjOzIw7MtE8ulhYJ1JrlPHfC4cDucfR6DSa2URNwOSr0uLIan5xXKhyZXbWVnR7xiK5/3nF1qtjCX2FgcK6xbDHFyC53yBVnZaeh1LP9G/0l57NSX7Pu4YGOknXaKvs22ZfDBHy9uLXNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z146rCHV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z146rCHV"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54993c68ba0so3046514e87.2
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741612581; x=1742217381; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VelmRFPde53xqbAzlgnHoP18LxVcPepOhlqsb8RM6wc=;
        b=Z146rCHVka90VMSyCpiiX6vLTic1RjLTMwiYP11fF4s2Inf+H70wVUo4OZc8o+EsdX
         8DX0g1SdRl5Gj6DCbaoAVdZ9NfdFja+2PrLQQlBOEV5i+vJ2Zazten8GXhsgfpJarujb
         nvG5/BiEOPiURNSD9/ZncDRJhJy0dxbeuLRil+3HVjQpIynBiS/+6WhYdp88KDIjMgQT
         PGaYdRufCb4gRsuP2qvTaVOCxuYFJZN4vrEzxCxrgp4LWhUjIZC/UtQdG03P9i7dnTWm
         aPm+bczpOgZ+lX6MUZDnU6lYiW3bvAiuI1rdoIMx6/rUWeNBP8+VMXDGJ+ttlZe0gI0a
         6ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612581; x=1742217381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VelmRFPde53xqbAzlgnHoP18LxVcPepOhlqsb8RM6wc=;
        b=XhPZnnA1/L7gdIehSHfxGt1Z1aEAPZqy9pfDMEx5TdAmo+y32494Ap/TkMMv5Z/xYj
         GwrVRv3KSrMk7M9s007ln5iNUZw5iZR77ReH/iKcy/e+gI+aihn8A5Bz+JFt29TeEJ92
         9kVtuQhDO7cjrr/yI7YRfGGrggvJlTg+xH/9jZEtb2fPUebVKsaov3pIsM5RLQ+35NKz
         yl7kF+wmLTDhF9o9FyBSu9SvTbGEDC5K8gXJInBaKwEicv8OUo02oiK+ZeeZdtTyNfF5
         RjRPy29pWk6nRgOdR+gdIIc89iuzyMnW98ITO68XyojOqAE6XMnOVX2vOFUTaLG9J/M/
         ymIA==
X-Forwarded-Encrypted: i=1; AJvYcCWdBXfiuwRAbcvydY+quk10uylwXnxoFEHgaeYrunjmNlow4Mi6sHuYTyFKVNEAjGa+kKg9P/V7glbq5GzSym0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRz/W4faUwaKAOJYb/dJrwVN8LgJ1ZlubpQhl2KTSgZ6COKWEw
	462fz8ZAHXrVpN2RYpn/s5FSqmc5lqiX+O5PV8ut1SfyXa4NhRmG
X-Gm-Gg: ASbGncvAb+tGzqsKcEhpb2v5Ri/hvVPHvmiKmGPpw+OufxA8zSp6X1O3CFEg3u7XF8W
	LHYcjjOudXOzHY0zGcM3CXHYvA88ovsZA69ztt4iLao8HyqS3vmMsTsLjXFscBvLSRcxNW6PlA0
	rh23cSLM7U45AZ8Jluvm3FveQz/OglTUh2OQ6U0J+Z+69kGvQlPpRS0kgaGL7C8A9hanUNZ03Ht
	XpQam2IntcxnxL7pjaQiSIj1pn/04ZaErPUx6fJaGl48Dxf2DJkJXirNIlCYToxzma3/25vWhD+
	hh5TzcP/6OLXFSKz8M7cElXArI6l5qzlYUNXkAyksMuwroI+pfSsiZzVdFShDEJw5BLXS2C5lfI
	ZwQ2aHLuuyanCCyNwB3cinom11oi7FeAS6njW
X-Google-Smtp-Source: AGHT+IEN6RA/FhUKAi67rrISyQvUAXdp5U/gAvAoDg3KjSkA/WcDoaiTVPJIm1UgDUAvGtdLc/DPIg==
X-Received: by 2002:a05:6512:ba6:b0:549:8ed4:fb64 with SMTP id 2adb3069b0e04-54990e6725bmr5092561e87.24.1741612581068;
        Mon, 10 Mar 2025 06:16:21 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1bbee4sm1461221e87.168.2025.03.10.06.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 06:16:20 -0700 (PDT)
Message-ID: <a9f27271-320b-4cd3-a3bb-bd5aa3ac30da@gmail.com>
Date: Mon, 10 Mar 2025 15:16:19 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] gpio: bd71815: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>,
 Thomas Richard <thomas.richard@bootlin.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
 <20250310-gpiochip-set-conversion-v1-3-03798bb833eb@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-3-03798bb833eb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2025 14:40, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!

> ---
>   drivers/gpio/gpio-bd71815.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bd71815.c b/drivers/gpio/gpio-bd71815.c
> index 08ff2857256f..36701500925e 100644
> --- a/drivers/gpio/gpio-bd71815.c
> +++ b/drivers/gpio/gpio-bd71815.c
> @@ -37,21 +37,18 @@ static int bd71815gpo_get(struct gpio_chip *chip, unsigned int offset)
>   	return (val >> offset) & 1;
>   }
>   
> -static void bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
> -			   int value)
> +static int bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
> +			  int value)
>   {
>   	struct bd71815_gpio *bd71815 = gpiochip_get_data(chip);
> -	int ret, bit;
> +	int bit;
>   
>   	bit = BIT(offset);
>   
>   	if (value)
> -		ret = regmap_set_bits(bd71815->regmap, BD71815_REG_GPO, bit);
> -	else
> -		ret = regmap_clear_bits(bd71815->regmap, BD71815_REG_GPO, bit);
> +		return regmap_set_bits(bd71815->regmap, BD71815_REG_GPO, bit);
>   
> -	if (ret)
> -		dev_warn(bd71815->dev, "failed to toggle GPO\n");
> +	return regmap_clear_bits(bd71815->regmap, BD71815_REG_GPO, bit);
>   }
>   
>   static int bd71815_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> @@ -88,7 +85,7 @@ static const struct gpio_chip bd71815gpo_chip = {
>   	.owner			= THIS_MODULE,
>   	.get			= bd71815gpo_get,
>   	.get_direction		= bd71815gpo_direction_get,
> -	.set			= bd71815gpo_set,
> +	.set_rv			= bd71815gpo_set,
>   	.set_config		= bd71815_gpio_set_config,
>   	.can_sleep		= true,
>   };
> 

