Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0625A1E32A2
	for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768749802; cv=none; b=Bgcey/x2anH2P2NME/dUf4UoVYlhxQQa5MjyxFCQSlBsSaP4HGhZtHEiuxg8PGHntltMQ7WSzeghDMb/Jp3btutoy0HRlzGMxCw568PasvFNmsd6An8bNRPRu+jq2FV12YVY/4RAnxnWCmYsueXEDuF8yMcrr4Torx9c4CQrSDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768749802; c=relaxed/simple;
	bh=oDCpgvsXM4z2bwqDfi9aak6qgcm1ME6wpQjZP0HqRiA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Iw6fyfgrI55vr/9+dfk3pjArMMGbig/4GsX4hB8cO9eL5ROms5cfdpmh2jvWB3MX75zvmj9gCd9agb7/lpKgMjA3bB3IDkJjN2GqvmjzYPQkKiMcOX0uhvipPpXzdnvq6d5ySLUk8lp5StzWAdE1Bt5NAVjIgBM76Llt7Yn4tuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrYi+JZc; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrYi+JZc"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-93f6bd3a8f4so1118373241.3
        for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 07:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768749799; x=1769354599; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3ZZgfPfki6qi1CLiANLanlgbVGTSpzfg25ShrKXaFI=;
        b=QrYi+JZcuu4U1MhT//nfcdpX8s3DdfqtDpBvIgTaHIX1//kIUR7GvVDGtoSOw8ZcjG
         EUZUgizMczP1U1xDe7PBLzwlWbnPCBWUmQm84E06VUO5n5NTzKxMrYF6YoPY2Eu4H2yZ
         lm+QEBYbJvfPhnpWHLrsg7Nqc7yusaPYGyxY6FhU9m2rcQAlr5FE0E7weLjypEl/GaVv
         jPK8DIXeGNWsRy5uZ6EByfb2f6GlYQNj2Pv8dWBoFWh50NAyqz5EWjeP74Smh9R8hW2T
         /xsC0GqsROhbz9dHTIjgEA3HkU2S5bd1Zr5MlYF2d6nBXarjsHR9b7yC2VPIeuvTCDWw
         WnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768749799; x=1769354599;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r3ZZgfPfki6qi1CLiANLanlgbVGTSpzfg25ShrKXaFI=;
        b=qzV7pz9lWivK4vAabN0FJUhZ+UW0RlA67/AlyLvFsst+VCjcpUFZj/LQAqHjvvoza4
         ToQkE11arjhRmwKvtSpVEODDyrDFIBYOl1q2S0hH1NAHs0z6mc8jyKBe8O41BKEWNT6Q
         n7pYx7FsIqKBoLj6LTm2bjV0KxXQC6odxixIp2m5aHB+vo3FD79jySY1yFQG8ZMdqZtZ
         tEbjkIBXh/pRqUWI9n3GPSCzWqcStbJlFwSkQ6oKHdp4E+DEP/9IGJdawMJJIPC1lzFm
         y4wIYfjm+Ge/oRirUn7a5xsRXAE+QHp06nqvansCGZuPPzaX5R2Y7AXloFt/hoDUUEgP
         7iSw==
X-Forwarded-Encrypted: i=1; AJvYcCVEW3MdC4NtBtR0vHPTm7TCdaJ0LeLqHQLX2Ttb8O8CM95hAsm9GvSCgcZOdXQY0YD3oT3ZNeqUPO73kX/9e6M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJSrUf6UK+4/HKinPSIKUl5Jod7xn3E3drj+i3+xUS73SlnbJF
	eP2mwm33kunGzQHTSlkDGMm4D9g9t179FFubQ6ofWoZmn5PCWfafhyhB
X-Gm-Gg: AY/fxX7E/sGWEDFN2SyaY/kDSEquaPbMSvPBqxOVoCAlji/cNC1dUMR2k6/Rfb1lwVx
	kowUGWcVHQmuniPF2vr4XIndfO5UT2ra08UXewJu/kL2xwbsnfy9LVDPxGWgWCE5A2LxWYmG90l
	d4v3LbWYPk2sSLoKiRQ9zL88cXC97ur5DJiATltc931G7Gxm5MCZBrZqCW8h92DR/eXyw6KGrC+
	QHFZSVcUD1Tm9Dtxz08BaXLk5sLQQJcy05Hb+Np12nOMet49vbHfnoXK1rG0ie0DbryqzzDBFwe
	i+2XVhUvuNRri/6JuK/17naNS7WndS0+sYhBQl5w3GEZ2Ly4PXFi3I1CifzY6wrRbEepKg4Y024
	8uUXxhmAI+kc7+lcP1WPRO91VlTHGXqoYar0n/X3Ri0vrTL8a6hMTR9s/rTnnw2SxFnhDjyxljS
	RbjT4H4AEm+pqB
X-Received: by 2002:a05:6102:dcb:b0:5db:3b75:a2aa with SMTP id ada2fe7eead31-5f1a701cbe2mr2430397137.18.1768749798940;
        Sun, 18 Jan 2026 07:23:18 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a69444f0sm2595579137.7.2026.01.18.07.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 07:23:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Jan 2026 10:23:10 -0500
Message-Id: <DFRTH0GI1UPO.12NSSABBNSRST@gmail.com>
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
Subject: Re: [PATCH v3 4/7] iio: core: Add cleanup.h support for
 iio_device_claim_*()
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
 <20260106-lock-impr-v3-4-1db909b192c0@gmail.com>
 <27cf1ec1-545b-4e44-8229-852f8bdae116@baylibre.com>
In-Reply-To: <27cf1ec1-545b-4e44-8229-852f8bdae116@baylibre.com>

On Fri Jan 16, 2026 at 5:03 PM -05, David Lechner wrote:
> On 1/6/26 2:06 AM, Kurt Borja wrote:
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
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  include/linux/iio/iio.h | 71 ++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 71 insertions(+)
>>=20
>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>> index d8af0456f966..c795f731f2d8 100644
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
>> @@ -740,6 +741,76 @@ static inline bool iio_device_try_claim_buffer_mode=
(struct iio_dev *indio_dev)
>>   */
>>  #define iio_device_release_buffer_mode(indio_dev) __iio_dev_mode_unlock=
(indio_dev)
>> =20
>> +/*
>> + * These classes are not meant to be used directly by drivers (hence th=
e
>> + * __priv__ prefix). Instead, documented wrapper macros are provided be=
llow to
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
>> + * IIO_DEV_ACQUIRE_DIRECT_MODE(_dev, _var) - Tries to acquire the direc=
t mode
>> + *                                           lock with automatic releas=
e
>
> I don't think it is usual to put the function parameters in the
> doc comment like this. They don't match the actual names anyway.

Hi David,

This format of kernel-doc applies to function-like macros too [1]. I'll
match the name of the variables though.

>
>> + * @dev: IIO device instance
>> + * @claim: Variable identifier to store acquire result
>> + *
>> + * Tries to acquire the direct mode lock with cleanup ACQUIRE() semanti=
cs and
>> + * automatically releases it at the end of the scope. It most be always=
 paired
>> + * with IIO_DEV_ACQUIRE_ERR(), for example::
>> + *
>> + *	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
>> + *	if (IIO_DEV_ACQUIRE_FAILED(&claim))
>> + *		return -EBUSY;
>> + *
>> + * ...or a more common scenario (notice scope the braces)::
>> + *
>> + *	switch() {
>> + *	case IIO_CHAN_INFO_RAW: {
>> + *		IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
>> + *		if (IIO_DEV_ACQUIRE_FAILED(&claim))
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
>> + * @claim_ptr: Pointer to the claim variable passed to IIO_DEV_ACQUIRE_=
*_MODE()
>> + *
>> + * Return: true if acquired the mode failed, otherwise false.
>> + */
>> +#define IIO_DEV_ACQUIRE_FAILED(claim_ptr) \
>> +	ACQUIRE_ERR(__priv__iio_dev_mode_lock_try_direct, claim_ptr)
>> +
>
> If we always have to add the & at the call site, could we just
> put that in the macro instead? Then the parameter would just be
> claim instead of claim_ptr.

I'll add this in the next revision.

[1] https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentatio=
n

--=20
Thanks,
 ~ Kurt

