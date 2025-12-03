Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAEA263C7F
	for <chrome-platform@lists.linux.dev>; Wed,  3 Dec 2025 22:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800347; cv=none; b=lPgrhxxCCXl1DbYzLbEwDJC+zbAathZEECNQiwlhTJbWfAqDyCym4XAhpkijulAjxLp3SJUg+CmDXFGYAiFNEBXeXsLzTr+GZ0Rei+2w7kh92ZW3YIX5mNmR2guP9ncblxtxXjohxwmDf/kcI9QY9V1KxCaE6H5bzI9J0tj9jFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800347; c=relaxed/simple;
	bh=/A8SutLmf2Q2imzqCQUE3XZdtGNiq13pGzvVdsPO5K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkhZgVzB5SMGA5e3Q7X0XKA2mANnOkp/v/QPXubVY72Oxfv3Df8vPdh9IV4daCS6Msc7x1HsFOa9Ao+Bon5WFzXcpRB3NYeI7y/54LYwoBlpBLjayzglffI5gx073dPaVYCJlNgeBUiknSlPQFzmdGFcIWBvrO0pCuFLexgYrJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lPIIToea; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lPIIToea"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7c6d3676455so148654a34.2
        for <chrome-platform@lists.linux.dev>; Wed, 03 Dec 2025 14:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764800343; x=1765405143; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hAPxaKKcC1USyEphOzVRjJP6Se/Bpb7jNM6YYf1MCzs=;
        b=lPIIToeaGT3pYRYHH6KuRZ6Ru9Uqc8iLWT8vlmStgSPzH9THTfVF7nuY4fRFOvpphF
         hWJW4cY3bR6S4kHyUHIBHEvpOEwLb69zg89iXxTNZ9zS4Iux5poOChIIX4vnP51D3ExS
         JQucoTKs/SlxbQtTg/b4RC66tAK0uQx8jura4PwW4+jS8VlK5/zT0DUh3CoM+2H9QGV9
         o2Ga92kKBTeetCwMiwvnGNaH2LU5nuYtHjLUZM1p3y6G1DiiMK4h2Ly1ynODuaf5Um/c
         8TIK9yHPsww+yyd5m4Prm0mfBo2RZZgzpFHJhGa/p8W9UvqbXftPEYhTMR+tVZS2Tj+b
         EZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764800343; x=1765405143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAPxaKKcC1USyEphOzVRjJP6Se/Bpb7jNM6YYf1MCzs=;
        b=bEv4koSQqIEZPCv6JPB4OIh1HRVc8ApdmF9bc9LdZIRRgi6PKXMH0JU9qpfyy47ENJ
         3SXw7GmUT0hIGtpjGVargU6bzwf7wzH2UbDHe1iEvI3DRZGOCB4bM+kTjS9f0ib72zkB
         gfbaibpYZwknGCMBDzvHImJt0zwBB5Rg1a6NWYP7yWHS6VMaGCRBvI13L32KlvOJlqkA
         H3lXYnKlpTPuDd2ofT8wREdy0yddzbqSCp0fNm0CJoDUwZnnvUT2Q5UrukPtmwfTjm9N
         m2OPyiLyD8cW+lwpSiwNWKI4A2OAwwB4zyNxKR9Wn45uNdqVmNOBgtD6FtQBZMjaHHmG
         nVGg==
X-Forwarded-Encrypted: i=1; AJvYcCUELB1GD4KIyVSHU4dV+wxPRk5+GZoc/wNYDNhVrldzKThoYYwch3GfvaAbK0HIGzbtRpZoK/echi1yxdzUYrs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzNNwN6+CfpazVNOwDBOIZ0Rie2m4EDx39HxfN64r93soz69vs
	5GdkLBnH9aNI/32g4FeNdbwEgDv100H0BnNMj+ayJ5717rsT90SkDsTvd+sLJs9S3qc=
X-Gm-Gg: ASbGncucfHQtl/Wx6xc/y8pICSIz1aUhuqTO0M1MdoYNvmDKd0VqNxLiD8gzQmdaPrQ
	s4A3y+9vqpyo9B5wnURuKORn6F8K5oTvCSFpfLPZOT3s1DEpwb6mr++FGC6oIz3zPqC5n+C2wum
	UAxS9tuVBOxlc6L3QIIHKO9zEN1vZte6P8mB+XYaoF6yLb8vzvmVntG0vV0+gODSMfedDY9vbOD
	B4Qt2BU2z7CBHetiglyiA3b9DuqmQXrB7hYpLp4GR142doGAEU7i5mFgy+1zqkgnvhvSiyeStkf
	ZuDIuTDXLd8x0/2akbkDNzIhnD/iBWrOLAbq1nnENU19GRLTA1JSG9bm9E+by/f1JIEuHaBgoAD
	DZuOJNixj/ma2GDCc2I32rzEp/ckN7V0Vh/U24uBmBzspiPopK3+ubxlKaKNAvudNOTYM4ZISQg
	JhvrnoLbq1FttcN94scw==
X-Google-Smtp-Source: AGHT+IF5slHx5Bd2B94CXXmhObw9UK5qoL62ZWpeXd1Z6+SRzywIRLzzipQNQCozh6c/1RDA7X0iAw==
X-Received: by 2002:a05:6830:2b09:b0:7c7:6c4e:ad2 with SMTP id 46e09a7af769-7c94db3e9a7mr3598489a34.11.1764800343451;
        Wed, 03 Dec 2025 14:19:03 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:25f4:78dc:7b9e:e7a4? ([2600:8803:e7e4:500:25f4:78dc:7b9e:e7a4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90fe0f49esm9495223a34.22.2025.12.03.14.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 14:19:02 -0800 (PST)
Message-ID: <5e8e3ff7-09e2-48c3-a9c4-cd7e5d6b850c@baylibre.com>
Date: Wed, 3 Dec 2025 16:19:01 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/6] iio: light: vcnl4000: Use cleanup.h for IIO locks
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
 <20251203-lock-impr-v1-4-b4a1fd639423@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251203-lock-impr-v1-4-b4a1fd639423@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/3/25 1:18 PM, Kurt Borja wrote:
> Use ACQUIRE() for iio_device_claim_direct().
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/iio/light/vcnl4000.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
> index 4dbb2294a843..55e5060ce337 100644
> --- a/drivers/iio/light/vcnl4000.c
> +++ b/drivers/iio/light/vcnl4000.c
> @@ -25,6 +25,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/interrupt.h>
>  #include <linux/units.h>
> +#include <linux/cleanup.h>
>  
>  #include <linux/iio/buffer.h>
>  #include <linux/iio/events.h>
> @@ -1148,36 +1149,27 @@ static int vcnl4010_write_raw(struct iio_dev *indio_dev,
>  			      struct iio_chan_spec const *chan,
>  			      int val, int val2, long mask)
>  {
> -	int ret;
>  	struct vcnl4000_data *data = iio_priv(indio_dev);
>  
> -	if (!iio_device_claim_direct(indio_dev))
> +	ACQUIRE(iio_device_claim_direct, busy)(indio_dev);
> +	if (ACQUIRE_ERR(iio_device_claim_direct, &busy))

Calling the cleanup variable `busy` seems odd to me since if
we successfully make the claim, busy will be non-null and
therefore `if (busy)` would evaluate as true even though
it wasn't "busy". I would call it `claim` to match
iio_device_claim_direct().

