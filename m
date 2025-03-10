Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8CF1A9B3B
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 13:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612816; cv=none; b=qQkVtVmT91U7vYMJlOLHnnmV8RLc/QGGWRRFadnVemAEolccv4/KR451WUVtiWKH0bq6Ovv+Hw4Y6ho00rDkw/pssY2fk1fSSVAxk7rpNbnBMiHJ/9DWR8mwZwGsTiG/tJvinRPOhmsADfgWLv2y5p+o1iZimQrpEaVFwCvqJDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612816; c=relaxed/simple;
	bh=2AHxYwcyOZBFHgTfNokaRNt0i2/xdNHTQ7pLuqe2Xh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgS5wrycCgK2lK/mSNmkEVhNADYxhr1lRwL6HIfuDvs8kRylRmxBuCRqo/gECftY7zFSpD7WMQyCNflsRpfM/sF5mqfNlGxs9urlNk9ahPlomGBbDs7Fh4G+sqQOeWHLNpFPCsGxl3EOI215znxGfqAvuiVcL/SRx8td24+kkxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iATjUdpQ; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iATjUdpQ"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so45114971fa.1
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 06:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741612812; x=1742217612; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uIN9qnJPxF5d49Ai441xtWm1lqpAVaRoxtSwVCRC5ZE=;
        b=iATjUdpQseNcnDeb1OprgwAExH4v9hKPKsxjy49bqzSWdkITgF+vw7ZyT1TKlJ4S0I
         sEQKBzOfhp18QimgzswKmoeVtXFc7qOt3PlVvR7r7NYB0C76ySwjJXQMf7iutuQ5ikO2
         oyFuJf37OiQZ9c9w5zLG8pRFMWka6svAkZGsrVAyHFrYt4RDn8po56yUOdlld1Pr25EU
         p7SEfgG0YMEoZGTIYy3UzZiCSGVYrv3mxH+LF0BNVdHEI6NADN3TazAheTIqEMAQORrz
         58fiBZCbr4IPlrsCpd/tOuUDZeDYRhnTRbDzwcq4umaXC5apv3o6q8kywievui/or3P3
         mJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612812; x=1742217612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIN9qnJPxF5d49Ai441xtWm1lqpAVaRoxtSwVCRC5ZE=;
        b=wi94kGwsK0bNhWBeFnrPV0Yk3NxqE0ROpX3HcSU/RkJPPp2NnAgYyLigYhs8gdyJTb
         +U2kZ9nq5gODfRaLv4V4dG/4N6RWv3PsSh7Z0bqAvDcXiz1z5UmZaSK/Y8Ttth/3AuU4
         RhKIt9nigthEKlmuTAtPWaJGdo3TcX/DI2SRcH0lkArY21LPz9+uER11x4c6mZu5Rwbe
         PdcYvELjSnoiTthiPYpG6v37eyhkuYzUYGMBrcP6rCTy2bPnUNZVwY+zLEDlGgHgw91Z
         S4BDH6k2LeSgCA9I8ugKrGxDmELsttNHNNIIwjBFIghaZRg3DWK1kwFawSWnfZaj5qhw
         kJIw==
X-Forwarded-Encrypted: i=1; AJvYcCWo40wRVaz1OLeiypYhYnNRzFIgRCrEHdclBEOBg8uR0Hp7shu+6WPlSB5F4V6bwvcImdbauz42M9eSjlFTwlg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxyNnaY7XG1sg2/cQJ607NAT1Mo+0ddS0O4ut29ji7XPk75SFK
	S+4+zOnPF0DiyMNctcVFt0Dwz4aJKYKP1scc6YKnl762pAp7o6gH
X-Gm-Gg: ASbGncuIoftxTS5osR2ax4j5CaV0HTrc+pbZ/jZXNhi3GB0xBafffblqbtfXgxtNSTY
	ipLi7eHlHNuNPR2xfK13YzTa3WiWnFtTp9heVMGhdlKoT1OM20DQddj0xbEEJ6FeDLCOoJRC2Jl
	RjY394PmLcGc2HeYWdjBs9lfAYSiZb3ug6VOeeCykydNI/XVmWPFcBLcb/inR8TZirA5N8mzft5
	mvG85Q0laqCgDvqgXNcmsBcDk7ZCGxvzump4ZSUaqsTqdm6CFCdZtTeOsG9RoX+vWAcgMN2IEMS
	U1uIbBM2kLVuFNLRKrHDXsWJcKMngTEErg3i87C/HTQRERtoTirRSgggITfvOJ1CEg5uwC4KU/A
	7Llw+auZEkWFqM81/5EbGeOIjAA==
X-Google-Smtp-Source: AGHT+IEF1Q5OiufZ1ooC9SoR2jkBeuL8mpXvsPLmTBTbXNvs5wA77q8kyDlOtMByfhSrkrTpiQUACA==
X-Received: by 2002:a05:651c:19a1:b0:307:9555:dc5e with SMTP id 38308e7fff4ca-30bf44ed6d8mr42550331fa.3.1741612812228;
        Mon, 10 Mar 2025 06:20:12 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c13a0e20asm4133221fa.49.2025.03.10.06.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 06:20:11 -0700 (PDT)
Message-ID: <475375c9-9d72-4583-a21e-37b17c6b8c46@gmail.com>
Date: Mon, 10 Mar 2025 15:20:10 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] gpio: bd71828: use new line value setter callbacks
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
 <20250310-gpiochip-set-conversion-v1-4-03798bb833eb@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-4-03798bb833eb@linaro.org>
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
> ---
>   drivers/gpio/gpio-bd71828.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bd71828.c b/drivers/gpio/gpio-bd71828.c
> index b2ccc320c7b5..4ba151e5cf25 100644
> --- a/drivers/gpio/gpio-bd71828.c
> +++ b/drivers/gpio/gpio-bd71828.c
> @@ -16,10 +16,9 @@ struct bd71828_gpio {
>   	struct gpio_chip gpio;
>   };
>   
> -static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			     int value)
> +static int bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			    int value)
>   {
> -	int ret;
>   	struct bd71828_gpio *bdgpio = gpiochip_get_data(chip);
>   	u8 val = (value) ? BD71828_GPIO_OUT_HI : BD71828_GPIO_OUT_LO;
>   
> @@ -28,12 +27,10 @@ static void bd71828_gpio_set(struct gpio_chip *chip, unsigned int offset,
>   	 * we are dealing with - then we are done
>   	 */
>   	if (offset == HALL_GPIO_OFFSET)
> -		return;
> +		return 0;

Should this be -EINVAL (or, can this check be just dropped?) Value of an 
input pin is tried to be set.

>   
> -	ret = regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
> -				 BD71828_GPIO_OUT_MASK, val);
> -	if (ret)
> -		dev_err(bdgpio->dev, "Could not set gpio to %d\n", value);
> +	return regmap_update_bits(bdgpio->regmap, GPIO_OUT_REG(offset),
> +				  BD71828_GPIO_OUT_MASK, val);
>   }
>   
>   static int bd71828_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -112,7 +109,7 @@ static int bd71828_probe(struct platform_device *pdev)
>   	bdgpio->gpio.set_config = bd71828_gpio_set_config;
>   	bdgpio->gpio.can_sleep = true;
>   	bdgpio->gpio.get = bd71828_gpio_get;
> -	bdgpio->gpio.set = bd71828_gpio_set;
> +	bdgpio->gpio.set_rv = bd71828_gpio_set;
>   	bdgpio->gpio.base = -1;
>   
>   	/*
> 

