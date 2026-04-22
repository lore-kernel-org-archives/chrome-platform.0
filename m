Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70963D2FF0
	for <chrome-platform@lists.linux.dev>; Wed, 22 Apr 2026 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859163; cv=none; b=Vn1M1pH32X4GLdnrBYcrsq5HdOjCqwLQNIuTHniOujQo8DWUCE7fir1zWbSaPHQInPDD5iXPodu6Q2gYLFSDQMc1vKnbSoelq2O56cWWiGjE8AMPWuqOrJJCCuHnHIjMgp5WJV2PR1C1uoFRpEmq41x5f25JkvXkhe2yzCNa/Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859163; c=relaxed/simple;
	bh=PxxWuD2DAnmLuzpLFkG5DbUWJB0P/Lom4mu12j2Y8t8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJcUTPboPc4NtyJgUpWr1yC6VJaIlapWlB7I5H96XNFVebHZTDIYWdR33YbRb3SF390jAr4JmC29YgkaynEVXjYPvJocnr0e1cn1U+AKwSrNP07k16ZUMbJB9zFhn+6LrsOmi0ZQZ6Y6rCQ9pn1lq5Gp2E8Gt9VkqjsdPa1XfIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRDVGzbr; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRDVGzbr"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ad9516a653so27316775ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 22 Apr 2026 04:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776859161; x=1777463961; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yQdjvNpFoN4+Y1Foq/Arcrd5LT5ufq6D54+4yF+FPEo=;
        b=dRDVGzbrq5+9nVC/MjHTm+vRV/yLYTGFSAAe2bjucvaHTfkPPxhL44ITEC168qBgY8
         m2aTHXyf+aPIYlG5no7Ni9x49nLqrgkuAs38Csx0HdfmAgbEfggV43HgxP7ITVtuX8sS
         JGC42AWYm/nXo9l9N6BhPy0B8DpwAJLQhY7AjMMXagFqE0d3tTPKoj7yq5NRxNZWUAz3
         fPyrM1IA/RJeNJSTdPnMheVDeIEAi5sbZUHKm+/oheiqD0HLXYIOGwAtCjsjrDd8bogC
         VkslEwiIUy6/5BhzDRK7uS1VJIFMTotVy/sA+P4pIFbWi5M/fUjY6NdphY4ltoySNOPW
         qJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859161; x=1777463961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQdjvNpFoN4+Y1Foq/Arcrd5LT5ufq6D54+4yF+FPEo=;
        b=LfKz6ofW6TO9LOuFjbKNqouGa5pCtPhXsjTtfqEzbZSQNLU1VfrP/OsiPxop/GM6WC
         gxVQbTEF1s2pf2Pd5U67Y2Y4RSuGsrOcb76LI6J1Qw6zDAgm5Ro1CSCnyEVFlZtZD+uG
         ta45FCfpTTcVvPvUW8O7K6bKIf4io0J/rYoSRWSf3dvYurYz+wVlN2szq0/MKi/cEkOi
         ENyk5NdF/5mMtZZzCUZ+SCi2Fw0nDZ/2/NBZHthK+bbC8Efxe0B3WP8ylGqr6dW1zdI2
         p+wUgFuBks0bSyRhBWeLsjbxm4Y/6NS/vct9PqkDeNDGfOinPdcfplLTgM+KFLuqo5LT
         LI6w==
X-Forwarded-Encrypted: i=1; AFNElJ8PVveLlXAbCd4T/PCBfc/jTgZeuDev/6z7P6p7o6NOQsdwaw/ssVs9aOdcIBrhh3yB5DU+yc1QqOWTLHuxXg8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJc+AzhvBSynnNZaMgrgLeNfXtt9ACxU51On/guKaF0z1aTKIU
	DlsMlmTQRt1Mi78kclKB84lfgJhZz7Pb3ALW3ta34XVj86BsCSKf6hI5
X-Gm-Gg: AeBDieuUzINXjVaX/XatQVevluayzOj+jWaqp7VhospbJQZjAongMF+/INsab/HxAIs
	SjcpI86MKN4iyPbSiA+/sEU0YdDDRQU3CkDjHGqgifEOc9LzmPgTr7RUlLgl3gBvHOKFLNPIAr5
	SXJcCfT+R3uSyXTcPldKV3WQobP66QjGGNnbDvH5Nsuc6IZ/opvdXVB4hX2GehLkcsSH9/I+vJz
	6KDyKBcFXWKW9xYOnZNwxBYXY0zJL4Ccj6mAKndbOIfeKmuk9fl88wBLNmTY4g0XHvwk4EdzHGR
	30avLLchim7yU/tGaHhN1B3fpxX9ScAeQX+dHOFmvYX2Pkl9JXua1FUPLG/owWLuQdLKPm8O17N
	Hj3TQBk2NKw9k3CN71t+aVSHvOLGICv8TjAMEsWkoNinTxYwNCVkrfd7AAkotMNJ9DANhTCZrXd
	TpRG8mVTxsaIjkGnszTywJIfiIpTEGTus0l2/6NpKnaJ1h6zsoKqqJ5+vzmSqMjz1o3vf+0sdZt
	LXuq9R5e8I=
X-Received: by 2002:a17:903:8c4:b0:2b0:61c2:8e7a with SMTP id d9443c01a7336-2b5f9f1c601mr217544535ad.25.1776859161266;
        Wed, 22 Apr 2026 04:59:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cdd1sm164231655ad.38.2026.04.22.04.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:59:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7e4a008b-74c9-40fa-8fff-ee4fa830e3dd@roeck-us.net>
Date: Wed, 22 Apr 2026 04:59:17 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/14] hwmon:: Use non-OF thermal cooling device
 register function
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benson Leung <bleung@chromium.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 "open list:CHROMEOS EC HARDWARE MONITORING" <chrome-platform@lists.linux.dev>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
 <20260419182203.4083985-8-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260419182203.4083985-8-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/19/26 11:21, Daniel Lezcano wrote:
> Make HWMON drivers which are not based on device tree to use the
> corresponding non-OF functions.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/cros_ec_hwmon.c  | 4 ++--
>   drivers/hwmon/dell-smm-hwmon.c | 4 ++--
>   drivers/hwmon/mlxreg-fan.c     | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 6cf5ab0f4b73..77dd9f28962d 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -532,8 +532,8 @@ static void cros_ec_hwmon_register_fan_cooling_devices(struct device *dev,
>   
>   		cpriv->hwmon_priv = priv;
>   		cpriv->index = i;
> -		cdev = devm_thermal_of_cooling_device_register(dev, NULL, type, cpriv,
> -							       &cros_ec_thermal_cooling_ops);
> +		cdev = devm_thermal_cooling_device_register(dev, type, cpriv,
> +							    &cros_ec_thermal_cooling_ops);
>   		if (IS_ERR(cdev)) {
>   			dev_warn(dev, "failed to register fan %zu as a cooling device: %pe\n", i,
>   				 cdev);
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 038edffc1ac7..47b373ea6db4 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1161,8 +1161,8 @@ static int dell_smm_init_cdev(struct device *dev, u8 fan_num)
>   	if (cdata) {
>   		cdata->fan_num = fan_num;
>   		cdata->data = data;
> -		cdev = devm_thermal_of_cooling_device_register(dev, NULL, name, cdata,
> -							       &dell_smm_cooling_ops);
> +		cdev = devm_thermal_cooling_device_register(dev, name, cdata,
> +							    &dell_smm_cooling_ops);
>   		if (IS_ERR(cdev)) {
>   			devm_kfree(dev, cdata);
>   			ret = PTR_ERR(cdev);
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index 137a90dd2075..860de6cfd8a4 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -583,8 +583,8 @@ static int mlxreg_fan_cooling_config(struct device *dev, struct mlxreg_fan *fan)
>   		pwm->fan = fan;
>   		/* Set minimal PWM speed. */
>   		pwm->last_hwmon_state = MLXREG_FAN_PWM_DUTY2STATE(MLXREG_FAN_MIN_DUTY);
> -		pwm->cdev = devm_thermal_of_cooling_device_register(dev, NULL, mlxreg_fan_name[i],
> -								    pwm, &mlxreg_fan_cooling_ops);
> +		pwm->cdev = devm_thermal_cooling_device_register(dev, mlxreg_fan_name[i],
> +								 pwm, &mlxreg_fan_cooling_ops);
>   		if (IS_ERR(pwm->cdev)) {
>   			dev_err(dev, "Failed to register cooling device\n");
>   			return PTR_ERR(pwm->cdev);

