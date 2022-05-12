Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C533C2
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 15:10:51 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id a21so6661775edb.1
        for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 08:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CLayYmfjkhcAMg8+8D2BY7rGeeiUMg34h820M4oj538=;
        b=VPP3gLLeF4MsNjONZX20D0qECvCgMzDr/5BarO8M+QHDbT9F5GNFmOArZlZmpzFdG0
         TXPBEolFTiiouK+wbBblSCABFom5RMZOmlPPEGXwSjZAm0sJgeWREmnkns6WFJfjekOV
         NAyCPZ+GlathNET+WBdpkMN9yxVOjZBLiUnhlSSGOGTQHDt+TrdoXgBRAt51wZyHTyRq
         IjC9t554stlsG9/g4B3HLzW+Lv8LCsMztExZcmo2vtQEqQrJqLKEZXhLIEydnif/7RWK
         c2OiX6gZAUp+Ru4D5mNaHjlikY6TWKkdhNmmk6JFU9ZbUAkjSCcOfik52vmudTUjPNGq
         HFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CLayYmfjkhcAMg8+8D2BY7rGeeiUMg34h820M4oj538=;
        b=Ausd89YNdoKT/dbtEB+rGL3CRMOR8sMpXC4RFzv4QEHiLmz8d0uqXXyvwl5cO42NGH
         3lZHiSq2Rkb9Fd3E/77AnpEOghw+Iw2yrxKLuxAnX/kTtdyR93CZK9ApKkXbt3moX7zx
         TcR2r1s6SpEqVrvDQBWWeOEIezFPo/2SlrOTbbhtQlRqNpv6udUDc6DzudUWS5V3gcda
         CmWMy34/lO6mWHl29CLAHdojL3BwuvO0+gkmMzzyyUv3G7bEoBo7GttxpVAVuilVWpis
         UbHEUE3iwJ1MmLx7M9U1OIi/i2q3fdSgKDUp7WlCljigNmopbO1F7GekHKZ+U8ZB56qR
         H11Q==
X-Gm-Message-State: AOAM531CjbuVYAsytgFmbL/4J7WVqYFER2Fnz/F0efUX6lEfS1wrWUeR
	sz0IMeuK0haWCW1SOrc8JUVohFtqQ5gD2I7j62qUZQ==
X-Google-Smtp-Source: ABdhPJyTJELgoNqWKtKc/a0Pq3BIgBopqi4EtQVTw75F8NJKDSHOkrQaZCuY63irAg0w41nA9fSJXqT4rvMVcGPVPL4=
X-Received: by 2002:a05:6402:43c4:b0:41d:9403:8dca with SMTP id
 p4-20020a05640243c400b0041d94038dcamr35277391edc.184.1652368249576; Thu, 12
 May 2022 08:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512083627.885338-1-tzungbi@kernel.org> <20220512083627.885338-4-tzungbi@kernel.org>
In-Reply-To: <20220512083627.885338-4-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 12 May 2022 08:10:38 -0700
Message-ID: <CABXOdTf1Hk3mZMrVGLxQfkBuoJ=bL-yprNtphZLRQu8zvt2U_g@mail.gmail.com>
Subject: Re: [PATCH 3/6] platform/chrome: cros_ec_proto: drop BUG_ON() in cros_ec_prepare_tx()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 1:36 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> It is overkill to crash the kernel if the given message is oversize.
>
> Drop the BUG_ON() and return -EINVAL instead.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 2d6d3fbfa905..9ce3374846ff 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -60,7 +60,8 @@ static int prepare_packet(struct cros_ec_device *ec_dev,
>         int i;
>         u8 csum = 0;
>
> -       BUG_ON(msg->outsize + sizeof(*request) > ec_dev->dout_size);
> +       if (msg->outsize + sizeof(*request) > ec_dev->dout_size)
> +               return -EINVAL;
>
>         out = ec_dev->dout;
>         request = (struct ec_host_request *)out;
> @@ -176,7 +177,9 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
>         if (ec_dev->proto_version > 2)
>                 return prepare_packet(ec_dev, msg);
>
> -       BUG_ON(msg->outsize > EC_PROTO2_MAX_PARAM_SIZE);
> +       if (msg->outsize > EC_PROTO2_MAX_PARAM_SIZE)
> +               return -EINVAL;
> +
>         out = ec_dev->dout;
>         out[0] = EC_CMD_VERSION0 + msg->version;
>         out[1] = msg->command;
> --
> 2.36.0.512.ge40c2bad7a-goog
>
