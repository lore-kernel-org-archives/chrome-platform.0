Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4575137
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 20:50:21 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id bi12so19285870ejb.3
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 13:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EqXyMcosh6O0yi35uVm3REnikABrKVmHdEClLD8qyRQ=;
        b=IIT21OtaTmFd1XK0u6Xj60LiXC6QZvzAlZbuCV/xuBgzlIKcEGJjbfpHDztxQaxexU
         J/8dykpwdVx1ckyCUwy6SB/8Gu6oasOoV0msxHqdymPqhwhlYtCpTL1wqMY5A1NY7CcG
         TvGyx0F5A7Bp9NxRlaUGtGaEPSRAJdBxyKRY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EqXyMcosh6O0yi35uVm3REnikABrKVmHdEClLD8qyRQ=;
        b=ecDQmizziqNO5Znxgb8itQB8zSPpTpoeTWhOzyMZQeroOjFRBSqaeiLL3jpANvHFoe
         KO/rgrjBLtKgsUxqy5Uk5H8mjOwdaTONd2Tot41zkzmLNDtpSsqX0SYhYVCl73N6ybt6
         toLyN9rrGKavP+09RCGPCtx4CxUJM3Ue90YZDoVJlUoVD0Jij68J09e6L3d47LSl2b59
         OtdvVyEMXaaf/NTxtn+ytpWbYj9qQ/1kSBNqiZImfsalghZvsHEgw6+Cn4A14yp9ki+q
         76/set9NW6HQntoU35/C/teF8n39XZQnWA0WbWAffEUaWgIA6chXtfCZ00tP/bd/mjp6
         Wk7Q==
X-Gm-Message-State: AOAM5302OHyRa8c23VHshblZZf4D2pNpr34vQuAjHnUCvMOlXc2CNlPj
	+aZ1iZsfTn6WzhvAofD2gY4ms3OLxq0dRfKeHAs=
X-Google-Smtp-Source: ABdhPJwwebfjIAIGLrcxOBvylxKyMRLlNnsastpnZjAaI6BrSDMsFC25Ef9deQOKJN8U4kSZzaIXRg==
X-Received: by 2002:a17:907:608b:b0:6da:8fa8:27e8 with SMTP id ht11-20020a170907608b00b006da8fa827e8mr10520331ejc.168.1647636619814;
        Fri, 18 Mar 2022 13:50:19 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id w19-20020a05640234d300b00416baf4cdcasm4744615edc.48.2022.03.18.13.50.18
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 13:50:19 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id bi13-20020a05600c3d8d00b0038c2c33d8f3so4607730wmb.4
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 13:50:18 -0700 (PDT)
X-Received: by 2002:a05:600c:2e02:b0:38c:8390:d8ca with SMTP id
 o2-20020a05600c2e0200b0038c8390d8camr6529516wmf.15.1647636618463; Fri, 18 Mar
 2022 13:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220318015451.2869388-1-swboyd@chromium.org> <20220318015451.2869388-4-swboyd@chromium.org>
In-Reply-To: <20220318015451.2869388-4-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Mar 2022 13:50:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VJFoNgfMUHE5mUY6Uq2Jj5cyQVyW0osUm6jyHRE1no=w@mail.gmail.com>
Message-ID: <CAD=FV=VJFoNgfMUHE5mUY6Uq2Jj5cyQVyW0osUm6jyHRE1no=w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] platform/chrome: cros_ec_spi: Boot fingerprint
 processor during probe
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, 
	Alexandru M Stan <amstan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Mar 17, 2022 at 6:55 PM Stephen Boyd <swboyd@chromium.org> wrote:
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
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_spi.c | 42 +++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
> index d0f9496076d6..13d413a2fe46 100644
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

This structure has members described with kernel-doc. You should
document your members.


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
> @@ -703,6 +706,37 @@ static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
>         ret = of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val);
>         if (!ret)
>                 ec_spi->end_of_msg_delay = val;
> +
> +       if (!of_device_is_compatible(np, "google,cros-ec-fp"))
> +               return 0;

I noticed in your previous patch that you not only added a device-tree
match for this device but also a "spi_device_id". ...but won't you
fail to do all this important GPIO work in that case?


> +       ec_spi->boot0 = devm_gpiod_get(dev, "boot0", 0);
> +       if (IS_ERR(ec_spi->boot0))
> +               return PTR_ERR(ec_spi->boot0);

Right now these GPIOs don't actually need to be stored in the "ec_spi"
structure. They could just be local variables. I guess you're trying
to future proof?


> +       ec_spi->reset = devm_gpiod_get(dev, "reset", 0);
> +       if (IS_ERR(ec_spi->reset))
> +               return PTR_ERR(ec_spi->reset);
> +
> +       /*
> +        * Take the FPMCU out of reset and wait for it to boot if it's in
> +        * bootloader mode or held in reset. This isn't the normal flow because
> +        * typically the BIOS has already powered on the device to avoid the
> +        * multi-second delay waiting for the FPMCU to boot and be responsive.
> +        */
> +       if (gpiod_get_value(ec_spi->boot0) || gpiod_get_value(ec_spi->reset)) {
> +               /* Boot0 is sampled on reset deassertion */
> +               gpiod_set_value(ec_spi->boot0, 0);
> +               gpiod_set_value(ec_spi->reset, 1);
> +               usleep_range(1000, 2000);
> +               gpiod_set_value(ec_spi->reset, 0);
> +
> +               /* Wait for boot; there isn't a "boot done" signal */
> +               dev_info(dev, "Waiting for FPMCU to boot\n");
> +               msleep(2000);
> +       }

You added the regulator to the bindings. On herobrine I know that the
regulator is a bit of a dummy (at least on herobrine), but I wonder if
you should still get/enable it here? In the device tree bindings you
listed it as not-optional so, in theory, you could use this to give an
error if someone didn't provide the regulator.

BTW: it seems like it wouldn't be a _crazy_ amount of extra work to:

1. Add a sysfs hook for turning the regulator on/off

2. Change the Chrome OS userspace to actually use the sysfs hook if it's there.

3. Actually have the kernel in charge of turning the regulator off/on

Doing this at the same time as the transition over to the more real
"cros-ec-fp" would be nice so we don't have to figure out how to
transition later. Said another way: If we don't transition now then I
guess later we'd have to find some way to detect that the regulator
specified in the kernel was actually a dummy and didn't really control
the power?
