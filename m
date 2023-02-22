Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19B1FD2
	for <chrome-platform@lists.linux.dev>; Wed, 22 Feb 2023 08:53:53 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id d11so2872679iow.0
        for <chrome-platform@lists.linux.dev>; Wed, 22 Feb 2023 00:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WhYDKiCMl5Zg3kFJ82aJeKZFheHJkDNcW1JK/FBeLIU=;
        b=S46TMnd79hmJMjHu6YHoyiQ+If7OYb6jqppE2/V2/h32wVWi6nWdac/dC+ud2JAX82
         ngXeec568GkKEt7Pym7Jw3Ur53NqHZxEiqsqSgImaIuxbIIedIDCislExEzkuJ8FGR8w
         BLGw0ITffNiuHi9XD817RG27FpP7nMDzxmEb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhYDKiCMl5Zg3kFJ82aJeKZFheHJkDNcW1JK/FBeLIU=;
        b=cfEttAaa6PQ4t7DuWZc5QPju2uvR1nfWPsP61hHmpSgs5oZRz+/urb0lz1DG5ek7MD
         GSNQEMry0h84sUtvKrHrI8y34niIrRDq9CRiHSRqOhCMghTJ3DafucGEozhPg8Hq9nLS
         PVkC0gBC7mJwg7T7v60lihTyvGbzIlLinX8LAjKGYhU647Csk0ph5Ud7Dje8YFMcqlq2
         lB6rmMDT+NcekXIzXrXzksvjW1QJwQ2XXlL6OGh4bnCMpNhm5N0JrEZern1FYbXOU3ad
         /b4Wf1BmCyckAcaNQZMEL5vtsplWcu6b+9OJMykdCpl+0u6xHGwciAhtLKwCuUjBZNOU
         sxVQ==
X-Gm-Message-State: AO0yUKXkt7oFIAi/xzagukkTLuHZtqyF0CcfHxpEMVj1kx6dG+yp9kaQ
	ypAkRw3wXlqSGA8j1fIv0f7brM/8WXHGzLVA33lz8w==
X-Google-Smtp-Source: AK7set95UIcEr36Pn+YUoHAt17RL/o3ns/Gdh3WG/t/+JidyKPagtbyfa6npb7tZMS4Qzo8ChxlIppfGbWczTO72XBY=
X-Received: by 2002:a5d:80da:0:b0:71a:5a1f:544c with SMTP id
 h26-20020a5d80da000000b0071a5a1f544cmr4867722ior.5.1677056033042; Wed, 22 Feb
 2023 00:53:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230221095054.1868277-1-treapking@chromium.org>
 <20230221095054.1868277-4-treapking@chromium.org> <Y/SvhxgjTM2cYZa+@smile.fi.intel.com>
In-Reply-To: <Y/SvhxgjTM2cYZa+@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 22 Feb 2023 16:53:41 +0800
Message-ID: <CAEXTbpcOA06Cf-niurjM4_3Rx6xa9Pi+fuJHUQCKmwaJL2ibmA@mail.gmail.com>
Subject: Re: [PATCH v12 03/10] drm/display: Add Type-C switch helpers
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
	Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Imre Deak <imre.deak@intel.com>, 
	Jani Nikula <jani.nikula@intel.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for the review.

On Tue, Feb 21, 2023 at 7:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Feb 21, 2023 at 05:50:47PM +0800, Pin-yen Lin wrote:
> > Add helpers to register and unregister Type-C "switches" for bridges
> > capable of switching their output between two downstream devices.
> >
> > The helper registers USB Type-C mode switches when the "mode-switch"
> > and the "reg" properties are available in Device Tree.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ...
>
> > +     fwnode_for_each_typec_mode_switch(port, sw)
> > +             switch_desc->num_typec_switches++;
> > +
> > +     if (!switch_desc->num_typec_switches) {
> > +             dev_dbg(dev, "No Type-C switches node found\n");
> > +             return 0;
> > +     }
>
> What about
>
> static inline unsigned int typec_mode_switch_node_count(... *port)
> {
>         ... *sw;
>         unsigned int count = 0;
>
>         for_each_typec_mode_switch_node(port, sw)
>                 count++;
>
>         return count;
> }
>
>
> And then it seems something like
>
>         unsigned int count;
>
>         count = typec_mode_switch_node_count(port);
>         if (!count) {
>                 ...
>         }
>
>         _switches = count;
>
> ...
>
> > +     switch_desc->typec_ports = devm_kcalloc(
> > +             dev, switch_desc->num_typec_switches,
>
> Strange indentation.
>
> > +             sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
>
> > +
>
> Redundant blank line.
>
> > +     if (!switch_desc->typec_ports)
> > +             return -ENOMEM;
>
> ...
>
> > +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
> > +{
> > +     int i;
>
> unsigned?
>
> > +     for (i = 0; i < switch_desc->num_typec_switches; i++)
> > +             typec_mux_unregister(switch_desc->typec_ports[i].typec_mux);
> > +}
>
> ...
>
> >  #include <linux/delay.h>
> >  #include <linux/i2c.h>
> > +#include <linux/usb/typec_mux.h>
>
> I don't see users of this.
> But a few forward declarations are missing.

I can put a `struct typec_mux_dev;` here, but there is also a usage of
typec_mux_set_fn_t.

Should I add the typedef into this header file as well?

Regards,
Pin-yen
>
> >  #include <drm/display/drm_dp.h>
> >  #include <drm/drm_connector.h>
>
> ...
>
> > +#define fwnode_for_each_typec_mode_switch(port, sw)  \
> > +     fwnode_for_each_child_node((port), (sw))        \
> > +             for_each_if(fwnode_property_present((sw), "mode-switch"))
>
> Please don't use fwnode namespace (see above), something like
>
> #define for_each_typec_mode_switch_node(port, sw)       \
>         ...
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
