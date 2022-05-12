Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF05133C2
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 15:12:19 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id j6so10818304ejc.13
        for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 08:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gjD85xNC7TaiLaFuFjU/KtoVZTm3HwGMYHqFcknbBsA=;
        b=qdr+XsGFHWjQwJZpbJ4udmcbD7KkTuYQpAzeKy9omY6zZQ7+9R9z8lwdquDoniMJpO
         3KkgL6Gdc8N/n7BfucdAaGK/9TJ7Umq7W3A6JXkc2VRU2fd0Bnx6C/4HpKi1D5ut7CMp
         /6IKI92jKfEGACjt3N5PdEfbIl0FQZ6BrNZ4AI3ebw599DPJ44Oxgj2aebqQo0FDwb74
         4LeweSegiA0iyTaBn5JU3IDj96IHErKsWdVvjSqfX8vWoAq/H6o8wZzmBT1P9yoh/8Fa
         87HCDsbZGPIqfPXjDg959UsDiOp4UpyHBD8VfM13/4TpBGgEgucPh1YGaLtFfLGWIGdJ
         Mzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gjD85xNC7TaiLaFuFjU/KtoVZTm3HwGMYHqFcknbBsA=;
        b=O3gUfopBkNcjMbfyAjz6iHGyaRmGNgensU0BC1O70tANIf/C+JfgJ7MeJU2TD3mHEr
         R3i4e5aj4QVzz63QcDepJER5oH9qpSVtUl2fzHYOtg50yiKzNE09qGZgTv7ilhR14VNC
         37vd9S62HJI1HoBvNJ0eE3fTYBd/koTUldGwxHFxYdw85/F5bhjunqDPHTXaI4FR7t3U
         IETVtOC5s9oODeWEXOac2WmGAMUUtFj3++2mdXfOyOFPWVQ8Zcc4I8D7oNVmoxN1Zj4x
         HT+NMokoMf3oVtAZXvcGkEzvZod7SEHO84ZCoYG/TtNZzYKono1nv6S3027HgXfvWQSq
         0HSg==
X-Gm-Message-State: AOAM532Q0Vb6JoGKCBbCQJbyvjnsVgZvxf8oA58JHkR0+iI701TdqHOQ
	TcQeE3PjI/hDjvqsl23rZYLj9OEflmT7tEepNlmjLw==
X-Google-Smtp-Source: ABdhPJyciJT1YGz02AIq1sYlG377PZjPDDut/szgn1Gtg8u03VxsR/ud7YebfmdVqB4rFxr+X5hmNiaauAh59Pfqzdw=
X-Received: by 2002:a17:906:58d4:b0:6f4:cebd:c4b with SMTP id
 e20-20020a17090658d400b006f4cebd0c4bmr352889ejs.492.1652368335432; Thu, 12
 May 2022 08:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512083627.885338-1-tzungbi@kernel.org> <20220512083627.885338-5-tzungbi@kernel.org>
In-Reply-To: <20220512083627.885338-5-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 12 May 2022 08:12:04 -0700
Message-ID: <CABXOdTdrYPVSFGq6zmepM4jGEy0OmFog36S4faQbeL6G=OgGvw@mail.gmail.com>
Subject: Re: [PATCH 4/6] platform/chrome: cros_ec_proto: drop BUG_ON() in cros_ec_get_host_event()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 12, 2022 at 1:36 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> It is overkill to crash the kernel if the `ec_dev` doesn't support MKBP
> event but gets called into cros_ec_get_host_event().
>
> Drop the BUG_ON() and return error (0 in the case) instead.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <goeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 9ce3374846ff..ff767dccdf0f 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -817,7 +817,8 @@ u32 cros_ec_get_host_event(struct cros_ec_device *ec_dev)
>  {
>         u32 host_event;
>
> -       BUG_ON(!ec_dev->mkbp_event_supported);
> +       if (!ec_dev->mkbp_event_supported)
> +               return 0;
>
>         if (ec_dev->event_data.event_type != EC_MKBP_EVENT_HOST_EVENT)
>                 return 0;
> --
> 2.36.0.512.ge40c2bad7a-goog
>
