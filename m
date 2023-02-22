Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D851C17
	for <chrome-platform@lists.linux.dev>; Wed, 22 Feb 2023 05:05:25 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id f9so3573739iox.2
        for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 21:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fnu1EJD881ilgzbXP/u2M6qiohAhxhnaJqCCnJN+Tk8=;
        b=FubYbTKjUQHr3cEQiX3cMJOQw4FfCE/OMOouqh/l8wKE33FVwKwsXJcZPCVlJOgruk
         TwqXvfjx8dAxXtopRpr/7I3tGJw6wGnLplPO44Jf7qPfUZiBkStTGzavNICWu6K4/ijQ
         t56/tUtwbEDOBpuFgeHcQRqgq9PseVi3JLl2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fnu1EJD881ilgzbXP/u2M6qiohAhxhnaJqCCnJN+Tk8=;
        b=7Nkoo6aiMPNtA/lmkz2n5TmWzQcVtL67wC+1gCYSuLXCU+W5LUrF9CO2+JBCh1cIe+
         brGeUxnbGoIjZy6Zldnotf3Ms2LeSl17irsN553OQYLtr/a+i3KSbBJ7VZKRg7ZZBJKp
         7HB1A9gJqaWHQ4tcJKB9CGmedZqaru671bnJGRyLiT3H0uNR/GdasSyDrnG/4IvU/v0f
         GX4wGvBauAxey7gm8nfHwNTBeNZTOmO0XB3DKGNHluOnWbEMJcbJO6TrP5lyZtT5PLZP
         HCY43A7oYcY00T862dBR+40yVF+riJUTloPVpTMbg+g+vAngufBp0JIBjxiwtX/NmEiV
         awaQ==
X-Gm-Message-State: AO0yUKXIs6SJY/nIFMyWu6Fi6kEhC3u5DvLH+KOZtRs4XYGUUWqBz64P
	m4A89Llj6+eosqVnAJBE6H48K2iN4cwDVY/OIay31A==
X-Google-Smtp-Source: AK7set9WiTsncAk01hPHPcRR1sXgR4N/+7kuisg+5cf5ZRp0qNCei8CeQdAbEZCvfHwnyW5W1nH1RQwFgy87puMdlp0=
X-Received: by 2002:a5d:80da:0:b0:71a:5a1f:544c with SMTP id
 h26-20020a5d80da000000b0071a5a1f544cmr4719763ior.5.1677042324712; Tue, 21 Feb
 2023 21:05:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221095054.1868277-1-treapking@chromium.org>
 <20230221095054.1868277-8-treapking@chromium.org> <Y/SstDfugez4/Qx4@smile.fi.intel.com>
In-Reply-To: <Y/SstDfugez4/Qx4@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 22 Feb 2023 13:05:13 +0800
Message-ID: <CAEXTbpeObyd1uKd3Qp9c3A9z9BX8R_SiH7okVrgmV+fMfaRaYQ@mail.gmail.com>
Subject: Re: [PATCH v12 07/10] drm/bridge: anx7625: Register Type C mode switches
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Marek Vasut <marex@denx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	Xin Ji <xji@analogixsemi.com>, Lyude Paul <lyude@redhat.com>, 
	Allen Chen <allen.chen@ite.com.tw>, devicetree@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	chrome-platform@lists.linux.dev, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-acpi@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for the review.

On Tue, Feb 21, 2023 at 7:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Feb 21, 2023 at 05:50:51PM +0800, Pin-yen Lin wrote:
> > Register USB Type-C mode switches when the "mode-switch" property and
> > relevant ports are available in Device Tree. Configure the crosspoint
> > switch based on the entered alternate mode for a specific Type-C
> > connector.
> >
> > Crosspoint switch can also be used for switching the output signal for
> > different orientations of a single USB Type-C connector, but the
> > orientation switch is not implemented yet. A TODO is added for this.
>
> ...
>
> > +static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
> > +{
> > +     int i;
>
> unsigned?
>
> + Blank line.
>
> > +     /* Check if both ports available and do nothing to retain the current one */
> > +     if (ctx->port_data[0].dp_connected && ctx->port_data[1].dp_connected)
> > +             return;
> > +
> > +     for (i = 0; i < 2; i++) {
> > +             if (ctx->port_data[i].dp_connected)
> > +                     anx7625_set_crosspoint_switch(ctx,
> > +                                                   ctx->port_data[i].orientation);
> > +     }
> > +}
>
> ...
>
> > +     ctx->port_data[port->port_num].dp_connected =
> > +             state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
>
> I would move the first parameter of && to the separate line for slightly better
> readability.
>
> > +             state->alt->mode == USB_TYPEC_DP_MODE;
>
> ...
>
> > +     for (i = 0; i < switch_desc->num_typec_switches; i++) {
> > +             struct drm_dp_typec_port_data *port = &switch_desc->typec_ports[i];
> > +             struct fwnode_handle *fwnode = port->fwnode;
> > +
> > +             num_lanes = fwnode_property_count_u32(fwnode, "data-lanes");
>
> > +
>
> Redundant blank line.
>
> > +             if (num_lanes < 0) {
> > +                     dev_err(dev,
> > +                             "Error on getting data lanes count from %pfwP: %d\n",
> > +                             fwnode, num_lanes);
>
> > +                     ret = num_lanes;
>
> Can be written differently:
>
> > +                     goto unregister_mux;
> > +             }
>
>                 ret = ...
>                 if (ret < 0) {
>                         ...
>                 }
>                 num_lanes = ret;
>
>
> What if it's 0?

The binding does not allow that, so I don't think we should check it here.

I'll address other comments in the next version.

Regards,
Pin-yen
>
> > +             ret = fwnode_property_read_u32_array(fwnode, "data-lanes",
> > +                                                  dp_lanes, num_lanes);
> > +             if (ret) {
> > +                     dev_err(dev,
> > +                             "Failed to read the data-lanes variable: %d\n",
> > +                             ret);
> > +                     goto unregister_mux;
> > +             }
> > +
> > +             ctx->port_data[i].orientation = (dp_lanes[0] / 2 == 0) ?
> > +                     TYPEC_ORIENTATION_REVERSE : TYPEC_ORIENTATION_NORMAL;
> > +             ctx->port_data[i].dp_connected = false;
> > +     }
> > +     complete_all(&ctx->mux_register);
> > +
> > +     return 0;
> > +
> > +unregister_mux:
> > +     complete_all(&ctx->mux_register);
> > +     anx7625_unregister_typec_switches(ctx);
> > +     return ret;
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
