Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B84C64
	for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 15:41:27 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id c184-20020a4a4fc1000000b005250b2dc0easo81533oob.2
        for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 07:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAmFGspOZMSPZfnaoWYmVR2MjZajqXp66cfwHSIQL14=;
        b=o9YaTVUaMYFtxQmFC0rO6TSpwAYkNuZAGLvesS2K98Pdv0SaLJF+m92NFIqsygm5HI
         xRTMQa6qHHiLg/aCY6xqkFZp4WWFjzM/aw/LvcKMFE+xB65zFTNfJyWM9Lr9JkeeRW4F
         BYBsC+cd6Aa9bIZHbJNxwWtL1FMKzegiCByc+Y2n4S628ITAitLIileb1J8MvpQcNqO5
         Bm7RjKqOzEs68QSseQCht8AL4oFQjCancv+I4jIUBZatoURZuBlQowRu4qal9re+wLlS
         Hd2FZd2Gv9pPTnDSIKph0WR8BJrVqVTtmGpyy1i4KW1CMLB/BpTciQQ67PALCvj6TjRR
         4Zjg==
X-Gm-Message-State: AO0yUKXOBueSUQuptIA3Fj9XOQ8ea0+MZWycczDL1gad3iwkzo+790hg
	chhCDWsGimLn1cmMLxkjFQ==
X-Google-Smtp-Source: AK7set85VAFntiNHIDjGtfCC2oOT1/ixiwDzGmV6KZlRV3vcVPs11dYw0ZIvaGYFHStwN8BXxG0AZg==
X-Received: by 2002:a4a:b6c3:0:b0:51f:e966:e3b7 with SMTP id w3-20020a4ab6c3000000b0051fe966e3b7mr1792287ooo.3.1676994086229;
        Tue, 21 Feb 2023 07:41:26 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bf7-20020a056820174700b0051ff746e2b2sm293867oob.8.2023.02.21.07.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:41:25 -0800 (PST)
Received: (nullmailer pid 2586813 invoked by uid 1000);
	Tue, 21 Feb 2023 15:41:24 -0000
Date: Tue, 21 Feb 2023 09:41:24 -0600
From: Rob Herring <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benson Leung <bleung@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display: bridge: Add ddc-i2c-bus for
 anx7688
Message-ID: <20230221154124.GA2584323-robh@kernel.org>
References: <20230218111712.2380225-1-treapking@chromium.org>
 <20230218111712.2380225-2-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230218111712.2380225-2-treapking@chromium.org>

On Sat, Feb 18, 2023 at 07:17:08PM +0800, Pin-yen Lin wrote:
> Introduce a optional "ddc-i2c-bus" property for anx7688 bridge. This
> allows the bridge to register a .get_edid callback.

What's .get_edid? This is a binding and is independent of Linux.

> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
> 
> Changes in v3:
> - New in v3
> 
>  .../bindings/display/bridge/google,cros-ec-anx7688.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> index a44d025d33bd..9d5ce8172e88 100644
> --- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> @@ -25,6 +25,10 @@ properties:
>      maxItems: 1
>      description: I2C address of the device.
>  
> +  ddc-i2c-bus:
> +    description: phandle link to the I2C controller used for DDC EDID probing
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +

No, this belongs in the connector node. The DDC signals are routed to 
the connector, not the bridge chip.

Rob
