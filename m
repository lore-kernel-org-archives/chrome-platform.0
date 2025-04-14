Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684057E9
	for <chrome-platform@lists.linux.dev>; Mon, 14 Apr 2025 05:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744609856; cv=none; b=mVVgIrefVaqCUUDcGZdR51ZH6RfdPwzjLp7bSuoFAoh08Q5y66pQ7AqLr7xkKXOoIjxicywNJjmEKBEnZeNFiakXJh6Uhh1dNA+iYpTDm/8EssPYKSu+NFux8NJhvw7aJZ8wu6riOCAi0QZNDZhTnnJF/ddenV2q0IIV+tcSvB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744609856; c=relaxed/simple;
	bh=2Mrd74G8jnzozakHJyUqjNWTFaTsEQFw2FnelXGs4eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvIo1+pch5Q4xQCnZiCz2pMCzN6N1oi3M2odGbmesp02o95iIkq1OyVY8VX3WxK5e59eb4MOK1xCzrO2Ag3CICVl3+wXahd8HVa+xXjwXPovb1jYqMA298Z8MOwb1Ml3h+v7rZQ+MTBCPrKDNkLns6j6odLM9BgNbjip2BFPkOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcLEiANO; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcLEiANO"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54963160818so4848035e87.2
        for <chrome-platform@lists.linux.dev>; Sun, 13 Apr 2025 22:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744609852; x=1745214652; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjZiPaurJef/nQ7PXXGeudPtbJ9Ii7WZiGcrpGC547I=;
        b=KcLEiANOdQEHIRIeDJQ7pADb2S2Vicv6Q60RSroo4vhSPapvaw1pXsvaE1PNz4vqa4
         VaWnrlKxjdaEg+YcVbG4Pby3M/ZX1ny7kUyCJbUyVCM4HvgfgCCcqSI9PzCJFmG5LoQ8
         +31N4IErqES1Bs7FtLDLsvYSCGiLqfwIHa/Nr1+4B974sFT/6OtcpaPrleYPp/oKj5Yq
         Fzkt9SglmlaCnppV8Gol6wZqIV1hxuBCrQwrVy2bpM5A+JNwvEsAsGvI1A+QnarDAd0y
         UYbLx0VkbStANgA33d8na7UMemweECIAMcvy4bEegF2U+Pkbq64ZCnzAhkQPMsA33NmQ
         8vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744609852; x=1745214652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjZiPaurJef/nQ7PXXGeudPtbJ9Ii7WZiGcrpGC547I=;
        b=oDH57+Xv+pY2AlY23qmuUB6Y0u/lczy4NxPjGX2ATMwgg5pUUx9zUNf+60U8ro1omd
         y60Xi9HkE2WzJoQd/XzfnTG1/vnOhVS1DGIQPldphu87C6j9RL+gy7LMRfTngZqb04cO
         aliEPg8cS1psN0xVlqu+bUcJuzbkPYDGNydytfH4NVeSx3X0uCz+evEdiLl9y6s/29Bk
         4GOLV9Gljy2ISuGoGeDsit/WV7XbPRMLhjc2SUGHaDSzMz33pJFAQ7FkntMxIWJn2T0L
         q5GPKqLmXZrLGgxgMqNvvTPBxLLvZmMkz4pI21xzxsXcPX6Bj4LFo5Aw4tjTUbeI7zyd
         Km9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVecqrBLcfzumPEmBmsIzO24IAVNxHJxkoyivP30rBy+4t8zsz3v3tAEYjcPhEBB1GkQa5sji9Sf5dIzuQoU60=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAsVWPrMMmYHBdXCiMOIq26bdOC1dVCbohN7NgSDHv+30/W6mN
	cBfld9a8lVbBnGAlZv2bosuVW55j4l0x+LmBULQ9/0eEJQghH2cN
X-Gm-Gg: ASbGncuHpAWJgw9S66V8F7RjEneoS3yED2FoH9BjIZKZ4zTcw+srFO4igbYkUxVtXYv
	X2XtmjxujZZX6swCAWNq9Qy8Snjwier3bzs8ZBHioPtTgn6tzgqpNPBz10fa+0GevWthaoJh2VK
	VxC2WNvCupXPoq4KQxKiYMe2410F61aK9R/rV7ZF4TdenzNCRFzvudp/oamM3/gXg3ZiD0CLuhJ
	+c0Bx5SeWOn2tPy51utzsHyyzSmqR5M1N6corpqUoL35MEjfSk1z3N8s6FwxEyLXMq01wvCe5Qj
	qYUMdxdIMbtLFPpnSoI9kTrNwwsiiWn3RiS8MaqhBKPBx2dtxu20Oqt2PZRc6VJb0bNeyqgLRuC
	Vhc52ZTzV9xKPljXyhAJBVw==
X-Google-Smtp-Source: AGHT+IGwehThK/mwC7NzmRgvxhCl43K9ObVWa+VGJVROKVO9BH25ZKpqXCcq49QGDVWL6eOlrdkO9A==
X-Received: by 2002:a05:6512:23a3:b0:54a:fa47:b2a5 with SMTP id 2adb3069b0e04-54d45293cefmr2989067e87.23.1744609852045;
        Sun, 13 Apr 2025 22:50:52 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123298sm1004252e87.1.2025.04.13.22.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 22:50:51 -0700 (PDT)
Message-ID: <462374bc-a7e7-4660-83aa-5c3b9127a720@gmail.com>
Date: Mon, 14 Apr 2025 08:50:50 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] power: Extend power_on_reason.h for upcoming PSCRR
 framework
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
 Guenter Roeck <groeck@chromium.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, chrome-platform@lists.linux.dev
References: <20250411121757.573419-1-o.rempel@pengutronix.de>
 <20250411121757.573419-2-o.rempel@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250411121757.573419-2-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2025 15:17, Oleksij Rempel wrote:
> Prepare for the introduction of the Power State Change Reason Recorder
> (PSCRR)  framework by expanding the power_on_reason.h header. This
> extension includes new power-on reasons:
> - POWER_ON_REASON_OVER_CURRENT for over-current conditions.
> - POWER_ON_REASON_REGULATOR_FAILURE for regulator failures.
> - POWER_ON_REASON_OVER_TEMPERATURE for over temperature situations.
> - POWER_ON_REASON_EC_PANIC for EC panics
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

FWIW:
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
> changes v6:
> - add POWER_ON_REASON_EC_PANIC
> - s/POWER_ON_REASON_OVERTEMPERATURE/POWER_ON_REASON_OVER_TEMPERATURE
> ---
>   include/linux/power/power_on_reason.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/power/power_on_reason.h b/include/linux/power/power_on_reason.h
> index 95a1ec0c403c..bf9501792696 100644
> --- a/include/linux/power/power_on_reason.h
> +++ b/include/linux/power/power_on_reason.h
> @@ -15,5 +15,9 @@
>   #define POWER_ON_REASON_XTAL_FAIL "crystal oscillator failure"
>   #define POWER_ON_REASON_BROWN_OUT "brown-out reset"
>   #define POWER_ON_REASON_UNKNOWN "unknown reason"
> +#define POWER_ON_REASON_OVER_CURRENT "over current"
> +#define POWER_ON_REASON_REGULATOR_FAILURE "regulator failure"
> +#define POWER_ON_REASON_OVER_TEMPERATURE "over temperature"
> +#define POWER_ON_REASON_EC_PANIC "EC panic"
>   
>   #endif /* POWER_ON_REASON_H */

