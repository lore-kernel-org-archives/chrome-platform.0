Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1A438C438
	for <chrome-platform@lists.linux.dev>; Sun, 19 Jul 2026 14:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471709; cv=none; b=W6mvaaT9wrN0yk3VHj0VnA46I0YuM9qiTITDW1Ikix2x71GpvPPetcO79YHW/2FHkTussI3TRF7qUFVPM2NmUspeu1VPY+Cx3Hze0pGsnAkRsr4zqxvNBLNZHdxfsc9q6Ds34TXdiT7H+1asYrFrHPVYGUPOHWP/+L7aNQqSITo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471709; c=relaxed/simple;
	bh=IW2jPExxKBT6wO7bPnFE0Pkub0+nMkBiLUk57Iy55tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxBN9GzHq0UImw4pNcPgzFZWXOV8bkoBG+rwN8RTUpZ2qtm5VKdV+kdIrRPEPGHEteeaWGoxjcLnsS8BxIBd60NqqEo4Gv+2/Dv7c1SS2fsgielEombInf/kMaqJIWylJBJly5lgqtezbKZ6DtGp60iFa6wcrcENqKmKRwM5tzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vs0m6lzU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vs0m6lzU"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf41bab353so22845585ad.0
        for <chrome-platform@lists.linux.dev>; Sun, 19 Jul 2026 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471708; x=1785076508; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mMOZLOn+ug3WCgazWkuZpH7WbHIxWMuuhqF8JhrA40=;
        b=Vs0m6lzU+J6Rs6O35mQgSMllW06fu402FtHz9XXEbG59Jso9OY89X/Xp6JOXnwzjWz
         ck+1sM7BsuVgUoHa06f6rBZeufJ87LhATrzsehDOFx6whz/hVQtlzBHUpMradJdUgVme
         Y6UX9x878qDpmQfCJoU6MmNoz3MKHmDyBxcJGf+79LxqcTcYsFt7VkvinTiAHAKftRDQ
         kU6IWikfN6LcXr5FKvAPKtTXBF2GUr7MlXgUjr7S3gqh7YzstHWRSg4FRoI384TSx2IX
         Ot6Mo4veOiHWiaLVbPo93FQFb7vPCVv+KvovoD44iLQFIjYLvfas1bsA3RCnxpEI1lts
         4tUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471708; x=1785076508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mMOZLOn+ug3WCgazWkuZpH7WbHIxWMuuhqF8JhrA40=;
        b=F4npCEvBuaYkYlVQHRXc9qtDtK2/t1mFr7HNX8c8Z8DqQ3C+xn+lYs4y9jX8GyM9E9
         rGfaI/6yRkbyHrcwChzeGLlsxGx0AD/hEImTpgpvOqR5klFeZjzW4oGmVM4Tt5jDfCfF
         GGRqHyFurHYQLbd7vORnYgPKoT3mwqnbtx4KoS3wi87+HemppJvNRsoTqcJfREpJt74+
         UZWsP/PqyWQeg+9FyDoQaIL3iGCwwVOzsGYZjqzOL+IeVBFurnCj5UtCZj4ndV8gMbL5
         a5DWVujzhfmzfRlf1KFoKV+JCZzpGdbsVGEpgeK+2wjyZWr6W2sosnm9gz9yNFjpEGpw
         8HWA==
X-Forwarded-Encrypted: i=1; AHgh+RrIvoc8oi3v1i/WvKxhVIZ0fR0Z2liHxnT17K+DD1IPVX4KnFsA6RdRSjbVQqBTVV2Xmyv7i5JyEnXg8IH578s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAIGSOJheBwywcWactiVzpV2V3bfStjxOAMRALOV61mLHQ2eOm
	EcggApDXYaexjaamJ+CmZ2cl1POKtuvGL6KeBZMJmWmvjLEJr6aZBVzW
X-Gm-Gg: AfdE7cmhugx0fjvoyZ4N5R6p8zyzaR6zuAZ9YMxwlgO2AgLx2DFb3dVwolfyoeOS27t
	nfrr3edTaVWFF62/9sr8hiksB8iC/gPCoERpveW0JIG0De2u2CChQK0w673pJuKyb1fVckSE66q
	tgxWGLZ98glWVHc2oOxQnU/Widi3TKVa+0fovWaX33CRw7hKlIJvlr/C357c/8lgmVjszTf6kzK
	RBt9g9ZdgSvNR7nSLMqhVVsrOv+bOyoRAOoLBVIvkbhkMKmPOkFendmTzk7KQR/vciv0JkSXaPh
	xxkxpivWgDAQeulGaCxdzJNhPPMzVcY0jRGQ+emZqBS1D1qR8woNRuaEyNmyJlRlgUXT+8g4pmF
	Gm2IDzBexk5VN63X6oKw3gqbFRzDYJ9qMqVISoXB8sOMu2AmcUFesuHGJnqZ+12K3HaXBkwOFVr
	fLnd9KvftI7qvdh6g=
X-Received: by 2002:a17:902:d2cb:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2cf34887d67mr106322705ad.15.1784471707707;
        Sun, 19 Jul 2026 07:35:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1f04sm41777995ad.22.2026.07.19.07.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:35:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:35:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Sung-Chi Li <lschyi@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (cros_ec) Store the hwmon device in
 cros_ec_hwmon_priv
Message-ID: <d02a06cb-403b-43c1-bfcd-da5d2ac87bce@roeck-us.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
 <20260711-cros_ec-hwmon-locking-v1-2-cb6d0fdbb2d3@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-2-cb6d0fdbb2d3@weissschuh.net>

On Sat, Jul 11, 2026 at 11:59:06AM +0200, Thomas Weiﬂschuh wrote:
> The upcoming locking scheme for thermal devices will require access
> to the hwmon device.
> 
> Add it do the priv struct.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/cros_ec_hwmon.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index f9b19da50472..fb5daa9f80d1 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -25,6 +25,7 @@
>  
>  struct cros_ec_hwmon_priv {
>  	struct cros_ec_device *cros_ec;
> +	struct device *hwmon_dev;
>  	const char *temp_sensor_names[EC_TEMP_SENSOR_ENTRIES + EC_TEMP_SENSOR_B_ENTRIES];
>  	u8 usable_fans;
>  	bool fan_control_supported;
> @@ -556,7 +557,6 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
>  	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
>  	struct cros_ec_hwmon_priv *priv;
> -	struct device *hwmon_dev;
>  	u8 thermal_version;
>  	int ret;
>  
> @@ -580,10 +580,10 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  	priv->temp_threshold_supported = is_cros_ec_cmd_available(priv->cros_ec,
>  								  EC_CMD_THERMAL_GET_THRESHOLD, 1);
>  
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
> -							 &cros_ec_hwmon_chip_info, NULL);
> -	if (IS_ERR(hwmon_dev))
> -		return PTR_ERR(hwmon_dev);
> +	priv->hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
> +							       &cros_ec_hwmon_chip_info, NULL);
> +	if (IS_ERR(priv->hwmon_dev))
> +		return PTR_ERR(priv->hwmon_dev);
>  
>  	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
>  
