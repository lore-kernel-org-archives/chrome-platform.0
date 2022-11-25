Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C0F7E
	for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 03:58:29 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id s12so4770014edd.5
        for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 19:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qG1EXeCBFcyO3EVAf0VFxb1QU3GfLO5BAHKXK8QXU44=;
        b=cZ/iUq/8Ac4sXum6PlSkHb/8lyC1wBkmt7ce4NtB1gel3ZSjx7+/j9VGw3mOb3qQ75
         z6OPVvh42cBseSf3c90EAdRkVfv5lG9N/kDoZLZEIPvPbhbLOrcU+xTYq7do2H3H1j12
         XG72/gjTaeyAUuMMhwn3+Bt4Rity7g86DEFAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qG1EXeCBFcyO3EVAf0VFxb1QU3GfLO5BAHKXK8QXU44=;
        b=WLGJxA+0V7OH/VYn0BU1zQniDPMBS2QTKABYtWtufMFA3gaDZdKh7vdDQbj08G4SW6
         fRs3NK8Rk1gmXS+hRKNN/nB+uHzf+V96iMNI6LZNRW6+S/Kk/7YoWr6JmD4awGV3vDcJ
         RUWEaWbgRON3Z7hiAOntZt1bDkxigKHby1GZQVIZoZIssSGkgyaLEkuNKfRNnjfI3rUO
         7Tn79OaFrKVmovWJKMD51hjREC7rtm9/xT0tbuoco9+Uj7B/Rgtl4sMfp8pfWtyhYj4K
         Chqdi/osHA2Gbc5i9GGmmaepyZP0BRz9P+EKUyul7MLr6L3PXPkF85BxPMCiTYfzrzlD
         Vg3Q==
X-Gm-Message-State: ANoB5pnHipH3aG0wlnz0MoC3Hpx/XBPt+Z5lfkpyWaVb37k0lw9eU0AE
	ll9dYt6niE0v0G3FhdPtByHx43CpJu2AAXp0MF+tJA==
X-Google-Smtp-Source: AA0mqf60CqwQOnre/TZIa/ZhVJ8FaIC4IKsOt/yGrHCUPoKZRFRMA3X+qFsKNmLvAyf46Xo33hjWsB1M1Hyr48/9OyU=
X-Received: by 2002:a05:6402:3895:b0:468:15f1:54b5 with SMTP id
 fd21-20020a056402389500b0046815f154b5mr14693061edb.8.1669348708173; Thu, 24
 Nov 2022 19:58:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-7-treapking@chromium.org> <166930150123.3946649.3725588692267123167.robh@kernel.org>
In-Reply-To: <166930150123.3946649.3725588692267123167.robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 25 Nov 2022 11:58:17 +0800
Message-ID: <CAEXTbpfFN=HKCNpQc6wrKozK-X14ky1jrw8GBnkk4rPm1LWoXA@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] dt/bindings: drm/bridge: it6505: Add mode-switch support
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Xin Ji <xji@analogixsemi.com>, Lyude Paul <lyude@redhat.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Benson Leung <bleung@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Prashant Malani <pmalani@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Javier Martinez Canillas <javierm@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Allen Chen <allen.chen@ite.com.tw>, 
	Marek Vasut <marex@denx.de>, linux-acpi@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
	Guenter Roeck <groeck@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sorry for accidentally using the tab characters. Will fix this in v7.

On Fri, Nov 25, 2022 at 1:39 AM Rob Herring <robh@kernel.org> wrote:
>
>
> On Thu, 24 Nov 2022 18:20:55 +0800, Pin-yen Lin wrote:
> > ITE IT6505 can be used in systems to switch the DP traffic between
> > two downstreams, which can be USB Type-C DisplayPort alternate mode
> > lane or regular DisplayPort output ports.
> >
> > Update the binding to accommodate this usage by introducing a
> > data-lanes and a mode-switch property on endpoints.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > Changes in v6:
> > - Remove switches node and use endpoints and data-lanes property to
> >   describe the connections.
> >
> >  .../bindings/display/bridge/ite,it6505.yaml   | 94 ++++++++++++++++++-
> >  1 file changed, 90 insertions(+), 4 deletions(-)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml:99:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
>
> dtschema/dtc warnings/errors:
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/bridge/ite,it6505.example.dts'
> Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml:99:1: found character '\t' that cannot start any token
> make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/display/bridge/ite,it6505.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> ./Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml:99:1: found character '\t' that cannot start any token
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml: ignoring, error parsing file
> make: *** [Makefile:1492: dt_binding_check] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221124102056.393220-7-treapking@chromium.org
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command.
>
