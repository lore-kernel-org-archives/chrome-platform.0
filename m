Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C463784A3E
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855132; cv=none; b=NUdfqnwiVLvFiyVF46t493Q2WELZsbycDRAlpgSmcA7YeDporZgs3cb2Frwbj65yenWCcomd8O9JnMOxrntHVRSJ09bnob/Si39rA4ibwZa6UdnpeMzoSN0poKuAKgWYoaxTSmBpsn3xVHjgRxXg8p+NDBRpvzU2cWkh0pv0Izc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855132; c=relaxed/simple;
	bh=dwgYOym45oyNAdQ44afULSTNmEmOJnzMpDMS/yioqQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfKDkPoQtRm15hHYgJovBZwpLDdjJ5CAkvwMl+ZWUogzMyNlKRh/cmkG+D4BcCnd/hUSKf3vLTPleaFoah1KIO+6LQCio2T0HVPqF8qaU+yT2L7zsixALUfqpOehHFNsCCYRUWUhkIDqAAy4wOzAiaURg609YvrH75tHJe75Nfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=tH0Dz3Jk; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="tH0Dz3Jk"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e637edaa652so3629314276.1
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745855124; x=1746459924; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
        b=tH0Dz3JkkjBcFpdY2dl5NL+3PFzUH89G/5hFdQMfNdtkylJ7xmLZ1scM+G7n4JfDl6
         LDxDylzK3bYhQSz/ZZiEhuq17UZoNAqohU9YZwsMN84FZnmwHicNNYzqfCkL0j3lRJAV
         ufZZgGQqdpdRa6C1TZIDhZ+bfqI6wnvm3fjwFT5g6/MwYi8zFNSnQYWUXet1jOZmu7aa
         h73gdnRaKGWdBB7R2JjYIpTS3JlNZ0HwXbGU64p3AxBzO+v9UYKO4a25DuLSbuiYfIBk
         5yx+xvWbwXbwDAwr8rFYkvd/A/7ahNlgtN94kYfdJZgRfCr5EGaQ7MwD8Rsye2kFJHUd
         4V8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855124; x=1746459924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PU/sixtY71LvEi4Fz6DQo24QLlRpV93TUetQH3mfBu0=;
        b=RCbAPLaZKnlTUXvci+8TE9c8JjrPASZhk8pnGdF2sU+obYj5sCVqiJz2wdmprHvpRp
         YjYB4OtUzfZG+AhPSXqgXX7yaOIvzPgkDpxmou9Z8Kw5k3s6IC4/tgj1qT++WzYe2mVb
         tSqhuklt1UgkbNI7VvGLndB5VvhZh0nI3J6YnAlQ1Z5qYETE8HUOcaXrlrhgAWpbxua5
         AW8CrCaQgoNQn4lp7P0oUpvzgAuO3ekCQqrk1bajw7F9eL2jkwJiOWTH/G3HqK+XPhck
         lTd6ApbQHS/4juw7EV2fUM4H+jPfpJxznGH5LgJi3V8dN0BbUhjmntG7Pg6EWjJwALtT
         CQ2g==
X-Forwarded-Encrypted: i=1; AJvYcCVTOKWt4yweKG+DptyO/Okd4PbZq1+NiZvbHS513FemYik3Uasnm/XNjOEkWzIWai+od6YXI/Uio2C2ZJo1uXU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWmCQzHDhYu75gy6BsDLH5VA/jF4IUFq5HosX5jhmwG8U+4oyM
	VSnUmR1nO9tW6tLhYt8KcKj53V9HjkJrZamMLEyduL+umUv+R1jM1HxJKSG2zTmJGXsRh8qySO9
	49WEMK1eUbX8Nx2wvjvQDz7EAVIjCUqguohftNg==
X-Gm-Gg: ASbGnctiqhCIUjAg/VVrm/lTo6PiRHzo8PGUVmsYD2mi48uY16q2GNb4SddV5YO5SOW
	TOUZxFmBDZnQPS9a0pUz/HkopXQOKHz5hLm0D6V3zG1ojKsrjugpY26rKYtFoIyopdNLXiqutaG
	3xh+z5B16hF0aExCXDSLxlNNdQO7OmHKKqv0yJZ7w4WrT9RoaqEKkZ1yq4VxgRdWA=
X-Google-Smtp-Source: AGHT+IEF9MSlc844cuGTIRN/jaSQKExcmjeU1UeJwf54mw2x30vI+iBpqqWrdgOqbrjU+FD8mBfkUxmgGRAbgf2Y+6M=
X-Received: by 2002:a05:6902:2701:b0:e72:d88e:7a9a with SMTP id
 3f1490d57ef6-e73500e777emr136870276.45.1745855124717; Mon, 28 Apr 2025
 08:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-27-8f91a404d86b@bootlin.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 16:45:08 +0100
X-Gm-Features: ATxdqUF8zRJ18UCRRqpYogjOFDok1I-AvafpDPPJcxH-STXodhofR9H1CLM8tQg
Message-ID: <CAPY8ntDwK0DZ6sThryDRBUgjTb+muNHtRNp+LohTs6+FWeB5TQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/34] drm/vc4: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Apr 2025 at 20:01, Luca Ceresoli <luca.ceresoli@bootlin.com> wro=
te:
>
> This is the new API for allocating DRM bridges.
>
> This driver already implements refcounting of the struct vc4_dsi, which
> embeds struct drm_bridge. Now this is a duplicate of the refcounting
> implemented by the DRM bridge core, so convert the vc4_dsi_get/put() call=
s
> into drm_bridge_get/put() calls and get rid of the driver-specific
> refcounting implementation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks.

> ---
>
> Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
>
> Changed in v2:
> - fix error code checking
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 34 +++++-----------------------------
>  1 file changed, 5 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.=
c
> index efc6f6078b026764c59cfb2a33b28a88b7018c3a..458e5d9879645f18bcbcaeeb7=
1b5f1038f9581da 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -552,8 +552,6 @@ struct vc4_dsi {
>         struct vc4_encoder encoder;
>         struct mipi_dsi_host dsi_host;
>
> -       struct kref kref;
> -
>         struct platform_device *pdev;
>
>         struct drm_bridge *out_bridge;
> @@ -1622,29 +1620,11 @@ static void vc4_dsi_dma_chan_release(void *ptr)
>         dsi->reg_dma_chan =3D NULL;
>  }
>
> -static void vc4_dsi_release(struct kref *kref)
> -{
> -       struct vc4_dsi *dsi =3D
> -               container_of(kref, struct vc4_dsi, kref);
> -
> -       kfree(dsi);
> -}
> -
> -static void vc4_dsi_get(struct vc4_dsi *dsi)
> -{
> -       kref_get(&dsi->kref);
> -}
> -
> -static void vc4_dsi_put(struct vc4_dsi *dsi)
> -{
> -       kref_put(&dsi->kref, &vc4_dsi_release);
> -}
> -
>  static void vc4_dsi_release_action(struct drm_device *drm, void *ptr)
>  {
>         struct vc4_dsi *dsi =3D ptr;
>
> -       vc4_dsi_put(dsi);
> +       drm_bridge_put(&dsi->bridge);
>  }
>
>  static int vc4_dsi_bind(struct device *dev, struct device *master, void =
*data)
> @@ -1655,7 +1635,7 @@ static int vc4_dsi_bind(struct device *dev, struct =
device *master, void *data)
>         struct drm_encoder *encoder =3D &dsi->encoder.base;
>         int ret;
>
> -       vc4_dsi_get(dsi);
> +       drm_bridge_get(&dsi->bridge);
>
>         ret =3D drmm_add_action_or_reset(drm, vc4_dsi_release_action, dsi=
);
>         if (ret)
> @@ -1810,15 +1790,12 @@ static int vc4_dsi_dev_probe(struct platform_devi=
ce *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct vc4_dsi *dsi;
>
> -       dsi =3D kzalloc(sizeof(*dsi), GFP_KERNEL);
> -       if (!dsi)
> -               return -ENOMEM;
> +       dsi =3D devm_drm_bridge_alloc(&pdev->dev, struct vc4_dsi, bridge,=
 &vc4_dsi_bridge_funcs);
> +       if (IS_ERR(dsi))
> +               return PTR_ERR(dsi);
>         dev_set_drvdata(dev, dsi);
>
> -       kref_init(&dsi->kref);
> -
>         dsi->pdev =3D pdev;
> -       dsi->bridge.funcs =3D &vc4_dsi_bridge_funcs;
>  #ifdef CONFIG_OF
>         dsi->bridge.of_node =3D dev->of_node;
>  #endif
> @@ -1836,7 +1813,6 @@ static void vc4_dsi_dev_remove(struct platform_devi=
ce *pdev)
>         struct vc4_dsi *dsi =3D dev_get_drvdata(dev);
>
>         mipi_dsi_host_unregister(&dsi->dsi_host);
> -       vc4_dsi_put(dsi);
>  }
>
>  struct platform_driver vc4_dsi_driver =3D {
>
> --
> 2.49.0
>
