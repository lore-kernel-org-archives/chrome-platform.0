Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B22A2D1F5E
	for <chrome-platform@lists.linux.dev>; Wed,  3 Dec 2025 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798648; cv=none; b=j/BGKKFLsk0y83bPqqk0pFUyVBToZ8gcebim68rZgMZW3ROyt/KzeBdJ+pv4Zqq+w5fvJM8V2Ol3LtGD49efqeNM1Pc9FUsKc6aA+djyGu8YAe7DW5n/4CBkiUZ/NCrhU7zfW7TmTktMxxRgwE6BPxDAahPqh8ixSVk5RSbsNQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798648; c=relaxed/simple;
	bh=ZXM2nfJu5oJwY2GOEZGATNrTU2G/aWMWHGcN8Dki1p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBFFthkQv96lpuAS70l1Vg03GPLsFXtbPYyay66eywUBZLOVylJbQP3lWTrhyY4qe1VnqKG7Sp6bH1enwwMaiW1k9772Gfq8r3Az3N8edpoIKIvuDdRV5Np75z9knTo7ZmhmThi9ZVM59usCiVgQeLhsrCwOXa+nETqdkKSKDqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CVH9+KOo; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CVH9+KOo"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7c7613db390so147073a34.2
        for <chrome-platform@lists.linux.dev>; Wed, 03 Dec 2025 13:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764798645; x=1765403445; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOXwn281er3xrUTkTtRg7swbv+pAMR6MbFqtuUChdDQ=;
        b=CVH9+KOoQKIgREGKTytL2mAOGmfJ99xXHXBlPXxGhGVRqU2fkygX4QTDhN+bK2Ss04
         dxPBxPxmJBHnyr0UDyJULZYNxlEimjlwvVwDjy2Aa733bxH2o45fHF3uXBnBwTq6G2Sz
         EgRY3k6T5iNtqAHdIRerqujniGElDxXsaIaFo2VeBWQ9TlWs69mtuQUCDZQgpbA4aAX+
         3cXdDac3V9yf2wTw7wMufE0B92OpPVWIbCi7yiwHmiRrejib9dHnwnBWwJZ4jFgWHFLX
         OBcWDqb9xtYjPYoUQIoe1PBp5eFF+a+hoxbGsG9wWFFVJU2CLsz+yzDSi+zGvLBBKAdG
         2zAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764798645; x=1765403445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOXwn281er3xrUTkTtRg7swbv+pAMR6MbFqtuUChdDQ=;
        b=p+1BFUG0r5eV3e4e8i0R4cN7LiwVNu25ke1DmxVO+fcXDwLvsCt01/TTB4waoUUpgP
         ZS+dylycIP+Q8Fbr0zR0EcRCWYFq6HWRxekveurBpo5ulmiux2WFpq46urZ8O2VJdYR1
         d1mumceacst1dB0LfpEXG3WHD5f157XZnaUPZHD18R9xGe/togp9nuytZFLTgq5a9tb5
         /J+ZjUNHhAQLqeRxYiiJ02zhG3X2l4BZ9KB/vOhelsw/U70bR9gZ82SM2EW85Lp3+n3p
         wE3ammut/YMHCtfWtmvixs74A/db2K5Jdjgz582lw5yIZTgLPogRNH5ZLkT+mcOHfaZu
         ucHA==
X-Forwarded-Encrypted: i=1; AJvYcCUOp6v+RrtaG+drywvlwqE03B3ehjTw5yGmmpGrIHaDoA/f8aJ9KNQCh3qvjhh4N++5cEFY5cTAUEv78fkr9AI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ2+h6Ik9/VB7XH99QTPzrBPLSAnOzG6Aay2M07wK5Ovhzz+Z1
	o3s9k0D7dIl4toRsLajV36wjIKVsRGXW48d11lZAKq+3OQTXN9I9u4EDcnyAtrTJl7rwWCB1nok
	WXrto
X-Gm-Gg: ASbGncsRJ++EC58nfSjsgFywjjapxKCYq2vRCGRCzdi1s31naVSRfhKUn2RqNscY2Sg
	lmcAl/zNo7R9ZdHQtZHLLKuIXGCL2047j9g9uMzq3thiua/TJSjxnVZ/S9UoFH9hBZ46fOXHeSN
	Q75OgdtVqIMe4QhWfNeiHCLExF+L4prFNlWD2QPJidKbvk4xiefm7gCSvQY0kZlmk+0TSBvH6fD
	ovm5nrIBhCEiPe02LuYs123e/QChfJZzbcbGm3LJVJXQbnbTfAZdhCRRzdoFbptJT9NoeCbu0h2
	U2wRvSeQ82XlGpX7j9UT4FICiApvi0vBBI6Iyj9n8ijizH9hdW+mD5oP0tIEH8GwukzmQgJqft5
	sOWHV2vbPNwr8qM9XnBoCfXbNEaBOkmi5RlbPKk7VyCSIdsZd9W98diDPVAtydPeV0LjmaMmirV
	4crSG6IIkDdWc62Po=
X-Google-Smtp-Source: AGHT+IGUpwPWULKfwpJt6xdvUQml+OeY2AizRJFVIHBX8/UQQAjzB4wdDPV7yTsLxrebEUH9T57tUg==
X-Received: by 2002:a05:6830:919:b0:7c7:66f7:2caf with SMTP id 46e09a7af769-7c94dab06dbmr2589753a34.10.1764798645378;
        Wed, 03 Dec 2025 13:50:45 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:6b05:aad2:5053:6d1? ([2600:8803:e7e4:500:6b05:aad2:5053:6d1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90f640e61sm9472724a34.13.2025.12.03.13.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 13:50:45 -0800 (PST)
Message-ID: <3b80f8f3-c435-49f8-8c55-42568215bf0b@baylibre.com>
Date: Wed, 3 Dec 2025 15:50:43 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] iio: core: Add cleanup.h support for
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
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-3-b4a1fd639423@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251203-lock-impr-v1-3-b4a1fd639423@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/3/25 1:18 PM, Kurt Borja wrote:
> Add guard() and ACQUIRE() support for iio_device_claim_*() lock.
> 
> This involves exporting iio_device_{claim, release}() wrappers to define
> a general GUARD class, and then defining the _direct and _buffer
> conditional ones.

Commit messages should say why we need this.

Also, this seems like two separate things. Adding a new claim/release pair
and adding the conditional guard support to the existing ones. So perhaps
better as two separate patches.

> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/iio/industrialio-core.c | 12 ++++++++++++
>  include/linux/iio/iio.h         | 20 ++++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index adf0142d0300..da090c993fe8 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -2171,6 +2171,18 @@ int __devm_iio_device_register(struct device *dev, struct iio_dev *indio_dev,
>  }
>  EXPORT_SYMBOL_GPL(__devm_iio_device_register);
>  
> +void __iio_device_claim(struct iio_dev *indio_dev)
> +{
> +	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
> +}
> +EXPORT_SYMBOL_GPL(__iio_device_claim);
> +
> +void __iio_device_release(struct iio_dev *indio_dev)
> +{
> +	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
> +}
> +EXPORT_SYMBOL_GPL(__iio_device_release);
> +
>  /**
>   * __iio_device_claim_direct - Keep device in direct mode
>   * @indio_dev:	the iio_dev associated with the device
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 27da9af67c47..472b13ec28d3 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -10,6 +10,7 @@
>  #include <linux/align.h>
>  #include <linux/device.h>
>  #include <linux/cdev.h>
> +#include <linux/cleanup.h>
>  #include <linux/compiler_types.h>
>  #include <linux/minmax.h>
>  #include <linux/slab.h>
> @@ -661,9 +662,23 @@ void iio_device_unregister(struct iio_dev *indio_dev);
>  int __devm_iio_device_register(struct device *dev, struct iio_dev *indio_dev,
>  			       struct module *this_mod);
>  int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
> +void __iio_device_claim(struct iio_dev *indio_dev);
> +void __iio_device_release(struct iio_dev *indio_dev);
>  bool __iio_device_claim_direct(struct iio_dev *indio_dev);
>  void __iio_device_release_direct(struct iio_dev *indio_dev);
>  
> +static inline void iio_device_claim(struct iio_dev *indio_dev)
> +	__acquires(indio_dev)
> +{
> +	__iio_device_claim(indio_dev);
> +}
> +
> +static inline void iio_device_release(struct iio_dev *indio_dev)
> +	__releases(indio_dev)
> +{
> +	__iio_device_release(indio_dev);
> +}

It was unfortunate that we had to drop "mode" from iio_device_claim_direct_mode()
during the recent API change, but at least it is fairly obvious that "direct"
is a mode. Here, dropping "mode" from the name hurts the understanding. These
could also use some documentation comments to explain what these are for and
when it is appropriate to use them. I had to really dig around the code to
come to the understanding that these mean "don't allow switching modes until
we release the claim".

I would call it something like iio_device_{claim,release}_current_mode().


> +
>  /*
>   * Helper functions that allow claim and release of direct mode
>   * in a fashion that doesn't generate many false positives from sparse.
> @@ -690,6 +705,11 @@ static inline void iio_device_release_direct(struct iio_dev *indio_dev)
>  bool iio_device_claim_buffer(struct iio_dev *indio_dev);
>  void iio_device_release_buffer(struct iio_dev *indio_dev);
>  
> +DEFINE_GUARD(iio_device_claim, struct iio_dev *, iio_device_claim(_T),
> +	     iio_device_release(_T));
> +DEFINE_GUARD_COND(iio_device_claim, _buffer, iio_device_claim_buffer(_T));
> +DEFINE_GUARD_COND(iio_device_claim, _direct, iio_device_claim_direct(_T));
> +
>  extern const struct bus_type iio_bus_type;
>  
>  /**
> 

