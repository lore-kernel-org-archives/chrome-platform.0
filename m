Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9989828ED
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 09:46:33 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id v127so3599862vsb.12
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 01:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JD9id90/GBv0rN+b+fEE7qihWEJZMu0XeMc/gEngtnw=;
        b=JxXWwl+eLuaP6fnFCpJj1Lr9KWkQl8r3Rpi0OvHY1f1GNT609qbw8bRS2JM6xzBJk1
         gzZwM3H2vWaM2CUnjzAfWx28LZ9jbXOnDUqsqoqVZPLJ3YveCvlDuFEP71Nhx0PN68te
         1LAah7NX2O0NdZBWtXSO51iFyBpRk9at/6lN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JD9id90/GBv0rN+b+fEE7qihWEJZMu0XeMc/gEngtnw=;
        b=QtoCao18fkLGpTK/ZwpuwZ72lJ9/AQvP2lSKCe8doIwFH/Vmm0K0BoZGD8IXAPmzn1
         MDz9jHQDgrUAUehvEoL824HPJVEFrTlAHk75xNEuqCW4rFtR1GaEHxJ/X8qJvkdogRiK
         aUZIpa38u0Lm33NfzDrLSgyQabSywa1UJVxZhXZALxhZ9zYQMbeMb4NUoSVIsH3S3goJ
         FRJC9/3aHLZMLd216vKDsLyHxeAdaRrYLKOusSfkMrKlca3bWpl3quOcgv+0kDUpgckC
         AgNpVZoDX102G3G6VlCG0fGWyXAYhL9qwT+HLdYL1b3Z0Tmjuh5o1yAf7Z/BWHiEyogl
         Y3SQ==
X-Gm-Message-State: AFqh2krsbdcTDWXX3YuBZfc8w3XOTZymLBLW51MNxEsMafMIh48bx6El
	xZtPsRM6wGrXVCRvSjCbDaH56Ka5/q5HhDGN2SBNOA==
X-Google-Smtp-Source: AMrXdXuO0fTMqxwkiZVvH9C4e5gp4mmmQNXabaJ9gGA79i+OpIS1ue3zRzP45wYsOoz3U1RqMDqvFfwghOaBt9YruXE=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr7186588vsv.9.1673257592360; Mon, 09 Jan
 2023 01:46:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230109084101.265664-1-treapking@chromium.org> <20230109084101.265664-2-treapking@chromium.org>
In-Reply-To: <20230109084101.265664-2-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Jan 2023 17:46:21 +0800
Message-ID: <CAGXv+5GG_K8ga_c6mZcyn2y8Ydi3FHs4K6s7e45OeRPdD80g7A@mail.gmail.com>
Subject: Re: [PATCH v9 1/9] device property: Add remote endpoint to devcon matcher
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
> From: Prashant Malani <pmalani@chromium.org>
>
> When searching the device graph for device matches, check the
> remote-endpoint itself for a match.
>
> Some drivers register devices for individual endpoints. This allows
> the matcher code to evaluate those for a match too, instead
> of only looking at the remote parent devices. This is required when a
> device supports two mode switches in its endpoints, so we can't simply
> register the mode switch with the parent node.
>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8192 based Hayato (ASUS Chromebook Flip CM3200).
