Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C4B7C
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 19:06:36 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id u12so37113388eja.8
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jun 2022 12:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w2QZmGlPpLOzdlgHh0fr/nfB07cOe+2+UZeFoODP9j8=;
        b=tnZsRIW4pQq3fgXUojHZ+AHCEF5QhfhOfKDFybj3uoeoAdOhUsrmY4xqoWNhi4W1ew
         fKaMyNa8bXnE7I01eQFjlECwbeEQpigVfc6azZow6P82xHiTjigT11EBQ6dAyTPvTdej
         ZPuZlZ4hf0Mf7Yky1Fm8IQtVl9ikuGkX4uHB7Ia1isGQO282ZiASud1X0XKYFb8f1e9/
         uBxMVVgAz63HkNGfMFIiQgo70NCj2M78GZuoJv7vjqkWQ03riOPUzCDlmdROfQy0Abhc
         2uMB41x7VdTXdizkLrWmLDi0NYy+zXBDhFUsf5L1unvrVEaLkKDKkGzBawaw4uA0sxgu
         uZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w2QZmGlPpLOzdlgHh0fr/nfB07cOe+2+UZeFoODP9j8=;
        b=6XdWMYeGpTttzZxIos6CAZAmq1k7D+L/u3Z9KUPn3aVOG7Qx5SssZ4s4eGsOTCKo4b
         AMHDjc/6SGA+rbF5EAXCxPhRKAWfXPB/YwfQq3QWR0HSpsl0kCDUHV22nFnFqGXnRfIX
         KxcBJfe6QHaA33dzCZBIJM16Q1Hjothu4YG83vuMBnFYe+7jJmDk35rSyr1r95tvK1ZP
         ++vjm+U5of6tGgyBOYD1Kw7OLX0GJvhpyMCWJ24HM31MZxTSxbig7TOPUX49KHJPPNCA
         pu4Ofs2nUttpBhG3FQqup+Uc9eCskI7xorSKUnrU6/6n5525wpWtUj7Ydm1xDGr61AXW
         8w2A==
X-Gm-Message-State: AOAM533BJTt277uHXxj+e2GlPk4wa7iqZa2J7Z8H+vh2b5f2dTSJEc+8
	GS58kSEm+eRUAn5kmYaWiyfu085r2O6yvq2DKCZW3g==
X-Google-Smtp-Source: ABdhPJxwxoKemimG4FVD7JPomt4SvqMKZJD8lrv1Td3YH0u0u8j+KI2ylVm8voE78xcmqu39D4M35gypCcJ3hi6eJM4=
X-Received: by 2002:a17:907:8689:b0:6fe:e525:ea9c with SMTP id
 qa9-20020a170907868900b006fee525ea9cmr28498152ejc.720.1654628794660; Tue, 07
 Jun 2022 12:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607145639.2362750-1-tzungbi@kernel.org> <20220607145639.2362750-13-tzungbi@kernel.org>
In-Reply-To: <20220607145639.2362750-13-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 7 Jun 2022 12:06:23 -0700
Message-ID: <CABXOdTebXS3c823jWYx9r8mU4LwNfhLo833s7_krK4JW0fSgUw@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] platform/chrome: use krealloc() for `din` and `dout`
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 7:57 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Use krealloc() to re-allocate `din` and `dout`.  Don't use devm variant
> because the two buffers could be re-allocated multiple times during
> runtime.  Their life cycles aren't quite aligned to the device's.

While this saves a few lines of code, it is runtime-expensive:
krealloc() copies the old data, which is a waste of time/resources.
Maybe it would be better to just use kfree() followed by kzalloc().

>
> Free the memory in cros_ec_unregister() if any.
>
> No need to free memory if krealloc() fails.  They will be freed
> eventually in either of the following:
> - Error handling path in cros_ec_register().
> - In cros_ec_unregister().
> - Next krealloc() in cros_ec_query_all().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from v1:
> - Don't use devm.
> - Free in cros_ec_unregister().
>
>  drivers/platform/chrome/cros_ec.c            |  4 +++
>  drivers/platform/chrome/cros_ec_proto.c      | 29 +++++++-------------
>  drivers/platform/chrome/cros_ec_proto_test.c |  3 +-
>  3 files changed, 15 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 29d3b544dafb..fb8cb8a73295 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -285,6 +285,8 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>  exit:
>         platform_device_unregister(ec_dev->ec);
>         platform_device_unregister(ec_dev->pd);
> +       kfree(ec_dev->din);
> +       kfree(ec_dev->dout);
>         return err;
>  }
>  EXPORT_SYMBOL(cros_ec_register);
> @@ -302,6 +304,8 @@ void cros_ec_unregister(struct cros_ec_device *ec_dev)
>         if (ec_dev->pd)
>                 platform_device_unregister(ec_dev->pd);
>         platform_device_unregister(ec_dev->ec);
> +       kfree(ec_dev->din);
> +       kfree(ec_dev->dout);
>  }
>  EXPORT_SYMBOL(cros_ec_unregister);
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 473654f50bca..de6bc457e496 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -469,9 +469,9 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
>   */
>  int cros_ec_query_all(struct cros_ec_device *ec_dev)
>  {
> -       struct device *dev = ec_dev->dev;
>         u32 ver_mask = 0;
>         int ret;
> +       u8 *din, *dout;
>
>         /* First try sending with proto v3. */
>         if (!cros_ec_get_proto_info(ec_dev, CROS_EC_DEV_EC_INDEX)) {
> @@ -492,21 +492,15 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>                 }
>         }
>
> -       devm_kfree(dev, ec_dev->din);
> -       devm_kfree(dev, ec_dev->dout);
> -
> -       ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
> -       if (!ec_dev->din) {
> -               ret = -ENOMEM;
> -               goto exit;
> -       }
> +       din = krealloc(ec_dev->din, ec_dev->din_size, GFP_KERNEL);
> +       if (!din)
> +               return -ENOMEM;

I would suggest assigning the values directly; the new variables don't
really add value.

Thanks,
Guenter

> +       ec_dev->din = din;
>
> -       ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
> -       if (!ec_dev->dout) {
> -               devm_kfree(dev, ec_dev->din);
> -               ret = -ENOMEM;
> -               goto exit;
> -       }
> +       dout = krealloc(ec_dev->dout, ec_dev->dout_size, GFP_KERNEL);
> +       if (!dout)
> +               return -ENOMEM;
> +       ec_dev->dout = dout;
>
>         /* Probe if MKBP event is supported */
>         ret = cros_ec_get_host_command_version_mask(ec_dev,
> @@ -555,10 +549,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>                                 "failed to retrieve wake mask: %d\n", ret);
>         }
>
> -       ret = 0;
> -
> -exit:
> -       return ret;
> +       return 0;
>  }
>  EXPORT_SYMBOL(cros_ec_query_all);
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
> index 730248be42a7..27b81a5a9880 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -180,8 +180,7 @@ static void cros_ec_proto_test_query_all_pretest(struct kunit *test)
>
>         /*
>          * cros_ec_query_all() will free din and dout and allocate them again to fit the usage by
> -        * calling devm_kfree() and devm_kzalloc().  Set them to NULL as they aren't managed by
> -        * ec_dev->dev.
> +        * calling krealloc().  Set them to NULL as they aren't allocated by kalloc().
>          */
>         ec_dev->din = NULL;
>         ec_dev->dout = NULL;
> --
> 2.36.1.255.ge46751e96f-goog
>
