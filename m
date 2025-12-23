Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C519D2EB5A9
	for <chrome-platform@lists.linux.dev>; Tue, 23 Dec 2025 17:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766510608; cv=none; b=ZAdeMYJVl5j3MGYtE5eCeWDBU96ghyZaPk9Aqr2VfJIQ0yvLtDUt2HegL5gFDWN6mNt53scYY7zXFOGzS4d6cLweDUxyVwDph+8oubvfsX1vu6APJxX6ePkSiy24MVxCXQOXEsH7tYnRbEU+l4whzG8RYX7JNXN47v3vzX4uXMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766510608; c=relaxed/simple;
	bh=sUecvfF8Cm+RDTkmMhY0GrrV5SoBCyMriYZBdj4xepw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+P2tzTLQMIpg7q34d0GQlOQLpaS0lFSdwo5ENe5Ay2TocyUb8nQyTQJAsHrE+hmvuLk2QRkkSRBetlVrnBVqJ2EG+/SguFOr9WaQqFsWYYUH2kh+kGsWriQ0rmIOReUwHAO86Kfl/vgOW/s0ljWYNksSniKS3Q8FDGUem1A/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0PMAo2GB; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0PMAo2GB"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3f0c93ecf42so4012548fac.0
        for <chrome-platform@lists.linux.dev>; Tue, 23 Dec 2025 09:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766510606; x=1767115406; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TzGkwjiXlIuI2e0ZltEyYghW6SSYBvcawlzgy/fyiHc=;
        b=0PMAo2GBdSQpZMj3wPqZdeExVlKWALYu6DtA7ahbEb6pBm4MObGX8hHEp1GKwz/E+C
         LJd4GByQUYS/H3EvZ4+Ed+l8Z189c7ENWhydp89wZLP9jEKdTvyAXqFhJz1xbGCDWEEH
         tMpokeTrMhcwL2MY0JzW1iV2cXDSWe7ASOxsNQKYlmL728DDFMoGVNghrLaYC6ki3m4m
         x3BwAuCC2UyLrTG9kHCkhhZzZHWvEDDpB5iZpXv7Z5AIbNY0f1JnmPN7rQH8/BwTl7V6
         4hD/QLqgojLA2c4rgjg/bheTVbHDmMwPX6c9oNKKxb9pGxEQTA4ZqRud7Z6ttBOcVZFy
         uxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766510606; x=1767115406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzGkwjiXlIuI2e0ZltEyYghW6SSYBvcawlzgy/fyiHc=;
        b=NPrJmN+tUhLbXAog4soe2PseFAB/iPIFbltoyi5gYtwG0hAEa5sCQSLOdL8xco19q6
         SEJb+b4WxHVCqp1Kn0rkp3vEsAAdifuAGtSJ09ofF4LWpHJaHxXggb32Ocm+etmYr2eh
         VhKDetAaSY2X9/7vGuEuzfV8Uu1000OIu8Sl8Jm5hy3B/F2jO7HpaaJ+Zl2NV+V2LzK5
         LO3WDtmrv90WpcCuoaqi2GNVcgdcvSZAt4T5HmXWFXwdqLCTlvvoOP3Q3uUeULewvu4O
         LfvS4dw6HZx/VmiVuekeu3VqRr+HVTYpfQM4dqGm1wTAQWIGRCMojjx0JXehJtsYQ6cr
         Z6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAsckZYfH+GBSAFBYyDVgdXDK2aciPWj5NEnByrrYAp2URcKYdQJ/DMDaLa1P/F46ppgN4KBBt8J06gKqfuqw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeaHpuCE0gYkItgmLoZiN7QJu7P8TN9JuvXmYZHW/G5147VIPv
	R6/RuPzR1swZDsgOZ1iN42i1vzicA2B3rIMmWOILYbbuO6R2uuv3kJtCqvUdKL8uPMcn9i4Sfnt
	1eoWq
X-Gm-Gg: AY/fxX7Tqpr1pYO779DjWwzCR/xkNait15mloJJcMQam8zKKfPqYDLrVwlLPQlKePVj
	IK8ITVFVW4TimCjH/fDVCi13hy9pzx6RESBvkHepC+5ppLiEr7IGe7gyJC+w0wmzp5aADKgdtAS
	zSGduhIeuLyHn473uywSYetbmtQYKfqHjJP5e6fqyaBL/TGKCtBeT60kI0m1Qp5DfYfeVGdll8J
	XNed6WdAlEfihmqNUH7oexeTRsWip20I4JOO97ZrF159qBTqfFz3rh9xgjnkCa+9qv/cWbNsNtf
	tODzt6Cull9I1hwNUiQg98xpx7b8UCA0VInxQqjx5bRv0b1tEJFlEf+c8PwYuPfMRMIq0OdMPD/
	aGOqB2nJ+N7xIdYw8uVaE/9/r+dztAtMk5YRJUItR1QLqJEBEsvAFUp8gNIMrbn7dVQSC6XrGqw
	a90e7wiEoOizb/r5H5evHDz+KT9VGTACdtFwDVtRMQzisfV42GkJfJPg47PYk7
X-Google-Smtp-Source: AGHT+IF6eNAmKWUZLe2B5K3E7g3i1rg1hxCty9Nbyk5DlxGfbQw0sm3r0j1+ICUtiDqdkuvUNTE5SA==
X-Received: by 2002:a05:6820:4989:b0:65c:f869:1343 with SMTP id 006d021491bc7-65d0e1eefb8mr3656806eaf.11.1766510605628;
        Tue, 23 Dec 2025 09:23:25 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:fe29:88f1:f763:378b? ([2600:8803:e7e4:500:fe29:88f1:f763:378b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65d0f69ae7esm8989800eaf.9.2025.12.23.09.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:23:25 -0800 (PST)
Message-ID: <f5ef483b-12d8-4ed2-9637-af993c3f8b7d@baylibre.com>
Date: Tue, 23 Dec 2025 11:23:24 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] iio: core: Add cleanup.h support for
 iio_device_claim_*()
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
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
 <20251211-lock-impr-v2-4-6fb47bdaaf24@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251211-lock-impr-v2-4-6fb47bdaaf24@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/25 8:45 PM, Kurt Borja wrote:
> Add guard classes for iio_device_claim_*() conditional locks. This will
> aid drivers write safer and cleaner code when dealing with some common
> patterns.
> 


> These classes are not meant to be used directly by drivers (hence the
> __priv__ prefix). Instead, documented wrapper macros are provided to
> enforce the use of ACQUIRE() or guard() semantics and avoid the
> problematic scoped guard.

Would be useful to repeat this in a comment in the code.

> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  include/linux/iio/iio.h | 83 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index f8a7ef709210..c84853c7a37f 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -10,6 +10,7 @@
>  #include <linux/align.h>
>  #include <linux/device.h>
>  #include <linux/cdev.h>
> +#include <linux/cleanup.h>
>  #include <linux/compiler_types.h>
>  #include <linux/minmax.h>
>  #include <linux/slab.h>
> @@ -739,6 +740,88 @@ static inline void iio_device_release_buffer_mode(struct iio_dev *indio_dev)
>  	__iio_dev_mode_unlock(indio_dev);
>  }
>  
> +DEFINE_GUARD(__priv__iio_dev_mode_lock, struct iio_dev *,
> +	     __iio_dev_mode_lock(_T), __iio_dev_mode_unlock(_T));
> +DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_buffer,
> +		  iio_device_claim_buffer_mode(_T));
> +DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_direct,
> +		  iio_device_claim_direct(_T));
> +
> +/**
> + * IIO_DEV_ACQUIRE_DIRECT_MODE(_dev, _var) - Tries to acquire the direct mode
> + *                                           lock with automatic release
> + * @_dev: IIO device instance
> + * @_var: Dummy variable identifier to store acquire result

It's not a dummy if it does something. :-) (so we can drop that word)

Also, I would call it _claim instead of _var to to match the example
and encourage people to use the same name everywhere.

And for that matter, we don't really need the leading underscores in either
parameter since there are no name conflicts.

> + *
> + * Tries to acquire the direct mode lock with cleanup ACQUIRE() semantics and
> + * automatically releases it at the end of the scope. It most be always paired
> + * with IIO_DEV_ACQUIRE_ERR(), for example::
> + *
> + *	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> + *	if (IIO_DEV_ACQUIRE_ERR(&claim))
> + *		return -EBUSY;
> + *
> + * ...or a more common scenario (notice scope the braces)::
> + *
> + *	switch() {
> + *	case IIO_CHAN_INFO_RAW: {
> + *		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> + *		if (IIO_DEV_ACQUIRE_ERR(&claim))
> + *			return -EBUSY;
> + *
> + *		...
> + *	}
> + *	case IIO_CHAN_INFO_SCALE:
> + *		...
> + *	...
> + *	}
> + *
> + * Context: Can sleep
> + */
> +#define IIO_DEV_ACQUIRE_DIRECT_MODE(_dev, _var) \
> +	ACQUIRE(__priv__iio_dev_mode_lock_try_direct, _var)(_dev)
> +
> +/**
> + * IIO_DEV_ACQUIRE_BUFFER_MODE(_dev, _var) - Tries to acquire the buffer mode
> + *                                           lock with automatic release
> + * @_dev: IIO device instance
> + * @_var: Dummy variable identifier to store acquire result
> + *
> + * Tries to acquire the direct mode lock and automatically releases it at the
> + * end of the scope. It most be paired with IIO_DEV_ACQUIRE_ERR(), for example::
> + *
> + *	IIO_DEV_ACQUIRE_BUFFER_MODE(indio_dev, claim);
> + *	if (IIO_DEV_ACQUIRE_ERR(&claim))
> + *		return IRQ_HANDLED;
> + *
> + * Context: Can sleep
> + */
> +#define IIO_DEV_ACQUIRE_BUFFER_MODE(_dev, _var) \
> +	ACQUIRE(__priv__iio_dev_mode_lock_try_buffer, _var)(_dev)
> +
> +/**
> + * IIO_DEV_ACQUIRE_ERR() - ACQUIRE_ERR() wrapper
> + * @_var: Dummy variable passed to IIO_DEV_ACQUIRE_*_MODE()
> + *
> + * Return: true on success, false on error

This could be clarified more. Based on the example, this sounds
backwards.

	Returns: true if acquiring the mode failed, otherwise false.

> + */
> +#define IIO_DEV_ACQUIRE_ERR(_var_ptr) \
> +	ACQUIRE_ERR(__priv__iio_dev_mode_lock_try_buffer, _var_ptr)

There is no error code here, so calling it "ERR" seems wrong.
Maybe IIO_DEV_ACQUIRE_FAILED()?

> +
> +/**
> + * IIO_DEV_GUARD_ANY_MODE - Acquires the mode lock with automatic release
> + * @_dev: IIO device instance

It would be helpful to explain more about the use case here and that this
is used rarely.

The point to get across is that it is used when we need to do something
that doesn't depend on the current mode, but would be affected by a mode
switch. So it guards against changing the mode without caring what the
current mode is. If it is in buffer mode, it stays in buffer mode, otherwise
direct mode is claimed.

> + *
> + * Acquires the mode lock with cleanup guard() semantics. It is usually paired
> + * with iio_buffer_enabled().
> + *
> + * This should *not* be used to protect internal driver state and it's use in
> + * general is *strongly* discouraged. Use any of the IIO_DEV_ACQUIRE_*_MODE()
> + * variants.

Might as well add Context: here like the others.

> + */
> +#define IIO_DEV_GUARD_ANY_MODE(_dev) \

Accordingly, I would be inclined to call it IIO_DEV_GUARD_CURRENT_MODE()

> +	guard(__priv__iio_dev_mode_lock)(_dev)
> +
>  extern const struct bus_type iio_bus_type;
>  
>  /**
> 

