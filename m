Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4FE7C
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 07:46:53 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id g11so11833524eda.12
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 23:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6g19/O4k5AwG/SXLw3kDzRcWbvy7LZU8yJW74odXy5E=;
        b=HVef/kjrTpFoFyiY1MmMmgpapa8gv9v1k/kcKhEG05OxvgATNlTU+soQKjbtKfe+MA
         Q1rnZcf6SUX9ETiybl9WqCQhDVQzUBy52QcONub4EHWVRuyPoOjB5Ox6vMhyKanK2Mr5
         Z5DaSIYDGBNcvBrHMsO0Vi9g+/WzEHxFnGZ/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6g19/O4k5AwG/SXLw3kDzRcWbvy7LZU8yJW74odXy5E=;
        b=5KmoPAlLHHLqwSPFMsNr7JXuUVZcyT+B/jmkorosXqstwkXThlU83uSL7U2Qn0b1KW
         cw6WIl3yEqISwoVEoGwen1UBbp1ArJxYFuzUmirRXsfLkF0BZFqw0tIfOgH/G66b6tlZ
         /iJm+WllKgU8Ok3r87Q51+hrI6p1TYiyFhvoWgh08SM9x8H8/rwgrCsP0szdVslCpSdu
         e1hCfns0ED/O9nC8hfR7vO1FjMt7f/aMeVvu/7EUwJX01LrNTOVaU7SCpExOqdWDn7PQ
         0xnU2ufes2BbQh7VU+ycn/oxqBqq59Q3klBNZfvYJyJvJRZNjIng2ho2gibc9pzwGUM7
         I24w==
X-Gm-Message-State: AFqh2kp6yDEBNq1jB4E3Tq7To1H93OPX7z6yhCIONQ/Wi6WXN3ogHxud
	9QWuxnx78SNqeDcM6l7fdgNvxfR83GlhJWHX
X-Google-Smtp-Source: AMrXdXv0LUc/hhltCo8OCMeyosrQJxG8xkJTRKBOAhctjp3zqCoO3WXOLevhfXOdjTQBjgRLi/MQ7g==
X-Received: by 2002:a05:6402:388c:b0:49a:6a2:6f2f with SMTP id fd12-20020a056402388c00b0049a06a26f2fmr33112254edb.4.1674546411454;
        Mon, 23 Jan 2023 23:46:51 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id s10-20020a056402520a00b0049ea0854ba9sm440147edd.52.2023.01.23.23.46.50
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 23:46:50 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id q8so10712166wmo.5
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 23:46:50 -0800 (PST)
X-Received: by 2002:a05:600c:2247:b0:3d9:9de9:da92 with SMTP id
 a7-20020a05600c224700b003d99de9da92mr1487835wmm.50.1674546409620; Mon, 23 Jan
 2023 23:46:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230124061521.v2.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
 <CABXOdTeFw_puhp5t=UUWLwrtqaoLo9ys6Z8r9Gd4HXZ3te8jdQ@mail.gmail.com>
In-Reply-To: <CABXOdTeFw_puhp5t=UUWLwrtqaoLo9ys6Z8r9Gd4HXZ3te8jdQ@mail.gmail.com>
From: Victor Ding <victording@chromium.org>
Date: Tue, 24 Jan 2023 18:46:13 +1100
X-Gmail-Original-Message-ID: <CANqTbdY97fMCrw3w=dFwpYFNqib5zV4MQ-PnKOwFsR4WZEA8jA@mail.gmail.com>
Message-ID: <CANqTbdY97fMCrw3w=dFwpYFNqib5zV4MQ-PnKOwFsR4WZEA8jA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: allow deferred probe
 of switch handles
To: Guenter Roeck <groeck@google.com>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	dustin@howett.net, lee.jones@linaro.org, bleung@chromium.org, 
	dnojiri@chromium.org, sebastian.reichel@collabora.com, 
	gregkh@linuxfoundation.org, pmalani@chromium.org, gustavoars@kernel.org, 
	groeck@chromium.org, enric.balletbo@collabora.com, tinghan.shen@mediatek.com, 
	heikki.krogerus@linux.intel.com, tzungbi@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 24, 2023 at 5:57 PM Guenter Roeck <groeck@google.com> wrote:
>
> On Mon, Jan 23, 2023 at 10:16 PM Victor Ding <victording@chromium.org> wrote:
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
> > Changes in v2:
> > - Coverted switch-block to nested if-blocks.
> >
> >  drivers/platform/chrome/cros_ec_typec.c | 26 ++++++++++++++++---------
> >  1 file changed, 17 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> > index 59de4ce01fab..580f3bdf091c 100644
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
>
> This change is pointless.
Sure, I'll revert this line to `return 0` in the next revision.
>
> Guenter
>
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
> > @@ -423,9 +429,11 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
> >                 }
> >
> >                 ret = cros_typec_get_switch_handles(cros_port, fwnode, dev);
> > -               if (ret)
> > -                       dev_dbg(dev, "No switch control for port %d\n",
> > -                               port_num);
> > +               if (ret) {
> > +                       dev_dbg(dev, "No switch control for port %d, err: %d\n", port_num, ret);
> > +                       if (ret == -EPROBE_DEFER)
> > +                               goto unregister_ports;
> > +               }
> >
> >                 ret = cros_typec_register_port_altmodes(typec, port_num);
> >                 if (ret) {
> > --
> > 2.39.1.405.gd4c25cc71f-goog
> >
