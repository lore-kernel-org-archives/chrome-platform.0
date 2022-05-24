Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534887C
	for <chrome-platform@lists.linux.dev>; Tue, 24 May 2022 20:08:02 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id v5-20020a17090a7c0500b001df84fa82f8so3155466pjf.5
        for <chrome-platform@lists.linux.dev>; Tue, 24 May 2022 13:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=95joObH0DwG1ZqidG+ckHPbt1l+SEtovBpUjPuTMARQ=;
        b=Ns2bJ3hmUXS3Ha59g4WB/YCeIS3bfiBK+VHy4aBbe1YPC4MZF9l2OOdJcfOk7ryF5w
         6+QZoe4GUkVROZYVFDPXQo3YvvAUN0P/BXYCBXe3apQDv2ob3+HIZvbme0DxJ2idLlNq
         w4opPNJNfYvRVge96SoQ75Palo0WcphPukuZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=95joObH0DwG1ZqidG+ckHPbt1l+SEtovBpUjPuTMARQ=;
        b=zcFnZV2CVzFAxyRlL45LID+5IxXovufx/hFc5CwuHv9VHskgE3qIbIKD/MVtEq0MTK
         zDpzqhLteuWt2XFrMDjehMDOkm2miqZHw2ydm8TAQ23zpdriFuPDOnEVR5iOhhUXz/Sx
         3kJlSZ4S+/7TQGhwM48F57M/2evsCG/qJvwoFvPndrJ4lBwbzkvttG1p4710dINPr86z
         zBaXLvo/t35aDGXSiQBwEcjR5hWdcyBV01LY3PmDJgndxRj+lHN55DwtNOMIXHG+mll5
         laVx5iAawxbtZ/wPFx73TbG90eima2e6O/FDdbAp5iL3rgvvfkp3S4Wd/CHRYH5c5j4J
         b35Q==
X-Gm-Message-State: AOAM531TyHU+C9NXVbUtfPXHFlseQdLa+DKlxoj3/9KCnwyLG2cw3ZlZ
	pOeegPDFxnDhaAHLba9lth33Kg==
X-Google-Smtp-Source: ABdhPJyGffqe7c8R22Fe2/Z2lTu2ZUsTSmkFgyj/pojZItiJcQ0fRKHH4swVtz/YkeOzaTI4Qz7zWg==
X-Received: by 2002:a17:90a:1911:b0:1df:b08a:e252 with SMTP id 17-20020a17090a191100b001dfb08ae252mr6241484pjg.215.1653422881823;
        Tue, 24 May 2022 13:08:01 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:d9e2:8472:9ac:8532])
        by smtp.gmail.com with UTF8SMTPSA id d5-20020a170902b70500b0015ed003552fsm7632910pls.293.2022.05.24.13.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 13:08:01 -0700 (PDT)
Date: Tue, 24 May 2022 13:08:00 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 4/5] platform/chrome: cros_kbd_led_backlight: support
 OF match
Message-ID: <Yo07IDqYuQUzeL+N@google.com>
References: <20220523090822.3035189-1-tzungbi@kernel.org>
 <20220523090822.3035189-5-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220523090822.3035189-5-tzungbi@kernel.org>

On Mon, May 23, 2022 at 05:08:21PM +0800, Tzung-Bi Shih wrote:
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

You need to put this assignment inside an '#ifdef CONFIG_OF' block,
otherwise the compiler won't find 'keyboard_led_of_match' when
CONFIG_OF isn't set.
