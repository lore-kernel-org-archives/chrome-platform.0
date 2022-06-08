Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC1F7B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:17:25 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id gl15so28587085ejb.4
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k3WJgrEiyRsJZVo6jGaFSg05WuW/kpG7WgVI+yXlGlM=;
        b=C/kHRTAsniptuuhxPHw4nV9PKs2iIsM1fx1JcHEtHNJCJoD/+Qla7eeKlciLf+ugIq
         qW8LBXJ7ly9mj0VxTdYNf26OqBHkO1qNTKbTXgybz5dSWTNgOUoUPxerDA8V56Z7/mog
         fwso2/FT6C8HSNL2PapIiI07cQU5pyXdNprM94S/lQ/eHWHZhECgpgGevH8fF9rzdxW9
         TOkhP6zw/RRYN7yQkOLPGN5RjtuicvTMaaAcEInyAsBnyKagmfo6k1Ed6EDq0i8QG5KQ
         RDfnJN5VTisJRY+a0uwiFMoTswAc8mGMyqM+XDOmKV4X+9CLWRRf2x9x50L1WO+71ld1
         skeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k3WJgrEiyRsJZVo6jGaFSg05WuW/kpG7WgVI+yXlGlM=;
        b=jWQ/KbbNjk4J1Ux/MvxFK0ygTgEbC73rtiOibQ+QX09BbI9MSebP/w27yKvjiDN6um
         IQGyPErmvEROLYT39zWK5+DblHPQFUheMJl82BHUzlxv6VDAI8ejqTYGx8pY9s1ZkzbF
         jHmsxcDBLJvCWhY1qgyyEJGev43hNr01Y6+DieimwqhnNqX7gF1cIUIev+wMyfN3obx3
         KH3lfjPkc7x3olVlh7sQd8VJNCGeacUa9BtTTzQsWjExAwou5IJfKKHLDnhnxu/c0bs+
         t0kbdCXUc3E9aRqe+a7sM+Lj2NwdOpPVPiFFaPZXl5pxlVq6Ws2vWMN+syQP6fbAeCqm
         L5tQ==
X-Gm-Message-State: AOAM531KpWFe64tyx/1WoxConSke3rZ0Z4wb9br4QQQ3pNe81cpHpsi1
	C1xG6BF+whboYOu9I8p/nKJ0o3qHhF9uFQ1QSF+0Ow==
X-Google-Smtp-Source: ABdhPJxFm4WVAqoPyKHI58X3aL/hKZ95yYpCS0X5FIEkrZLo1wbxq7/NatiCCxryBg2Dnz3jLLHHVbifZdLg1R+F8Fs=
X-Received: by 2002:a17:906:85cb:b0:70b:ffb4:b0e with SMTP id
 i11-20020a17090685cb00b0070bffb40b0emr28570456ejy.533.1654705043891; Wed, 08
 Jun 2022 09:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-15-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-15-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:17:12 -0700
Message-ID: <CABXOdTfYByx43aLXjge0FKn890CPyMuVPODzg=a9mAaq=XYY7g@mail.gmail.com>
Subject: Re: [PATCH v3 14/23] platform/chrome: don't use devm variants for
 `din` and `dout`
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Don't use devm variants because the two buffers could be re-allocated
> multiple times during runtime.  Their life cycles aren't quite aligned
> to the device's.
>
> Normally, free the memory if any when the ec_dev gets unregistered in
> cros_ec_unregister().
>
> No need to free memory if kmalloc() fails.  They will be freed
> eventually in either of the following:
> - Error handling path in cros_ec_register().
> - In cros_ec_unregister().
> - Next kmalloc() in cros_ec_query_all().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> Changes from v2:
> - Don't use realloc.
>
> Changes from v1:
> - Don't use devm.
> - Free in cros_ec_unregister().
>
>  drivers/platform/chrome/cros_ec.c            |  4 +++
>  drivers/platform/chrome/cros_ec_proto.c      | 29 ++++++++------------
>  drivers/platform/chrome/cros_ec_proto_test.c |  4 +--
>  3 files changed, 17 insertions(+), 20 deletions(-)
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
> index 473654f50bca..8a53e989c7e2 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -469,7 +469,6 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
>   */
>  int cros_ec_query_all(struct cros_ec_device *ec_dev)
>  {
> -       struct device *dev = ec_dev->dev;
>         u32 ver_mask = 0;
>         int ret;
>
> @@ -492,21 +491,18 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>                 }
>         }
>
> -       devm_kfree(dev, ec_dev->din);
> -       devm_kfree(dev, ec_dev->dout);
> +       kfree(ec_dev->din);
> +       ec_dev->din = NULL;
> +       kfree(ec_dev->dout);
> +       ec_dev->dout = NULL;
>
> -       ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
> -       if (!ec_dev->din) {
> -               ret = -ENOMEM;
> -               goto exit;
> -       }
> +       ec_dev->din = kmalloc(ec_dev->din_size, GFP_KERNEL);
> +       if (!ec_dev->din)
> +               return -ENOMEM;
>
> -       ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
> -       if (!ec_dev->dout) {
> -               devm_kfree(dev, ec_dev->din);
> -               ret = -ENOMEM;
> -               goto exit;
> -       }
> +       ec_dev->dout = kmalloc(ec_dev->dout_size, GFP_KERNEL);
> +       if (!ec_dev->dout)
> +               return -ENOMEM;
>
>         /* Probe if MKBP event is supported */
>         ret = cros_ec_get_host_command_version_mask(ec_dev,
> @@ -555,10 +551,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
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
> index 63071af81c94..ec106d0f5648 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -180,8 +180,8 @@ static void cros_ec_proto_test_query_all_pretest(struct kunit *test)
>
>         /*
>          * cros_ec_query_all() will free din and dout and allocate them again to fit the usage by
> -        * calling devm_kfree() and devm_kzalloc().  Set them to NULL as they aren't managed by
> -        * ec_dev->dev but allocated statically in struct cros_ec_proto_test_priv
> +        * calling kfree() and kmalloc().  Set them to NULL as they aren't allocated by kmalloc()
> +        * but allocated statically in struct cros_ec_proto_test_priv
>          * (see cros_ec_proto_test_init()).
>          */
>         ec_dev->din = NULL;
> --
> 2.36.1.255.ge46751e96f-goog
>
