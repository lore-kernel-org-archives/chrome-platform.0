Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E72E5789D
	for <chrome-platform@lists.linux.dev>; Mon, 17 Mar 2025 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742198106; cv=none; b=OCil1C+UD4xYMjI28Vv1SH1IJ+cJruBVn3GB3LZNHzjLB6cG+5KVblTti18ThMxBRrANgcBwGdVuO88yA9ft0yzwOyx/tlL7DuneHSzV04EdBclxS9GP8vnHGVAKppBSd/YEHNOBMJSZc82r7aTaAO55hyz+onby/7qM1GWVE6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742198106; c=relaxed/simple;
	bh=kCkc4N+7QhSoIFulEWpB4EZ2H9QujvTV7t+ztLrDXes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RL/dWvDwMAwWDFXKVyF6Kp1rHCU3W6kSzbhP6s0ITs11RfSUf1PL+vaBKByvb68od7868/gBh7o1CC3OEIibUQ6EGsoykdVOWLB2V9vwT6hCxRhwdbo0fqJ+fG8j1jK4MVSw1QvlOCsSnaqKTM9EdqCgj17vaos1WspehhSyZTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5pY73vb; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5pY73vb"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so37439961fa.2
        for <chrome-platform@lists.linux.dev>; Mon, 17 Mar 2025 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742198103; x=1742802903; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PGlkNj5JuQM/oiAzbkxBTyJefdHugxU09PeAiuQE7o=;
        b=X5pY73vbvWyLgrG54X5Y2DbVFRtB0w8oVAStxAv7/InuNK4q/meP4LQzugZBoJ8yMO
         XusqhDmTp6iOA9UUUYVwbRnrCjgJO7N6+Q2gEihpZmRC5cjdEjwrz2QEgCB7j/qtU/uO
         tia2SDxzCDwBx7qWgAxaj3JS+NqhNeFIi3tYmNLs+dWq+Zs57wecIeQwfGBpp/3MxInK
         CVVEXrRAKdlHklCyo75FycDH+o3+6wv7xDAC7E9T3uF26jMerwl+Cn2TLBrzfkAdJUzv
         MhhmHcJ325qIH+MOkAlnRRq0AtNZ31VAaTW1iAEFoOe3Lp2VNfaugx4PFnaqgd8QNdCQ
         SbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742198103; x=1742802903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PGlkNj5JuQM/oiAzbkxBTyJefdHugxU09PeAiuQE7o=;
        b=eHJfo639p4B9p47RNKG29klEy19qBRTbE+XixVHZ5NOkBl57rFKFmqGs2+GKcmaDIL
         OryODa7pHK3Yf+QExJB7+o99ScDDlTYai3QaYgeU5kg1+X+BnQUZt4TGXCWcGQRMWiOG
         SD4p7N/3SVjEzXHOrU8CQASL9tf8YiASKK+Eb1xkB2/kfIEWf7AjVyfA7ceIzJNitCmA
         ZP6doeTD3BSggr4I2VsCwEINWPjTmjOcSgC9X328AP6fxg/889Bow+g9HChC6RLPINLt
         h1vyVwgb23Wj6m6q+6JIaipAXTc/DqnC2XSy/qhBYgjzx0Z6LGvWdWj3ShPSeiOdb8Uz
         A/qA==
X-Forwarded-Encrypted: i=1; AJvYcCXTn1bhJpE9IeBWa2ukLzizcqfCj7tiCRqDhB+xy2f/gBln+GP5JezCjN/AZSPBuyBMcYU2VPYJcK3wUo9BeH0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf/iOFw7NPs15WuaEqPyG38Fg25QYOzXlBK8pUt1j6jKP670pZ
	cDpd0NiExlTGGGGe+LpTAPMEYvPWgtEffOY9eJhcK+1CjyJpAuot
X-Gm-Gg: ASbGncuh6oR6ikf5ebj5XlrC2RlK7VPI4bQkOzctTgRHsDIWlosmG/gZQV8vSOYK3Lm
	jn7hW2AQws9Sa37qVDGRbzL2mOtBJHnH5BBK40FUqgSZRbI8F9qV3MqB85kZ+qHGM2L1TtMH8ud
	tMjNGfBZ2Nq/leMHaKECggmnXJePQ86EThd6SbqitKdzw2ep1IKIZzcEshgsmQ5siU9DwsfZEdS
	R2c0zArvOMss6Knau81QuXywNlk6aFWNY79rtjl/DTBj+dwZNTdnv/nTOBVuD4mWNgSLo54keCZ
	ZZOZYM6aHKEWE8DpA6wwBjJCEbCUCKVDTMBIkzZVt6GpNP/Td8PjdOjhE72trk3PyYlJCr/nVJ6
	r+ZUkPvAdkKeADrD3TCZ7EjyqNg==
X-Google-Smtp-Source: AGHT+IHpSYFJH34gIO7tBqgPtELK+iiAIDW1hiL3+I6Fh1bFLkfP7bnMzxpGii0X1yem28TLEK8LGg==
X-Received: by 2002:a05:6512:6cc:b0:549:7145:5d25 with SMTP id 2adb3069b0e04-549c396e1f1mr5578803e87.34.1742198102726;
        Mon, 17 Mar 2025 00:55:02 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a702asm1234607e87.212.2025.03.17.00.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 00:55:02 -0700 (PDT)
Message-ID: <1a9252ba-d793-4b7e-8fb3-6a35a171c688@gmail.com>
Date: Mon, 17 Mar 2025 09:55:01 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] power: reset: Introduce PSCR Recording Framework
 for Non-Volatile Storage
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-pm@vger.kernel.org, =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
 Guenter Roeck <groeck@chromium.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, chrome-platform@lists.linux.dev
References: <20250314113604.1776201-1-o.rempel@pengutronix.de>
 <20250314113604.1776201-4-o.rempel@pengutronix.de>
 <58e19481-530c-4465-aec5-1f44462eaf5f@gmail.com>
 <Z9Q18k_wu1JQxrtJ@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z9Q18k_wu1JQxrtJ@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/03/2025 15:58, Oleksij Rempel wrote:
> Hi Matti,
> 
> Thanks for your feedback and for taking the time to review this patch series!
> 
> On Fri, Mar 14, 2025 at 02:22:40PM +0200, Matti Vaittinen wrote:
>> Hi deee Ho Oleksij,
>>
>> On 14/03/2025 13:36, Oleksij Rempel wrote:
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
>>>
>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>>
>> I see you're already at v6, so I am probably slightly late... I think I
>> hadn't noticed this before. Thus, feel free to treat my comments as mere
>> suggestions.
>>
>> All in all, I do like this series. Looks mostly very good to me :) Just
>> wondering if we could utilize this same for standardizing reading the reset
>> reason registers which are included in many PMICs?
>>
>>> ---
>>
>> ...
>>
>>> +int pscrr_core_init(const struct pscrr_backend_ops *ops)
>>> +{
>>> +	enum psc_reason stored_val = PSCR_UNKNOWN;
>>> +	int ret;
>>> +
>>> +	mutex_lock(&pscrr_lock);
>>> +
>>> +	if (g_pscrr) {
>>> +		pr_err("PSCRR: Core is already initialized!\n");
>>> +		ret = -EBUSY;
>>> +		goto err_unlock;
>>> +	}
>>> +
>>> +	if (!ops->read_reason || !ops->write_reason) {
>>> +		pr_err("PSCRR: Backend must provide read and write callbacks\n");
>>
>> Why both are required?
>>
>> I can easily envision integrating the some PMIC's 'boot reason' register
>> reading to the PSCRR. Benefit would be that user-space could use this same
>> interface when reading the reset reason on a system where reason is stored
>> using mechanisms provided by this series - and when reset reason is
>> automatically stored by the HW (for example to a PMIC).
>>
>> In a PMIC case the write_reason might not be needed, right?
>   
> I agree that PMICs could be valuable sources of reset reasons, and integrating
> them into PSCRR makes sense. However, this introduces new challenges when
> multiple providers exist on the same system, each reporting different power
> state change reasons.

I see that now. I didn't think of having multiple sources of this 
information at the same time, but I agree it is a valid setup. For 
example an under voltage warning triggering software reset could leave a 
reason in PSCRR non volatile memory, while it wouldn't leave a trace in 
a PMIC. More severe under voltage on same system might trigger the 
hardware shutdown by the PMIC, which would leave the reason in PMIC but 
not necessarily to the non volatile memory (depending on the amount 
backup-energy). So yes, we might need multiple sources to get a good 
picture. Thanks for pointing this out to me.

> Handling Multiple Read-Only Providers (PMIC, Firmware, etc.):
> - If we have multiple sources (e.g., PMIC, firmware logs, NVMEM-based storage),
>    we need to define how to handle conflicting or differing reset reasons.
> - Using priorities may work in simple cases but is unlikely to scale well
>    across different platforms.
> - A more flexible solution would be to expose all read-only providers
>    separately, rather than forcing one to override others.
> 
> Potential UAPI and Sysfs Structure
> - The current sysfs API exposes:
>    - `/sys/kernel/pscrr/reason` → Default recorder
>    - `/sys/kernel/pscrr/reason_boot` → Last stored reason on default recorder
>       from before boot
> - If we introduce read-only providers (like PMICs), we may need a dedicated
>    subdirectory to keep them separate.
> - A possible structure:
>    ```
>    /sys/kernel/pscrr/
>    ├── reason         # Default recorder
>    ├── reason_boot    # Default recorder (before boot)
>    ├── providers/
>    │   ├── pmic0      # Read-only reset reason from PMIC
>    │   ├── firmware   # Reset reason from firmware logs
>    │   ├── another_provider
>    ```
> - This would allow user-space tools to query all available sources while keeping
>    the default recorder behavior intact.
> 
> Next Steps
> - I propose keeping this patch series focused on the default PSCRR recorder.
> - Support for multiple read-only providers should be designed as a future
>    extension, possibly with an expanded sysfs API.

Makes sense. Better to get something ready than keep everything on the 
table. :) Still wonder if we should allow registering read-only 
providers, even if we supported only a single source? But, I am not 
insisting this, just doing a suggestion. Don't want to make "the 
perfect" to be the enemy of good. (Actually, when I think of it, in many 
cases I wouldn't want to even make the "good" to be enemy of "much 
better than nothing").

> Would you agree that this approach keeps things maintainable while allowing
> for future extensibility?

Sure.

> Also, do you have a preference for naming the
> subdirectory (`providers/`, `sources/`, etc.)?

I am bad with naming but both of those would work for me :)

Yours,
	-- Matti

