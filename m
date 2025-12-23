Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFF514B084
	for <chrome-platform@lists.linux.dev>; Tue, 23 Dec 2025 17:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766510383; cv=none; b=YNku7MCqFsGLDl3d5J6hCD27OYMlVbGNFqbMvi5o2evHfxmzaNTgwMTNyZJ7FHT6ZFN+T4IuRkZjlk21YvsCKQCutW/sE4gzb9RIYbH3B8I/d1ZNwm86iMGs9VaTFdDs7TV+zt6NIJPHO0xR8FdbzDAhZyv6cBcNhqTSTPHG8gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766510383; c=relaxed/simple;
	bh=NdjE4V+EEouklcSCm6BZ7mfDidB3bn7JY5Wh2M//4AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZVBqEGIvKJZE/D6C2FC4YWM0vgpd9qV732hgzipmQc8Rn9mXr+rsQNefFVioXFxjupjIVFpH9LC32QYpO1ib+mq4HMHBzMfKVLBjbSgYafdTCl6GP1HTKrDsf9WQftIqrgBUCDAmqMtk97EQBFtyCgAnGh8Ei59ZP3mf/NmVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Im/uFMGR; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Im/uFMGR"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-657044fea68so3199397eaf.0
        for <chrome-platform@lists.linux.dev>; Tue, 23 Dec 2025 09:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766510380; x=1767115180; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kHzs3BD6a+q8LRnlmiLzH3xOmNz9JKocpErVtV3u+xk=;
        b=Im/uFMGRrvqkqZ3eM8iejJEXHWuEHT3RwaKZhT42KMqps5QEYYe5K/9x6rdP2J5vWK
         XZJ9MA9yWPRH83U3PbotF0fTF5rlWbccXMex8lM0LL6NMSlnEtTizTuxvRehrKSWUqBW
         7EN+j5IG0VWtsFQBGJII5eW9SHEgl92KXkLgU4Lkfl8VSxXeEPzFzjnHnFR3pRbpFgqV
         SZ2RQ2y30kg7gQLFRMx9ROzFjU5ECaB3SspT1D9msOgroq5IlvSV1OrTdK11YnNWwTBW
         B0xS+jDc61hxO3NN0GKeNFNIDukXkE/fQQqiTSwo8o/68kpr4ivJPk4kNHF7AHSnGAdg
         1rxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766510380; x=1767115180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHzs3BD6a+q8LRnlmiLzH3xOmNz9JKocpErVtV3u+xk=;
        b=Sz0T9bxQv3osuR/W0PrxgWIBz0Xb1YLgre0TrYALN7W3Ox/rT/5KFiNGk76a4ZGcKb
         ytfikcT20Y9ilrQ3iHwv/w74IvHsCXx4Eiah/V/XosVKyS3KDRKg+e32c5ci8SDsWYWJ
         xJoLEMaD8h56nPZ0ObpsrI6R+G2iaZlZcpt7QWCEcIu4g7YA42ULOrcbFrlmEWEtKpYS
         nftvhNsloLANJJ6UwS78k6qKwsctSJf/V9Zwq4vsZAX6X90Vv0+5RaJK+BH6GN/epa8R
         uBCEIK8PG5Buz3xhSOiv2n8ipigPOlbVvYppnYlzNX42KWPxWiqZxzkB6Y1Mt8f/VVux
         Eb8w==
X-Forwarded-Encrypted: i=1; AJvYcCX93gs3mY/fXxN5jDJqBgNf7R7+4Jh3+bpimZ1uejDpaXWR4TENcihz46Hi2AvuUf52DdezIxCYqOEGUUBgOFs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxM+gGJujiVVSggnOrw0RDwzEiDnJOeT0z7WGX99Kv0Nu0wLX1V
	qXiZWfPOncDJO5n5A8/xyAIPu3mUVm8NSsCSOubLAW3QSey58lBWaKRYGhV6fAc/Nek=
X-Gm-Gg: AY/fxX7r7xRbL5Kp3lDjd3ekPPsFgnEU5XQxKMvfZK18JB5CpxVbxV+dcrl9NvslQM5
	Ui5D19IVuenw02PHyMpRzb2XqyvmhioGtgHZ9k31mNGIMAiW8xZV2nKctqVgGZqAjvFRg5ydhIj
	tPoq8e8IA8h0R8K5wdLNbaseEyVhD2KwmkkZIft4B6aWyvVhbun/k09TyWLjqGQnUImCFc8mabx
	gyn8saSyf/z/JnsV9dTR+iAt7DSjAs3LcQCV06P8jv8NvZ9l5YzhLQ//tyKBdYEBlj9hsqN0OlG
	lEvQM2SexILUDk9B+lQ/B2V+I/9mZWMpF9wxxqdkUHKir9RPzFingGByhl+F/vQ/lpsgGcUmA8X
	DW1HWD1MCwQ9XKRmSNjVYFtSfZcfNqOYj8sZ21Jsn1qG+bciycVclUnsO7XDt4sZ4qTvIUaGdG1
	VsSZO52u3TwDmXKRzDQqS1n5kbJxOvaFZvCgCc5GC9ooqU0mnazHye9YWll+DS
X-Google-Smtp-Source: AGHT+IFol+32ZNHnAJwQnVwVNbtJWIUgSq1V1a2nMl5MLixp2jR1RBcMRLq6HzFozpq4GGBCAoox8A==
X-Received: by 2002:a05:6820:f004:b0:659:9a49:8eea with SMTP id 006d021491bc7-65d0e3a9cb9mr7432898eaf.30.1766510379759;
        Tue, 23 Dec 2025 09:19:39 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:fe29:88f1:f763:378b? ([2600:8803:e7e4:500:fe29:88f1:f763:378b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65d0f69ba9bsm8889471eaf.10.2025.12.23.09.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:19:39 -0800 (PST)
Message-ID: <92d07935-b2b5-4cf3-bd45-654d77cdc23b@baylibre.com>
Date: Tue, 23 Dec 2025 11:19:38 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] iio: core: Add and export __iio_dev_mode_lock()
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
 <20251211-lock-impr-v2-1-6fb47bdaaf24@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251211-lock-impr-v2-1-6fb47bdaaf24@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/25 8:45 PM, Kurt Borja wrote:
> Add infallible wrappers around the internal IIO mode lock.

Not sure what "infallible" is supposed to mean in this context. Maybe
referring to autocleanup?

> 
> As mentioned in the documentation, this is not meant to be used by
> drivers, instead this will aid in the eventual addition of cleanup
> classes around conditional locks.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/iio/industrialio-core.c | 30 ++++++++++++++++++++++++++++++
>  include/linux/iio/iio.h         |  3 +++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index f69deefcfb6f..1cce2d1ecef1 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -2171,6 +2171,36 @@ int __devm_iio_device_register(struct device *dev, struct iio_dev *indio_dev,
>  }
>  EXPORT_SYMBOL_GPL(__devm_iio_device_register);
>  
> +/**
> + * __iio_dev_mode_lock - Locks the current IIO device mode
> + * @indio_dev: the iio_dev associated with the device
> + *
> + * If the device is either in direct or buffer mode, it's guaranteed to stay
> + * that way until __iio_dev_mode_unlock() is called.
> + *
> + * This function is not meant to be used directly by drivers to protect internal
> + * state, a driver should have it's own mechanisms for that matter.
> + *
> + * There are very few cases where a driver actually needs to lock any mode. It's
> + * *strongly* recommended to use iio_device_claim_direct() or

I wouldn't even say "strongly recommend". Just say "use these instead".

In the exceptions, likely the autocleanup version should be used as is
the case currently.

> + * iio_device_claim_buffer_mode() pairs or related helpers.
> + */
> +void __iio_dev_mode_lock(struct iio_dev *indio_dev)
> +{
> +	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
> +}
> +EXPORT_SYMBOL_GPL(__iio_dev_mode_lock);
> +
> +/**
> + * __iio_dev_mode_unlock - Unlocks the current IIO device mode
> + * @indio_dev: the iio_dev associated with the device
> + */
> +void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
> +{
> +	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
> +}
> +EXPORT_SYMBOL_GPL(__iio_dev_mode_unlock);
> +
>  /**
>   * __iio_device_claim_direct - Keep device in direct mode
>   * @indio_dev:	the iio_dev associated with the device
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 872ebdf0dd77..aecda887d833 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -661,6 +661,9 @@ void iio_device_unregister(struct iio_dev *indio_dev);
>  int __devm_iio_device_register(struct device *dev, struct iio_dev *indio_dev,
>  			       struct module *this_mod);
>  int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
> +
> +void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
> +void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
>  bool __iio_device_claim_direct(struct iio_dev *indio_dev);
>  void __iio_device_release_direct(struct iio_dev *indio_dev);
>  
> 

