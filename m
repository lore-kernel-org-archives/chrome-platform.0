Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DCE323F
	for <chrome-platform@lists.linux.dev>; Fri, 13 May 2022 13:20:49 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ks9so16265147ejb.2
        for <chrome-platform@lists.linux.dev>; Fri, 13 May 2022 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MD83ziJ2Qho4XkX8bpjsM8c+Xp4pjhuVQvUvmAtS3rE=;
        b=TUxDegrLBh1U0MnPtFzTADDsXSPEGhcUswvbfcvpQuBefZd31V7+cHEyDPsnW3OZ0f
         0xdwW8VJYLh1lAHGUVtCZbqKE3H17sxyE8Jej3wrPitNnrv8cKzUf2Do318YNFvMndhn
         H8HbOgmsH5zA37wRuaZVlGWWTreTM6159bmhDo+zx81D4CWs036ujwfg5IJyWt5IWtLB
         FDpmj4f6QPts3veFDiEqL0GisQF1dI0ITml4FEAD/dTfGyw5czclB+19WIs8wPTT3wrO
         DAfLJ0pbzKTBcQ9OMmsNPuFuQhW8ZVMte89ztEky/fSog+/evVqYW+816VRggyGXa2yK
         Tg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MD83ziJ2Qho4XkX8bpjsM8c+Xp4pjhuVQvUvmAtS3rE=;
        b=pegGtDVjvJKlHAoPhMx1OQGarUjs+ST6UUyj9K5gsTdxSPnOeo6xHPXHcmUqpVehZC
         9244OrdDp4PfgyqJwWtpJdx/tn8odLmWKuTpXrkI50yp7XM7+H+jUpYZSlQw2Xps8Uy8
         Dem/Zuptud+d1ryy1fEAfA6jTBIjuxsdSVecl2+uyX46zWgxcqxKi1mdIy8xlXbNjRFo
         Z7nWOI/cF5YRcGxqUA8SZZ0sljD0HSZ36k2kvrH5WAJ+ATlDcUZl6WL7htoWeUA7J9FB
         7rKQbuxIwuitdvj07WNLESY97p6jZqKSTKeenI9VCPgXLwFwICAtph9La7zi4hQ70RkC
         x1BQ==
X-Gm-Message-State: AOAM530vxpJUCK11/PyqkNUNnUsXl6uWCng2Wj7y8po2BAaVkXbSIO6o
	uhtKCa6lJYUf2dd75q+kcr1xALKrguNQQ9vHonCJ0Q==
X-Google-Smtp-Source: ABdhPJyYK4iU2XE2q/feN2S81RszcBQn11ZAXji1miavcqol3at/RK4ph3hAXXaGtPJjcephZQMoRbvwq5nlbjGz3d4=
X-Received: by 2002:a17:906:58d4:b0:6f4:cebd:c4b with SMTP id
 e20-20020a17090658d400b006f4cebd0c4bmr4222200ejs.492.1652448047829; Fri, 13
 May 2022 06:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513044143.1045728-1-tzungbi@kernel.org> <20220513044143.1045728-8-tzungbi@kernel.org>
In-Reply-To: <20220513044143.1045728-8-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 13 May 2022 06:20:36 -0700
Message-ID: <CABXOdTft-YJHJNiw2xnigHsySOjJ1dDwFoQwXDiMADN5O2Loog@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] platform/chrome: cros_ec_spi: drop BUG_ON() if
 `din` isn't large enough
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 9:42 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> It is overkill to crash the kernel if the `din` buffer is going to full
> or overflow.
>
> Drop the BUG_ON() and return -EINVAL instead.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> Changes from v1:
> - Separate from the original 6th patch.
>
>  drivers/platform/chrome/cros_ec_spi.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
> index 5264615f46af..7360b3ff6e4f 100644
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
> @@ -304,7 +306,8 @@ static int cros_ec_spi_receive_response(struct cros_ec_device *ec_dev,
>         unsigned long deadline;
>         int todo;
>
> -       BUG_ON(ec_dev->din_size < EC_MSG_PREAMBLE_COUNT);
> +       if (ec_dev->din_size < EC_MSG_PREAMBLE_COUNT)
> +               return -EINVAL;
>
>         /* Receive data until we see the header byte */
>         deadline = jiffies + msecs_to_jiffies(EC_MSG_DEADLINE_MS);
> --
> 2.36.0.550.gb090851708-goog
>
