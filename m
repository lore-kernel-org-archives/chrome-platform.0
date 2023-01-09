Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C454215B2
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 08:36:12 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id y4so4274776iof.0
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 00:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mHG6QBVWalNbc6K28lbxbgnje/+7/XEu+lQ22LFlbhA=;
        b=RKb0bQ46rB+LGlcgXPPcXSNSsBvnsTEP2Ke81j6fsN0R18E5e0VfOaEeNTYQFYp3x1
         rQFXcYT9aKh2BFfqA/O8uH3QqudY/Yc8uhKMip+5WT6Rn1tw59rzHMo9cNqN3/zAz14j
         91oDYYt33C+AYk5ZdCGXa5TaDVBFg7RndXr/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHG6QBVWalNbc6K28lbxbgnje/+7/XEu+lQ22LFlbhA=;
        b=yxWvP0lZ0s8oKH6JluHrdfI5dMGRAchvXhfmQw+JKOlO0STIdrIuui9uoFHep2aTvA
         vcq0ssn0Vc0G4r8u9E800D3ITk7eWC02k/iwC8bdx5MIU/PIG1UoaShreih4BsgMn9sN
         ap64ft0JDfjT109C1KlfV3F3ONzEEkiwUKnEDlUbmA2MpzbysGiUkz3PDSifFK4a8zFo
         iDm+wX2qSG8g5pL4eNhJgLOpks4CedrartZKS4ZI5O/PdSfMk1nZDlzgMskdbBgmckh4
         CcrEGKdiwPe0AaqT/sRZZk/2Mxq+AnekDBOnDP2yDle//cMXskFyB5O9KjyBpWK/aeJu
         XZ1Q==
X-Gm-Message-State: AFqh2kp6XGgpJgZD3sYAAirsAE3djcmhu+adzr7W47zqKQGq2s0Fpo1n
	d4J9G+nKylCHv7hNXq6ZAsPSZ5hm4dC7ACnA4rHflw==
X-Google-Smtp-Source: AMrXdXuhMXzijzQbdmdDY+GL4BvF6UUNKOAXtws2POVhvMJvpc7JldHYHGfsgcPDVIsfECU7qR+WcgzqvnWgYoZMK4Y=
X-Received: by 2002:a5e:c00f:0:b0:6e3:38c6:e35f with SMTP id
 u15-20020a5ec00f000000b006e338c6e35fmr5425568iol.153.1673253371768; Mon, 09
 Jan 2023 00:36:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230107102231.23682-1-treapking@chromium.org>
 <20230107102231.23682-8-treapking@chromium.org> <7f672ee7-7b78-dad9-ca58-2eb4c2c2dd39@linaro.org>
In-Reply-To: <7f672ee7-7b78-dad9-ca58-2eb4c2c2dd39@linaro.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 9 Jan 2023 16:36:00 +0800
Message-ID: <CAEXTbpd+yfCeg+SyVy0gbhh4g3MHNhQXZFi7M5svDfkjfDrWpw@mail.gmail.com>
Subject: Re: [PATCH v8 7/9] dt/bindings: display: bridge: it6505: Add
 mode-switch support
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
	Guenter Roeck <groeck@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, 
	Xin Ji <xji@analogixsemi.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Allen Chen <allen.chen@ite.com.tw>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	chrome-platform@lists.linux.dev, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>, linux-acpi@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review.

On Sun, Jan 8, 2023 at 10:59 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/01/2023 11:22, Pin-yen Lin wrote:
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
> > Changes in v8:
> > - Updated bindings for data-lanes property
> > - Fixed subject prefix
>
> How? It is still wrong. You have slash there.

Sorry, I didn't even notice that. I'll fix this in v9.
>
> >
>
> (...)
>
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
> > @@ -148,3 +173,49 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c3 {
>
> Just i2c

I missed this when preparing v8. I'll fix this in v9.
>
>
> Best regards,
> Krzysztof
>

Best regards,
Pin-yen
