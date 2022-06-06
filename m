Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E58628E6
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 15:46:18 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id m20so29708283ejj.10
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B90rJStIwUJz/WnCT2f0wLQIie5FqhO2ey/SLUJI8AE=;
        b=JeCTo/DqCNpM5Kv2kuBQVM+eXt0aK25d1zghGCk7hGW3gUxaGBBRUYu40pO89yucUe
         qCNOXsLNSSkdgL+SpyKg1aT4wOP4cAVPpP3GNnj2rJPM3BxwUIGH0RkB6aH8QITPF3AR
         2gjhvKGWwX6YDGZ/biAyOq5sj1J6w+DfAq+y1D27ZVfTGoMmBuIenqFUT+W2832G7vRg
         JvHA2dS3Qs+5W81p1XVQ/81JNh+6kEuS5rosD1KcNenaSzVMZ5bZp4LmvM7chzy9wYkG
         h9wMPCLzhsqIsHAwyDdKT6LGsBJMI8KiWdeAGYy30+pj5fUeZ06X0TIeKmfkaU9KumYP
         0i2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B90rJStIwUJz/WnCT2f0wLQIie5FqhO2ey/SLUJI8AE=;
        b=v/Z2d7OZdp8b4xTbsb5i0s6U6ncrfwlUu41rnNhgcMkbTe0bq3oM0xAW8BxjHJXXyw
         xKlJE+UKNGQ1NcHGuQt0tty8bYAj4olRYW13goBn92xmGpi6z90bKIPZ+9rT54pRumXR
         jcMj6HEdQlJCKUSCxB84bdkKJrJSDA1ur+ZeBhb27GsaN6jijTUYvWm4biufD7E/CXxr
         RFZRZJbe5q4cs14r6jUoMT1axtzPKQ3xqELMaiwePFdFr9+kjVdttBRXwnP4gelH3mNC
         bmfA9pgjuaoI9F5hVbmV7RmKSpL15nwXc734Ch9rcpHGv/uGTJ/MQuPGZdmx/QSr2jcd
         JE1w==
X-Gm-Message-State: AOAM532WWP3PooWkmsDQzWkn2m8PC1JVyWu17qSOo12HKDSPc+6Wocyu
	PoFmWDvjIHKb7hqbAGkQaVm8DTrFM7x8kd6Zl9u/zw==
X-Google-Smtp-Source: ABdhPJzB+YuQ+3M+THQnaySBs8Wz59q00TglBkIeUDsSm/E4Am0k8haXrYOXSzwG7q6V5eCxtTpVPJLmDvc8gLhkYdo=
X-Received: by 2002:a17:907:90c8:b0:711:c8e1:7109 with SMTP id
 gk8-20020a17090790c800b00711c8e17109mr7056684ejb.492.1654530376186; Mon, 06
 Jun 2022 08:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606141051.285823-1-tzungbi@kernel.org> <20220606141051.285823-6-tzungbi@kernel.org>
In-Reply-To: <20220606141051.285823-6-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 6 Jun 2022 08:46:04 -0700
Message-ID: <CABXOdTcTjOoXp5nt7Q4Z_AXyYcxc3ZX91+KJAPoo6jOQj3z_pw@mail.gmail.com>
Subject: Re: [PATCH 05/13] platform/chrome: cros_ec_proto: remove redundant
 NULL check
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> send_command() already checks if `ec_dev->pkt_xfer` is NULL.  Remove the
> redundant check.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 629dce3e6ab3..1b851dcd20c9 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -281,9 +281,6 @@ static int cros_ec_host_command_proto_query(struct cros_ec_device *ec_dev,
>          */
>         int ret;
>
> -       if (!ec_dev->pkt_xfer)
> -               return -EPROTONOSUPPORT;
> -
>         memset(msg, 0, sizeof(*msg));
>         msg->command = EC_CMD_PASSTHRU_OFFSET(devidx) | EC_CMD_GET_PROTOCOL_INFO;
>         msg->insize = sizeof(struct ec_response_get_protocol_info);
> --
> 2.36.1.255.ge46751e96f-goog
>
