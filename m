Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BDF1FD6
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 05:44:17 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id p19so2790839ybc.6
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 21:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xUX2gGb4q9RgsXc3hYoQEWgo8mO0FjMCfMCTy48wb2A=;
        b=Fq9iZVWr63JMbE4z8EIABfFdWg0dyQriiZLYFIKOJZ6xrinA11J6PENKZGLYRg04QL
         oyqWm6vyEnuBsdPe51WISG/16IpBQLP79ADh0Eci4SHAJddUNiBArnIoPAl9JcgFs5/o
         KXdfG0r657HQHrSc3ZGRAyXOWBAdJqB8bpq1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xUX2gGb4q9RgsXc3hYoQEWgo8mO0FjMCfMCTy48wb2A=;
        b=cUDsaRFbFefuxBaxtp5s6mfcHWJOcgUVRAWJjdhKdju860BNjYl4veytZjUX3deAGy
         oaLjmBOVHEfPnzO/kfvH7n9xfAzaKR0JRqBQO/PehD/TdrT6Hjkpy4hl8KD77bi6p8Ld
         USwGjVRR3T3SE92vuJX9UQ2XLF8e+VSjxGjbyqH5uQxm7jjmGfDdPtX8JQlKDmhlxv9o
         dmpmCsdYYDjjPtNAVEYNuXq3vfSE3qxqbYOTRMhOjAWS4yO1HmtsvjoB+hDGQ59W6Kc9
         ar0PcOKrMReihLrXE9oUP8MAkjSA8gm2fcXz/fDKUWQ35Pf73uAXD9+XNjBmWdyX7o8c
         a8/g==
X-Gm-Message-State: AOAM532qLm3drie7gdjVrwMck7KVTNkfO+kRQye7TCdiyIK69BhY4SL9
	pAuUILJ6X+8sjbn+YXtTY9hWMeO+10ao3J+oITaEhA==
X-Google-Smtp-Source: ABdhPJyoOBHj9aERFjBzPOp1qqIBoody04TpuQ+ZpLJwZI51SkYZMQ9SWxhiNxqsT77IcJJ+z4ZNJfVKFtjlXr0fMjc=
X-Received: by 2002:a05:6902:108:b0:621:165e:5c1e with SMTP id
 o8-20020a056902010800b00621165e5c1emr931384ybh.204.1644990256845; Tue, 15 Feb
 2022 21:44:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220216043639.3839185-1-tzungbi@google.com> <20220216043639.3839185-2-tzungbi@google.com>
In-Reply-To: <20220216043639.3839185-2-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 15 Feb 2022 21:44:05 -0800
Message-ID: <CACeCKacUDgBHfcb+7rCibhUgJfM-a6kBYrGQdgF9u002tDBVOQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] platform/chrome: cros_ec: fix error handling in cros_ec_register()
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 8:36 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Fix cros_ec_register() to unregister platform devices if
> blocking_notifier_chain_register() fails.
>
> Also use the single exit path to handle the platform device
> unregistration.
>
> Fixes: 42cd0ab476e2 ("platform/chrome: cros_ec: Query EC protocol version if EC transitions between RO/RW")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>

> ---
> Changes from v3:
> (https://patchwork.kernel.org/project/chrome-platform/patch/20220209095703.517608-2-tzungbi@google.com/)
> - Simplify by initializing the variables at the beginning.
>
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
>  drivers/platform/chrome/cros_ec.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index fc5aa1525d13..ff2a24b0c611 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -189,6 +189,8 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>         ec_dev->max_request = sizeof(struct ec_params_hello);
>         ec_dev->max_response = sizeof(struct ec_response_get_protocol_info);
>         ec_dev->max_passthru = 0;
> +       ec_dev->ec = NULL;
> +       ec_dev->pd = NULL;
>
>         ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
>         if (!ec_dev->din)
> @@ -245,18 +247,16 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>                 if (IS_ERR(ec_dev->pd)) {
>                         dev_err(ec_dev->dev,
>                                 "Failed to create CrOS PD platform device\n");
> -                       platform_device_unregister(ec_dev->ec);
> -                       return PTR_ERR(ec_dev->pd);
> +                       err = PTR_ERR(ec_dev->pd);
> +                       goto exit;
>                 }
>         }
>
>         if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
>                 err = devm_of_platform_populate(dev);
>                 if (err) {
> -                       platform_device_unregister(ec_dev->pd);
> -                       platform_device_unregister(ec_dev->ec);
>                         dev_err(dev, "Failed to register sub-devices\n");
> -                       return err;
> +                       goto exit;
>                 }
>         }
>
> @@ -278,7 +278,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>                 err = blocking_notifier_chain_register(&ec_dev->event_notifier,
>                                                       &ec_dev->notifier_ready);
>                 if (err)
> -                       return err;
> +                       goto exit;
>         }
>
>         dev_info(dev, "Chrome EC device registered\n");
> @@ -291,6 +291,10 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>                 cros_ec_irq_thread(0, ec_dev);
>
>         return 0;
> +exit:
> +       platform_device_unregister(ec_dev->ec);
> +       platform_device_unregister(ec_dev->pd);
> +       return err;
>  }
>  EXPORT_SYMBOL(cros_ec_register);
>
> --
> 2.35.1.265.g69c8d7142f-goog
>
