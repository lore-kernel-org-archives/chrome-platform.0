Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37141741D1
	for <chrome-platform@lists.linux.dev>; Tue,  5 Nov 2024 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823244; cv=none; b=myI3rLL4vmpqJgQUb7O1rviFMyJn9IbZt5qFolH/gxBvNUEvHuGDs+bz/P+OUiw1yyUjy7UevuixMU+iMyANm7/6z/G9EONDnlbRlIG83nkIAEjavb7Me3F9vfpOBHa2CB0y6tSG2XF9UisPVZsTx2UEwKzY8UYqDc7oGobNN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823244; c=relaxed/simple;
	bh=zM8rDeIgAwEMP+1FUdZD8AQYFImhDuF0iIzBR9ZWdYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqDboVsUrEBot2GFB+khjZSmsTLqLKRoKS/jb9ptHm6i7yUugoSn9+XUqwZwPFbli/2KunWbpITGasDv8XQ5JYk3+W4ilZILrizdGP3PopcbEe3C/chWNwAwQm0MB7tMYjZd4g6abH+uql4kJdiHnNznTN/T49+vSsCArIuaPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnMvvJUJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnMvvJUJ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53a097aa3daso5231061e87.1
        for <chrome-platform@lists.linux.dev>; Tue, 05 Nov 2024 08:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730823241; x=1731428041; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OsgC3GUt52fG7g3FJ6lyd/7Hq8DIyDZOCFrlqdAN2z8=;
        b=FnMvvJUJTlqRIXtnaMoIMOE+p1VK11f61/sQNeWqevkEdh34cmz2u75VhKL8+SNlWY
         MM8m2KXVOxa/XdgPMV9W3X/rwaFEepBeOqj+D0IoPeuJUnJgze5K9FwHSoFuPPW90bGa
         oKmd75OUv2Up546im2rpTufCnmZTW1vqiFAaQXkBVeyC0v/4KhGyohk61E26Rx6Jn8N8
         Qj9ngglrButmfls9GBzNFjU7zXxY5EaM/4xMlUc6UdAesZvZ9gCn5gCCdUoRhhqj9Yte
         8dIytAsA6W9rdXkJ+MgV7NZHfIZ+mRHq/mNQbQPoC4K5akZ2OOhRwM63dYZ3k4CxQGdb
         M5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823241; x=1731428041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsgC3GUt52fG7g3FJ6lyd/7Hq8DIyDZOCFrlqdAN2z8=;
        b=gibnD5dwXXuC6QdDfhrMfne2YScm/xjh2kZZe32mfH6Ab2dKhMIKz8uOPwhwhVxs2t
         6e3Qv2DawhUlp/LkpyrKpuXQUy4N6kmiJ+1rIh0u3zvLbpKkQcYar09kwWYY/KjYCYg/
         8xw3GUg7Eskd4SBTVzBKRXnf8ne6CEPdP7cBmrEuaX3JsSg/mLvSyxFemNkSct1ugURI
         G8LI/gHGihCgVnVVmiPRJuBZP+X6SdOdOYugKrrhxH3HI1ZkjB6MWXonv9Hd1aiNjyQQ
         3y56GmpAKYTn1lQ3P+/gc2RWI900nh8QUbuF4c/xcdoy+TMejxQZ+3fdi0cycPVu7pzo
         p7eA==
X-Forwarded-Encrypted: i=1; AJvYcCVpqV6HKz3ivJ4tF1i0mzN9inpXcJeExsku1dGUzA2mnQX/xQAz6YBc93NfI2za0AikXP84i7bGA3ekcWe7bBQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzJCkk3LfMmaZfaAjZgBj9VZUz02MeTjDknAWRQU+G2Npu52VX
	M6pOstpO2s206dgGA4evOMEh1rDcCklAXKYteFocZ9APEmFQi5Id
X-Google-Smtp-Source: AGHT+IF8BLVkWOaws14kIJqjSIzF39hKa71k2p8OWLa7ITtzulUErFMEpSbUuonylZ3cZrDAMvQP+w==
X-Received: by 2002:a05:6512:3a95:b0:53b:1fe4:3fb9 with SMTP id 2adb3069b0e04-53d65e2474fmr7828089e87.49.1730823240757;
        Tue, 05 Nov 2024 08:14:00 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc073sm2168565e87.212.2024.11.05.08.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:14:00 -0800 (PST)
Date: Tue, 5 Nov 2024 19:13:59 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v10 5/7] i2c: of-prober: Add GPIO support to simple
 helpers
Message-ID: <ZypER5bqLAlH7VxK@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20241030072229.1013235-1-wenst@chromium.org>
 <20241030072229.1013235-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241030072229.1013235-6-wenst@chromium.org>

On 24-10-30 15:22, Chen-Yu Tsai wrote:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

> diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
> index df95aa6ad90e..a232f3cbb252 100644
> --- a/include/linux/i2c-of-prober.h
> +++ b/include/linux/i2c-of-prober.h
> @@ -85,6 +85,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   *
>   * The following helpers are provided:
>   * * i2c_of_probe_simple_enable()
> + * * i2c_of_probe_simple_cleanup_early()
>   * * i2c_of_probe_simple_cleanup()
>   */
>  
> @@ -92,14 +93,31 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
>   * @res_node_compatible: Compatible string of device node to retrieve resources from.
>   * @supply_name: Name of regulator supply.
> + * @gpio_name: Name of GPIO. NULL if no GPIO line is used. Empty string ("") if GPIO
> + *	       line is unnamed.
>   * @post_power_on_delay_ms: Delay after regulators are powered on. Passed to msleep().
> + * @post_gpio_config_delay_ms: Delay after GPIO is configured. Passed to msleep().
> + * @gpio_assert_to_enable: %true if GPIO should be asserted, i.e. set to logical high,
> + *			   to enable the component.
> + *
> + * This describes power sequences common for the class of components supported by the
> + * simple component prober:
> + * * @gpio_name is configured to the non-active setting according to @gpio_assert_to_enable.
> + * * @supply_name regulator supply is enabled.
> + * * Wait for @post_power_on_delay_ms to pass.
> + * * @gpio_name is configured to the active setting according to @gpio_assert_to_enable.
> + * * Wait for @post_gpio_config_delay_ms to pass.
>   */
>  struct i2c_of_probe_simple_opts {
>  	const char *res_node_compatible;
>  	const char *supply_name;
> +	const char *gpio_name;
>  	unsigned int post_power_on_delay_ms;
> +	unsigned int post_gpio_config_delay_ms;
> +	bool gpio_assert_to_enable;

This header is missing '#include <linux/types.h>' for bool
type. Otherwise compilation may fail with following error:

```
./include/linux/i2c-of-prober.h:117:9: error: unknown type name ‘bool’
  117 |         bool gpio_assert_to_enable;
      |         ^~~~
./include/linux/i2c-of-prober.h:12:1: note: ‘bool’ is defined in header ‘<stdbool.h>’; this is probably fixable by adding ‘#include <stdbool.h>’
   11 | #include <linux/kconfig.h>
  +++ |+#include <stdbool.h>
   12 |
```

>  };
>  
> +struct gpio_desc;
>  struct regulator;
>  
>  struct i2c_of_probe_simple_ctx {
> @@ -107,9 +125,11 @@ struct i2c_of_probe_simple_ctx {
>  	const struct i2c_of_probe_simple_opts *opts;
>  	/* private: internal fields for helpers. */
>  	struct regulator *supply;
> +	struct gpio_desc *gpiod;
>  };
>  
>  int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
> +void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data);
>  void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
>  
>  extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
> -- 
> 2.47.0.163.g1226f6d8fa-goog
> 

-- 
Best regards,
Andrey Skvortsov
