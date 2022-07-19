Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4F2561
	for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 14:22:21 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id va17so27553579ejb.0
        for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nxr/Prb54/zy1kmbyYS8uuOBwL7gTKX4x+dREF3kWlc=;
        b=rfHzJilRMzE3oKpFS9bXcJBrk1KS7Ji2XBmi7NF3v4C7xkfLktLroYez3gsPMPrT9M
         Hh+Rl7s2UkaSjNDgfHRQqaczuorbv5k6B9UEU/Wh888GK78wdPAY61DmOXSIx6Ukgaa9
         r1C9QOkgF+mmqgdirIuR8rxLBbmSSkgAXUo9yXg+WV0/85M5jl8dRmaWYZLQRKfVPho0
         YU0LzpkMgyudLoyudxq/obH2krnI8Ikoc8iZ82Id2MMwmKx6rUTrlyKfHWvmwfKK+UkX
         yAbfClSj+VILZTJYOylICqpfg/upmqNk3fKVPlgP3xpk/4dIp8hLRuz4wexAupohmhm1
         jQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nxr/Prb54/zy1kmbyYS8uuOBwL7gTKX4x+dREF3kWlc=;
        b=ksuU9Ze4aKE9eoxXKlVXQkocv4hSJTxjWdNagJL+PhZ53Nh40CDUAu9sH4LcsACSIu
         zl3NGZIUGXjIDqu7pa6QizpnSor7XVy6lRJ1OjLZEOZ4M+wSXtVWU4Tq6jqUODG8arZv
         NSjNBwOrT6i7/7ecQFfPp/NDevrGQvvOESbM2tUF7D1l2ngmsplfOhzA2icI+d7gXYnm
         OKbBcINlGZ/OyrpmT+e0UF+/GQsT/1ggop+Tn6SC5uvKkVwDAFoyMUdAE9/7xU4kqzln
         GaLW0sH643ilbc/h+7UVCPgdaj9XAdu1kik/emQwQrImhLEIBnntWyIx60COqv7zWhDm
         cp5w==
X-Gm-Message-State: AJIora+MFjyemruFZaL2f5CWkZPVQLjoJYW+g3rBL3XhP3QiTePD8S7S
	KcbehvJnXoFzlNnRxTz6OZKOlpTyuI5MMfkQ868zRw==
X-Google-Smtp-Source: AGRyM1vI+njWwaFz/dP4qVFCo2KFrB6fXWc8gAu7iNC+UaeYXOOUyZKivYZDCMr6Fjq/7oDnJbs6hYOhlLvWYpEn7CQ=
X-Received: by 2002:a17:907:96a4:b0:72b:647e:30fd with SMTP id
 hd36-20020a17090796a400b0072b647e30fdmr30062164ejc.723.1658240539665; Tue, 19
 Jul 2022 07:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-4-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-4-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 15:22:03 +0100
Message-ID: <CAPY8ntDK99H5gvBXGKuLOALaR=eDAqJPQUOS156LtHRpQt-g=A@mail.gmail.com>
Subject: Re: [PATCH v1 11/12] drm/bridge: Drop drm_bridge_funcs.mode_fixup
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
> All users are converted over to drm_bridge_funcs.atomic_check()
> so it is safe to drop the mode_fixup support.
>
> Update the comment for atomic_check with relevant parts from mode_fixup.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_bridge.c |  7 +----
>  include/drm/drm_bridge.h     | 60 ++++++++++--------------------------
>  2 files changed, 17 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b6f56d8f3547..3f5acb19957c 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -685,10 +685,6 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>                                                   crtc_state, conn_state);
>                 if (ret)
>                         return ret;
> -       } else if (bridge->funcs->mode_fixup) {
> -               if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
> -                                              &crtc_state->adjusted_mode))
> -                       return -EINVAL;
>         }
>
>         return 0;
> @@ -934,8 +930,7 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
>   * @conn_state: new connector state
>   *
>   * First trigger a bus format negotiation before calling
> - * &drm_bridge_funcs.atomic_check() (falls back on
> - * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder chain,
> + * &drm_bridge_funcs.atomic_check() op for all the bridges in the encoder chain,
>   * starting from the last bridge to the first. These are called before calling
>   * &drm_encoder_helper_funcs.atomic_check()
>   *
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 7496f41535b1..8c93369bcc74 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -106,7 +106,7 @@ struct drm_bridge_funcs {
>          * to look at anything else but the passed-in mode, and validate it
>          * against configuration-invariant hardward constraints. Any further
>          * limits which depend upon the configuration can only be checked in
> -        * @mode_fixup.
> +        * @atomic_check.
>          *
>          * RETURNS:
>          *
> @@ -116,46 +116,6 @@ struct drm_bridge_funcs {
>                                            const struct drm_display_info *info,
>                                            const struct drm_display_mode *mode);
>
> -       /**
> -        * @mode_fixup:
> -        *
> -        * This callback is used to validate and adjust a mode. The parameter
> -        * mode is the display mode that should be fed to the next element in
> -        * the display chain, either the final &drm_connector or the next
> -        * &drm_bridge. The parameter adjusted_mode is the input mode the bridge
> -        * requires. It can be modified by this callback and does not need to
> -        * match mode. See also &drm_crtc_state.adjusted_mode for more details.
> -        *
> -        * This is the only hook that allows a bridge to reject a modeset. If
> -        * this function passes all other callbacks must succeed for this
> -        * configuration.
> -        *
> -        * The mode_fixup callback is optional. &drm_bridge_funcs.mode_fixup()
> -        * is not called when &drm_bridge_funcs.atomic_check() is implemented,
> -        * so only one of them should be provided.
> -        *
> -        * NOTE:
> -        *
> -        * This function is called in the check phase of atomic modesets, which
> -        * can be aborted for any reason (including on userspace's request to
> -        * just check whether a configuration would be possible). Drivers MUST
> -        * NOT touch any persistent state (hardware or software) or data
> -        * structures except the passed in @state parameter.
> -        *
> -        * Also beware that userspace can request its own custom modes, neither
> -        * core nor helpers filter modes to the list of probe modes reported by
> -        * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
> -        * that modes are filtered consistently put any bridge constraints and
> -        * limits checks into @mode_valid.
> -        *
> -        * RETURNS:
> -        *
> -        * True if an acceptable configuration is possible, false if the modeset
> -        * operation should be rejected.
> -        */
> -       bool (*mode_fixup)(struct drm_bridge *bridge,
> -                          const struct drm_display_mode *mode,
> -                          struct drm_display_mode *adjusted_mode);
>         /**
>          * @disable:
>          *
> @@ -466,9 +426,7 @@ struct drm_bridge_funcs {
>          * &drm_bridge_funcs.atomic_check() hooks are called in reverse
>          * order (from the last to the first bridge).
>          *
> -        * This method is optional. &drm_bridge_funcs.mode_fixup() is not
> -        * called when &drm_bridge_funcs.atomic_check() is implemented, so only
> -        * one of them should be provided.
> +        * This method is optional.
>          *
>          * If drivers need to tweak &drm_bridge_state.input_bus_cfg.flags or
>          * &drm_bridge_state.output_bus_cfg.flags it should happen in
> @@ -478,6 +436,20 @@ struct drm_bridge_funcs {
>          * &drm_connector.display_info.bus_flags if the bridge is the last
>          * element in the chain.
>          *
> +        * NOTE:
> +        *
> +        * This function is called in the check phase of atomic modesets, which
> +        * can be aborted for any reason (including on userspace's request to
> +        * just check whether a configuration would be possible). Drivers MUST
> +        * NOT touch any persistent state (hardware or software) or data
> +        * structures except the passed in @state parameter.
> +        *
> +        * Also beware that userspace can request its own custom modes, neither
> +        * core nor helpers filter modes to the list of probe modes reported by
> +        * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
> +        * that modes are filtered consistently put any bridge constraints and
> +        * limits checks into @mode_valid.
> +        *
>          * RETURNS:
>          * zero if the check passed, a negative error code otherwise.
>          */
> --
> 2.34.1
>
