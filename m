Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE056320C
	for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 20:07:18 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id t15so5670149ybq.4
        for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 12:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B6cmF0YWEZPdYr9BoHTzVr8ewY/1EXW4D3kXTdBrkHI=;
        b=LQ3L6xtXhgmhQRI6VR9mHmyAudFNzogDjTP/XoUZxRFzBls+pHI7xYz8ZLGakfocyJ
         cZaQOG2GL7e75UUNDBQn6SzgEnNJeBqb45WuVvw2AchcY0ZkRqAA55D34A9qHwyTlKX0
         ewXpqUv0gl+eac8yVhdvY9mdluyTDFiwYanah8FuHvzHi1ga+BBJqOWr6vdlog/G8+ju
         wO/AFRYddVNEtWHEA2l6Ok/parI+F9WOZG3IizczqYEA8iPr/T/kIeGmg2djBmNJjH1y
         S0NKxBMfjSqzwgMM4xg59I4NwJB2U2HKvepf6LrRq9+DzIxwdIivOoObjREuZVkK8Zia
         KDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6cmF0YWEZPdYr9BoHTzVr8ewY/1EXW4D3kXTdBrkHI=;
        b=e4BxwRdP+I/bpbVjAOKK2QlyGTyZsWuwKxOaFngpnhhns9SFH0QqAKVU3LZ0haycpC
         ipqUVfUP1zM9hCXv6GEBs9YUKsHCbBiuFrVfoN0fbFHsybUlk1IYp/HTs+IuAFQF91de
         AgQmqbxL+VTP26/CwjZ5vP/GbtAbVHVm9cKONOtOaoen6FiFQi/FUTZfnJlu4I+yw2DP
         7QV0KLtt1x8NszFirKqg90Cjo5ltl1p3oOOVxieXfM3QgRargAofPmA+4BQRpAg08FqJ
         zFAbAmvpLoeIbCQUTgEevjKzsN9ce9W/r7tivmlCMliQWS2w9FKGFFoKZz1MsnMIhDYl
         Zvtg==
X-Gm-Message-State: AFqh2korBmFxZmWTcdWDNCprCRxUhfjAJKcx2V24RaLGqIOBErmS3wrI
	DBzNSLwkf+wLsuQPSOUP0kbO20Y4+ANSP1hdhYJZIA==
X-Google-Smtp-Source: AMrXdXt89bk240ZtMbpOsVTlv/VVD4cTi/mOBjPwkEgJu8AI3lhWZJ8FKcHI0Lh9dnkRFNd6SoXgztWJlyAoeecnYdQ=
X-Received: by 2002:a05:6902:1817:b0:723:be61:1a2c with SMTP id
 cf23-20020a056902181700b00723be611a2cmr355752ybb.130.1671653237679; Wed, 21
 Dec 2022 12:07:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221221185540.2265771-1-robbarnes@google.com>
In-Reply-To: <20221221185540.2265771-1-robbarnes@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 21 Dec 2022 12:07:06 -0800
Message-ID: <CABXOdTcHppsLTDTXBd9ikL+Hk8W4oW_NkWMhOJgmf9aDSW+FKA@mail.gmail.com>
Subject: Re: [PATCH] drivers/cros_ec: Handle CrOS EC panics
To: Rob Barnes <robbarnes@google.com>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dtor@chromium.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 21, 2022 at 10:56 AM Rob Barnes <robbarnes@google.com> wrote:
>
> Add handler for CrOS EC panic events. When a panic is reported,
> poll EC log then force an orderly shutdown.
>
> This will preserve the EC log leading up to the crash.
>
> Signed-off-by: Rob Barnes <robbarnes@google.com>
> ---
>  drivers/platform/chrome/cros_ec_debugfs.c   | 24 +++++++++++++++++++++
>  drivers/platform/chrome/cros_ec_lpc.c       | 10 +++++++++
>  include/linux/platform_data/cros_ec_proto.h |  9 ++++++++
>  3 files changed, 43 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
> index 21d973fc6be2..31637a4e4cf9 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -49,6 +49,7 @@ struct cros_ec_debugfs {
>         struct delayed_work log_poll_work;
>         /* EC panicinfo */
>         struct debugfs_blob_wrapper panicinfo_blob;
> +       struct notifier_block notifier_panic;
>  };
>
>  /*
> @@ -437,6 +438,23 @@ static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
>         return ret;
>  }
>
> +static int cros_ec_debugfs_panic_event(struct notifier_block *nb,
> +                                      unsigned long queued_during_suspend,
> +                                      void *_notify)
> +{
> +       struct cros_ec_debugfs *debug_info =
> +               container_of(nb, struct cros_ec_debugfs, notifier_panic);
> +
> +       if (debug_info->log_buffer.buf) {
> +               /* Force log poll work to run immediately */
> +               mod_delayed_work(debug_info->log_poll_work.wq, &debug_info->log_poll_work, 0);
> +               /* Block until log poll work finishes */
> +               flush_delayed_work(&debug_info->log_poll_work);
> +       }
> +
> +       return NOTIFY_DONE;
> +}
> +
>  static int cros_ec_debugfs_probe(struct platform_device *pd)
>  {
>         struct cros_ec_dev *ec = dev_get_drvdata(pd->dev.parent);
> @@ -473,6 +491,12 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
>         debugfs_create_u16("suspend_timeout_ms", 0664, debug_info->dir,
>                            &ec->ec_dev->suspend_timeout_ms);
>
> +       debug_info->notifier_panic.notifier_call = cros_ec_debugfs_panic_event;
> +       ret = blocking_notifier_chain_register(&ec->ec_dev->panic_notifier,
> +                                              &debug_info->notifier_panic);
> +       if (ret)
> +               goto remove_debugfs;
> +
>         ec->debug_info = debug_info;
>
>         dev_set_drvdata(&pd->dev, ec);
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index 7fc8f82280ac..21958c3b0c28 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -21,6 +21,7 @@
>  #include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
>  #include <linux/printk.h>
> +#include <linux/reboot.h>
>  #include <linux/suspend.h>
>
>  #include "cros_ec.h"
> @@ -332,6 +333,15 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
>
>         if (value == ACPI_NOTIFY_DEVICE_WAKE)
>                 pm_system_wakeup();
> +
> +       if (value == ACPI_NOTIFY_CROS_EC_PANIC) {
> +               dev_err(ec_dev->dev,
> +                       "CrOS EC Panic Reported. Shutdown is imminent!");

dev_emerg() would seem to be more appropriate, given that we'll be
crashing a second later.

> +               blocking_notifier_call_chain(&ec_dev->panic_notifier, 0,
> +                                            ec_dev);
> +               /* Begin orderly shutdown. Force shutdown after 1 second. */
> +               hw_protection_shutdown("CrOS EC Panic", 1000);

That seems to be the wrong API. From its description:

 * Initiate an emergency system shutdown in order to protect hardware from
 * further damage. Usage examples include a thermal protection or a voltage or
 * current regulator failures.

This is an EC crash that apparently can not be handled gracefully.
That has nothing to do with hardware protection. Why not just call
panic() ?

> +       }

It troubles me that this comes last. That means the entire
mkbp_event_supported handling executes first. What troubles me even
more is that 'value' is, with the exception of
ACPI_NOTIFY_DEVICE_WAKE, not checked at all. Presumably the EC sends
some well defined value if it has an event to report. I don't think it
is a good idea to depend on cros_ec_get_next_event() returning
something useful after the EC crashed.

How is this handled today ? Does the EC just reset the AP ?

>  }
>
>  static int cros_ec_lpc_probe(struct platform_device *pdev)
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> index e43107e0bee1..1c4487271836 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -41,6 +41,13 @@
>  #define EC_MAX_REQUEST_OVERHEAD                1
>  #define EC_MAX_RESPONSE_OVERHEAD       32
>
> +/*
> + * EC panic is not covered by the standard (0-F) ACPI notify values.
> + * Arbitrarily choosing B0 to notify ec panic, which is in the 84-BF
> + * device specific ACPI notify range.
> + */
> +#define ACPI_NOTIFY_CROS_EC_PANIC      0xB0
> +
>  /*
>   * Command interface between EC and AP, for LPC, I2C and SPI interfaces.
>   */
> @@ -176,6 +183,8 @@ struct cros_ec_device {
>         /* The platform devices used by the mfd driver */
>         struct platform_device *ec;
>         struct platform_device *pd;
> +
> +       struct blocking_notifier_head panic_notifier;
>  };
>
>  /**
> --
> 2.39.0.314.g84b9a713c41-goog
>
