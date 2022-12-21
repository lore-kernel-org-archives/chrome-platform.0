Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4292F22
	for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 19:23:26 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id g4so17629857ybg.7
        for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 11:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K/sXvFrmbYs7P7b0KiJPCWXouTslsk2Z93msc3M9Inc=;
        b=U0iRcNnOyVoyaix10c4Z9dXZ6zTE/yxFFRgQDw/I5CHvFZq8ZvjPbRznPLM+KTWoOQ
         rBsTvGszZA6257XmcY9ZiVocUVlc36TBRMNxrwWCu4fr2oH3GCVEETQWVVmVwD7ZiPhZ
         0LcdZ7xVV/7p3Twg2Ju0zrY+erD+tyF1NzPx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/sXvFrmbYs7P7b0KiJPCWXouTslsk2Z93msc3M9Inc=;
        b=qVJTsiG6HIO5IXtGkLmhmsCCoySMpSLyonKgOzrMJTXDnNy3L7KYNN04BDmbJKSSCC
         qXqyblBEJzPhM+9maF209/PNXGK2+d82M4njGYM651vNdSxF0f5U7cuc3YsbQsdn7vdX
         rxqJ+2jljhf4kAy1617FOgJ05UEQMfYRkY0+F4kZZqEvxHNoDYolWPAJajMCrh5EOl+9
         kHl2HqbexC8VT5gTigAephMluzLexK6KzXmUNTfXMgEKHgVHf3bipv9NOLE8V1YoxHWC
         ni0q5MMAt6NtOcBCQLzhilGAgjPs1v/YbydTULeDlWXCbFaUNl0LDH8mmzjdpz9nomQm
         OIQw==
X-Gm-Message-State: AFqh2kpyZqxzYjLAdSot8AoAOcoMrqFPZm57s5kBzKq/TlFU6lVCMslt
	jtFcL142eP3M9qm3CbVtbWLNlcJ2nATbP838M/cVVelwo9X7uIRu
X-Google-Smtp-Source: AMrXdXuZORu9jTsPNLG+uGDrELKBm2RqdfngkRIY9XF0dFWhg3mxyRIAJwMaCdMkNmwhphndMXLlejioJgUHvu3ee1c=
X-Received: by 2002:a25:9a08:0:b0:740:b601:45e6 with SMTP id
 x8-20020a259a08000000b00740b60145e6mr261435ybn.121.1671650605658; Wed, 21 Dec
 2022 11:23:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221221185540.2265771-1-robbarnes@google.com>
In-Reply-To: <20221221185540.2265771-1-robbarnes@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 21 Dec 2022 11:23:14 -0800
Message-ID: <CACeCKafZu=46NE--r9W-wtJWAhj8=s46yCBO4N4u5nt4COqYAQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/cros_ec: Handle CrOS EC panics
To: Rob Barnes <robbarnes@google.com>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dtor@chromium.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

I'd suggest using the commit title tag "platform/chrome: cros_ec: ..."
for commits which are "ChromeOS EC" wide. That's in line with
other recent commits in this directory.

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
> +               blocking_notifier_call_chain(&ec_dev->panic_notifier, 0,
> +                                            ec_dev);
> +               /* Begin orderly shutdown. Force shutdown after 1 second. */
> +               hw_protection_shutdown("CrOS EC Panic", 1000);

I feel like this patch is doing 2 things: pulling the logs, and then
starting a shutdown.
This should be split into 2 patches.

> +       }
>  }

Line limits are now 100 chars[1], so most of these lines can fit on 1 line.

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

Can you provide a link (either in the commit, or here in the comment)
to the coreboot/BIOS code which uses this value? I feel this should
be documented in some form that correlates the caller and the callee.

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

Any reason we cannot use the existing event_notifier (with value argument)?
It's a system panic, so I doubt that computational overhead for other
notifier block
listeners is a concern.

BR,

-Prashant

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144
