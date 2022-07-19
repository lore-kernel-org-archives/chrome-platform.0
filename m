Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8944A1C3E
	for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 14:11:52 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id w12so19729492edd.13
        for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RnWAYtgDrYhGZC/PZ1B5ZCm3OmGHZOVctKEIlU+z6rI=;
        b=PpOMFXjn4g8lzVw5rHY4cup+bAESdluj4/3YOF7f+Nf6pVaKQIAOCl03o9pc+ycEg8
         JzGF5OksPZHIYo8KnyZYmZrW0WECIAz29OUSWAxfSBkt+qSOGEMeFW+lYpOJ57/DLLk7
         PYdg8BrOQbM/KkKhw1ljgw+DJ9JyqPEhrGlv2s2Xvji0jloqJWQx744c24n/HazvLKzM
         WP4RxGlwmQKNkwOHSxdqcVxD+OllnYAgIwd9FtDOhTQtG2CjkBm7BK7nWEWdcovEANB6
         3gYZHINxB0I37Oya/rNkBvm7c6jRL+syTFjrov0FBNiRiOJ7LGx5YQEWJkrCKPAmY03h
         pSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RnWAYtgDrYhGZC/PZ1B5ZCm3OmGHZOVctKEIlU+z6rI=;
        b=6rogsJulE0S19eztKNrppp+HFMnm3UInUHawkRt9+YxPPUK7KYJiGQwSihe/kA4si9
         MoG/C+uqC/GOOw5qU8U32Szkh7+37hcc0jqSd3ZMFomN1Kadhj7fwvdiHvT1m3znhsnV
         XURlPF/c3se4t0DYujYMx4qAdi9HUSVxCZqdOy4giG078cI8MMOahk87d4GL6WJMKoUk
         1+Zf1+ViVqxznTF+ylyD8+u7E+GjOR2a8qhlRhYhF3NZ+rsRqHZxDsu6pA3A20t/3peO
         BLzm81xVNLyNiYjPJP+5bNYN+zgqQ7+Q9dzxCdTzWKZGzJaipTge53dbs0vfURamRz7c
         PL9g==
X-Gm-Message-State: AJIora+SF/XMaktUqxZSUejMz+8mgEDn9e4sENZbXBpBfrnJELu6aiNS
	j75IhlBib/VYKPyKZbQFsZ9N2OBPArVUIgIquf1YcQ==
X-Google-Smtp-Source: AGRyM1u8NJW8Er8LUi8nkjhRDlt2K9GTp5JSpALaf1s7vzpZ3L6Y6cv9xNTWc9xabCNHNsVc63LyB1SwXY5mz2IiJeg=
X-Received: by 2002:a05:6402:42d3:b0:435:2c49:313d with SMTP id
 i19-20020a05640242d300b004352c49313dmr43193671edc.86.1658239910831; Tue, 19
 Jul 2022 07:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-2-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-2-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 15:11:34 +0100
Message-ID: <CAPY8ntDMPG3GxP3kuTi74DXMFCAYbh7AY3ZhWSWG1MFYjBdr0A@mail.gmail.com>
Subject: Re: [PATCH v1 09/12] drm/rcar-du: lvds: Use drm_bridge_funcs.atomic_check
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, David Airlie <airlied@linux.ie>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Philip Chen <philipchen@chromium.org>, linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Cai Huoqing <cai.huoqing@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 Jul 2022 at 18:58, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
> The driver implements the state operations, so no other changes
> are required for the replacement.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 830aac0a2cb4..c4adbcede090 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -554,10 +554,12 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>         clk_disable_unprepare(lvds->clocks.mod);
>  }
>
> -static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
> -                                const struct drm_display_mode *mode,
> -                                struct drm_display_mode *adjusted_mode)
> +static int rcar_lvds_atomic_check(struct drm_bridge *bridge,
> +                                 struct drm_bridge_state *bridge_state,
> +                                 struct drm_crtc_state *crtc_state,
> +                                 struct drm_connector_state *conn_state)
>  {
> +       struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
>         struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>         int min_freq;
>
> @@ -569,7 +571,7 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
>         min_freq = lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL ? 5000 : 31000;
>         adjusted_mode->clock = clamp(adjusted_mode->clock, min_freq, 148500);
>
> -       return true;
> +       return 0;
>  }
>
>  static int rcar_lvds_attach(struct drm_bridge *bridge,
> @@ -591,7 +593,7 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
>         .atomic_reset = drm_atomic_helper_bridge_reset,
>         .atomic_enable = rcar_lvds_atomic_enable,
>         .atomic_disable = rcar_lvds_atomic_disable,
> -       .mode_fixup = rcar_lvds_mode_fixup,
> +       .atomic_check = rcar_lvds_atomic_check,
>  };
>
>  bool rcar_lvds_dual_link(struct drm_bridge *bridge)
> --
> 2.34.1
>
