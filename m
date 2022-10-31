Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26147E
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 15:20:36 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id c12so5566079uat.13
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ivld+lsun9zNtN39RplpBBVe5zjjIfeTUT7IFXsEt4Y=;
        b=q35d+XNo+Z4KDRiWZBc5HvdCfPUTPZfRA+APJSqa5OrvqcbbZbz1qLYX05UlEBJc6/
         iJEGI57CytubQn2xJF3HPgoBv4gD7x7wkwLkpC+JUvSzqskgqYUjQlBDbgbhb1f5DKDA
         5h/isk4u2NiIguWeyJYznZ1K9hDGUHfVlJXlh1g5W336BvfAUz+LtjfJy3iCD239Mtzr
         7vLgQ82m885Hd8lGQ5pRl47TnqrCPaescdp8cGAscxm7lraMy2n12h3y4QHHBoI0eauX
         sr/S4JRyHRg8ilddDvsdBm5SZXDMlKcU+mOw96BS72RKbutgSj5jemAAazu7A5DbV5Dy
         aupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivld+lsun9zNtN39RplpBBVe5zjjIfeTUT7IFXsEt4Y=;
        b=hzB/NwQbTg9z3MYKqWCAkANC1rQsKoGZIDIqlsOSVB26MiUCq5Vy0ZJ+xkkK+0c9jw
         wWToY2K7NIvM4gI4w/R6E9l1BXtlFUdeI/15Bmy1j2YmUGit0E5dTNgxYxyUHXbmUhiK
         rOKinG8pmCBGbcvKog90//aWnMHcmZAqBHDsg3ZRyETQ83ctksHpVrr0KHczXqg90LF4
         OgpsWjRg/X7v9DQ02R2kfXFkBwyqnQh+/faMwxcY4pSbZsxM3wCclXoOlUbNZVokWS6K
         u1zDXiTvDQf7NwmKSLUJz2ubtWVbGA3AcMcH1ojayDncpx+D+GjmZjgs9Dt69bOh6Jtd
         1/Ng==
X-Gm-Message-State: ACrzQf0E1RY+5EJMc0u8PDD6rYQImrlL2EoHQAmmBHYHqyxnOGGgjNQk
	WdcPRvsbo79JbDkAUL6Td+mKI82DJw4fgadQaYBlLg==
X-Google-Smtp-Source: AMsMyM4qT9UBSEo+BvdXTczoHy1tjNz6JAdEW3Zm4e01tX1l0lC9Y548YjSZ5BdbcjsSx0wJR1q2svzdPkMrYuPpzXM=
X-Received: by 2002:ab0:7550:0:b0:406:b37e:55dc with SMTP id
 k16-20020ab07550000000b00406b37e55dcmr3454188uaq.63.1667229635383; Mon, 31
 Oct 2022 08:20:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221031050657.3899359-1-tzungbi@kernel.org>
In-Reply-To: <20221031050657.3899359-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 31 Oct 2022 08:20:24 -0700
Message-ID: <CABXOdTeu8oZZ3eSLrDCnD-8ea6NC7fNjv_aH7kyT0UCZQmoZSg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc_mec: remove cros_ec_lpc_mec_destroy()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	briannorris@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 30, 2022 at 10:07 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> It's pointless (and invalid) to destroy a statically allocated mutex in
> cros_ec_lpc_mec_destroy().
>
> Let's remove it.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> A follow up from https://patchwork.kernel.org/project/chrome-platform/patch/20221028141411.1.I0728421299079b104710c202d5d7095b2674fd8c@changeid/.
>
>  drivers/platform/chrome/cros_ec_lpc.c     | 3 ---
>  drivers/platform/chrome/cros_ec_lpc_mec.c | 6 ------
>  drivers/platform/chrome/cros_ec_lpc_mec.h | 7 -------
>  drivers/platform/chrome/wilco_ec/core.c   | 5 -----
>  4 files changed, 21 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index 7677ab3c0ead..6ef5e5d40ba4 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -593,7 +593,6 @@ static int __init cros_ec_lpc_init(void)
>         ret = platform_driver_register(&cros_ec_lpc_driver);
>         if (ret) {
>                 pr_err(DRV_NAME ": can't register driver: %d\n", ret);
> -               cros_ec_lpc_mec_destroy();
>                 return ret;
>         }
>
> @@ -603,7 +602,6 @@ static int __init cros_ec_lpc_init(void)
>                 if (ret) {
>                         pr_err(DRV_NAME ": can't register device: %d\n", ret);
>                         platform_driver_unregister(&cros_ec_lpc_driver);
> -                       cros_ec_lpc_mec_destroy();
>                 }
>         }
>
> @@ -615,7 +613,6 @@ static void __exit cros_ec_lpc_exit(void)
>         if (!cros_ec_lpc_acpi_device_found)
>                 platform_device_unregister(&cros_ec_lpc_device);
>         platform_driver_unregister(&cros_ec_lpc_driver);
> -       cros_ec_lpc_mec_destroy();
>  }
>
>  module_init(cros_ec_lpc_init);
> diff --git a/drivers/platform/chrome/cros_ec_lpc_mec.c b/drivers/platform/chrome/cros_ec_lpc_mec.c
> index bbc2884f5e2f..0d9c79b270ce 100644
> --- a/drivers/platform/chrome/cros_ec_lpc_mec.c
> +++ b/drivers/platform/chrome/cros_ec_lpc_mec.c
> @@ -146,9 +146,3 @@ void cros_ec_lpc_mec_init(unsigned int base, unsigned int end)
>         mec_emi_end = end;
>  }
>  EXPORT_SYMBOL(cros_ec_lpc_mec_init);
> -
> -void cros_ec_lpc_mec_destroy(void)
> -{
> -       mutex_destroy(&io_mutex);
> -}
> -EXPORT_SYMBOL(cros_ec_lpc_mec_destroy);
> diff --git a/drivers/platform/chrome/cros_ec_lpc_mec.h b/drivers/platform/chrome/cros_ec_lpc_mec.h
> index aa1018f6b0f2..9d0521b23e8a 100644
> --- a/drivers/platform/chrome/cros_ec_lpc_mec.h
> +++ b/drivers/platform/chrome/cros_ec_lpc_mec.h
> @@ -45,13 +45,6 @@ enum cros_ec_lpc_mec_io_type {
>   */
>  void cros_ec_lpc_mec_init(unsigned int base, unsigned int end);
>
> -/*
> - * cros_ec_lpc_mec_destroy
> - *
> - * Cleanup MEC I/O.
> - */
> -void cros_ec_lpc_mec_destroy(void);
> -
>  /**
>   * cros_ec_lpc_mec_in_range() - Determine if addresses are in MEC EMI range.
>   *
> diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/chrome/wilco_ec/core.c
> index 5b42992bff38..d6a994bdc182 100644
> --- a/drivers/platform/chrome/wilco_ec/core.c
> +++ b/drivers/platform/chrome/wilco_ec/core.c
> @@ -129,7 +129,6 @@ static int wilco_ec_probe(struct platform_device *pdev)
>  unregister_debugfs:
>         if (ec->debugfs_pdev)
>                 platform_device_unregister(ec->debugfs_pdev);
> -       cros_ec_lpc_mec_destroy();
>         return ret;
>  }
>
> @@ -143,10 +142,6 @@ static int wilco_ec_remove(struct platform_device *pdev)
>         platform_device_unregister(ec->rtc_pdev);
>         if (ec->debugfs_pdev)
>                 platform_device_unregister(ec->debugfs_pdev);
> -
> -       /* Teardown cros_ec interface */
> -       cros_ec_lpc_mec_destroy();
> -
>         return 0;
>  }
>
> --
> 2.38.1.273.g43a17bfeac-goog
>
