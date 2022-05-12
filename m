Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F5E33C2
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 15:14:22 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id g6so10922997ejw.1
        for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/u1HiPt6El83plNrSLkAGuBjrIwscqUyOaYLijW4+kI=;
        b=SGkOEfmBRXouNoqxzf6hPYzUe+KKDSEXHdMYqMrIEyzQFtBEzUh9yE60B9BjPMv1/3
         CAModw8CHTSfruh9dwdt1oia1svoMbOwNkrl9k+Yza4G8NLgXzpfjaUHbQpc3NHCP6lt
         rOgvN9cSwKIobkpbUP4MLiaODRYyX/mFODpHMdGoqo91z6WYKQuo0kaail8HWNLJFm7r
         oEpoQXCcqo78YwnbCfV9c2RI995O0O1Usj61Cwh2Fzr6QkAS5WnNq39piWiv0Bi6GHQ6
         ZdsrIJwijClhQ3OG4QmV8m++5nK0NqSwYLC8B7bbxPTlvhVzYij43k7ccFd2a1pUvoOt
         n8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/u1HiPt6El83plNrSLkAGuBjrIwscqUyOaYLijW4+kI=;
        b=M7UIIjLao2UoMO++Jja3kzm771G50XLCve9P4bbPQWxIShbzgaTWmUxS+5VPhYJiZR
         KVZaDfXhbujeD09YFRdOV20PBKXVZDmMhY26tNrsD8uL+6OEh8Kh7a7SCw9Zd0dD9Nbr
         AOOJPONgIuXEz+B52ipQhV7bXXdaLtfnJtGoFok5W7I7+8krHTpn8YS8sq+DfL7ktWmW
         FrKN0lDy9zRR7EjwazyJll/hN9hxd7nWkAJWWgkw2iYBeZjodUM+6U+dXs1C3jZgbe8B
         +9TFhSGf2MTAukkoIMLeZqowwGNjIVwx/Xa4a/UimjHHNFQH7vguOLd4TZ2yVth8I6Wv
         2EYw==
X-Gm-Message-State: AOAM531XpZQLeUKY0qmxmXRJulM1fvYeC0a1B8POyyMhXSNqquNejeGF
	6Lak67qJZ/6q3XlK5Ge0oUeVO7Wu1PtF4nTjuGIhpQ==
X-Google-Smtp-Source: ABdhPJw5m0z/CmdfOhU+dqZxjqaMKJpcftWxfCERbCQDYh902+JstuqmfCHNkwRS3wN+w5yo2i3h7F5TFysGsE9liUo=
X-Received: by 2002:a17:907:8a17:b0:6f4:4b56:f550 with SMTP id
 sc23-20020a1709078a1700b006f44b56f550mr357869ejc.720.1652368461187; Thu, 12
 May 2022 08:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512083627.885338-1-tzungbi@kernel.org> <20220512083627.885338-7-tzungbi@kernel.org>
In-Reply-To: <20220512083627.885338-7-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 12 May 2022 08:14:10 -0700
Message-ID: <CABXOdTftq_Gbf5UmYCLEfm00xJusm-ZaWnQt9KEhb7U-mY_1Pw@mail.gmail.com>
Subject: Re: [PATCH 6/6] platform/chrome: cros_ec_spi: drop BUG_ON()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 1:37 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> It is overkill to crash the kernel if the `din` buffer is going to full
> or overflow.
>
> Drop the BUG_ON() and return -EINVAL instead.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Wonder if the return code should be -EPROTO instead, but I don't have
a strong opinion.

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_spi.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
> index 589f18e9537d..0a938f317adc 100644
> --- a/drivers/platform/chrome/cros_ec_spi.c
> +++ b/drivers/platform/chrome/cros_ec_spi.c
> @@ -160,7 +160,8 @@ static int receive_n_bytes(struct cros_ec_device *ec_dev, u8 *buf, int n)
>         struct spi_message msg;
>         int ret;
>
> -       BUG_ON(buf - ec_dev->din + n > ec_dev->din_size);
> +       if (buf - ec_dev->din + n > ec_dev->din_size)
> +               return -EINVAL;
>
>         memset(&trans, 0, sizeof(trans));
>         trans.cs_change = 1;
> @@ -197,7 +198,8 @@ static int cros_ec_spi_receive_packet(struct cros_ec_device *ec_dev,
>         unsigned long deadline;
>         int todo;
>
> -       BUG_ON(ec_dev->din_size < EC_MSG_PREAMBLE_COUNT);
> +       if (ec_dev->din_size < EC_MSG_PREAMBLE_COUNT)
> +               return -EINVAL;
>
>         /* Receive data until we see the header byte */
>         deadline = jiffies + msecs_to_jiffies(EC_MSG_DEADLINE_MS);
> @@ -237,7 +239,8 @@ static int cros_ec_spi_receive_packet(struct cros_ec_device *ec_dev,
>          * start of our buffer
>          */
>         todo = end - ++ptr;
> -       BUG_ON(todo < 0 || todo > ec_dev->din_size);
> +       if (todo < 0 || todo > ec_dev->din_size)
> +               return -EINVAL;
>         todo = min(todo, need_len);
>         memmove(ec_dev->din, ptr, todo);
>         ptr = ec_dev->din + todo;
> @@ -305,7 +308,8 @@ static int cros_ec_spi_receive_response(struct cros_ec_device *ec_dev,
>         unsigned long deadline;
>         int todo;
>
> -       BUG_ON(ec_dev->din_size < EC_MSG_PREAMBLE_COUNT);
> +       if (ec_dev->din_size < EC_MSG_PREAMBLE_COUNT)
> +               return -EINVAL;
>
>         /* Receive data until we see the header byte */
>         deadline = jiffies + msecs_to_jiffies(EC_MSG_DEADLINE_MS);
> @@ -345,7 +349,8 @@ static int cros_ec_spi_receive_response(struct cros_ec_device *ec_dev,
>          * start of our buffer
>          */
>         todo = end - ++ptr;
> -       BUG_ON(todo < 0 || todo > ec_dev->din_size);
> +       if (todo < 0 || todo > ec_dev->din_size)
> +               return -EINVAL;
>         todo = min(todo, need_len);
>         memmove(ec_dev->din, ptr, todo);
>         ptr = ec_dev->din + todo;
> --
> 2.36.0.512.ge40c2bad7a-goog
>
