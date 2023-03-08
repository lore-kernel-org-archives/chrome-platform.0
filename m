Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F82C6D38
	for <chrome-platform@lists.linux.dev>; Wed,  8 Mar 2023 13:51:31 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id b16so6772249iof.11
        for <chrome-platform@lists.linux.dev>; Wed, 08 Mar 2023 05:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678283490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2ScB8i7PrG39DRTErC7kF+bBBVGcw9XNhNSA0VqouI=;
        b=imkqhCCosUh66ifIsRQPbANxZXdmJpEwCj2rF7iSVxboMb7R9EE2AFrdMjLL16Y/Kw
         ooGlAR2bIPsm2FI/6N4VeIN+MSDg7j79K5/3wNTcuCOl8Gx8dM0twquGzlpwCcPl1klq
         NicNIX+rKLK1R+g/ECbCTeA/17uvvBo5G2SJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678283490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2ScB8i7PrG39DRTErC7kF+bBBVGcw9XNhNSA0VqouI=;
        b=V76mRllz5DzFdNGqLyuV5Hv2uMnRjd9hzkB+JHAc8S2yhfHYDKj1KVb1+7FtOjTyCi
         QVaSHRBdrpHAoVsBf117hYrZ5NwGPM9Ffodgbqxsj/xtiy/Bcqad595lqmtFoYjawpC/
         cm2wf4XSi54uevsrrLjthobPnmS1zTlK7kovictrq2/vhsqxiAvKEJR0fpT7C5bO2IbQ
         ug8f1Qnz1CAHwTq492JayeQGnWcVkoNwsMtwMQOBWngG1HfEbqbmPI58uwqpSFhiSghI
         64Hun+dG4z9qk8SITRkOAxQjQ0ilE4Az60W3H6tROyBJ0zF2rXv2odjvDz6LUlO/MN1P
         QQtw==
X-Gm-Message-State: AO0yUKXKkhJ0Zl/dpfrZVQreZkdnJ88/OOmXwtQBTksEV1evehM9uxrn
	lDvlAxj8wKnOrM9A6Lxzm4m8g1Fim96Lt64Y8zNgCw==
X-Google-Smtp-Source: AK7set8VM1H7ES454XkYoww9M66+Aop3lkGBIArzYN2bvLHb4IHDHyckUz3PiQcAOs/tKbPekPyLMzsgcHMc8Vkk8wo=
X-Received: by 2002:a6b:dc0c:0:b0:743:5fb0:2ca8 with SMTP id
 s12-20020a6bdc0c000000b007435fb02ca8mr8414193ioc.4.1678283490142; Wed, 08 Mar
 2023 05:51:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-11-treapking@chromium.org> <ZAXWbkq4oLfrWUR7@smile.fi.intel.com>
In-Reply-To: <ZAXWbkq4oLfrWUR7@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 8 Mar 2023 21:51:19 +0800
Message-ID: <CAEXTbpe=e1iA7cnzuTtcsyFxpG37YCWSK_SqZb2A8hxcyCnJBg@mail.gmail.com>
Subject: Re: [PATCH v13 10/10] drm/bridge: it6505: Register Type C mode switches
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
	Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <swboyd@chromium.org>, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thanks for the review.

On Mon, Mar 6, 2023 at 8:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 03, 2023 at 10:33:50PM +0800, Pin-yen Lin wrote:
> > Register USB Type-C mode switches when the "mode-switch" property and
> > relevant port are available in Device Tree. Configure the "lane_swap"
> > state based on the entered alternate mode for a specific Type-C
> > connector, which ends up updating the lane swap registers of the it6505
> > chip.
>
> ...
>
> > +     it6505->port_data =3D devm_kcalloc(dev, switch_desc->num_typec_sw=
itches,
> > +                                      sizeof(struct it6505_typec_port_=
data),
> > +                                      GFP_KERNEL);
>
> > +
>
> Same, no need for a blank line here.
>
I'll fix this in the next version.
> > +     if (!it6505->port_data) {
> > +             ret =3D -ENOMEM;
> > +             goto unregister_mux;
> > +     }
>
> ...
>
> > +             it6505->port_data[i].lane_swap =3D (dp_lanes[0] / 2 =3D=
=3D 1);
>
> ' % 2 =3D=3D 0' ?
>
Per another patch, I'll update this into `< 2`
> ...
>
> Wouldn't be better to have
>
>         ret =3D PTR_ERR_OR_ZERO(extcon);
>
> here and amend the following accordingly?
>
> >       if (PTR_ERR(extcon) =3D=3D -EPROBE_DEFER)
> >               return -EPROBE_DEFER;
> >       if (IS_ERR(extcon)) {
> > -             dev_err(dev, "can not get extcon device!");
> > -             return PTR_ERR(extcon);
> > +             if (PTR_ERR(extcon) !=3D -ENODEV)
> > +                     dev_warn(dev, "Cannot get extcon device: %ld\n",
> > +                              PTR_ERR(extcon));
> > +             it6505->extcon =3D NULL;
> > +     } else {
> > +             it6505->extcon =3D extcon;
> >       }
> >
> > -     it6505->extcon =3D extcon;
> > +     init_completion(&it6505->mux_register);
> > +     ret =3D it6505_register_typec_switches(dev, it6505);
> > +     if (ret) {
> > +             if (ret !=3D -ENODEV)
> > +                     dev_warn(dev, "Didn't register Type-C switches, e=
rr: %d\n",
> > +                              ret);
> > +             if (!it6505->extcon) {
> > +                     dev_err(dev, "Both extcon and typec-switch are no=
t registered.\n");
> > +                     return -EINVAL;
> > +             }
> > +     }
>
>
> Perhaps
>
>         if (ret !=3D -ENODEV)
>                 dev_warn(dev, "Didn't register Type-C switches, err: %d\n=
", ret);
>
>         if (ret && !it6505->extcon) {
>                 dev_err(dev, "Both extcon and typec-switch are not regist=
ered.\n");
>                 return ret;
>         }
>
> ?


Thanks for the suggestion! I'll update this in v14.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
Best regards,
Pin-yen
