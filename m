Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6257B17C6
	for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 05:52:49 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id m19so3760102edj.8
        for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 21:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RzN4h3qOAvIsS9Ytm8ViCV9LTXDRNYxBOrbT9kwa+z4=;
        b=oEaPYaoWVwjCvCRl0HhYzkfATCZulKO7O6FroIlJirLXfGB0mUMNQ1vzzo0lRHG88h
         cNaSmIx/Wju99aMFImQwYB8ffU35MFqJyO6o81ePWIivDyODyXWsv9bQogJMB23kCZrX
         ZuFBm7OSJUcNIYbcpI9E72DmIeVVa15mZVqnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzN4h3qOAvIsS9Ytm8ViCV9LTXDRNYxBOrbT9kwa+z4=;
        b=OvTmVcoumrxE+7pRi853qgInLf2JESONO4ReEUJe5KRXukKCLAAK7OBMBHEpS8CWMl
         8XknDM4l1tkrzd4bwJFJOiemoQZIGoP02C1Q4hvHEifzo0bUGFHCGXtQ5fPkLz2XEAJu
         FAR9ippmMy6VX7wS9ch9Nw++mL2TLYYhmQhECevGHrlKJnJ/sGBJ59J90SqEanfv4Ger
         prX9D14wMAB89fdO+1ioij8ctxAaw5BtPjF2RwfvH/aQZHxXI19mRuPLbjutkfu+goAg
         Yivc0q4R87EjOknYaRNiEZv03cE5eHO6Z2HBhMjfD6Tg8jj86tn2eBRqqRDCEmruI/ug
         PyKw==
X-Gm-Message-State: ANoB5pmaUVyCqF8GV3FXxFI0AzWmRCbZSl4D/Y3o8oszV8CPU1RKr1ON
	kkCQvgCqL3wkWiJHK+qsAJR/hfwnE6eK4Wy+I9cNaQ==
X-Google-Smtp-Source: AA0mqf4swfPzjKVkl1scJTqiUbIDnuAEsouyb52592fG1trV+h5bVVpbQlj0dZBKZjpXqLgzGBJ89YmbylZKTLb1eqs=
X-Received: by 2002:a05:6402:1397:b0:467:78f2:d81f with SMTP id
 b23-20020a056402139700b0046778f2d81fmr16227783edv.88.1669355567575; Thu, 24
 Nov 2022 21:52:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-3-treapking@chromium.org> <Y39ikbcqx5/pEc64@smile.fi.intel.com>
In-Reply-To: <Y39ikbcqx5/pEc64@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 25 Nov 2022 13:52:36 +0800
Message-ID: <CAEXTbpcbQEyYfuCssENiFQxwe3t11HtHnpJHgjq+=GziNfUk-g@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] platform/chrome: cros_ec_typec: Purge blocking
 switch devlinks
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

On Thu, Nov 24, 2022 at 8:25 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 24, 2022 at 06:20:51PM +0800, Pin-yen Lin wrote:
> > From: Prashant Malani <pmalani@chromium.org>
> >
> > When using OF graph, the fw_devlink code will create links between the
> > individual port driver (cros-ec-typec here) and the parent device for
> > a Type-C switch (like mode-switch). Since the mode-switch will in turn
> > have the usb-c-connector (i.e the child of the port driver) as a
> > supplier, fw_devlink will not be able to resolve the cyclic dependency
> > correctly.
> >
> > As a result, the mode-switch driver probe() never runs, so mode-switches
> > are never registered. Because of that, the port driver probe constantly
> > fails with -EPROBE_DEFER, because the Type-C connector class requires all
> > switch devices to be registered prior to port registration.
> >
> > To break this deadlock and allow the mode-switch registration to occur,
> > purge all the usb-c-connector nodes' absent suppliers. This eliminates
> > the connector as a supplier for a switch and allows it to be probed.
>
> ...
>
> > +     /*
> > +      * OF graph may have set up some device links with switches, since connectors have their
> > +      * own compatible. Purge these to avoid a deadlock in switch probe (the switch mistakenly
> > +      * assumes the connector is a supplier).
> > +      */
>
> A bit too long lines...

I'll fix this in v7.

>
> > +     if (dev->of_node)
>
> Why do you need this check?

We use this check to make sure only platforms using OF have their
links purged. I'm not sure if this should also be done on x86
platforms.

Best regards,
Pin-yen

>
> > +             device_for_each_child_node(dev, fwnode)
> > +                     fw_devlink_purge_absent_suppliers(fwnode);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
