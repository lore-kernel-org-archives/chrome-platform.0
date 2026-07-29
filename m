Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7786E3AAF62
	for <chrome-platform@lists.linux.dev>; Wed, 29 Jul 2026 16:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785342383; cv=none; b=aHlNZBX0AO1Es1/lQBB/3jAlUVlB8LGpygwPFdnXqMg5yOCRhQCMAaeuvlriMuHu4c5rSiQWbwpEfooV2+TXgx3YP4kzHkq0Z5eLHslQX+1wQkql/A8QdjR8nndwkS2ctA79dOa/KXjmSx+qkjsnNFo8PNfDDwz/33ZUsHdfwtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785342383; c=relaxed/simple;
	bh=95g2Up5/imKiObVCxkbw85lGqHoF9oj1780LHUtvc2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TebMmRV9LCCEvCjlJTrlfsEJuP/JWtWR3VwrIdWZehSrZ04ym9zgAvvbILLA4tw5UXxGeLlR6WP4cKmhENIyzeSwkm1WW7Gc1ZfxlKWaIrBuhV8So+RprRs/9esxO7UUMXW4CWIU9V8uXSMsJHZWm7/3DzabVYMghQSBQvnfbgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQ4CWXEB; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQ4CWXEB"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1147228a91.3
        for <chrome-platform@lists.linux.dev>; Wed, 29 Jul 2026 09:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785342377; x=1785947177; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0QKfFF6SybzHh4NHRd13vYkPnBaPdyFedjE+mfxuW0=;
        b=ZQ4CWXEBmDqJbE7YIeuHgwOk9RvsAgvjKjl9FZBhwMdjM9i9T3iWaYVsI+0/KzrfPX
         3SHsQ5/teYbo6pfVxh7HUg5v/QHFB3brCtmUXex6L67SmdBzlSjxi08HATplH3AKnYRj
         jPRX0zFneddQQrwQHnfFBSa6MRZAx91d2wHE6eP/JNidZEGRtno0nDo25WOSCGVsF8Aa
         QJQFRVYhGaawNZkgFlBvID3QxhJO6za/ZfUyT3OcvoaP++jFUoaL1uxa7AGYuuQROWpO
         8WAtazZuN09TqF83D89RPERe8H/Sk0d9UusOGDyxaYShFXQN4cGZHqRazeDlKjYq98TU
         i2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342377; x=1785947177;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w0QKfFF6SybzHh4NHRd13vYkPnBaPdyFedjE+mfxuW0=;
        b=JG8iZx6Ynck0f4i8wMgGkEuJPGx9x47hST/8VsN5uF8sg4bNZcZlBe9QBPIOK/ZzY7
         ULS8nK0a29nRvczWeCpa7tVkQcLnhnVvzKIDDFUCZATL/fejIv1N/J2u5YHginyjzxen
         rsNCBMhr9Rw7swagnafDyQSX8NzkfAYLB8lZqbqR9sUtjse8eeJ6BYk0YOUjhro1zZ62
         vSukXaVaDNyI/0Ag6bUfRWLtne8ATtTt2ddty7jNcj1o6oIYG3GsPbh8ILxIFX7DYIdy
         Fz1ZRix1iuFfdDGsK35hfCDhonignKTP3Eo0i5nurdb795BZnHBE6CpxKT9wXf7boQ5H
         FoEw==
X-Forwarded-Encrypted: i=1; AHgh+Rp65nQT5NtlOrrWk1Ixjntz6Ke60vFNNnzUOk6ZxEnhy/InT/iECuG56V+WUG6r0q19BSfS/iE61OiITeJ/9gg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEPzemkcEcgkm/LqLOigUCfSOrsrEPyelVKOZ/oH63Cco4zJSF
	nfxOu4eluQ823o9fzDuqUsOVB1DTpsvWRLvpA6BFuhpeUSWh8SulgcxM
X-Gm-Gg: AR+sD11KhxsFwDnIkaM4m03cZ6k7hwsvTtIQMPrgu9L5me9raBjoB2CcCIZEKPB1Pbi
	7PBAqd+Bay5aMMZ6yUp3WreZrxnlmgy4pGyDM9OConeymaj+ArxV2OTLc34Pp8lLM8GwjsFp97e
	Y/LBdzv2VtrdIeNnRVBKdbM0YrGpylLKcF6xaqr3Ly1LBa0BG0tVhSVdb/OJNvfRMY5yDAS+uWM
	3jbTX0ItxdQ8w3mVb5MkIewgZ6X8IpB51cHCl46R/mJrSImun1SJA3UZjt/j9Aq2UiM7HHM+vyu
	1wCMQIjUQR+kNMphQP/c/h10bppnkxw2PFHBA6+qvbflpSilwyagqhvz8rCbs6/6XILb19AiVzj
	LQULi4Szp6mIPU0TiEGPE9IqCZhV+1Yitx2HrdpY2dQi1sQHlfRy0sm4TH/EqGbiIIrjBzSp/Yo
	aqjakJ8gMnUOBsnzjRs2Rek5Yw6CIv5k+/IhW1gGvGRdifufcpxnuM7T4jcy7wqhXzV8tRSb3an
	l9HWQ1D2zu3t/G7YEJm7vxLgve3i8cJvLxrjA==
X-Received: by 2002:a17:90b:5205:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-38f6a3d599fmr8698559a91.5.1785342372800;
        Wed, 29 Jul 2026 09:26:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72735084sm10770491c88.12.2026.07.29.09.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 09:26:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8cccd303-1af3-4bc6-afda-2ebf33c41958@roeck-us.net>
Date: Wed, 29 Jul 2026 09:26:11 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (cros_ec) Handle temperature conversion
 overflows
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260728-cros_ec-hwmon-overflow-v2-1-d24e24d0792b@weissschuh.net>
 <0fbf7f69-bb90-4209-b9d5-258759711496@roeck-us.net>
 <63f9c782-3e4e-468e-a31f-901d1e2ff40b@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <63f9c782-3e4e-468e-a31f-901d1e2ff40b@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/29/26 08:40, Thomas Weißschuh wrote:
> On 2026-07-28 08:02:28-0700, Guenter Roeck wrote:
>> On 7/28/26 03:17, Thomas Weißschuh wrote:
>>> The calculations converting between the different temperature units can
>>> overflow on 32-bit systems, resulting in incorrect data.
>>>
>>> Detect these overflows and handle them.
>>>
>>> The code is written in a way that there is a single conversion function
>>> and the compiler can recognize when overflows are impossible (on 64-bit
>>> and in cros_ec_hwmon_temp_to_millicelsius()). If the compiler detects
>>> this, it will optimize away the overflow checks.
>>>
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>> ---
>>> Changes in v2:
>>> - Drop already applied patch 1.
>>> - Also handle overflow of u32 -> long.
>>> - Clarify commit message wrt compiler optimizations.
>>> - Use __always_inline over __flatten to allow the compiler to optimize
>>>     away more unnecessary overflow checks.
>>> - Link to v1: https://patch.msgid.link/20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net
>>> ---
>>>    drivers/hwmon/cros_ec_hwmon.c | 31 ++++++++++++++++++++++++++-----
>>>    1 file changed, 26 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
>>> index 1337b646e022..004a8180b665 100644
>>> --- a/drivers/hwmon/cros_ec_hwmon.c
>>> +++ b/drivers/hwmon/cros_ec_hwmon.c
>>> @@ -5,11 +5,13 @@
>>>     *  Copyright (C) 2024 Thomas Weißschuh <linux@weissschuh.net>
>>>     */
>>> +#include <linux/build_bug.h>
>>>    #include <linux/cleanup.h>
>>>    #include <linux/device.h>
>>>    #include <linux/hwmon.h>
>>>    #include <linux/math.h>
>>>    #include <linux/module.h>
>>> +#include <linux/overflow.h>
>>>    #include <linux/platform_device.h>
>>>    #include <linux/platform_data/cros_ec_commands.h>
>>>    #include <linux/platform_data/cros_ec_proto.h>
>>> @@ -151,14 +153,28 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
>>>    /* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
>>>    #define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
>>> -static long cros_ec_hwmon_kelvin_to_millicelsius(long t)
>>> +static __always_inline bool cros_ec_hwmon_kelvin_to_millicelsius_overflow(long t, long *ret)
>>>    {
>>> -	return t * MILLIDEGREE_PER_DEGREE + CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS;
>>> +	if (check_mul_overflow(t, MILLIDEGREE_PER_DEGREE, ret))
>>> +		return true;
>>> +
>>> +	if (check_add_overflow(*ret, CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS, ret))
>>> +		return true;
>>> +
>>> +	return false;
>>
>> 	return check_add_overflow(*ret, CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS, ret);
>>>    }
>>>    static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
>>
>> The maximum value of "temp" is 255.
>>
>>>    {
>>> -	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
>>
>> 255 + 200 = 455.
>> 455 * 1000 = 455000 (not even counting the conversion from kelvin to C).
>>
>> How could this ever overflow ?
> 
> It will never overflow. And the compiler knows this and optimizes away
> all the overflow checks. Otherwise the build would straight up fail to
> the BUILD_BUG()s below.
> 
> The idea was that not everyone reading this code needs to do the
> calculations and double-check.
> 

No, sorry. You accomplished the opposite: You made me re-check the calculations
because it was obvious to me that there can be no overflow. So you wasted
my time. I am absolutely opposed to unnecessary checks, even if they are compiled
away.

Guenter

