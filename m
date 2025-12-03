Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8F52DF714
	for <chrome-platform@lists.linux.dev>; Wed,  3 Dec 2025 22:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764801663; cv=none; b=Y6e/U4v6srXHfMKb5TPAGmxsi2BgXBZA649jj68kwWkRhWHGqyc8cVV+ckDc77nbn/eCG7d7n39dc698LDB0GgY7XEx/eQmqsDNhvPpFRaprb/DYN5bSlsx3NRNyjM6+nW9ax5HEmfvvWlBw0AFwY4sLklxjjqPFqWo/036lyjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764801663; c=relaxed/simple;
	bh=SUQIyZJZp+O7Vp//jfjuuVMp8y8KVbrJbuI0BpFAPZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJVkmFADsPFw2tJt8PDRYhajPAmNhZWPvVOYS4KGLsQlbo/YJ7/lZ14YV0w3vcnX8CYNSclfiTP3aR5abav0YQa5UqwToyuUV7iHC7mH6Sv4YNolDRmtcZBetwHqW4lHGV6KBFM8G/79n/ss8T2PHoR0HCAI+SzzHrLXMAF7FgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oMB1NMUg; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oMB1NMUg"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7c6e815310aso219288a34.0
        for <chrome-platform@lists.linux.dev>; Wed, 03 Dec 2025 14:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764801661; x=1765406461; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fae2T8A00LxuEcnVsoAj9zMjZYXT6dEfKw1jD+A44wY=;
        b=oMB1NMUgUr5I1NE9A0eNDINyoqE4euQE801FcGSb6L9GTGNmuPl5g3vE1UkeXi0IYJ
         JFzbFgG5zrUOEpN911ncv7R0f1b8FdkApd89trg4BaTHME2+ghYOcj2muppLOfafbYPk
         1MX+0nc0Z3xUQvRzA1JNEZdIiIQctaFhxjrhJEQG6c3nE57lJKq2+mf7RJpEJQco2VLn
         wht04+xSoQR+p2LJNROSiUusp4p1gnqixZEzs8UqJEUF4OIZaGXDP0LrwgO0f+LzF2U3
         IFySiVJkSSy2SK2ak+jrSi8Z4dtYkLeYdgSrSowVjwuFHaFMF037rtqXRwOFHYItJ0RK
         N13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764801661; x=1765406461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fae2T8A00LxuEcnVsoAj9zMjZYXT6dEfKw1jD+A44wY=;
        b=F/G0sm4KlMGfhCHjIHFqzzSOL9/58VSxY4zSfQUVtpVPdrZCKyf9xqjOTbr1ibMk31
         hrWFAMxWclcLA25KGTDJn6Da4XJwR0AWIyht+ud01bn/xxt8xLxsf6Z6qhxcXgZtADpa
         zl7JOlcyiyI6iHxXCNBFHJaUh4Iwe4zo5LG2BtjrpDQAX9+bT5vZ6KHmzpoKS2rqFEzV
         ZcEShv6OP2lNzTUKsi1jB8qYLDsf6H1jThA7oEiTt4FXwfNrvU9bVkcV19mxr/JQFMPM
         gpmHtS1iQ11KFuzHWcpU4r1wMGzkgDo8DK84qxjRyO7NnwI8vPNvKpPN9OcJ0YpbYi/H
         Dwow==
X-Forwarded-Encrypted: i=1; AJvYcCV8d6hpdlJESnWHaglhTvmsgoEDr4EzzmrDqvKQFqHhvNnt/CDWgm5oEaN5wHiecE2/vxX/zTWqD8EvtgF55uQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcpDrY/YzOfaaYfwI1dcKUmqH1jqVnLXhmLNB/AY88JoNjlbsC
	qjB80oMyBOOVKgG0s9+qMF4ba9LuIwpwB674GvLrki+7i3t5G61Z6H6DCtemgRUeois=
X-Gm-Gg: ASbGncsA2k1eZ8Vty7NcWi4vy3FM75nARuvLCxmHbdW9ThhqqrqZMNwu0G9YksytaFH
	WvqYmgSc2N29di3IjxvWmRpqjcKv42UDa3dF19lzmgg65TGHe/CK0e+GruTRdSP78DO1kKtnAgB
	l1FKjLsGr2RSHkSbYwxZpLsyo/bx4v56SL8PMiqAhL3fF1JMZWEmlRARO/z61ASYrdTeQH7GDRJ
	z/9c8XJWbz29wx/Kzyz8az/M1lCOfgxPAQ+6MP9GrHiIgG+94e9lK7e/woLIhURG7XZoAp4J7aw
	FfH5ZSmNdpWmqNzO5reCGh0+f4tZzOd90NU7k+hC2WiTJhWHYre5Je3lfiAXwCC+GOzg4zoN1Uv
	z8b0+Ykj3L9VU65JsIhd6npOrkB7OHpWidmin29bhsHP9KolUPOoR/ZegUEhvumRAt04SVOAeXN
	R+vlfJxT0ElLPAbIe44Q==
X-Google-Smtp-Source: AGHT+IE8ahaPipDh8W8AoMJnvq7L+yJGEo+dv7+OKVdTyAgpgP0LgOtF5++RGJ1xwcQ5dHaHz4vquw==
X-Received: by 2002:a05:6830:410e:b0:7c7:568d:cba with SMTP id 46e09a7af769-7c94d8c65cfmr2925018a34.0.1764801660974;
        Wed, 03 Dec 2025 14:41:00 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:25f4:78dc:7b9e:e7a4? ([2600:8803:e7e4:500:25f4:78dc:7b9e:e7a4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95acdb599sm1821a34.28.2025.12.03.14.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 14:41:00 -0800 (PST)
Message-ID: <e1048329-83d7-4947-a57f-afdf75fb1e1f@baylibre.com>
Date: Wed, 3 Dec 2025 16:40:58 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] iio: light: opt4060: Use cleanup.h for IIO locks
To: Kurt Borja <kuurtb@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Shrikant Raskar <raskar.shree97@gmail.com>,
 Per-Daniel Olsson <perdaniel.olsson@axis.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-6-b4a1fd639423@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251203-lock-impr-v1-6-b4a1fd639423@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/3/25 1:18 PM, Kurt Borja wrote:
> Simplify and drop "hacky" busy-waiting code in
> opt4060_set_driver_state() by using guard().
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/iio/light/opt4060.c | 52 +++++++++++++++------------------------------
>  1 file changed, 17 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
> index 500899d7bd62..903963606143 100644
> --- a/drivers/iio/light/opt4060.c
> +++ b/drivers/iio/light/opt4060.c
> @@ -22,6 +22,7 @@
>  #include <linux/iio/trigger.h>
>  #include <linux/iio/trigger_consumer.h>
>  #include <linux/iio/triggered_buffer.h>
> +#include <linux/cleanup.h>
>  
>  /* OPT4060 register set */
>  #define OPT4060_RED_MSB				0x00
> @@ -302,41 +303,22 @@ static int opt4060_set_driver_state(struct iio_dev *indio_dev,
>  				    bool continuous_irq)
>  {
>  	struct opt4060_chip *chip = iio_priv(indio_dev);
> -	int ret = 0;
> -any_mode_retry:
> -	if (!iio_device_claim_buffer(indio_dev)) {
> -		/*
> -		 * This one is a *bit* hacky. If we cannot claim buffer mode,
> -		 * then try direct mode so that we make sure things cannot
> -		 * concurrently change. And we just keep trying until we get one
> -		 * of the modes...
> -		 */
> -		if (!iio_device_claim_direct(indio_dev))
> -			goto any_mode_retry;
> -		/*
> -		 * This path means that we managed to claim direct mode. In
> -		 * this case the buffer isn't enabled and it's okay to leave
> -		 * continuous mode for sampling and/or irq.
> -		 */
> -		ret = opt4060_set_state_common(chip, continuous_sampling,
> -					       continuous_irq);
> -		iio_device_release_direct(indio_dev);
> -		return ret;
> -	} else {
> -		/*
> -		 * This path means that we managed to claim buffer mode. In
> -		 * this case the buffer is enabled and irq and sampling must go
> -		 * to or remain continuous, but only if the trigger is from this
> -		 * device.
> -		 */
> -		if (!iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
> -			ret = opt4060_set_state_common(chip, true, true);
> -		else
> -			ret = opt4060_set_state_common(chip, continuous_sampling,
> -						       continuous_irq);
> -		iio_device_release_buffer(indio_dev);
> -	}
> -	return ret;
> +
> +	guard(iio_device_claim)(indio_dev);
> +
> +	/*
> +	 * If we manage to claim buffer mode and we are using our own trigger,
> +	 * IRQ and sampling must go to or remain continuous.
> +	 */
> +	if (iio_buffer_enabled(indio_dev) && iio_trigger_using_own(indio_dev))

The commit message does not explain why this was changed from
iio_trigger_validate_own_device() to iio_trigger_using_own(). I'm guessing
that is why we also dropped the `!`?

> +		return opt4060_set_state_common(chip, true, true);
> +
> +	/*
> +	 * This path means that we managed to claim direct mode. In this case
> +	 * the buffer isn't enabled and it's okay to leave continuous mode for
> +	 * sampling and/or irq.
> +	 */
> +	return opt4060_set_state_common(chip, continuous_sampling, continuous_irq);
>  }
>  
>  /*
> 

