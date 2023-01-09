Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACD828ED
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 09:49:38 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id o63so7975113vsc.10
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 01:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D5ahGc+OvNs5WM9eaB6chHv07ET6UjHeKRyotHsgAjM=;
        b=Gpk1v2ZnmWgGcRSYw/UCvPVHlUAizncukxu/U3iy5e90X10p4sPxOeaTBy/IgZiWiA
         695lU071VeiTqW+ry4mUWMgctnJqzd7m6V3oXk/QY0JyzBN+saxHeNBi+bNS5UstZqmK
         XPn6dUrYFHrph5UApKtdK4HkMF1JNZbn9/6bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5ahGc+OvNs5WM9eaB6chHv07ET6UjHeKRyotHsgAjM=;
        b=06MgrhcF42gjSGdli0HfC1g6Uzm8vP5faYhwzaZoQWWTOQlicBnI5cHZi38QZ4N0eN
         tsLv1VqOseLuiuT4rM+8hJSG+OGPvt3zy58cWpDXevYacwnh59D1lceawMWtrONAcCJ3
         O+RLn6wCXqpCfgdruR4+FYLsC0vG3Q/GMqF/FHnZ+vJzzdKKL2+lzEhCJlImIr88tJuJ
         qx+2wfIdc4ZdpjYmykOkiJhpXCLkDfU1X66SGKGYSD30vozCsKqruwgx3/Wu4R3Nt7JH
         L9wGBPF1QMtmbMRhruWhAJrpHKJR6/oqKSMcEjV0mV65rP2Nc073fMMmSJkb9P0LLArx
         ZHnA==
X-Gm-Message-State: AFqh2kpWJ8yfIlapXIhfhVTgW97xNW3SaAwQ77Go4PqhXhZ3RoZl8R3f
	HNo+BGTq9p2TvfEjRR3ePOwXhHCM0880Mwugaoq26w==
X-Google-Smtp-Source: AMrXdXvtT35ihskXX2g1gPIg+h8WjTir+1IBQq2gkg2Z1k7ClRuUMhLNc3woSUYbDnwMhV5JuPAWZz/dN1mL6/Xm590=
X-Received: by 2002:a67:447:0:b0:3ce:d0ae:f6f6 with SMTP id
 68-20020a670447000000b003ced0aef6f6mr2967367vse.26.1673257777595; Mon, 09 Jan
 2023 01:49:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230109084101.265664-1-treapking@chromium.org> <20230109084101.265664-5-treapking@chromium.org>
In-Reply-To: <20230109084101.265664-5-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Jan 2023 17:49:26 +0800
Message-ID: <CAGXv+5HY6qn8QpvPasAh90f7pfzQcLfbP3_GSdk73mucU6ctsw@mail.gmail.com>
Subject: Re: [PATCH v9 4/9] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
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
	Stephen Boyd <swboyd@chromium.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	chrome-platform@lists.linux.dev, Xin Ji <xji@analogixsemi.com>, 
	linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 9, 2023 at 4:41 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> Analogix 7625 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
>
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
>
> Also include the link to the product brief in the bindings.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8192 based Hayato (ASUS Chromebook Flip CM3200).
