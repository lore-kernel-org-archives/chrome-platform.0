Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CAA331214
	for <chrome-platform@lists.linux.dev>; Tue, 30 Jun 2026 23:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782860858; cv=none; b=Df2agwz3B1YZ6kUsZrl0XYQlRoHB1XLKi6H77D2nvVb7HlM4rUgsshIBST8MAtc1EsxEFSPo0EvUgT4TtTGF8VpBe4HNbfVh0ogZphsHWvXAK/lMQqmoX4dJkz+UwAvkvgjBYgvz890rCE0xEb/5pXCmqKYjwUF8W5TwqoootCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782860858; c=relaxed/simple;
	bh=3OA8qHvCQBNwM6PHuoZPIH4mDqqaedVoVXMNlo97b40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdmrW7q2+iU443IMHHyaucj/LanKJTqrA5Zx5QsS0XO1d5Ew+fWdrwnEtEIkijTDhPNC2Ua5XPTyTwxcTvJxeWaPbR/CKvdDDKgplRE/e/DR9qZ3QQ2Aqqb88B8TLVPJ9bngnGiR33lH2/6TNLo88lrTIuGv1kCsPUDRU4PsGAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0lc25A8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0lc25A8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so222835ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 30 Jun 2026 16:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782860856; x=1783465656; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gSHQq9lz2uT/CCkNnFTD2/+zrLE3tP+kqFCFI7YQj6o=;
        b=A0lc25A84UAj6X5X3d/8gPxr9zuHcsRC37DsSGurx8CY9QEc1US5q2g1hn1rmVPU+V
         9lYWEGXurKzNEh8TO+3qprV6QSFWNwg7cv8JmPqwfrqKFTFG51G6iQ6zt+pYe79E8jmW
         h9BW3fYvogkWKNSD7BzkN5sJT58eC9i5RtZrtsL7VxfjnmwhwlBgYQIE7MYv2OPILCw8
         /YMh0BB6tobGKl4mElmJJp1uX569E7bMEuinL0gk6nnB6SELqWGyRieRH1k0k3n34xT4
         fVYgONw14lVQkANqGDSF1uPDHx/rerhXxm0s6YGuywiWWnMrMIUUUKUde9LUFCKZyQfY
         u8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782860856; x=1783465656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSHQq9lz2uT/CCkNnFTD2/+zrLE3tP+kqFCFI7YQj6o=;
        b=gxWR5wej9ilLUjuufLW4dqGbADisITLgKXLnt5s8BHBNRMBoVZ3IPtpquejc26JXMr
         M7mSavgpA4fJxdazutM2cPIqQY+O2LlCpaF5me7/7iT1A7xCa4bY/AToAogSmpp1jq7G
         Kh1jevrQgwIRhDrmsOLN4bFVuehwrFTDOjMln7lBcSa8jk+XxRGj6Y6qtmnkS8SetQVF
         sF0gVSBS5PlFT3APnTP3QP3WuCGWQ/Lm2rYmdgAp7OumSoUjgiy4G4mIPtqywbV/KbJO
         aUOf+aAKwL2JWil89dEP2t0SXI5MCr9Xez+GBcsKGa0cip1nUCaDZKviPsqnHavSTGyf
         BGEA==
X-Forwarded-Encrypted: i=1; AHgh+RrFBjzt2mKDa82MD7Ujh3Ua2KOHhbc76jDXLfHsYmB8V3HCfoEZBIUAovfvTc5FmwxSbvC0iTF7lonn61U86vk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQrwHTzeIlYwpK1vSXK8jnLZFt1ugtGli0Ro3VkRyjxNQGOa/L
	NviW0dYEi4gcdaLZoY+Duza5IrmbZ+PhIbhRYQoU0/4dLrCImd6SGT4X
X-Gm-Gg: AfdE7clyLS1ea8SMsj3HYhyIeHXE3MZMVACpFCZord4EEVShBoin2vYnd3blCErqaru
	YMwxgEtuYohlnOEHsZqXysZhmLsmd7/OngwePaFkAyWPHn/1OibF78Q21YO4sg61y/TpB5uL0Hc
	tBnbTjsqGTjWC3WsiAuxOVBmR9Hc5bShxZy3lsd2l3mqPGiUi7OgOKH39FIKj2vy/E8uk6j5Pwv
	hxAIl9//ZyuFqOsLp5BQoKAEOYLNHGsSLfRgaXO+90A1yW8URp5q0HzANp29m7O8TnKlEfr1nyq
	/S7671WwYk1GYfVWms8rolnoBCicUnCRkWTcdy8RoBVqQzbecflgJh5DL3IVsE9H0fQo2t/qHB1
	5UTh+22/NC3KIz0KfmEWRyU1bRkNY3CXJeE8cXkom7SZ4kXohQ5BkZQKLlUCZ0h2waEBPyUd0hL
	FwT/rYBNtVo5rF9tfuT8ckBpnFQA==
X-Received: by 2002:a17:902:f788:b0:2c8:1c2d:b9c6 with SMTP id d9443c01a7336-2ca2e715005mr45995405ad.22.1782860856349;
        Tue, 30 Jun 2026 16:07:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a71053sm22270565ad.8.2026.06.30.16.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 16:07:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 30 Jun 2026 16:07:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (cros_ec) Implement custom kelvin to celsius
 conversions
Message-ID: <638242a7-0be7-4596-870b-026f44e409c8@roeck-us.net>
References: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
 <20260630-cros_ec-hwmon-overflow-v1-1-3d2ecd3eb0f2@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630-cros_ec-hwmon-overflow-v1-1-3d2ecd3eb0f2@weissschuh.net>

On Tue, Jun 30, 2026 at 10:57:51PM +0200, Thomas Weiﬂschuh wrote:
> The ChromeOS EC APIs use integers representing degrees kelvin for
> temperatures. The default conversions from linux/units.h will then
> always convert these integer degrees celsius with a 150 millidegree
> offset. This is a bit confusing, as it also differs from other CrOS EC
> tooling. Internally the EC uses a kelvin to celsius offset of a round
> 273, so the current conversion is also not entirely accurate.
> 
> Implement a custom conversion which preserves round values.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/cros_ec_hwmon.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index ea24056ae646..44291799dd8e 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -147,9 +147,17 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
>  	       temp == EC_TEMP_SENSOR_NOT_CALIBRATED;
>  }
>  
> +/* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
> +#define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
> +
> +static long cros_ec_hwmon_kelvin_to_millicelsius(long t)
> +{
> +	return t * MILLIDEGREE_PER_DEGREE + CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS;
> +}
> +
>  static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
>  {
> -	return kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
> +	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
>  }
>  
>  static bool cros_ec_hwmon_attr_is_temp_threshold(u32 attr)
> @@ -228,7 +236,7 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  								cros_ec_hwmon_attr_to_thres(attr),
>  								&threshold);
>  			if (ret == 0)
> -				*val = kelvin_to_millicelsius(threshold);
> +				*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);
>  		}
>  	}
>  
