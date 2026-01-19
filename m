Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CF72475E3
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 19:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768851064; cv=none; b=pduo6BFvq1RFgydp7qC1TU99QcgdO0O+QXEiERdSyy+fNzFSDQcMJsrKt0ECuCEMRIwIMjVLOdN1imIrRgd+wIKdVH8+h5PwgVm8whzQ14TUW/Hw8NLaR/HHI4G9jbRrVYO6nwsP/YXO5c4BKDmTO1L6QK3FsMpFdI48K/9Rthk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768851064; c=relaxed/simple;
	bh=8ekbjBw6M/rsnNmO/cbzayaTuonKM33h9jOjhxZad3M=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Id6DUKrvlmsXRCGRCLN1lz78VcdGeOrY7MbGgWr4YTuK3scarkIE+8I011xVWj3xJ0veqlVKc9fsvQulUt8oY3KZNMPvCSFsGSfjt/TiIILUOvULhVSMcYZAisFaWyQwhqWOGvauuJblJMV1yGlWN9ZQJUs/n5zvuTCs+uw+eNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQrPj6nX; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQrPj6nX"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56379cb870bso1240645e0c.2
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 11:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768851062; x=1769455862; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSI/mMQ05DiSZvf3TBwxj/Af+SeoSoRBsI8Y3/TAqgo=;
        b=nQrPj6nXj1P280Mihy9VgL/opQEvzP4KssK1MN1hNGu0IoFVA+ml7PVCMZNYdqGttJ
         RZDEjmpc2VbXul0kBknsVfeZk/d7GX0z28hYDOSu3IVTCWoxkX3tZ/59TGOl7qRZ9apn
         85BxLkCxXMmq3JY3tIPIkieAvdMaHY64CdDq9EZg7RmAs9BrV+/WDFlaoUSu1nmieQ+X
         oUKBZVFEvDohYFnxVe0dbCdXXC/hlAZuLwdUZu1op0nhF8didQs+XZo8vFV6rkufa5Qz
         tHlXkqkgMgOR+Ak3XLECPIJMW44Y5TiB+Z/Gevl2kpNzQTUjwpRLYHwQHSzk65G2bzF2
         J+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768851062; x=1769455862;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSI/mMQ05DiSZvf3TBwxj/Af+SeoSoRBsI8Y3/TAqgo=;
        b=Pk+PmXfgLwjvsxBkh3ZtONl1bk18VOvqdcEPc/WuoVzqUiIdtDt/sPgl2X0Xnx3VaB
         PTSnmUAyeiM54koOqfzQpoKebd+0DFdix4kZVdoywvhLuLCy48Kc7a8fjxh/VhA23d2s
         sq+zVCBI5LbfzCfQnSBiovVMLuBlXJEepBpdda2dvVi1An2AK3rtrlXkruwCsyh4ozx0
         ppcWHBoDkxFfjsGFwy/BTzzeMQ3ALY/Y9eiqPZIPoi9rQjpNUJd986Jq/TBXBDmYrMnn
         mtF5+8QV+4lMJ9UjLdAqVAxW4qfUJlv/IQczMcR2T6G4CC8qqh0PSKBC9x//kyEsajkL
         Y3aw==
X-Forwarded-Encrypted: i=1; AJvYcCWmeJeNbdNT9iMJwV2sLnXSxLGe0gUW2oHu39FzXFsxAZiZKyMdGLauRmVuVan99FzizaMSa7OKp2iCUQ7nW2A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9GlXdXcuozWksImTcPDzMyL0N6Yq6UVqn03knBrjjJytkjRKF
	6yeizeNeUUiZD62h3+IoCXkwrLvW7AX6WLdvLfTnyrSVI5yRi+XZzH/I
X-Gm-Gg: AY/fxX5rRz758tOiclc4pKmTVIDzaYK7s21/uzAH/4AjamXbAs4f/8GFLOGNrFp5KLp
	SO8q/Q6IS5aeUhynXBuBvsY561qAez0n95EBxK964c/ASdb8HN1M9qa6Ek5WII2HP+LLPqRVLHU
	RV5hHJmTK6KRnG+Z1yD9TvXHjMytxF0kDRHAjEYMV8uQLeU60gPtzzAaMDDu+nh1q7d144Z0mbl
	TmKtbzVY0lTpdBqBOtMs8EHkxJ8r/YGokmDdfryBhEuH66IJjl2YgTt3ULI16WZ48rdLovqkm9u
	/IMcsiRet5s1VsHMEtWm5y0dA3izRAUL5haRTndngvgL4CsnkaSMr/Gp+pXGH7DLztzrjZZPpBZ
	FSwVMk63cSBml6DFj+hDj9kMVwf1+pVym9El7pBkVRZ7+hDIr/mgChoZXaoOy6xCWYLoRElwOTV
	lSlw==
X-Received: by 2002:a05:6122:7c8:b0:54a:1e96:e958 with SMTP id 71dfb90a1353d-563b5a79b75mr3945356e0c.0.1768851061928;
        Mon, 19 Jan 2026 11:31:01 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b70fea8csm2984342e0c.15.2026.01.19.11.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:31:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 14:30:53 -0500
Message-Id: <DFSTD80YOO0Y.1LLCJGT3GW0S3@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v4 4/7] iio: core: Add cleanup.h support for
 iio_device_claim_*()
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260118-lock-impr-v4-0-6c8d0aee8ed2@gmail.com>
 <20260118-lock-impr-v4-4-6c8d0aee8ed2@gmail.com>
 <fef660dc-8c81-420c-95b6-cc8649971894@baylibre.com>
In-Reply-To: <fef660dc-8c81-420c-95b6-cc8649971894@baylibre.com>

On Sun Jan 18, 2026 at 2:35 PM -05, David Lechner wrote:
> On 1/18/26 9:44 AM, Kurt Borja wrote:
>> Add guard classes for iio_device_claim_*() conditional locks. This will
>> aid drivers write safer and cleaner code when dealing with some common
>> patterns.
>>=20
>> These classes are not meant to be used directly by drivers (hence the
>> __priv__ prefix). Instead, documented wrapper macros are provided to
>> enforce the use of ACQUIRE() or guard() semantics and avoid the
>> problematic scoped guard.
>>=20
>> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>> Reviewed-by: David Lechner <dlechner@baylibre.com>
>> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  include/linux/iio/iio.h | 65 ++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 65 insertions(+)
>>=20
>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>> index fa671e120e95..4a0a77fcfa8d 100644
>> --- a/include/linux/iio/iio.h
>> +++ b/include/linux/iio/iio.h
>> @@ -10,6 +10,7 @@
>>  #include <linux/align.h>
>>  #include <linux/device.h>
>>  #include <linux/cdev.h>
>> +#include <linux/cleanup.h>
>>  #include <linux/compiler_types.h>
>>  #include <linux/minmax.h>
>>  #include <linux/slab.h>
>> @@ -740,6 +741,70 @@ static inline bool iio_device_try_claim_buffer_mode=
(struct iio_dev *indio_dev)
>>   */
>>  #define iio_device_release_buffer_mode(indio_dev) __iio_dev_mode_unlock=
(indio_dev)
>> =20
>> +/*
>> + * These classes are not meant to be used directly by drivers (hence th=
e
>> + * __priv__ prefix). Instead, documented wrapper macros are provided be=
low to
>> + * enforce the use of ACQUIRE() or guard() semantics and avoid the prob=
lematic
>> + * scoped guard variants.
>> + */
>> +DEFINE_GUARD(__priv__iio_dev_mode_lock, struct iio_dev *,
>> +	     __iio_dev_mode_lock(_T), __iio_dev_mode_unlock(_T));
>> +DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_direct,
>> +		  iio_device_claim_direct(_T));
>> +
>> +/**
>> + * IIO_DEV_ACQUIRE_DIRECT_MODE(dev, var) - Tries to acquire the direct =
mode
>> + *					   lock with automatic release
>
> Should be just IIO_DEV_ACQUIRE_DIRECT_MODE()
>
>> + * @dev: IIO device instance
>> + * @claim: Variable identifier to store acquire result
>> + *
>> + * Tries to acquire the direct mode lock with cleanup ACQUIRE() semanti=
cs and
>> + * automatically releases it at the end of the scope. It most be always=
 paired
>> + * with IIO_DEV_ACQUIRE_ERR(), for example (notice the scope braces)::
>> + *
>> + *	switch() {
>> + *	case IIO_CHAN_INFO_RAW: {
>> + *		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
>> + *		if (IIO_DEV_ACQUIRE_FAILED(claim))
>> + *			return -EBUSY;
>> + *
>> + *		...
>> + *	}
>> + *	case IIO_CHAN_INFO_SCALE:
>> + *		...
>> + *	...
>> + *	}
>> + *
>> + * Context: Can sleep
>> + */
>> +#define IIO_DEV_ACQUIRE_DIRECT_MODE(dev, claim) \
>> +	ACQUIRE(__priv__iio_dev_mode_lock_try_direct, claim)(dev)
>> +
>> +/**
>> + * IIO_DEV_ACQUIRE_FAILED() - ACQUIRE_ERR() wrapper
>
> This one is correct style.
>
>> + * @claim: The claim variable passed to IIO_DEV_ACQUIRE_*_MODE()
>> + *
>> + * Return: true if failed to acquire the mode, otherwise false.
>> + */
>> +#define IIO_DEV_ACQUIRE_FAILED(claim) \
>> +	ACQUIRE_ERR(__priv__iio_dev_mode_lock_try_direct, &(claim))
>> +
>> +/**
>> + * IIO_DEV_GUARD_CURRENT_MODE - Acquires the mode lock with automatic r=
elease
>
> Missing ()

Hi David,

I didn't see what you meant in the previous email. Sorry! I'll correct
it.

--=20
Thanks,
 ~ Kurt
