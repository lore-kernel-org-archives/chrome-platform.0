Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C75133CC
	for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 14:00:06 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id fy29so26205435ejc.12
        for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 07:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OD3NNQx/dnqD+0Cs+fXr4LXV6Ye4MYxeJ4nPZD4GszE=;
        b=KRbPahA4lFzwgk1dPu0dYjc5HI3Y+D0dxd62DcPU4ogSQZ64caMPwZVzbpx73J5Kc1
         eaEMkOYtMeTIYH6d3tYbTI31Zpk6YPeEHme+XqB6TB9vweuaBCzadZE54jjqEcIAS/Jf
         pzYTNENzXg+3E79ccZwG+0AO9oqg2VDxVgFkHvRNiXy7aIvjIH3seHu/ncpcbTZ7PS82
         gV4Uc4P8NeQN5INx5ZzZSJl5OpV/PcFLmN2hPWUojY2geEaue3bSrIyK7NibMwK9pdcK
         O1jLIZnNHFsb8ssyIcISmoy2tFgywNjOo7bd37jOZ8uS76xPibNCxglV/JSG62NQzbUF
         B9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OD3NNQx/dnqD+0Cs+fXr4LXV6Ye4MYxeJ4nPZD4GszE=;
        b=0g/r3XL2nZMBhuz+Gkxxw0leGbHgG7rhJLCeIWNA2ClUoFBOMzer+5nhjitEDoh9Kn
         ZuF4coi4ST941svsH2Xa2zOgYmfAdyurGxiWq756ALRybxtXeh3eNjdmrvUVErGxzfvh
         boiWiYzbSvUGKWDEXRylFJ99SU7Y+9yKyWXZ6CVBB1dLqu/anu8Hh96I7c84ulyBDB2a
         q+C97K5KePFrp553t7zkB53FmPmFmlkq4QcDEALxXmQq93FRmJiev3BDMFqJnaHSQ/S2
         r0XzUP92YlGXFdKaDCtiHjXdwCVMcINjrj0h3tRDBXx7vH4x4j0pwBFg+bM1m/zHjYEE
         izNA==
X-Gm-Message-State: AJIora8dY/bQF/RsYr2LWLA3yvc6vCWhLZNiawiZVtfHdxqa4yhui92O
	msmdJPXRlUWSemaWYt0V04O91iBrU/xIq7eyZAwUGQ==
X-Google-Smtp-Source: AGRyM1tWkD5ndkU51YMn3Zy/3SBBUnKXW/elXPy0MwiGbgYk7yLn606w46OmkL1nPHs9nxQiSkrrhnOhpxFcOHfz/3U=
X-Received: by 2002:a17:907:d92:b0:72e:e94d:b675 with SMTP id
 go18-20020a1709070d9200b0072ee94db675mr21493011ejc.742.1658239204549; Tue, 19
 Jul 2022 07:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717174454.46616-6-sam@ravnborg.org>
In-Reply-To: <20220717174454.46616-6-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 14:59:48 +0100
Message-ID: <CAPY8ntAALp=vtofLjKjEjH89k_fGtLWv9b4L=7fmFZr9+Dd6jg@mail.gmail.com>
Subject: Re: [PATCH v1 05/12] drm/bridge: sii8620: Use drm_bridge_funcs.atomic_check
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

On Sun, 17 Jul 2022 at 18:45, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Replace the deprecated drm_bridge_funcs.mode_fixup() with
> drm_bridge_funcs.atomic_check().
>
> drm_bridge_funcs.atomic_check() requires the atomic state operations,
> update these to the default implementations.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/sil-sii8620.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> index ab0bce4a988c..b6e5c285c8ea 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -8,6 +8,7 @@
>
>  #include <asm/unaligned.h>
>
> +#include <drm/drm_atomic_state_helper.h>
>  #include <drm/bridge/mhl.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> @@ -2262,26 +2263,30 @@ static enum drm_mode_status sii8620_mode_valid(struct drm_bridge *bridge,
>         }
>  }
>
> -static bool sii8620_mode_fixup(struct drm_bridge *bridge,
> -                              const struct drm_display_mode *mode,
> -                              struct drm_display_mode *adjusted_mode)
> +static int sii8620_atomic_check(struct drm_bridge *bridge,
> +                               struct drm_bridge_state *bridge_state,
> +                               struct drm_crtc_state *crtc_state,
> +                               struct drm_connector_state *conn_state)
>  {
>         struct sii8620 *ctx = bridge_to_sii8620(bridge);
>
>         mutex_lock(&ctx->lock);
>
> -       ctx->use_packed_pixel = sii8620_is_packing_required(ctx, adjusted_mode);
> +       ctx->use_packed_pixel = sii8620_is_packing_required(ctx, &crtc_state->adjusted_mode);
>
>         mutex_unlock(&ctx->lock);
>
> -       return true;
> +       return 0;
>  }
>
>  static const struct drm_bridge_funcs sii8620_bridge_funcs = {
>         .attach = sii8620_attach,
>         .detach = sii8620_detach,
> -       .mode_fixup = sii8620_mode_fixup,
> +       .atomic_check = sii8620_atomic_check,
>         .mode_valid = sii8620_mode_valid,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>
>  static int sii8620_probe(struct i2c_client *client,
> --
> 2.34.1
>
