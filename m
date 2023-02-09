Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8868C627
	for <chrome-platform@lists.linux.dev>; Thu,  9 Feb 2023 04:00:10 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id y8so303189ilp.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Feb 2023 20:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=34Uu0qtbvg+E2V6qRqNRr/5yhYdeODS4LYeIVgn0e/w=;
        b=L+LZotxGbkC/ea5aziXyB5kDAXu/00XaiNFq7qjU349gx85ZWVqVqVJOPx1Ycff2Qj
         h9UJ2Ky7l/C0ANtBgLm94WG8B/uljRTSCOr0gkEnhmz9BJrAf8vzCjo4x/zeFrokxA4f
         riR65zYnEeV4d4dQc08Og30zjVbziNpDdwsMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34Uu0qtbvg+E2V6qRqNRr/5yhYdeODS4LYeIVgn0e/w=;
        b=8Cb4NrU1tZT72BmXyxVSDPm26nADOWb6eP8oMFAhfrzte5eQHaSOQ6RHZZ9cKOFmq4
         2rxFpkuMbDsgSxid2ijznnpv8hgk4VbWnkc1hjCTxuqT3Dq3ApmJ2kQOWl8sd/lNlki5
         wI0Mu4FyqftlMcpqk+nXh4QsIC3xTdqAm4/YajmE2IK7JcQ8xutaTUZqnrh0gzOkvcjh
         BnCW3H0KzxuyxVPe0Dq98CiTrV7OhbtqdbxbaXTZoXKhrWjwFAKGuHgOwFb/tYkLrXe2
         1etteawHVR4xACc2//1Txw3qkybJWIwn8/9hMO4Udi8nG84+KSNtFBoM8d4LIzv8RlF7
         BMYw==
X-Gm-Message-State: AO0yUKWt+5ABALn0l7WTMjnEF+qzLM7nzOQ5xC1mSjKu9TEt5JkzjtGh
	A351Z3+l7ng0LHQzGLWOeL6sbqZ9gei0YdhSJd1Kgg==
X-Google-Smtp-Source: AK7set+l0pt1FAbMRKYKU/2kZgCf6I4kbl87a3ND+oDvLUM04gmKSbfsd44gMP6Wx2Z/u6v4Lr8N353uQ/EI6t+S3hc=
X-Received: by 2002:a92:670a:0:b0:310:e753:59c9 with SMTP id
 b10-20020a92670a000000b00310e75359c9mr5569807ilc.10.1675915209445; Wed, 08
 Feb 2023 20:00:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-8-treapking@chromium.org> <20230207205221.GA4121517-robh@kernel.org>
In-Reply-To: <20230207205221.GA4121517-robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 9 Feb 2023 11:59:58 +0800
Message-ID: <CAEXTbpf5KqH7zev+kooUmz2DiMya-53UmvAMJfcOYcm7CCDthQ@mail.gmail.com>
Subject: Re: [PATCH v11 7/9] dt-bindings: display: bridge: it6505: Add
 mode-switch support
To: Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, devicetree@vger.kernel.org, 
	Allen Chen <allen.chen@ite.com.tw>, Lyude Paul <lyude@redhat.com>, linux-acpi@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>, 
	Xin Ji <xji@analogixsemi.com>, Stephen Boyd <swboyd@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for the review.

On Wed, Feb 8, 2023 at 4:52 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Feb 04, 2023 at 09:30:38PM +0800, Pin-yen Lin wrote:
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
> > Changes in v11:
> > - Updated the description of the endpoints in the bindings
> > - Referenced video-interfaces.yaml instead for the endpoints binding
> > - Removed duplicated definitions from inherited schema
> >
> > Changes in v9:
> > - Fixed subject prefix again
> > - Changed the naming of the example node for it6505
> >
> > Changes in v8:
> > - Updated bindings for data-lanes property
> > - Fixed subject prefix
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
> >  .../bindings/display/bridge/ite,it6505.yaml   | 101 +++++++++++++++---
> >  1 file changed, 88 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > index b16a9d9127dd..8ae9c5cba22c 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> > @@ -75,22 +75,49 @@ properties:
> >        port@1:
> >          $ref: /schemas/graph.yaml#/$defs/port-base
> >          unevaluatedProperties: false
> > -        description: Video port for DP output
> > +        description:
> > +          Video port for DP output. Each endpoint connects to a video output
> > +          downstream, and the "data-lanes" property is used to describe the pin
> > +          connections. 0, 1, 2, 3 in "data-lanes" maps to TX0, TX1, TX2, TX3,
> > +          respectively.
> >
> > -        properties:
> > -          endpoint:
> > -            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +
> > +        patternProperties:
> > +          "^endpoint@[01]$":
> > +            $ref: /schemas/media/video-interfaces.yaml#
> >              unevaluatedProperties: false
> >
> >              properties:
> > +              reg: true
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
> > +                  - items:
> > +                      - enum: [0, 1, 2, 3]
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
>
> Existing users put this property in the device's node, not the endpoint.
> That seems more like a property of the device, than the DP link.

In our use case, we want to register two mode switches for the same
device. That's why we put the "mode-switch" property in the endpoints
instead of the device node.

>
> You are using fwnode_typec_mux_get(), right?

Yes. This is called by cros_ec_typec.c[1] in our use case.

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/platform/chrome/cros_ec_typec.c#L148

Regards,
Pin-yen
>
> Rob
