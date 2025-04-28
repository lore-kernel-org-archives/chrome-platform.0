Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807FC1FDA8E
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 20:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873651; cv=none; b=OCdMUT4aNak+DhwIvAYi+LEHNxjNfLUTI+6UvzTk+pu6R23MAX4c3rH4SQOmHjetWHOQg+FvzYgJIOPO91EoFYVudhue1swp6rHDYLvQAyZz9e5rReOxc1pWLL1HMkszaP3FWgUhTw1pR3nJ0twN4kQy4uwGnj3Hfk8PNrtdPoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873651; c=relaxed/simple;
	bh=n4WGwCItyZewiOJcBSp4Eaj+wnGcnc5O6i3QGT0fNG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXKdHp0LSHq7gSbvP4AOJvutWiSRZEPOqurdj+IPAHuE97m32z6oYDVwOQITjum4rzqoJ1RNWCOClIuxKZ81HGO14mly0fGDLolCl+hpJQO7el7iyc17X+Zz6NecasGSkMdyJRJu7Go+C5u/C3QmFgd5sTOvdmjhskBVAsyTrm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B/UY036i; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B/UY036i"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22438c356c8so58858115ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 13:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745873646; x=1746478446; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=B/UY036iKAe++bKayFz1ulG9/p3hNvYKnV5n+slYdd/TGpBLHE9pxVJGuybhpKWDgw
         5LvyX9Gsm7S0rtaMUt4lxlS0Af5c8jUpz+MVE+N8e+xcW52/HI+C9S6eOLqGCce6Vfrh
         8tS8jLPCvtJyBHsFHTrlsvpLPcLIi0H/oswPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873646; x=1746478446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=IFatQJWfKIqmKmd09mr34fxSrlnZ9mR1WOjgbJrfov41uG4jb9sp6vXZL9een72Vhj
         QU+rO/YHslrPVHgfwooFZOi1AxNWmy0GSvugr5rGDkN6ZR/lCx5DvTr95sBUz4DiB8dV
         5glqeN/5ahGUVWM5zrqjbvPfBQju1CvwmOYM4cdQSmJk4L6oYAE9KTE79DPRRki1ucy0
         VujCXzplh8o+wINLJN95Og4chRGjiP9A+ouzz4bF58FYraNBgETk9lLeOhOTXv12i20T
         No+xC6B+CzJoi1rM+fonz4wUxLsixjHGYDYTskqLTutarnC1pZ6jVXcc+4SdxsNOT9Nj
         Widg==
X-Forwarded-Encrypted: i=1; AJvYcCUww3xKkMq/+gUaL+Al2MQSV1aKuJwGBeNRYTc+hCcwGXL8bZxHZxHzF6XtvkzMtVj0fYO0g3Ocj82KDP7V6ZM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCTSF/6zlOYK6nJyaG5WTsPMAB3Hg2ej6iHBoFRsSDOmzPYiB7
	UQTC7CZsjMnZjNYXUpMaI04p1UZBRGt2dNi6FhNlibZazEsmRFLw4ih3fy284pChaXIJvbGQmuc
	=
X-Gm-Gg: ASbGncuoAQgH0C5S+QRHkbr4cG31qmfEJmL/M6GPSztdGkAFVUwTk1qlpJhYzUEhyrS
	7AtyD9lRCD3FYTFu0YV5XW50YMZUpsah6HwxZH1f9f7I0w7sAdaZk82WGsghqRyHWppCGQp7OqP
	Nn9Wia6bHAWGDibSI7so8DYXJdrLqLJmsENYPDOMCw/pF9+FDQ80u8szanyuGaywnrQ4AVLNtEB
	OUcQcgFSQV2DcmxruBO1l5apwCVVy32MeOp6lmHn7yX01GO7VN2HHyEa63ljKzCBHPvEDfz6Ann
	9CR2B6n0PB8Vm1BeLG8irbsho7+ZxFmiwFwnWqmFBMLwOzOQLX/gJ5bBAhowwJwQ9U26zABkO3V
	oSm9rR+57
X-Google-Smtp-Source: AGHT+IEOmBn36sHDEDeS10ZALWXOhWHUcnED6od20p8/Viqpk6R2dWe/o9pII1eij6Tn06bPZAXlWQ==
X-Received: by 2002:a17:903:2309:b0:223:669f:ca2d with SMTP id d9443c01a7336-22de6066c1bmr14968345ad.35.1745873646657;
        Mon, 28 Apr 2025 13:54:06 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1cf3921092sm2734312a12.25.2025.04.28.13.54.04
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b061a06f127so3650974a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 13:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVMYmWZFTkWO5Tw5Acmm45IdCy81EBc2i+N/+5khy5G+N18hh3nw38RS67oVK0yKD9dqI85KsoaLmFrBwd768=@lists.linux.dev
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.
