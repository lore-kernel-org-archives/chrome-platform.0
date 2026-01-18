Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28EE1FF1B5
	for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 19:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768764944; cv=none; b=pAOXj9Q8fEnBV7B7ArvZO6mSFNPhwLxdOwN4L/u1AyOqy7n3rz3NKLN7dwHVTeO2Ul22u0pZrMejgfGzpjl/5JO4ZlhGqhphg0tDXG0hlqLxLZfbd7WYy5x3GafW6bWq2sD7htJ8Jbezt7O3wDG/10LBSsg+O5GhK1KfptK9Gd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768764944; c=relaxed/simple;
	bh=ZrkbSSR7SPbk0sXpHbnHk+xR9V/NadYrGwGl0W6n57s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=il4WlCYw9je7xdVb+TZHYCEyVWM8e/Eu6d3IeiKqCR+qlisNQhoXZTAefSYj85QHLFGNBfFoUc/YK5QObAzqeHMbb3ZtcmjaOavCijJ/8eZ86ym8fZIZzjimYm21U6Ny8nCf6XeAbsSdF2PaHYeKVBJlvxvQfn9Ou0FXKn5rdNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sg1ypL2b; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sg1ypL2b"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-45c7f550f46so2244660b6e.3
        for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 11:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768764942; x=1769369742; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Js92nL0F9mZGARPs875T0z11qnkMg6IzGWXmj5+ZqzY=;
        b=sg1ypL2b4CHR0baqAgYo1DB6DaaNSf7tf4IlZ1owHvVtoj3rLq5OzEV6utkeQBP0wJ
         SPiZk4E0ElF+cGysTyWVOAqR4cP+mVqOWNU2cmtEZ5lTBEnlYxJUGcw7djgUvwxB7o6Z
         Ow2tsKZdCLgKPk7qUgAW8Gh+/yLAjOPMAsA6rFwNNCpG8hbx6RJR3FPmNJIpS+0JJXge
         9k7821ThpA4cjpe95HiryXXzLNz0J1OOHzXi/NDPq5CkXRrVjC5CMOljyBrW7ClEvENF
         wwkFESBJdQ1BgYLQEcWNSjGclZrpHOPAI7juSKk/X2MM8rrsy/Z/PviyAp4iFXfg/+Te
         ejYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768764942; x=1769369742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js92nL0F9mZGARPs875T0z11qnkMg6IzGWXmj5+ZqzY=;
        b=n+ufX683oOQ+hZB+/Fms8zjFp+bMUhIg+GDs3Ofm+9yFJCyA8xh2+VqLxmtUacp4/0
         +Dyu75zbMvqDTvEO1UFag6oTavxzoyziCfph/LknuiSYLVfUXFoPrnY9BgS2lxziR2pE
         bRjL8xL8VqhXQGqeuiJ1u6mKjCmIoEj09813UmtF4rTxZHTNHex/4naApe0JGRXOMoIC
         GpkbbtgLDrPInhsrAYtby60KcuL852oqcxPMndBSWiHQUkghQSiiRZw3ZN1LLsjFJs6A
         M2F3OgmJ2gW4jn88DzPC+XuotAOre0aEaZP27iXdTeh1JVS0Znto/wOUX/KEK1NmY4V6
         BO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBovJmDjxPX3EFTnTQT463bqzxek0AaeKnu3iQrbfvyXXIWh5mry3AuKniRKbxWRrV/EicowlRUxQq94mN6Yg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFHHJ7oz3lTqo0nD0N6t38IH4t8+nvl96hLJHWGXtiw3as4rNL
	6d2wMDB/zr2kv2T8BDMMix7L2HZJOYdCuCJsHiZ+ZvmSkHi+3AjP4sh2oVVhXFP4Vd4=
X-Gm-Gg: AY/fxX4oNFt2wTcrSTlMNQOq6sy4CJ5oTE0fl+2MLs+KBgW83z+rNr1fC3w2cUVfOTr
	AESqqgULbg0QVzBczyK0s8xMc9FuJZcpwyyhs8DLF/BniJmUBKmsLqwZN+SaQfLYe6+zv97jgFH
	kZBnHtYM78zB8ya3I8YWacaw/Qbxs/yuzCkAdzSv/xomGDvfEbBtDcsfglYIWt2emY/tBkoSYOd
	tJhTQ7XtCOWJ038e+2dO2gcHnnfa0NdpTzrSk0NopBY+WbjThXvxszL4IN/QiWWeSmdAOz1mTNG
	iLgQqV3ZNV53FrWHowj436F+jS1e5nn4ovKk5SXded3Dpy+KaCYSVyDMFiGkfcSeF3VA82V5s+N
	BL8Blr0X4BqLypBf0kU8T6kTDsf+r/P/dGBaWYpNKkCTIGP+HKyv5w+1sTHif2lr2TpG798R4JI
	A0Um97vFAShJThAprdQUqIoJou3/7XkUtqQLWJ4S+Q70kJdw8kx14szHOJwKlP
X-Received: by 2002:a05:6808:198b:b0:44f:e931:38c2 with SMTP id 5614622812f47-45c9bf514c2mr4148232b6e.15.1768764941468;
        Sun, 18 Jan 2026 11:35:41 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d542:af69:64b6:f7df? ([2600:8803:e7e4:500:d542:af69:64b6:f7df])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e0086a4sm4522900b6e.12.2026.01.18.11.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 11:35:40 -0800 (PST)
Message-ID: <fef660dc-8c81-420c-95b6-cc8649971894@baylibre.com>
Date: Sun, 18 Jan 2026 13:35:37 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] iio: core: Add cleanup.h support for
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
References: <20260118-lock-impr-v4-0-6c8d0aee8ed2@gmail.com>
 <20260118-lock-impr-v4-4-6c8d0aee8ed2@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260118-lock-impr-v4-4-6c8d0aee8ed2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/18/26 9:44 AM, Kurt Borja wrote:
> Add guard classes for iio_device_claim_*() conditional locks. This will
> aid drivers write safer and cleaner code when dealing with some common
> patterns.
> 
> These classes are not meant to be used directly by drivers (hence the
> __priv__ prefix). Instead, documented wrapper macros are provided to
> enforce the use of ACQUIRE() or guard() semantics and avoid the
> problematic scoped guard.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  include/linux/iio/iio.h | 65 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index fa671e120e95..4a0a77fcfa8d 100644
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
> @@ -740,6 +741,70 @@ static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
>   */
>  #define iio_device_release_buffer_mode(indio_dev) __iio_dev_mode_unlock(indio_dev)
>  
> +/*
> + * These classes are not meant to be used directly by drivers (hence the
> + * __priv__ prefix). Instead, documented wrapper macros are provided below to
> + * enforce the use of ACQUIRE() or guard() semantics and avoid the problematic
> + * scoped guard variants.
> + */
> +DEFINE_GUARD(__priv__iio_dev_mode_lock, struct iio_dev *,
> +	     __iio_dev_mode_lock(_T), __iio_dev_mode_unlock(_T));
> +DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_direct,
> +		  iio_device_claim_direct(_T));
> +
> +/**
> + * IIO_DEV_ACQUIRE_DIRECT_MODE(dev, var) - Tries to acquire the direct mode
> + *					   lock with automatic release

Should be just IIO_DEV_ACQUIRE_DIRECT_MODE()

> + * @dev: IIO device instance
> + * @claim: Variable identifier to store acquire result
> + *
> + * Tries to acquire the direct mode lock with cleanup ACQUIRE() semantics and
> + * automatically releases it at the end of the scope. It most be always paired
> + * with IIO_DEV_ACQUIRE_ERR(), for example (notice the scope braces)::
> + *
> + *	switch() {
> + *	case IIO_CHAN_INFO_RAW: {
> + *		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> + *		if (IIO_DEV_ACQUIRE_FAILED(claim))
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
> +#define IIO_DEV_ACQUIRE_DIRECT_MODE(dev, claim) \
> +	ACQUIRE(__priv__iio_dev_mode_lock_try_direct, claim)(dev)
> +
> +/**
> + * IIO_DEV_ACQUIRE_FAILED() - ACQUIRE_ERR() wrapper

This one is correct style.

> + * @claim: The claim variable passed to IIO_DEV_ACQUIRE_*_MODE()
> + *
> + * Return: true if failed to acquire the mode, otherwise false.
> + */
> +#define IIO_DEV_ACQUIRE_FAILED(claim) \
> +	ACQUIRE_ERR(__priv__iio_dev_mode_lock_try_direct, &(claim))
> +
> +/**
> + * IIO_DEV_GUARD_CURRENT_MODE - Acquires the mode lock with automatic release

Missing ()

> + * @dev: IIO device instance
> + *
> + * Acquires the mode lock with cleanup guard() semantics. It is usually paired
> + * with iio_buffer_enabled().
> + *
> + * This should *not* be used to protect internal driver state and it's use in
> + * general is *strongly* discouraged. Use any of the IIO_DEV_ACQUIRE_*_MODE()
> + * variants.
> + *
> + * Context: Can sleep
> + */
> +#define IIO_DEV_GUARD_CURRENT_MODE(dev) \
> +	guard(__priv__iio_dev_mode_lock)(dev)
> +
>  extern const struct bus_type iio_bus_type;
>  
>  /**
> 

