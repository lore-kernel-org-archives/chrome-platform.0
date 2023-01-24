Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DEC7C
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 06:57:06 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-4fd37a1551cso180264627b3.13
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 22:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fcebh+bUESLcOMNZ4sR2MuaW6vYB2qGoKmgCrKux9VU=;
        b=h2nLVR/RG3NysjTEIaFO1gviCk7tj/Pp+XDSLhXNzqCLdXGLa2H7NKPKeULZDdpUD+
         iZU98TWcvbRaAe4UXGc3tseS28OKioddBNnJFtOyCANyrBt3UvznzGKWgrs09EJLFtnu
         xJhIc5q+fkRVopubv+p4De1mIhIPj68y7bt60gQqs8ajxFXFsY15flgdyoF88SQvH9OZ
         dbXlQGNix7wgySF1YXKZShBMq9/aVgeSREuMQg0kScVbdWx3/VoZPmOSZEoIgd5BXM2W
         BNucppGLBY3QT+i3HB448dQvqni9UNC1lUDiuBV4mFlzRbECQokhbSEzYjngaTzLbwje
         lL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcebh+bUESLcOMNZ4sR2MuaW6vYB2qGoKmgCrKux9VU=;
        b=DuS2O/cXyhf3rbu2dI/0B50noiEzn+kWZEhM1ChlCq99VaHa5Bx3FlSCprdIXNLc57
         e56keMF0L2RKJmwkqiAXVXPhAi1js2d1j1j/p/cF0cmXnvo2ZEHKbCQ1DCzJZX+bSy0N
         d/1hmTwtinyYhuYYcLOAPsiQYXUjaD10dFVo4JXOfOxccRMZeIn3GaaniXObrbfPCFgQ
         TuQWb5HUwgvbpubHjABiu1Lb6M3apj3OjTHSTLpnPo8kjlZG/4ENHaVFLVUmCdmKWhLu
         mLM5jejdnRW7VZcE91Vzrx+xC2Alx/HNcSsZvH2wVv1H/FSOy1qpchEF0zcLxdun/t2b
         oy1g==
X-Gm-Message-State: AO0yUKWthODa4ZaIljoT+BEWS7ZGjMSEkGWauNo8N1+x7FqFWyEyOg17
	f9tF+tul9T2xRy0wbJYxn8hwDuMzpAIVuxGfZw95Xg==
X-Google-Smtp-Source: AK7set+t8kQvXIeEjL5m+Tui6k3ysRdw96B0wR6qF+zF2OY9Qxu9OA2HEdsUGWTTnrqnr+PBfjQDpO9Soua+TgUl8EQ=
X-Received: by 2002:a81:7902:0:b0:506:3b34:5127 with SMTP id
 u2-20020a817902000000b005063b345127mr198916ywc.402.1674543425311; Mon, 23 Jan
 2023 22:57:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230124061521.v2.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
In-Reply-To: <20230124061521.v2.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 23 Jan 2023 22:56:54 -0800
Message-ID: <CABXOdTeFw_puhp5t=UUWLwrtqaoLo9ys6Z8r9Gd4HXZ3te8jdQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: allow deferred probe
 of switch handles
To: Victor Ding <victording@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	dustin@howett.net, lee.jones@linaro.org, bleung@chromium.org, 
	dnojiri@chromium.org, sebastian.reichel@collabora.com, 
	gregkh@linuxfoundation.org, pmalani@chromium.org, gustavoars@kernel.org, 
	groeck@chromium.org, enric.balletbo@collabora.com, tinghan.shen@mediatek.com, 
	heikki.krogerus@linux.intel.com, tzungbi@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 23, 2023 at 10:16 PM Victor Ding <victording@chromium.org> wrote:
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
> Changes in v2:
> - Coverted switch-block to nested if-blocks.
>
>  drivers/platform/chrome/cros_ec_typec.c | 26 ++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 59de4ce01fab..580f3bdf091c 100644
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
>                 goto mux_err;
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

This change is pointless.

Guenter

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
> @@ -423,9 +429,11 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
>                 }
>
>                 ret = cros_typec_get_switch_handles(cros_port, fwnode, dev);
> -               if (ret)
> -                       dev_dbg(dev, "No switch control for port %d\n",
> -                               port_num);
> +               if (ret) {
> +                       dev_dbg(dev, "No switch control for port %d, err: %d\n", port_num, ret);
> +                       if (ret == -EPROBE_DEFER)
> +                               goto unregister_ports;
> +               }
>
>                 ret = cros_typec_register_port_altmodes(typec, port_num);
>                 if (ret) {
> --
> 2.39.1.405.gd4c25cc71f-goog
>
