Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5508F258F
	for <chrome-platform@lists.linux.dev>; Thu, 23 Feb 2023 13:36:11 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id g6so625066iov.13
        for <chrome-platform@lists.linux.dev>; Thu, 23 Feb 2023 05:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PljBaFwsOSiSajmSlW90uY5IAqYtGowFmvaV1Snd28o=;
        b=aghVqa0j350UpMSo80F/OvikYrBe+DeIfqUhFuWit/Y3cFWt0d87987aGDYP1QY7th
         dLAh1IxLwAL2KoWKKyY84gApMjNO2hRhr3zJ5NDCbGUoZEQscH+0cxlWxRVuDOVk2uGE
         oGNmC97taMtCBsJJwx5X332w7LFW7fvpbxf1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PljBaFwsOSiSajmSlW90uY5IAqYtGowFmvaV1Snd28o=;
        b=UaWzZ8qKM8+ZQepdTTpBxU2WINH42qn1m0U9iUjC6PNeIm2vkxWT0gVaDUZ7uBbHYa
         idiMhT00eTmMq7IStpTHb2CwANT0ofUZSlKuYjoYNv0PzPn9AyTc+FNk+28kTYT5/Uyh
         rUy0R8pUJ/p9ySSmlGPCdmjOjoOeLKz2vAHZoFIe+Sg25cKetB/W+CpIpFRRySPqCD9t
         DorKHOhSqJ09XTdnLdqHWxHSSCJhtd/CJWAfSC36RrJ6NDTtiFbs+WNjMSJUO9IX5aoH
         Ua+XYELT+vFUPokZvuGrsdkk+hxE2/M99x1I4LrmkpmzL/6o9h9Y7Efsn5bXIe6zKMgS
         XxNA==
X-Gm-Message-State: AO0yUKXS87DLQUNtNqBPl4d36fpJnt48XYBYIlcF2Ppomntl5+tjMgWu
	2puabc3xx1xgNSTwrbyGsxe1IjhmCChSGp9AWO8mow==
X-Google-Smtp-Source: AK7set/mpYjZt1gR0m0p7QIkrMVPg+zxHDJsHk5bPOYLBOek2gQrZmEZtY4dYkIvYNlcS5eykCYem+K5vAxatmG+zfU=
X-Received: by 2002:a6b:d205:0:b0:71a:5a1f:544c with SMTP id
 q5-20020a6bd205000000b0071a5a1f544cmr1188867iob.5.1677159370385; Thu, 23 Feb
 2023 05:36:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230218111712.2380225-1-treapking@chromium.org>
 <20230218111712.2380225-2-treapking@chromium.org> <20230221154124.GA2584323-robh@kernel.org>
In-Reply-To: <20230221154124.GA2584323-robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 23 Feb 2023 21:35:59 +0800
Message-ID: <CAEXTbpctOtgE8uQJ7Bb8-ZRSjEwzQcQDegm1AuWfMmtDV0EbwA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: bridge: Add ddc-i2c-bus for anx7688
To: Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benson Leung <bleung@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org, 
	Nicolas Boichat <drinkcat@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

(Resend this with plaintext mode. Sorry for the previous spam.)

Hi Rob,

After some internal discussions, we decided to drop this series
because the driver is trying to do runtime routing of the display
signals, which is not supported by the current DRM system, even if we
can describe the design in the device tree. I'm explaining our use
case as a record, and I can follow up on the mtk_hdmi.c change if
anyone is interested.

The more detailed schematics looks like:
   +----------+    +----------------+    +-----------+
   |   MTK    |    |                |    |   HDMI    |
   |   HDMI   +--->|    TS3DV642    +--->| connector |
   |  bridge  |    |                |    +-----------+
   +----------+    |                |
                   |    HDMI MUX    |    +-------------+
                   |                |    |  anx7688    |   +-----------+
   +----------+    |                |    |  HDMI to DP |   |  USB-C    |
   | cros EC  +--->|                +--->|  bridge     +-->| connector |
   +----------+    +----------------+    +-------------+   +-----------+

The TS3DV642 HDMI MUX is controlled by the CrOS EC to switch the HDMI
signal between two output ports, and the generic-display-mux driver
was trying to control the downstream bridges according to the GPIO
status reported by EC. However, as far as I know, this kind of runtime
routing is not supported by DRM.

And, it can work fine if we only describe the following design in DT:

  +---------+   +-------------+   +-----------+
  |  MTK    |   |  anx7688    |   |  USB-C    |
  |  HDMI   +-->|  HDMI to DP +-->| connector |
  |  bridge |   |  bridge     |   +-----------+
  +---------+   +-------------+

This can work because the anx7688 driver won't reject any display
modes when the DP lane count is 0 ([1]), which is true when the HDMI
connector is used.

Thanks for your time for reviewing this series and sorry for not
explaining everything clearly at the beginning.

[1]: https://elixir.bootlin.com/linux/v6.2/source/drivers/gpu/drm/bridge/cros-ec-anx7688.c#L87

Regards,
Pin-yen


On Tue, Feb 21, 2023 at 11:41 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Feb 18, 2023 at 07:17:08PM +0800, Pin-yen Lin wrote:
> > Introduce a optional "ddc-i2c-bus" property for anx7688 bridge. This
> > allows the bridge to register a .get_edid callback.
>
> What's .get_edid? This is a binding and is independent of Linux.
>
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> > Changes in v3:
> > - New in v3
> >
> >  .../bindings/display/bridge/google,cros-ec-anx7688.yaml      | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > index a44d025d33bd..9d5ce8172e88 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > @@ -25,6 +25,10 @@ properties:
> >      maxItems: 1
> >      description: I2C address of the device.
> >
> > +  ddc-i2c-bus:
> > +    description: phandle link to the I2C controller used for DDC EDID probing
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
>
> No, this belongs in the connector node. The DDC signals are routed to
> the connector, not the bridge chip.
>
> Rob
