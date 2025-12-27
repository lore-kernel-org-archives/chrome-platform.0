Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A25D1FBEA8
	for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 18:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766859657; cv=none; b=SC7UFz4KmRYxWqjCqlPx7UbKcRQ7FOHJWVFumPwIrMHLzkTi9NO+Nqgob539krZstp+OicZNVWnxUNQYjMPbJoFG4Qi52IerXANeQfMGm4+uCKCi4IQxWWfTPzTQhXyio02itf/J1gbQ8lqL2HbFawo8q8cJQ7tll4pJtQ/N5xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766859657; c=relaxed/simple;
	bh=+CbJpq+tdkgrbaPm9dRNavpRXrube0jjJxJrm5A9Mnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFn6UfTqhNaJQlwNvaY5V7QZvPjcqOUtDUpiMjVQ3pmc36g2F9wIgrvCEqFtJyWPGgPL8f4L9YewMvfR9I+sK5lnvvZ7aWIrWuhlv14hvosobTbe3m8MbQi9BvXTgwSmvdlnWHqD23jVbC5tUQwgACS+l4I+3DeEnWiZkx6zXWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nrbM3tFy; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nrbM3tFy"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-457c1148a5bso1635511b6e.1
        for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 10:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766859654; x=1767464454; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J2j9oSp9OzmTh5S36B2mxVYf+/+BpGtxTc6qLR8BJ9M=;
        b=nrbM3tFyAzqocbkXd+hutTPOqKIzBtfzSWBSud9f3MQASoQHbDIcw1rUoEvAor5k4s
         bfBYxLCpB+ilxBg9bqSrnvinM2FafF9/NHq0hA2vgnuwvuX0n496OCIpUXyxyll5Vbcd
         Gk6CQ2kajTm0kAhznpT7XrZgMWob4RWEd3McvsNYj3xoF1vFq9TBjvWKAAW1vqpcqKFV
         1MYfrJAmYF5mhY6PF7Egf6CVKCf13pvqNTbn87/wIMEzikagnSwMMr10CWWM4rj2anjH
         Dbg2UoHxtrYJz3b+OjDhhOrGYIgPa97k8kDTmk1KTXjDs8A26NqEEJkiReifnfCjpQLN
         gGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766859654; x=1767464454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2j9oSp9OzmTh5S36B2mxVYf+/+BpGtxTc6qLR8BJ9M=;
        b=AzOb/cIsnI22QbYcJCi5JHeHfv2JfO4yxZvOqLyfdXtDZ+BSKH2KveXo1oBBJyGj/U
         eboh8pSEabEysiVUblpNbxHnwKOFTHAR55RZHnvumRzUvAucN0ElL9fGz37HzNaAoL7R
         mUo3CGVUw5i62VqSe6v9rkzqgFHVubXT5DK7+4/XpQf5f4pOPtjoiOVMv4vIcQsQct4O
         PS3K6C0s2C7F3/wuF1cCfxr9ehwwnPPS52mhphgbbcknV/XqG6sOObnOntOChZvlCqUb
         bMpDmQf2XpXOjZKDQ7RL9VDEB/vgxe4NTsUvdsYtJXNiJvvYjDFFqb1G8SlAwlwVuU64
         40lg==
X-Forwarded-Encrypted: i=1; AJvYcCU0bVs3IYGZ0TGLjkjwFErjFO3K3fsDgk028S3a8Tiy52ef6LVc9kF21uMtdiingeVT8Oz6KXiJWaP5aa/jNr0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQAz2+B2ESi2V0ywGeCDvGmNdxh7mHTF6pnI6bLlB2tWvN4oUq
	O8N6rIuDuHhxcch7F4BLczR1FRCaQ2RRjvg53WeZ6MzwHeR1e0Sax8KHZCdTCyx0duI=
X-Gm-Gg: AY/fxX7AjKl4+SISRPxsED2b8YywJbKK6iaeVbcSbdIHnlF7QYGPUigc+br4DZbsWQd
	VAUNxTPPIA0q56PiS39iHDA7ZzFTSyOUtvp/Mlp4jRSB82cGt2p1WPXAESArXYu9DDXjF6Faiqp
	Qjo9VQHVm9dXLdElvJCyFXoTi04bnbqesfwofHteAPF3O7icnTx1O+8hO5WqYVf7H7gbG+xzj1R
	W3pq6rQt2K5zKcP78uGpa9RK5KGvG0l60B2wJRcE6+lfD1rtN5RGVrcdQjcQHqA4Fjf9llPSwnv
	7VyIbY5vkTM8yaa7ogbziVLJR7LGlL025M3mODyuz0iNeATPmcWYkJAZVKRz4C0ER5Jin86iKal
	gMI4q3d4Op7eW92GsGmahw/0rlfmkI3Ie10C76J9UR7Ot0VIYX/4JHK8j3M7vKBHcsxN3V85TLR
	gfVuPEhN+7PY1+hXomqgdhgG5ekJFoFVSf3/Z6IqdiLC4wsqwWsntbndCm0BEv
X-Google-Smtp-Source: AGHT+IFPqw8otBicikTMcpttXB+4UlYnr6IaZlBoYe9K5ZRzq3nsV03RecZLJ0LeOfBCKUElLGSUqA==
X-Received: by 2002:a05:6808:1b25:b0:450:c0c4:3728 with SMTP id 5614622812f47-457b2175c27mr11920065b6e.30.1766859654263;
        Sat, 27 Dec 2025 10:20:54 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:81b7:1177:37cc:3153? ([2600:8803:e7e4:500:81b7:1177:37cc:3153])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667284fdsm17601022a34.2.2025.12.27.10.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 10:20:53 -0800 (PST)
Message-ID: <6d40a735-ad73-4a21-bd66-3af1edd0d1e7@baylibre.com>
Date: Sat, 27 Dec 2025 12:20:51 -0600
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
 <f5ef483b-12d8-4ed2-9637-af993c3f8b7d@baylibre.com>
 <DF974CHWQ5BL.MW4NYZU499S7@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DF974CHWQ5BL.MW4NYZU499S7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/27/25 12:04 PM, Kurt Borja wrote:
> On Tue Dec 23, 2025 at 12:23 PM -05, David Lechner wrote:
>> On 12/11/25 8:45 PM, Kurt Borja wrote:
>>> Add guard classes for iio_device_claim_*() conditional locks. This will
>>> aid drivers write safer and cleaner code when dealing with some common
>>> patterns.
>>>
>>

...

>>> + */
>>> +#define IIO_DEV_ACQUIRE_ERR(_var_ptr) \
>>> +	ACQUIRE_ERR(__priv__iio_dev_mode_lock_try_buffer, _var_ptr)
>>
>> There is no error code here, so calling it "ERR" seems wrong.
>> Maybe IIO_DEV_ACQUIRE_FAILED()?
> 
> Here I'd prefer to keep it as _ERR so users can make the immediate
> association. But I don't feel strongly about it.

I'm afraid I fail to make any association with _ERR() and something that
doesn't have an error code.

Is this about following the established pattern with ACQUIRE() and
ACQUIRE_ERR()? Usually, I am strongly in favor of following patterns
like this. But in this case, I just doesn't make logical sense.


