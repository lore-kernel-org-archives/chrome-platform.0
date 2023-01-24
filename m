Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B92063BF
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 13:20:22 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-4fd37a1551cso192530797b3.13
        for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 05:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iatBsnyN9KLmYoJDVX4uZPB29jcAj/SJ847xSay6LsM=;
        b=iU3g46mSoil2nPxNowG+amIi9F9QNYSJWYfoa06vn7GVe7l7J1IXEEq9/2F/yiWafY
         39LdD4/IdoMnNxumeksm7jIpQOB0wgYlsCKRUltL/CNf1jyXoUWBnQc+MB0FkmjgoUm0
         wpx73bbAvRBgT5ljsFf7X2mRhAmg+sO1rml6kVzUJsa5WqdJ0W6pJt3OBXAv01WALmrW
         95g+IuuKA2dynymTTVYqdoBwuIAejY2FjxA6fbRxG1RtNmGHwjUcIvZBGYUGH7Ljw8dX
         /ZzrLdLZrdxZR4nkC2VhGWe3IaE51ySkeJJbL9bTdnbYPGWn+sle+TOYctrPxvjZZElq
         GwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iatBsnyN9KLmYoJDVX4uZPB29jcAj/SJ847xSay6LsM=;
        b=q44FqQyNJGLKnCV2jQ6Ylg2z3dKdyHOJY3fa/A5vNQM0NrU8V0Z+hM8NRtzUL7+5pB
         Q79fgclaEWFtYQZa3vQEvbCrE2veIhE3LdgAm4Rz/yesT5MJar/Z3/ZcVb4sHi20sGaq
         94rpqlzY5Jt2wGF246ZNw8PhbBgI9OR5EHpd7FBB5DNe7DPZc3RomtQ8HbCkvabxPYSY
         K2z0eoLOa79/xeYcUSVxJsCIuigz52DGibZ3uExVjicFcf+TPngmqeHKyMQMVtdVhVct
         FTIAKyMgRRhxRHAuqxhxChCI/EICCc9DmO7weQ/PO26Yfuk6wr/aQ3N0AfBcErmsetdk
         gAvw==
X-Gm-Message-State: AFqh2krnHjsuDzei8k4fRJyMkoA4bvArnBskVN8sxnSh7vLhy4rUXlh6
	fXlni5hnKimHMSc6bF6VCgSkw0c7K7X4s4VzygfeXA==
X-Google-Smtp-Source: AMrXdXtpm5oP7Q44eFF7PiXc0dwzZyF5FEvbTCk1byLeqm7EwDv1dOfN+Bb7tXCmokekANx2Mf6Z2T+2AoXVz37lbA0=
X-Received: by 2002:a0d:eec6:0:b0:4d6:5735:dbfd with SMTP id
 x189-20020a0deec6000000b004d65735dbfdmr3330925ywe.157.1674566421203; Tue, 24
 Jan 2023 05:20:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230124075555.v3.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
In-Reply-To: <20230124075555.v3.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 24 Jan 2023 05:20:10 -0800
Message-ID: <CABXOdTdvMVfvSNPiNgjpyROE+7X-KzCsqYkKmnOnycBa_Vxv6g@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec_typec: allow deferred probe
 of switch handles
To: Victor Ding <victording@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	heikki.krogerus@linux.intel.com, lee.jones@linaro.org, groeck@chromium.org, 
	enric.balletbo@collabora.com, tzungbi@kernel.org, 
	sebastian.reichel@collabora.com, gregkh@linuxfoundation.org, 
	gustavoars@kernel.org, bleung@chromium.org, dustin@howett.net, 
	dnojiri@chromium.org, tinghan.shen@mediatek.com, pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 23, 2023 at 11:56 PM Victor Ding <victording@chromium.org> wrote:
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

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
> Changes in v3:
> - Reverted unnecessary change.
>
> Changes in v2:
> - Coverted switch-block to nested if-blocks.
>
>  drivers/platform/chrome/cros_ec_typec.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 59de4ce01fab..de480ab10488 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -145,27 +145,33 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
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
