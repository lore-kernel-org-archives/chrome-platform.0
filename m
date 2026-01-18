Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F8B26ED3A
	for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 19:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768764617; cv=none; b=iy7kQl9Qn8OiZhXcU1c8ASFAjBIfYFZjzN/A09g/seIUb5GM8N9B6x5ejwcsyl5d+ReHGWoOv13dBgDvOB5QpOrM1gVoTzZCm/ZdkS9WgbuRNQBAEmiy+MrBZkRpONtM9fbGopPKqNV5vR0i/GwQg/QLqWKa3MT+4S2HZpThHrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768764617; c=relaxed/simple;
	bh=XaDBiv5M+RFEv9IJJoFZ/qrG6BEziOBJceL/IH/8v2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SiT/GtVvh3z3pqmmwqtYt9cT8XpILmqGT8aTA4MoY5wnI4vj08n4LauhcMOhoHszFNcUdJC89QxEBTWRrKP0CM6EJHk+SGgzNphFr74Okns1BNNUzH5NtbIWDUWkEun0CDt91cBhZlPWqY47TEXNuvdKkuR1bkb/Bi8ZeRnb5Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XuGwFZxq; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XuGwFZxq"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-40439fb8584so2250689fac.0
        for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 11:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768764614; x=1769369414; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FE91AlC+Wf3fpDTOpQTd2EcMaLnOUTf8XrrOstYz7Jk=;
        b=XuGwFZxqxKUJzNyxkmYmtzdDxfCUsFHyvUnM5e4cOSfa784Ng2nr1x4nUCPusqq28m
         PzgwRe5Q5PYEEcLYlChWdNU/6LlUhKKK0HdZM0WD+Iu9pWuJGi16+9lq2Ugvp2ijrkXo
         cZbQxTZyCDlOlPTh7W9D+clgL5mfoj7DFnsdvAQC+zYTKDmHyVSmfrNTT/4Xlw1upN04
         dbFIgR/wZSBBET76x+vmE+Npbc8CUQ5a6y/4PBlDK4DnhkRLB2zc+6AVzRIvuo+w0vCs
         IdE56zkoXC+yUQCkAQvfnD9bSq1vDF/0wSPCXC8CxJzaZ+CFHPK/hFlPjoZKcE49pIS2
         ISbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768764614; x=1769369414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE91AlC+Wf3fpDTOpQTd2EcMaLnOUTf8XrrOstYz7Jk=;
        b=tNtn6MlpUVoD5qBF0aODOQis/eZ4P34LGiEu9YpZNmgWM4qaHCCBihQWg56N0OY4Vu
         b9gWhJPsS7oMlccU4mvHYf4zthtWbb+/rLyUR3lB65Bqs3UHsQw5ZYsujIorSrs3bNRd
         BcdZPAzobD9r+IAuXn1QM3vgo5ZmGYA81x6JHVbQ8guYZ8lk9wp0oXguZCYAyXONt+xf
         2wCKDcDwEYDeuf6vko1K04PxcFr1zI9AO6OQDZ2g3hLOUiPn5Vbh1j+jHqZlIbbUkWXv
         Wu5zberVme3wG03vQHwvCfMkPjO+AIdoYcgJonZF+I0Xxq1asGSIXRZ0/wAthqwRP+Yu
         vMVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU451mPvmaJ02NL86InJPdOEhcxfKeDcumUsP38A1QboRdEYZp798PJquoPAB4ONu4erE93+pfCjC9z8Qxcev4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjiWoMf0Q7uBaWsm7CZQT/UQgkix3WgdgkoYgRuyVmJVEgzsNe
	B+sdGR3bbkcJQjkTnIypQcqRMS7ZPlk2uWvc0P8ngW8mVqLCL7hIgoEDyQ+x/iOB40Q=
X-Gm-Gg: AY/fxX5Kw9kngpME+JjRf7AcTvOC9dK3m4bME/FxV0HnKtfdHn8r/KXNT7Ct+dnzvCL
	F8/f4WB/s5gKzq2hoELj7q2zU5KLbNP4JGsqslmfnU+dFW34+nhUqM1XHvOBSvTUV0dNWuj1sKl
	QdP3KwhcX2QXdqhdHfDnrp2auDg8OqtIeLWuH4o8HwvcPkvxlgF3GlJGtMVcA0kqVHYGiShYq4r
	4InuscSaI3T4eto99i3u2WrH7yydx+t/HIhB3xCvT349lyZGkRQaL24IgZRKwQVELx4sN01Yyyc
	NfGsaBXah+2qJGZ6HzqnSQhg7pNax4q2s8O+/iyO0+ubIC3mSH72M85eqQ5UtfeBw4oZekc1MLc
	tBBUVedO8OsgPXbFhcmAZTinhQi2+NKXp01RRTrLVvF0guHqPYEQvdTA6JwfuRaBbqK9B1aDHac
	dXTYSvWoG04Vzra9Is3I6UnUpu/LizkoDwUl+ZlWikkpgvETocByPJ+e2R2PU6
X-Received: by 2002:a05:6820:1688:b0:659:9a49:8ed8 with SMTP id 006d021491bc7-66118020948mr3526334eaf.12.1768764613766;
        Sun, 18 Jan 2026 11:30:13 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d542:af69:64b6:f7df? ([2600:8803:e7e4:500:d542:af69:64b6:f7df])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4044bd5d62csm5629835fac.19.2026.01.18.11.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 11:30:12 -0800 (PST)
Message-ID: <c73935a2-1c71-493e-9504-5ea205169eb7@baylibre.com>
Date: Sun, 18 Jan 2026 13:30:10 -0600
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
 <27cf1ec1-545b-4e44-8229-852f8bdae116@baylibre.com>
 <DFRTH0GI1UPO.12NSSABBNSRST@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DFRTH0GI1UPO.12NSSABBNSRST@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/18/26 9:23 AM, Kurt Borja wrote:
> On Fri Jan 16, 2026 at 5:03 PM -05, David Lechner wrote:
>> On 1/6/26 2:06 AM, Kurt Borja wrote:
>>> Add guard classes for iio_device_claim_*() conditional locks. This will
>>> aid drivers write safer and cleaner code when dealing with some common
>>> patterns.
>>>
>>> These classes are not meant to be used directly by drivers (hence the
>>> __priv__ prefix). Instead, documented wrapper macros are provided to
>>> enforce the use of ACQUIRE() or guard() semantics and avoid the
>>> problematic scoped guard.
>>>
>>> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>>  include/linux/iio/iio.h | 71 +++++++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 71 insertions(+)
>>>
>>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>>> index d8af0456f966..c795f731f2d8 100644
>>> --- a/include/linux/iio/iio.h
>>> +++ b/include/linux/iio/iio.h
>>> @@ -10,6 +10,7 @@
>>>  #include <linux/align.h>
>>>  #include <linux/device.h>
>>>  #include <linux/cdev.h>
>>> +#include <linux/cleanup.h>
>>>  #include <linux/compiler_types.h>
>>>  #include <linux/minmax.h>
>>>  #include <linux/slab.h>
>>> @@ -740,6 +741,76 @@ static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
>>>   */
>>>  #define iio_device_release_buffer_mode(indio_dev) __iio_dev_mode_unlock(indio_dev)
>>>  
>>> +/*
>>> + * These classes are not meant to be used directly by drivers (hence the
>>> + * __priv__ prefix). Instead, documented wrapper macros are provided bellow to
>>> + * enforce the use of ACQUIRE() or guard() semantics and avoid the problematic
>>> + * scoped guard variants.
>>> + */
>>> +DEFINE_GUARD(__priv__iio_dev_mode_lock, struct iio_dev *,
>>> +	     __iio_dev_mode_lock(_T), __iio_dev_mode_unlock(_T));
>>> +DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_direct,
>>> +		  iio_device_claim_direct(_T));
>>> +
>>> +/**
>>> + * IIO_DEV_ACQUIRE_DIRECT_MODE(_dev, _var) - Tries to acquire the direct mode
>>> + *                                           lock with automatic release
>>
>> I don't think it is usual to put the function parameters in the
>> doc comment like this. They don't match the actual names anyway.
> 
> Hi David,
> 
> This format of kernel-doc applies to function-like macros too [1]. I'll
> match the name of the variables though.

Right. And it has no parameters between the () on the first line
in that documentation.

/*
 * function_name() - Brief description of function.


So it should be just `IIO_DEV_ACQUIRE_DIRECT_MODE() - ...

>
>> + * @dev: IIO device instance
>> + * @claim: Variable identifier to store acquire result
>> + *

The parameters go below like this, which is already correct.

