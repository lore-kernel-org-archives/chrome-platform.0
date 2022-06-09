Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43F67C
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jun 2022 12:44:49 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id gl15so33364817ejb.4
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jun 2022 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lJk716YMYQiC9XdFOVA3hLNWPHrzbYIFzsjHZ4lXqXw=;
        b=jV749h/yzGdD7UVInBT9kRK0Jme4OUSWL30CvqTehv0OIPHZlrLh6yxz+uV4nlmaTT
         hyp845TnOHon/x7gEdAOK/HuLHltS6oC9HxWnNMR5S8ogJ9Z7JEZoA2UBxE3wlBo5DRH
         7PwNnpKT0SDKX59RxX4l7Sa1MuuIhZ6ouMthRqlJAVN574gK+mQ5h+J3z57z+Dj70Ltm
         tRTKF4wUesxloNjYbv7eM7BGrn0Rdd/4KR94SamXC+bL3AEBmrzZyrm4e5jcd6U7pFjD
         2J+x+a9wGbBFbhmkjFSqJ+L7wHho2UKB/rTNWO+LrGnjtVC3Sx2xCzYeMN3tH9lc4k4E
         o6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lJk716YMYQiC9XdFOVA3hLNWPHrzbYIFzsjHZ4lXqXw=;
        b=GuEzz0Iv6sDHgrmQE9GdBZxjDMv4y/bp5Y7Ca1W8IThbri9RusqAtT2ODFPvV+wEAv
         2UJOtEvyH6qnGbYlsUh7ZmV1FA9I4YcyuqlokrqkBzTpMiuhO5twJv3YpGs56wf1743G
         kjoICicxyDQKCN03kp0u68HYzFFC6nFoGn6MN3bpWcoWHxuyhnRTXLyWxVB1xDLJLIsM
         KUEVfJz/yBkk1xBl7YTvfpOA3dzUwgw0OWB4l7UB58GLkxSd2Yln/cWi9KuioU5icK92
         JB5n0fJ4MwS/swHPk6O4PH+A1IBu3e9U2qgNtd+NA1724HMFlYhCW4p7w36HW/lZeY16
         CXoA==
X-Gm-Message-State: AOAM5322LmzlhyW3kUYyGhYuokqr6MV6bfXPaMMU6bYPYHVMSYCDew8o
	H/+4CqFloi1BI8CTwEiKjSO/BTHajyl8TqGqX0XVFg==
X-Google-Smtp-Source: ABdhPJy6NNm52gjoT01K7OZnUFOxRXn6NtlR60/k5jcSePS1DE8jJ2xxM+kEnefp7nXZd72DEpx4T6QluDGZOm4xKoo=
X-Received: by 2002:a17:907:6ea4:b0:711:d106:b93a with SMTP id
 sh36-20020a1709076ea400b00711d106b93amr18861166ejc.189.1654778687717; Thu, 09
 Jun 2022 05:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220523090822.3035189-1-tzungbi@kernel.org> <20220523090822.3035189-3-tzungbi@kernel.org>
In-Reply-To: <20220523090822.3035189-3-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 9 Jun 2022 05:44:36 -0700
Message-ID: <CABXOdTeXB8V7ma9W6ZEQJeedvDg2xQOtJ5TduDmND-=BeDJpRA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] platform/chrome: cros_kbd_led_backlight: separate
 ACPI backend
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 23, 2022 at 2:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_kbd_led_backlight uses ACPI_KEYBOARD_BACKLIGHT_WRITE and
> ACPI_KEYBOARD_BACKLIGHT_READ for setting and getting the brightness
> respectively.
>
> Separate ACPI operations for preparing the driver to support other
> backends.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> Changes from v3:
> - Remove CROS_KBD_LED_BACKLIGHT_ACPI Kconfig.
> - Remove stub function.
>
> Changes from v2:
> - Use #ifdef for boolean CONFIG_CROS_KBD_LED_BACKLIGHT_ACPI.
>
> Changes from v1:
> - Update email address accordingly.
> - Use CONFIG_ACPI guard per "kernel test robot <lkp@intel.com>" reported an
>   unused variable issue.
>
>  .../platform/chrome/cros_kbd_led_backlight.c  | 82 ++++++++++++++++---
>  1 file changed, 69 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
> index f9587a562bb7..a86d664854ae 100644
> --- a/drivers/platform/chrome/cros_kbd_led_backlight.c
> +++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
> @@ -13,6 +13,33 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> +/**
> + * struct keyboard_led_drvdata - keyboard LED driver data.
> + * @init:                      Init function.
> + * @brightness_get:            Get LED brightness level.
> + * @brightness_set:            Set LED brightness level.  Must not sleep.
> + * @brightness_set_blocking:   Set LED brightness level.  It can block the
> + *                             caller for the time required for accessing a
> + *                             LED device register
> + * @max_brightness:            Maximum brightness.
> + *
> + * See struct led_classdev in include/linux/leds.h for more details.
> + */
> +struct keyboard_led_drvdata {
> +       int (*init)(struct platform_device *pdev);
> +
> +       enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
> +
> +       void (*brightness_set)(struct led_classdev *led_cdev,
> +                              enum led_brightness brightness);
> +       int (*brightness_set_blocking)(struct led_classdev *led_cdev,
> +                                      enum led_brightness brightness);
> +
> +       enum led_brightness max_brightness;
> +};
> +
> +#ifdef CONFIG_ACPI
> +
>  /* Keyboard LED ACPI Device must be defined in firmware */
>  #define ACPI_KEYBOARD_BACKLIGHT_DEVICE "\\_SB.KBLT"
>  #define ACPI_KEYBOARD_BACKLIGHT_READ   ACPI_KEYBOARD_BACKLIGHT_DEVICE ".KBQC"
> @@ -20,8 +47,8 @@
>
>  #define ACPI_KEYBOARD_BACKLIGHT_MAX            100
>
> -static void keyboard_led_set_brightness(struct led_classdev *cdev,
> -                                       enum led_brightness brightness)
> +static void keyboard_led_set_brightness_acpi(struct led_classdev *cdev,
> +                                            enum led_brightness brightness)
>  {
>         union acpi_object param;
>         struct acpi_object_list input;
> @@ -40,7 +67,7 @@ static void keyboard_led_set_brightness(struct led_classdev *cdev,
>  }
>
>  static enum led_brightness
> -keyboard_led_get_brightness(struct led_classdev *cdev)
> +keyboard_led_get_brightness_acpi(struct led_classdev *cdev)
>  {
>         unsigned long long brightness;
>         acpi_status status;
> @@ -56,12 +83,10 @@ keyboard_led_get_brightness(struct led_classdev *cdev)
>         return brightness;
>  }
>
> -static int keyboard_led_probe(struct platform_device *pdev)
> +static int keyboard_led_init_acpi(struct platform_device *pdev)
>  {
> -       struct led_classdev *cdev;
>         acpi_handle handle;
>         acpi_status status;
> -       int error;
>
>         /* Look for the keyboard LED ACPI Device */
>         status = acpi_get_handle(ACPI_ROOT_OBJECT,
> @@ -73,15 +98,44 @@ static int keyboard_led_probe(struct platform_device *pdev)
>                 return -ENXIO;
>         }
>
> +       return 0;
> +}
> +
> +static const struct keyboard_led_drvdata keyboard_led_drvdata_acpi = {
> +       .init = keyboard_led_init_acpi,
> +       .brightness_set = keyboard_led_set_brightness_acpi,
> +       .brightness_get = keyboard_led_get_brightness_acpi,
> +       .max_brightness = ACPI_KEYBOARD_BACKLIGHT_MAX,
> +};
> +
> +#endif /* CONFIG_ACPI */
> +
> +static int keyboard_led_probe(struct platform_device *pdev)
> +{
> +       struct led_classdev *cdev;
> +       const struct keyboard_led_drvdata *drvdata;
> +       int error;
> +
> +       drvdata = acpi_device_get_match_data(&pdev->dev);
> +       if (!drvdata)
> +               return -EINVAL;
> +
> +       if (drvdata->init) {
> +               error = drvdata->init(pdev);
> +               if (error)
> +                       return error;
> +       }
> +
>         cdev = devm_kzalloc(&pdev->dev, sizeof(*cdev), GFP_KERNEL);
>         if (!cdev)
>                 return -ENOMEM;
>
>         cdev->name = "chromeos::kbd_backlight";
> -       cdev->max_brightness = ACPI_KEYBOARD_BACKLIGHT_MAX;
>         cdev->flags |= LED_CORE_SUSPENDRESUME;
> -       cdev->brightness_set = keyboard_led_set_brightness;
> -       cdev->brightness_get = keyboard_led_get_brightness;
> +       cdev->max_brightness = drvdata->max_brightness;
> +       cdev->brightness_set = drvdata->brightness_set;
> +       cdev->brightness_set_blocking = drvdata->brightness_set_blocking;
> +       cdev->brightness_get = drvdata->brightness_get;
>
>         error = devm_led_classdev_register(&pdev->dev, cdev);
>         if (error)
> @@ -90,16 +144,18 @@ static int keyboard_led_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> -static const struct acpi_device_id keyboard_led_id[] = {
> -       { "GOOG0002", 0 },
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id keyboard_led_acpi_match[] = {
> +       { "GOOG0002", (kernel_ulong_t)&keyboard_led_drvdata_acpi },
>         { }
>  };
> -MODULE_DEVICE_TABLE(acpi, keyboard_led_id);
> +MODULE_DEVICE_TABLE(acpi, keyboard_led_acpi_match);
> +#endif
>
>  static struct platform_driver keyboard_led_driver = {
>         .driver         = {
>                 .name   = "chromeos-keyboard-leds",
> -               .acpi_match_table = ACPI_PTR(keyboard_led_id),
> +               .acpi_match_table = ACPI_PTR(keyboard_led_acpi_match),
>         },
>         .probe          = keyboard_led_probe,
>  };
> --
> 2.36.1.124.g0e6072fb45-goog
>
