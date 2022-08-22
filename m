Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50713206
	for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 17:39:52 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id h27so8414617qkk.9
        for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 10:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Uv1Q+ndEBe3HTyOw38AbCJJcJ5R32I7V4kRhxrLgtqM=;
        b=aaVljnny2CijbJQw8Eo8kTx5IQbRbBQye01zHb5XIHtWzHfRS3girC4c2pTvy8BKSd
         W/FWga+mevsxN6httb8QvZSqcH2ltMkEzQuJs2DCoaad/UHlhta9hSAa+JgoqonuHvyM
         DLnOEUsJTfLpFQkaxlD07AUwYUWfjWuDlbazo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Uv1Q+ndEBe3HTyOw38AbCJJcJ5R32I7V4kRhxrLgtqM=;
        b=rT6EnS1sGlu739xRJ1ykpAkBCKAXoqtGdXATQlWnpxXiFXFDnACWFJpjv6OCRvfoCc
         mo2OzMqATUlU/enuiTs2ptuXzcMevvEalcEczdqkVn/GdGAesu1CjegYV6oSOXVASlVi
         nUPL+3x9C63SECQ4imvj6G3L0hj2E00WKg3V7Zs2dcC0Ly77DjN4WR+PZzM5ftDAA/hL
         rNsy+6KhPnCFQivUwuxaoJOSWhJ68DC7J2DTFwg9PwxU8E/db0b2qptYflm+gXImNFbF
         3ZdlTIGMX6Rtzk3juOXp3P/TyhjFTV25e3C4Vi91pZL5vCGxiLBYvEWc16cSST372qWm
         QDiA==
X-Gm-Message-State: ACgBeo1/DsUKEb+obXkvLOq3XuwPU08nL9tC5jF40ONY/LDvao9OGsfr
	4EpKpX6B+SIR3BQkh3kY46E3YikOHxoE1A==
X-Google-Smtp-Source: AA6agR5ARL9+MBKId/ZtyV1iBzdG+VI7FaSY5iURYNTEuAmJ+uQZ47r5yDtE/ncZrGDJsIaWHSYrog==
X-Received: by 2002:a05:620a:147c:b0:6ba:bda8:3fbb with SMTP id j28-20020a05620a147c00b006babda83fbbmr13336211qkl.33.1661189991575;
        Mon, 22 Aug 2022 10:39:51 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id x1-20020a05620a448100b006baed2827f2sm11868146qkp.44.2022.08.22.10.39.51
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:39:51 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id f4so8412872qkl.7
        for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 10:39:51 -0700 (PDT)
X-Received: by 2002:a05:620a:ecf:b0:6bb:a38:43cb with SMTP id
 x15-20020a05620a0ecf00b006bb0a3843cbmr13064469qkm.742.1661189990763; Mon, 22
 Aug 2022 10:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220822112832.v6.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>
In-Reply-To: <20220822112832.v6.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>
From: Raul Rangel <rrangel@chromium.org>
Date: Mon, 22 Aug 2022 11:39:40 -0600
X-Gmail-Original-Message-ID: <CAHQZ30C=djXVvBt9kftvwDVrBQ2CBukO10aCh1keRZ2fGYtsEw@mail.gmail.com>
Message-ID: <CAHQZ30C=djXVvBt9kftvwDVrBQ2CBukO10aCh1keRZ2fGYtsEw@mail.gmail.com>
Subject: Re: [PATCH v6] platform/chrome: cros_ec_lpc: Move host event to prepare/complete
To: Tim Van Patten <timvp@google.com>
Cc: Rob Barnes <robbarnes@google.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Sorry for the double email, I forgot to set my original reply to plain text.

On Mon, Aug 22, 2022 at 11:28 AM Tim Van Patten <timvp@google.com> wrote:
>
> Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> .prepare() and cros_ec_lpc_complete() during .complete(). This moves the
> host event that the AP sends and allows the EC to log entry/exit of AP's
> suspend/resume more accurately.
>
> Signed-off-by: Tim Van Patten <timvp@google.com>
> ---
>
> Changes in v6:
> - Fully restore fixes from v3.
>
> Changes in v5:
> - Restore fixes from v3.
>
> Changes in v4:
> - Update title and description.
>
> Changes in v3:
> - Update cros_ec_lpc_suspend() to cros_ec_lpc_prepare()
> - Update cros_ec_lpc_resume() to cros_ec_lpc_complete()
>
> Changes in v2:
> - Include cros_ec_resume() return value in dev_info() output.
> - Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.
>
>  drivers/platform/chrome/cros_ec_lpc.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index 7677ab3c0ead..4158bdeee197 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -530,23 +530,31 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
>  MODULE_DEVICE_TABLE(dmi, cros_ec_lpc_dmi_table);
>
>  #ifdef CONFIG_PM_SLEEP
> -static int cros_ec_lpc_suspend(struct device *dev)
> +static int cros_ec_lpc_prepare(struct device *dev)
>  {
>         struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
>
> +       dev_info(dev, "Prepare EC suspend\n");
> +
>         return cros_ec_suspend(ec_dev);
>  }
>
> -static int cros_ec_lpc_resume(struct device *dev)
> +static void cros_ec_lpc_complete(struct device *dev)
>  {
>         struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret = cros_ec_resume(ec_dev);
>
> -       return cros_ec_resume(ec_dev);
> +       dev_info(dev, "EC resume completed: ret = %d\n", ret);
>  }
>  #endif
>
>  static const struct dev_pm_ops cros_ec_lpc_pm_ops = {
> -       SET_LATE_SYSTEM_SLEEP_PM_OPS(cros_ec_lpc_suspend, cros_ec_lpc_resume)
> +#ifdef CONFIG_PM_SLEEP
> +       .prepare = cros_ec_lpc_prepare,
> +       .complete = cros_ec_lpc_complete
> +#endif
>  };
>
>  static struct platform_driver cros_ec_lpc_driver = {
> --
> 2.37.2.609.g9ff673ca1a-goog
>

Reviewed-by: Raul E Rangel <rrangel@chromium.org>
