Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A291876
	for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 21:40:03 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id y129so119701ybe.7
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 13:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xbMJm7hnRfVeoW3ssL5uNjXBrArVR9+9S+WXU8n9WHY=;
        b=XmzYqRbQK5ZIObORf+XLTWpGL7FcrNaHNiL54QSrT9M45FB6IeZQXznx4MLmeHwHDw
         Yxfd6KhhDAHrL8nNXz18aid9Lr0EWfIknhMGxw3Ytur/QGpTAn5idgayMzDeS7qCJZi9
         9l/o6KagDFC8Boe/ctzYGXEuJpBOPVQt0MK8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xbMJm7hnRfVeoW3ssL5uNjXBrArVR9+9S+WXU8n9WHY=;
        b=Ya05xe8iU8VLzgRCOJqf3SJt7fMTwXwaNy6m5bUeWDk07xDHSjVyWwCZvCeEexM/Io
         zuOdQLC1JZ+KBjqbwdSTAkLBMxKj0eodboVTJvPbsSM7sH1Z00LnLiauQDfLPIAN8Npk
         gKhfjoIWvGfo9xtBpPWgzHlgwRzrg+IGTvDemEVyaiJ1vyQNXMLgVKLRlXKiwfffd681
         /sVy4HLJ/3lDvcJxRaRaehUvUZ/bhoEdx/Q+pVEwqcUsJ3qfP/1CUX+o41qQQTugIHh6
         7yWU3uV4VzdJBrkwPsYz40/Sb6cS1aOYIXK1bR4sveRWGP/4ngzce7ro7t4kfeQSZLIF
         Vhmg==
X-Gm-Message-State: AOAM531D1F9HTH2weAWiYb0GaFUIBB2/fnse5yMuEZKyV1dw7CTbm3/S
	qzfNU1ytwGmz1KFEAtCMNRBDax/7az1oZBfhe32xRw==
X-Google-Smtp-Source: ABdhPJyUaCP0goIGw2/lZsYGbhwEyaszsmmHpVqHbadGQ7/boqkC+6G6zQxe4QMLQfskJmr2AQm7d+86eftKozy8CFA=
X-Received: by 2002:a81:d84b:: with SMTP id n11mr842751ywl.235.1644961202529;
 Tue, 15 Feb 2022 13:40:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209095703.517608-1-tzungbi@google.com> <20220209095703.517608-2-tzungbi@google.com>
In-Reply-To: <20220209095703.517608-2-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 15 Feb 2022 13:39:51 -0800
Message-ID: <CACeCKadu0f04Mip8R1OgucfN5GvU9RBEbgq6RQZiVWAePxZChA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] platform/chrome: cros_ec: fix error handling in cros_ec_register()
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Feb 09 17:56, Tzung-Bi Shih wrote:
> Fix cros_ec_register() to unregister platform devices if
> blocking_notifier_chain_register() fails.
>
> Also use the single exit path to handle the platform device
> unregistration.
>
> Fixes: 42cd0ab476e2 ("platform/chrome: cros_ec: Query EC protocol version if EC transitions between RO/RW")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Changes from v2:
> (https://patchwork.kernel.org/project/chrome-platform/patch/20220209045035.380615-2-tzungbi@google.com/)
> - Fix grammar error in commit message.
> - Change the code that don't rely on zeroed memory.
> - Remove unnecessary `if` checks before calling platform_device_unregister().
>
> Changes from v1:
> (https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
> - Use imperative mood in commit message.
> - Use IS_ERR_OR_NULL() in 1st patch.
>
>  drivers/platform/chrome/cros_ec.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index fc5aa1525d13..15f599d721a1 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -245,18 +245,16 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>               if (IS_ERR(ec_dev->pd)) {
>                       dev_err(ec_dev->dev,
>                               "Failed to create CrOS PD platform device\n");
> -                     platform_device_unregister(ec_dev->ec);
> -                     return PTR_ERR(ec_dev->pd);
> +                     err = PTR_ERR(ec_dev->pd);
> +                     goto exit;
>               }
>       }
>
>       if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
>               err = devm_of_platform_populate(dev);
>               if (err) {
> -                     platform_device_unregister(ec_dev->pd);
> -                     platform_device_unregister(ec_dev->ec);
>                       dev_err(dev, "Failed to register sub-devices\n");
> -                     return err;
> +                     goto exit;
>               }
>       }
>
> @@ -278,7 +276,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>               err = blocking_notifier_chain_register(&ec_dev->event_notifier,
>                                                     &ec_dev->notifier_ready);
>               if (err)
> -                     return err;
> +                     goto exit;
>       }
>
>       dev_info(dev, "Chrome EC device registered\n");
> @@ -291,6 +289,11 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>               cros_ec_irq_thread(0, ec_dev);
>
>       return 0;
> +exit:
> +     if (ec_dev->max_passthru)

This just complicates things, by depending on another variable. Just initialize
ec_dev->pd and ec_dev->ec to NULL at the beginning instead.


> +             platform_device_unregister(ec_dev->pd);
> +     platform_device_unregister(ec_dev->ec);
> +     return err;
>  }
>  EXPORT_SYMBOL(cros_ec_register);
>
> --
> 2.35.0.263.gb82422642f-goog
>

-Prashant
