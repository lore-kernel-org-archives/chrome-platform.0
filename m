Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6852B9A9
	for <chrome-platform@lists.linux.dev>; Sat, 19 Jul 2025 04:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752900334; cv=none; b=Jl5173TLv+RBDEVlMdowH45r3bmTtkspkY9V9zoZnVFdiRUW+ntGdO82grPed9+BZrrGtnG71X65/gyWCc+tbj3C2jmaHUEnf6PSmx8H5i4wx8pJxYL0jEU0ur6zmdU9EdI3KNLiTY+WLl9n+cktRlf3+aP4T8dbrEtrM6Z1XpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752900334; c=relaxed/simple;
	bh=91BZLZBnHol3G5D2pQNEOuhB92MjBsnbv9dL7ro7hKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsvNN/V5PYAmK5bhBbYyzI7XaVbeFudtzu6uI586SKDxojDES8gswDXbfo81zWvlgS7yzyyuUHw08XLke70H7p96aisVqWW7WSd/KCDe774cGSL5ujTrP006auGYYnZyIVmGt3Be3XmeK0SAmHI0tR7FHO+LlA5/DLdC7ySS4nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWBnvdBE; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWBnvdBE"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so2361917a91.3
        for <chrome-platform@lists.linux.dev>; Fri, 18 Jul 2025 21:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752900331; x=1753505131; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDSwmwyHdOHdY5y6kv9+AKkxnfvOoBedcBRoJCdOkHI=;
        b=MWBnvdBEkRFWnrimC6VLNz8ukSAMKvJYWIc7/z9HR+yUEKI8Is4/ZkBkhQtcLFUUXH
         2n93mJ6Shju1qpY5Fv7UoeMAcX19XkYg5imnDx+m/cOH1cCj/uzcajorlQM9jgkKlm7O
         JBswDMFnPcEnVRBjyKL7Qf+pH2zH/C1a9ff3YiFZLIp55NIv6xTIsjc4ZtuZU3yOtal1
         UfylQHWLcAB1YQx1JYdFs8IWBd1TFxaBBc2ElNRl7GjiCOe1FQO0PlzG8wHElHMQJf8U
         lbbn4g9jJCc9PjaQsS4PbR3lF9/uNB+5Oa9f0hvIYbU/m9ilfHJlAO58ceQxkEl83xXP
         /UCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752900331; x=1753505131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDSwmwyHdOHdY5y6kv9+AKkxnfvOoBedcBRoJCdOkHI=;
        b=rdG2Nm4MPPk4iMtRCZAgPYnnBFawqa6HaFWfuuWfUoqr13XSrRhmsLtzfgX/R0m8f8
         rcdKYjM2i1cFBHtJAJ9lnUFrhe00obnXw20RkZ75/tu5HG2MnhvYI5guDbqnPd9hNvNY
         WR9bvIDDdhf35n8yA9dRgNzJ0CX/GB/d+l1nRFQknvVm1OjAHVfPKf8PZh2AQ44aGg17
         MCQTEab0uK3oRf/xPx+6PCTbFa+h2Qy3cuaXDxed6JEnWwUzGgCphQ4adFBj1LzEAcrR
         U9pXX0lBzQL6G8DhOPxya8DKsBkttENnZPC79iJu0wyJRCczi4EfndKOOP7aUp9jXaE6
         or0w==
X-Forwarded-Encrypted: i=1; AJvYcCVdIPmXdQmKWlvdT0nvjFNJUe3I45RG6vu/D/94PgAvyBIJmy6GcOZ2RdtqLLR5CPj638PofcX2zHkM42fLQps=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi+4UYdmivD7tJe7rpa5qKnxlvxep5DRx31KAgP17j2bxW5gzz
	U317tvrbbc0felmrOGZj2yqGjIwChfItMHysG61rDjF0NCN8nsBvJh+/
X-Gm-Gg: ASbGnctuodefVwXLRBYQWwjXRd53oANhgVz6k2Xm2IchNne+cFe5zUCizTSopgre0Fu
	8kFz1q309cLUM+S3DTkI0gyycA1zEghh0INYXwbDM6Li2kzZtUQ59Unilz+f+wJUj0YlGtWgGoB
	8gmDsLseb1jf4Bvkt/D8WGoJs3+62ACktHF+ssMtOOf93jgpvUHfrcv8SKwHsyeQHbY4xyr3Fyu
	lR92DqLfXdaaKsm3NzOy3MlANNu4pGgHfM2rJXZ6SWBfMpn/wZD7OaY9nM7r4Gux0AH0c/Z3GfA
	gRSBVN+Z+RKE7VnoEwh/OslTf752TEaxfgHvIoWVMWy02QjDWwt5Tlm2wulnDAB72pSGsI/xawr
	3RscqbVEhDipFi9c2iHaaXl3aqgubDpBkHGo=
X-Google-Smtp-Source: AGHT+IH80ZxQCk9Ldxy2HcCZ94uxkc5cXHP4oMobg8T6kOM+VRAaXBoHX6GyCi79GvkHwqNKchitfQ==
X-Received: by 2002:a17:90b:1810:b0:313:271a:af56 with SMTP id 98e67ed59e1d1-31cc2608a57mr6627758a91.30.1752900331477;
        Fri, 18 Jul 2025 21:45:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1e61f3sm5956304a91.15.2025.07.18.21.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 21:45:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Jul 2025 21:45:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH v6 1/2] hwmon: (cros_ec) add PWM control over fans
Message-ID: <8869b525-c32d-4a8c-8e1c-b2718896dd2a@roeck-us.net>
References: <20250718-cros_ec_fan-v6-0-8df018396b56@chromium.org>
 <20250718-cros_ec_fan-v6-1-8df018396b56@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250718-cros_ec_fan-v6-1-8df018396b56@chromium.org>

On Fri, Jul 18, 2025 at 03:08:29PM +0800, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Newer EC firmware supports controlling fans through host commands, so
> adding corresponding implementations for controlling these fans in the
> driver for other kernel services and userspace to control them.
> 
> The driver will first probe the supported host command versions (get and
> set of fan PWM values, get and set of fan control mode) to see if the
> connected EC fulfills the requirements of controlling the fan, then
> exposes corresponding sysfs nodes for userspace to control the fan with
> corresponding read and write implementations.
> As EC will automatically change the fan mode to auto when the device is
> suspended, the power management hooks are added as well to keep the fan
> control mode and fan PWM value consistent during suspend and resume. As
> we need to access the hwmon device in the power management hook, update
> the driver by storing the hwmon device in the driver data as well.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> +
...

> +static int cros_ec_hwmon_read_pwm_enable(struct cros_ec_device *cros_ec, u8 index,
> +					 u8 *control_method)
> +{
> +	struct ec_params_auto_fan_ctrl_v2 req = {

ec_params_auto_fan_ctrl_v2 isn't declared anywhere. Looks like some patch
is missing, and I don't immediately see it. Dropping the series.

Guenter
