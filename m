Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8351D62F
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 12:33:10 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id i185so18873480vsc.6
        for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 04:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lmMMKRN2mYFSKBWdfS4KEk8FcK8S7SAJEuBn9XGJN0Y=;
        b=gFe2+58oQUeTne9Zkfg/uZ9QWaIynLRPo7PQDJ5C/B/JiBw/x/ytir+8cc2ShEVEpM
         h1jAtFbbp7ClBkAXMOF0BppMfBNqixsIgnHhR3ykhKHeUymrnYCtxiYLGCoe2TjT9Bmt
         XMEDeAyOFogPrwD8JuhSHAK3nr+cnt+udZNp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmMMKRN2mYFSKBWdfS4KEk8FcK8S7SAJEuBn9XGJN0Y=;
        b=4KRsmbRvt6j8r/1dri0qOmMVcv3rh9TrzyL9Zs5mQcgpn/zVrwgzRNFwhOTwsAtAmz
         wFB+Wn35UTSaj8ijvynREH4F0jx7F7rmewInkVAqOd3qktrizEwMrMCUlkeF+fngdBpM
         H3t+mPeAA5wY0PigcMNrJ/MYokwmEKPzXAByiiN2j08wlYbFF7O7aJne/fQThpBldT67
         7FXn1cuT24oZl1QLtnNHc9WcAb0h6r2NsujZ5NiIK+tVNRHGY3zNCdfhP4YwaYHoSQpR
         D7AQIfpcOGnz3d0uHLjclXb2xvnC6RbH5p0WL+dL1nHDJdYkLYX8H/RIRlavJPZnxC3L
         qZBQ==
X-Gm-Message-State: AFqh2kozlujxg3kX+Fpn89/sySSviPRVg7hLQ4NhwtUPjdbz3p70kUmg
	oGS8P+ei4CzVshybqCcPiV8YuQ6yhdzJcYr+doDrNQ==
X-Google-Smtp-Source: AMrXdXtCB2FwlHoY21KCpYVwLL1xj0HeaIsLRbFONUmvlRokBMQ/nNZG1R0mfhDYTDrxpXmDZBtfE8Cd1Wy2420mG2Q=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr9078574vsv.9.1673526789365; Thu, 12 Jan
 2023 04:33:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230112042104.4107253-1-treapking@chromium.org> <20230112042104.4107253-10-treapking@chromium.org>
In-Reply-To: <20230112042104.4107253-10-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 12 Jan 2023 20:32:58 +0800
Message-ID: <CAGXv+5ErwJFmu3tFX5RjB9jj-2YWH6mabnHFxnRWv+oAZud=1Q@mail.gmail.com>
Subject: Re: [PATCH v10 9/9] drm/bridge: it6505: Register Type C mode switches
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
	linux-acpi@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Javier Martinez Canillas <javierm@redhat.com>, 
	dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>, 
	Xin Ji <xji@analogixsemi.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 12, 2023 at 12:22 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> Register USB Type-C mode switches when the "mode-switch" property and
> relevant port are available in Device Tree. Configure the "lane_swap"
> state based on the entered alternate mode for a specific Type-C
> connector, which ends up updating the lane swap registers of the it6505
> chip.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
