Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E51876
	for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 21:40:20 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id y129so121629ybe.7
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 13:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q4xLrH6qRDd3InzJCGR1Lz+Apb2aCcNlJJ/J5BesAs4=;
        b=TnKsHAfPX7GfJEJzVpkYr8hJJxeZCibdeEvW1gPWS4SF6zShruUFHSNHSCcBAJ6AHs
         17uT15yfRg/UMSIJzjSB7+AhafilZ7aGUwYUWdETIa9WQP7QUnIERAG04FuMTw207UQS
         Iq19iKIuQgxlSUxb0YxyBRMuxxCGTbTOI6imo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q4xLrH6qRDd3InzJCGR1Lz+Apb2aCcNlJJ/J5BesAs4=;
        b=5bMA00wzb51mXbs4foNhxBKhI7ZUM8rB2Ii6eeYu6tdS0re99XSZSu6uLP38JOdHJ5
         AslsnqPVHHdfAb5slad8cme4MOFV2+ygHTulVYUDhkDhs70884G237SCh2xH7ru9QiGY
         MeU5hm9QHxmFK2A9U6KvbAsB7IOx9+nVVAinp2MfYNuqZ0myPu2mryjNyc+VajIbzJgG
         DaIinxSPsbMc0OYiV1q4sVZaIndwW+CbNVObgw+8+Ex+qnCxhYu1mcNYBz5xEr3P6+jK
         4dg5ccQEFz8A79VlRpQ0u67qs8SfsieXXt1i4Fq3HQbnGqO5CCGL1SM+xa0Gqv3iclXN
         Fyqw==
X-Gm-Message-State: AOAM531oxBY/MZ3pkcOxQQYZGKINGqTvw7dA7lRMK8fBvltPzfLnm+eH
	Q6tXNTdk0PcxaM7AIsMrrRs+2VQJf2TcGP0MqJgEFA==
X-Google-Smtp-Source: ABdhPJxrHUQmW4Vd1TCj/Ej5te6fO7BJ3DB+9exRjS/gp6Oz6sgUw2thaQNm/WNiCbCvS6FT7ZTutVwJgS8CxGX5j9U=
X-Received: by 2002:a25:4943:: with SMTP id w64mr913312yba.619.1644961219483;
 Tue, 15 Feb 2022 13:40:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209095703.517608-1-tzungbi@google.com> <20220209095703.517608-7-tzungbi@google.com>
In-Reply-To: <20220209095703.517608-7-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 15 Feb 2022 13:40:07 -0800
Message-ID: <CACeCKad6-XXST8JukBpKGFSC1xy1GzducUzeBM4Zsk0ZEphPEw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] platform/chrome: cros_ec: append newline to all logs
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Feb 09 17:57, Tzung-Bi Shih wrote:
> To be consistent, append newline ("\n") to all logs.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>


> ---
> No changes from v2.
>
> Changes from v1:
> (https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
> - Use imperative mood in commit message.
>
>  drivers/platform/chrome/cros_ec.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 2c4e81f3fef9..639d5a651b76 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -213,7 +213,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>                                               IRQF_TRIGGER_LOW | IRQF_ONESHOT,
>                                               "chromeos-ec", ec_dev);
>               if (err) {
> -                     dev_err(dev, "Failed to request IRQ %d: %d",
> +                     dev_err(dev, "Failed to request IRQ %d: %d\n",
>                               ec_dev->irq, err);
>                       return err;
>               }
> @@ -264,7 +264,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>        */
>       err = cros_ec_sleep_event(ec_dev, 0);
>       if (err < 0)
> -             dev_dbg(ec_dev->dev, "Error %d clearing sleep event to ec",
> +             dev_dbg(ec_dev->dev, "Error %d clearing sleep event to ec\n",
>                       err);
>
>       if (ec_dev->mkbp_event_supported) {
> @@ -336,7 +336,7 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
>
>       ret = cros_ec_sleep_event(ec_dev, sleep_event);
>       if (ret < 0)
> -             dev_dbg(ec_dev->dev, "Error %d sending suspend event to ec",
> +             dev_dbg(ec_dev->dev, "Error %d sending suspend event to ec\n",
>                       ret);
>
>       if (device_may_wakeup(dev))
> @@ -381,7 +381,7 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
>
>       ret = cros_ec_sleep_event(ec_dev, sleep_event);
>       if (ret < 0)
> -             dev_dbg(ec_dev->dev, "Error %d sending resume event to ec",
> +             dev_dbg(ec_dev->dev, "Error %d sending resume event to ec\n",
>                       ret);
>
>       if (ec_dev->wake_enabled)
> --
> 2.35.0.263.gb82422642f-goog
>
