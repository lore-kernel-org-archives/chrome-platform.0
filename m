Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F5D2DA75C
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764869471; cv=none; b=KmIWnchPYHepb2GbNJfK21py36FScDq7GYigrm0Xv4PdzV04jTkw6m0QXT3V+fbJrPBPZ6LpqWJfnjaPMApE3YWsYYWpBHMDglirfP7+ZHWmst4BOcy/7Nhv5Rs0EPGj0VxzYJVArW+bOUd5mByZ2ndHChIJjaHkdD+v9vtHvLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764869471; c=relaxed/simple;
	bh=Esx9mFokG/UV+AY7kqpOxxAjdUm5ixVVhSJ6k0ZcV+I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DQ1zUeL1/2oVgvdvfeoOrBj2+ZQtQ/rr6jxqfWpd65H7KIi1KKIplHUGHVNDfCZeF+j2yQuUgnz/7CdoEx9qKpr9DJLnMcI77DZ8gRjR+qWqk0BM6tZ71ADefngfIyFUQe6OV7oyZWLhlK0QVU6T27e7HX8plHFBsxiaXmCumc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c608iy9j; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c608iy9j"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dbdb139b5bso1072157137.2
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 09:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764869469; x=1765474269; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vw+EvpNnPRJxP20IZuJNEAzYLUTff2US5yBiiE9zOkw=;
        b=c608iy9jEo4vcmpgK9mJaeorjdyN3P1CSzjNShw8PWumYqOgpTlqU6OYCpbkSp39jF
         gkkTMsKW3okgroqT8t4r9t0VqmFFE9Oka1b4wFxbd2YQsS3sWYdez1WTAILpuA5wSS7Z
         GWRG11WDVuE/HHR4RchKUY902jOhGg6ha6yQEs0HV24CMKQ1tSJsgPaq4bjVCtch6AvE
         lhqnGyOssRtbukiOPiTgog/+3ssxZoMcRaAp4h26q5GwxMTzLK8fLSefFMU+A4yvKUXz
         16LNn7W4mq2GB0iMPkw3UpE+fTgPRNxTZCftMl0fbpuc/3BGB4jipd1iAvYWKk9/a7MF
         dz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764869469; x=1765474269;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vw+EvpNnPRJxP20IZuJNEAzYLUTff2US5yBiiE9zOkw=;
        b=YBbpEWSdhRj9LH3bHTSV/jTWtp4C/YzYaJVmHO1KwsemaQQiE/FygK2reyqapEU7V5
         +K9iCbT+uj/IKk52vhPoOFat1Oe2yzWUqLNxSdlnIz4dQZVN+9NCQfkAJJygLMYlZDc4
         T9BbodK+mfySPJTJ9FbSm7uYFwcyxcUPTtC6X7sl/pq1CvwBi6D4HrNEzTqj/n6uTmF2
         HYqSKvw2q1n9I1tFmGMtNHEpo3P1P+S3Yf58lJRVktkN4K8C+z8QFdhhALYI6gSdupcL
         F+L8i5TIUtbXIs2R/Bkl/BA3X2Lqeum25Dbgu1HwstD/n7EW9G9RFAA7t3B6Jm0714ls
         GmEg==
X-Forwarded-Encrypted: i=1; AJvYcCV/pStzBaXcTRV+/PvtSGvIO+CuEohRExhzqzBvdK8PECGC56W4QZXg53YJs8TwpXBouE3Gk/iexbwDHJAj+sM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsFKkcQDqJHX5rLsg0ZN2ZsRUjMPKxYKg31LV2EFXvJbeBN8Gn
	ivCtFbzPIFeLIy0YqlXG469Wy43JdDpfzmFGnEhTPQ7eDXScm58KYnkb
X-Gm-Gg: ASbGncufol34H4UFpuQx0JPb7RIllwL5TaU5RHQzM/TWBm1aXUo7I3INxx153uA3JYp
	WD5y8amXtTQ+J5PV7zOlbNUaYgqKOUHS2PnQuXUPRKrmMBVsuTEnNON5+PKMzKWBYtE9CILfp2B
	JiYUCpftenuFUmUzKYEiSfz4xXSlyttbPsv90JIGkNDjPWgo7PGAEpeSXcqDI3skIBuwEwusmBA
	gGY7kVd3VJZSrhNLOwzBbFwjfK3xV6Br/Qp3IOgpBXDDXavcNzWC4T0KAGWiJz0mm4RhtADdIqk
	hKOqKges8gdgMfN9sheOniJnFvN/+OgIqJRbEYJhChdNFQuZrOBm0nX2hsoGgGf+mavnaNp+JAG
	FGDS8d7Vt3U4xBmRDx4Bw+it/8rm7mY7/tmNveK6NLdVBVx1Inp2OTeWlnI+U5efMTreeqLGCqg
	kRx2zTaQ==
X-Google-Smtp-Source: AGHT+IEQujdux4QraYp2XErML+qKO/H8lj6CXVbdb1YysmjPx5gDd7EVF0btGcmqCZdDMC/Z/LMbkw==
X-Received: by 2002:a05:6102:510e:b0:5db:e851:9395 with SMTP id ada2fe7eead31-5e50685ba09mr1439059137.7.1764869464743;
        Thu, 04 Dec 2025 09:31:04 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:7d4:54b1:c444:6f2f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e5107cbc30sm962080137.1.2025.12.04.09.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 09:31:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 12:31:02 -0500
Message-Id: <DEPM0E265UO3.7LAESKGRLBO9@gmail.com>
Cc: "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Guenter Roeck"
 <groeck@chromium.org>, "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH RFC 6/6] iio: light: opt4060: Use cleanup.h for IIO
 locks
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-6-b4a1fd639423@gmail.com>
 <17ac2fa9033104c3bf9260fbecc1c9a5b42fcbba.camel@gmail.com>
In-Reply-To: <17ac2fa9033104c3bf9260fbecc1c9a5b42fcbba.camel@gmail.com>

On Thu Dec 4, 2025 at 9:42 AM -05, Nuno S=C3=A1 wrote:
> On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote:
>> Simplify and drop "hacky" busy-waiting code in
>> opt4060_set_driver_state() by using guard().
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>> =C2=A0drivers/iio/light/opt4060.c | 52 +++++++++++++++------------------=
------------
>> =C2=A01 file changed, 17 insertions(+), 35 deletions(-)
>>=20
>> diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
>> index 500899d7bd62..903963606143 100644
>> --- a/drivers/iio/light/opt4060.c
>> +++ b/drivers/iio/light/opt4060.c
>> @@ -22,6 +22,7 @@
>> =C2=A0#include <linux/iio/trigger.h>
>> =C2=A0#include <linux/iio/trigger_consumer.h>
>> =C2=A0#include <linux/iio/triggered_buffer.h>
>> +#include <linux/cleanup.h>
>> =C2=A0
>> =C2=A0/* OPT4060 register set */
>> =C2=A0#define OPT4060_RED_MSB				0x00
>> @@ -302,41 +303,22 @@ static int opt4060_set_driver_state(struct iio_dev=
 *indio_dev,
>> =C2=A0				=C2=A0=C2=A0=C2=A0 bool continuous_irq)
>> =C2=A0{
>> =C2=A0	struct opt4060_chip *chip =3D iio_priv(indio_dev);
>> -	int ret =3D 0;
>> -any_mode_retry:
>> -	if (!iio_device_claim_buffer(indio_dev)) {
>> -		/*
>> -		 * This one is a *bit* hacky. If we cannot claim buffer mode,
>> -		 * then try direct mode so that we make sure things cannot
>> -		 * concurrently change. And we just keep trying until we get one
>> -		 * of the modes...
>> -		 */
>> -		if (!iio_device_claim_direct(indio_dev))
>> -			goto any_mode_retry;
>> -		/*
>> -		 * This path means that we managed to claim direct mode. In
>> -		 * this case the buffer isn't enabled and it's okay to leave
>> -		 * continuous mode for sampling and/or irq.
>> -		 */
>> -		ret =3D opt4060_set_state_common(chip, continuous_sampling,
>> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continuous_irq);
>> -		iio_device_release_direct(indio_dev);
>> -		return ret;
>> -	} else {
>> -		/*
>> -		 * This path means that we managed to claim buffer mode. In
>> -		 * this case the buffer is enabled and irq and sampling must go
>> -		 * to or remain continuous, but only if the trigger is from this
>> -		 * device.
>> -		 */
>> -		if (!iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
>> -			ret =3D opt4060_set_state_common(chip, true, true);
>> -		else
>> -			ret =3D opt4060_set_state_common(chip, continuous_sampling,
>> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continuous_irq);
>> -		iio_device_release_buffer(indio_dev);
>> -	}
>> -	return ret;
>> +
>> +	guard(iio_device_claim)(indio_dev);
>> +
>> +	/*
>> +	 * If we manage to claim buffer mode and we are using our own trigger,
>> +	 * IRQ and sampling must go to or remain continuous.
>> +	 */
>> +	if (iio_buffer_enabled(indio_dev) && iio_trigger_using_own(indio_dev))
>> +		return opt4060_set_state_common(chip, true, true);
>> +
>
> I think that if we are open coding lock(mlock) plus iio_buffer_enabled, t=
hen
> iio_device_claim kind of loses it's real meaning. To me
>
> guard(iio_device_claim)(indio_dev);
>
> it's basically iio_dev_lock

It is! That's why I think if we go down this route we should rename the
API as proposed in [1].

[1] https://lore.kernel.org/linux-iio/DEPLQT84HBAO.2GAY5BHP05HNL@gmail.com/


--=20
 ~ Kurt

