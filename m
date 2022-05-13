Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9270D323F
	for <chrome-platform@lists.linux.dev>; Fri, 13 May 2022 13:19:42 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id j6so16177439ejc.13
        for <chrome-platform@lists.linux.dev>; Fri, 13 May 2022 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tjtIstNp0c2UwRkZcEawu+Z4HyD/5CYljBC5Qzt7IRw=;
        b=WWk2pKjEr+7luEqweZ/9eom+T6uDwSCVPyeYfsqySNCiNr3TYZnE/B1BbAK1DB+Fxp
         Tgg5/yPIc+xvg5k4UmEXNMXw/QYGqrJUhN9ieV6APZxY7vaDTncml+a2O5RgCtS4tk9c
         vikvS2I4B2s4Mf8tTz7fPsRKxTKRv/lnMJau/cn4zNMWlPYvdzRe8HFtWrlNT3la/Uai
         OHHnT7wLz08r1tAbpaxnfWMInnzxoFkS2p72k1b0QXLuq/0P/K7fZL8PsrGWJJYinyZG
         83S27bsxxY9AzGkh6y/RrOwM91wVaapacoadJnTTZvx5Q5a/QsguKfgViggMU7PQNUF7
         uiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tjtIstNp0c2UwRkZcEawu+Z4HyD/5CYljBC5Qzt7IRw=;
        b=J7qG9wyPmnEqW5q67FWEANfX2aV/zW5AMAyZRhA84jr/eaUxx3tk1BTYEqAReRtsvh
         IUncoBPAjvp/eDMfvIN6dF9nt5DUvLRYiWSQzqGSJ/X8R9s3ZcZ1sBKFoOMxMWx1kkKB
         MTKqS6BneKclZpXT3jJtnVSoXEfRx0OM8ziJq/N1sFF9OQ9TauWYy9NDZD+x6aG0v7+x
         bUZX6KC93TcJpRRBS0SobSidnfDlMLjRvAB3O5z+ieOYYMYcq1jhaaIoe0LyyRni8Ptu
         0HmNg8O08b9oEpk0BFmRHyHNoOAuCHzxoH/ZKlWiIZp1QWBGe1XurrZVQ8WRCnrIjwXG
         lSqA==
X-Gm-Message-State: AOAM533ap6XgDwMvpbZT/FbgzotTPoh3pgWeldq3dC1uQpmy2jHJ1Thg
	fX1mTrKZIezEu4lApxB3J10vSheppxBgSL7F7m7CCg==
X-Google-Smtp-Source: ABdhPJwaBJUMzAtoEjoWsg3b+vhSGBRfFuint0S5WVou5f9UuctJB/8Ka9uB+fQevwQ6yiWp4dWjJlZM91fTtkT4Ptk=
X-Received: by 2002:a17:906:58d4:b0:6f4:cebd:c4b with SMTP id
 e20-20020a17090658d400b006f4cebd0c4bmr4218170ejs.492.1652447980708; Fri, 13
 May 2022 06:19:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513044143.1045728-1-tzungbi@kernel.org> <20220513044143.1045728-7-tzungbi@kernel.org>
In-Reply-To: <20220513044143.1045728-7-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 13 May 2022 06:19:29 -0700
Message-ID: <CABXOdTdxZGQb4sLaBQU1eU9qRj_xgA8qrRmuCfavLqXpwG39=g@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] platform/chrome: cros_ec_spi: drop unneeded BUG_ON()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 9:42 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> In the context, the following conditions are always false:
>
> - `todo` < 0
> Suppose that EC_SPI_FRAME_START is found at the last byte of transfer.
>
> In the case, `ptr` == `end` - 1.  As a result, `todo` must be 0.
>
> - `todo` > `ec_dev->din_size`
> Suppose that there is no preamble bytes.  EC_SPI_FRAME_START is found at
> the first byte of transfer.
>
> In the case, `end` == `ptr` + EC_MSG_PREAMBLE_COUNT.
> As a result, `todo` == EC_MSG_PREAMBLE_COUNT - 1.
> However, it already checked `ec_dev->din_size` < EC_MSG_PREAMBLE_COUNT at
> the beginning of function.
>
> Drop the unneeded BUG_ON().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> Changes from v1:
> - Separate from the original 6th patch.
> - Drop the BUG_ON() instead of returning -EINVAL.
>
>  drivers/platform/chrome/cros_ec_spi.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
> index 589f18e9537d..5264615f46af 100644
> --- a/drivers/platform/chrome/cros_ec_spi.c
> +++ b/drivers/platform/chrome/cros_ec_spi.c
> @@ -237,7 +237,6 @@ static int cros_ec_spi_receive_packet(struct cros_ec_device *ec_dev,
>          * start of our buffer
>          */
>         todo = end - ++ptr;
> -       BUG_ON(todo < 0 || todo > ec_dev->din_size);
>         todo = min(todo, need_len);
>         memmove(ec_dev->din, ptr, todo);
>         ptr = ec_dev->din + todo;
> @@ -345,7 +344,6 @@ static int cros_ec_spi_receive_response(struct cros_ec_device *ec_dev,
>          * start of our buffer
>          */
>         todo = end - ++ptr;
> -       BUG_ON(todo < 0 || todo > ec_dev->din_size);
>         todo = min(todo, need_len);
>         memmove(ec_dev->din, ptr, todo);
>         ptr = ec_dev->din + todo;
> --
> 2.36.0.550.gb090851708-goog
>
