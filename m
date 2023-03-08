Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9151236D
	for <chrome-platform@lists.linux.dev>; Wed,  8 Mar 2023 23:03:35 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id k199so232542ybf.4
        for <chrome-platform@lists.linux.dev>; Wed, 08 Mar 2023 15:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678316614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BRa1g8KQCmTvQ32j9/xmyel1IbSUQG5XY8VeW5/xDE=;
        b=cGh1UNf5hvPtEDnUSQQaatdBvD5q13G4AHDuSQfawAukIG3M3WhXXBaI/li5eaTxNB
         AbFbTboDTky0QtDjrs2QEiJlZ/3CVuH36iGpe4yh3H1xjVqY29d+hCObLZEQoPpEiRKf
         6DXbjGU3Y9jleSIxSktQ8gLGbWDacLSCNPGl6NneaCWwcXekBo1QRLqmpjA5kaDmkoA6
         XyS8dgLrEf72KujlSRBJUO7MjkS5oSiXKyDSnrqxgwtnG7M6Rt6X4w0TEvDjaH68LRU6
         pNOCGGOnWZrkAxsxMUDJPeaxtNG+RG/CazFkBLDYjjdOyz5B9lMf1m2LKSherMBwK7Cz
         08gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678316614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BRa1g8KQCmTvQ32j9/xmyel1IbSUQG5XY8VeW5/xDE=;
        b=u8KMoerc7pmujgFPFeGOCy27yls6YeHElWDcsJlVUOdzlCug/3tN3hsdbbpGHKMHkq
         /46Op+HGXieSMki3cfpWxO2CYE3ZFdFFZiYFBAoCFg22Qhj8LSn8kA9ySSXwb4mGCPLx
         RKVc1VTpTBrNvtR5OIH39iEfFXZsmKdjfzGL4uoH/hjZlRvwsRkG2xM0Mo44SerHw778
         2zSZfC6XeIEPEJhcb5HW1RjSC/CVy686Y8O+m3QfD3rYQtQuInznqfz72h7dOpzuLEKs
         Y1Nip9lexXBZFalDhQ686emduGrudphNXlJ4quYuB2qzyesXxmar18nJjmtcN9FjH/Bx
         dcog==
X-Gm-Message-State: AO0yUKVyXFZqTT9j6cwq3AoKkMwLOpKL1lugQcpPrbLlWsEGmSgAIIIV
	wIV02XB986my8GG7EhjxYKNBORXspOtgEnttjaC46A==
X-Google-Smtp-Source: AK7set/GMc6qfJOegQ8v6RrQHMp3NPfZzX5+ONK525sSGmorR8lAvg0o9puWD77uaMWfb7AKYA+Zn+kiQon0hDWI0vk=
X-Received: by 2002:a5b:108:0:b0:8bb:dfe8:a33b with SMTP id
 8-20020a5b0108000000b008bbdfe8a33bmr12063861ybx.9.1678316614349; Wed, 08 Mar
 2023 15:03:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230308031247.2866401-1-tzungbi@kernel.org>
In-Reply-To: <20230308031247.2866401-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Mar 2023 15:03:23 -0800
Message-ID: <CABXOdTfZ-N_azqQnSTuLVouVxaCU2BwTQtXheF42CbsWZM5e8w@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: remove unneeded label and if-condition
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 7:13=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> Both `ec_dev->ec` and `ec_dev->pd` are initialized to NULL at the
> beginning of cros_ec_register().  Also, platform_device_unregister()
> takes care if the given platform_device is NULL.
>
> Remove the unneeded goto-label and if-condition.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/=
cros_ec.c
> index b895c8130bba..8b7949220382 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -206,7 +206,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>         err =3D cros_ec_query_all(ec_dev);
>         if (err) {
>                 dev_err(dev, "Cannot identify the EC: error %d\n", err);
> -               goto destroy_mutex;
> +               goto exit;
>         }
>
>         if (ec_dev->irq > 0) {
> @@ -218,7 +218,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>                 if (err) {
>                         dev_err(dev, "Failed to request IRQ %d: %d\n",
>                                 ec_dev->irq, err);
> -                       goto destroy_mutex;
> +                       goto exit;
>                 }
>         }
>
> @@ -230,7 +230,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>                 dev_err(ec_dev->dev,
>                         "Failed to create CrOS EC platform device\n");
>                 err =3D PTR_ERR(ec_dev->ec);
> -               goto destroy_mutex;
> +               goto exit;
>         }
>
>         if (ec_dev->max_passthru) {
> @@ -296,7 +296,6 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>  exit:
>         platform_device_unregister(ec_dev->ec);
>         platform_device_unregister(ec_dev->pd);
> -destroy_mutex:
>         mutex_destroy(&ec_dev->lock);
>         lockdep_unregister_key(&ec_dev->lockdep_key);
>         return err;
> @@ -313,8 +312,7 @@ EXPORT_SYMBOL(cros_ec_register);
>   */
>  void cros_ec_unregister(struct cros_ec_device *ec_dev)
>  {
> -       if (ec_dev->pd)
> -               platform_device_unregister(ec_dev->pd);
> +       platform_device_unregister(ec_dev->pd);
>         platform_device_unregister(ec_dev->ec);
>         mutex_destroy(&ec_dev->lock);
>         lockdep_unregister_key(&ec_dev->lockdep_key);
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>
