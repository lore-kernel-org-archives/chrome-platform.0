Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A604FB44E
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 16:31:11 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id j18so5702223vkn.10
        for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 08:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2e8hrjdT5lOOhjKyH0FfMqyUF6s5TK+VmCZxvxLBk4U=;
        b=pLyo6pK+Y1tK7PQrtZHH0n/jbHRwgZIHa4j38xX+0V/Zwk5N1zx+M+Tg/KtWk/wUR+
         Vg2UkfSKRFTaYhh9JZVOtUBgx5G02mFRMtl7oizoB0NmpCP5h30IU81KQM6gxn05glPs
         iKXYACIMVZvWC2cGWIUJLw1TC5DFT63NGzIzPVx5eOKVxsOvOtmfUhtqJhtzhqreKLxe
         FvAa1tGBzZKoVDRCbNFEjg8slxqawdrHXmCaDQf7bLpyhaaBl31fPtRMew0MrqYEIBh3
         Dwm2o4Dw6kKR/i7ljySGjjsxnSZHNN11z4PonDzjJ2b3yLQWOPdpCbIrzgXBmfI168dh
         5uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2e8hrjdT5lOOhjKyH0FfMqyUF6s5TK+VmCZxvxLBk4U=;
        b=BtmxIRMt8je1gpCEpC8BCuA6Vo4bzt5MueZPyD/gw7hfm9LKltKQODzpAyzBs5wPKC
         fSWcA+P0djBtjfKhmTdk/Ow0agvTfSP4bQOTCw+ZjxLKbm85lA9qrHULPJWIdgNy0SxS
         yJKemsZ/jmFj6EDKLiQJOVyOu7kct9a44COSdN4bCOeFOLKAfxMZ21LTxicwKzZ91Csg
         hmYlk72hwPtmyDVpwyINetylwTrWr+rC+EHXJsTBIuq0L1OMz9Je7+w4np7bfe5RQ+PR
         /zKIcmhbiSVgvy5+nd9PTbBMwQfN4HcrCA2yx359kfVCFvSEBPnndYGINeHVBrMsdZVa
         yQnQ==
X-Gm-Message-State: AFqh2kqJRNv4XxuqezWSxxQdGCHVjVSNkjVT/QuPjYZy9105ZMTHp/cL
	kPM20HGLJOl4nNpvBL+bQ5gvs1uHZU5s3xkNe4ULgg==
X-Google-Smtp-Source: AMrXdXtFeweS6v3vAzDNIiVQHq51J1tPyGq4WhBOj8QQKOXf2iQ+zcinhDvoasBLLJMH+o0E/PZCL8ae60OPwWM1Lw4=
X-Received: by 2002:a1f:5f92:0:b0:3d5:622c:3458 with SMTP id
 t140-20020a1f5f92000000b003d5622c3458mr8102914vkb.40.1673454670346; Wed, 11
 Jan 2023 08:31:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230111055728.708990-1-tzungbi@kernel.org> <20230111055728.708990-2-tzungbi@kernel.org>
In-Reply-To: <20230111055728.708990-2-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 11 Jan 2023 08:30:59 -0800
Message-ID: <CABXOdTf2OmwokHJUzUnQaq5aNHyAfRVd-RU=AF8=vUf9VHfkCw@mail.gmail.com>
Subject: Re: [PATCH 1/4] platform/chrome: fix kernel-doc warnings for panic notifier
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023 at 9:57 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Fix the following kernel-doc warnings:
>
> $ ./scripts/kernel-doc -none drivers/platform/chrome/*
> drivers/platform/chrome/cros_ec_debugfs.c:54: warning: Function
> parameter or member 'notifier_panic' not described in 'cros_ec_debugfs'
>
> $ ./scripts/kernel-doc -none include/linux/platform_data/cros_ec_proto.h
> include/linux/platform_data/cros_ec_proto.h:187: warning: Function
> parameter or member 'panic_notifier' not described in 'cros_ec_device'
>
> Cc: Rob Barnes <robbarnes@google.com>
> Fixes: d90fa2c64d59 ("platform/chrome: cros_ec: Poll EC log on EC panic")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groweck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_debugfs.c   | 2 ++
>  include/linux/platform_data/cros_ec_proto.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
> index 34f7b46f8761..a98c529d8c69 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -38,6 +38,8 @@ static DECLARE_WAIT_QUEUE_HEAD(cros_ec_debugfs_log_wq);
>   * @log_mutex: mutex to protect circular buffer
>   * @log_poll_work: recurring task to poll EC for new console log data
>   * @panicinfo_blob: panicinfo debugfs blob
> + * @notifier_panic: notifier_block to let kernel to flush buffered log
> + *                  when EC panic
>   */
>  struct cros_ec_debugfs {
>         struct cros_ec_dev *ec;
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> index 017d502ed66e..a4a3fec15504 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -140,6 +140,7 @@ struct cros_ec_command {
>   *      main EC.
>   * @pd: The platform_device used by the mfd driver to interface with the
>   *      PD behind an EC.
> + * @panic_notifier: EC panic notifier.
>   */
>  struct cros_ec_device {
>         /* These are used by other drivers that want to talk to the EC */
> --
> 2.39.0.314.g84b9a713c41-goog
>
