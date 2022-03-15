Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E825723B5
	for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 15:48:12 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t11so29641486wrm.5
        for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 08:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=a6KAQY3VyZyFpo4BZbWR8METDP2MdzVLWAebj4jnwww=;
        b=o7hixJ6lijOXZAgiitpF7PHbOcpIqonKR1ge8zwFS5ikWmo1YAOfaaF6isNmOAPCaa
         4jGxF+CNwCTi2CExXNHoRrRlQjfN/tnmSpc0nyxKqZyEazvLwQUYjP721XfcD5Na3sIb
         WRI0ype/m3Udye6Gy02ZOsQlEuWH1wWqKcAprZojzibJ47ItQYIHGrvuUpfWt+TUnud1
         S4tBk3KPdzCAd5lBdyyv/ItdxdWHhlwQD4eyeUUDTOQYECTUnl/zDRPnAY/zEqO+7LBH
         yh04HaRppyqOvbXqSOMuBF10vncnmuaGsIewrDOyNS4yjatFMg4pH+e0oRz65Alrk6dw
         q0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=a6KAQY3VyZyFpo4BZbWR8METDP2MdzVLWAebj4jnwww=;
        b=je39zYjYw8iXZm1nSL3QjC0KBd896Eta4cx04/WnVA7XC1BqAcv6AfLBHLv/0mCqFp
         5xYN6yB/thOXq8c5B+7kNKZh7l7WPMMBH9uFGb5qqRBwe5ZQ7JUd6fwbScT8em5NrU8l
         gfn6nV73ZHM5phHWopURUjHFWmvnhwCrRDpsADSaX3U2eTMi90BX+w9BpC0tgJusaKaq
         zyVW+8g+3aZXy/sos0UG0aP6o6i8FwadTRvGSLlKoew8tuTpCKCwKMhXr2gc5ywW1y3v
         tr3wxZ3r0u6OAL2Tjuz11NYxbpuZ+LidLHlV5k3OkpTf9nNxCkglvTntPOWnb1EPKTBj
         Km2A==
X-Gm-Message-State: AOAM532sCA6rNqycps0BuL7iRxht/KDe/LzeMWY5bpJI0lsAdn0eni80
	xlRDw3Vwg5lFqWHwMSVj3Z2dnA==
X-Google-Smtp-Source: ABdhPJxU2sFg3JEB5WDFx15gM3NxvEeHGqMJAVHLcn7LQ+/tHdNXzB5qtYwU8j4Amky5SInopLZ/2A==
X-Received: by 2002:a5d:4528:0:b0:203:b457:3bac with SMTP id j8-20020a5d4528000000b00203b4573bacmr8601902wra.563.1647359291204;
        Tue, 15 Mar 2022 08:48:11 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id z5-20020a05600c0a0500b0037fa93193a8sm3169049wmp.44.2022.03.15.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 08:48:10 -0700 (PDT)
Date: Tue, 15 Mar 2022 15:48:08 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Craig Hesling <hesling@chromium.org>,
	Tom Hughes <tomhughes@chromium.org>,
	Alexandru M Stan <amstan@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add ChromeOS fingerprint binding
Message-ID: <YjC1OLsB8/JXLEzF@google.com>
References: <20220314232214.4183078-1-swboyd@chromium.org>
 <20220314232214.4183078-2-swboyd@chromium.org>
 <e7f9466e-03c9-7754-0dc6-a04823d1047a@canonical.com>
 <YjB0JOKysPpg2KGF@google.com>
 <9ec3c26a-3b85-4bea-5a5b-de9ac570cfca@canonical.com>
 <YjB46Sq3IwvgR8MB@google.com>
 <CAE-0n51uDh2Cf_wGpAVH1t=T0A1eTT=+KU3WMtxtyPL3kLDAdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE-0n51uDh2Cf_wGpAVH1t=T0A1eTT=+KU3WMtxtyPL3kLDAdA@mail.gmail.com>

On Tue, 15 Mar 2022, Stephen Boyd wrote:

> Quoting Lee Jones (2022-03-15 04:30:49)
> > On Tue, 15 Mar 2022, Krzysztof Kozlowski wrote:
> >
> > > On 15/03/2022 12:10, Lee Jones wrote:
> > > > On Tue, 15 Mar 2022, Krzysztof Kozlowski wrote:
> > > >
> > > >> On 15/03/2022 00:22, Stephen Boyd wrote:
> > > >>> Add a binding to describe the fingerprint processor found on Chromeboks
> > > >>> with a fingerprint sensor.
> > > >>>
> > > >>> Cc: Rob Herring <robh+dt@kernel.org>
> > > >>> Cc: <devicetree@vger.kernel.org>
> > > >>> Cc: Guenter Roeck <groeck@chromium.org>
> > > >>> Cc: Douglas Anderson <dianders@chromium.org>
> > > >>> Cc: Craig Hesling <hesling@chromium.org>
> > > >>> Cc: Tom Hughes <tomhughes@chromium.org>
> > > >>> Cc: Alexandru M Stan <amstan@chromium.org>
> > > >>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > >>> ---
> > > >>>  .../bindings/mfd/google,cros-ec-fp.yaml       | 89 +++++++++++++++++++
> > > >>>  1 file changed, 89 insertions(+)
> > > >>>  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml
> > > >>>
> > > >>> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml
> > > >>> new file mode 100644
> > > >>> index 000000000000..05d2b2b9b713
> > > >>> --- /dev/null
> > > >>> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml
> > > >>> @@ -0,0 +1,89 @@
> > > >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > >>> +%YAML 1.2
> > > >>> +---
> > > >>> +$id: http://devicetree.org/schemas/mfd/google,cros-ec-fp.yaml#
> > > >>
> > > >> Why is this in the MFD directory? Is it really a Multi Function Device?
> > > >> Description is rather opposite. You also did not CC MFD maintainer.
> > > >
> > > > A lot of the ChromeOS Embedded Controller support used to be located
> > > > in MFD.  There are still remnants, but most was moved to
> > > > drivers/platform IIRC.
> > > >
> > > > Please see: drivers/mfd/cros_ec_dev.c
> > >
> > > Yes, I know, that part is a MFD. But why the fingerprint controller part
> > > is MFD? To me it is closer to input device.
> >
> > It's tough to say from what I was sent above.
> >
> > But yes, sounds like it.
> >
> > We do not want any device 'functionality' in MFD ideally.
> >
> 
> I put it next to the existing cros-ec binding. The existing binding is
> there because of historical reasons as far as I know. Otherwise it
> didn't seem MFD related so I didn't Cc mfd maintainer/list. New file
> additions don't usually conflict with anything and this is in the
> bindings directory so the driver side maintainer would be picking up the
> binding.

That's not how it works unfortunately.

This file is located in the MFD bindings directory, so I would be
picking it up (if it ends up staying here).

Best to rely on `get_maintainer.pl` for this:

$ ./scripts/get_maintainer.pl -f Documentation/devicetree/bindings/mfd/
Lee Jones <lee.jones@linaro.org> (supporter:MULTIFUNCTION DEVICES (MFD))
Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
