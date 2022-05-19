Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDD533C3
	for <chrome-platform@lists.linux.dev>; Thu, 19 May 2022 22:49:51 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id a38so3392266pgl.9
        for <chrome-platform@lists.linux.dev>; Thu, 19 May 2022 15:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2saWhTUkQyJcpgT7NxUB7z/NXdbK6i7lrg+kRf0ua9U=;
        b=XR8IkIQ/tR5EztT9hnYQ4x7VxP4o4xaG5dTpLJjw9cv9KgR/KLelp6gzgfjHqSDtFa
         eyOx3SMraPd44sPl7slCZaAIPIx+uRuqYgS/fuDaTNK+jzVC2gOOwyHn3KOJjUt7M0CO
         w5lPeMFS26r8UJteLxgDLt7VEhRBwUbkjZQz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2saWhTUkQyJcpgT7NxUB7z/NXdbK6i7lrg+kRf0ua9U=;
        b=AbZRZ0a94mGsd57STSyc8egRdm0mPe8tNvZqiKF+GNUoiml9boKTE75MBF/+XDyCeO
         vJJBtmVRspiTMnRNJh5Gt6YJ3uqGHcm2/rf7X6U/cqgPDLBC78SebpeN83g3B4yW4QCL
         cZD8t8s4y28U+1xR5h7qIT6BiOmnkiBBBGmLX7cQ7v48O+//oK5AitU1PtQ/8y67gd7U
         6QwLnsFvSOnlCel8Bv5LpB/akZeVCmItwEWcpXvV+Tu99Wn10T5iIf16HntEQNKiDJ4+
         nydS20SMxKPv/m6yoOOLSAeiujiKOuSIxLbrT7PoLBiUhKQlkkiIgAI4ZyWvgKPeo1Y9
         TMLg==
X-Gm-Message-State: AOAM532VbIrMB6usRL+QKK91/Ot8p388W64xNIypn+u34//DapWgGCaK
	4TXQTzdcKHRSE5A4SX/mlu/jeQ==
X-Google-Smtp-Source: ABdhPJxer1ytTKqzuWdCAQPhuryAQnKEqKOoHDjZgBuvh+jzhLmIgZvHny5FEURz6eAXn2cn5dwDJg==
X-Received: by 2002:a05:6a00:24c1:b0:50d:33cf:811f with SMTP id d1-20020a056a0024c100b0050d33cf811fmr7009401pfv.78.1653000590606;
        Thu, 19 May 2022 15:49:50 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:5332:2096:60a3:3455])
        by smtp.gmail.com with UTF8SMTPSA id z10-20020a17090a170a00b001dc1e6db7c2sm295791pjd.57.2022.05.19.15.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 15:49:49 -0700 (PDT)
Date: Thu, 19 May 2022 15:49:48 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 4/5] platform/chrome: cros_kbd_led_backlight: support
 OF match
Message-ID: <YobJjMmVOv1lBI/y@google.com>
References: <20220321085547.1162312-1-tzungbi@kernel.org>
 <20220321085547.1162312-5-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220321085547.1162312-5-tzungbi@kernel.org>

On Mon, Mar 21, 2022 at 04:55:46PM +0800, Tzung-Bi Shih wrote:
> For letting device tree based machines to use the driver, support OF match.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
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
> index 05b4f274086b..5cbe27cb4610 100644
> --- a/drivers/platform/chrome/cros_kbd_led_backlight.c
> +++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
> @@ -10,7 +10,9 @@
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  
>  /**
> @@ -127,7 +129,7 @@ static int keyboard_led_probe(struct platform_device *pdev)
>  	const struct keyboard_led_drvdata *drvdata;
>  	int error;
>  
> -	drvdata = acpi_device_get_match_data(&pdev->dev);
> +	drvdata = device_get_match_data(&pdev->dev);
>  	if (!drvdata)
>  		return -EINVAL;
>  
> @@ -163,10 +165,21 @@ static const struct acpi_device_id keyboard_led_acpi_match[] = {
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

In patch "[5/5] platform/chrome: cros_kbd_led_backlight: support EC PWM
backend" [1] you create the 'stubs' keyboard_led_init_ec_pwm_null() and
keyboard_led_drvdata_ec_pwm when CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM
isn't set, only to have something to assign to keyboard_led_of_match.data.
Instead you could assign .of_match_table only if CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM
is set.

[1] https://patchwork.kernel.org/project/chrome-platform/patch/20220321085547.1162312-6-tzungbi@kernel.org/

