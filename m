Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23FF185A
	for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 10:48:16 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id e15so19031886edj.2
        for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 03:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jAJckkD4UuuHl70O8qDgCKBp28ZgCMKEQEQG2B3UfE0=;
        b=Q/Szb78YeaaPFs6XH9/IQHBVYt7poFICWO1a+McjynpiY6pG9I1QRhvcjCyZW6vxnT
         PxrDVy8fqimCTQDCY5vw60fGcwvARB/d+GrfnEURIYrjlYUAu+g4KEelBSEVAkLTon1i
         BraWKs6Eih7MiBHZXskxv4ylpEKf9Zme+IDLlu/1kv4oyrljN1MqwRfNIWViVXUNrct2
         u7AiHcXjfoR3SpMsm7PwS6mcOZXhMToPiIVophvCrx4VBf1kYpn4hXZYAEWApydD4tre
         eQIVXISQIy7ixmTDgFI3pw5O25NGhwF2bp3seoOr71PWiE9pToJ9D/iKflX4V3b20TqG
         hV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jAJckkD4UuuHl70O8qDgCKBp28ZgCMKEQEQG2B3UfE0=;
        b=MguOmL0SoujcQYhPjb31NN7IAYc/30DBOrbIpuUYfcy6iUaUMnBl7qDpnvRhkuma+R
         YdpSn8w35exqaptV0zuT8X0ORbOmPE1YJvHboZ808zOwFDiRA+DJQ9wuJDxqkNvYBAnQ
         cwDNn8CpFv715mD12k9n/ee3H4vYtQWa2gDTqBGMKhUSyJl7VQZ763ArNihdI3DbMPHV
         lLvuf6TjM6Xxn1AW3GkPaPVebUgLML8b3I2Xyx7+tHMK9sL8CIAD6IaLsFXPg1T8/Ixb
         sMP/zF64sbpeHoWa5CH2mV9Uz2wChAnyHjGFoOQd3kWxi4Sv7AkACmV7XooPyXLmCnCq
         u7uw==
X-Gm-Message-State: AJIora/rZRcxdh+oDq33bnQXDEpXt5hJupM9a8SYq2WwlfI7oG8r58rh
	0lX1TjmrTkZaVw6U5GX8Wh+nw9fueFPeBPlfBCbxYQ==
X-Google-Smtp-Source: AGRyM1ua9YfZzMzY+4okMS9alFUwqOoJ7z9AWWeCobrYmvatBAnyqrolqInpc2mJusYtBC/LbNwM0xE6plFTLrpI0iA=
X-Received: by 2002:a05:6402:4490:b0:43a:8f5a:d273 with SMTP id
 er16-20020a056402449000b0043a8f5ad273mr42301746edb.6.1658227695061; Tue, 19
 Jul 2022 03:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-5-sam@ravnborg.org> <CAPY8ntB2gXoUbUJhDLWVX3szaEKKKhnOO-qsKRZkMp1jDOt0Qg@mail.gmail.com>
 <YtWftDRPYcP5p+i1@ravnborg.org>
In-Reply-To: <YtWftDRPYcP5p+i1@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 11:47:58 +0100
Message-ID: <CAPY8ntCGVoNt9AsWb=3ou6x3XUDQ=S-=5-Yrd4HzAOLc+2XvKw@mail.gmail.com>
Subject: Re: [PATCH v1 12/12] drm/todo: Add bridge related todo items
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	DRI Development <dri-devel@lists.freedesktop.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Jitao Shi <jitao.shi@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>, 
	linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Philip Chen <philipchen@chromium.org>, Robert Foss <robert.foss@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Sam

On Mon, 18 Jul 2022 at 19:00, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dave,
>
> On Mon, Jul 18, 2022 at 11:27:37AM +0100, Dave Stevenson wrote:
> > Hi Sam
> >
> > On Sun, 17 Jul 2022 at 18:58, Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Add todo in the hope someone will help updating the bridge drivers.
> > >
> > > v2:
> > >   - Updated descriptions in todo.rst
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > ---
> > >  Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > > index 10bfb50908d1..fbcc232e0bc1 100644
> > > --- a/Documentation/gpu/todo.rst
> > > +++ b/Documentation/gpu/todo.rst
> > > @@ -480,6 +480,26 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
> > >
> > >  Level: Starter
> > >
> > > +Drop use of deprecated operations in bridge drivers
> > > +--------------------------------------------------
> > > +
> > > +&struct drm_bridge_funcs contains a number of deprecated operations
> > > +which can be replaced by the atomic variants.
> > > +
> > > +The following is more or less 1:1 replacements with the arguments
> > > +and names adjusted:
> > > +* pre_enable => atomic_pre_enable
> > > +* enable => atomic_enable
> > > +* disable => atomic_disable
> > > +* post_disable => atomic_post_disable
> > > +
> > > +* mode_set is no longer required and the implementation shall be merged
> > > +  with atomic_enable.
> >
> > The dw-mipi-dsi and msm DSI host controller bridge drivers are
> > currently relying on mode_set as a convenient hook to power up the DSI
> > host prior to pre_enable of the bridge chain. Removing it is therefore
> > going to break those.
> >
> > There is a proposed mechanism to allow for the removal of this hack
> > [1], but it's still waiting on R-B tags and/or discussion from bridge
> > maintainers (gentle nudge as you are one of those maintainers).
>
> I have over time gained some knowledge of how bridges works and have
> applied a few patches - but the maintainer role belongs to others.
> I just try to help a bit.

Apologies, I'd misread the text in this patch
+Contact: bridge maintainers, Sam Ravnborg <sam@ravnborg.org>,
+         Laurent Pinchart <laurent.pinchart@ideasonboard.com>
as being that you and Laurent were the bridge maintainers. Colon
instead of comma :-/

> I will review the referenced series - could you then in return
> review this series?

Sure, these look to be within my levels of knowledge.

> >
> > And do you mean merge with atomic_enable, or merge with
> > atomic_pre_enable? atomic_pre_enable would be more applicable for
> > almost all the bridges I'm aware of as they want to be configured
> > before video starts.
> Thanks, yes you are right. I will update the text to refer to
> pre_enable as this is often the right choice. Looking at how many
> bridges who implements mode_set, or are not yet atomic, this will
> take a while before we can drop it.

Thanks. That makes more logical sense to me for the majority of cases.
As to timescales, it always takes longer than ideal to migrate older drivers.

Thanks
  Dave
