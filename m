Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66282FFDED
	for <chrome-platform@lists.linux.dev>; Wed,  3 Dec 2025 21:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798767; cv=none; b=HauL8djkopWbrzi/5iuLptLMSAVwmModdW/kijIqOq4ou56m8+tnjIxqoSLJouVKzta4cK6Ynmukvvyf8YMplKNj40RCWS2r5aI06fKrxRWY4u1B9gOsnxNPRXDT/CIm5aA48tjQ39PrbzpOxaIRG+9SDaDT0X7PaS+AjcFytNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798767; c=relaxed/simple;
	bh=tPRF1CoqHq1bSZSieR8xUCGzT7F+QflgTBv5IcMCgnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwpMc0KQHlMElSK4KYgRJvvixTJsNI0psYyaWKYcMU8gMkyOfzzSEbe1edPlV4eDF7g6VTyogF8Yo/Bcj5E7kvtcK6TW1ZrYz7RCrq4Lj7CTiHyNhOoOEzMLudkcOaGAxMZmWuwCaOCsGOr4Sx1FMriZ4qFnMNAWRjW2OSTtAR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Mg9HQFvF; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Mg9HQFvF"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3ec6c10a295so143216fac.0
        for <chrome-platform@lists.linux.dev>; Wed, 03 Dec 2025 13:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764798765; x=1765403565; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RX9QHP9FjIBUfnr75g5SgMGg3GzUgvduhpBKi7K+O98=;
        b=Mg9HQFvF9dlRqO9lGOmIedNchHAQrZteh4BURfoUK5kLZhACHz8YUK+KAeKYYQ+TlV
         xi1CEy7aMLMm/C3z8r7c8wpJf5rtKjTVW7n3Nj8KdOdtepzldsOA0MboGshGWLf1vN9m
         muHVQ9dQXfMsyWnpvlQx9CbIImbU+FyURXF201SKZhMhaFi1kgknGGpM/lC6xDq5lgqY
         zu4lBOPACjUqJ8Wyf6UjExpAu4f/VNOTUT+/j/OPckSVysCYLr8NL4+UFyYico2SUNBf
         lQa1chCEGCtcUxOlF+KAGO8pJnrJZh/IMCqzDggBHpea6Eg2cJrPjqq/8GkJ/qAXj9+6
         MfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764798765; x=1765403565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RX9QHP9FjIBUfnr75g5SgMGg3GzUgvduhpBKi7K+O98=;
        b=E5P1zeWSFiqjn2S1L0GLeJWM83TOAU0eTrxiYqEg0TSRR61Ns1+WVxe3dA/rnLEzFM
         iWusxAc8xFChQ5GA66+5UK2J3yDYKfHuJSSNQYH3Wk0+Xh3IcZEf+IrSTOg8ib/jXjqq
         irEjgZ/L/p1UYbHttqGfS7ssV5WCDxQjJc0gxSoPuQevKG4UF13yTm6kqmDEu5k6TWG4
         EyhrE29gBUD6OmnaGC4LwJ6x43515hMuwgOm5d/q4IQlEmQHRTk2SoXrlDx5R994FAx+
         3i9YCeAXyZi70Sr93RMebzJzKXesCY8OQE+zTZpCI/jA7EsZB6XzYwIG1skOCsPTtK2v
         MqUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeA2uwnAwMwHPNT493lNHoIS2e0CMFLqb7ZDyRPrRUoGIVSaBL7AkM+cjD9lrSqe1Fu6YiqAQuPwQ7iEcHGe8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJBdIhmYTbViFQ0RxyAYjotUXL0O/EiSA5MSj8aRst/NNYXFU9
	5CR2qPjWwJpz7ey7POKj69PZCPlVC6IzNjl8/sDcygdwoaZDyC6cEW0TkRhXz5fxjPg=
X-Gm-Gg: ASbGncsCgGqhtZxhjr7+o7mGPxnkSNsT3J7OOI5WObV3eECviWv905BISPBLhl/2DPs
	ShgJv4lYfQkzWoMkyY8FpC6uSLY8n6rJtqv0O0k7/LHAWdqTe6ZUQrZNM1eo9Unc95/Hl8xGbQM
	+2OzXWzP+s6n0F1VtTC3EJs0wkFoeWUaJvsC9AaGTkACOhnwqW0JX8bGfu92LUWe9k7YSAzdcai
	Xh2/e1hLZEYu8KXS4qYRsg0AjFQnSUaJjnPEINqE/2E4uctdxxT7G8WRQbv9P8J3s61JJAY5mVj
	zJ6o/8Xk0yzzcLF3CsTc4Ri/DVeIlywUfONHjWtNt/60vzrhFVuaexHGaBh1EtpFEQur7iMAXdm
	srLcq85gRkwI654SqXCDO3RGTy+ZtFtL+yGhLTrAZChBsHcraf/u6AUfvuUrWNaW/uTeoSGVxHJ
	1Yv7cDFn+hC4pQluw=
X-Google-Smtp-Source: AGHT+IG4z+B6Xde3wmACpPEWATygFNAXQbVq9XSR6nn1XUJX6+en3XojkjV+aNxgDC8XciITQs627Q==
X-Received: by 2002:a05:6870:9e97:b0:36d:31f3:9f1c with SMTP id 586e51a60fabf-3f169257c8fmr2306690fac.14.1764798764709;
        Wed, 03 Dec 2025 13:52:44 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:6b05:aad2:5053:6d1? ([2600:8803:e7e4:500:6b05:aad2:5053:6d1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f0dca3ad8asm11031494fac.6.2025.12.03.13.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 13:52:44 -0800 (PST)
Message-ID: <f96694db-2ad5-46d3-a380-cba3eaa2de2f@baylibre.com>
Date: Wed, 3 Dec 2025 15:52:43 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] iio: health: max30102: Use cleanup.h for IIO
 locks
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
 <20251203-lock-impr-v1-5-b4a1fd639423@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251203-lock-impr-v1-5-b4a1fd639423@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/3/25 1:18 PM, Kurt Borja wrote:
> Simplify and drop "hacky" busy-waiting code in max30102_read_raw() by
> using scoped_guard().
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/iio/health/max30102.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
> index 678720102f2b..c642842cb5fb 100644
> --- a/drivers/iio/health/max30102.c
> +++ b/drivers/iio/health/max30102.c
> @@ -24,6 +24,7 @@
>  #include <linux/iio/iio.h>
>  #include <linux/iio/buffer.h>
>  #include <linux/iio/kfifo_buf.h>
> +#include <linux/cleanup.h>
>  
>  #define MAX30102_DRV_NAME	"max30102"
>  #define MAX30102_PART_NUMBER	0x15
> @@ -468,6 +469,7 @@ static int max30102_read_raw(struct iio_dev *indio_dev,
>  {
>  	struct max30102_data *data = iio_priv(indio_dev);
>  	int ret = -EINVAL;
> +	bool direct_en;
>  
>  	switch (mask) {
>  	case IIO_CHAN_INFO_RAW:
> @@ -475,25 +477,13 @@ static int max30102_read_raw(struct iio_dev *indio_dev,
>  		 * Temperature reading can only be acquired when not in
>  		 * shutdown; leave shutdown briefly when buffer not running
>  		 */
> -any_mode_retry:
> -		if (!iio_device_claim_buffer(indio_dev)) {
> -			/*
> -			 * This one is a *bit* hacky. If we cannot claim buffer
> -			 * mode, then try direct mode so that we make sure
> -			 * things cannot concurrently change. And we just keep
> -			 * trying until we get one of the modes...
> -			 */
> -			if (!iio_device_claim_direct(indio_dev))
> -				goto any_mode_retry;
> +		scoped_guard(iio_device_claim, indio_dev) {

scoped_guard() is sketchy in switch statements because there is
a hidden for loop. If someone came along later and put a break;
inside of the scope, it would break out of the hidden for loop
rather than the apparent switch case!

Besides that, it adds extra indent that we could avoid.

> +			direct_en = !iio_buffer_enabled(indio_dev);
>  
> -			ret = max30102_get_temp(data, val, true);
> -			iio_device_release_direct(indio_dev);
> -		} else {
> -			ret = max30102_get_temp(data, val, false);
> -			iio_device_release_buffer(indio_dev);
> +			ret = max30102_get_temp(data, val, direct_en);
> +			if (ret)
> +				return ret;
>  		}
> -		if (ret)
> -			return ret;
>  
>  		ret = IIO_VAL_INT;
>  		break;
> 

I would write the whole function like this:

static int max30102_read_raw(struct iio_dev *indio_dev,
			     struct iio_chan_spec const *chan,
			     int *val, int *val2, long mask)
{
	struct max30102_data *data = iio_priv(indio_dev);
	int ret;

	switch (mask) {
	case IIO_CHAN_INFO_RAW: {
		/*
		 * Temperature reading can only be acquired when not in
		 * shutdown; leave shutdown briefly when buffer not running
		 */
		guard(iio_device_claim)(indio_dev);
		ret = max30102_get_temp(data, val, !iio_buffer_enabled(indio_dev));
		if (ret)
			return ret;

		return IIO_VAL_INT;
	}
	case IIO_CHAN_INFO_SCALE:
		*val = 1000;  /* 62.5 */
		*val2 = 16;
		return IIO_VAL_FRACTIONAL;
	default:
		return -EINVAL;
	}
}

Could also simplify things further by moving the call to iio_buffer_enabled()
into max30102_get_temp().


