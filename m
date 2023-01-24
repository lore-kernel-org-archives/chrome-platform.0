Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A52B6FA1
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 15:14:48 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id cm4so577442edb.9
        for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 07:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eFeBhnH+0B/42mAHnRRgB7lrALBFMURKcwmaM7RawrY=;
        b=k+mgpune5Pmc2lqEWZ+99lql1jb492y3C/Kyzi9ionAfVmCVTFvbOtMD0QaLYL9ypL
         IAsvZGY+J3UA7pz8mcMHWMzlZcNBSpr+RED1DOLVtaFVwwgqtNrweAJLw4O89YLUUDNS
         rdNk3uJASxvwQ3Fd7gvZD9tI7lMwWJ7pBnl+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFeBhnH+0B/42mAHnRRgB7lrALBFMURKcwmaM7RawrY=;
        b=OuDKkQuK/FVQNZTXS3vRV7hzkgbawnFBnAf4Ber2Axf3mPWCqwTOeRXDqq5pk+32VL
         CKVTUp9d3oYDUtT+oCG61500YhbXbLT4Q8VmVYfnQS+lVBxpGu975H3EZkBZIOhr7aZf
         R0CfzU69uCseooYZ2hZ37aJvkSMO1gafipvhrQYvQo/CLuVR8pKfPJ18hd37E+Idut3i
         eGYKuNTv4vjRJx43XKApTr5oXryrQG6gka+GzjQ5NjIkroYxhDPIuSHl/SygQtwg6Z7k
         I/wSGIn0EPY2CjDOKvxkkPTyh9Ywkn9nA2mPDUGP1kpAwCLE4QH/sop7npGP3bDBJctm
         28qw==
X-Gm-Message-State: AFqh2kpMUrZa3ghzLt1xVmTN1FOu36gFe4okqKKnQx9Rcg3U8ZOC0qmV
	Ifib/LlEISK/0hXbhs4FPCaRhsPf4VocoKqvAOj+ww==
X-Google-Smtp-Source: AMrXdXsY39EBZImVG3yBHV1zEjbdADI7AUEz6yUS4RDiaCK4MX0EZZGfjAHxM38N8ipvhu0XJdE4viQYk9mA0ilnfSU=
X-Received: by 2002:a05:6402:417:b0:49e:27c9:8fe5 with SMTP id
 q23-20020a056402041700b0049e27c98fe5mr4018804edv.56.1674573286172; Tue, 24
 Jan 2023 07:14:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230124075555.v3.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
In-Reply-To: <20230124075555.v3.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
From: Benson Leung <bleung@chromium.org>
Date: Tue, 24 Jan 2023 07:14:33 -0800
Message-ID: <CANLzEku+O2=Ow+OO0-VoCxKbmoXDz-Jdj-VNE69f-iDEX=XENA@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec_typec: allow deferred probe
 of switch handles
To: Victor Ding <victording@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	heikki.krogerus@linux.intel.com, lee.jones@linaro.org, groeck@chromium.org, 
	enric.balletbo@collabora.com, tzungbi@kernel.org, 
	sebastian.reichel@collabora.com, gregkh@linuxfoundation.org, 
	gustavoars@kernel.org, dustin@howett.net, dnojiri@chromium.org, 
	tinghan.shen@mediatek.com, pmalani@chromium.org
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

Reviewed-by: Benson Leung <bleung@chromium.org>

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
>


-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
