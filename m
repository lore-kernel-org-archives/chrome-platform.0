Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A514279F8
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 17:26:35 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-4bf16baa865so248981287b3.13
        for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 09:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JQaxMdq7NWcf4bCI8LzrzNOqDFAvMvCGdVrazsaMUbg=;
        b=W4wxupf3b1VDZ2kK6t05NvPi9QnOdlaIGbf0oy2xfkAO/sAjUM5wkEvsZGMKbQvtVg
         ZLWaHBbweAXMralx+uJcadPRWiaoAAqpKQxuDig0+zHgcAtQkA4HrHk0vBWlFDvp1fef
         r6IT7meS0z5bBJX89TNJfWJcEEMwVpDUyxRPCp51J/l+KrY049N9MsqTwIt2kqKrwNU7
         Ze6fXwIGAC+9m3laBcY/cFI5sxuynHu/z8qb9AMZt6F4Jv6iio+t/jWsy8UMQNxPhafa
         q5GQ/jbYPt2Zum4BYQalMP2rAFL6rYmQsYHVYpWDqvMmDVaabqClElWeba929jlAv5uq
         MfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQaxMdq7NWcf4bCI8LzrzNOqDFAvMvCGdVrazsaMUbg=;
        b=f3aVNEF9wMRAG6GYEz0PcUVq7qhxPDEjmaJTC3Ivz0pv70UuJSMQGBqdkpWvmAiICw
         zKKpp1P/gzOdT46IeHfB/0Dv6tG79lMQI2tV0f2SRjsMZdn6lj0FxpgR7WSgGINs73f0
         84D6XZeDMH+GhLpAB23skV0lP0N97s8987a2FVl6uhm46ErXOmeUNho6yl1hDmf57pnQ
         wOQ6HfJQFPhl9EpTh8M+e8/RNhVdYQo2XcCluTKBJwDnmmhAx0vVd0CiIyF2t3/Bj9Ii
         QL7iYPfHFHQ2i/AQ5JoO6T37lWEgN7aqR9RLbCCkCUtI780oND09epOFK4DO1LRa3Tff
         UJVQ==
X-Gm-Message-State: AFqh2kpuJUvRjZB3UpPQKPDUx2xHPLlKnMMV4F67ZBIWcv+y56dRCb2y
	UcCzgsOn3gJ7ROYxx5E8g4vwI9gKb8Qfc96+45F5eUsmzLHntQ==
X-Google-Smtp-Source: AMrXdXsoFkmLucb+Srq6knqX3clTfw6PCkJ0VK93uLlsfcauE4qS4cjj7Jur72WWirRTc7JFs4admBJaXLG7ah45CQI=
X-Received: by 2002:a0d:fc84:0:b0:3df:6a50:40ec with SMTP id
 m126-20020a0dfc84000000b003df6a5040ecmr3487272ywf.340.1673544394482; Thu, 12
 Jan 2023 09:26:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230112043908.2938964-1-wenst@chromium.org>
In-Reply-To: <20230112043908.2938964-1-wenst@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 12 Jan 2023 09:26:23 -0800
Message-ID: <CABXOdTeFKyn8nYivWcXATDJmaqM7eJ++VEu_GNLcRpY2cB4iOw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: Initialize panic notifier block
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 11, 2023 at 8:39 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Commit d90fa2c64d59 ("platform/chrome: cros_ec: Poll EC log on EC panic")
> added a new notifier block, but failed to initialize it properly,
> resulting in a warning and stack trace (omitted):
>
>         INFO: trying to register non-static key.
>         The code is fine but needs lockdep annotation, or maybe
>         you didn't initialize this object before use?
>         turning off the locking correctness validator.
>
> Initialize the notifier block properly.
>
> Fixes: d90fa2c64d59 ("platform/chrome: cros_ec: Poll EC log on EC panic")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Guenter Roekc <groeck@chromium.org>

Didn't I already see this ?

Guenter

> ---
>  drivers/platform/chrome/cros_ec.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 4ae57820afd5..b895c8130bba 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -182,6 +182,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>         int err = 0;
>
>         BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->event_notifier);
> +       BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->panic_notifier);
>
>         ec_dev->max_request = sizeof(struct ec_params_hello);
>         ec_dev->max_response = sizeof(struct ec_response_get_protocol_info);
> --
> 2.39.0.314.g84b9a713c41-goog
>
