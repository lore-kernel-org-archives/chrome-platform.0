Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43886238C1B
	for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 18:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766858660; cv=none; b=Bam6REWx6m10vtPA0LfzpCjFxx0B3HiI2iOIbHUzJTh8mZ3aqP3g1L4B/vXXq4jUI2Ip2Q+qGWnfKQ2kT0aTe9IwtTtV6oPAOdJ3u0bUZy0JO1Q9Y13ZY5zvowvqNewXrwjiPNczFD9CS3UCIW0PHa12i9/jmxOF10P3cJEHxzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766858660; c=relaxed/simple;
	bh=lqrS/zjIYx40Yg8PlnjUuTxP3jx36eCAmsTfFvh4quo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=ZaAi/rO68qEJRk55fpN2kF3RL0ctpiMSyL0SGLIBUSWr9uZOjpV75BsQCLB1Pxgk6IcEyrnNLEVEKNazGLcn/vPVIiGesSnoKddwxXwsFqYfifqsLZSjAZZ5E2bj7WhRwGOUSatz0ysAlMjes4qMu+5p424oLBsGjcRy+oMVWZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+eGAqm5; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+eGAqm5"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-55e8c539b11so5611272e0c.2
        for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 10:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766858657; x=1767463457; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndiaKA3zHdfMjEHzp3S9OhQFlmAtLm0Pa+LsGTsnIAs=;
        b=L+eGAqm5rW18mf3Os6aCf9W4oE6FOk/Tsb88380BVv97S/TrNyIhEKCuPqRF0P3PZm
         xdQGTsTxuZxnq1+6KjHTyjoqDwkVCZadbs7Sk8gcFD5sgk9r+6K97U2aFZPK1kWKyLuk
         W7i8KRhiuCmIqLxQopdJn5sQS5+V8IHDZCtxNVV8+2BCsYWn/jJxQ9bIV/nAO/OndQJG
         wgSURik+9fPTf3OW6MFJqCTi7F6s6eaOD74sKsUUNYEx1OWivKwi4gheRMlibdFGiEcT
         c8SsZo+Xhute6wbXIHgoYIJouV9Xgbwr/Y8d+qsVfQaGVhxxGgb7msWVpQol0nC2/X+Y
         IJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766858657; x=1767463457;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndiaKA3zHdfMjEHzp3S9OhQFlmAtLm0Pa+LsGTsnIAs=;
        b=vbjrJlfNI6AI7mQ2yk4xCe0egZJtrGqyexF4qFg6qeBwPnsLCcnjqTpawzG4x9Lmwp
         zeNyYb5wwFi1y+mJywdx2xpjYOqsb2nYNN/x1cPdZwEiBI5Tr23v82O5iEPttSzEQF5+
         uCCnAdOpPgvuPF8W2AM7HtkcteoLuDS4PglXCJLoSV/McNNG4oUR/UuTppPeI8cZlXma
         K9dXCwd/040R071hzGl0J5x4Ak2xSamDl/K5Z8m3oB/dtpVbmWNDw6ezYyCuVK4QdO0Q
         EwBZG0m+MiaJcO0G+01rJsnTQwvZ7oRCL8i1v87fs0y0eZRyJBKN/39hq/yP6PelpFN1
         q+7A==
X-Forwarded-Encrypted: i=1; AJvYcCUXYx9IAcyNkaTY7wvBb4kpik9Rw+jPDhsQAhA9PVcVtKyLyPUqtzMmrLdNhg2R1CNNP/HcoN2y+iL+lwgTe6Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1C09R3uQq007luVHcOzGHIaLrvgOdoDOScbLC69Nt+2M0qVDf
	ArxbaD6wYmOq017TFGKmX8DYO3AZvH1Kn9u8cupJyPAvhQ4e6tBp9VGUleg9yA==
X-Gm-Gg: AY/fxX52Wn/ethDpDY5U4RZG8zuYEubruKddMB76VsuVBVPQlb59cEYZ1k8FvlSnUNe
	J/9Dw9FbZh7jrunIBJIVIcX4QE2nJJAQfagI6U0OJ+HzfrQCoLuyEzjSTPpIir9wa8kXjPwblRT
	hifGJ+m8SJP9t2QAimshX0G8prZDlobmFU9dZDi4j3Tw7C28Dn8LeVYUpZoPLGdgenLws7nFkx/
	ws5mfIkDSRaak9LsoypfQgEFdzthx0+Onq1FrRuw0Y5cGy1jALnpxfbvDNnJMm7u2cn+1rxQnHh
	2YbL6WsAiEcvTCuDV/Jpni73cglTjjdzj7b3qv4PvARcXrFmSEfTc4UTECdqJ1eSINLr2gSECBY
	0mjrO0uwu/dJhtwG+PnRxMl5jPFc7iaPkmO9lXAH9v67oYnYhAvBXDW/FW1lRylCA/xDb7zJsSR
	GoRQ==
X-Google-Smtp-Source: AGHT+IFMdahookWFrofSUU63LPPQg44mNjDOGme9X4c0o3pENxZxJbB959KtW1Yruxhnf1OpDcjZQA==
X-Received: by 2002:a05:6122:3c86:b0:554:b32c:6f76 with SMTP id 71dfb90a1353d-5615bebc60bmr7329206e0c.15.1766858657125;
        Sat, 27 Dec 2025 10:04:17 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d1665f2sm8376920e0c.21.2025.12.27.10.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 10:04:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Dec 2025 13:04:14 -0500
Message-Id: <DF974CHWQ5BL.MW4NYZU499S7@gmail.com>
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
Subject: Re: [PATCH v2 4/7] iio: core: Add cleanup.h support for
 iio_device_claim_*()
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
 <20251211-lock-impr-v2-4-6fb47bdaaf24@gmail.com>
 <f5ef483b-12d8-4ed2-9637-af993c3f8b7d@baylibre.com>
In-Reply-To: <f5ef483b-12d8-4ed2-9637-af993c3f8b7d@baylibre.com>

On Tue Dec 23, 2025 at 12:23 PM -05, David Lechner wrote:
> On 12/11/25 8:45 PM, Kurt Borja wrote:
>> Add guard classes for iio_device_claim_*() conditional locks. This will
>> aid drivers write safer and cleaner code when dealing with some common
>> patterns.
>>=20
>
>
>> These classes are not meant to be used directly by drivers (hence the
>> __priv__ prefix). Instead, documented wrapper macros are provided to
>> enforce the use of ACQUIRE() or guard() semantics and avoid the
>> problematic scoped guard.
>
> Would be useful to repeat this in a comment in the code.

Sure!

>
>>=20
>> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  include/linux/iio/iio.h | 83 ++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 83 insertions(+)
>>=20
>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>> index f8a7ef709210..c84853c7a37f 100644
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
>> @@ -739,6 +740,88 @@ static inline void iio_device_release_buffer_mode(s=
truct iio_dev *indio_dev)
>>  	__iio_dev_mode_unlock(indio_dev);
>>  }
>> =20
>> +DEFINE_GUARD(__priv__iio_dev_mode_lock, struct iio_dev *,
>> +	     __iio_dev_mode_lock(_T), __iio_dev_mode_unlock(_T));
>> +DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_buffer,
>> +		  iio_device_claim_buffer_mode(_T));
>> +DEFINE_GUARD_COND(__priv__iio_dev_mode_lock, _try_direct,
>> +		  iio_device_claim_direct(_T));
>> +
>> +/**
>> + * IIO_DEV_ACQUIRE_DIRECT_MODE(_dev, _var) - Tries to acquire the direc=
t mode
>> + *                                           lock with automatic releas=
e
>> + * @_dev: IIO device instance
>> + * @_var: Dummy variable identifier to store acquire result
>
> It's not a dummy if it does something. :-) (so we can drop that word)

That's true :).

>
> Also, I would call it _claim instead of _var to to match the example
> and encourage people to use the same name everywhere.
>
> And for that matter, we don't really need the leading underscores in eith=
er
> parameter since there are no name conflicts.

Ack.

...

>> +/**
>> + * IIO_DEV_ACQUIRE_ERR() - ACQUIRE_ERR() wrapper
>> + * @_var: Dummy variable passed to IIO_DEV_ACQUIRE_*_MODE()
>> + *
>> + * Return: true on success, false on error
>
> This could be clarified more. Based on the example, this sounds
> backwards.
>
> 	Returns: true if acquiring the mode failed, otherwise false.
>
>> + */
>> +#define IIO_DEV_ACQUIRE_ERR(_var_ptr) \
>> +	ACQUIRE_ERR(__priv__iio_dev_mode_lock_try_buffer, _var_ptr)
>
> There is no error code here, so calling it "ERR" seems wrong.
> Maybe IIO_DEV_ACQUIRE_FAILED()?

Here I'd prefer to keep it as _ERR so users can make the immediate
association. But I don't feel strongly about it.

>
>> +
>> +/**
>> + * IIO_DEV_GUARD_ANY_MODE - Acquires the mode lock with automatic relea=
se
>> + * @_dev: IIO device instance
>
> It would be helpful to explain more about the use case here and that this
> is used rarely.
>
> The point to get across is that it is used when we need to do something
> that doesn't depend on the current mode, but would be affected by a mode
> switch. So it guards against changing the mode without caring what the
> current mode is. If it is in buffer mode, it stays in buffer mode, otherw=
ise
> direct mode is claimed.

I'll add a comment on this.

>
>> + *
>> + * Acquires the mode lock with cleanup guard() semantics. It is usually=
 paired
>> + * with iio_buffer_enabled().
>> + *
>> + * This should *not* be used to protect internal driver state and it's =
use in
>> + * general is *strongly* discouraged. Use any of the IIO_DEV_ACQUIRE_*_=
MODE()
>> + * variants.
>
> Might as well add Context: here like the others.
>
>> + */
>> +#define IIO_DEV_GUARD_ANY_MODE(_dev) \
>
> Accordingly, I would be inclined to call it IIO_DEV_GUARD_CURRENT_MODE()

I like this better.

Thank you for your comments!

--=20
 ~ Kurt
