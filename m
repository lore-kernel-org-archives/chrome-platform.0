Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7228ED
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 10:11:46 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id i185so8049494vsc.6
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 02:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl5gtLkelHYob0yvxLrGJZ0WToOte9ATFrvdQKICgVE=;
        b=QNMyZmEv6uPuj/qm5nlVIOi9oLDwVoh7ki5s2SwsVlxB8Qa7tRd3oTaIfeHbBD+Dd0
         a0R6oWjAg772gZCDdeUZDLbwtzO1YittETMC244DFqNxDyLX+C4+Xktl9Qt7T64NE5Xi
         grJsVq7rhsC/EGWaUlY5lp6ayREbcqt4h6wMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nl5gtLkelHYob0yvxLrGJZ0WToOte9ATFrvdQKICgVE=;
        b=bPgcC63JfsOOsH+SwliRT8B/11HKCdHvnrd8YkWefjQz+6g6tp8QzGq23ywNw/mhic
         hVWi0mqhzy1q+RH6pHO2NgbJSVvAkzF1XB1FIUczfsda2TubIOIM5c1AvMlzE+xddCtw
         f8zTUjbaJziaidOzKJ0TeqbXmFIVxVSHkrPU78EosMfql5bArpngf6Sw05l3AABcTPG2
         j2LCWletTcs01w8NkbYbmSfs699fHP7rk95wiR+AM/g7N6HbVYYdVCFBLN5bkzB6R7TH
         0aJfU5X/117H/KfF1ocO8HxQDrY2Id8tkQp62fNLB23PHF1mVz3+XEWf2kXSMl0HWMf4
         uWtg==
X-Gm-Message-State: AFqh2kpa2MnzOnymtcDUVOfu3L/WIzDsbiK3+Fr0vZwCJWFEe6/p6gfH
	yM7UHNSS7s5DLnPOMj2sqeFsyis9adYjctxvi+kq6Q==
X-Google-Smtp-Source: AMrXdXtcNn1bVy1ULhiaYChXgRMGkSnSLx4444KzFv+N7rK2lYGkipv1i04e7jLkrmz585HPK6nXmJX0twUwXvIgfVY=
X-Received: by 2002:a05:6102:374d:b0:3d0:af13:3b6 with SMTP id
 u13-20020a056102374d00b003d0af1303b6mr141886vst.65.1673259105126; Mon, 09 Jan
 2023 02:11:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230109084101.265664-1-treapking@chromium.org> <20230109084101.265664-6-treapking@chromium.org>
In-Reply-To: <20230109084101.265664-6-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Jan 2023 18:11:34 +0800
Message-ID: <CAGXv+5GnLhUfdDzDQ2Y1Hb7gb+rjZzMhLU+38MYR+VHRdUCtkQ@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] drm/bridge: anx7625: Check for Type-C during panel registration
To: Pin-yen Lin <treapking@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-acpi@vger.kernel.org, Allen Chen <allen.chen@ite.com.tw>, 
	Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, 
	Stephen Boyd <swboyd@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, chrome-platform@lists.linux.dev, 
	Xin Ji <xji@analogixsemi.com>, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 9, 2023 at 4:41 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> The output port endpoints can be connected to USB-C connectors.
> Running drm_of_find_panel_or_bridge() with such endpoints leads to
> a continuous return value of -EPROBE_DEFER, even though there is
> no panel present.
>
> To avoid this, check for the existence of a "mode-switch" property in
> the port endpoint, and skip panel registration completely if so.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8192 based Hayato (ASUS Chromebook Flip CM3200).
