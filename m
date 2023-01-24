Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65346A31
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 03:18:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so11933525wmb.0
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 19:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bX8jlvRRHnbZO+FMV1n3GBuPBKjA8HiWEl8ZU9biZNo=;
        b=Ap90xt+qVTa67tCBqS8cFgHYFj2iwWOTgoYIt3UhkzA4peSOFAcpjTMJlDtl4r81k/
         bh88B8WYHja4Yf2hDG4gomibKmboIeM93CQBNasSul5xH+vXo9NJsICrhcNzhvyVCHfX
         6bFLaDzoaGsVOpnh3f52m+4T3rz2qDsL/05Mc0A1Q175ZtZKYt/nI1/n8ySFLbGxhhwC
         7Hid+fDug4UIhVYXdRDe13OHwrqopSXm5RPf1ueDWyfeCNnNcCGK/8RrtoiCqCawDofn
         A/Oer92NO/+NgUQKmxDrJkLW1+968BULoJpT+ziqcza2S1UJd9YmlwmriNuXzVpkd1JH
         fKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bX8jlvRRHnbZO+FMV1n3GBuPBKjA8HiWEl8ZU9biZNo=;
        b=oXoyGR0hPT6actthKH+DDrzNi0b3oO5aVpkvYCPpFcuN3yf/q/peUwk/9z/FfOF+zd
         CMdR0sBi7mIQTfKhOy3LmZctoiaS7XJTaGfVUpepPZ2UEA8pvyDnBxpqW4ISREtOfcRK
         1BGbl4rl98AIbbjB4SoxwCgwF6IrQsYkDXZGk+98MysyQrUCXSsIvEenvdGk00ZF8Gl3
         J+6GzkTr7pDSzOjXFomjx+AliKZ3V4L1kkb6YkG/TEW6P5OGVCncNX2kSfreNBlU5Nr2
         1bFjZw9uZ3xVl9cxegYo5yzWpECGIzdmbKmrZtPVEdSAlnH6Dv64q4jzCZ45w7TqvwPr
         c59g==
X-Gm-Message-State: AFqh2kp9wltseLkPL2anJUgSmSd9K60Wo/o8kxxnvnfxoh2YUylfGbLW
	TXTAKYbTKL1N9vuc6do2M8yh+ZWUAC2mCW17r6VnsQ==
X-Google-Smtp-Source: AMrXdXtm/suOeOr9KR3L8KHaqhXFEzCi41T0bOriyTa9SyB4A+WCUSa2jrS1s+hMpg9BJMYxrsHJmJzdPHyzOq7qhl0=
X-Received: by 2002:a05:600c:5117:b0:3cf:cb16:f242 with SMTP id
 o23-20020a05600c511700b003cfcb16f242mr1888101wms.82.1674530318392; Mon, 23
 Jan 2023 19:18:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230123093609.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
 <CACeCKafcL=KJ+a5C2BKXWX3rkWf9BHp1oB3dikAjGtFWqW5_PA@mail.gmail.com>
In-Reply-To: <CACeCKafcL=KJ+a5C2BKXWX3rkWf9BHp1oB3dikAjGtFWqW5_PA@mail.gmail.com>
From: Victor Ding <victording@google.com>
Date: Tue, 24 Jan 2023 14:18:02 +1100
Message-ID: <CANqTbdY=X0=GH2Gf_yB3vhY1iBK-Mfr=Yqu73=xujgfof+3sCA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: allow deferred probe of
 switch handles
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	gustavoars@kernel.org, heikki.krogerus@linux.intel.com, dnojiri@chromium.org, 
	dustin@howett.net, lee.jones@linaro.org, tzungbi@kernel.org, 
	groeck@chromium.org, gregkh@linuxfoundation.org, tinghan.shen@mediatek.com, 
	sebastian.reichel@collabora.com, enric.balletbo@collabora.com, 
	bleung@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 24, 2023 at 11:43 AM Prashant Malani <pmalani@chromium.org> wrote:
>
> On Mon, Jan 23, 2023 at 1:36 AM Victor Ding <victording@chromium.org> wrote:
> >
> > `fwnode_typec_{retimer,mux,switch}_get()` could return `-EPROBE_DEFER`,
> > which is called from `cros_typec_get_switch_handles`. When this happens,
> > it does not indicate absence of switches; instead, it only hints that
> > probing of switches should occur at a later time.
> >
> > Progagate `-EPROBE_DEFER` to upper layer logic so that they can re-try
> > probing switches as a better time.
> >
> > Signed-off-by: Victor Ding <victording@chromium.org>
> > ---
> >
> >  drivers/platform/chrome/cros_ec_typec.c | 30 +++++++++++++++++--------
> >  1 file changed, 21 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> > index 59de4ce01fab..f4b3fc788491 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -145,31 +145,37 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
> >                                          struct fwnode_handle *fwnode,
> >                                          struct device *dev)
> >  {
> > +       int ret = 0;
> > +
> >         port->mux = fwnode_typec_mux_get(fwnode, NULL);
> >         if (IS_ERR(port->mux)) {
> > -               dev_dbg(dev, "Mux handle not found.\n");
> > +               ret = PTR_ERR(port->mux);
> > +               dev_dbg(dev, "Mux handle not found: %d.\n", ret);
> >                 goto mux_err;
> >         }
> >
> >         port->retimer = fwnode_typec_retimer_get(fwnode);
> >         if (IS_ERR(port->retimer)) {
> > -               dev_dbg(dev, "Retimer handle not found.\n");
> > +               ret = PTR_ERR(port->retimer);
> > +               dev_dbg(dev, "Retimer handle not found: %d.\n", ret);
> >                 goto retimer_sw_err;
> >         }
> >
> >         port->ori_sw = fwnode_typec_switch_get(fwnode);
> >         if (IS_ERR(port->ori_sw)) {
> > -               dev_dbg(dev, "Orientation switch handle not found.\n");
> > +               ret = PTR_ERR(port->ori_sw);
> > +               dev_dbg(dev, "Orientation switch handle not found: %d\n", ret);
> >                 goto ori_sw_err;
> >         }
> >
> >         port->role_sw = fwnode_usb_role_switch_get(fwnode);
> >         if (IS_ERR(port->role_sw)) {
> > -               dev_dbg(dev, "USB role switch handle not found.\n");
> > +               ret = PTR_ERR(port->role_sw);
> > +               dev_dbg(dev, "USB role switch handle not found: %d\n", ret);
> >                 goto role_sw_err;
> >         }
> >
> > -       return 0;
> > +       return ret;
> >
> >  role_sw_err:
> >         typec_switch_put(port->ori_sw);
> > @@ -181,7 +187,7 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
> >         typec_mux_put(port->mux);
> >         port->mux = NULL;
> >  mux_err:
> > -       return -ENODEV;
> > +       return ret;
> >  }
> >
> >  static int cros_typec_add_partner(struct cros_typec_data *typec, int port_num,
> > @@ -423,9 +429,15 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
> >                 }
> >
> >                 ret = cros_typec_get_switch_handles(cros_port, fwnode, dev);
> > -               if (ret)
> > -                       dev_dbg(dev, "No switch control for port %d\n",
> > -                               port_num);
> > +               switch (ret) {
> > +               case 0:
> > +                       break;
> > +               case -EPROBE_DEFER:
> > +                       dev_err(dev, "Deferring getting switch handles at port %d\n", port_num);
> > +                       goto unregister_ports;
> > +               default:
> > +                       dev_dbg(dev, "No switch control for port %d, err: %d\n", port_num, ret);
> > +               }
>
> The switch statement seems a little clunky here. Instead, nest a couple
> of ifs; it is shorter and easier to read IMO.
>
> ret = cros_typec_get_switch_handles(cros_port, fwnode, dev);
> if (ret) {
>     dev_err_probe(dev, ret, "No switch control for port: %d\n", port_num);
>     if (ret == -EPROBE_DEFER)
>         goto unregister_ports;
> }
>
Good idea, I'll update accordingly in the next revision.
> }
> }
> >
> >                 ret = cros_typec_register_port_altmodes(typec, port_num);
> >                 if (ret) {
> > --
> > 2.39.0.246.g2a6d74b583-goog
> >
