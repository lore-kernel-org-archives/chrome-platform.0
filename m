Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA6B63C4
	for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 16:00:43 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 129so11388454ybb.0
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 08:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NeIcA5S+dnmrIVTwVfRWJo+4PAeUHSf9erW6VTBU+Fk=;
        b=SEZJD4dx9tkHB8M9ZJpL3Fvn6P01HXOawpP3Md/gmXNji/GzGqSKt2hw3xNEs+BvOQ
         wDfKBoRGOqWWZYsnURMXLVmN6t1BMDww7Bo7voRF+8rGxAvo//iHoisFyPCRLoOqaQlS
         /Yk/qAndjQfkW5ysqkVZrGBT/+IjrfbEugsq3YMuU1aebIq55SHOGX1YkWffL6qjEGXZ
         9Rk/buaJyZxsfXHMXjtA86yKshvJhDxAxCWFnbdpKYJLqLzW9VV3nZP4qs65paryP6Lt
         zzt/B2xUmNyU7Awki1TPmr8iU3FrYT8vOfjwfwJx01xVz1ED1v+PS8lSQJ//fiVkyTc/
         Ku5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NeIcA5S+dnmrIVTwVfRWJo+4PAeUHSf9erW6VTBU+Fk=;
        b=ix4ncBYtAGmKnhP1uQodGCjHQISI3+ZmOOfgX95bBkyT7YKw2hPdwo2AQXHBoEfXb1
         lCLpci4lMwBeppD4z7hPndLi0m790zf4rqHwMXnA5YLEeaE/K9YrJxu59QQ4njy6KTjp
         JFR9Fp5F86FoAqmkDaaqA2tMLLdCbTf0tZXDGtHF9ohVQEc2BS0rzZiMkGWN1xNbq3Mr
         orPDmuxgpgdTpzGdUpJkV3/XWhLe8azBcR36BCd8OTZNBeqwl4MwhiV3OwZct/2yrtB7
         VFU2ne7LoJGS0iAA/T5tKVt2UIVJ+h3UaAIsfhPANBKWcghyXmUa0iRVLpdzVxFZskUe
         mfKQ==
X-Gm-Message-State: AFqh2kr0iwE8si0gDifCZnK9Gbh/t0pJEHyd4UJjFZCHbdepQ3h09lge
	1hBW1+Xgj7ml8f/KchpLg3LDHlajnKa7JhKmUPDhYA==
X-Google-Smtp-Source: AMrXdXujNE1G5UWuwXCs+5+Pw9XLNjdaXbWFeSasbkoUAsicrIlpOl0APXO1UPrAC9V1oPfF2Gp4dFd3hrJ3d7B6s/8=
X-Received: by 2002:a25:4643:0:b0:7f0:6577:3333 with SMTP id
 t64-20020a254643000000b007f065773333mr1764056yba.525.1674489642788; Mon, 23
 Jan 2023 08:00:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230123093609.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
In-Reply-To: <20230123093609.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 23 Jan 2023 08:00:31 -0800
Message-ID: <CABXOdTcEi7zb6YNcWsV6vXjO6T0VTOsuzJUO+APR1tgTfrXgww@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: allow deferred probe of
 switch handles
To: Victor Ding <victording@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	gustavoars@kernel.org, heikki.krogerus@linux.intel.com, dnojiri@chromium.org, 
	dustin@howett.net, lee.jones@linaro.org, tzungbi@kernel.org, 
	groeck@chromium.org, gregkh@linuxfoundation.org, pmalani@chromium.org, 
	tinghan.shen@mediatek.com, sebastian.reichel@collabora.com, 
	enric.balletbo@collabora.com, bleung@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 23, 2023 at 1:36 AM Victor Ding <victording@chromium.org> wrote:
>
> `fwnode_typec_{retimer,mux,switch}_get()` could return `-EPROBE_DEFER`,
> which is called from `cros_typec_get_switch_handles`. When this happens,
> it does not indicate absence of switches; instead, it only hints that
> probing of switches should occur at a later time.
>
> Progagate `-EPROBE_DEFER` to upper layer logic so that they can re-try
> probing switches as a better time.
>
> Signed-off-by: Victor Ding <victording@chromium.org>
> ---
>
>  drivers/platform/chrome/cros_ec_typec.c | 30 +++++++++++++++++--------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 59de4ce01fab..f4b3fc788491 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -145,31 +145,37 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
>                                          struct fwnode_handle *fwnode,
>                                          struct device *dev)
>  {
> +       int ret = 0;
> +
>         port->mux = fwnode_typec_mux_get(fwnode, NULL);
>         if (IS_ERR(port->mux)) {
> -               dev_dbg(dev, "Mux handle not found.\n");
> +               ret = PTR_ERR(port->mux);
> +               dev_dbg(dev, "Mux handle not found: %d.\n", ret);

All of those should call dev_err_probe().

>                 goto mux_err;

and this can return directly.

>         }
>
>         port->retimer = fwnode_typec_retimer_get(fwnode);
>         if (IS_ERR(port->retimer)) {
> -               dev_dbg(dev, "Retimer handle not found.\n");
> +               ret = PTR_ERR(port->retimer);
> +               dev_dbg(dev, "Retimer handle not found: %d.\n", ret);
>                 goto retimer_sw_err;
>         }
>
>         port->ori_sw = fwnode_typec_switch_get(fwnode);
>         if (IS_ERR(port->ori_sw)) {
> -               dev_dbg(dev, "Orientation switch handle not found.\n");
> +               ret = PTR_ERR(port->ori_sw);
> +               dev_dbg(dev, "Orientation switch handle not found: %d\n", ret);
>                 goto ori_sw_err;
>         }
>
>         port->role_sw = fwnode_usb_role_switch_get(fwnode);
>         if (IS_ERR(port->role_sw)) {
> -               dev_dbg(dev, "USB role switch handle not found.\n");
> +               ret = PTR_ERR(port->role_sw);
> +               dev_dbg(dev, "USB role switch handle not found: %d\n", ret);
>                 goto role_sw_err;
>         }
>
> -       return 0;
> +       return ret;
>
>  role_sw_err:
>         typec_switch_put(port->ori_sw);
> @@ -181,7 +187,7 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
>         typec_mux_put(port->mux);
>         port->mux = NULL;
>  mux_err:
> -       return -ENODEV;
> +       return ret;
>  }
>
>  static int cros_typec_add_partner(struct cros_typec_data *typec, int port_num,
> @@ -423,9 +429,15 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
>                 }
>
>                 ret = cros_typec_get_switch_handles(cros_port, fwnode, dev);
> -               if (ret)
> -                       dev_dbg(dev, "No switch control for port %d\n",
> -                               port_num);
> +               switch (ret) {
> +               case 0:
> +                       break;
> +               case -EPROBE_DEFER:
> +                       dev_err(dev, "Deferring getting switch handles at port %d\n", port_num);
> +                       goto unregister_ports;
> +               default:
> +                       dev_dbg(dev, "No switch control for port %d, err: %d\n", port_num, ret);
> +               }
>
>                 ret = cros_typec_register_port_altmodes(typec, port_num);
>                 if (ret) {
> --
> 2.39.0.246.g2a6d74b583-goog
>
