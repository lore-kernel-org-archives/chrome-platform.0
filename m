Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395857;
	b=HwlSZ4bCiDXaeRVj8S5oLozbgEM7ZKOGSIajIf9iBwf/ITFlICsGfv4zEYnqYlZEj1m6
	 pkGLwMQmADUo5FGwGhafFAXtFIstcNqqOG+Rr7SXn59iPfApU99a11+5CoSuTAJh7v62E
	 cqeo4IZB1o91X9XUpmdsPX6W0iZqdc9aauwNVOPNbbta8CxzhzHGnb/e3F4onJirC+kgK
	 uEDsKw0Vm8k9P1MpZor2A1NIE3ILdSNMKjOgCNTPvFvoGocwV3t3Ink5JwwCo3Yy7g//m
	 C3/wGw7UXB+RSitMG3TdusHX7BLN+JkSItpYu+qxa/yW65+zLxk6e/A5Jl6oynlraXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f5dZF2vX2WwRp/FVprc8N43I5ckqGSvz1h8CuNziLMI=;
	b=h0frqefO1oWkXesNAzRByIxSjD4bsKUXmhpI3Bbw39XfZDaAsQpWxgNppPqetuR0JlDx
	 qBzKqUxxpf/qhBcwCFlHQ1RwA75B9RkKY3IFFE7oD4q7RwPv2xeKXviwqoXuzytYgaxX+
	 h8NQIX80xN1ogSNiiLJBMGYWwX7oXFN2WweBt6C+pNds1Vg514NGm+i71dOxP/qvIZoZW
	 WqVDudTXDZiqWiR0GDv+AGmfEqkV2Z98R0ZC11hA07HnnW9aqWp4r19NMMUn28DEtCl8j
	 5eJfjegoOD6sxChZOV81RvYAignP9lTXQrXUs2Qc5slBBnmsXnyprGA3l/M6/czmzRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k/wW2tgc";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE77D606A88F
	for <chrome-platform@lists.linux.dev>; Wed, 11 Nov 2026 11:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE77D606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k/wW2tgc
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2035243f8f.3
        for <chrome-platform@lists.linux.dev>; Wed, 11 Nov 2026 03:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395855; x=1795000655; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f5dZF2vX2WwRp/FVprc8N43I5ckqGSvz1h8CuNziLMI=;
        b=k/wW2tgcvizYocfiX5ObRlSg2Y+LvT38DfZRHxDc0DluK+R6qEnpJKyqDpk5kpAMa5
         xfTqnc9G8gm64MyzbnI63KYyocXk59j+o66bRzD7ewHBFkM5FpA68aTc1rRl7X1bpjJI
         +wwe36+jf//tRP3N5EamyXsqPprR6MxKcLPuKvGy7BzQkr7DHsFxSqX+nzeLLNO1H1RZ
         SDto2WR6cppJmYEvo0epUHuTIR/ehrX4RXLduKdiVdYOqTVFFWz7nQAi7IC1xVT9Ie4i
         tx0LpyLjSLQVbG24BiWfkdN1Yz0ge4U4QGzGs1X1dDDP25BcVVSO5Fcy6qsaLh4dGle6
         6R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395855; x=1795000655;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5dZF2vX2WwRp/FVprc8N43I5ckqGSvz1h8CuNziLMI=;
        b=m5E6JHUB/qz0+xy7HsNKNn7I0N67xzF51gj7GlBxVUUkX0ifo/1xvVwJyu8wOT5B0O
         ayl1E/yEzzLXr8N9rP7gKS3i+0zekLpgRH78cXc2H+1GDBx3NOlDsU9F7H8olYRam6I/
         daV4mY12KiFz7Jr9R/nE18VgNAAoxbfZjHT5/YrKWARjc3YG0+9EidZU92YmW7CwiExa
         +I0BkvcroFBnbin1ft+Q/az7/2VFV4Pchq/oTlOqBgkdMKyOvvrGmbPPZjUyFr4Vpqhr
         +2rlVKjHk2TPhXu3IF6EHytlrr9Z7PEo+Oc+VWL8CgHw9QBfaUyl3Rf1vovlMaQQUXtK
         NngA==
X-Forwarded-Encrypted: i=1; AL+hErFGocknUTT9FMullHu9qtJamJr2qk90zVUZJL8J8tNJot4+DWwBTDDpscjRS4smmsoQZqUeuPHrA0voQwf5rbs=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Xps4Vrjkx1QYJezJrD82b6gsNMRoccaDIy4uDspLb0fOgPlph
	p3EZlHQmNpRh2LqFFPuHa3d+StLcQ47W62iHOkrsfPS0DmQb9BcuXH1/
X-Gm-Gg: AYBFou1XKEHUizwdodaxSEjUEUHlSm6R5rvWUDEs/0c4F3GzU3fKbTdV5BY2vXWTP40
	M8qlIbJjZBBy7Wk/YOPzZVxTnXvFScN1C2vudlfkjU2MaZ6M9jBN0hGvH/jfJZRo/q3Mg+9vabt
	OtlxSGQBOCl3ABl0gLeqBgectS9T69yID/bWNkDqgFOgWrjHkDpKt5P4zHBUap7glAmu9Y2Lzhb
	j1PrM6v5cqja+zcS1A0h/EVp51tzuQMg+h7f316wlOa3T0j/ZyV56cTj+lUWfLtEmkoVf6W+XrK
	/x3dFxAl6VtyIksiDnXL9MP18TzG/7Sa9x0fX6TGwYTTjUUxds/O50nnYdZVt30iOmcY1LR9Uzf
	3y/8ueo/Qy9L48StGhkLD63Y9ffzxkcaNg/ZEZHzn8dGXYq4a1bfKn+jEIjwlOhtKnrraGcsih2
	/ACKoqh49+aCe9KX+gDoiED6JESL/O4r7pqI5ykxzTwUZsC2F2iY/veAco5D6sx+qn3QMEcB6kf
	lLVylDQagu+xCAVtuIqtTyRUuYfirZx85F+DuwNXdV4ch0Ki1nvpaE8VMnl/NB7iYTCuBgUuh8J
	Dx1Jml0UfBQW3ZFgLApA7seBu9U0QDot0LMqA4IkpLl6RXxcTtv9uyDcf9Y2N9B5/A==
X-Received: by 2002:a05:6000:18a8:b0:48e:4115:f3e8 with SMTP id ffacd0b85a97d-499c70828bfmr3850067f8f.27.1794395855165;
        Wed, 11 Nov 2026 03:17:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm10587827f8f.10.2026.11.11.03.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:17:34 -0800 (PST)
Date: Wed, 11 Nov 2026 11:17:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Di Wu <diwux@google.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, bleung@chromium.org, groeck@chromium.org,
 tzungbi@kernel.org, linux-iio@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: use sysfs_emit() in show callbacks
Message-ID: <20261111111733.678199a2@pumpkin>
In-Reply-To: <20261111072608.3490763-1-diwux@google.com>
References: <20261111072608.3490763-1-diwux@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 07:26:08 +0000
Di Wu <diwux@google.com> wrote:

> Replace sprintf() and snprintf() with sysfs_emit() in the sysfs show
> and ext_info read callbacks. sysfs_emit() is aware of the sysfs buffer
> PAGE_SIZE limit and is the preferred helper for show callbacks.

Reviewed-by: David Laight <david.laight.linux@gmail.com>

> 
> Signed-off-by: Di Wu <diwux@google.com>
> ---
>  .../iio/common/cros_ec_sensors/cros_ec_sensors_core.c  | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> index d03e40c91582..624d4b32b034 100644
> --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> @@ -149,9 +149,9 @@ static ssize_t cros_ec_sensor_get_report_latency(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%d.%06u\n",
> -		       latency / 1000,
> -		       (latency % 1000) * 1000);
> +	return sysfs_emit(buf, "%d.%06u\n",
> +			  latency / 1000,
> +			  (latency % 1000) * 1000);

At least two of those lines can be merged.
I think it is 86 chars - maybe ok.
Personally I'd split after the format.

David

>  }
>  
>  static IIO_DEVICE_ATTR(hwfifo_timeout, 0644,
> @@ -165,7 +165,7 @@ static ssize_t hwfifo_watermark_max_show(struct device *dev,
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
>  
> -	return sprintf(buf, "%d\n", st->fifo_max_event_count);
> +	return sysfs_emit(buf, "%d\n", st->fifo_max_event_count);
>  }
>  
>  static IIO_DEVICE_ATTR_RO(hwfifo_watermark_max, 0);
> @@ -465,7 +465,7 @@ static ssize_t cros_ec_sensors_id(struct iio_dev *indio_dev,
>  {
>  	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n", st->param.info.sensor_num);
> +	return sysfs_emit(buf, "%d\n", st->param.info.sensor_num);
>  }
>  
>  const struct iio_chan_spec_ext_info cros_ec_sensors_ext_info[] = {
> 
> base-commit: b70566610b48ba49dec636019da4d696db64b085

