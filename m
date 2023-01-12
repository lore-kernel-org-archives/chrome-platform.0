Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15828366
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 05:19:28 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id i1so5453250ilu.8
        for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 21:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wJyoO4anzzcHqXiaoeK+7IkccPPZLbK57Z3Va0YxR0M=;
        b=O/TQh6oBXzMGJk+AYkShcpeWq6KLRh4wESmk4dPa76ZqEewzIR70Qs0um/8oFiFiqf
         EpGEPngY9ICVYyWn9LRk+61bqL5a6mKrxUIaCo5dMfT6FB6KiMr7eqxxqXvn5uuOV9FV
         1ekKbZuxsdXrcrAgGPp1looTe8MSHR7kmrYjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJyoO4anzzcHqXiaoeK+7IkccPPZLbK57Z3Va0YxR0M=;
        b=HNXfB8lUPMM7kJbtEw4pzSra8NhJnj6MHKQddv7c0r3Mqw/ArU/WOWaZhrpc2GYkY4
         pTjHNfTE4MKzdmwSUbrFL9i0L3jhi3WrvAe6FIf0Lg3RSHzhbOo8o7cXCJYJ+Ocw8ml4
         TPNYc3enK8mPFQ09LTGET5eH9JEr2ShNAAxyFK92ZvZtqvRS0Y3kcTCy9aAfJUZsJ6JV
         rksG4vA8CZiJAL0ygg+Vqd2PVal7HHFHzPVMUPCe+awpDiIuBQ/g0YAnKNaMlThBCAMp
         Tx2krSpIShPJcJflu1RhPeL6WPuXRq5LIkpb72cTT4Y7d88YeC647AMh6JIR1aVVHlWX
         2SWQ==
X-Gm-Message-State: AFqh2kr+v12pCSCNfMitrHx64nbWag5OjiNpj9q86BqsLB9K+qquaVrx
	1fw6FhQOM31kN87dfVkjIaBI7l9gqHpeJAUwFseQNA==
X-Google-Smtp-Source: AMrXdXvXhB+dvJiHWktGClThfwYsKKdtlHRRotKhjBSKSjlmLpEnFxYJA+qAf1ZIrvdPMr/hQ/rHF7eZVKTDXb1u49o=
X-Received: by 2002:a92:2804:0:b0:308:29d5:e429 with SMTP id
 l4-20020a922804000000b0030829d5e429mr6953742ilf.281.1673500768089; Wed, 11
 Jan 2023 21:19:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-4-treapking@chromium.org> <ccea730e-c5cb-4225-8d1e-97a0a7cb2e34@linaro.org>
In-Reply-To: <ccea730e-c5cb-4225-8d1e-97a0a7cb2e34@linaro.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 12 Jan 2023 13:19:17 +0800
Message-ID: <CAEXTbpek=5xqo2j0yKkC90+Oy1rXWQLJWu3X6vx6y-SqvxTvnA@mail.gmail.com>
Subject: Re: [PATCH v10 3/9] drm/display: Add Type-C switch helpers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Marek Vasut <marex@denx.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Javier Martinez Canillas <javierm@redhat.com>, Lyude Paul <lyude@redhat.com>, chrome-platform@lists.linux.dev, 
	Xin Ji <xji@analogixsemi.com>, Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	Allen Chen <allen.chen@ite.com.tw>, linux-acpi@vger.kernel.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Imre Deak <imre.deak@intel.com>, 
	Jani Nikula <jani.nikula@intel.com>, Kees Cook <keescook@chromium.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	shaomin Deng <dengshaomin@cdjrlc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

Thanks for the review.

On Thu, Jan 12, 2023 at 12:40 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/01/2023 06:20, Pin-yen Lin wrote:
> > Add helpers to register and unregister Type-C "switches" for bridges
> > capable of switching their output between two downstream devices.
> >
> > The helper registers USB Type-C mode switches when the "mode-switch"
> > and the "data-lanes" properties are available in Device Tree.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
> > ---
> >
> > Changes in v10:
> > - Collected Reviewed-by and Tested-by tags
> > - Replaced "void *" with "typec_mux_set_fn_t" for mux_set callbacks
> > - Print out the node name when errors on parsing DT
> > - Use dev_dbg instead of dev_warn when no Type-C switch nodes available
> > - Made the return path of drm_dp_register_mode_switch clearer
> >
> > Changes in v8:
> > - Fixed the build issue when CONFIG_TYPEC=m
> > - Fixed some style issues
> >
> > Changes in v7:
> > - Extracted the common codes to a helper function
> > - New in v7
> >
> >   drivers/gpu/drm/display/drm_dp_helper.c | 134 ++++++++++++++++++++++++
> >   include/drm/display/drm_dp_helper.h     |  17 +++
> >   2 files changed, 151 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 16565a0a5da6..a2ec40a621cb 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -30,11 +30,13 @@
> >   #include <linux/sched.h>
> >   #include <linux/seq_file.h>
> >   #include <linux/string_helpers.h>
> > +#include <linux/usb/typec_mux.h>
> >   #include <linux/dynamic_debug.h>
> >
> >   #include <drm/display/drm_dp_helper.h>
> >   #include <drm/display/drm_dp_mst_helper.h>
> >   #include <drm/drm_edid.h>
> > +#include <drm/drm_of.h>
> >   #include <drm/drm_print.h>
> >   #include <drm/drm_vblank.h>
> >   #include <drm/drm_panel.h>
> > @@ -3891,3 +3893,135 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
> >   EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
> >
> >   #endif
> > +
> > +#if IS_REACHABLE(CONFIG_TYPEC)
> > +static int drm_dp_register_mode_switch(struct device *dev, struct device_node *node,
> > +                                    struct drm_dp_typec_switch_desc *switch_desc,
> > +                                    void *data, typec_mux_set_fn_t mux_set)
> > +{
> > +     struct drm_dp_typec_port_data *port_data;
> > +     struct typec_mux_desc mux_desc = {};
> > +     char name[32];
> > +     u32 dp_lanes[2];
> > +     int ret, num_lanes, port_num = -1;
> > +
> > +     num_lanes = drm_of_get_data_lanes_count(node, 0, 2);
>
> 2 looks incorrect. IIRC DP altmode can support up to 4 lanes.

This function is implemented for 4-lane DP bridges to switch its
outputs between 2 downstreams. So, I assume that there will only be at
most 2 lanes for each downstream. I don't think a 4-lane downstream
makes sense for mode switches unless we want to support bridges with
more than 4 lanes.
>
> > +     if (num_lanes <= 0) {
> > +             dev_err(dev, "Error on getting data lanes count from %s: %d\n",
> > +                     node->name, num_lanes);
> > +             return num_lanes;
> > +     }
> > +
> > +     ret = of_property_read_u32_array(node, "data-lanes", dp_lanes, num_lanes);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to read the data-lanes variable from %s: %d\n",
> > +                     node->name, ret);
> > +             return ret;
> > +     }
> > +
> > +     port_num = dp_lanes[0] / 2;
> > +
> > +     port_data = &switch_desc->typec_ports[port_num];
> > +     port_data->data = data;
> > +     mux_desc.fwnode = &node->fwnode;
> > +     mux_desc.drvdata = port_data;
> > +     snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
> > +     mux_desc.name = name;
> > +     mux_desc.set = mux_set;
> > +
> > +     port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> > +     if (IS_ERR(port_data->typec_mux)) {
> > +             ret = PTR_ERR(port_data->typec_mux);
> > +             dev_err(dev, "Mode switch register for port %d failed: %d\n",
> > +                     port_num, ret);
> > +
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * drm_dp_register_typec_switches() - register Type-C switches
> > + * @dev: Device that registers Type-C switches
> > + * @port: Device node for the switch
> > + * @switch_desc: A Type-C switch descriptor
> > + * @data: Private data for the switches
> > + * @mux_set: Callback function for typec_mux_set
> > + *
> > + * This function registers USB Type-C switches for DP bridges that can switch
> > + * the output signal between their output pins.
> > + *
> > + * Currently only mode switches are implemented, and the function assumes the
> > + * given @port device node has endpoints with "mode-switch" property.
> > + * Register the endpoint as port 0 if the "data-lanes" property falls in 0/1,
> > + * and register it as port 1 if "data-lanes" falls in 2/3.
> > + */
> > +int drm_dp_register_typec_switches(struct device *dev, struct device_node *port,
> > +                                struct drm_dp_typec_switch_desc *switch_desc,
> > +                                void *data, typec_mux_set_fn_t mux_set)
> > +{
> > +     struct device_node *sw;
> > +     int ret;
> > +
> > +     for_each_child_of_node(port, sw) {
> > +             if (of_property_read_bool(sw, "mode-switch"))
> > +                     switch_desc->num_typec_switches++;
> > +     }
> > +
> > +     if (!switch_desc->num_typec_switches) {
> > +             dev_dbg(dev, "No Type-C switches node found\n");
> > +             return 0;
> > +     }
> > +
> > +     switch_desc->typec_ports = devm_kcalloc(
> > +             dev, switch_desc->num_typec_switches,
> > +             sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
> > +
> > +     if (!switch_desc->typec_ports)
> > +             return -ENOMEM;
> > +
> > +     /* Register switches for each connector. */
> > +     for_each_child_of_node(port, sw) {
> > +             if (!of_property_read_bool(sw, "mode-switch"))
> > +                     continue;
> > +             ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
> > +             if (ret)
> > +                     goto err_unregister_typec_switches;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_unregister_typec_switches:
> > +     of_node_put(sw);
> > +     drm_dp_unregister_typec_switches(switch_desc);
> > +     dev_err(dev, "Failed to register mode switch: %d\n", ret);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(drm_dp_register_typec_switches);
> > +
> > +/**
> > + * drm_dp_unregister_typec_switches() - unregister Type-C switches
> > + * @switch_desc: A Type-C switch descriptor
> > + */
> > +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
> > +{
> > +     int i;
> > +
> > +     for (i = 0; i < switch_desc->num_typec_switches; i++)
> > +             typec_mux_unregister(switch_desc->typec_ports[i].typec_mux);
> > +}
> > +EXPORT_SYMBOL(drm_dp_unregister_typec_switches);
> > +#else
> > +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
> > +{
> > +}
> > +EXPORT_SYMBOL(drm_dp_register_typec_switches);
> > +int drm_dp_register_typec_switches(struct device *dev, struct device_node *port,
> > +                                struct drm_dp_typec_switch_desc *switch_desc,
> > +                                void *data, typec_mux_set_fn_t mux_set)
> > +{
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_unregister_typec_switches);
> > +#endif
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index ab55453f2d2c..5a3824f13b4e 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -25,6 +25,7 @@
> >
> >   #include <linux/delay.h>
> >   #include <linux/i2c.h>
> > +#include <linux/usb/typec_mux.h>
> >
> >   #include <drm/display/drm_dp.h>
> >   #include <drm/drm_connector.h>
> > @@ -763,4 +764,20 @@ bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8 dpcd[DP_RECEIVER_CAP_SIZ
> >                                              const u8 port_cap[4], u8 color_spc);
> >   int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
> >
> > +struct drm_dp_typec_port_data {
> > +     struct typec_mux_dev *typec_mux;
> > +     void *data;
> > +     bool dp_connected;
> > +};
> > +
> > +struct drm_dp_typec_switch_desc {
> > +     int num_typec_switches;
> > +     struct drm_dp_typec_port_data *typec_ports;
> > +};
> > +
> > +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc);
> > +int drm_dp_register_typec_switches(struct device *dev, struct device_node *port,
> > +                                struct drm_dp_typec_switch_desc *switch_desc,
> > +                                void *data, typec_mux_set_fn_t mux_set);
> > +
> >   #endif /* _DRM_DP_HELPER_H_ */
>
> --
> With best wishes
> Dmitry
>

Best regards,
Pin-yen
