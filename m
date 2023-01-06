Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764A31869
	for <chrome-platform@lists.linux.dev>; Fri,  6 Jan 2023 12:48:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so3466112wma.1
        for <chrome-platform@lists.linux.dev>; Fri, 06 Jan 2023 04:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8zVNUT3bgdnMkFHoj/GybUreH+dejeypvrE/0mlGO44=;
        b=RLC4VF3LVFfa0bOsrwXfVnS6UTPE8TaIBoiP8TlbOSfaW4I0JqJ2Io23P0TSAHqCCu
         DHE1TXTIS5AzTr2RGltgLFG+Aco9X3ZY1L7QnO+HaZeIwZ5VfcAE2mFlrCt3Sg9NHp5d
         1QG1PW20BpMEqgjWeMknBPLUsuFxI7dKRWOpQ245bGXK5aV1qSD5MtscROyyT94iwqgs
         TSsDipA04LOSx70GU34PifTCQxjWI3Do4TSTWu9mbleO5PmcBmbtAfGJsYNmY02VUHMK
         tCSzEXzicW1n4FLhB0rilYbyjDAGnHn5lkWHxEo4HfLZmF6zgnIUZT+ymH5w6i9wpFgw
         aHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zVNUT3bgdnMkFHoj/GybUreH+dejeypvrE/0mlGO44=;
        b=PmMnkYvPS/WjenemLSvr2CrGkN1LFNn1pRXnYN7svVaFOJFTMRRgpVdBI+NvccDPpU
         NdA7c4AJR3021H361MzeBU1/CISJql0MC5XPi6YsVD87T4Y4oTzRODNScm8doSXkxUXn
         6Ej9SHmdSea4BoGymrc5bl1qXnrQeMEmg+DJdcBEZxf0mnX2r/buZnJaEC0PmhnF3Nrs
         UDz22Zsu9rxKek8XokoATF7FRW3wdEuH4xIUDhNUUIgHtCnCsKUtNlvP+XlgygI7ooiZ
         XbM/GqqNjD7Yl5bUg0tpe+bXaXtmExoUAShKXuupbZpiV5pDuZiAWHrRM2lB2ZseVlqd
         AC0w==
X-Gm-Message-State: AFqh2kq4NpxYJGg/gCfzpofrrIojLwwxAPmSR4ybzEWaW/6IB6joSrZ4
	sVLPoIrvZW0jwEeukX9Now4A+A==
X-Google-Smtp-Source: AMrXdXvTAo5ItVnUoTZAbTRPzwj3gQr3rM9LmIfwukZgRbRtovmTeFlA8otEKXpd826Eati8fuXXjQ==
X-Received: by 2002:a05:600c:3d91:b0:3d9:103d:9078 with SMTP id bi17-20020a05600c3d9100b003d9103d9078mr38149211wmb.22.1673009302667;
        Fri, 06 Jan 2023 04:48:22 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c2caa00b003cfd58409desm6235286wmc.13.2023.01.06.04.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:48:21 -0800 (PST)
Message-ID: <5ad7a6bc-0ffd-9d2d-ed80-62c3530cf2fa@linaro.org>
Date: Fri, 6 Jan 2023 13:48:19 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 7/9] dt/bindings: drm/bridge: it6505: Add mode-switch
 support
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Cc: =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?=
 <nfraprado@collabora.com>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-kernel@vger.kernel.org, Allen Chen <allen.chen@ite.com.tw>,
 linux-acpi@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, Marek Vasut <marex@denx.de>,
 devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
References: <20230105132457.4125372-1-treapking@chromium.org>
 <20230105132457.4125372-8-treapking@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105132457.4125372-8-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/01/2023 14:24, Pin-yen Lin wrote:
> ITE IT6505 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> 
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v7:
> - Fixed issues reported by dt_binding_check.
> - Updated the schema and the example dts for data-lanes.
> - Changed to generic naming for the example dts node.
> 
> Changes in v6:
> - Remove switches node and use endpoints and data-lanes property to
>   describe the connections.
> 
>  .../bindings/display/bridge/ite,it6505.yaml   | 95 ++++++++++++++++---
>  1 file changed, 84 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index b16a9d9127dd..1ee7cd0d2035 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -77,20 +77,45 @@ properties:
>          unevaluatedProperties: false
>          description: Video port for DP output
>  
> -        properties:
> -          endpoint:
> +        patternProperties:
> +          "^endpoint@[01]$":
>              $ref: /schemas/graph.yaml#/$defs/endpoint-base
>              unevaluatedProperties: false
>  
>              properties:
> +              reg:
> +                maxItems: 1
> +
> +              remote-endpoint: true
> +
>                data-lanes:
> -                minItems: 1
> -                uniqueItems: true
> -                items:
> -                  - enum: [ 0, 1 ]
> -                  - const: 1
> -                  - const: 2
> -                  - const: 3
> +                oneOf:
> +                  - minItems: 1

Drop minItems.

> +                    maxItems: 1

Actually drop this as well and just use items with one item (enum).

> +                    items:
> +                      enum: [0, 1, 2, 3]
> +
> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +
> +                  - items:
> +                      - const: 2
> +                      - const: 3
> +
> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +                      - const: 2
> +                      - const: 3
> +
> +              mode-switch:
> +                type: boolean
> +                description: Register this node as a Type-C mode switch or not.
> +
> +            required:
> +              - reg
> +              - remote-endpoint
>  
>      required:
>        - port@0
> @@ -102,7 +127,6 @@ required:
>    - pwr18-supply
>    - interrupts
>    - reset-gpios
> -  - extcon
>    - ports
>  
>  additionalProperties: false
> @@ -139,8 +163,11 @@ examples:
>                  };
>  
>                  port@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
>                      reg = <1>;
> -                    it6505_out: endpoint {
> +                    it6505_out: endpoint@0 {
> +                        reg = <0>;
>                          remote-endpoint = <&dp_in>;
>                          data-lanes = <0 1>;
>                      };
> @@ -148,3 +175,49 @@ examples:
>              };
>          };
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c3 {

Just i2c

Best regards,
Krzysztof

