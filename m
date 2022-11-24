Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956462F26
	for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 17:39:32 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id z9so1031100ilu.10
        for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 09:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fy9syUmf9lBB+vO3GmqmIFnyaumQJieA2YTiSTCb7KM=;
        b=uywATxc0jYkIHGr0Np3Y6Cxr8cVNh+xp0abjHCdBjXMA62UKboK9dFGqftlMktD10N
         yfY+HOAYnTLUQyQ8B0C5RLRpxJoGXE0EHdAQsBk9LOiio7n4vY/pUEUu7Rk9ousAQiuA
         JJsvXE1nbuh3NWmN3//XIqIsVOk+hxWAFNXwU3nfyiKxedMm+u2Iv9ygsiV4xwZngCR0
         wfLm8L3Wvbw0czwxcJTYHmZNpfPmdCcShqulVDNtflnPY3wX2n9rbIHBfboWXWIZRJQU
         Ppa+Ai+3r4DKAGASDvZJBilA/D1y9ckR2V7slNJqID6VBU1meE1v8pdGlt7rHt2NqE/h
         KKEQ==
X-Gm-Message-State: ANoB5ply5AxU/3G/2V1WO3d2cSO4Ns9PgdLpHzc+GNrDo7rHLVzvr+qm
	kwkSzusiMqGvhNZoc7i08w==
X-Google-Smtp-Source: AA0mqf5LuJW5tA5bCdNf646Y8aYXGvi50nEq5DJ8+tW1hkLkNlDqAhJNb0OWuDggMcswzQjeTgOHCg==
X-Received: by 2002:a05:6e02:de8:b0:302:aa2b:3bff with SMTP id m8-20020a056e020de800b00302aa2b3bffmr6261698ilj.161.1669311571546;
        Thu, 24 Nov 2022 09:39:31 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c12-20020a02330c000000b003898778bed7sm108682jae.134.2022.11.24.09.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 09:39:31 -0800 (PST)
Received: (nullmailer pid 4182344 invoked by uid 1000);
	Thu, 24 Nov 2022 17:39:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
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
In-Reply-To: <20221124102056.393220-7-treapking@chromium.org>
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-7-treapking@chromium.org>
Message-Id: <166930150123.3946649.3725588692267123167.robh@kernel.org>
Subject:
 Re: [PATCH v6 6/7] dt/bindings: drm/bridge: it6505: Add mode-switch support
Date: Thu, 24 Nov 2022 11:39:27 -0600


On Thu, 24 Nov 2022 18:20:55 +0800, Pin-yen Lin wrote:
> ITE IT6505 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
> 
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v6:
> - Remove switches node and use endpoints and data-lanes property to
>   describe the connections.
> 
>  .../bindings/display/bridge/ite,it6505.yaml   | 94 ++++++++++++++++++-
>  1 file changed, 90 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml:99:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/bridge/ite,it6505.example.dts'
Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml:99:1: found character '\t' that cannot start any token
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/display/bridge/ite,it6505.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml:99:1: found character '\t' that cannot start any token
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml: ignoring, error parsing file
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221124102056.393220-7-treapking@chromium.org

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

