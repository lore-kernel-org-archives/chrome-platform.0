Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC8D10F3
	for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 00:37:26 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id i43so9279586vkd.12
        for <chrome-platform@lists.linux.dev>; Mon, 14 Mar 2022 17:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CODpzOBxQwLf27sayIOK3p7UHTpsGLb8Tfy9skwP2lw=;
        b=Qc4GH+AUCABplpZvWdWFcakbOOUkgnH7D/0+MSn00D8NMknMH3G72hDoGCQxsmpTAx
         ulAefEGZPCztPZFoO+Mfe5Ky/5GwGVbefb3K06O1SRy1rmwiWJjUEWHUHHDf4mvLWZoB
         PsQDa8HWKPlh7GOC4W57YVKJfLZN4zHigYv30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CODpzOBxQwLf27sayIOK3p7UHTpsGLb8Tfy9skwP2lw=;
        b=cwymYoWpCCQ5XDIGF88Rh1ThWhdNZkdq2TYzkFGyQbFdcTyqXWmT1lByUwv7kr9Fhl
         TZGpzYbSivhpQBjHgawB0OViM72p0dvtkNihJa7HeOP5AzsLXPLdaUE9ztaM/L3GpLOL
         yYN2/a0tflX1R0WkHGgdlF5BeC9LZRti3eZSV0OHTq63nq81u+jU9haacVrSHXdps4/C
         cmujp5UpGdJcIgAdqraR0MYW55yRA0kYpv2IwiUI2z8uCO1/zwjwnDC/JuIDWcctdt74
         xgf8SHy4sBn4BxXJsxqVSDulaPPY+5iSQ6tVfV9pj7ZtIdgyAAA+sGPBAgFepkvQu6Ro
         hsKQ==
X-Gm-Message-State: AOAM532QGUxkFGAFMI44ZubI7MEV8CFggsa0BbajEoutAYkRHZnXnpQS
	OAluazvCL7Hnp4aOKh67IDl7thJ3ck5OLA8Q
X-Google-Smtp-Source: ABdhPJzBQzvN/zSsiE+5WydgY2LUVBosw2B6lCPtJlHCj6x624s6w4tbMYA47QWgwAP+OOEtMqsSeg==
X-Received: by 2002:a05:6122:7d4:b0:337:8b19:ea0 with SMTP id l20-20020a05612207d400b003378b190ea0mr10601379vkr.12.1647304644972;
        Mon, 14 Mar 2022 17:37:24 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id h16-20020a67f890000000b0031bbdf19dafsm2215884vso.11.2022.03.14.17.37.24
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 17:37:24 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id j201so9274943vke.11
        for <chrome-platform@lists.linux.dev>; Mon, 14 Mar 2022 17:37:24 -0700 (PDT)
X-Received: by 2002:a1f:b48f:0:b0:336:84a6:71cc with SMTP id
 d137-20020a1fb48f000000b0033684a671ccmr10269171vkf.15.1647304643910; Mon, 14
 Mar 2022 17:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220314232214.4183078-1-swboyd@chromium.org> <20220314232214.4183078-3-swboyd@chromium.org>
In-Reply-To: <20220314232214.4183078-3-swboyd@chromium.org>
From: Alexandru M Stan <amstan@chromium.org>
Date: Mon, 14 Mar 2022 17:36:47 -0700
X-Gmail-Original-Message-ID: <CAHNYxRxcXF2hkgkyxsU0Fv-bo3qv8i6uSZ8n_X9dOR0atsjSHQ@mail.gmail.com>
Message-ID: <CAHNYxRxcXF2hkgkyxsU0Fv-bo3qv8i6uSZ8n_X9dOR0atsjSHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/chrome: cros_ec_spi: Boot fingerprint
 processor during probe
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Craig Hesling <hesling@chromium.org>, 
	Tom Hughes <tomhughes@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 14, 2022 at 4:22 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Add gpio control to this driver so that the fingerprint device can be
> booted if the BIOS isn't doing it already. This eases bringup of new
> hardware as we don't have to wait for the BIOS to be ready, supports
> kexec where the GPIOs may not be configured by the previous boot stage,
> and is all around good hygiene because we control GPIOs for this device
> from the device driver.
>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_spi.c | 38 ++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
> index 14c4046fa04d..77577650afce 100644
> --- a/drivers/platform/chrome/cros_ec_spi.c
> +++ b/drivers/platform/chrome/cros_ec_spi.c
> @@ -4,6 +4,7 @@
>  // Copyright (C) 2012 Google, Inc
>
>  #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -77,6 +78,8 @@ struct cros_ec_spi {
>         unsigned int start_of_msg_delay;
>         unsigned int end_of_msg_delay;
>         struct kthread_worker *high_pri_worker;
> +       struct gpio_desc *boot0;
> +       struct gpio_desc *reset;
>  };
>
>  typedef int (*cros_ec_xfer_fn_t) (struct cros_ec_device *ec_dev,
> @@ -690,7 +693,7 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
>         return cros_ec_xfer_high_pri(ec_dev, ec_msg, do_cros_ec_cmd_xfer_spi);
>  }
>
> -static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
> +static int cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
>  {
>         struct device_node *np = dev->of_node;
>         u32 val;
> @@ -703,6 +706,31 @@ static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
>         ret = of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val);
>         if (!ret)
>                 ec_spi->end_of_msg_delay = val;
> +
> +       if (!of_device_is_compatible(np, "google,cros-ec-fp"))
> +               return 0;
> +
> +       ec_spi->boot0 = devm_gpiod_get(dev, "boot0", 0);
> +       if (IS_ERR(ec_spi->boot0))
> +               return PTR_ERR(ec_spi->boot0);
> +
> +       ec_spi->reset = devm_gpiod_get(dev, "reset", 0);
> +       if (IS_ERR(ec_spi->reset))
> +               return PTR_ERR(ec_spi->reset);
> +
> +       /*
> +        * Take the FPMCU out of reset and wait for it to boot if it's in
> +        * bootloader mode or held in reset. Otherwise the BIOS has already
> +        * powered on the device earlier in boot in which case there's nothing
> +        * to do.
> +        */
> +       if (!gpiod_get_value(ec_spi->boot0) || gpiod_get_value(ec_spi->reset)) {
> +               gpiod_set_value(ec_spi->boot0, 1);
If you follow my suggestions on the other patch to keep boot0
active_high, this needs to change back to a 0. Since normal=0.

> +               gpiod_set_value(ec_spi->reset, 0);
> +               usleep_range(1000, 2000);
You have to be careful here. I assume by the end of this if you expect
the fpmcu to be in normal mode.

There is a corner case (which I guess is unlikely) that the fpmcu,
just before the if, was out of reset but in bootloader mode (boot0=1,
nrst=1, physically). At that point this code will enter the if body
and set boot0=0, but the reset signal would not be changed (we're
already out of reset!), so we'll still be in bootloader mode since
there was no resetting (so no sampling of boot0).

I suggest you change this if body to look like:

+               gpiod_set_value(ec_spi->boot0, 0); // normal mode
+               gpiod_set_value(ec_spi->reset, 1); // enter reset
(these reset comments might be optional)
+               usleep_range(1000, 2000);
+               gpiod_set_value(ec_spi->reset, 0); // release reset
+               usleep_range(1000, 2000); // maybe increase?

In the normal case (when we do have firmware support). All this code
will probably get skipped and there will be plenty of time to boot the
fpmcu before the driver enumerates.

Speaking of, have you tried this path? I think booting (fpmcu all the
way to RW) usually takes forever (seconds or so?). I remember Craig
mentioning this is why we want to do it so early (in ap firmware)
since by the time the kernel tries to enumerate it'll be done.

If that's the case you might want to change that last usleep_range to
actually wait that long.

> +       }
> +
> +       return 0;
>  }
>
>  static void cros_ec_spi_high_pri_release(void *worker)
> @@ -754,8 +782,10 @@ static int cros_ec_spi_probe(struct spi_device *spi)
>         if (!ec_dev)
>                 return -ENOMEM;
>
> -       /* Check for any DT properties */
> -       cros_ec_spi_dt_probe(ec_spi, dev);
> +       /* Check for any DT properties and boot fpmcu if applicable */
> +       err = cros_ec_spi_dt_probe(ec_spi, dev);
> +       if (err)
> +               return err;
>
>         spi_set_drvdata(spi, ec_dev);
>         ec_dev->dev = dev;
> @@ -813,12 +843,14 @@ static SIMPLE_DEV_PM_OPS(cros_ec_spi_pm_ops, cros_ec_spi_suspend,
>                          cros_ec_spi_resume);
>
>  static const struct of_device_id cros_ec_spi_of_match[] = {
> +       { .compatible = "google,cros-ec-fp", },
>         { .compatible = "google,cros-ec-spi", },
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, cros_ec_spi_of_match);
>
>  static const struct spi_device_id cros_ec_spi_id[] = {
> +       { "cros-ec-fp", 0 },
>         { "cros-ec-spi", 0 },
>         { }
>  };
> --
> https://chromeos.dev
>

Alexandru Stan (amstan)
