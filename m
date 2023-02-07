Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207BB5685
	for <chrome-platform@lists.linux.dev>; Tue,  7 Feb 2023 17:49:58 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id i38so8282098vkd.0
        for <chrome-platform@lists.linux.dev>; Tue, 07 Feb 2023 09:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jq2WTnUOKOlouEj9rhMJsPCKZ636O+FLTpfvi8EpzGk=;
        b=pNLJpHP1McY8BIX7M1KsXNR98xK6Okw7ZLSmxEa32RZd0YLzSdnwNLUhsjf3X6bJLB
         z9gEGsARi7VW48nVivnQPt56f45T5UZdiinjUT61tgJVB+zINfshW6/gXyix5/11BiTj
         uKF/Ju6nWBzKVgVfja85yNQOoG1RC3UCNVFtvu6Q5+WUxgcqjZf8g+NuLIu9xhsflbqO
         RAKou2GKXaNNxlrtcO3zIuKYUF3wYRwwHblR5w33XbCoGoFfSzNJa5jG2aRUPQYH7UeL
         obAT5bXPijJF8CXWz3fv5CWeeFNfkujMGR9MLiXm+GPyPgkV9WUoNS7CUtRW152LxF0e
         t3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jq2WTnUOKOlouEj9rhMJsPCKZ636O+FLTpfvi8EpzGk=;
        b=C3BNhbZsAGc8jvrQat+U7VAIHIuotGLlt/YeG6qHDKV2/O0PGcPDL8ZIdI8HV3owE6
         l9h61A8yyWJLaOSVwm8YlX5qrrvJsJe+EQ8AiWeHjUKjT9+HZYIK7DBVNsjE5Hi6Hxd4
         sv7Y9Msgf/rvmfJcdgzCrVOCuejrdcFtRObUkIzdVz5zLKpzHMJVf+DbMcKpF7S8Hsr3
         wmYpxfTzMwu17qrXNo29b4y7YUC4X1mSv44N9ZY90bSx2VlEJCx/b+xd7b3er5EiS6zi
         gftF8hiBpONakMb7FqTWUUsnzmqOWqlLVYYYJbc/bkKcieLykDtCWiZCsO/wqdzPNOpi
         efYg==
X-Gm-Message-State: AO0yUKWftZwgy+dXqyAwc6HZHgbx5Mmm46t30vFAOMtCUuIHOhOrK243
	nGVMV9vnxh6o7aqK8wV1DRseb3emhkBY0xYVOarZWQ==
X-Google-Smtp-Source: AK7set+6EsmzH/1uinKsBljoDIrb4rmosrnVxPNeqIwTFKopf7huIhtQL1p9wYVL2AhexhvDRphZZ4Gd6ODYQ3L+Z1U=
X-Received: by 2002:a05:6122:226:b0:3ea:49cf:10e2 with SMTP id
 e6-20020a056122022600b003ea49cf10e2mr591913vko.19.1675792197917; Tue, 07 Feb
 2023 09:49:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230207091443.143995-1-colin.i.king@gmail.com>
In-Reply-To: <20230207091443.143995-1-colin.i.king@gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 7 Feb 2023 09:49:46 -0800
Message-ID: <CABXOdTePo76u1UAP0VsYBJZiPaOEk=hZe1cLeMseRvcFOsJ_Mg@mail.gmail.com>
Subject: Re: [PATCH][next] platform/chrome: Fix spelling mistake "Attenetion"
 -> "attention"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 7, 2023 at 1:14 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a dev_warn message, make it lower case
> and fix the spelling.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 71f5d7d8e055..a673c3342470 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -1020,7 +1020,7 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
>                 cros_typec_handle_vdm_attention(typec, port_num);
>                 ret = cros_typec_send_clear_event(typec, port_num, PD_STATUS_EVENT_VDM_ATTENTION);
>                 if (ret < 0)
> -                       dev_warn(typec->dev, "Failed VDM Attenetion event clear, port: %d\n",
> +                       dev_warn(typec->dev, "Failed VDM attention event clear, port: %d\n",
>                                  port_num);
>         }
>  }
> --
> 2.30.2
>
