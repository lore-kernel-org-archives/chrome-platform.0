Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDC7321E
	for <chrome-platform@lists.linux.dev>; Wed,  8 Mar 2023 10:25:12 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id v10so6582057iox.8
        for <chrome-platform@lists.linux.dev>; Wed, 08 Mar 2023 02:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678271111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vk4eRG0LrzbHDKK00dsD4iBuyY/4ZAQyp3TpAqYJX3Q=;
        b=EftcY01/oCV/raNvODG0Gy7CAtfgmEemBydzNyAQ/5Z8JDAjqoXLq8pFoIQpGEcWYn
         nu75sxupN/sQVT1eTmTNkYDC4NGXFqPitKQCL4odiDhzr0iZEhGrzCytxWkP57LBugz1
         ovgS6RvevaA0mF6dPaeC7GeF5zW7+oi9/DjqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vk4eRG0LrzbHDKK00dsD4iBuyY/4ZAQyp3TpAqYJX3Q=;
        b=PpLJ7Ccjg1eOf9OdFbSOHQWFu+L0R+dqYQQKj7PZWM2qe5w3pSQ0Xy77oo0E3sR8yx
         iFlI1SgOfHGqJ5hxj1H0HkfqPCStunBv+6URH2w3jo7x3MA/YRw9llDa8DLW2ytIM6Gu
         JDhijOv0x7Gyvs1xPR+sRM8aEyTRkcxINj8bvFt4u7upHpmzBGfGrFPtV5SbTLtWh+ft
         eO3vTVUrfgAkIhUJhj2ZPhfMiUTuUGTs6zg4EINWjBf/lq6OJFUCTQA2LZ4p87R/EBpJ
         tGpwVjNHIfZT/3himuhJvhw6Xoaf7iWE2ANEVqU6i/OUzTPybL2FWOGvZXgrj5CcElJb
         Ylwg==
X-Gm-Message-State: AO0yUKXjkNCx/9mah2k6hcK7SxRD4/AjR3AQ61wIZeR92oiYZ0q9GFvT
	G0NN5AofPm9kNaQE3MbewXYhd42/s2XudpoAZkaX9w==
X-Google-Smtp-Source: AK7set+QhdrKShMQqdGse4Hq6359ifcnSCbtiqiWfe6LuBFF3HsmSOEUtWdcF89t709UweFPbwi9ZG1akiBqjkVk2co=
X-Received: by 2002:a05:6602:154:b0:74c:8243:9290 with SMTP id
 v20-20020a056602015400b0074c82439290mr8204213iot.4.1678271111488; Wed, 08 Mar
 2023 02:25:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-6-treapking@chromium.org> <ZAXT0JFjERb8Q36f@smile.fi.intel.com>
In-Reply-To: <ZAXT0JFjERb8Q36f@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 8 Mar 2023 18:25:00 +0800
Message-ID: <CAEXTbpecGhEDrffDobb4NgLw8+vMK2_yVmJw8JGUDruTALm4-w@mail.gmail.com>
Subject: Re: [PATCH v13 05/10] drm/bridge: anx7625: Check for Type-C during
 panel registration
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
	Guenter Roeck <groeck@chromium.org>, Xin Ji <xji@analogixsemi.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Marek Vasut <marex@denx.de>, Hsin-Yi Wang <hsinyi@chromium.org>, devicetree@vger.kernel.org, 
	Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <swboyd@chromium.org>, linux-acpi@vger.kernel.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Andy,

On Mon, Mar 6, 2023 at 7:52=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 03, 2023 at 10:33:45PM +0800, Pin-yen Lin wrote:
> > The output port endpoints can be connected to USB-C connectors.
> > Running drm_of_find_panel_or_bridge() with such endpoints leads to
> > a continuous return value of -EPROBE_DEFER, even though there is
> > no panel present.
> >
> > To avoid this, check for the existence of a "mode-switch" property in
> > the port endpoint, and skip panel registration completely if so.
>
> ...
>
> > +     port_node =3D of_graph_get_port_by_id(np, 1);
> > +     count =3D typec_mode_switch_node_count(&port_node->fwnode);
>
> Do you need to drop reference count here?
> (I don't know myself, so, please check this)
>
> If no, patch LGTM.

The helper completes the for-loop of fwnode_for_each_child_node, which
drops the reference count whenever the next node is get. So we don't
need drop the reference count here.
>
> > +     if (count)
> > +             return 0;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Best regards,
Pin-yen
