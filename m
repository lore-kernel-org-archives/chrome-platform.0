Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739F92F1FDB
	for <chrome-platform@lists.linux.dev>; Tue, 23 Dec 2025 17:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766510423; cv=none; b=r/aYrBG50riHAajVQBmcH+A9Dl4weg+XUOpufWNfNRo5Rzfi/qWgDaoikfztBZDhwCi6rDsuxI0y+Ohbv+vZX+JzV1D2Hbg0CB7ZLdCzzO1VLiusE37j1Mf5CMuZ5HYl68WNJMhIDom5CjxEXDsvxNQ+UreqQnrANC4ZWfngCg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766510423; c=relaxed/simple;
	bh=BOangCFpjJ52aOedJ3g06NZWOG6nu/2RmNPphZdciHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oL2fCNmj1ngjQcTdcxI7n+bb7+/tb839PS6AEStN+0SAvhtWNzZWILMcTnpatG1nFBMn3+rMIj9bp5xOcHfz9ahgVNjB/J29W/YG9bkmhtKDRV0Fa2Ng5Y4oWHBWQggKD/Yl6FBpTW8yD4s5IQPYFmOZ2ir57dg9s9iImeRXRuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vFw+xdbs; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vFw+xdbs"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c750b10e14so2101758a34.2
        for <chrome-platform@lists.linux.dev>; Tue, 23 Dec 2025 09:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766510419; x=1767115219; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqjoHDMp6UnfGET/5eFXYzvi2pMQ1f0rv1DZdq1dHzY=;
        b=vFw+xdbsleXPJtGapc+uwfYVSwsoYVa5MJOx8wmOchNmRdR52NyVcamX7UkX038Npj
         zUKMO3qwu01Jbpz158s7XWLUdv5HDS9gbVwS+yIMGfPxVC+uhvqAWQ0SreXjLiiAmj9R
         0DtreOjqHBJdycj0RAb3r23j3aTHpLhJ9HLIzE8Mnb8rvohKY4B4A2GNamcTs3k8mYTW
         +TBMFWAtk+jhYceLuTXjuubIw2dl8DZwHLI8Ag/gokaoD+9IAA+PZ/xd5ADF52BBOP7j
         MV0w+JJFp005cENNv7x0Sqad93VLB741g7tN6fRIj13NZA5lvLTUm/bj31KHYspDbvBj
         UFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766510419; x=1767115219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqjoHDMp6UnfGET/5eFXYzvi2pMQ1f0rv1DZdq1dHzY=;
        b=uMJsQWgCwYsYpQFqxUuKJ3kc4jREZ9j7ahUN3FsrfwbzKh7TbZYxB/OvkFufy5xgLT
         ydjbPhwWW4OX6Ign07ueCWCFq8QlE0EIrw9qVLSOe00sxpJnsd9c7icbmmNWMOIgl61I
         o1hZxTVBBN6u0uUsP9SYKx8CLNKhzmixAe3ZmK3MmzGzo1ofI2uxfNSQoqgritgCyGSW
         ViB1PWgLgGGuOlajwyNfqmcKGLAEDYneQcKYhjttDfWByHTX29YqX7ejQRdJ4PQeF2Vd
         nQLiE7JH8us0PcFOzgP3Dknk//8duIUjb5w03e+SQ9fjCo/vAZvQOiOObJhnNieiXUeB
         ZUqw==
X-Forwarded-Encrypted: i=1; AJvYcCXwiADTOBiCws2NspokhXH8xygh6CupVc27tNgqb04S0EFvg0ipBD0tiqvCXuLT0/jjFcV5Lf4metf+isQCkUM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0yY26e47dflJ9PUcI+jIieWisLCRuQFwUhAoKL/JKAcK119il
	xX3qHF1LdTe8i9xt/zMMlANadIOKA348NdmgQzfUyD3OYXgkRrNv/PYzSdYEKxioU1k=
X-Gm-Gg: AY/fxX4DqBwvHL4xj0ZX5auv3oHU0ue+OMX1+dSvLPKi8s5EY8QK1frO7z6+7isKvYJ
	1pU6hNBHiKa4a5M+z4o+SRn8PCbIGcfM5hQO35a7Hu7yw5w7Gr1dJ2tCHnkRKDC4Cg/PaFy8A0x
	mBQUpLE8C/sL9W/NzrVnXtWvyHGpBrU/7J/3+diL9z3Ah6Uy5BrXWs+VKrdNePZsImrqgNWjTs/
	7c3HOrpSjFD+VHzkdKPKAEkP1CxpOnQusS+ZvLR0QwPeOcUv7CbK0EOdTa/IUrMjRJUAsSs87O2
	DjG/T6uWYEHZ97oMmkRsdlnJOBnYBXfERJLWmCYMY6/TrXKniw31eITaY8qIuf1MkQhvI1dOeXx
	46glPSL4ltjlMiWy1SXboFvlN/UEgpyC4nvNfA/83Sb7luEeaBlbfKhPjUNSXRsmsfBb/v7smCL
	S8k2SqSkYZmG0vcvMvyR2tD1qRQxOTAYEGC50WL0rOQPLSLTMmYqKs2gyyZQTy
X-Google-Smtp-Source: AGHT+IFKHrsIz88QlZ38cn6wj+NStTXlLJClZOJ8CAkdAaG6odFkTXTwTPo7/oejo9fhLpdux+pQCA==
X-Received: by 2002:a05:6830:7199:b0:7c2:8937:5d2e with SMTP id 46e09a7af769-7cc66901f28mr7039103a34.15.1766510419383;
        Tue, 23 Dec 2025 09:20:19 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:fe29:88f1:f763:378b? ([2600:8803:e7e4:500:fe29:88f1:f763:378b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667ebe98sm9756043a34.21.2025.12.23.09.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:20:18 -0800 (PST)
Message-ID: <6ad0f764-91f2-4946-81cd-9363ec87722a@baylibre.com>
Date: Tue, 23 Dec 2025 11:20:17 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] iio: core: Refactor iio_device_claim_direct()
 implementation
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
 <20251211-lock-impr-v2-2-6fb47bdaaf24@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251211-lock-impr-v2-2-6fb47bdaaf24@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/25 8:45 PM, Kurt Borja wrote:
> In order to eventually unify the locking API, implement
> iio_device_claim_direct() fully inline, with the use of
> __iio_dev_mode_lock(), which takes care of sparse annotations.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/iio/industrialio-core.c | 44 -----------------------------------------
>  include/linux/iio/iio.h         | 38 +++++++++++++++++++++++------------
>  2 files changed, 25 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index 1cce2d1ecef1..cffc6efb6617 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -2201,50 +2201,6 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
>  }
>  EXPORT_SYMBOL_GPL(__iio_dev_mode_unlock);
>  
> -/**
> - * __iio_device_claim_direct - Keep device in direct mode
> - * @indio_dev:	the iio_dev associated with the device
> - *
> - * If the device is in direct mode it is guaranteed to stay
> - * that way until __iio_device_release_direct() is called.
> - *
> - * Use with __iio_device_release_direct().
> - *
> - * Drivers should only call iio_device_claim_direct().
> - *
> - * Returns: true on success, false on failure.
> - */
> -bool __iio_device_claim_direct(struct iio_dev *indio_dev)
> -{
> -	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
> -
> -	mutex_lock(&iio_dev_opaque->mlock);
> -
> -	if (iio_buffer_enabled(indio_dev)) {
> -		mutex_unlock(&iio_dev_opaque->mlock);
> -		return false;
> -	}
> -	return true;
> -}
> -EXPORT_SYMBOL_GPL(__iio_device_claim_direct);
> -
> -/**
> - * __iio_device_release_direct - releases claim on direct mode
> - * @indio_dev:	the iio_dev associated with the device
> - *
> - * Release the claim. Device is no longer guaranteed to stay
> - * in direct mode.
> - *
> - * Drivers should only call iio_device_release_direct().
> - *
> - * Use with __iio_device_claim_direct()
> - */
> -void __iio_device_release_direct(struct iio_dev *indio_dev)
> -{
> -	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
> -}
> -EXPORT_SYMBOL_GPL(__iio_device_release_direct);
> -
>  /**
>   * iio_device_claim_buffer_mode - Keep device in buffer mode
>   * @indio_dev:	the iio_dev associated with the device
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index aecda887d833..76398dbfa5ca 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -664,30 +664,42 @@ int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
>  
>  void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
>  void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
> -bool __iio_device_claim_direct(struct iio_dev *indio_dev);
> -void __iio_device_release_direct(struct iio_dev *indio_dev);
>  
> -/*
> - * Helper functions that allow claim and release of direct mode
> - * in a fashion that doesn't generate many false positives from sparse.
> - * Note this must remain static inline in the header so that sparse
> - * can see the __acquire() marking. Revisit when sparse supports
> - * __cond_acquires()

I think we should leave a comment that says these functions need to stay
as static inline so that sparse works. Although I'm wondering how sparse
could still work since __acquire() and __release() are removed here. IIRC
it was a bit finicky about that.

> +/**
> + * iio_device_claim_direct - Keep device in direct mode
> + * @indio_dev:	the iio_dev associated with the device
> + *
> + * If the device is in direct mode it is guaranteed to stay
> + * that way until iio_device_release_direct() is called.
> + *
> + * Use with iio_device_release_direct().
> + *
> + * Returns: true on success, false on failure.
>   */
>  static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
>  {
> -	if (!__iio_device_claim_direct(indio_dev))
> -		return false;
> +	__iio_dev_mode_lock(indio_dev);
>  
> -	__acquire(iio_dev);
> +	if (iio_buffer_enabled(indio_dev)) {
> +		__iio_dev_mode_unlock(indio_dev);
> +		return false;
> +	}
>  
>  	return true;
>  }
>  
> +/**
> + * iio_device_release_direct - Releases claim on direct mode
> + * @indio_dev:	the iio_dev associated with the device
> + *
> + * Release the claim. Device is no longer guaranteed to stay
> + * in direct mode.
> + *
> + * Use with iio_device_claim_direct()
> + */
>  static inline void iio_device_release_direct(struct iio_dev *indio_dev)

It could make more sense to make this:

#define iio_device_release_direct __iio_dev_mode_unlock

To make it clear that the auto cleanup functions that come later
don't call iio_device_release_direct() but rather call
__iio_dev_mode_unlock() directly.

Otherwise, someone could be tempted to modify the iio_device_release_direct()
function and the changes would not have an effect when auto cleanup is used.

(Same applies to the release buffer mode function.)

>  {
> -	__iio_device_release_direct(indio_dev);
> -	__release(indio_dev);
> +	__iio_dev_mode_unlock(indio_dev);
>  }
>  
>  int iio_device_claim_buffer_mode(struct iio_dev *indio_dev);
> 

