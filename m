Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635AE188938
	for <chrome-platform@lists.linux.dev>; Tue, 18 Feb 2025 06:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739861128; cv=none; b=DVWc5WoHqvSBbVC6eGEMRpm8hyvB9YJpKCTAP+AbpCeTeytlx+6LT5LTI24hhNUxrG9tgG1KEI1buJEIDyg7Fy349U3ePau2wKDalp5OoxryeFahrswHxuGxfLMGZ2DZF7wQli9NhI66FlP4FoKoOuupx+JMxApfIYj+6EdmjRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739861128; c=relaxed/simple;
	bh=JeV9NGTiS5LreF1qALXiBXoNIsC31R6+99vMmtp8aGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctcoQrRl1Z9JB1xuAhCy8Nxa6g9eFogbQbd0KbL8FMVIs+1f+pkkXU8vlGIvllGQLcuyn5kzXtOBKjJVJ2Y3igVqA6OnOQ/JPdyyVHZn8Hsd2bkVsttS0a1+Ka+fFSLVEve0Ogz6il9GTfKjCBhE0ldQo146qr8pQvHEb31ppa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kc59JcJx; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kc59JcJx"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5454f00fc8dso2248719e87.0
        for <chrome-platform@lists.linux.dev>; Mon, 17 Feb 2025 22:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739861124; x=1740465924; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SqQUy+TmHlIe2lGS+cxMn2E4zLJa5hzyQ87XCzDVJCw=;
        b=Kc59JcJxmbfHErltoVdRC9YgrTFATV6bFX1oiS4xv/S1EOcc9wSixhuK8ogGIZ56ov
         EX7ImVdrSr0F2siUchkNdTpLcjFvaYpIXwqmURxGftXWuMrryI0QChh+0EthtOAfiFmj
         C/CnHWN7OYDbGimod5299Uo3iNoeHoOgSeGiZ33gNISTPWvshayFBmEmw4yjelwOgZzp
         PyNnYMbsq5tZtbVNUCkGGbA1tc+l9Vl1HZXyqPVH9VhZ6dFtg4HKCN7IU7gFykbwVbwk
         7Kz+/ovzzCu6jtCmm06mGwVxxWyA+gF1ILl6VyobeU9RUqt+lG8DcnfhzpaVsMCE3y1M
         1JFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739861124; x=1740465924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqQUy+TmHlIe2lGS+cxMn2E4zLJa5hzyQ87XCzDVJCw=;
        b=SDw+0L25Kcso+NN54eIUnP6kcsC1vX2bhLBSOrToMa/MKq2ydO+9KQxF2QUMjqUN7T
         ktWTD6U5EtJOlR3PtBcyBtwDqZeumdeo8ac+WlAW1ALfM6nqiBPETetoTDXEz7w1Famx
         iiE88VQ7tHEwgUhrk45/qcWJSFGBeHDtuxCU7GYwG9HvX/JnimBzOzJ2l1bGa6braz/q
         Dhssj1150prCGrxGKlzv1VSNn/Mf9Thy8AWSDMieyUyDW7B4+us9AY9AJHcwPAhJ+K0O
         f4S4KJK8tl7iayb3FtwaHP+zewPoKnkBFDNeN691sQes+J6plwWLrq1+8EJ+B/bFu1dm
         HeqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRI3cUS5sozDr3vlb1IDUOfgzywn33QWEwFyFtGL+1CcY3DYgHgneXac7gALnJETDugk5vKltlbufNO/w+d1U=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbBHQpysqTI+Jj7EomKZUM1ZXe9o7+81WpKPBWc1o7bDAKDwer
	yFk8qtzRz+nKO34MFSnsmDDwFFes/VTaqlS6jt+E996u6d09OK/n
X-Gm-Gg: ASbGncvl5qVSBJn1Wi1NKRX2dR3bAD6+2vdUNGSrcUD4naXk8y3oi37r0Kqn4Qq/t7c
	oDEyFnm6JozCQt++xNDRruE7l/wUXHSYa5KRv6LGRcn6QOGtWZjmMJYmrcMcGSdhZtQqFS/cwVm
	m8cf8RPQJMhk8VEhasSMRM+jVsks6P31cN8dTaDaN1J2hQ+N4+NofqXXk6JJvdX34k0Rs8Z5KMF
	gTWUXPnZaRk/pSJYZpPBTMzuLIo4jRRDeu94PC+KkEQNqz1aTVOvtiMPMCseB1/ER3o5h2e6z4e
	FjnW7W/1mBSU3HOdf5O0DyNxVQVldLJLKQ5uzGAhDZ/GF4QB+hJ/JSCTZ/iG23UcaW2WL0S0
X-Google-Smtp-Source: AGHT+IEj3If62LMKd4zu2mxufSyaNBZmRoYKgPnZLeAis7jJXTrJ3g3nqNEZsiWpXSyAKIM7D7Y5BQ==
X-Received: by 2002:a05:6512:3ba9:b0:545:2cf5:dc6c with SMTP id 2adb3069b0e04-5452fe8ff00mr3726297e87.51.1739861124087;
        Mon, 17 Feb 2025 22:45:24 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452de0b2f7sm1330302e87.97.2025.02.17.22.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 22:45:23 -0800 (PST)
Message-ID: <48b3e732-b60d-411c-a519-5e89f87eea7d@gmail.com>
Date: Tue, 18 Feb 2025 08:45:22 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] reboot: reboot, not shutdown, on
 hw_protection_reboot timeout
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Fabio Estevam
 <festevam@denx.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Serge Hallyn <serge@hallyn.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 kernel@pengutronix.de
References: <20250113-hw_protection-reboot-v2-0-161d3fc734f0@pengutronix.de>
 <20250113-hw_protection-reboot-v2-2-161d3fc734f0@pengutronix.de>
 <7b6d3226-4422-415a-9146-16c421463ac5@gmail.com>
 <de781a07-d209-4bbe-8945-efcb4490f604@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <de781a07-d209-4bbe-8945-efcb4490f604@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/02/2025 22:22, Ahmad Fatoum wrote:
> Hello Matti,
> 
> On 22.01.25 12:28, Matti Vaittinen wrote:
>> On 13/01/2025 18:25, Ahmad Fatoum wrote:
>>> hw_protection_shutdown() will kick off an orderly shutdown and if that
>>> takes longer than a configurable amount of time, an emergency shutdown
>>> will occur.
>>>
>>> Recently, hw_protection_reboot() was added for those systems that don't
>>> implement a proper shutdown and are better served by rebooting and
>>> having the boot firmware worry about doing something about the critical
>>> condition.
>>>
>>> On timeout of the orderly reboot of hw_protection_reboot(), the system
>>> would go into shutdown, instead of reboot. This is not a good idea, as
>>> going into shutdown was explicitly not asked for.
>>>
>>> Fix this by always doing an emergency reboot if hw_protection_reboot()
>>> is called and the orderly reboot takes too long.
>>>
>>> Fixes: 79fa723ba84c ("reboot: Introduce thermal_zone_device_critical_reboot()")
>>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>> ---
>>>    kernel/reboot.c | 70 ++++++++++++++++++++++++++++++++++++++++-----------------
>>>    1 file changed, 49 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/kernel/reboot.c b/kernel/reboot.c
>>> index 847ac5d17a659981c6765699eac323f5e87f48c1..222b63dfd31020d0e2bc1b1402dbfa82adc71990 100644
>>> --- a/kernel/reboot.c
>>> +++ b/kernel/reboot.c
>>> @@ -932,48 +932,76 @@ void orderly_reboot(void)
>>>    }
>>>    EXPORT_SYMBOL_GPL(orderly_reboot);
>>>    +static const char *hw_protection_action_str(enum hw_protection_action action)
>>> +{
>>> +    switch (action) {
>>> +    case HWPROT_ACT_SHUTDOWN:
>>> +        return "shutdown";
>>> +    case HWPROT_ACT_REBOOT:
>>> +        return "reboot";
>>> +    default:
>>> +        return "undefined";
>>> +    }
>>> +}
>>> +
>>> +static enum hw_protection_action hw_failure_emergency_action;
>>
>> nit: Do we have a (theoretical) possibility that two emergency restarts get scheduled with different actions? Should the action be allocated (maybe not) for each caller, or should there be a check if an operation with conflicting action is already scheduled?
>>
>> If this was already considered and thought it is not an issue:
>>
>> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> __hw_protection_trigger (née __hw_protection_shutdown) has this at its start:
> 
>   static atomic_t allow_proceed = ATOMIC_INIT(1);
> 
>   /* Shutdown should be initiated only once. */
>   if (!atomic_dec_and_test(&allow_proceed))
>           return;
> 
> It's thus not possible to have a later emergency restart race against the first.
> 

Ah, indeed. I missed this. Thanks for the clarification! :)

Yours,
	-- Matti
