Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E7E7C
	for <chrome-platform@lists.linux.dev>; Wed, 25 May 2022 18:40:54 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id a13so8794719plh.6
        for <chrome-platform@lists.linux.dev>; Wed, 25 May 2022 11:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kcKV1w2nPlwaIbCWnEveE9hseS5PyiFCk/LlY1siP3E=;
        b=gF4mzOT2oM4CfPgmn1UlSGGEbwf+gvzsFyifnYVIbjNO0iu8sUlx7k25anA+q/KaOi
         373snxdX0rBgwl3v9kDUgarArIHyNVdS6o43qZlRlc4EcZFit/EVrtVCsh1VFdW6f3hV
         35T/ena+zbKsnIdkZeM9Mbe6e3JwSsSvQtZO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kcKV1w2nPlwaIbCWnEveE9hseS5PyiFCk/LlY1siP3E=;
        b=NxASWtPkipk43XpFDs6xYCCRRG5dZymf8NlXD6ccuqwkeXmM1EW+rzN7DSUZW82oVi
         qEAREa6I1G3PDmEAVAV1HefY9qrSUiK9iQU7PiODWxjGHME2TSD7kHlOVBPJ/kspXzcS
         wqfAMjn35aFAoMiCivhPMopQLHzw1Jur3zsEXhjmGC1/yZUwTwUkz3v8dAmUb9abEG5H
         DGvwU//6xGb+HZ/Tz8qPpRIxp1LnexgOQ8m0cz8WLyxXmHjbzL+BgS0jw9Wde/W/kz5e
         64800/Vn4MMPofWuuBeOuuuFeUe99G07Kub9KSLv7TsIYxCxsBvbcMlbhHqrFJd+iW8N
         rmfg==
X-Gm-Message-State: AOAM531XhqyhUjPyn65caIBH6iJjjhgdlYEoJbDa6vXs2kk/FnMkCP5A
	c05tkX/1hHr1ua+ECvKS6kjrtQ==
X-Google-Smtp-Source: ABdhPJytsR6CP9N4WKNHzCbzIrM1a3ij8m7Yn9JRjYK1/hXrfhC81XsY53KcEwNKFeCSuEw5eHFn4g==
X-Received: by 2002:a17:903:2445:b0:161:d47e:88cf with SMTP id l5-20020a170903244500b00161d47e88cfmr33393332pls.67.1653504054374;
        Wed, 25 May 2022 11:40:54 -0700 (PDT)
Received: from chromium.org (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id d1-20020a17090a8d8100b001df93c8e737sm2133845pjo.39.2022.05.25.11.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 11:40:53 -0700 (PDT)
Date: Wed, 25 May 2022 18:40:52 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	mka@chromium.org, devicetree@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 4/5] platform/chrome: cros_kbd_led_backlight: support
 OF match
Message-ID: <Yo54NGcb45oNBfUY@chromium.org>
References: <20220523090822.3035189-1-tzungbi@kernel.org>
 <20220523090822.3035189-5-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523090822.3035189-5-tzungbi@kernel.org>

Hi Tzung-Bi,

On May 23 17:08, Tzung-Bi Shih wrote:
> For letting device tree based machines to use the driver, support OF match.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> No changes from v3.
> 
> Changes from v2:
> - Add commit message.
> - Add R-b tag.
> 
> Changes from v1:
> (https://patchwork.kernel.org/project/chrome-platform/patch/20220214053646.3088298-5-tzungbi@google.com/)
> - Update email address accordingly.
> - Use device_get_match_data() per review comment in v1.
> 
>  drivers/platform/chrome/cros_kbd_led_backlight.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
> index a86d664854ae..4bca880d7721 100644
> --- a/drivers/platform/chrome/cros_kbd_led_backlight.c
> +++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
> @@ -10,7 +10,9 @@
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>

linux/of.h includes linux/property.h [1]

[1] https://elixir.bootlin.com/linux/v5.18/source/include/linux/of.h#L22

>  #include <linux/slab.h>
>  
>  /**
> @@ -116,7 +118,7 @@ static int keyboard_led_probe(struct platform_device *pdev)
>  	const struct keyboard_led_drvdata *drvdata;
>  	int error;
>  
> -	drvdata = acpi_device_get_match_data(&pdev->dev);
> +	drvdata = device_get_match_data(&pdev->dev);
>  	if (!drvdata)
>  		return -EINVAL;
>  
> @@ -152,10 +154,21 @@ static const struct acpi_device_id keyboard_led_acpi_match[] = {
>  MODULE_DEVICE_TABLE(acpi, keyboard_led_acpi_match);
>  #endif
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id keyboard_led_of_match[] = {
> +	{
> +		.compatible = "google,cros-kbd-led-backlight",
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, keyboard_led_of_match);
> +#endif
> +
>  static struct platform_driver keyboard_led_driver = {
>  	.driver		= {
>  		.name	= "chromeos-keyboard-leds",
>  		.acpi_match_table = ACPI_PTR(keyboard_led_acpi_match),
> +		.of_match_table = of_match_ptr(keyboard_led_of_match),
>  	},
>  	.probe		= keyboard_led_probe,
>  };
> -- 
> 2.36.1.124.g0e6072fb45-goog
> 
> 
