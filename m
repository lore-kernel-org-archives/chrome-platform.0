Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7E11844
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 01:10:16 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id p19so1371952ybc.6
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 17:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kEAvnISlAgpQaUg6TOaHvEbXUrTyCqH15xyEbDSJWp0=;
        b=ZUZR+o7NNuMwO1tDYO+QNJg+NoAX33xWhrua8Z8KDMfC2GLtSZdyUBrn9hqmZc011V
         H9AOPKO1ShSUjtslz814QmDGdWyq4XsFxbPx9NTsbv9s9VZzqH4Rb7d+mDBITNARApIB
         ztT+jp2GyBVb3rGGQap/Dk+L7wisatjFXx0T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kEAvnISlAgpQaUg6TOaHvEbXUrTyCqH15xyEbDSJWp0=;
        b=L6sSYGU9nbSmK7kv7wVge0MohYSmfcbljjYqpHPH52NoajHPQKvLPg6gA3ztBGo1PX
         cy+u+CFZ9KN73bCqIQjtZJy7EmZergjbnfoAtfPUHq4LXzB1f1LCLRzK77ZBT5uTg6Xl
         Yesp4kKe+uyoH7nGXYSLR7Mhb8URUNKdNPXQA7LoHr1sIXo6m0fzUzWYKws1seuAyRfv
         Mw4C48rJmiicuZG+Kn2qOclG5iZU3DwSVvJkoJq4SK1SWzzUwaThfuPJbrB4AOKIbQ0k
         ayuQOCITMVYabkti9eC2KPbGeFr9rAq9lFdIg6DRKVoFkOnOhaK4OoMa+JILbY7qi17z
         I5pA==
X-Gm-Message-State: AOAM532DLg29hQZ8ZtrhBAebKsq40Rewx7L1sX5jHNE4iYdtlStF0bkH
	3pIBN2DU9oC/KczutmNbgOyGsZntL0NiDqYz+anHlP+pg3iaJw==
X-Google-Smtp-Source: ABdhPJyS++e5nIEG75PGyCAX0dVZV5d5K6bZd+I14kU4jBkU/7L3RVTaVSVHXVvfqzU4/OQusykc2yuGOrZm/jYCf0Y=
X-Received: by 2002:a05:6902:108:b0:621:165e:5c1e with SMTP id
 o8-20020a056902010800b00621165e5c1emr307818ybh.204.1644973815876; Tue, 15 Feb
 2022 17:10:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220214053646.3088298-1-tzungbi@google.com> <20220214053646.3088298-5-tzungbi@google.com>
In-Reply-To: <20220214053646.3088298-5-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 15 Feb 2022 17:10:04 -0800
Message-ID: <CACeCKac+b1Rp6bZFALn=sbh8gkJbWeKTC=8bdzp+-90pgq=wSw@mail.gmail.com>
Subject: Re: [PATCH 4/5] platform/chrome: cros_kbd_led_backlight: support OF match
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 13, 2022 at 9:37 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../platform/chrome/cros_kbd_led_backlight.c    | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
> index 814f2b74c602..ba853e55d29a 100644
> --- a/drivers/platform/chrome/cros_kbd_led_backlight.c
> +++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
> @@ -10,6 +10,7 @@
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> @@ -128,8 +129,11 @@ static int keyboard_led_probe(struct platform_device *pdev)
>         int error;
>
>         drvdata = acpi_device_get_match_data(&pdev->dev);
> -       if (!drvdata)
> -               return -EINVAL;
> +       if (!drvdata) {
> +               drvdata = of_device_get_match_data(&pdev->dev);
> +               if (!drvdata)
> +                       return -EINVAL;
> +       }

I'm not familiar with this driver, so can't do a full review, but
shouldn't device_get_match_data()
from property.h [1] be able to handle both DT and ACPI cases?

[1]: https://elixir.bootlin.com/linux/v5.17-rc4/source/include/linux/property.h

>
>         if (drvdata->init) {
>                 error = drvdata->init(pdev);
> @@ -161,10 +165,19 @@ static const struct acpi_device_id keyboard_led_acpi_match[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, keyboard_led_acpi_match);
>
> +static const struct of_device_id keyboard_led_of_match[] = {
> +       {
> +               .compatible = "google,cros-kbd-led-backlight",
> +       },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, keyboard_led_of_match);
> +
>  static struct platform_driver keyboard_led_driver = {
>         .driver         = {
>                 .name   = "chromeos-keyboard-leds",
>                 .acpi_match_table = ACPI_PTR(keyboard_led_acpi_match),
> +               .of_match_table = of_match_ptr(keyboard_led_of_match),
>         },
>         .probe          = keyboard_led_probe,
>  };
> --
> 2.35.1.265.g69c8d7142f-goog
>
>
