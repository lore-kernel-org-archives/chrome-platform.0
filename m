Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06E86D19
	for <chrome-platform@lists.linux.dev>; Wed,  8 Mar 2023 13:45:10 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id m22so6783477ioy.4
        for <chrome-platform@lists.linux.dev>; Wed, 08 Mar 2023 05:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678283110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Gz/Fal0kRuGQs4te+QLHZr2SvmaC9a9yoIN2O4rmEs=;
        b=FzOehmgGzILhkooEFO0biilFd7kiTA0NZcKrhcfEw83BGlvb/DRX3HApX0gd0asQu+
         zXYldxA3v4VRudBB014jDadWTIgo79RaVquXI8m+ip2DXj5WS98GeAQOpgEvrX+7tpbU
         SWqY8TrecDN3LvK2tWghCzQbSw+b/IEJKg1ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678283110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Gz/Fal0kRuGQs4te+QLHZr2SvmaC9a9yoIN2O4rmEs=;
        b=IOuC8vfm69D5chcEd+peWT/s9iou7Uje33VLXnRO++nvlowUjvzQk7FmPfoZRr4u2a
         SlMRq8Iye1gH3IaMpVRVmrzOSFE1aPd9y49Es9CSNksr2WJSZ7QHu6XdnVc39nFtP1Wz
         ZtE3GykAtHbsl2nOXE8w0Kh9tfveyi4ZnQcFduyNyCQKi3MDv02PyHAT1SjPGjjuJsrL
         2XAEe+fNFgpcSeMEZ6AFogH/gE8oaljEq/lXDmmnXhMot2wjjaZXNiRO1cM74Uyt7b3F
         RI/AvcKdmkhirDwq+s5ESwjZZM04Kl9YbLq9HgzBxdbifXG4bzSFFCreiXCYp8m61O13
         7Nuw==
X-Gm-Message-State: AO0yUKW0UnlUOhgt4fTCYRg8ksHnJwGOl8zL8rmZq+EEN8fgG3S4GfOI
	tgN+Qo5577CfAz0b5CgXb9ofHvt3+Ks/TqXF3S4vIQ==
X-Google-Smtp-Source: AK7set9vEwKu1Idu63ibGwE2iFEiZ7o1hncWOqoEWkYY6ycvzgr26jaWtmtsgD0Zy8mBVQpsXMl2fE6U84RedlItoHs=
X-Received: by 2002:a05:6602:4287:b0:745:50e5:c861 with SMTP id
 cd7-20020a056602428700b0074550e5c861mr8454903iob.4.1678283109499; Wed, 08 Mar
 2023 05:45:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-8-treapking@chromium.org> <ZAXUrJDtHmm7+50H@smile.fi.intel.com>
In-Reply-To: <ZAXUrJDtHmm7+50H@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 8 Mar 2023 21:44:58 +0800
Message-ID: <CAEXTbpftCVFBQK0bNiWvF0NnbNoMoF=dFStHy1HXOq8LvWYjsA@mail.gmail.com>
Subject: Re: [PATCH v13 07/10] drm/bridge: anx7625: Register Type C mode switches
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

On Mon, Mar 6, 2023 at 7:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 03, 2023 at 10:33:47PM +0800, Pin-yen Lin wrote:
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
> > +     ctx->port_data =3D devm_kcalloc(
> > +             dev, switch_desc->num_typec_switches,
> > +             sizeof(struct anx7625_typec_port_data), GFP_KERNEL);
>
> I believe I have commented on this (indentation)...
>
> > +
>
> ...and this (blank line).

Sorry for missing this one. I'll fix this in v14.
>
> > +     if (!ctx->port_data) {
> > +             ret =3D -ENOMEM;
> > +             goto unregister_mux;
> > +     }
>
> ...
>
> > +             ctx->port_data[i].orientation =3D (dp_lanes[0] / 2 =3D=3D=
 0) ?
> > +                     TYPEC_ORIENTATION_REVERSE : TYPEC_ORIENTATION_NOR=
MAL;
>
> I believe that this is an error prone check, you should rather do the opp=
osite,
> i.e.  ' % 2  =3D=3D 0'.
>
The orientation should be TYPEC_ORIENTATION_REVERSE when the
data-lanes value is 0/1, so ` / 2` is what I meant here.

Though, after second thought, I think it would be clearer if I use
`dp_lanes[0] < 2`. I'll update this in v14 as well.
> --
> With Best Regards,
> Andy Shevchenko
>
>
Best regards,
Pin-yen
