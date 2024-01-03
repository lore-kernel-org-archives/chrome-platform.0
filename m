Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF334EA6
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jan 2024 00:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kN35KiJ7"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e766937ddso7933004e87.3
        for <chrome-platform@lists.linux.dev>; Tue, 02 Jan 2024 16:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704242776; x=1704847576; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1hNU8BfIre3e1QukJAFr9ZllMWSafWp32nf2QM+XZVU=;
        b=kN35KiJ7Z2mUI7yVQoXXjHHc0LPwLLaASoCQ3f4uCrVY6QpRPIim0M63vDcEaPfmFC
         XeJdhD+HB4h1ZEeFZDfr4jCWg1RccgCJjHl1SJYtbJNb6dbVdemK+INlvDTVRYxJIgx9
         yJwOQYs3l/TjJM4Q1UKT3t0Ku2isTGSNW3DKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704242776; x=1704847576;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hNU8BfIre3e1QukJAFr9ZllMWSafWp32nf2QM+XZVU=;
        b=CumE/jlLoNSBFWsUIFC0rczwmXpFsN65DIQuxPHHnx2xfvAqdqGG8gIsydkHXe6FjK
         JfWcZBJO+6hrmgyHXAyDp41jiwNX6/iv97d68mWSLhjZBjGLvUBBDDn1SShWe2a9hHIU
         iJKuIoIb8EuE5+pxxImM93CR767c/XVGf1wjaw8ZS8QaO5VuGKcS7lh8dTtsUPTD0MJN
         xAHtG+lHO9zkF6MpuMZfplzxKn5uyPlGETUAXdsfINM3DDeMwahkZ/fpasjHAR1X8S0z
         z4vL7x1FRxlLg6DtvDoWU2owEnFnfkuJyTWvubfJFByD7HYvss8Kc/WEF4MSygK4ydLw
         UrLw==
X-Gm-Message-State: AOJu0YzDjRJ/q3A+FqMBOm7N5Ya8NaoM7ARIlSOrieIOioes2/7Gw36F
	+y8F+XAQCWP9F79fAWIxdqq98XmPxnrCq6hTglHHDyEiQpf2
X-Google-Smtp-Source: AGHT+IF+JwZw/sDwj7p69VKhm6+YYJqO5p9bHTnAk1tPOiT55K434OdQd+IQNFrB0qycXTqv9ayFRGGVdI0n6bvvh1c=
X-Received: by 2002:a19:f80d:0:b0:50e:9ff8:d590 with SMTP id
 a13-20020a19f80d000000b0050e9ff8d590mr757326lff.50.1704242776465; Tue, 02 Jan
 2024 16:46:16 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jan 2024 16:46:15 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240102140734.v4.24.Ieee574a0e94fbaae01fd6883ffe2ceeb98d7df28@changeid>
References: <20240102210820.2604667-1-markhas@chromium.org> <20240102140734.v4.24.Ieee574a0e94fbaae01fd6883ffe2ceeb98d7df28@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 2 Jan 2024 16:46:15 -0800
Message-ID: <CAE-0n50zkwZ8nguUJcL1gjbuavhSU_rLxfGhanxB4YA7N34hLQ@mail.gmail.com>
Subject: Re: [PATCH v4 24/24] platform/chrome: cros_ec: Use PM subsystem to
 manage wakeirq
To: LKML <linux-kernel@vger.kernel.org>, Mark Hasemeyer <markhas@chromium.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Raul Rangel <rrangel@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Bhanu Prakash Maiya <bhanumaiya@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Prashant Malani <pmalani@chromium.org>, Rob Barnes <robbarnes@google.com>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Quoting Mark Hasemeyer (2024-01-02 13:07:48)
> The cros ec driver is manually managing the wake IRQ by calling
> enable_irq_wake()/disable_irq_wake() during suspend/resume.
>
> Modify the driver to use the power management subsystem to manage the
> wakeirq.
>
> Rather than assuming that the IRQ is wake capable, use the underlying
> firmware/device tree to determine whether or not to enable it as a wake
> source. Some Chromebooks rely solely on the ec_sync pin to wake the AP
> but do not specify the interrupt as wake capable in the ACPI _CRS. For
> LPC/ACPI based systems a DMI quirk is introduced listing boards whose
> firmware should not be trusted to provide correct wake capable values.

The DMI quirk looks to be fixing something. Most likely that should be
backported to stable kernels as well? Please split the DMI match table
part out of this so that it isn't mixed together with migrating the
driver to use the pm wakeirq logic.

> For device tree base systems, it is not an issue as the relevant device
> tree entries have been updated and DTS is built from source for each
> ChromeOS update.

It is still sorta an issue. It means that we can't backport this patch
without also backporting the DTS patch to the kernel. Furthermore, DTS
changes go through different maintainer trees, so having this patch in
the kernel without the DTS patch means the bisection hole is possibly
quite large.

Does using the pm wakeirq logic require the use of 'wakeup-source'
property in DT? A quick glance makes me believe it isn't needed, so
please split that part out of this patch as well. We should see a patch
for the DMI quirk, a patch to use wakeup-source (doubtful that we need
it at all though), and a patch to use the pm wakeirq logic instead of
hand rolling it again.

>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> ---
[...]
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index badc68bbae8cc..080b479f39a94 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -15,6 +15,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
>
> @@ -168,6 +169,35 @@ static int cros_ec_ready_event(struct notifier_block *nb,
>         return NOTIFY_DONE;
>  }
>
> +static int enable_irq_for_wake(struct cros_ec_device *ec_dev)
> +{
> +       struct device *dev = ec_dev->dev;
> +       int ret = device_init_wakeup(dev, true);
> +
> +       if (ret) {
> +               dev_err(dev, "Failed to enable device for wakeup");

Missing newline on printk message.

> +               return ret;
> +       }
> +       ret = dev_pm_set_wake_irq(dev, ec_dev->irq);
> +       if (ret)
> +               device_init_wakeup(dev, false);
> +
> +       return ret;

I'd rather see the code formatted like this:

	int ret;

	ret = device_init_wakeup(dev, true);
	if (ret) {
		dev_err(...);
		return ret;
	}

	ret = dev_pm_set_wake_irq(...);
	if (ret)
		device_init_wakeup(dev, false);
	
	return ret;

Mostly because the first 'if (ret)' requires me to hunt in the variable
declaration part of the function to figure out what it is set to instead
of looking at the line directly above.

> +}
> +
> +static int disable_irq_for_wake(struct cros_ec_device *ec_dev)
> +{
> +       int ret;
> +       struct device *dev = ec_dev->dev;
> +
> +       dev_pm_clear_wake_irq(dev);
> +       ret = device_init_wakeup(dev, false);
> +       if (ret)
> +               dev_err(dev, "Failed to disable device for wakeup");
> +
> +       return ret;
> +}
> +
>  /**
>   * cros_ec_register() - Register a new ChromeOS EC, using the provided info.
>   * @ec_dev: Device to register.
> @@ -221,6 +251,13 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>                                 ec_dev->irq, err);
>                         goto exit;
>                 }
> +               dev_dbg(dev, "IRQ: %i, wake_capable: %s\n", ec_dev->irq,

This one has a newline :)

> +                       str_yes_no(ec_dev->irq_wake));
> +               if (ec_dev->irq_wake) {
> +                       err = enable_irq_for_wake(ec_dev);
> +                       if (err)
> +                               goto exit;
> +               }
>         }
[...]
> diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
> index 3e88cc92e8192..102cdc3d1956d 100644
> --- a/drivers/platform/chrome/cros_ec_spi.c
> +++ b/drivers/platform/chrome/cros_ec_spi.c
> @@ -7,6 +7,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
> @@ -70,6 +71,7 @@
>   * @end_of_msg_delay: used to set the delay_usecs on the spi_transfer that
>   *      is sent when we want to turn off CS at the end of a transaction.
>   * @high_pri_worker: Used to schedule high priority work.
> + * @irq_wake: Whether or not irq assertion should wake the system.
>   */
>  struct cros_ec_spi {
>         struct spi_device *spi;
> @@ -77,6 +79,7 @@ struct cros_ec_spi {
>         unsigned int start_of_msg_delay;
>         unsigned int end_of_msg_delay;
>         struct kthread_worker *high_pri_worker;
> +       bool irq_wake;

This is only used in probe. Make it a local variable instead of another
struct member to save memory.

>  };
>
>  typedef int (*cros_ec_xfer_fn_t) (struct cros_ec_device *ec_dev,
> @@ -689,9 +692,10 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
>         return cros_ec_xfer_high_pri(ec_dev, ec_msg, do_cros_ec_cmd_xfer_spi);
>  }
>
> -static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
> +static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi)
>  {
> -       struct device_node *np = dev->of_node;
> +       struct spi_device *spi = ec_spi->spi;
> +       struct device_node *np = spi->dev.of_node;
>         u32 val;
>         int ret;
>
> @@ -702,6 +706,8 @@ static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
>         ret = of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val);
>         if (!ret)
>                 ec_spi->end_of_msg_delay = val;
> +
> +       ec_spi->irq_wake = spi->irq > 0 && of_property_present(np, "wakeup-source");

Is there any EC SPI device that doesn't want to support wakeup? I'd
prefer we introduce a new property or compatible string to indicate that
wakeup isn't supported and otherwise always set irq_wake to true. That
way DT can change in parallel with the driver instead of in lockstep.
