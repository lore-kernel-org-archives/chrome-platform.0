Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACCB2EEE85
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jul 2026 15:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250954; cv=none; b=pdfeRO6HM8sLSs+gufYB+kY6k/McyfEm5cUbKpM/EAfpynU+Tc7WL9MsRT0CmNvaY+OC2lwJtIhulZMQb7+KQcm/FmjZyofssHTwA1EyIxanT3KaCugqevJPbI9uI/ztz3/GICgOBDZ5p2dLD4nqONVSHLc9xaLiSG8HmOgAZck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250954; c=relaxed/simple;
	bh=/pjWjnvW18ltOYqApap5ErjiNT7bG1O5sPTIqfcoPlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKwM2FN68GFILeiYaOLStdeGnyOfcoUwCp+4SrpAYEUBXwX4oS/UuRxFWT0SxBiaMBUwILtfhyNqM1H7bxAQQseqNFCd8ly8FK/Hl39XCDlxmYWXME0WEwPo0UHhMRORysCzyQz2Ws6sX+cYpDb45cTD/3nox0euThuE9T8jMJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rpPd3xY0; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpPd3xY0"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3811f512167so3754891a91.3
        for <chrome-platform@lists.linux.dev>; Tue, 28 Jul 2026 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785250952; x=1785855752; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUzc+JehiKPLDwYoiSthREnBwc+c90eS4DhkRApL8iE=;
        b=rpPd3xY0slCw4msFkkjV00SChmNcr2CX16ltFf3u4kASgm+0heFl5ex4Ef7+s6fprT
         Spo1cBj+p4zpbjezJ5B36ZQSr2MYn0icyzbMR2ZH7DftdycxMdhX3e9P1qCPXDChcvu/
         rJBGoRx6+GwWgS6A6L7CxZv8s6wntuUj8WeHRnTtOL8Hld55AgM1iMqD4a6WcvEIAChj
         RAeFDdHwiEI8XsYVbJf8Nu80g+D43hKphNefVOHZhdZx6NAAUJRXluh/fNTlOk0odkR0
         21xHZDYt47ByG7UT45xbhlxY9ULijFuZVOJVUWmdGfjZPO7OZsy/NHu8Dj0Rbf2qzkOt
         d8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250952; x=1785855752;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dUzc+JehiKPLDwYoiSthREnBwc+c90eS4DhkRApL8iE=;
        b=Ga+UZvo3fRS5RCEuUeigg6A8Dea1HZw6HjnBzjmrCARRXK0aoJUVGKh+A5iKm8+lPt
         5U/UcRPnYHAbozsZP5IEpXqGSeXyISap3QxJwwskvMr4SdHZJU5S9Y3G1YMTjdZbKgMg
         BcKktVehkHvexafzUU7Niz9BLCl/a4FtpBbzd8+pLCesUESpIj9YLZz3mnhbHdcmNaSO
         ayroWmp784dY/SQgwWKVyn7ZUGfvLk9gGncsxeZzfiwgWiasbJchs1j4WK19S75a1Fo5
         lv0ztdtwVv00YX18d97cosVzz+g8JMn2DAU/9ClOYBXhQwMvKK7DJQOV+GPzQCvl/Afu
         UzbA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2F6/+vUzC0Scp5NtnmcReOYPp9RcDzyF+4UgVWTZCXVR2FRZaaeSlf3GM87MxgCVd+V/q+JjpKtMKtxJ5130=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNczEayFqAdXxj+DEbcWAiMJV0TZ5URSXZCUC8CXdeoFaCHcB0
	Q0OL+1iwT06cobpfE2F3uy4kbZsEKwGZWcw1pz00bulHFyPVpf1zKE7A
X-Gm-Gg: AR+sD11dPO3tylhgMDn5rKnfSuPb2ViESwGLjllioxVHhLexDWsS4XS4cH8Lv+geiJH
	Ew3PtdnrJyxAQNJ5EeL+2quXKHRx5uy4+QQKet4MuoxjTn8fDvTLmNUfnmrNjtJX3PPoCszlmiJ
	noHu7ZRmteDTLw8WCANU18uXfrealiXvulQ6qZMPctu1TeqWwtWFE3gl1eT2UKPW6QYkyEWPTNy
	boRBsOEPGY90qTZ4klR7T0lGiVwfeSJn26wUzsSUzg2VpvMwr7Nim0LlrXCRcMZBW/8EQ6CbaEZ
	X1cHMQW9gaMT/BFbsjtaLHqaGJRknvJt2Fnmvf+fPr5kcWtGSOViw7dorvoLkB4VawmuDNj2Bq2
	yC6mt2ZlLqmxjmjAL12gWcMFDWJ/e1uyB0jYBj8rj3fXDf2MtanO0EAr3evbVAVYGp3UT6WJaNC
	SWKj1T8KvbAd4Wlo4h8lqL4i+uS0YeGjQHTa1OpnldoSG/GcotidgAsZqZrsqHpuacRWVgY4qu
X-Received: by 2002:a17:90b:2782:b0:38e:5717:9cc8 with SMTP id 98e67ed59e1d1-38f6a45d31emr3370435a91.31.1785250950740;
        Tue, 28 Jul 2026 08:02:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm66792348eec.4.2026.07.28.08.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 08:02:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0fbf7f69-bb90-4209-b9d5-258759711496@roeck-us.net>
Date: Tue, 28 Jul 2026 08:02:28 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (cros_ec) Handle temperature conversion
 overflows
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728-cros_ec-hwmon-overflow-v2-1-d24e24d0792b@weissschuh.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260728-cros_ec-hwmon-overflow-v2-1-d24e24d0792b@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/26 03:17, Thomas Weißschuh wrote:
> The calculations converting between the different temperature units can
> overflow on 32-bit systems, resulting in incorrect data.
> 
> Detect these overflows and handle them.
> 
> The code is written in a way that there is a single conversion function
> and the compiler can recognize when overflows are impossible (on 64-bit
> and in cros_ec_hwmon_temp_to_millicelsius()). If the compiler detects
> this, it will optimize away the overflow checks.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Drop already applied patch 1.
> - Also handle overflow of u32 -> long.
> - Clarify commit message wrt compiler optimizations.
> - Use __always_inline over __flatten to allow the compiler to optimize
>    away more unnecessary overflow checks.
> - Link to v1: https://patch.msgid.link/20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net
> ---
>   drivers/hwmon/cros_ec_hwmon.c | 31 ++++++++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 1337b646e022..004a8180b665 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -5,11 +5,13 @@
>    *  Copyright (C) 2024 Thomas Weißschuh <linux@weissschuh.net>
>    */
>   
> +#include <linux/build_bug.h>
>   #include <linux/cleanup.h>
>   #include <linux/device.h>
>   #include <linux/hwmon.h>
>   #include <linux/math.h>
>   #include <linux/module.h>
> +#include <linux/overflow.h>
>   #include <linux/platform_device.h>
>   #include <linux/platform_data/cros_ec_commands.h>
>   #include <linux/platform_data/cros_ec_proto.h>
> @@ -151,14 +153,28 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
>   /* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
>   #define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
>   
> -static long cros_ec_hwmon_kelvin_to_millicelsius(long t)
> +static __always_inline bool cros_ec_hwmon_kelvin_to_millicelsius_overflow(long t, long *ret)
>   {
> -	return t * MILLIDEGREE_PER_DEGREE + CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS;
> +	if (check_mul_overflow(t, MILLIDEGREE_PER_DEGREE, ret))
> +		return true;
> +
> +	if (check_add_overflow(*ret, CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS, ret))
> +		return true;
> +
> +	return false;

	return check_add_overflow(*ret, CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS, ret);
>   }
>   
>   static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)

The maximum value of "temp" is 255.

>   {
> -	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));

255 + 200 = 455.
455 * 1000 = 455000 (not even counting the conversion from kelvin to C).

How could this ever overflow ?

> +	long ret;
> +
> +	if (check_add_overflow(temp, EC_TEMP_SENSOR_OFFSET, &ret))
> +		BUILD_BUG();
> +
> +	if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(ret, &ret))
> +		BUILD_BUG();
> +
> +	return ret;
>   }
>   
>   static bool cros_ec_hwmon_attr_is_temp_threshold(u32 attr)
> @@ -236,8 +252,13 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>   			ret = cros_ec_hwmon_read_temp_threshold(priv->cros_ec, channel,
>   								cros_ec_hwmon_attr_to_thres(attr),
>   								&threshold);
> -			if (ret == 0)
> -				*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);
> +			if (ret == 0) {
> +				if (overflows_type(threshold, long))
> +					*val = LONG_MAX;
> +
> +				if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(threshold, val))
> +					*val = LONG_MAX;
> +			}

I agree with Sashiko - it does not make sense to call cros_ec_hwmon_kelvin_to_millicelsius_overflow()
if it is already known that threshold overflowed.

Personally I think this is way too complicated. An overflowing temperature above 255 degrees C
does not make any sense, and returning LONG_MAX as temperature seems a bit odd.
I would just have checked for some reasonable limit, such as
			if (threshold > 255 + 273)
				*val = 255000;
			else
				*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);

If it does make sense to return LONG_MAX as temperature for some reason, that should
be explained.

Thanks,
Guenter

