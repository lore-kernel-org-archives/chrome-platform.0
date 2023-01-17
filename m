Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A8A2FAE
	for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 14:45:36 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id ss4so68593218ejb.11
        for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 06:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bV3vIwVo2dyTFHr6Uj1/hh+C+i02rlNgeNRZ3ko0sVY=;
        b=IUCutUE8b9dL0CxT/bHG5SC67PsbZ0R80IUw1FA1JKsXtIYTbja0/IjoXtgQYBYVO9
         NTyBAVNt5JQmi8liXuT1lQbnhdNrpRRinvvYe4qI49Agee1tDf7BzEYdANgt5VQVxWT+
         pZISRKiL4IkbpOQlPsVco8nUvUfp9CxPE/wWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV3vIwVo2dyTFHr6Uj1/hh+C+i02rlNgeNRZ3ko0sVY=;
        b=ceylb/jlk6lZhVG/zfyOUXhita3IFMVraHXQkHTgiR/LTjBELSR2d2Q8cPixFt63vF
         grp9Fb9CMWhhzNe/Qv6IaHO0R0KNf3oaqqoEfLhFscRyMCpzY+Orcy9BsGAlbUNB47PD
         Yuqb1ugzXji6kYhevPHHnw5wJ0HTRpUR3AcZELaczapFczIfmFXk8IRtQk3nK40UEEpa
         xAdswyGF5rUIg4HyeQ5M1X9GcA6Ki453qQ5gszAq+Lush8bn/Ab5pLI2dnUhc4gDlmld
         RCgxH6lSL/g+P9rmgRdp5cdUjSeM/4bc0KWshRNruWgfNo6gLBkksaZayjzcJGFWqvu0
         INFw==
X-Gm-Message-State: AFqh2krS7d5m+JR9GzuK3iG9ontFwQ78KexPAmFZh3O15ZgVMbO8dkln
	ScirdmRrtIXeEE9FQ+HJssFMvw7CtNOReoT2qd9kog==
X-Google-Smtp-Source: AMrXdXuClQY2g8HFpTbh78sctl7NLi0eN2fFnZKVmdbQAS7PMO28ZuACRZfMD11ZCw6rqAhSmTm5XHJYERzVoNmhI6U=
X-Received: by 2002:a17:906:d4a:b0:869:2463:1e9f with SMTP id
 r10-20020a1709060d4a00b0086924631e9fmr389469ejh.527.1673966734628; Tue, 17
 Jan 2023 06:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230109081554.3792547-1-tzungbi@kernel.org>
In-Reply-To: <20230109081554.3792547-1-tzungbi@kernel.org>
From: Benson Leung <bleung@chromium.org>
Date: Tue, 17 Jan 2023 06:45:04 -0800
Message-ID: <CANLzEks+2LnV1W-A30guBMUFBsFGz-7PDpdKW890xoBUjuomZA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: fix negative type promoted
 to high
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: groeck@chromium.org, chrome-platform@lists.linux.dev, markhas@chromium.org, 
	bhanumaiya@chromium.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

On Mon, Jan 9, 2023 at 12:16 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> serdev_device_write_buf() returns negative numbers on errors.  When
> the return value compares to unsigned integer `len`, it promotes to
> quite large positive number.
>
> Fix it.
>
> Fixes: 04a8bdd135cc ("platform/chrome: cros_ec_uart: Add transport layer")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Reported in https://lore.kernel.org/chrome-platform/Y7fhw4S7Tb0GcHMF@kili/T/#u.
>
>  drivers/platform/chrome/cros_ec_uart.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
> index 6916069f1599..788246559bbb 100644
> --- a/drivers/platform/chrome/cros_ec_uart.c
> +++ b/drivers/platform/chrome/cros_ec_uart.c
> @@ -149,9 +149,10 @@ static int cros_ec_uart_pkt_xfer(struct cros_ec_device *ec_dev,
>         resp->status = 0;
>
>         ret = serdev_device_write_buf(serdev, ec_dev->dout, len);
> -       if (ret < len) {
> +       if (ret < 0 || ret < len) {
>                 dev_err(ec_dev->dev, "Unable to write data\n");
> -               ret = -EIO;
> +               if (ret >= 0)
> +                       ret = -EIO;
>                 goto exit;
>         }
>
> --
> 2.39.0.314.g84b9a713c41-goog
>


-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
