Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCB37C
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 19:08:31 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id h23so26028553ejj.12
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jun 2022 12:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ly2K6RwUC0xQceY9gkjiyR1NrDY+373o7Stwfq7Edo8=;
        b=Sr4RPJ0nr2GZpTGnB63XLeYV+sZ11PmaJxxVtlKWt86mxu1ekdWtNjYzxVHj0IuKf5
         X+fnD/w3sWeMre0IMgkEivxZYCXGVcJkYQdWL5zk7gmAKxdQbhZx5MUgPKCbUxAydsFn
         t7b7xLFPBwK6woxotyHvhecOue2ay5ZIlh5qXuS2CNLWnRS70ZzD5kbcozgepZww8BoX
         8LGiX+MLYxkeEKFl0uJEqxVGyfUKcpvfusIU04r4JV4h6/96dbX1THptBWkADgzZaqDX
         TKo49V4mt1ZjRPBXsr8iuM0WRXzlXgWAqhaAAEzN/9fn8nduHStb0SmHyD8PzP+p7Kyc
         4zWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ly2K6RwUC0xQceY9gkjiyR1NrDY+373o7Stwfq7Edo8=;
        b=AjSygWjptFMJ6+OMm8FgMARH5kfVim2uKR3sg0dG4wzcZ5gzEBj2UYL/ajFZhXDYfp
         3hd8SwTdx7lPIuAFAp5EBiaIP9dX5cltnrqmECzff01XkGrqyelNYGBvm/CzFwRp3GNT
         +cteKynadPYM4B4e1WmVR4IonduwSCahQo0zXZvAt0UJuX9f/f1J0NP0l6A0KUOntsJl
         ovzCvztawkyoEJwVzbmeaysCh62vCV8yAjt7OXD0MPJY1B236KX/Uh2Q+aBVt7sNTbKg
         nDkYLPncW/BW/DFTSHAtfDqISJBS2KzBaz36GDaECIByGsnM2qHiNB4SZ+yPQifQk+wn
         TkfA==
X-Gm-Message-State: AOAM532Q7quhNXQQrRmp2wwBPW/nD/JWoyzCjVq58RKeNTaCdPqZ9y7C
	b84L0MzatCUqJ5PPvMEbGluPfajBRTcFa58Tt30Wjg==
X-Google-Smtp-Source: ABdhPJzWxRQB/2wXoL3Vfr2wtMPhbfyjsFdRV8g50CZM5246EExQbSq92WL3xecfwhVwmo8o4hGRTZ/TC+TqBkBBZiI=
X-Received: by 2002:a17:907:8689:b0:6fe:e525:ea9c with SMTP id
 qa9-20020a170907868900b006fee525ea9cmr28506094ejc.720.1654628909344; Tue, 07
 Jun 2022 12:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607145639.2362750-1-tzungbi@kernel.org> <20220607145639.2362750-14-tzungbi@kernel.org>
In-Reply-To: <20220607145639.2362750-14-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 7 Jun 2022 12:08:16 -0700
Message-ID: <CABXOdTdNas6ngk514LnLMGT8eZkZRT+dxYynQfsSWVhrJMkNhQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] platform/chrome: cros_ec_proto: don't show MKBP
 version if unsupported
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 7:57 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> It wrongly showed the following message when it doesn't support MKBP:
> "MKBP support version 4294967295".
>
> Fix it.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> No v1.  New in the series.
>
>  drivers/platform/chrome/cros_ec_proto.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index de6bc457e496..ee15a73eee38 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -506,13 +506,13 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>         ret = cros_ec_get_host_command_version_mask(ec_dev,
>                                                     EC_CMD_GET_NEXT_EVENT,
>                                                     &ver_mask);
> -       if (ret < 0 || ver_mask == 0)
> +       if (ret < 0 || ver_mask == 0) {
>                 ec_dev->mkbp_event_supported = 0;
> -       else
> +       } else {
>                 ec_dev->mkbp_event_supported = fls(ver_mask);
>
> -       dev_dbg(ec_dev->dev, "MKBP support version %u\n",
> -               ec_dev->mkbp_event_supported - 1);
> +               dev_dbg(ec_dev->dev, "MKBP support version %u\n", ec_dev->mkbp_event_supported - 1);
> +       }
>
>         /* Probe if host sleep v1 is supported for S0ix failure detection. */
>         ret = cros_ec_get_host_command_version_mask(ec_dev,
> --
> 2.36.1.255.ge46751e96f-goog
>
