Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54701842
	for <chrome-platform@lists.linux.dev>; Sat,  7 Jan 2023 09:19:58 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id y2so2199802ily.5
        for <chrome-platform@lists.linux.dev>; Sat, 07 Jan 2023 01:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PbK2+hAlju8ZkGAxc+UQ8RxlZcml7uwUsydLc2gyPEg=;
        b=kfpfmOt+J4n/7SFbmM1pUbeuoX2q1niSB/uKPzsnGL7+M0JwLgagBJO3UnWh65gVeF
         XO11m2J1IDe09i1vfxNVoD6lJRkxkJ4n+RqYZKMvsVrWoM/SCt0NBGzC/SMOz697A2pZ
         YKJvooichUSfD0CDPe7PH0T5W+F3TJ6QkCkz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbK2+hAlju8ZkGAxc+UQ8RxlZcml7uwUsydLc2gyPEg=;
        b=SHScYusw3YZ3U6MBbNni6HJyuMZt/026IEz7JutqdfHgP7IWfvUHrR0O9L2IeGh1Oc
         V3GRyQ60ELLBxJwT9v8nrPfjrJORxLNVJ9rSVPa4CrUn+1IqxfdnsXrn6gPWoSubJP00
         HCfTfYlnjB4ghCgi+az3Vq62Kj5WNpKjV4OKIgqnGiWl5MKFO2fImoj4ZW7aeDwq4hmN
         dCR/GlzTD9ZDppPn7j721dn1+F/AQa3PHXXTvnz2D2wDbVKI6tvkhLdjEKvjzNFL4acZ
         IpeXK/7OJmkDObaPCk9BHikAB0oHtnUExkq/FD05An7mqFLn+3NAHBmjvosU/W01enp5
         +5xQ==
X-Gm-Message-State: AFqh2kqRSEqXqKXAeTkj5URCFKz8Ys631CunvVDfIYJ1jdW2piNbZRRW
	hwjjvWNeABnF3wGmH52gQ6zWZ9vNp2F8hTCFc1fIAw==
X-Google-Smtp-Source: AMrXdXvICIhe7IxdthfJp4igZhpX85NTS+E2nKcOMieonKi7rm9RWK0+me5+LzCr+2tJ6fmZgXKyCZIwff6ecY8f7CA=
X-Received: by 2002:a92:d0f:0:b0:303:96b3:c8a0 with SMTP id
 15-20020a920d0f000000b0030396b3c8a0mr5352459iln.192.1673083197870; Sat, 07
 Jan 2023 01:19:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230105132457.4125372-1-treapking@chromium.org>
 <20230105132457.4125372-8-treapking@chromium.org> <5ad7a6bc-0ffd-9d2d-ed80-62c3530cf2fa@linaro.org>
In-Reply-To: <5ad7a6bc-0ffd-9d2d-ed80-62c3530cf2fa@linaro.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Sat, 7 Jan 2023 17:19:46 +0800
Message-ID: <CAEXTbpdxQDvkJTX0XgNkn8s=KMZHuLaPN8nnyfcbkxJ3fgQbdA@mail.gmail.com>
Subject: Re: [PATCH v7 7/9] dt/bindings: drm/bridge: it6505: Add mode-switch support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
	Guenter Roeck <groeck@chromium.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Xin Ji <xji@analogixsemi.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>, linux-kernel@vger.kernel.org, 
	Allen Chen <allen.chen@ite.com.tw>, linux-acpi@vger.kernel.org, 
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	chrome-platform@lists.linux.dev, 
	Javier Martinez Canillas <javierm@redhat.com>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review.

On Fri, Jan 6, 2023 at 8:48 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/01/2023 14:24, Pin-yen Lin wrote:
> > ITE IT6505 can be used in systems to switch the DP traffic between
> > two downstreams, which can be USB Type-C DisplayPort alternate mode
> > lane or regular DisplayPort output ports.
>
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).

I'll fix this in this patch and the one for anx7625.
>
> >
> > Update the binding to accommodate this usage by introducing a
> > data-lanes and a mode-switch property on endpoints.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > Changes in v7:
> > - Fixed issues reported by dt_binding_check.
> > - Updated the schema and the example dts for data-lanes.
> > - Changed to generic naming for the example dts node.
> >
> > Changes in v6:
> > - Remove switches node and use endpoints and data-lanes property to
> >   describe the connections.
> >
> >  .../bindings/display/bridge/ite,it6505.yaml   | 95 ++++++++++++++++---
> >  1 file changed, 84 insertions(+), 11 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > index b16a9d9127dd..1ee7cd0d2035 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > @@ -77,20 +77,45 @@ properties:
> >          unevaluatedProperties: false
> >          description: Video port for DP output
> >
> > -        properties:
> > -          endpoint:
> > +        patternProperties:
> > +          "^endpoint@[01]$":
> >              $ref: /schemas/graph.yaml#/$defs/endpoint-base
> >              unevaluatedProperties: false
> >
> >              properties:
> > +              reg:
> > +                maxItems: 1
> > +
> > +              remote-endpoint: true
> > +
> >                data-lanes:
> > -                minItems: 1
> > -                uniqueItems: true
> > -                items:
> > -                  - enum: [ 0, 1 ]
> > -                  - const: 1
> > -                  - const: 2
> > -                  - const: 3
> > +                oneOf:
> > +                  - minItems: 1
>
> Drop minItems.
>
> > +                    maxItems: 1
>
> Actually drop this as well and just use items with one item (enum).

Sure I'll update this in v8.
>
> > +                    items:
> > +                      enum: [0, 1, 2, 3]
> > +
> > +                  - items:
> > +                      - const: 0
> > +                      - const: 1
> > +
> > +                  - items:
> > +                      - const: 2
> > +                      - const: 3
> > +
> > +                  - items:
> > +                      - const: 0
> > +                      - const: 1
> > +                      - const: 2
> > +                      - const: 3
> > +
> > +              mode-switch:
> > +                type: boolean
> > +                description: Register this node as a Type-C mode switch or not.
> > +
> > +            required:
> > +              - reg
> > +              - remote-endpoint
> >
> >      required:
> >        - port@0
> > @@ -102,7 +127,6 @@ required:
> >    - pwr18-supply
> >    - interrupts
> >    - reset-gpios
> > -  - extcon
> >    - ports
> >
> >  additionalProperties: false
> > @@ -139,8 +163,11 @@ examples:
> >                  };
> >
> >                  port@1 {
> > +                    #address-cells = <1>;
> > +                    #size-cells = <0>;
> >                      reg = <1>;
> > -                    it6505_out: endpoint {
> > +                    it6505_out: endpoint@0 {
> > +                        reg = <0>;
> >                          remote-endpoint = <&dp_in>;
> >                          data-lanes = <0 1>;
> >                      };
> > @@ -148,3 +175,49 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c3 {
>
> Just i2c

Will fix in v8.
>
> Best regards,
> Krzysztof
>

Best regards,
Pin-yen
