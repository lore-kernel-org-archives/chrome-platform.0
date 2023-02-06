Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5A3322A
	for <chrome-platform@lists.linux.dev>; Mon,  6 Feb 2023 10:22:53 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id s24so12095077vsi.12
        for <chrome-platform@lists.linux.dev>; Mon, 06 Feb 2023 02:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IDFXynxhTW1MwQ5q7ACPsdQYoX0X11isexUWJq5g+yg=;
        b=Tn+42238E/9sl6eoWwma3KtObVRsN/fRvB+q+b9YCSNv+D3eCfQs1FaM3VJac8A3r/
         DRhLjpUmzMZPlOcK4vFkiPX7O2EbwTtrNBHslK4TrfU5m1lwFmhchOwPN20shA+qADeN
         GIgNAy56Yw6c7Uv/a5ovUg0s+6fOBYxNGV9dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDFXynxhTW1MwQ5q7ACPsdQYoX0X11isexUWJq5g+yg=;
        b=k/JeSF7+gf48D7IIsJJVgC9ucYHRAx1YSut70f9Rlzg/S1jSKqAQ+Hrie3NaRLC1dH
         +pRp/QpOOWIlpJcBhmnKbEN7hqjAMvT0tzUDMYBw5lgCB5V/3B6w57zAJw2Sehio4mPQ
         T/WTKTQKQ6eUsA6F00H9Y75hBFHhue4XPqF3cVzadCvdkzodiRQGzAf0g4GnqrqP47my
         L6j61G4DmAAYxrTOzRGRqdr9CW308GgH+l9dRmjMSWlOpn14fQkrR1NA+BWqmwoc3yLe
         s484y6PQ3wZ0eWKJhcyLK1PS7iU3CquBzb7NFwe7NYLIGioWy7mHOAVVrCtST0NIsQJb
         WZJQ==
X-Gm-Message-State: AO0yUKVQSKRLhZnMHU1rdtGD7FekJysXbmFbSoetUDnjjwsbAZsWZ9Qd
	ODOSsj4JKkO7VkTzjBIxCXdtHbIndRyTnxglsxAjdA==
X-Google-Smtp-Source: AK7set9UEObC8Y3n/7lmYrPAsFQnv8OgXuuTtX5cUD3nMzyjS/+VIqLpJpkmCwvPrE9S9lf2zhO2/iIUbDgx4yAMAfo=
X-Received: by 2002:a05:6102:322a:b0:3fe:ae88:d22 with SMTP id
 x10-20020a056102322a00b003feae880d22mr2896334vsf.65.1675678972359; Mon, 06
 Feb 2023 02:22:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org> <20230204133040.1236799-8-treapking@chromium.org>
In-Reply-To: <20230204133040.1236799-8-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Feb 2023 18:22:41 +0800
Message-ID: <CAGXv+5FBHKgOA_XAr7HzsZhsB_W5QbdY6R3q+5PCy5yynduprw@mail.gmail.com>
Subject: Re: [PATCH v11 7/9] dt-bindings: display: bridge: it6505: Add
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
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Stephen Boyd <swboyd@chromium.org>, chrome-platform@lists.linux.dev, 
	Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Javier Martinez Canillas <javierm@redhat.com>, Xin Ji <xji@analogixsemi.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 4, 2023 at 9:31 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
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
> Changes in v11:
> - Updated the description of the endpoints in the bindings
> - Referenced video-interfaces.yaml instead for the endpoints binding
> - Removed duplicated definitions from inherited schema
>
> Changes in v9:
> - Fixed subject prefix again
> - Changed the naming of the example node for it6505
>
> Changes in v8:
> - Updated bindings for data-lanes property
> - Fixed subject prefix
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
>  .../bindings/display/bridge/ite,it6505.yaml   | 101 +++++++++++++++---
>  1 file changed, 88 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index b16a9d9127dd..8ae9c5cba22c 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -75,22 +75,49 @@ properties:
>        port@1:
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
> -        description: Video port for DP output
> +        description:
> +          Video port for DP output. Each endpoint connects to a video output
> +          downstream, and the "data-lanes" property is used to describe the pin
> +          connections. 0, 1, 2, 3 in "data-lanes" maps to TX0, TX1, TX2, TX3,
> +          respectively.
>
> -        properties:
> -          endpoint:
> -            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +
> +        patternProperties:
> +          "^endpoint@[01]$":
> +            $ref: /schemas/media/video-interfaces.yaml#
>              unevaluatedProperties: false
>
>              properties:
> +              reg: true
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
> +                  - items:
> +                      - enum: [0, 1, 2, 3]

Based on the datasheets we have and the downstream driver, I assume
the hardware implements "lane swap" as simply reversing the order
of the output pins.

In that case the hardware can't output 1 lane DP on any arbitrary lane,
but only lane 0 or 3.

> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +
> +                  - items:
> +                      - const: 2
> +                      - const: 3

And maybe a bit pedantic, but have the order correct as:

    - const: 3
    - const: 2

> +                  - items:
> +                      - const: 0
> +                      - const: 1
> +                      - const: 2
> +                      - const: 3
> +
> +              mode-switch:
> +                type: boolean
> +                description: Register this node as a Type-C mode switch or not.

Same as the anx7625 patch, I would reword this as "Serves as Type-C mode
switch if present".


ChenYu


> +
> +            required:
> +              - reg
> +              - remote-endpoint
>
>      required:
>        - port@0
> @@ -102,7 +129,6 @@ required:
>    - pwr18-supply
>    - interrupts
>    - reset-gpios
> -  - extcon
>    - ports
>
>  additionalProperties: false
> @@ -139,8 +165,11 @@ examples:
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
> @@ -148,3 +177,49 @@ examples:
>              };
>          };
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dp-bridge@5c {
> +            compatible = "ite,it6505";
> +            interrupts = <8 IRQ_TYPE_LEVEL_LOW 8 0>;
> +            reg = <0x5c>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&it6505_pins>;
> +            ovdd-supply = <&mt6366_vsim2_reg>;
> +            pwr18-supply = <&pp1800_dpbrdg_dx>;
> +            reset-gpios = <&pio 177 0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    it6505_dpi_in: endpoint {
> +                        remote-endpoint = <&dpi_out>;
> +                    };
> +                };
> +                port@1 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    reg = <1>;
> +                    ite_typec0: endpoint@0 {
> +                        reg = <0>;
> +                        mode-switch;
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&typec_port0>;
> +                    };
> +                    ite_typec1: endpoint@1 {
> +                        reg = <1>;
> +                        mode-switch;
> +                        data-lanes = <2 3>;
> +                        remote-endpoint = <&typec_port1>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> --
> 2.39.1.519.gcb327c4b5f-goog
>
