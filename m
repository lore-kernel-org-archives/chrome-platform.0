Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B5E33C2
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 15:12:56 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id n10so10891336ejk.5
        for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 08:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=19mYXvplhrgGXSEnN4oN/HpZ9Pgg5x40SCiZXKwW4wM=;
        b=Tmn7nK2ifxi8WCA6ow0BAq9T4oD2+gFLhMucI2F/kbud8lY3yKkf8GketFBgRzuQ7u
         4n34376lCB/KzlAwOa5WXkEyqzSBnS/WMqQO0aU4o2Bu5e1bdoISHvYCuWJzAlub5PdP
         Fbuy21eg9rPYWIdE+sZXIIfLyH1GTqwSdDQW/33Uv8Zts2JQwOXfZI/z+EzBelV9ebz/
         aI2I6ej4xAJPtYAfHdlvbqoDHUnAVa1gznt/Hr5697JLyucN3PKppMAxZ43YbjkcJ7jn
         c7wutIFIlPSwcZEdxAfDWLqaeJrR7Ba0auIjx7oKpdCHHwTVvu/5loxa97VMe5qvQEU7
         SdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=19mYXvplhrgGXSEnN4oN/HpZ9Pgg5x40SCiZXKwW4wM=;
        b=SaDfjME2x3Qi+G0Enfn4yM9+tqxI1GjJVh40tFJMi3vUMC5gYKlbMwdIkFydp8Dix2
         AYKHLw0wtx0FY/gTOEj0qM0aepVLWNCKr6LzTbKsCY7jI+liPR0RTI5kCJ2j+389Jb20
         3YlmLD7RiTBjQ6clD1ozDRMUDFergAi/YklGNUQooFZqzVoJaBQAf2rqnJkNFNN+2LzK
         A16Mo05WGMpEalAAVgxEJDTbhjjrN2VqNkxtBpWFJYswsZVN6nnBw+Aj7y85Jw78aHmF
         Ehqcp3OYnmqhsnAuEgPCDVtoiwS9nUTh5Fq/KFTZYcm1FNmMCZDar5GQwDYrVUtnauH2
         tl7A==
X-Gm-Message-State: AOAM530yydbcmCoOvnIHVfijmiOrT9d2QRTUwfPNHx7jd/aiMBgNlnyP
	Haz3BxnMbXTFkXTdZQYkto6iNNJPLAAd0/4kROmBQw==
X-Google-Smtp-Source: ABdhPJwHlZGV314IeMrqsCGLBw1J4ALM5lOb9sLKAG3lRpsJWY6zvEasMZFIr5DOBRUGdOXao0F8cdOboEOFBcnDZjQ=
X-Received: by 2002:a17:907:8a17:b0:6f4:4b56:f550 with SMTP id
 sc23-20020a1709078a1700b006f44b56f550mr352366ejc.720.1652368374926; Thu, 12
 May 2022 08:12:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512083627.885338-1-tzungbi@kernel.org> <20220512083627.885338-6-tzungbi@kernel.org>
In-Reply-To: <20220512083627.885338-6-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 12 May 2022 08:12:43 -0700
Message-ID: <CABXOdTejOC41JJ750DVn1FTNb43NayPNsC3hq+o+Sr6OhkHtNA@mail.gmail.com>
Subject: Re: [PATCH 5/6] platform/chrome: cros_ec_i2c: drop BUG_ON() in cros_ec_pkt_xfer_i2c()
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
>  drivers/platform/chrome/cros_ec_i2c.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chrome/cros_ec_i2c.c
> index a4f305f1eb0e..9f5b95763173 100644
> --- a/drivers/platform/chrome/cros_ec_i2c.c
> +++ b/drivers/platform/chrome/cros_ec_i2c.c
> @@ -72,13 +72,19 @@ static int cros_ec_pkt_xfer_i2c(struct cros_ec_device *ec_dev,
>         i2c_msg[1].flags = I2C_M_RD;
>
>         packet_len = msg->insize + response_header_size;
> -       BUG_ON(packet_len > ec_dev->din_size);
> +       if (packet_len > ec_dev->din_size) {
> +               ret = -EINVAL;
> +               goto done;
> +       }
>         in_buf = ec_dev->din;
>         i2c_msg[1].len = packet_len;
>         i2c_msg[1].buf = (char *) in_buf;
>
>         packet_len = msg->outsize + request_header_size;
> -       BUG_ON(packet_len > ec_dev->dout_size);
> +       if (packet_len > ec_dev->dout_size) {
> +               ret = -EINVAL;
> +               goto done;
> +       }
>         out_buf = ec_dev->dout;
>         i2c_msg[0].len = packet_len;
>         i2c_msg[0].buf = (char *) out_buf;
> --
> 2.36.0.512.ge40c2bad7a-goog
>
