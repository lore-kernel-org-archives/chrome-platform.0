Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CD92F21
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 05:39:06 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id g14so2912912ybs.8
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 21:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SGZ33vk0tcjtyI2HllrRw2JXOE0Op0OSjXDb+nrp9aQ=;
        b=Pe2MRL6g2hwSEhQUjR7hyIPLN6MbZkq80YZe1iQ14oehUyhtyQmrSJW/Awf2RWGkua
         kDUp6XeV/dN1PuwFwuOVmtqrmKuWFQ4mPwpfhVLS1KQFl5pid55ecVy7w8TwdxnZYvCD
         DCD0vVuCwj+DLy16dPZ3OKXLJXZfPPwdcZF6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SGZ33vk0tcjtyI2HllrRw2JXOE0Op0OSjXDb+nrp9aQ=;
        b=t2MS1jmjyxB099kbtyqwwvM5jChIrYeVOD06UVKDNsxR0rkOhWsVcwFrt8C3SMUTbd
         gSC+0X6Fq5ZjetVr3ShYB5NQ4NJ2BntAxKsqHmEFFTvkLng8x+Wvh4DJ3mNTS5CuWiVG
         pblFAd6ReG6mgulBK8wuAcwoTF6wiVYn2bZt3zXsrdzgie6LpRsAApw9Ka5j6yU7ZWm4
         EmNfOCdnepM0DNFs4DP0lUWIK7PsoCh/2MRMvXLLQ21SXWrpgaGJOOCCwDP6uNk7ZmYf
         UkG0Q0Bn+9U34jcDaKAvzdxc7/YIbvBVouprD3NrQJbClKXS1WpPlkahPDshPVIfENK6
         CJPw==
X-Gm-Message-State: AOAM532FQhVYQxkt1kEfUtggmVViT9jOxceoe75SjZKzWyg9eeC00kqL
	WCl9Svj98fpu9WsvVqYpuw5zyrB3w9y3v5UKJ6dw9w==
X-Google-Smtp-Source: ABdhPJzBkK3gDP9fedyIrXHiOfgtH11Kq3H7zUcdU+QJOXswmEWshC9p7c3GclwRgXV9FLcheP83iC/aQz08DyVldFo=
X-Received: by 2002:a25:d44e:: with SMTP id m75mr690419ybf.93.1644385145861;
 Tue, 08 Feb 2022 21:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com> <20220209045035.380615-2-tzungbi@google.com>
In-Reply-To: <20220209045035.380615-2-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 8 Feb 2022 21:38:55 -0800
Message-ID: <CACeCKadDh0+nTXEy6xC98QLBciD78Oy4DH2749-BfAQ2fBpNXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] platform/chrome: cros_ec: fix error handling in cros_ec_register()
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Feb 8, 2022 at 8:50 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Fix cros_ec_register() doesn't unregister platform devices if
> blocking_notifier_chain_register() fails.

This isn't grammatically correct. Instead:
Fix cros_ec_register() to unregister platform devices if blocking....

>
> Also use the single exit path to handle the platform device
> unregistration.
>
> This fix depends on the fact that all the callers of cros_ec_register()
> allocate zeroed memory.

Is that a fair assumption? What happens if a future driver calls
cros_ec_register()
without zeroed memory?

>
> Fixes: 42cd0ab476e2 ("platform/chrome: cros_ec: Query EC protocol version if EC transitions between RO/RW")
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
What has changed since v2? Please add a change log of the versions here.

>  drivers/platform/chrome/cros_ec.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index fc5aa1525d13..7ce667ff08e0 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -245,18 +245,16 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
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
> @@ -278,7 +276,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>                 err = blocking_notifier_chain_register(&ec_dev->event_notifier,
>                                                       &ec_dev->notifier_ready);
>                 if (err)
> -                       return err;
> +                       goto exit;
>         }
>
>         dev_info(dev, "Chrome EC device registered\n");
> @@ -291,6 +289,12 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>                 cros_ec_irq_thread(0, ec_dev);
>
>         return 0;
> +exit:
> +       if (!IS_ERR_OR_NULL(ec_dev->pd))
> +               platform_device_unregister(ec_dev->pd);
> +       if (!IS_ERR_OR_NULL(ec_dev->ec))
> +               platform_device_unregister(ec_dev->ec);
> +       return err;
You don't need these "if" checks. They are already performed by
platform_device_unregister(), or rather, the functions that it calls [1][2].

[1] https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L756
[2] https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L553
