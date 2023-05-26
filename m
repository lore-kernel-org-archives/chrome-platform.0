Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85312261C1
	for <chrome-platform@lists.linux.dev>; Fri, 26 May 2023 14:44:36 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-776fdba68ecso24149139f.1
        for <chrome-platform@lists.linux.dev>; Fri, 26 May 2023 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685112274; x=1687704274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmjb8xVhG45InllAO9viTIqjFppbVfXIordhnFBrUlg=;
        b=hL+1hYtoR7thNTsxiPjiS0na63iKSaYSfKCQajeh3dUw3XPn0Kc+Hvg9+kXw93OC4F
         viW06Q4Uyp2J6j+LU4f1q8LjoFRq+O+f3biV55F6w/Gvs51YRJRnWoElfnS7W76zdr5s
         2f/9VML895dmJAEg846XRg5ap5elRzt3zLS6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685112274; x=1687704274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmjb8xVhG45InllAO9viTIqjFppbVfXIordhnFBrUlg=;
        b=Sfw+WKEpN9KcRhbdJA7mOsYVTYolZfWOthoWc//QHMr2vm/Nj52916IQftDu+bjHbw
         B15tQDMCEZQl5wXem1eccrR6do5qtYId9N/vMuw8oC/yBZZth4vYhhEuqDOkKMdSqurO
         lQIoCdapFlLpq1p0a525pgHC+e3p4yyt5oKwbbeV141ofDoNYSywLrOohm/L7wgj7W4A
         Xfsz5uHqdusdRwWWa0St8w/hxGcREs8ijAV/+w3H68P/fj2oQPvpc9sf/GZBqQYIn+rX
         p2mGFSVJegFi+jAj0YdZS6LolAo7K57INGGpjDhfnLGjJhE1RLVe1ROrOluxaWTGPEcL
         dcOQ==
X-Gm-Message-State: AC+VfDxVAHA/j86VTJSBjBdopdO4JrP1wNTcNurh5cE6OA2pEMTiVldS
	bAgWMWqQhceCLco4RDmaz92k1Yazhxy5LJwDbuk=
X-Google-Smtp-Source: ACHHUZ6qWlcxBFYzIlY9sSDTeez14/muIhtvvvsh95qVCL35EqkMf6zusS+p1XE+s87ygDcbS6A5PA==
X-Received: by 2002:a92:ce0c:0:b0:331:3b07:56e2 with SMTP id b12-20020a92ce0c000000b003313b0756e2mr1420575ilo.31.1685112273935;
        Fri, 26 May 2023 07:44:33 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id l5-20020a0566380d8500b0040b671bcf15sm1096946jaj.30.2023.05.26.07.44.31
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 07:44:31 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-33a8f766b64so132935ab.1
        for <chrome-platform@lists.linux.dev>; Fri, 26 May 2023 07:44:31 -0700 (PDT)
X-Received: by 2002:a05:6e02:15c6:b0:335:e50d:9b11 with SMTP id
 q6-20020a056e0215c600b00335e50d9b11mr79802ilu.7.1685112250126; Fri, 26 May
 2023 07:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 May 2023 07:43:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-QLtGRGw5RfRyV06JOQNSd6sYuT7Y5=_VGn6xarWf9A@mail.gmail.com>
Message-ID: <CAD=FV=W-QLtGRGw5RfRyV06JOQNSd6sYuT7Y5=_VGn6xarWf9A@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Switch i2c drivers back to use .probe()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Phong LE <ple@baylibre.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>, 
	Martin Donnelly <martin.donnelly@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, 
	Russell King <linux@armlinux.org.uk>, Stefan Mavrodiev <stefan@olimex.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>, 
	Jiasheng Jiang <jiasheng@iscas.ac.cn>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Crt Mori <cmo@melexis.com>, 
	Xin Ji <xji@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Liang He <windhl@126.com>, 
	dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
	chrome-platform@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 26, 2023 at 2:08=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() fro=
m
> struct i2c_driver.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> I didn't get feedback for (implicit) v1 that was sent with Message-Id:
> <20230427175954.666464-1-u.kleine-koenig@pengutronix.de>. This is a
> rebase on v6.4-rc1 as the former patch doesn't apply cleanly any more.
>
> I also added more people to Cc, maybe that helps to get feedback.
>
> This patch is based on v6.4-rc1, and applies fine on today's next.
> (There are also no new drivers that need adaption in next.)
>
> Thanks for considering,
> Uwe
>
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             | 2 +-
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c       | 2 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
>  drivers/gpu/drm/bridge/chipone-icn6211.c                 | 2 +-
>  drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c                 | 2 +-
>  drivers/gpu/drm/bridge/ite-it6505.c                      | 2 +-
>  drivers/gpu/drm/bridge/ite-it66121.c                     | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c                  | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c                  | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 2 +-
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 ++--
>  drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 2 +-
>  drivers/gpu/drm/bridge/parade-ps8622.c                   | 2 +-
>  drivers/gpu/drm/bridge/parade-ps8640.c                   | 2 +-
>  drivers/gpu/drm/bridge/sii902x.c                         | 2 +-
>  drivers/gpu/drm/bridge/sii9234.c                         | 2 +-
>  drivers/gpu/drm/bridge/sil-sii8620.c                     | 2 +-
>  drivers/gpu/drm/bridge/tc358767.c                        | 2 +-
>  drivers/gpu/drm/bridge/tc358768.c                        | 2 +-
>  drivers/gpu/drm/bridge/tc358775.c                        | 2 +-
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c                    | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 2 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c                       | 2 +-
>  drivers/gpu/drm/i2c/tda9950.c                            | 2 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c                        | 2 +-
>  drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c       | 2 +-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c    | 2 +-
>  drivers/gpu/drm/solomon/ssd130x-i2c.c                    | 2 +-
>  32 files changed, 33 insertions(+), 33 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

This does apply to drm-misc-next and I'm happy to apply it there, but
I'm a bit iffy doing it on the Friday before a 3-day weekend (Monday
is a holiday in the US). If this is still pending next Tuesday and I'm
not swamped then, I'll plan to apply it. I'm more than happy if a
different drm commtter wants to apply it sooner. Thanks!

-Doug
