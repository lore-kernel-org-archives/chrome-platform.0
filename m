Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42CB2E8B78
	for <chrome-platform@lists.linux.dev>; Wed,  3 Dec 2025 22:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764801272; cv=none; b=YUI6PqlVyuUN2g2PZjJPV2j1JJFRKmqUqYH6LTAOpKSs/slesSHisUr7JJvhXs4wQzV/sU1Ku9JuRzduAMK5FbztN1cjSqrg3F0d2+gR0zNbXZEmSYHP2cYJYgiydiEDTKRJb6xrGkjYtnGMKT9LLk4vvMkCIXAj3ZiLD3hRwH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764801272; c=relaxed/simple;
	bh=/07xkVAcqDL/QXxGOp2VIISnCnUMjo992LbaycbyF1Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tNDJ+c7siQNo1hgXadvWpAZf0NoEndTDvxfky/4p2aZtyVHxlTZgc4btUPm0/DOazCT8gJWrmHJcprwq3W+E3Ai/LdK4Mt8N8wlxMLA+mIQfe9/vfN8h1UrFFB6Joz3EpjTvMxs4ll0UP7RzdMni3bD9UhzjoHFOXHZWxopzsJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xKNlCTI/; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xKNlCTI/"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7c78d30649aso256962a34.2
        for <chrome-platform@lists.linux.dev>; Wed, 03 Dec 2025 14:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764801265; x=1765406065; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q2H75vivePmNiSbClOgR1qDGAppUdLuzMaHX5kj/nKI=;
        b=xKNlCTI/OfWRPAnt88FZmOQwP9xEoGhFHdlt2hrezi6KhfA94/7sKFoeaOn5JvEA88
         yNE6OjKd4iZZvYgvo6WbP6+QtD9LB/M+gguNzUjopcXgCwQ1Diye24koJLCRe0CTgMPu
         YvsHy7uoLCvYJ+/96f70M/kUEPhD8eoWweQd5IAATUe6ayh0+L6UhP9e7fOoemV19qFL
         MKVo7K49jnRj7qu3KAishTJ3bHe1B/okr5UYOnS9TQhHxJKqw8f6RvLVYEwIJA1TC9HS
         wvu0vLzuDlriW7/yLQGqEJNBplp1kz2m3LXhDI5Np6jMWnYKWL1zcKD27GgM3FSLGHH4
         4d/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764801265; x=1765406065;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2H75vivePmNiSbClOgR1qDGAppUdLuzMaHX5kj/nKI=;
        b=O3iNPfRMXDgMvlz5gO7HO0/5P2sBiJ8np/cIEabJzFuMv2jEDtxZ8k3N25+mlLZVGB
         GzSnwlDFr3WPSHj/axfiURPm9sOhHOKwdevrZByFrY24bLAh/dsxHBPp6oZkYuAkbr//
         YYZXq/Nz/i8rGIJR3d66KLoWEBIp8o/jdzbTI4H1zXhMm/DC+/dP6Q6BhkP2XWyo7DwZ
         zxBcMjr0hAjjuC1ZsTP+Sc1V6qsbl/Bb7SRyyyjTQpx24/SneV7ETJeYFitZbzLT6tZ/
         9ozII0z3UIT14TM2P3N6JamaJXGezr8m9+BiFGzTWU38DtdZ2Y530GWRoZCXxiWBwk1K
         gRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKI9/GMhWRbNWaDaR9ky9hh+qM7IgF7ipbUVBTaj7qht8WA9u6pbSfkcKYgMuhQKiOOodXj48Y+kUzs2ZM97Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIpRiXvcK4N11fCKNlFzTbwe2bODEP612DKMdU0as3UyHZA2AQ
	vNRr0LxxGjG4JUOMDOMt9kn4X6snJ7+rX8fUAluRViHJZkSPv3l/E7b3Ah7t04Y2cZo=
X-Gm-Gg: ASbGncsH5aEDhMOkIKIfk4fzXSX1GIZz5H1+emIjbQCflf5DWXkklU+oRnF33OwZ9Kr
	pKEmva3Qo+ypVKaQ2ysEUVItdeHhwth6g1aE4vkmvEIDMD3x83R8wujgta6rNfNgYkxr9ViORTi
	U8Hw8sPWsakP1TLiTI4rNw28fX1NgIrpmpiCs9yB/6j8pmJvEjwWkLA2XDjqfuFKLf3kB7ncqqi
	ZxhonhAg6Ui67YsfP1NiP721ufaIe/Wr7/A6Hx6/eYHxe2NV2kP8C/OIWby4LIWHrwpt9O7CMuo
	xwYjWsPN/buGxLeSnswDRW34xaUiapoCzBloBpEPhDH+L+dhfvrEO+Bgk8COu0lJncTklp2L+Us
	koNZbWcJTqs6ZQXclLMUp73crYLniXX+uU+LwyAz1FK/FqRalwuba0hDrven5ve1m6ciYxE8D9B
	olzkUjGDoVNccTkvJY9w==
X-Google-Smtp-Source: AGHT+IGbcHHQkrZfx9IN8FAdZQ6QkvC9tupAFh9euM6v7Sh9VpGipy7oIXK+FQz5UHtlJPofC83IhQ==
X-Received: by 2002:a05:6830:44a0:b0:7c7:5d72:566c with SMTP id 46e09a7af769-7c94dae5ef2mr2435762a34.24.1764801265230;
        Wed, 03 Dec 2025 14:34:25 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:25f4:78dc:7b9e:e7a4? ([2600:8803:e7e4:500:25f4:78dc:7b9e:e7a4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90fe0f650sm9647459a34.23.2025.12.03.14.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 14:34:24 -0800 (PST)
Message-ID: <bf1c82f7-da25-47b6-846d-9f8427ee5790@baylibre.com>
Date: Wed, 3 Dec 2025 16:34:22 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] iio: core: Add cleanup.h support for
 iio_device_claim_*()
From: David Lechner <dlechner@baylibre.com>
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
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-3-b4a1fd639423@gmail.com>
 <3b80f8f3-c435-49f8-8c55-42568215bf0b@baylibre.com>
Content-Language: en-US
In-Reply-To: <3b80f8f3-c435-49f8-8c55-42568215bf0b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/3/25 3:50 PM, David Lechner wrote:
> On 12/3/25 1:18 PM, Kurt Borja wrote:
>> Add guard() and ACQUIRE() support for iio_device_claim_*() lock.
>>
>> This involves exporting iio_device_{claim, release}() wrappers to define
>> a general GUARD class, and then defining the _direct and _buffer
>> conditional ones.
> 
> Commit messages should say why we need this.
> 
> Also, this seems like two separate things. Adding a new claim/release pair
> and adding the conditional guard support to the existing ones. So perhaps
> better as two separate patches.
> 
>>
>> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/iio/industrialio-core.c | 12 ++++++++++++
>>  include/linux/iio/iio.h         | 20 ++++++++++++++++++++
>>  2 files changed, 32 insertions(+)
>>
>> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
>> index adf0142d0300..da090c993fe8 100644
>> --- a/drivers/iio/industrialio-core.c
>> +++ b/drivers/iio/industrialio-core.c
>> @@ -2171,6 +2171,18 @@ int __devm_iio_device_register(struct device *dev, struct iio_dev *indio_dev,
>>  }
>>  EXPORT_SYMBOL_GPL(__devm_iio_device_register);
>>  
>> +void __iio_device_claim(struct iio_dev *indio_dev)
>> +{
>> +	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
>> +}
>> +EXPORT_SYMBOL_GPL(__iio_device_claim);
>> +
>> +void __iio_device_release(struct iio_dev *indio_dev)
>> +{
>> +	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
>> +}
>> +EXPORT_SYMBOL_GPL(__iio_device_release);
>> +
>>  /**
>>   * __iio_device_claim_direct - Keep device in direct mode
>>   * @indio_dev:	the iio_dev associated with the device
>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>> index 27da9af67c47..472b13ec28d3 100644
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
>> @@ -661,9 +662,23 @@ void iio_device_unregister(struct iio_dev *indio_dev);
>>  int __devm_iio_device_register(struct device *dev, struct iio_dev *indio_dev,
>>  			       struct module *this_mod);
>>  int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
>> +void __iio_device_claim(struct iio_dev *indio_dev);
>> +void __iio_device_release(struct iio_dev *indio_dev);
>>  bool __iio_device_claim_direct(struct iio_dev *indio_dev);
>>  void __iio_device_release_direct(struct iio_dev *indio_dev);
>>  
>> +static inline void iio_device_claim(struct iio_dev *indio_dev)
>> +	__acquires(indio_dev)
>> +{
>> +	__iio_device_claim(indio_dev);
>> +}
>> +
>> +static inline void iio_device_release(struct iio_dev *indio_dev)
>> +	__releases(indio_dev)
>> +{
>> +	__iio_device_release(indio_dev);
>> +}
> 
> It was unfortunate that we had to drop "mode" from iio_device_claim_direct_mode()
> during the recent API change, but at least it is fairly obvious that "direct"
> is a mode. Here, dropping "mode" from the name hurts the understanding. These
> could also use some documentation comments to explain what these are for and
> when it is appropriate to use them. I had to really dig around the code to
> come to the understanding that these mean "don't allow switching modes until
> we release the claim".
> 
> I would call it something like iio_device_{claim,release}_current_mode().
> 
> 
>> +
>>  /*
>>   * Helper functions that allow claim and release of direct mode
>>   * in a fashion that doesn't generate many false positives from sparse.
>> @@ -690,6 +705,11 @@ static inline void iio_device_release_direct(struct iio_dev *indio_dev)
>>  bool iio_device_claim_buffer(struct iio_dev *indio_dev);
>>  void iio_device_release_buffer(struct iio_dev *indio_dev);
>>  
>> +DEFINE_GUARD(iio_device_claim, struct iio_dev *, iio_device_claim(_T),
>> +	     iio_device_release(_T));
>> +DEFINE_GUARD_COND(iio_device_claim, _buffer, iio_device_claim_buffer(_T));
>> +DEFINE_GUARD_COND(iio_device_claim, _direct, iio_device_claim_direct(_T));
>> +

When I made the comments about keeping "mode" in the name, I forgot
that DEFINE_GUARD_COND() only extends a DEFINE_GUARD(). So I understand
if we need to make names that fit a certain pattern rather than what
I suggested.

Still would be nice to have:

iio_device_claim_mode()
iio_device_claim_mode_direct()
iio_device_claim_mode_buffer()
iio_device_release_mode()

Just really annoying to rename iio_device_{claim,release}_direct()
everywhere since we just did that. We could keep both names around
for a while though to avoid the churn.

It also means that we should remove __iio_device_release_direct() and
iio_device_release_buffer_mode() to make it clear that there is only
a single "release" function used by all variants of "claim".

>>  extern const struct bus_type iio_bus_type;
>>  
>>  /**
>>
> 

