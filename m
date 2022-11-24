Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9F2F26
	for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 17:39:35 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id g26so949373iob.11
        for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 09:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IoktBuMa4PVRuI5/Wo0/xDwZpz9ewe3rcWXZGPg/Ou4=;
        b=U+BMO7UbqopZXXYHznaXCx1XmwgqRIlYyUkZ5xd2931mbtxYoyeeIPmQHamqHT6Gmo
         BDCEx5wLNYCaS8JbSpohz29VpfeVSKMilXpn2H1AeScHEbkstithHIMepDEqm6jODBhL
         2dCX5AAwTKW4ypf2aEc+1zhoY2i7prfNJpns/T3tmweF8v1YCxNK10PmqbNilGAPXmAj
         FrY70jZ8CvW47o2vJ4pwOXeQlgdzsFKnJZfRclkK9FrWMBem7urRxv6o3h0ZGtAjApkF
         TTnx3hzWIgWXd6xvtZyYSmko7q44XMvF2nxiQLlHGwSU7I07l1te5SBIGzzpK1w0/xq2
         2JYg==
X-Gm-Message-State: ANoB5pn5UvJhczSry6mDUjq5SKLrxLMkAwrW0xgBlE16+OCBl2UsQtfJ
	ax6NR1r2VnWD6Xtz0Wk1GA==
X-Google-Smtp-Source: AA0mqf6u4sFD+aGrlSoj75GanwIIheHbWEuFFhr8HAzTVS6PxR/piCFthw25bzyO3jj4ay7YIeMfaw==
X-Received: by 2002:a02:6309:0:b0:375:4dbf:6ca4 with SMTP id j9-20020a026309000000b003754dbf6ca4mr6392316jac.315.1669311574693;
        Thu, 24 Nov 2022 09:39:34 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id g6-20020a02a086000000b003754033c6aesm593628jah.155.2022.11.24.09.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 09:39:34 -0800 (PST)
Received: (nullmailer pid 4182342 invoked by uid 1000);
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
Cc: Prashant Malani <pmalani@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org, 
	", Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-acpi@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	chrome-platform@lists.linux.dev, Robert Foss <robert.foss@linaro.org>, 
	Allen Chen <allen.chen@ite.com.tw>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Guenter Roeck <groeck@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Marek Vasut <marex@denx.de>, Benson Leung <bleung@chromium.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, 
	Jonas Karlman <jonas@kwiboo.se>, Lyude Paul <lyude@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Javier Martinez Canillas <javierm@redhat.com>, Xin Ji <xji@analogixsemi.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20221124102056.393220-4-treapking@chromium.org>
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-4-treapking@chromium.org>
Message-Id: <166930150025.3946612.5757271936642172776.robh@kernel.org>
Subject:
 Re: [PATCH v6 3/7] dt-bindings: drm/bridge: anx7625: Add mode-switch support
Date: Thu, 24 Nov 2022 11:39:27 -0600


On Thu, 24 Nov 2022 18:20:52 +0800, Pin-yen Lin wrote:
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
> 
> ---
> 
> Changes in v6:
> - Remove switches node and use endpoints and data-lanes property to
>   describe the connections.
> 
>  .../display/bridge/analogix,anx7625.yaml      | 73 ++++++++++++++++++-
>  1 file changed, 71 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml:218:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dts'
Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml:218:1: found character '\t' that cannot start any token
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/display/bridge/analogix,anx7625.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml:218:1: found character '\t' that cannot start any token
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml: ignoring, error parsing file
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221124102056.393220-4-treapking@chromium.org

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

