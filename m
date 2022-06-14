Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC3246BD
	for <chrome-platform@lists.linux.dev>; Tue, 14 Jun 2022 22:41:40 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id d123so10927999iof.10
        for <chrome-platform@lists.linux.dev>; Tue, 14 Jun 2022 15:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hvehCBfUTvgEUWe65S6hBli1BzVjPsVtPnt86add/kI=;
        b=A611+FifO5/wxtRT2yw4vt9ZxdMZMO1YdFrBzWAQZ+h2wb9x3Hm3GO3as3VS4HtzOD
         lKFKKkG+nF5VPBDTsFylpJVr5eMnvLGvlpZ2mG+grr6OXUAQwYkoo299LvMG7dVq35g4
         WjtxSCbzIgGtSimJ4tYsqPGIi5f61C2w9oVCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hvehCBfUTvgEUWe65S6hBli1BzVjPsVtPnt86add/kI=;
        b=T7ljb9MROUTkdA6gVfc6nKVYsXxryRTb4LxZGLadO+A6TT4BvQQUSd+OOyDLo8z6MU
         MsePjIh/KqPrl0EC7/YoiRwmXvYLi/XUx4fwr3s/I9gULa286zlR5PnDdXINXMtGRVrx
         XnLMqM50yyV8AHC+ERyy9e8T86MRWrdeTD/J+0VO9DBghy1H30bRQGrJ2vJaIWsbs5h0
         tbuboLwxkqyxjAmmpt7r/WTc4lOJg5DsLDbfvI9BlvTIbW/eNOGFDHQbhyABgM+t0h1C
         1tmMxD04A/If49D0m8qdRY7QI5aVvBPP8ZuidiBNV9GObWxB4me/4cXWfHG9woe1+kkb
         d8Hg==
X-Gm-Message-State: AOAM532aAXeVu8sUmFa8/VukNwFa2cI/kUZaUrMZf4kDNBtBBYvxWfWW
	TotHNkfRsyYtwqtgVfuOmVk4m5RKbPZqFo/D
X-Google-Smtp-Source: ABdhPJyIuVy64iAtdxSSqVMXdv3RyVrZeL9+UKg48akh7DLueIPV1BXlzILY+dO6RIfyVoRihewRtg==
X-Received: by 2002:a05:6602:2e81:b0:669:185c:3b3f with SMTP id m1-20020a0566022e8100b00669185c3b3fmr3610750iow.117.1655246499586;
        Tue, 14 Jun 2022 15:41:39 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id b14-20020a92c84e000000b002d1df239846sm5981222ilq.79.2022.06.14.15.41.38
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 15:41:38 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id y16so7620247ili.13
        for <chrome-platform@lists.linux.dev>; Tue, 14 Jun 2022 15:41:38 -0700 (PDT)
X-Received: by 2002:a05:6e02:20e9:b0:2d1:d151:3c53 with SMTP id
 q9-20020a056e0220e900b002d1d1513c53mr4443271ilv.220.1655246498060; Tue, 14
 Jun 2022 15:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220614195144.2794796-1-swboyd@chromium.org> <20220614195144.2794796-3-swboyd@chromium.org>
In-Reply-To: <20220614195144.2794796-3-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 14 Jun 2022 15:41:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UU-AENyChCvVAKH709E4hFtgo4Txa8zFDY=JM1UifA0g@mail.gmail.com>
Message-ID: <CAD=FV=UU-AENyChCvVAKH709E4hFtgo4Txa8zFDY=JM1UifA0g@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: cros-ec: Add ChromeOS fingerprint binding
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	Guenter Roeck <groeck@chromium.org>, Craig Hesling <hesling@chromium.org>, 
	Tom Hughes <tomhughes@chromium.org>, Alexandru M Stan <amstan@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Jun 14, 2022 at 12:51 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Add a binding to describe the fingerprint processor found on Chromebooks
> with a fingerprint sensor. Previously we've been describing this with
> the google,cros-ec-spi binding but it lacks gpio and regulator control
> used during firmware flashing.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/chrome/google,cros-ec-fp.yaml    | 97 +++++++++++++++++++
>  .../bindings/mfd/google,cros-ec.yaml          |  9 ++
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml
>
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml
> new file mode 100644
> index 000000000000..48c02bd4585c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/chrome/google,cros-ec-fp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ChromeOS Embedded Fingerprint Controller
> +
> +description:
> +  Google's ChromeOS embedded fingerprint controller is a device which
> +  implements fingerprint functionality such as unlocking a Chromebook
> +  without typing a password.
> +
> +maintainers:
> +  - Tom Hughes <tomhughes@chromium.org>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: google,cros-ec-spi
> +  required:
> +    - compatible
> +    - boot0-gpios

I've never personally used "select" before and I'm not sure where it's
documented. Without knowing anything, it seems weird to me that in
this file we're matching against a compatible that's not
google,cros-ec-fp. Randomly grabbing some other example that's similar
(panel-lvds.yaml) looks more like what I would have expected. AKA in
this file:

select:
  properties:
    compatible:
      contains:
        const: google,cros-ec-fp
  required:
    - compatible

...and then in the other file:

select:
  properties:
    compatible:
      contains:
        const: google,cros-ec-spi
  not:
    properties:
      compatible:
        contains:
          const: google,cros-ec-fp
  required:
    - compatible


Of course, if one of the dt maintainers gives different advice then
listen to them. ;-)

-Doug
