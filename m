Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C628120C03C
	for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742305037; cv=none; b=D3Krys4Oihc+QgZ6SgoxgDN2CysFoNIz9eScE0hxGceb0+5bK1grsOQvfW000a+0ZhXB1beYYHLllvKcIS/uTfBw4pbvPMBrlmZCa6P8u0UlroX4ngphdSWSY19agPyeYArr9sdsYYe6KeG+dQk4WGf7O7or8SGx2T5MR16Ulp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742305037; c=relaxed/simple;
	bh=gLiS5E5/j41dAF2u1/PRS3kABwQBMosBY3vftDyMJT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCKAxgRYYy/1+L1VeGpqwwUakIQ6/V8DQp8wsk55sogvwijkYkhBHmbe67cajIbHI9YiilWV3abucGMk7rs5+MVZrNs/MAdfa/WoD5nhQww93cdY4sO5XgG2mkTZLByJ40cvVKglQkTvvFb7Qu8RBuEvD8WruJ8o1zq4Y7kNG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0CXU9Ir; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0CXU9Ir"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so6011822e87.1
        for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742305033; x=1742909833; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4aQ/USEziwqIOaBZZu1tr4dqrJ+/dAALL9yIUU01u8=;
        b=T0CXU9IrrjYA2O0i7hJ6lQTcz5hAqDOC4f4xHuaAh7wfjoqnwqr96N07pCit3XNlud
         ioTrhYzFnm5N5hZXkxByt21igJTEufJxEA82cLHyBiC/Qr/Q5iCaSqJQYMJDNVqkv1XE
         rOCo+7SqIDU1jHpb+KE66XMn8WykihMm4TGKInXiiGv06xyVBCyPB6rQtE3R34VjeST+
         4Lvz/vEtx+w4Mv3WrbwYenVHeDxrhZBVqgOzAGQylrRsJbA0sPtASBiRtD3NveiCAjEK
         epMpEO1cdAx95TgihC4w1JZX1JmNS2qOR+Sh7d4m1Ltz60Yc0FhePkK6Xf3YHV8Y8Xwu
         Br1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742305033; x=1742909833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4aQ/USEziwqIOaBZZu1tr4dqrJ+/dAALL9yIUU01u8=;
        b=tQ3J8LtoCyZggiTrB4yusCa+1lpiJmi0YZIevf+5jQOFeAfFa59/Nkw2jBUOoBI2e4
         tm7vxESshQyAu3l1PmGXHvTxWjTHreq2Bi0RBh3tZi39u88EbyxI9urdDOyDyvsLJZSV
         Us7uHQBMGaEl0GHwfjfzJHbeFxq/+/QSSm6YtrNzzV0zIs7s1LRB1pMGRQxiQUNyzDQC
         Ov/KFkG8FJxlXqaXL9+UMmjByAOEGs9NM7tFP4nFgFm+pWRq0vB1BQEDBs6Jg6xT/RHP
         zv3Mq7LP1nwvnO2EoAc+A+1ieA19Y31Pqd0ljOBFC3CHogmTJ1MYvYG2OlunNSKMuPXQ
         6SqA==
X-Forwarded-Encrypted: i=1; AJvYcCWBI1tSRVHoNFrhbsyYQnaslkS5zi8pIIxBX3npAcc/Rjwkv1flijUv63ET9cfesV13GDn4Sv3C5atXeH0y/EI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLcg3IStPl7LtFv0ffBYtRxBtgyGhsuLeWWIOYgBuwmJqlYq8Z
	2f69VWa1dbLE2vM89nzmG6nSpISUhXd3NVUvbdtS9lbKJkE9ibbO
X-Gm-Gg: ASbGncv/7+/QvgrASYHalEC98FbaMF/KbHFP5sck/aWvR7SUKW4zZeguGjQ6cN0zWaB
	2Yhbo1fL35ura6glRrASXroEZo0TrTbjYeL+/fJYZ747AJ5n8by5gDKoWfNjzN/Tivz0mlwL5Sa
	Ri6UsCr6TIhrnChfdTZbmzB60Umg95QMjbLPuYRseRgujwXj7KrkK3oKGrb5w0JgEZeCK/TPFMk
	fOhO7S0ICzX65kkK0VoAL8/O6Gt91x7JvKxdoqqYv/Je8YhbC2NvGDm4nwoaimWn+aEd36SepNl
	JwXN3lpnQC4jVCiBaGPako6dewHFUD83aZrU8R3dMVYAoszK1hfOgnlxag==
X-Google-Smtp-Source: AGHT+IEYDxjpurPTXOW71G6SyX12wDygoGfJ2GHwNa6UtiAhkrvs17fqOzsC4BMVYEpW1w8Wfj8UYw==
X-Received: by 2002:a05:6512:32d1:b0:54a:c4ad:3956 with SMTP id 2adb3069b0e04-54ac4ad3c18mr1038951e87.1.1742305032393;
        Tue, 18 Mar 2025 06:37:12 -0700 (PDT)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88507fsm1657435e87.198.2025.03.18.06.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 06:37:11 -0700 (PDT)
Message-ID: <3e130395-8352-4de6-a82e-52594ce1d11f@gmail.com>
Date: Tue, 18 Mar 2025 15:37:09 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] power: reset: Introduce PSCR Recording Framework
 for Non-Volatile Storage
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, chrome-platform@lists.linux.dev,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, "Rafael J. Wysocki"
 <rafael@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 kernel@pengutronix.de, =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
 Guenter Roeck <groeck@chromium.org>, Zhang Rui <rui.zhang@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lukasz Luba <lukasz.luba@arm.com>
References: <20250318094716.3053546-1-o.rempel@pengutronix.de>
 <20250318094716.3053546-4-o.rempel@pengutronix.de>
 <ea681b76-db1c-4529-bd53-09e4bf384977@gmail.com>
 <Z9ly2eC0_r3gyToy@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z9ly2eC0_r3gyToy@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2025 15:19, Oleksij Rempel wrote:
> On Tue, Mar 18, 2025 at 01:01:30PM +0200, Matti Vaittinen wrote:
>> On 18/03/2025 11:47, Oleksij Rempel wrote:
>>> This commit introduces the Power State Change Reasons Recording (PSCRR)
>>> framework into the kernel. The framework is vital for systems where
>>> PMICs or watchdogs cannot provide information on power state changes. It
>>> stores reasons for system shutdowns and reboots, like under-voltage or
>>> software-triggered events, in non-volatile hardware storage. This
>>> approach is essential for postmortem analysis in scenarios where
>>> traditional storage methods (block devices, RAM) are not feasible. The
>>> framework aids bootloaders and early-stage system components in recovery
>>> decision-making, although it does not cover resets caused by hardware
>>> issues like system freezes or watchdog timeouts.
>>
>> We might want to rephrase this if we envision that boot reason could be read
>> from PMICs (or other devices able to store the boot reason) using PSCRR
>> interface. (Because a few PMICs can store the boot reason even for the
>> hardware initiated shutdowns like Watchdog or voltage/current protection).
> 
> ack.
> 
>>> It is primarily intended for controlled power
>>> +	  state transitions.
>>> +
>>> +	  If unsure, say N.
>>> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
>>> index 10782d32e1da..dbd6ae6b26a4 100644
>>> --- a/drivers/power/reset/Makefile
>>> +++ b/drivers/power/reset/Makefile
>>> @@ -32,6 +32,7 @@ obj-$(CONFIG_POWER_RESET_KEYSTONE) += keystone-reset.o
>>>    obj-$(CONFIG_POWER_RESET_SYSCON) += syscon-reboot.o
>>>    obj-$(CONFIG_POWER_RESET_SYSCON_POWEROFF) += syscon-poweroff.o
>>>    obj-$(CONFIG_POWER_RESET_RMOBILE) += rmobile-reset.o
>>> +obj-$(CONFIG_PSCRR) += pscrr.o
>>>    obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>>>    obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>>>    obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>>> diff --git a/drivers/power/reset/pscrr.c b/drivers/power/reset/pscrr.c
>>> new file mode 100644
>>> index 000000000000..466eca0e4f7f
>>> --- /dev/null
>>> +++ b/drivers/power/reset/pscrr.c
>>> @@ -0,0 +1,417 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * pscrr_core.c - Core Power State Change Reason Recording
>>> + *
>>> + * This framework provides a method for recording the cause of the last system
>>> + * reboot, particularly in scenarios where **hardware protection events** (e.g.,
>>> + * undervoltage, overcurrent, thermal shutdown) force an immediate reset.
>>
>> Is this contradicting the Kconfig / commit message?
> 
> There is so many redundant text, i already lost track of it.  What do
> you mean?

Sorry, I should've been more specific :)

I was just thinking that it may be hard to understand what type of 
events the PSCRR is able to detect. The commit message (which I thought 
might be rephrased a bit) said:


The
 >>> framework aids bootloaders and early-stage system components in 
recovery
 >>> decision-making, although it does not cover resets caused by hardware
 >>> issues like system freezes or watchdog timeouts.

(What I got stuck was the "does not cover resets caused by hardware 
issues" - but maybe it's just my limited reading abilities because the 
sentence seems to say also: "like system freezes or watchdog timeouts". 
So perhaps there is no contradiction here.)

Kconfig says:

Note
+	  that this framework does not track hardware-induced resets, such as
+	  system freezes, watchdog timeouts, or sudden power losses without
+	  controlled shutdown. It is primarily intended for controlled power
+	  state transitions.

Here we however have:

"particularly in scenarios where **hardware protection events** (e.g.,
undervoltage, overcurrent, thermal shutdown) force an immediate reset."

So, I was wondering if there is a way to clarify what type of hardware 
protection events are covered, and what aren't. I know this is not easy, 
especially if we allow reset reasons from PMICs to be included.

The comment was a 'nit' so if you see no good way to improve, then 
please keep it as it is.

>>
>>> Unlike
>>> + * traditional logging mechanisms that rely on block storage (e.g., NAND, eMMC),
>>> + * PSCRR ensures shutdown reasons are preserved in a way that survives power
>>> + * loss for later analysis.
>>
>> Here, the 'level of power-loss' plays a role, right? I assume some level of
>> power must be retained for the 'storage' to stay alive.
> 
> Yes, on the system I'm working on, there is designed capacity and
> voltage drop detector to do $THINGS before the system will go off. To
> get the full picture you may take a look to following patches:
> 
> https://lore.kernel.org/all/20231026144824.4065145-1-o.rempel@pengutronix.de
> https://lore.kernel.org/all/20250310102229.381887-1-o.rempel@pengutronix.de
> 

