Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C541F627
	for <chrome-platform@lists.linux.dev>; Thu,  9 Feb 2023 04:28:45 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id z2so408632ilq.2
        for <chrome-platform@lists.linux.dev>; Wed, 08 Feb 2023 20:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bescMjn7FtyPXif9z42K5Kti4WQibJgEOUCofteOlbU=;
        b=efbpqpZ8ruVdXCPyxPr8jDefM3U8oaOj3EXWBJQevNTETQvcO2dE/qtmWax943hsRR
         hXvF9OSBw1p+PC27CXPrMC2rOofIy441d7jZSKzpR3sOkGqwzMVORaVIxNJkydQm7TzH
         8ViDfzFimT4EAz6hz5X1Yn6/9z/6vbonm+MDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bescMjn7FtyPXif9z42K5Kti4WQibJgEOUCofteOlbU=;
        b=0hkZqiyhBwQelQTz273RUaLkTWbaRpaMtxOKGf4OPW5JpZg/r7h5TKFszdiKEmIWce
         3cDqeftYXkROXtPVXy6T/V4VeSwmJWuUpdHVfF+iyUlrnVSvfqFt8lkMkAQ6T2N0REcf
         oAPNCD60HJLzRJWjmN026CRSsU8NMYJTuzB/XhoTQfcD2XmvnEbDY7QL+dYpezTzFNFY
         PwFBXPHs2SyD2pyOOouVxlumtHRIihqoz6eY5uJP1S2vKorNf5KwZR4hQUNKA9axAJER
         Vm52DRzZrMy3RAB8O4nFTLdfT/p20xdlAjtPp6sXQdh+2Jhxabnm0W+eAyqEIfphNpPp
         tY6w==
X-Gm-Message-State: AO0yUKUw3zA21bWaMOSqD175ur92VKCVnQz80qNZOQasjF5zX0fG+X/3
	9UciXDZ3LM/1Gu3VqYtSgKyOzPmLe8XTUZ/rJfeeTQ==
X-Google-Smtp-Source: AK7set+YCKJbelSZgHy/neopyqons0VAhG7SjB9chuOXUmdoUIbOQBP9AdNx/HVfzI+OikZm7IrbjJahfEHqdtFqiQw=
X-Received: by 2002:a92:4412:0:b0:310:fd95:6d81 with SMTP id
 r18-20020a924412000000b00310fd956d81mr5201921ila.42.1675916924769; Wed, 08
 Feb 2023 20:28:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-2-treapking@chromium.org> <Y+AbhnfJvScvHTGY@kekkonen.localdomain>
In-Reply-To: <Y+AbhnfJvScvHTGY@kekkonen.localdomain>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 9 Feb 2023 12:28:33 +0800
Message-ID: <CAEXTbpf-s8NQKwSxhe=cO-KO=TTSXFznm=1J-ikhc558M6brdQ@mail.gmail.com>
Subject: Re: [PATCH v11 1/9] device property: Add remote endpoint to devcon matcher
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, devicetree@vger.kernel.org, 
	Allen Chen <allen.chen@ite.com.tw>, Lyude Paul <lyude@redhat.com>, linux-acpi@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>, 
	Xin Ji <xji@analogixsemi.com>, Stephen Boyd <swboyd@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	chrome-platform@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

Thanks for the review.

On Mon, Feb 6, 2023 at 5:11 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Pin-yen,
>
> On Sat, Feb 04, 2023 at 09:30:32PM +0800, Pin-yen Lin wrote:
> > From: Prashant Malani <pmalani@chromium.org>
> >
> > When searching the device graph for device matches, check the
> > remote-endpoint itself for a match.
> >
> > Some drivers register devices for individual endpoints. This allows
> > the matcher code to evaluate those for a match too, instead
> > of only looking at the remote parent devices. This is required when a
> > device supports two mode switches in its endpoints, so we can't simply
> > register the mode switch with the parent node.
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Thanks for the update.
>
> I intended to give my Reviewed-by: but there's something still needs to be
> addressed. See below.
>
> >
> > ---
> >
> > Changes in v11:
> > - Added missing fwnode_handle_put in drivers/base/property.c
> >
> > Changes in v10:
> > - Collected Reviewed-by and Tested-by tags
> >
> > Changes in v6:
> > - New in v6
> >
> >  drivers/base/property.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/base/property.c b/drivers/base/property.c
> > index 2a5a37fcd998..e6f915b72eb7 100644
> > --- a/drivers/base/property.c
> > +++ b/drivers/base/property.c
> > @@ -1223,6 +1223,22 @@ static unsigned int fwnode_graph_devcon_matches(struct fwnode_handle *fwnode,
> >                       break;
> >               }
> >
> > +             /*
> > +              * Some drivers may register devices for endpoints. Check
> > +              * the remote-endpoints for matches in addition to the remote
> > +              * port parent.
> > +              */
> > +             node = fwnode_graph_get_remote_endpoint(ep);
>
> Here fwnode_graph_get_remote_endpoint() returns an endpoint...
>
> > +             if (fwnode_device_is_available(node)) {
>
> and you're calling fwnode_device_is_available() on the endpoint node, which
> always returns true.
>
> Shouldn't you call this on the device node instead? What about match()
> below?

Yes we should have checked the availability on the device node itself
instead of the endpoint node. But regarding the match() call, we need
to call it with the endpoint node because that's where we put the
"mode-switch" properties and register the mode switches on. We can't
use the device node because we want to register two mode switches for
the same device node.

Regards,
Pin-yen
>
> > +                     ret = match(node, con_id, data);
> > +                     if (ret) {
> > +                             if (matches)
> > +                                     matches[count] = ret;
> > +                             count++;
> > +                     }
> > +             }
> > +             fwnode_handle_put(node);
> > +
> >               node = fwnode_graph_get_remote_port_parent(ep);
> >               if (!fwnode_device_is_available(node)) {
> >                       fwnode_handle_put(node);
>
> --
> Kind regards,
>
> Sakari Ailus
