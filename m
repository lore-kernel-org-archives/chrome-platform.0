Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A210B290B
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 18:47:15 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id j16so21465798edw.11
        for <chrome-platform@lists.linux.dev>; Thu, 05 Jan 2023 10:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kgw8ytZ8qgDy6GzZF1ryroLO4GjbQhKhTHuYH5QueqQ=;
        b=d4xQW7aOqawwrqQ+Q+tdvQn2OItCU6t0Hz/kCQHrlQwBzfrFOZf00OWnnUp8NDcXse
         Gg4YLx0q41tNcLQFxYmTlq8LiiPDPw5awK6PTxoyYmyt2R9nGczDfnim45oqqSlwH1ku
         +A2oP7dYjAfTqmAUCDoI375sLGHDgzCW1Qz/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kgw8ytZ8qgDy6GzZF1ryroLO4GjbQhKhTHuYH5QueqQ=;
        b=Y7UnYZIFTtfMF9148330O16beB8m12uOh34BhTJxeyo7agEJMAT0aYY5UTpeugD0fN
         o2UyQkVI2uuTWqbucvR2Tz+/iZ5wHubYDVwn7w+/+NNwA8T4myq4bLijJUaOKBFFRzlt
         /14+SQML2lfGQTqgcPpro2CBQPrbcaZWGxmrsNzvRmlcU78TAFH4cMGPO3P+EYR7dMlW
         vcRUOeFd4El18CjmTXeoUhksFfzMI+DbA1uwbHD2JA0mPR4YH2Opb9fUQ/JNA4aWEps/
         RLxuu0W5QYPxPeDcgIStJrzRL70qD5LP00NLLVdh05kwfTDH+Ikx+JVTI/ziTaT3o41p
         UgYQ==
X-Gm-Message-State: AFqh2kq9vpkO4/utnUQ8zQ+JSjBGa5pRTV4EdA3k6lwRUpB5MoLtqPKf
	ZgaJ6jmmTYcy+LXwMpEbyzOy8XNiKDmKKi1dYslv3A==
X-Google-Smtp-Source: AMrXdXt0rB7h75RQCatj+bf0XdBiLgg9pvTKdsd4RrtVWZ6bj/PPRJBXCJfr4/DyqsPu8Mf+F4TBvcqf3H1BjTJKV4k=
X-Received: by 2002:a05:6402:516b:b0:47e:1b4a:5489 with SMTP id
 d11-20020a056402516b00b0047e1b4a5489mr6363589ede.262.1672944433616; Thu, 05
 Jan 2023 10:47:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230104060846.112216-1-pmalani@chromium.org> <20230104060846.112216-2-pmalani@chromium.org>
In-Reply-To: <20230104060846.112216-2-pmalani@chromium.org>
From: Benson Leung <bleung@chromium.org>
Date: Thu, 5 Jan 2023 10:46:57 -0800
Message-ID: <CANLzEkvqOvbSqtxG+YZoTmU=xH3ZZzbLEND7RQQH7pVPEY1hQg@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/chrome: cros_typec_switch: Check for retimer flag
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Prashant,

On Tue, Jan 3, 2023 at 10:09 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Not all ports have retimers. Only register a retimer switch if the
> "retimer-switch" property is present for that port's mux
> device.
>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

Thanks,
Benson

> ---
>  drivers/platform/chrome/cros_typec_switch.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
> index 2536bda03bf3..9ed1605f4071 100644
> --- a/drivers/platform/chrome/cros_typec_switch.c
> +++ b/drivers/platform/chrome/cros_typec_switch.c
> @@ -246,14 +246,16 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
>                 port->port_num = index;
>                 sdata->ports[index] = port;
>
> -               ret = cros_typec_register_retimer(port, fwnode);
> -               if (ret) {
> -                       dev_err(dev, "Retimer switch register failed\n");
> -                       goto err_switch;
> +               if (fwnode_property_present(fwnode, "retimer-switch")) {
> +                       ret = cros_typec_register_retimer(port, fwnode);
> +                       if (ret) {
> +                               dev_err(dev, "Retimer switch register failed\n");
> +                               goto err_switch;
> +                       }
> +
> +                       dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
>                 }
>
> -               dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
> -
>                 if (!fwnode_property_present(fwnode, "mode-switch"))
>                         continue;
>
> --
> 2.39.0.314.g84b9a713c41-goog
>


-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
