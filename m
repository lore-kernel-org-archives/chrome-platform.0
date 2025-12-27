Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C5339A8
	for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766857904; cv=none; b=W7k1pmr/rqwovXT+2YxUTPkO/Rts/jWHqSbWgexSv/4oXMI8RYLuARZt23rzjSkhYWg2jZU9+3IPdhNyeTsK/AVGBlJEW4ed8QPE5yOVqcEyfd2UeO2HwZ7fUuxg0xdv+1S6YLH4S3XlJRxKxqHlbyrY3t6v95Ek0cTeYpxtLCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766857904; c=relaxed/simple;
	bh=Swu1AsoD2uKVKIsO16rFYanR9wkyI2Uyh69Ficn0+3k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eGOhiqxur0KGxa4Bxd9VieYM9yFNOv8HaQ1MqXQUVjtevEV2qyuX88RuR+/ZaTLNy0OfwajZ37MxN+ALDOOVaCDYeWE1fOOx4j/JL0kgs9wcVjnwZb4o+5PbcDUDmZTKAOAWXA3u9zprZ0CmctN+DQ+wKiS4auke15YCrIlD5Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDseG+ZL; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDseG+ZL"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso6634837137.1
        for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 09:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766857902; x=1767462702; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmFzJPPSFZ71FHxxZJBuKnxU6e6Q71MdYKBIZQXMAjs=;
        b=FDseG+ZLWfvZv+HNPgPa+Zrigro4Ae+vsOVtipNjHz1uyY/etEhPyaTEtCPSWNeeQN
         u1wB3E56mjK35oMdFLKaxEFnW3/ZGzzvQfcSqR+XTnxlF2G4A0oa/Ss2YMsOCCjZDKdD
         VWvxzWrymj3cLVw/aui7TTmCK+tFxo+PYuWjAZgo7k24cjLF7l+moeVbpdNaZoejFVBA
         Z9q6uray6VSsv1JgdjO1xXqTP7ZOC9DpuAidq0rWc/tll6Cg824WD0LcDbB5i5/Mbr8M
         9Y/1ulRXi91VbWP8KcXUkJpNUpZ5N6TXR4xKSIxpG+hed7NSZWnar90/qxoT5ynIpYC6
         lX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766857902; x=1767462702;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vmFzJPPSFZ71FHxxZJBuKnxU6e6Q71MdYKBIZQXMAjs=;
        b=DFg0GJJyj+7/o+Ph02u9nL46IW5vdZq/pkj3PQoqzu+VMekYv7oDJkJ+aRzi4NMkT2
         CmXYtAYjeiPiIhzfbQ11/AqAsVff/XtcZomZjfKE7CEnzI4F7MGSt/n6An5ltouGLmRZ
         ZFfuzsc469g6L6E4PCaCKVwfKtCIwjwzqEcb006Ae9YlcJ6B3kYYOoCZ3DdzCUKVWPZ1
         VwsYhzVgrpqI/FzaSUKhRm744biiSAcTSCUbfhG9F5crVjBhlVWigFCJvvvoEVaQa6CE
         9zvx1ggZgxk8X7VRDGpFtAzNQWDY8oPrl8zzo6OC88ZPoXqu+cMYmikAnpa2I14Ffa9J
         6ujg==
X-Forwarded-Encrypted: i=1; AJvYcCUF8Ygwl9WngQS/Pwkeoad+mbnBsDpWCbm+qLOllTM+VhlXJG0FAi+1jridMHKSmO+xCeMkw9XngzDX10aiIJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRt7B+RhFZgeFCjduHDag3YAAKInU5//74+ZHEVD9c95LH609i
	Ec8k1g9IoNhPahIzMqycwboWJu4kAi0Ou6UdSqXqw/ql1JAoyfo0vUF/
X-Gm-Gg: AY/fxX74kyAUPybgSle8lUSEDrhjQYBwhVMXRUdZafyTJx0W5YskcmgmEGcTSIC/NHi
	YJZuxN2gOwjNzNUGiC1tO6i8S+de9BzqXAvCHnnhnFQS1gH9EH0TV95a965oPm+w9tiRDCp4W0Y
	3QsrHpek7J/HChqp245jrlFbDBvTy0Z7psMPb5RN6L9fFk6kDuIL3OOUdEXIs33gajs7oiIXIww
	WD0yxcDXruy7euoBmnIoKvpt03AlTZvwNIdP2dBobWu5UXJ7GxVImfgwXkpE8w5wYeu0RwGRz1E
	w0ROUZgAWpvK9+dHtDUdLOgrWcNUFni+JzobWYrAV11prFOP5ra3SszSQIx6gaYj7OEbJopJz5Z
	IxBt2AbOCH96t6LseBngdp3tOOhhtbVKTxqVUcBCDwd7lIgk7PCr4pVkW4yeHPG9aBpsOkul/OU
	Su7g==
X-Google-Smtp-Source: AGHT+IGKy3LCwmWTq56Z8fUz0bj3S63XBFyo48A59tnEZ/yi1Ul7cN7lZGg0NVGTKJhH2jVih4glzw==
X-Received: by 2002:a05:6102:5113:b0:5d7:dddd:5709 with SMTP id ada2fe7eead31-5eb181a50e7mr8023956137.0.1766857902259;
        Sat, 27 Dec 2025 09:51:42 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1ac64f63sm8447665137.10.2025.12.27.09.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 09:51:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Dec 2025 12:51:39 -0500
Message-Id: <DF96UPJ1TKP2.2U8D76HGLPT09@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v2 1/7] iio: core: Add and export __iio_dev_mode_lock()
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
 <20251211-lock-impr-v2-1-6fb47bdaaf24@gmail.com>
 <92d07935-b2b5-4cf3-bd45-654d77cdc23b@baylibre.com>
In-Reply-To: <92d07935-b2b5-4cf3-bd45-654d77cdc23b@baylibre.com>

Hi David,

On Tue Dec 23, 2025 at 12:19 PM -05, David Lechner wrote:
> On 12/11/25 8:45 PM, Kurt Borja wrote:
>> Add infallible wrappers around the internal IIO mode lock.
>
> Not sure what "infallible" is supposed to mean in this context. Maybe
> referring to autocleanup?

I meant wrappers that do not fail i.e. return void. Should I word it
differently?

>
>>=20
>> As mentioned in the documentation, this is not meant to be used by
>> drivers, instead this will aid in the eventual addition of cleanup
>> classes around conditional locks.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/iio/industrialio-core.c | 30 ++++++++++++++++++++++++++++++
>>  include/linux/iio/iio.h         |  3 +++
>>  2 files changed, 33 insertions(+)
>>=20
>> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-=
core.c
>> index f69deefcfb6f..1cce2d1ecef1 100644
>> --- a/drivers/iio/industrialio-core.c
>> +++ b/drivers/iio/industrialio-core.c
>> @@ -2171,6 +2171,36 @@ int __devm_iio_device_register(struct device *dev=
, struct iio_dev *indio_dev,
>>  }
>>  EXPORT_SYMBOL_GPL(__devm_iio_device_register);
>> =20
>> +/**
>> + * __iio_dev_mode_lock - Locks the current IIO device mode
>> + * @indio_dev: the iio_dev associated with the device
>> + *
>> + * If the device is either in direct or buffer mode, it's guaranteed to=
 stay
>> + * that way until __iio_dev_mode_unlock() is called.
>> + *
>> + * This function is not meant to be used directly by drivers to protect=
 internal
>> + * state, a driver should have it's own mechanisms for that matter.
>> + *
>> + * There are very few cases where a driver actually needs to lock any m=
ode. It's
>> + * *strongly* recommended to use iio_device_claim_direct() or
>
> I wouldn't even say "strongly recommend". Just say "use these instead".
>
> In the exceptions, likely the autocleanup version should be used as is
> the case currently.

Sure!

--=20
 ~ Kurt
