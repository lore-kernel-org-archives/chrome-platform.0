Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B307463
	for <chrome-platform@lists.linux.dev>; Wed, 17 Aug 2022 21:55:18 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id y4so461402qvp.3
        for <chrome-platform@lists.linux.dev>; Wed, 17 Aug 2022 14:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=6iOAwXpxZOVUHXB8pnKV77uAu2dNKxtKOB59ofq3cx0=;
        b=SMi3M2JKawKB04QJLnHqFZ/LmkLSeHzxSm902HdTCR6qJx7da2dOAPvgMCzRPiOkMA
         DIgjwC8LSvDG/blTfZF2wBDICdU0CKy8drmWMJR6qYI5O/NrHSGLpzD/zmpOyDGXeexN
         dt25pbk1PO30HMdnzL4rQ9EGoku5CG4Vb2kO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6iOAwXpxZOVUHXB8pnKV77uAu2dNKxtKOB59ofq3cx0=;
        b=7QpKQD6BL4/+pgBYI99TWmxSjSTDUgahK5WvatbocC5l+RXSIvpLY+8RONN+ZvzfLU
         sEDARTnlw4CA/wOJ1pWCXyaK+ovDkr2kmdPcsjxhitbQLEvkhv2ZrlkoU0Haef4nsXGv
         LBcbulQO9+Yb91vWK+ZboxqyWEKNnOFgocvAPIZTgrd6ja3Y8nUUV//zA5Iz44zBnd0i
         saJ7lp22K+ZrLrg1iKjcH41fCbSRXIDIS8ffqpe9U903VFn12me76DdhlF1P3U1a6+Cb
         vmV4mVoiJExPJPenzPQFP1BHWOzhazDg1woQilMrGUoeK7VlnUyRNk8o0yvVrpWj0l4q
         czvQ==
X-Gm-Message-State: ACgBeo1RDzdLFACwBUB6l92cxWQaQ/HnVYpFspwNCmNxeeBVlRP9deEN
	WqJ9hAd0soRH6WgdMUFkzT7ZY2rLg8GHXlnR
X-Google-Smtp-Source: AA6agR7Atb3qC2eJXKwtVLZ//X5+0AIWYUeVmcuGqEDWrgCtZoGprMOBCgNswg8G3e33Xv/e1GMJIw==
X-Received: by 2002:a05:6214:242d:b0:47b:2bb1:5e9f with SMTP id gy13-20020a056214242d00b0047b2bb15e9fmr36963qvb.30.1660773317452;
        Wed, 17 Aug 2022 14:55:17 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id p7-20020a05622a048700b003434d1a7a14sm14117459qtx.62.2022.08.17.14.55.16
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 14:55:17 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id l5so11431520qtv.4
        for <chrome-platform@lists.linux.dev>; Wed, 17 Aug 2022 14:55:16 -0700 (PDT)
X-Received: by 2002:ac8:5fd6:0:b0:343:4b4:1022 with SMTP id
 k22-20020ac85fd6000000b0034304b41022mr237274qta.616.1660773316641; Wed, 17
 Aug 2022 14:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220802113957.v3.1.I2c8c550183162e7594309b66d19af696b8d84552@changeid>
In-Reply-To: <20220802113957.v3.1.I2c8c550183162e7594309b66d19af696b8d84552@changeid>
From: Raul Rangel <rrangel@chromium.org>
Date: Wed, 17 Aug 2022 15:55:05 -0600
X-Gmail-Original-Message-ID: <CAHQZ30AXMdqKp0yg7r8ja9SAkRO-e0APqYmZcD_5+nvrEeAycw@mail.gmail.com>
Message-ID: <CAHQZ30AXMdqKp0yg7r8ja9SAkRO-e0APqYmZcD_5+nvrEeAycw@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec: Send host event for prepare/complete
To: Tim Van Patten <timvp@google.com>
Cc: Rob Barnes <robbarnes@google.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

LGTM

On Tue, Aug 2, 2022 at 11:40 AM Tim Van Patten <timvp@google.com> wrote:
>
> Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> .prepare() and cros_ec_lpc_complete() during .complete(). This allows the
> EC to log entry/exit of AP's suspend/resume more accurately.
>
> Signed-off-by: Tim Van Patten <timvp@google.com>
> ---
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
> index 7677ab3c0ead9..4158bdeee197b 100644
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
> 2.37.1.455.g008518b4e5-goog
>

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
