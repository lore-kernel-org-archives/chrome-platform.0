Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE881A254E
	for <chrome-platform@lists.linux.dev>; Fri, 14 Mar 2025 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741954968; cv=none; b=bMhh+j7Dc1QGjV5mDJMMgl9y7OdykyyOQDTqCVEPy/GFTzQU4Cu1kmvPBkCBmY9MLYQqp/X+q+lde91FJPzJMt/bTIX8GGkJVpN/FWiI1qz5gLp2oA02Kurp53GKs6bi4Uv1BACOudqCWlfyF9WqXlFenj3Yrrsm53a7M5JnDeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741954968; c=relaxed/simple;
	bh=XOkBCRF4fPWiEwhz3wTVytovSusd2orQZZzDz4mYZ3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OKPuBn63/4BCEJgj79z/BSR7B4rl2Eo6K1UPYYIcQG4kpoH8sDkqgso4rxNj5VqkUST2xMV1pHflbxbqgW87ZxMo4keSDZeXNInhIrtEXw/71+7gdkEA5LaVngBR+vW/Xt/uK44p7LqiArDisY2VqL+T72kkRlZuZw3CPavczbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VweS2YmE; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VweS2YmE"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30795988ebeso21083661fa.3
        for <chrome-platform@lists.linux.dev>; Fri, 14 Mar 2025 05:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741954965; x=1742559765; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ry2RdRxaIEj6R0WcfwppEn7IhChq0ONiN9TM0ey9o88=;
        b=VweS2YmEOSGqHsnTSfOzVbHSfLiCq3816+CQhALCtqSm5fxrR/4MPaN/IN1kXyWCn7
         wco/4ho+cBHnlZg4WsEi7OgGuKoKJNeli4a21v3+Qn43zfjidAeHCbhHRNymZzt2h5E3
         HeJ0xgpSvvWQTA83q8IoHokyNOy88aZakv5IOIFGunbAFGIc2NqcFxYQgAQJp3CPNzEJ
         JAg/arNPQeTMLV1PfTbYkywH7HRdLsCaYA73O5gzFvIabsvS3GsXN3qeoMTQxO7mH+MY
         efoVWcHoRGKxNOcgXKVU0khxoBKQ/l6J5BvGlRkm9/6LXi18aTy0eMaxsnYdJsK67pVN
         OtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741954965; x=1742559765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ry2RdRxaIEj6R0WcfwppEn7IhChq0ONiN9TM0ey9o88=;
        b=FRT76rXjHoIL38bXmOlfO8A9PWRZ8PE2YLysz5a1e9Xs3pF3laJPRamzpDx/3g8R0q
         YQzWGAEkJaoVdBg/pfFk0EtPGGbSxwOKrLRm18CfRuLzCCMh0zXOl95BYMDJo0r1+YBz
         wzdiG/p77FdhhHgzO46QLVekLFpWTKFHgrI6hxSsg0Q5KRSQWyj13DKKxauUW2ZpbHZt
         C8AoMRiyr6hfjZzAbyBwoAvzPq+29p2P2/j3VtVQQd2NHH2OBao8XetWWi7XhvhHSZfY
         xmY8h12T7iyXQ0Cc/DJqEts+YqXd/rIF5CCfFxMKV2niQoO4le7h33hn5H/zYUNYusNO
         5urg==
X-Forwarded-Encrypted: i=1; AJvYcCXxvbg286KKchTNhPS/AgcZ2107E+cNEUFuKokxnhkrz6T7CER8Vv66F1hfScA9VV7ZqhuoOACt4jzTeKkA1Rk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyArEXqo6bK53BM8BN1Y12wL3BJk6z2QX4naVkWKnSwu3iW5+b1
	vZS/aVYjsz0YnGJnX/8J3u47KGD9IxR68ehPSLvIDlnOrylfpn94OP8MiQ==
X-Gm-Gg: ASbGncubjeXs0BcpJ/6UbpZAkbblgUCDFP2MbICgJNPFacjT+s0jTh37jDjg8IDmwbK
	qmIMnT6jMJlKi0QJgXEVVh6/SGRQtpSJhZwC5MZPOtAah+zxvFc6vAS9RcdyZp6gJgo5sDrCOhJ
	OBY0EXYUUESfSJjvaAKsrB5a3wiMXmsmUVvXlW3iKOkFTl8BOT638oaj356XyONUZYDWoLIRqHX
	LsY3kN3xvYTVSkpllxbjtaM4KR9m6GNmZ6GLfliZwTG9Fur8SW81LcZqhUCg/6rkjbSTslW6K8Y
	JMHyTemAZo/msCKtey6xkfVnaRw0VQ1X1BBzMDasl80hwOgvRz2gFV88xkJsYnRrD4ZFd2Rk8sQ
	byy7HdB001ScRce9uZy6JEGnXtQ==
X-Google-Smtp-Source: AGHT+IF2n2QrYzrJyXMDAPimkCx+4Qfg2BIZON+iQVvMQCrSsEtdz43VKcbb2wXM0ULY60GxnyX72w==
X-Received: by 2002:a05:6512:159a:b0:546:2f7a:38c4 with SMTP id 2adb3069b0e04-549c38e2ecfmr656026e87.13.1741954964411;
        Fri, 14 Mar 2025 05:22:44 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864c1dsm514246e87.119.2025.03.14.05.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 05:22:42 -0700 (PDT)
Message-ID: <58e19481-530c-4465-aec5-1f44462eaf5f@gmail.com>
Date: Fri, 14 Mar 2025 14:22:40 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] power: reset: Introduce PSCR Recording Framework
 for Non-Volatile Storage
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
References: <20250314113604.1776201-1-o.rempel@pengutronix.de>
 <20250314113604.1776201-4-o.rempel@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250314113604.1776201-4-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi deee Ho Oleksij,

On 14/03/2025 13:36, Oleksij Rempel wrote:
> This commit introduces the Power State Change Reasons Recording (PSCRR)
> framework into the kernel. The framework is vital for systems where
> PMICs or watchdogs cannot provide information on power state changes. It
> stores reasons for system shutdowns and reboots, like under-voltage or
> software-triggered events, in non-volatile hardware storage. This
> approach is essential for postmortem analysis in scenarios where
> traditional storage methods (block devices, RAM) are not feasible. The
> framework aids bootloaders and early-stage system components in recovery
> decision-making, although it does not cover resets caused by hardware
> issues like system freezes or watchdog timeouts.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

I see you're already at v6, so I am probably slightly late... I think I 
hadn't noticed this before. Thus, feel free to treat my comments as mere 
suggestions.

All in all, I do like this series. Looks mostly very good to me :) Just 
wondering if we could utilize this same for standardizing reading the 
reset reason registers which are included in many PMICs?

> ---

...

> +int pscrr_core_init(const struct pscrr_backend_ops *ops)
> +{
> +	enum psc_reason stored_val = PSCR_UNKNOWN;
> +	int ret;
> +
> +	mutex_lock(&pscrr_lock);
> +
> +	if (g_pscrr) {
> +		pr_err("PSCRR: Core is already initialized!\n");
> +		ret = -EBUSY;
> +		goto err_unlock;
> +	}
> +
> +	if (!ops->read_reason || !ops->write_reason) {
> +		pr_err("PSCRR: Backend must provide read and write callbacks\n");

Why both are required?

I can easily envision integrating the some PMIC's 'boot reason' register 
reading to the PSCRR. Benefit would be that user-space could use this 
same interface when reading the reset reason on a system where reason is 
stored using mechanisms provided by this series - and when reset reason 
is automatically stored by the HW (for example to a PMIC).

In a PMIC case the write_reason might not be needed, right?

> +		ret = -EINVAL;
> +		goto err_unlock;
> +	}
> +
> +	g_pscrr = kzalloc(sizeof(*g_pscrr), GFP_KERNEL);
> +	if (!g_pscrr) {
> +		ret = -ENOMEM;
> +		goto err_unlock;
> +	}
> +
> +	g_pscrr->ops = ops;
> +	g_pscrr->last_boot_reason = PSCR_UNKNOWN;
> +
> +	ret = ops->read_reason(&stored_val);
> +	if (!ret) {
> +		g_pscrr->last_boot_reason = stored_val;
> +		pr_info("PSCRR: Initial read_reason: %d (%s)\n",
> +			stored_val, psc_reason_to_str(stored_val));
> +	} else {
> +		pr_warn("PSCRR: read_reason failed, err=%pe\n",
> +			ERR_PTR(ret));
> +	}

...

> +/**
> + * struct pscrr_backend_ops - Backend operations for storing power state change
> + *			      reasons.
> + *
> + * This structure defines the interface for backend implementations that handle
> + * the persistent storage of power state change reasons. Different backends
> + * (e.g., NVMEM, EEPROM, battery-backed RAM) can implement these operations to
> + * store and retrieve shutdown reasons across reboots.

Maybe we should support / mention also a case where the PMIC driver 
could just register the read-callback and provide the reset reason 
stored by the PMIC to users. In this case the write_reason might not be 
needed.

> + *
> + * @write_reason: Function pointer to store the specified `psc_reason` in
> + *		  persistent storage. This function is called before a reboot
> + *		  to record the last power state change reason.
> + * @read_reason:  Function pointer to retrieve the last stored `psc_reason`
> + *		  from persistent storage. This function is called at boot to
> + *		  restore the shutdown reason.
> + */
> +struct pscrr_backend_ops {
> +	int (*write_reason)(enum psc_reason reason);
> +	int (*read_reason)(enum psc_reason *reason);
> +};

Yours,
	-- Matti

