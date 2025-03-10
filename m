Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D657E22A800
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612882; cv=none; b=q5hL3fmVyG31minuRYPRAXPrYZ7FZLrxJShsasFYNUttbea5gbEFJM++4EXJBdHSjVmWomM7hWTh62B9f72f5lcJp4hrosKQIGsOEKjiB9E5dV9nW1jLGE4fP1xNkv0VC1OQwORAOi21rShsZlqIqKlVnvmwCrPy5D7/glqA66I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612882; c=relaxed/simple;
	bh=IWlLF8DrTiQLV7YulM0bjPRBBicDPD7x0ITmE0vaaKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I++V4OzWpdYNP5hYXsp3Z4SaTPSb4lcPZdk08PrVnjPClyXPSEQKdamMc6Ty+/L3ayLzAu7CUjJNJjGFol605uhGZX8XmXWmjKeQj6Blk0+3FqSNFhx3GqjXLCs7oPv0PiZLvAlZVRkhgcqYvaH9u+vFdDS9GnODMhrP5N12pR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHuLwYih; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHuLwYih"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-547bcef2f96so4371422e87.1
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741612878; x=1742217678; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRfmnl323OF9SrXb4A5kibGIpi4d7DcYj7fQ/ScUAs8=;
        b=GHuLwYihE4ivsT6E8WWY0N1YfkOzmoSMEY6q6749GRwfMuU9gnu5UzA/1zdCGkhvw4
         yoKv2VBNKonZgCZWJhYFH1p+rk0bMODFJ2z7m3rDRk0JM07M59Vw8t+Vp+TszQq4UUzr
         6UEo5QJxVlutNrGBGcgBY80KXi1edJH34uXvrgtHZRWGPyonpxNVcK82NmEnqQxWKNZm
         KkZzdt4lFt0W6BB82S5p8/aMcYf+8n15KM3R7i/sCPLpMI5Kigi+PcbHFgh2LgYXsDHg
         FCOnGdaQHYEwulmYkQ5lyJis+Veg1P3kvqNQTWjaFLnoXM2JubpnSr+UaoZKFjPR6ZBk
         j7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612878; x=1742217678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRfmnl323OF9SrXb4A5kibGIpi4d7DcYj7fQ/ScUAs8=;
        b=BmWkpTq8ZTUMUox0cd75HR2R9O/oIzph5INOs1OtXTFtBD+CuEsHDBH6o+8XPNwPFX
         Md7ymCbrrA51V6yrkgUN43dxvFwvniUq7x2v6rAjBqL8PVH8Gg9VnwKB8NkB+44DYZa6
         8cUe1GiBgeeOxqic6YGGXCZHm5FdLmrBrSOH1Tr+m4U7ENgd5ZCf5axWhCmwMbPqaAxN
         vX5FxB6pN+rf1aXQy84p7IEuNXjCheW3ygC289obeKj2e9Bifhf+6fdT/prHSZ7mdu9d
         I4wX49fQaFOB2LgiRkzyi8BA9V6l0m+4RWtmYjKAbrYHT7UrbgZQ/EyQoalMdL4CAMWD
         yYxA==
X-Forwarded-Encrypted: i=1; AJvYcCWxcC6SkfXJmqhpgiPX9oHC9HlyuTufPnnJukLTTYlv9IjC8A/gf7849OqMjaHC/pczc/fxi8DKoquo04zb5t8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf8jJacJihyU1Wie1PnFI3LtryZJ6w+2TxDUeWtrEMYFQi9Uxs
	cbEsDMSO1HgLpCadE+OghRh0m6oPhuysJtDJ+svNxc6xQwqpFpQv
X-Gm-Gg: ASbGncsizh75jk/dAqyb4Y+haoHTxHCjhHNcWG7EkrcrGttu6wXOrn/lNoeQeCpSAmA
	PkGTbKvlWaQ100EJAUO6/Kxff4+FFP6z6HXte1bjVuRE8jC4gB4OOGlrwL52Ie/P+t07VGa9YF0
	bYdCKA0x3zYbifF9jy+SaLoU6Jd9MvBi4JMTCzSwcJakyGng4zG4w2DA4F74ZSQYWTDxginbEYe
	3ipiuNyP7Y5g47c+MUqNJ6xN2wXDQd4iHI/UBFEuHEstxABsLGQ8Jf62D24OR/1C8VyTDlqzsUC
	HZkK7wyeM3hjN7KZQXc7g0TAgk4mvBvxnlkdjr57XaDBsJU4ZofqGdoOaLP0Pq1/BFBlXLCnrOJ
	iXCv+Ho0wl5s9wZXkv6973iLDvg==
X-Google-Smtp-Source: AGHT+IGzewgmmnkeUFlJxWe8i0noE76ISEIkVEffA0dNVquaPUe/6tnIFsh0KoI73h3zjnHlAGQFQw==
X-Received: by 2002:a05:6512:3a8d:b0:545:cd5:84d9 with SMTP id 2adb3069b0e04-54990e5d338mr4308933e87.12.1741612877738;
        Mon, 10 Mar 2025 06:21:17 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae5902dsm1475143e87.99.2025.03.10.06.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 06:21:16 -0700 (PDT)
Message-ID: <bd86f1fe-8cd5-40f3-b06a-ed48a3ae5d5f@gmail.com>
Date: Mon, 10 Mar 2025 15:21:16 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] gpio: bd9571mwv: use new line value setter
 callbacks
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
 <20250310-gpiochip-set-conversion-v1-5-03798bb833eb@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-5-03798bb833eb@linaro.org>
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
>   drivers/gpio/gpio-bd9571mwv.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
> index 9a4d55f703bb..8df1361e3e84 100644
> --- a/drivers/gpio/gpio-bd9571mwv.c
> +++ b/drivers/gpio/gpio-bd9571mwv.c
> @@ -72,13 +72,13 @@ static int bd9571mwv_gpio_get(struct gpio_chip *chip, unsigned int offset)
>   	return val & BIT(offset);
>   }
>   
> -static void bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +static int bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offset,
>   			      int value)
>   {
>   	struct bd9571mwv_gpio *gpio = gpiochip_get_data(chip);
>   
> -	regmap_update_bits(gpio->regmap, BD9571MWV_GPIO_OUT,
> -			   BIT(offset), value ? BIT(offset) : 0);
> +	return regmap_update_bits(gpio->regmap, BD9571MWV_GPIO_OUT,
> +				  BIT(offset), value ? BIT(offset) : 0);
>   }
>   
>   static const struct gpio_chip template_chip = {
> @@ -88,7 +88,7 @@ static const struct gpio_chip template_chip = {
>   	.direction_input	= bd9571mwv_gpio_direction_input,
>   	.direction_output	= bd9571mwv_gpio_direction_output,
>   	.get			= bd9571mwv_gpio_get,
> -	.set			= bd9571mwv_gpio_set,
> +	.set_rv			= bd9571mwv_gpio_set,
>   	.base			= -1,
>   	.ngpio			= 2,
>   	.can_sleep		= true,
> 

