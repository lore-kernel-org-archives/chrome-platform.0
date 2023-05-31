Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C684A39
	for <chrome-platform@lists.linux.dev>; Wed, 31 May 2023 02:30:06 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-33b204f0ca0so25535695ab.2
        for <chrome-platform@lists.linux.dev>; Tue, 30 May 2023 19:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685500205; x=1688092205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbvEmEPbsI8LQ6J1wC1vs2xLNb4jhIMPg6wJX0MCwlk=;
        b=mLO3GurHAY1SCAkSJsZY7U0Y9tuQ5yd1gOECQ4d2TxWp0qBRD75vJrctROoSdeibwV
         C0vzRqHWhfv6OkFZBGrZ11zNg0QZffjj0sqw74Vmf2h3YpC0hYnHlK1LNw1VINDpmyib
         9hgzpzprSQ7kV36iGsxQxA9TeR139bY5mzV9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500205; x=1688092205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbvEmEPbsI8LQ6J1wC1vs2xLNb4jhIMPg6wJX0MCwlk=;
        b=IN+TkGgID4moiXvX8wJUk+TgpYzI70ZJ53Y4DjPVWll6E9Way3KvSDiWAqUWljwS96
         VltGJsD5uLkYqyznkdI1QW0J3rXh9kOkE5WhTHsHByeqxsLsY1EO4phz8z2tjyTEFRuG
         C+3A0JoHYtZeQhgG44eEk9dFw6ehJZx7in/6OVY7oG7rQc4dr9z2LqK0yzHS4JyKuKEA
         AZ/7VESKrox7vsHH4LWho5lvNkBoWrHdxQ4tD3nQVvd32cpQeyVLlDuRJetDpzDo6U9i
         peb+7eKPzkPHtQ61hgvxHFl/nLDZnhe5qybHYjcRpxcy1Q6MLZFAx9IOvgLilNO0yv0z
         r4uQ==
X-Gm-Message-State: AC+VfDy8p0ABPY5N2juFlaYV+fUZ5VvHbORHiFC4uQILy7fpca07GGmh
	etYNAvedW1WzEM9rsXwknswcnt2XKDPzEhhf3Qg=
X-Google-Smtp-Source: ACHHUZ7496UoszYcPhdrTxV7dSV2gW56N70vARdwhnimjYS5UWSVgO8Tx90D1u6zUlMDelqBjRBppg==
X-Received: by 2002:a92:d08a:0:b0:339:f011:77f5 with SMTP id h10-20020a92d08a000000b00339f01177f5mr1340516ilh.12.1685500204870;
        Tue, 30 May 2023 19:30:04 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id t3-20020a92b103000000b003350c8ae201sm411442ilh.29.2023.05.30.19.29.59
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 19:30:03 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-33baee0235cso61665ab.1
        for <chrome-platform@lists.linux.dev>; Tue, 30 May 2023 19:29:59 -0700 (PDT)
X-Received: by 2002:a92:c243:0:b0:338:9f6a:d54e with SMTP id
 k3-20020a92c243000000b003389f6ad54emr79412ilo.28.1685500178040; Tue, 30 May
 2023 19:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de> <CAD=FV=W-QLtGRGw5RfRyV06JOQNSd6sYuT7Y5=_VGn6xarWf9A@mail.gmail.com>
In-Reply-To: <CAD=FV=W-QLtGRGw5RfRyV06JOQNSd6sYuT7Y5=_VGn6xarWf9A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 May 2023 19:29:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XSWES7BK03dBFnxR8eDxRTRFACBRHnhNK94gf-0ed2pg@mail.gmail.com>
Message-ID: <CAD=FV=XSWES7BK03dBFnxR8eDxRTRFACBRHnhNK94gf-0ed2pg@mail.gmail.com>
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

On Fri, May 26, 2023 at 7:43=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, May 26, 2023 at 2:08=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> > call-back type"), all drivers being converted to .probe_new() and then
> > 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") conve=
rt
> > back to (the new) .probe() to be able to eventually drop .probe_new() f=
rom
> > struct i2c_driver.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >
> > I didn't get feedback for (implicit) v1 that was sent with Message-Id:
> > <20230427175954.666464-1-u.kleine-koenig@pengutronix.de>. This is a
> > rebase on v6.4-rc1 as the former patch doesn't apply cleanly any more.
> >
> > I also added more people to Cc, maybe that helps to get feedback.
> >
> > This patch is based on v6.4-rc1, and applies fine on today's next.
> > (There are also no new drivers that need adaption in next.)
> >
> > Thanks for considering,
> > Uwe
> >
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             | 2 +-
> >  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
> >  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c       | 2 +-
> >  drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
> >  drivers/gpu/drm/bridge/chipone-icn6211.c                 | 2 +-
> >  drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
> >  drivers/gpu/drm/bridge/cros-ec-anx7688.c                 | 2 +-
> >  drivers/gpu/drm/bridge/ite-it6505.c                      | 2 +-
> >  drivers/gpu/drm/bridge/ite-it66121.c                     | 2 +-
> >  drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 2 +-
> >  drivers/gpu/drm/bridge/lontium-lt9211.c                  | 2 +-
> >  drivers/gpu/drm/bridge/lontium-lt9611.c                  | 2 +-
> >  drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 2 +-
> >  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 ++--
> >  drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 2 +-
> >  drivers/gpu/drm/bridge/parade-ps8622.c                   | 2 +-
> >  drivers/gpu/drm/bridge/parade-ps8640.c                   | 2 +-
> >  drivers/gpu/drm/bridge/sii902x.c                         | 2 +-
> >  drivers/gpu/drm/bridge/sii9234.c                         | 2 +-
> >  drivers/gpu/drm/bridge/sil-sii8620.c                     | 2 +-
> >  drivers/gpu/drm/bridge/tc358767.c                        | 2 +-
> >  drivers/gpu/drm/bridge/tc358768.c                        | 2 +-
> >  drivers/gpu/drm/bridge/tc358775.c                        | 2 +-
> >  drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 2 +-
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c                    | 2 +-
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 2 +-
> >  drivers/gpu/drm/bridge/ti-tfp410.c                       | 2 +-
> >  drivers/gpu/drm/i2c/tda9950.c                            | 2 +-
> >  drivers/gpu/drm/i2c/tda998x_drv.c                        | 2 +-
> >  drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c       | 2 +-
> >  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c    | 2 +-
> >  drivers/gpu/drm/solomon/ssd130x-i2c.c                    | 2 +-
> >  32 files changed, 33 insertions(+), 33 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> This does apply to drm-misc-next and I'm happy to apply it there, but
> I'm a bit iffy doing it on the Friday before a 3-day weekend (Monday
> is a holiday in the US). If this is still pending next Tuesday and I'm
> not swamped then, I'll plan to apply it. I'm more than happy if a
> different drm commtter wants to apply it sooner. Thanks!

As promised, pushed to drm-misc-next:

332af828ce78 drm: Switch i2c drivers back to use .probe()
