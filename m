Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BBCA42
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 06:54:44 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id bp15so19512688ejb.6
        for <chrome-platform@lists.linux.dev>; Sun, 17 Jul 2022 23:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Wf3nz0D32YPk/y25pAQGhDQ1uTDwJ1vjvWzFxFZHho=;
        b=Ih+9aNjIeLTpADvaHAVyzE/9Uv2qM+Aey4UGoF+VMVge3MFhBt9ewvTNE+mU3yn44w
         A5+1FZasc2gPR68mlTe/uEt7GAJxFdaQFHktdNPRH6/CFPDR2gXztTpIRPYObF4gitXd
         TZ1lgSK2X37oA0Z4uZBTiAvU0ArMCukhL9fdmZU6pmPXqi6/diRgxvG2E2VhEHRlxD8f
         JVzjCoUN12HTHGj9wlPhxSIjxTjitGtAbC2b8GmfcNbE8oFgR3wNCTPQXIDYk110+xt6
         qUpWOfYlEjgqeGQ4xrS6HZs2IKccJLEUaeG/XOLgKcXo+dM0nWCDyb7olQv49hqFFp2m
         Md+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Wf3nz0D32YPk/y25pAQGhDQ1uTDwJ1vjvWzFxFZHho=;
        b=KbG3Qw5Kvlb2bR7zxzmfxcxUU/fpvTCYo1ECfgx5BFTTQ8Odtj1aUkd8noZnHe7WfM
         RhQpdoNJEkdMyIRFjEa3/0AH9GZcW2QH4pZ2PpdUj/NcMx3aeD8D+qUDVX6y5f+5KAzD
         KrhOFmuExYT6rMHsSXr6T9/7Tj3wG151W/03sVJeEZYVzWLFzTi4q5EmO9bqIsP+BFXq
         HnccWdxM6/iC4D0PB3Y40y8QT+GzecePnPIhLwBIkai1dcskHq1oaOkp4cZuQBemVi8T
         TcpDAtiGq8vV5mgy43Yj66TGHZhazWs3uT4XtcKTmkGirBxfJiUw9VayVT2ip5GRhnE4
         u9NA==
X-Gm-Message-State: AJIora94X3rU8lHlPxNVVs9N4IR2bCnafQ73F2oAhz41Ryf935uakQ++
	dO4o6vGREFnj/Vb66pzP2x+4KPbF2FmFAvatg/Lk4w==
X-Google-Smtp-Source: AGRyM1vEW2fHt3QyClItms5lOeJKBbgwfyE4WQDULLAvCf0Qqtqg8io+RzvCaT1lotn0yOTNZGTQJE9IFkzFljFVot0=
X-Received: by 2002:a17:907:160c:b0:72f:1031:2184 with SMTP id
 hb12-20020a170907160c00b0072f10312184mr9807494ejc.355.1658127282713; Sun, 17
 Jul 2022 23:54:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220718061608.2303425-1-tzungbi@kernel.org>
In-Reply-To: <20220718061608.2303425-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Sun, 17 Jul 2022 23:54:31 -0700
Message-ID: <CABXOdTeH-q=17QBnCn5NGT5V0QA5SOaTnrWaK+g5F3j4mVp8cA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_kbd_led_backlight: fix build warning
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 17, 2022 at 11:16 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> drivers/platform/chrome/cros_kbd_led_backlight.c got a new build warning
> when using the randconfig in [1]:
> >>> warning: unused variable 'keyboard_led_drvdata_ec_pwm'
>
> The warning happens when CONFIG_CROS_EC is set but CONFIG_OF is not set.
> Reproduce:
> - mkdir build_dir
> - wget [1] -O build_dir/.config
> - COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 \
>   O=build_dir ARCH=s390 SHELL=/bin/bash drivers/platform/chrome/
>

Have you tried the following ?
    CONFIG_ACPI=y
    CONFIG_CROS_EC=n
    CONFIG_OF=y

That should be possible, but with your patch it should now result in a
build error because keyboard_led_drvdata_ec_pwm is no longer defined.

Also, with your patch, CONFIG_CROS_EC=y, CONFIG_ACPI=y, and
CONFIG_OF=n (ie Intel/AMD systems) would result in the code not being
compiled, which would be wrong.

Thanks,
Guenter

> Fix the warning by hardening the guard condition.  Also use IS_ENABLED()
> because CROS_EC is a tristate.
>
> [1]: https://download.01.org/0day-ci/archive/20220717/202207170538.MR39dw8m-lkp@intel.com/config
>
> Fixes: 40f58143745e ("platform/chrome: cros_kbd_led_backlight: support EC PWM backend")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/cros_kbd_led_backlight.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
> index 5ad41c10412d..4a0b2bd004d5 100644
> --- a/drivers/platform/chrome/cros_kbd_led_backlight.c
> +++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
> @@ -119,7 +119,7 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_acpi = {
>
>  #endif /* CONFIG_ACPI */
>
> -#ifdef CONFIG_CROS_EC
> +#if IS_ENABLED(CONFIG_CROS_EC) && defined(CONFIG_OF)
>
>  static int
>  keyboard_led_set_brightness_ec_pwm(struct led_classdev *cdev,
> @@ -187,11 +187,7 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm = {
>         .max_brightness = KEYBOARD_BACKLIGHT_MAX,
>  };
>
> -#else /* CONFIG_CROS_EC */
> -
> -static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm = {};
> -
> -#endif /* CONFIG_CROS_EC */
> +#endif /* IS_ENABLED(CONFIG_CROS_EC) && defined(CONFIG_OF) */
>
>  static int keyboard_led_probe(struct platform_device *pdev)
>  {
> --
> 2.37.0.170.g444d1eabd0-goog
>
