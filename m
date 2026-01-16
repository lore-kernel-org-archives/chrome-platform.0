Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41442EB5A1
	for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768601042; cv=none; b=J5UEL8uaiPjG64HWGxOxN5Q75aJ3uFEWGTKCxiv5Cam1TMw1skVWJLD7sXJ8+y6AImOP0YYobyKqZp2vMCutD0u0UERMH2PX7RNIratOJSggrHAVuIaBubvhtvg7EBX2EMo6914gLmOwnJXdOh5xbEJzj3vt5t0nakZmXzy4O40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768601042; c=relaxed/simple;
	bh=6tyjTajdOQh6J57U/rMOsH8jV3xfmFKJ5YGgVVF1VoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WfaaFpds5AK5SBdF7Des3+xGa0I5JT5Sq7tpYQAo2tQVfA59oSvWyOMofzBh1DY5tIrA25ZM0MCc1CzJ9OOdnKCXw0oiaDU8MGRr4CXerJ8qqKJ6ZMxWRasIVLD3gXajS3q/3M2yOfG4zpx4qS3V/x5XC6sOM1aFNauDCljJWkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PF/9jCMI; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PF/9jCMI"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45c733ccc32so1573468b6e.0
        for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 14:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768601038; x=1769205838; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIt+ZzeCtP7pqDmlgpYUQhxXE3OKLmphYCyoYGAfb3I=;
        b=PF/9jCMIGJ0v/6LwHElU5pWd960TQVR24j3cfooG7z3Yv4MX884BOT/GEmc941XMZc
         7ukk2CgBSv7Vc6p+SR7+X8R+j/FG+Od5No6LoVrq+NVue7Ik6gpVwsIr3DRJtgE24XbE
         RdWrXHBwc/f4EhT8IaJ9RvBO24wMAevGyNl+qGrOWF3/L4zHxiK5caiJwP0iNFUO/fuu
         2mRPJ+Ml2dDDYNZxsSobhneC8WHmRr57vrb5zoHEhea64LzExn1bT+sYTpv9SxZx1zdq
         OApZrVjrASUeSmhdlUolnXDpTgpQc8nrCGWKlG69tM+aFxp89nOxkaNysfunOk/ORyxm
         jOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768601038; x=1769205838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIt+ZzeCtP7pqDmlgpYUQhxXE3OKLmphYCyoYGAfb3I=;
        b=pvxXE+lNrc4ITtACUkDJ9R6kHyPh5GtZ4wTFzee40QW8wksKm4PTiw0hNU6xutBuAO
         Xqcsx454p9aqDJqKhE5F5Y6H/elgsS2RSls5dBeE+G/bw4EZ7uNcGI2w+NSpNhm+ybxt
         M+Wni+Rn0cAP0kW/8CzPcEJIDerBoZ3PRwbcak/5x3PbRMMcczMh8tNZTpOD51jmHYFE
         LC7wuqJu2jG3/LWxHgc/osy2OdWOCpThQSQ2vcl5dicbWGFPsT7MXWBrLiIfi1R1d9Ob
         2bsptyvJ7X7j1+imIW16h18gQuuucdHyf3t26UeAXrSpxJMh5loOzONX8HDv2nByPyhq
         k74g==
X-Forwarded-Encrypted: i=1; AJvYcCUlg5gIbA6xEqLq2JtL7ev9RIGtYPcvo1IiVtTImnQz2slePlphCmG8J4pB9W1rr7a3DwZ97DKxk3977LGQO2E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJZxCIQcYUkLw5pkoSEvg4Ji59YOW9dOkuJ9Tvs3vrnNaN0I/e
	kbB/snnwDsDXt9I4KAn6DQ/yr/9FZmOrNlGZ8ike84KPfLjZYPG3rmwmGSRDoWazEfg=
X-Gm-Gg: AY/fxX4CCihFun2i/RTJiiVtbk/SyeV4cd9mpqKBlgNxdAVzHswiMDnDU3AEWcGzquH
	7CVAdFxQLhYEHA3ILBrpGEU3AYsGEwLggJxgc//t9RhN/XMMxT8qUQKvhStAmZTHCJT+jsIRsyn
	s72StspTpNPGrQjMG4+lBxaeusqd+PWHyKQdfCoYtTSbBX0l5neMElt4lB+ncwcIiBYlontxYT0
	Vtaa2eAsQVALjkeeneMzrc10laEuNS8FtFGzZ1SL1CdtKRT7u7wc3yrSgMWEm0YgIt/vIj3Yz+o
	Y8PHbJWPpfcJWwYA8x2T86r7Y7CMWyqQGmK7oQ8S/bd2gWiUBvGunyHxTElYdeDXyvOA7thGPNe
	bLZKH3JTg+670aB9MqyGpPAZh2Z4dbE7ACF4oGFjGRp5Mm04lpJZNvEmQdqNN7oHGxcdM7NhUUV
	FVaDcbp1ttazVgXhiduuz5tPlMg+xCadRsZJ+D66HQCVdYbj7oiRDXbsl2D+RL
X-Received: by 2002:a05:6808:4f4e:b0:45c:7eba:576a with SMTP id 5614622812f47-45c9c1a732emr2028739b6e.64.1768601038648;
        Fri, 16 Jan 2026 14:03:58 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:bd39:740e:f70f:5f7d? ([2600:8803:e7e4:500:bd39:740e:f70f:5f7d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4044bd14883sm2386316fac.12.2026.01.16.14.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 14:03:58 -0800 (PST)
Message-ID: <27cf1ec1-545b-4e44-8229-852f8bdae116@baylibre.com>
Date: Fri, 16 Jan 2026 16:03:57 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] iio: core: Add cleanup.h support for
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
References: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
 <20260106-lock-impr-v3-4-1db909b192c0@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260106-lock-impr-v3-4-1db909b192c0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/6/26 2:06 AM, Kurt Borja wrote:
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
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  include/linux/iio/iio.h | 71 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index d8af0456f966..c795f731f2d8 100644
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
> @@ -740,6 +741,76 @@ static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
>   */
>  #define iio_device_release_buffer_mode(indio_dev) __iio_dev_mode_unlock(indio_dev)
>  
> +/*
> + * These classes are not meant to be used directly by drivers (hence the
> + * __priv__ prefix). Instead, documented wrapper macros are provided bellow to
> + * enforce the use of ACQUIRE() or guard() semantics and avoid the problematic
> + * scoped guard variants.
> + */
> +DEFINE_GUARD(__priv__iio_dev_mode_lock, struct iio_dev *,
> +	     __iio_dev_mode_lock(_T), __iio_dev_mode_unlock(_T));
> +DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_direct,
> +		  iio_device_claim_direct(_T));
> +
> +/**
> + * IIO_DEV_ACQUIRE_DIRECT_MODE(_dev, _var) - Tries to acquire the direct mode
> + *                                           lock with automatic release

I don't think it is usual to put the function parameters in the
doc comment like this. They don't match the actual names anyway.

> + * @dev: IIO device instance
> + * @claim: Variable identifier to store acquire result
> + *
> + * Tries to acquire the direct mode lock with cleanup ACQUIRE() semantics and
> + * automatically releases it at the end of the scope. It most be always paired
> + * with IIO_DEV_ACQUIRE_ERR(), for example::
> + *
> + *	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> + *	if (IIO_DEV_ACQUIRE_FAILED(&claim))
> + *		return -EBUSY;
> + *
> + * ...or a more common scenario (notice scope the braces)::
> + *
> + *	switch() {
> + *	case IIO_CHAN_INFO_RAW: {
> + *		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> + *		if (IIO_DEV_ACQUIRE_FAILED(&claim))
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
> + * @claim_ptr: Pointer to the claim variable passed to IIO_DEV_ACQUIRE_*_MODE()
> + *
> + * Return: true if acquired the mode failed, otherwise false.
> + */
> +#define IIO_DEV_ACQUIRE_FAILED(claim_ptr) \
> +	ACQUIRE_ERR(__priv__iio_dev_mode_lock_try_direct, claim_ptr)
> +

If we always have to add the & at the call site, could we just
put that in the macro instead? Then the parameter would just be
claim instead of claim_ptr.


