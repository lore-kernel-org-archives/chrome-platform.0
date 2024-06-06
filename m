Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD06196C92
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717682728; cv=none; b=iJG9ouQ+XoR9SoJJxre7QKekbCSVmWbYQyfT67Vxc4C85Z8FwqDrxMCHOxmFxn4fY6N6m65XzVwv85p5oMO93kqCKvA5yodkTJS7Ge5HFxuD4KReru4KmPp+dUFhRnMCIEP6Od67phL5qx6+bgRQat/URsyw47iQvKyCzvIxomQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717682728; c=relaxed/simple;
	bh=i45Gu0FMOskw0DjvYyiQtFVhpvpJPcYFFKf1FYSoNCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8loiwAtgmlaR3HLIrbLNxLIwH7pB6AnvBAfRpLqnUNzpXNPzA7gbpWBljpphBb/SIhVoxxHH4WwnWM48kVVSHc13HEpXD+XshH0qlKuy8j3X8v/KxiPnTi2nbPxz6+Z/7UvklTvnNCCABsgmBem2LhyUaGlosu8ldOnGZawW9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBHoJp0B; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBHoJp0B"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f68834bfdfso8057855ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 06 Jun 2024 07:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717682726; x=1718287526; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hkvtxfRBP8HwEJyE98iao7aEsT4W32s7jFfmrt+wfA0=;
        b=JBHoJp0Bu3ktIV1PnUJWjgO2VzrXvjdlIvcl4cypZSaqCH5NrWUCFHfNVeZLmNyt0g
         a9SSMVRasVAlh2MIG+EB/etmYlovt0OuoTKNRd5K4b0vzc9znbX7uaC1PAwKx67o6wLV
         2wt2D9LV3vxCSG6VlhfzIXsxoia23c37oTE27Scuhc3VeUHEF/Vvfvgd2nECD5zf+fY1
         PGizJIsknoX0CrbA0XDT/pH1JEWcdHX6y0RiJt9INrs8VAL9b7GJ3ERJf84BOYvdnkO7
         To3ngEQCYVf8FmSvCN25ch4gB4R2yZABjk2r2GvflJYiGcJsc8RB4WoNlcRI7OasWCvF
         zmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717682726; x=1718287526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkvtxfRBP8HwEJyE98iao7aEsT4W32s7jFfmrt+wfA0=;
        b=FfZWjXz1+UdN4A7R4LPAiai6WSyrDWUTT8dso2+1ufMPtx6Z6sPeGE7FyqeqSLmFVa
         03xkd6Qnwyv9grybkiBwJfDGywa2i5NFHYUuzhFv/JaHNeHB2FEf+boARs2wElqZhFlF
         8uN7zG5bWFGNJgPZYX51vF16AeS98PQtdprPWzCHUb/qo2GmuxR7r7GDInA2oN4nxYQ6
         NN0JI1NVF6ibW99hdnskm2jAcPsDsLo2glkzSsCZEerDAU1fQjo8I5gKsI7Nv+4lXDaO
         iSnpv0iSosAtz3DElBRj0fHzxBEccwg6U/nDMhupVIvT9KVb+0NYj8GJNeEAmjk78PRG
         Wwgw==
X-Forwarded-Encrypted: i=1; AJvYcCVLI5/DYIR7DpAECqbA9RqE+Z+YdD0O9F5TCxKy+7fAI6FzCEhVFm83u30Pe6mEU+sZwzCx+LZc4c3YBb62/0FMEvbWebJeWpdtVhvPU22m
X-Gm-Message-State: AOJu0Yx9M1E6LgsjQYQkHhsxtoMFqWVsNS2KJ87RlGO5CbaI/vd6bsHs
	UBS4pfcAVlKnOfXbRVVnauHoht7/ktLd5KAbiE1MLEa1s/oHV28W
X-Google-Smtp-Source: AGHT+IFEAiWIPngu5fU5+VKXgB5gVnT2E50j/2D/yKpChFDLWSGB6HMf20Lx2V4tl6ZUCjDwcRzLRg==
X-Received: by 2002:a17:902:e851:b0:1f6:7cc9:fb2c with SMTP id d9443c01a7336-1f6a5a6aec3mr63688685ad.49.1717682725317;
        Thu, 06 Jun 2024 07:05:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ab8fsm15288175ad.73.2024.06.06.07.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 07:05:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <01c955d3-cec6-43bc-be7c-b6c1bde441d1@roeck-us.net>
Date: Thu, 6 Jun 2024 07:05:22 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (cros_ec) Prevent read overflow in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
 Jean Delvare <jdelvare@suse.com>, Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <42331b70-bd3c-496c-8c79-3ec4faad40b8@moroto.mountain>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <42331b70-bd3c-496c-8c79-3ec4faad40b8@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/24 06:12, Dan Carpenter wrote:
> The "resp.sensor_name" comes from cros_ec_cmd() and it hasn't necessarily
> been NUL terminated.  We had not intended to read past "sensor_name_size"
> bytes, however, there is a width vs precision bug in the format string.
> The format needs to be precision '%.*s' instead of width '%*s'.
> Precision prevents an out of bounds read, but width is a no-op.
> 
> Fixes: bc3e45258096 ("hwmon: add ChromeOS EC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/cros_ec_hwmon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 41f268fa8260..b3ba7247e06b 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -212,7 +212,7 @@ static void cros_ec_hwmon_probe_temp_sensors(struct device *dev, struct cros_ec_
>   			continue;
>   
>   		sensor_name_size = strnlen(resp.sensor_name, sizeof(resp.sensor_name));
> -		priv->temp_sensor_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%*s",
> +		priv->temp_sensor_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
>   							    (int)sensor_name_size,
>   							    resp.sensor_name);
>   	}

