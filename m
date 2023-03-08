Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D796D2577
	for <chrome-platform@lists.linux.dev>; Wed,  8 Mar 2023 10:20:25 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id t129so6570024iof.12
        for <chrome-platform@lists.linux.dev>; Wed, 08 Mar 2023 02:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678270825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdSzeNIXMw8vmjUPC/E7bBOx6FxLxfwio06gT5xhe28=;
        b=jQ4jJaOiICqMicJiBXhI5oM9sUTb8IINUcqEvhN/8M+cKUK0JFV9UtHbA/p27b+rQz
         /rJs32ad1N0HnlpzPknEpjE1d5e2iz8ebGsaveUiDxGpSxFhqvr6hNTJNPjUQk1q6YJ6
         uH61wIlAh1Qh/0ONQp43Gl1w4PoJCcm7aTtKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678270825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdSzeNIXMw8vmjUPC/E7bBOx6FxLxfwio06gT5xhe28=;
        b=G+WSt4cltYckcSRxIzbAsRU3io4tK1pV4t68TGYR4UrZrjBn1v74lcZ3ZzL4L8l4W/
         laLusbyiDUD2sq0uIH6SR7HtIK2M3VqBglbAb2diicJj/h5GnsEXlyxyjXP1seyoew6m
         UwWkTh0UfV/BIjqui2KgBhJFdC4tnqepj1EdaKeRvvxMW7+tzC7OMyy831qVz/26SM+X
         GCwAWYc5pD0L4VjZJVpfh8EaAj2Wmxw5EMG8chGPxk0xWOjEgfQSX+jOIeOXRzJRuNIj
         qikDQnM4nVeqlFgPcS1mWjKBUX47/qZhUB+f5dPoHqZsI4flIONihDwHZ7L3IAVOuVYN
         0yQw==
X-Gm-Message-State: AO0yUKVeKmWVRaeuiJ6CR6yX959XmLM4FONAoR6vB1m4Lv5XR4n2XU3E
	mDgOOyrPesMG3bhhWj7j6702WBgPpYiHd7EhaJi9pA==
X-Google-Smtp-Source: AK7set+wtPxm/KF3XOtr2thou1wVTrVhlmiYRK/vO3RW2gqzmVrHuxLZsTxaCjvY+jvT/MTnCMZjjYobOos9Nu3v0YM=
X-Received: by 2002:a02:7310:0:b0:3ca:61cc:4bbc with SMTP id
 y16-20020a027310000000b003ca61cc4bbcmr8866771jab.2.1678270824932; Wed, 08 Mar
 2023 02:20:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-4-treapking@chromium.org> <ZAXTVCAQpHvSj+6C@smile.fi.intel.com>
In-Reply-To: <ZAXTVCAQpHvSj+6C@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 8 Mar 2023 18:20:14 +0800
Message-ID: <CAEXTbpf4zM+70BCef6rdfz35TQnQ+ozaXAvOaEZVnqqe6MDOOg@mail.gmail.com>
Subject: Re: [PATCH v13 03/10] drm/display: Add Type-C switch helpers
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
	Alex Deucher <alexander.deucher@amd.com>, Douglas Anderson <dianders@chromium.org>, 
	Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thanks for the review.

On Mon, Mar 6, 2023 at 7:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 03, 2023 at 10:33:43PM +0800, Pin-yen Lin wrote:
> > Add helpers to register and unregister Type-C "switches" for bridges
> > capable of switching their output between two downstream devices.
> >
> > The helper registers USB Type-C mode switches when the "mode-switch"
> > and the "reg" properties are available in Device Tree.
>
> ...
>
> > +     port_data->typec_mux =3D typec_mux_register(dev, &mux_desc);
> > +     if (IS_ERR(port_data->typec_mux)) {
> > +             ret =3D PTR_ERR(port_data->typec_mux);
> > +             dev_err(dev, "Mode switch register for port %d failed: %d=
\n",
> > +                     port_num, ret);
>
> > +             return ret;
> > +     }
> > +
> > +     return 0;
>
> Can be simply
>
>         port_data->typec_mux =3D typec_mux_register(dev, &mux_desc);
>         ret =3D PTR_ERR_OR_ZERO(port_data->typec_mux);
>         if (ret)
>                 dev_err(dev, "Mode switch register for port %d failed: %d=
\n",
>                         port_num, ret);
>
>         return ret;
>
This was suggested by Angelo in [1], but you are not the first
reviewer that finds this weird... I'll update this in the next
version.

[1]: https://lore.kernel.org/all/023519eb-0adb-3b08-71b9-afb92a6cceaf@colla=
bora.com/

> ...
>
> > +     switch_desc->typec_ports =3D devm_kcalloc(dev, switch_desc->num_t=
ypec_switches,
> > +                                             sizeof(struct drm_dp_type=
c_port_data),
> > +                                             GFP_KERNEL);
> > +     if (!switch_desc->typec_ports)
> > +             return -ENOMEM;
>
> How often this function _can_ be called during the runtime?
> If it's _possible_ to call it infinite times, consider *not* using devm.

I would expect this function to be only called during driver probing,
and this is the case for the current users in this series. So I think
this is only called once if EPROBDE_DEFER doesn't count.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Best regards,
Pin-yen
