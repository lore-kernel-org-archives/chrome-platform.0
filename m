Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D67323A6
	for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 06:59:11 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id ha10so8315781ejb.3
        for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 22:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hoX4Z40MQwuszANnlGBImjuiii34Bm6IVdSkNEROGlk=;
        b=DYIALqhs5m9PNMHPE8yqYIxFmhgXWCNuD1nJkRncSHnTb9KsT2SEjTxLyCLcf07SND
         BuT1B67WTp6kKWo3FOST5wFfrrVouCr3lzbeI1KGFJ8ZBam/NFoSzrxJ91QWhGAFY65h
         a9xen1l7WE8m+vLpAI2NRR5TH2Q/wtYpx+7Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoX4Z40MQwuszANnlGBImjuiii34Bm6IVdSkNEROGlk=;
        b=F3mG5dBdb6Zwctl1oLvnOVaWH8LRdSecdakqyqTCBms+Ky7rO3PHa/+Go2ZrOe0J9N
         a76oWViWaDg9Q+U9h7MciIY2lDuwreW4B8MBh51K4Bb93ogsu0DlIBhcSo1KiYXM7GJk
         46rpDCnK8ENYW4suV/YCgvmMB8Q9FpJFzsQQb3x0C2ijX27zhKUSgsGyI8ivhQ4JLtLW
         /vzd8whhHr7lkoq5cgbOnsfkIuSOvn7rhoRwFIH5e1uubqUf3JgAlp7gv5XpwyESxhku
         D/ga0eHjuFcveEQzo3XMBhueD2SudWhSq37U9bFtWBF9IrDk53hw/94GzOfQtMOUnpDi
         Kikg==
X-Gm-Message-State: ANoB5pk3Z/i5AnzAbdulrhsmMnXxgSgseXpxB4fnIFV/5pxZIqUSoLfL
	TQ/NEIcVeA3b+id2pjhF7tJDH9dMCdmmH39df6dzVw==
X-Google-Smtp-Source: AA0mqf61omTI/URQcHXxO27ayXnv2S/Msse51DzkeZiQ+oIxOTmaxkcc1G6pL7lsFhNXP8G7IxSxXZbVbQkqQ2kKVNQ=
X-Received: by 2002:a17:906:b1c6:b0:7ad:e82b:b66b with SMTP id
 bv6-20020a170906b1c600b007ade82bb66bmr14937894ejb.453.1669359549666; Thu, 24
 Nov 2022 22:59:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-6-treapking@chromium.org> <Y39g/OBLW3pt9qdy@smile.fi.intel.com>
In-Reply-To: <Y39g/OBLW3pt9qdy@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 25 Nov 2022 14:58:58 +0800
Message-ID: <CAEXTbpeX7cfzBhvFvhCtP42LYDZ9OZQhDJ805VacQOE=-EVv0g@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] drm/bridge: anx7625: Register Type C mode switches
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Javier Martinez Canillas <javierm@redhat.com>, 
	Stephen Boyd <swboyd@chromium.org>, dri-devel@lists.freedesktop.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Marek Vasut <marex@denx.de>, Xin Ji <xji@analogixsemi.com>, Lyude Paul <lyude@redhat.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	Allen Chen <allen.chen@ite.com.tw>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for reviewing the patch.

On Thu, Nov 24, 2022 at 8:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 24, 2022 at 06:20:54PM +0800, Pin-yen Lin wrote:
> > Register USB Type-C mode switches when the "mode-switch" property and
> > relevant port are available in Device Tree. Configure the crosspoint
> > switch based on the entered alternate mode for a specific Type-C
> > connector.
>
> ...
>
> > +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> > +{
> > +     if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
> > +             /* Both ports available, do nothing to retain the current one. */
> > +             return;
>
> > +     else if (ctx->typec_ports[0].dp_connected)
>
> This 'else' is redundant. I would rewrite above as
>
>         /* Check if both ports available and do nothing to retain the current one */
>         if (ctx->typec_ports[0].dp_connected && ctx->typec_ports[1].dp_connected)
>                 return;
>
>         if (ctx->typec_ports[0].dp_connected)
>
> > +             anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORMAL);
> > +     else if (ctx->typec_ports[1].dp_connected)
> > +             anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVERSE);
> > +}

Thanks for the detailed suggestion. I'll adapt this in v7.
>
> ...
>
> > +     data->dp_connected = (state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
> > +                           state->alt->mode == USB_TYPEC_DP_MODE);
>
> Parentheses are not needed.

Will fix this in v7.
>
> ...
>
> > +     /*
> > +      * <0 1> refers to SSRX1/SSTX1, and <2 3> refers to SSRX2/SSTX2.
> > +      */
> > +     for (i = 0; i < num_lanes; i++) {
>
> > +             if (port_num != -1 && port_num != dp_lanes[i] / 2) {
> > +                     dev_err(dev, "Invalid data lane numbers\n");
> > +                     return -EINVAL;
> > +             }
>
> According to Rob Linux must not validate device tree. If you need it, use
> proper YAML schema.
>
> > +             port_num = dp_lanes[i] / 2;
> > +     }
>

I'll remove this from the driver in v7.

> ...
>
> > +     if (!ctx->num_typec_switches) {
> > +             dev_warn(dev, "No Type-C switches node found\n");
>
> > +             return ret;
>
> Why not to return 0 explicitly?

Will update to just "return 0" in v7.

>
> > +     }
>
> ...
>
> > +     ctx->typec_ports = devm_kcalloc(
>
> Broken indentation.

Will fix in v7
>
> > +             dev, ctx->num_typec_switches, sizeof(struct anx7625_port_data),
> > +             GFP_KERNEL);
> > +     if (!ctx->typec_ports)
> > +             return -ENOMEM;
>
> ...
>
> > +struct anx7625_port_data {
>
> > +     bool dp_connected;
>
> You can save some bytes on some architectures if move this to be last field.

Thanks for the suggestion. I'll do so in v7
>
> > +     struct typec_mux_dev *typec_mux;
> > +     struct anx7625_data *ctx;
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
