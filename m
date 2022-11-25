Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66DC15B0
	for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 06:55:24 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x2so5168683edd.2
        for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 22:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ur6CY0ehyWvIsSYgBrRBd989RwDC6T3QUcqOKa4M1B4=;
        b=jNnSsHNcd023P83kMILxiDJDJgirzXk5J8n8FkSm4NyIFaVmXexpO0DEMEkYn4Oedc
         euDEkry9V94wGcq3+3lQ6Mi2B+iMeAkFXyijmtRixfRM1DB4eAtFMzcxbOYsl6nm+fvX
         C5HULIDB1sjSdqQ16R3LmA6SplmEqmUPXk2Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ur6CY0ehyWvIsSYgBrRBd989RwDC6T3QUcqOKa4M1B4=;
        b=ctKVeIre2r1OOuMFR/oV62Nql51sYFbyCu30FdGq9y0sxdkXpbIXkBETJo16GYS1Yt
         vbgKTvnwiJewDagZzYcOLsk02XFWpOUo7zfdkM2bLAUAGgoloRxhdNVsdaeACK/2+G2N
         AiZowvC+tveMYwP324TWuenkEmsd3Mg1x8BHT1B+AsEWwI3SJAVo4pC8CL8ZTxg8ew2U
         lNa/9qIkA61T6Z4X5a5bGViIWPJIDW8gj/MACCP9Yneqey4jIBQb9atYBqVRETpCHjMz
         U2JZrxjF/qRuPnf1j1lTiAcGitcZh10RLp5Y61HZ8jRSvxopL7C8B4RcW7Ktb9uKmWl9
         M7Ng==
X-Gm-Message-State: ANoB5pnOICVhFPcVqIBovwqJsDWwXFHf82AnD3TTN4ALefvhNAL5bUU7
	QFkkwdkGOfjCaKbJNxQR9Efbk++uNs5xAwjv5k244g==
X-Google-Smtp-Source: AA0mqf4R8vHrUUtgiwRXIkgosxHPQdIJFXKZT/SzNXwg5A6W3v+N2FteQiZNLGKekFOJ/0gOvKS6maAvZvkhLIhd3Co=
X-Received: by 2002:a05:6402:3895:b0:468:15f1:54b5 with SMTP id
 fd21-20020a056402389500b0046815f154b5mr15230966edb.8.1669359322947; Thu, 24
 Nov 2022 22:55:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-8-treapking@chromium.org> <Y39iRg2TZCljOyNN@smile.fi.intel.com>
In-Reply-To: <Y39iRg2TZCljOyNN@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 25 Nov 2022 14:55:11 +0800
Message-ID: <CAEXTbpfU1EBD7QYZLeRFk9Kz7+J1wamzaVuwVpa8M9WxWtCe-g@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/bridge: it6505: Register Type C mode switches
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

On Thu, Nov 24, 2022 at 8:23 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 24, 2022 at 06:20:56PM +0800, Pin-yen Lin wrote:
> > Register USB Type-C mode switches when the "mode-switch" property and
> > relevant port are available in Device Tree. Configure the "lane_swap"
> > state based on the entered alternate mode for a specific Type-C
> > connector, which ends up updating the lane swap registers of the it6505
> > chip.
>
> ...
>
> >  config DRM_ITE_IT6505
> >          tristate "ITE IT6505 DisplayPort bridge"
> >          depends on OF
> > +     depends on TYPEC || TYPEC=n
> >       select DRM_DISPLAY_DP_HELPER
> >       select DRM_DISPLAY_HDCP_HELPER
> >       select DRM_DISPLAY_HELPER
>
> Something went wrong with the indentation. Perhaps you need to fix it first.
>
> ...
>
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> > +#include <drm/drm_of.h>
>
> Make it ordered?

Will fix it in v7.

>
> ...
>
> > +struct it6505_port_data {
>
> > +     bool dp_connected;
>
> Perhaps make it last?

Will fix it in v7.

>
> > +     struct typec_mux_dev *typec_mux;
> > +     struct it6505 *it6505;
> > +};
>
> ...
>
> > +static void it6505_typec_ports_update(struct it6505 *it6505)
> > +{
> > +     usleep_range(3000, 4000);
> > +
> > +     if (it6505->typec_ports[0].dp_connected && it6505->typec_ports[1].dp_connected)
> > +             /* Both ports available, do nothing to retain the current one. */
> > +             return;
> > +     else if (it6505->typec_ports[0].dp_connected)
> > +             it6505->lane_swap = false;
> > +     else if (it6505->typec_ports[1].dp_connected)
> > +             it6505->lane_swap = true;
> > +
> > +     usleep_range(3000, 4000);
> > +}
>
> As per previous patch comments.

Will update it in v7.

>
> Also, comment out these long sleeps. Why they are needed.

Actually, it turns out that these sleeps are not needed. I'll remove it in v7.

>
> ...
>
> > +             int ret = pm_runtime_get_sync(dev);
> > +
> > +             /*
> > +              * On system resume, mux_set can be triggered before
> > +              * pm_runtime_force_resume re-enables runtime power management.
>
> We refer to the functions as func().

Will fix this in v7.

>
> > +              * Handling the error here to make sure the bridge is powered on.
> > +              */
> > +             if (ret < 0)
> > +                     it6505_poweron(it6505);
>
> This seems needed a bit more of explanation, esp. why you leave PM runtime
> reference count bumped up.

pm_runtime_force_suspend() disables runtime PM when the device enters
suspend, and sometime it6505_typec_mux_set() is called before
pm_runtime_force_resume brings runtime PM back. We force power up the
bridge in this case and leave the ref count incremented to make the
future pm_runtime_(get|put)_sync() calls balanced.

I'll include more explanations around this in v7.

>
> ...
>
> > +     num_lanes = drm_of_get_data_lanes_count(node, 0, 2);
> > +     if (num_lanes <= 0) {
> > +             dev_err(dev, "Error on getting data lanes count: %d\n",
> > +                     num_lanes);
> > +             return num_lanes;
> > +     }
> > +
> > +     ret = of_property_read_u32_array(node, "data-lanes", dp_lanes, num_lanes);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to read the data-lanes variable: %d\n",
> > +                     ret);
> > +             return ret;
> > +     }
> > +
> > +     for (i = 0; i < num_lanes; i++) {
> > +             if (port_num != -1 && port_num != dp_lanes[i] / 2) {
> > +                     dev_err(dev, "Invalid data lane numbers\n");
> > +                     return -EINVAL;
> > +             }
>
> As per previous patch comments.

I'll remove this part in v7 and try to figure out how to do similar
checking with schemas.
>
> > +             port_num = dp_lanes[i] / 2;
> > +     }
>
> The above seems like tons of duplicating code that drivers need to implement.
> Can we shrink that burden by adding some library functions?

Could you advise where this lib file should go, and what the namings
can be? The "port-switching" logic is specific to some of the DP
bridges, and I'm not sure what kinds of naming/structure fit into this
case.

Thanks and regards,
Pin-yen

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
