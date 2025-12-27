Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52E7321457
	for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 18:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766859878; cv=none; b=qfvcYcconf+Ov7vXCQx7kVw3TLx11UniEZZEx9ptEngzqKA9Zt03x1TiX+RsjqrEXxA/Stf/gvL0w0AL1WDgQjuxlRu4D0KK/JTo+dkoah4vqjGBxJtB0vxx1Z29s3CYughE6z1Q0rLt63oukzix5nCxsHoU5sR5TJAHeEB3D6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766859878; c=relaxed/simple;
	bh=qn1/KjlraYXzELC53+o2Hfshv5d2CDgEpi4rQ/uNbT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UMYiVURtQ1UUh3ZJrYdxnsSDwU+fB7LsFgH9kyJvsrlwe90/Cwk4fG8x7Ke211Pi/3cS8GyDearx+sG9ppiDXZTLXP6a2F5hP8Pw92evDJYRwaJjF5VlOCK2ad5BdkdqFYvfr6Vjmd1WACPUQo7CfL+bqmCjSY7HItXDrW0/rqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bZFq0phy; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bZFq0phy"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-65749fe614bso2208365eaf.1
        for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 10:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766859875; x=1767464675; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NyLfdTTGOfZ46h4QKpaWWdzrCy0NX0nm8plxK7Gnto=;
        b=bZFq0phyaFaL1lxSKMgIUJqI6UeJeNurU+jc3g32fFiRfm6l1zBrBbyr+ydukXbqsO
         1Ow5tINM4d4Xk7hxttI6jIiwaonppMPxVAtqs2mZDt196l4zPXsZXqOFgCsya5GiXMwX
         lHy8tuFj/S/bJcvw7IPeMIWjaAdNBMZPsXS4ZtnYfiPuA9p/NBD0WIoC9ZPJXWqBDC93
         /YM4Go02wtlURmoWmRsNe+JAXMypGuWx9cj36DCQt0t88QcjJNO8//Y1yuMZt8kp7B/h
         c0o+6ElKLWH6gxh7KthQrxhmD66Pq/GihXpYNlv5h+ajJgt2i4Uo3RQ2dKsG3RWKSk6s
         j2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766859875; x=1767464675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NyLfdTTGOfZ46h4QKpaWWdzrCy0NX0nm8plxK7Gnto=;
        b=vTxBla9CZ1Mx4L8lUHrmry1pCMbI5j9+RFtc3zkp/4BqXF5TzyofkF7VZ3grdx0tUK
         LXl16Z13JXQqFHyOKsM0WNT9r+4kcJE4ImCFIHO7Htw2e7SA1A15ZyvBAf1eQ+na+HCW
         6TN9EHl15poek7y+6QL4a5F/myk+fr3tsQr6vj96ra6MPXPj1p2vWFa5W426t0nqE4Y1
         gCFlBn4hcFyUgvMTgP7EUYoSvY1aJV00wMEBL+825zvsk0LHCj8ZVOwjDkuyctMqNsTB
         hpfLzW/MRTDv18VCTvvb7K+9eW095kUY2rFF/NxLHlOGcKbK6fe5+5fjvnOgSj8C8SY0
         vicQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIcZuTiooNPyFc21a4m7mv66Wqf3sUjE2mh5xbywiDlMgHnMAfhzRw85K0gKC4PLmEvv7HdqZ56AQlxmXlB3A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiYibRtpSugA0dHMX8S28p0gLskhXRjygdMJIGMbM4+hlwWkY5
	EcibW+REav67UmvTEAfBBERs5c5eTN5jXxIQ65h1yAAi8O9iLwt3KXhPHrNT1MM5zcs=
X-Gm-Gg: AY/fxX4o63VCth+BgWSDhUX08k40yaEph6EUn+MKa9+I5zXPlpIMPVWNjCF7iiHYQw4
	cIHFg11m8n/kA6Yeyi9uuRtlXeSD6YG77pAjJ5pXVJzoPRub6JUfcGZM5naFjLgpWuvBlaNET3s
	imoudU2rrN+vhMbOeqkLWndQycYQevzVqzGFcMCB3AKOnVnyksxQJFXoY2visTDW9wLxuA8ewGR
	lHhVlJwC1//kQP15nK51UKwj/29WyoFStyDXHTSu4euQcb6RJ3i9PW3ZHiPU6AOxNrCbWJw9x/U
	hGALzJ1Zvbisww+c0qyVykM0uqqdR1ZFo1xrHK11gl2Q2BqxtwG3+7X5TC/acMtIYdoDvn2f9lI
	AftW6YP7C9YdshpTwISEymZ0ZlkfJdlDiDvDOdyWfS45sNjtzisJdhpOzD1Zn3oYTDSNNa95IaU
	9cUprBI0xmbwR5b/nj8MDmoNRYFZU1kOwL+MnnG/MO/oVf7kdM2kuTIJ/Y/13R
X-Google-Smtp-Source: AGHT+IHW9W4FACWrecgndjl/f5nrAVrhz5eZoyqi7rwqFTdJ2qVjM+zFhAuRS2JHdnCzQs5l8E/oMA==
X-Received: by 2002:a05:6820:4301:b0:657:5da2:5f5d with SMTP id 006d021491bc7-65ea0345562mr7382265eaf.3.1766859875605;
        Sat, 27 Dec 2025 10:24:35 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:81b7:1177:37cc:3153? ([2600:8803:e7e4:500:81b7:1177:37cc:3153])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65d0f3f8807sm15949141eaf.3.2025.12.27.10.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 10:24:34 -0800 (PST)
Message-ID: <f1c1ca8d-7896-4ccd-b59b-8c6c1bf4fa66@baylibre.com>
Date: Sat, 27 Dec 2025 12:24:32 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] iio: core: Match iio_device_claim_*() semantics
 and implementation
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Benson Leung <bleung@chromium.org>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Shrikant Raskar <raskar.shree97@gmail.com>,
 Per-Daniel Olsson <perdaniel.olsson@axis.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Guenter Roeck <groeck@chromium.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
 <20251211-lock-impr-v2-3-6fb47bdaaf24@gmail.com>
 <20251227144707.1bebcf27@jic23-huawei> <DF97CCMNGWVP.2JBZR7CQF1FID@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DF97CCMNGWVP.2JBZR7CQF1FID@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/27/25 12:14 PM, Kurt Borja wrote:
> On Sat Dec 27, 2025 at 9:47 AM -05, Jonathan Cameron wrote:
>> On Thu, 11 Dec 2025 21:45:21 -0500
>> Kurt Borja <kuurtb@gmail.com> wrote:
>>

...

>> Given earlier discussion about this one being rather more tricky
>> to name than the claim_direct because claim_buffer sounds like
>> we are grabbing the buffer, I'm not sure on the best naming to have
>> here. iio_device_claim_buffer_m maybe?  Ugly though and
>> these are super rare so maybe this isn't a particularly major
>> concern.
> 
> Yes, it's a bit ugly, but as I proposed in the cover letter, if we go
> for a full API rename, it shouldn't matter for now?
> 
> What do you think about that?
> 
> I'll go for iio_device_claim_buffer_m() if I can't think of something
> better.

iio_device_try_claim_buffer_mode()?

> 
>>
>> Given I think the people maintaining most out of tree drivers
>> are Analog Devices maybe this is a question Nuno can answer
>> for us?
> 

