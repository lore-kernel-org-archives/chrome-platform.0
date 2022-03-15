Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F441FB8
	for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 11:30:53 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r6so28054774wrr.2
        for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 04:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EYYuHyt2hfMuLYpzRmaFvZ7rGRg3CV+dVi1SACxyN1g=;
        b=J+LJeudlY3t+gwvfFTXzkdnQpLh2Vj8tw00WlB0O9qqa3aPI4alG1186vge0CJ1IOV
         tpITaGr5NwuM2R+iv9cPpweCc82A23MBdrOVmLYETVIl0SV17Zr4mMdY5bpAMzDa9f8O
         tAJyITYew27Svl8gPkJpzVpPuzyJMw5yxjWYl86u8b4reveTiktUBjkpXPhDP6NWf90T
         GHMBosdezWzCAav4lH3BWQB/bR5PYByglm4MZjDqSk/2dYbYy1PizAtYRyuc1HWV7OFe
         xWXMuaxCQUaQthNaKz59LSa7/1XXgTNRhvn88YxhxerCHMDcw708MaXnfYH0aU/ZmmeR
         q2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EYYuHyt2hfMuLYpzRmaFvZ7rGRg3CV+dVi1SACxyN1g=;
        b=INr28BLm6B0A+8Fe2apn/7NseX1pY94qeGnWalP6sq2/ieiJuAxufONG82ysUkH7iu
         CoMtqiQ7QwOffslfHadgiFG812DGQaVgnksvqgz9LOMab2Ckfz08FcmDZAMXozrowI1R
         ZmF0zzRL3Wz/xi8X2OuoHRDWi7qaJYTJ2S/nBBGSXOfh5zfdeU62kO0UJsVoR6aokyny
         x5DYmA53D1r1Ni4id9oWnq7rn7AyTXfmLN8HXolhFq3lN1My8xxDAk4eZaAzyWuGgWej
         LSjwZSbYCZQ9DTlFniM7a+55LTEhMaVpmPFwdeCYHmkcV/4Ab+bc0u7oB7WV4Q5XZIrF
         RYPA==
X-Gm-Message-State: AOAM533mr7f/224UdE9YdGAb0k7rcdTFAy3htzptrzcFLmvyihkzFR4x
	ElFqzXMoj0b1SdM7r5eYBNZkiw==
X-Google-Smtp-Source: ABdhPJz9/IHvVKOJyJQXyPB3LrlixMC2NTiqc9RfTL3qZ+GtdUt7xPPjp89EHJ0DeLXO6RZC/i52xw==
X-Received: by 2002:a5d:6c62:0:b0:203:9579:c3b0 with SMTP id r2-20020a5d6c62000000b002039579c3b0mr14973421wrz.139.1647343851982;
        Tue, 15 Mar 2022 04:30:51 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id o41-20020a05600c512900b00389d8c3e2b9sm2143181wms.15.2022.03.15.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 04:30:51 -0700 (PDT)
Date: Tue, 15 Mar 2022 11:30:49 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Benson Leung <bleung@chromium.org>,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Craig Hesling <hesling@chromium.org>,
	Tom Hughes <tomhughes@chromium.org>,
	Alexandru M Stan <amstan@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add ChromeOS fingerprint binding
Message-ID: <YjB46Sq3IwvgR8MB@google.com>
References: <20220314232214.4183078-1-swboyd@chromium.org>
 <20220314232214.4183078-2-swboyd@chromium.org>
 <e7f9466e-03c9-7754-0dc6-a04823d1047a@canonical.com>
 <YjB0JOKysPpg2KGF@google.com>
 <9ec3c26a-3b85-4bea-5a5b-de9ac570cfca@canonical.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ec3c26a-3b85-4bea-5a5b-de9ac570cfca@canonical.com>

On Tue, 15 Mar 2022, Krzysztof Kozlowski wrote:

> On 15/03/2022 12:10, Lee Jones wrote:
> > On Tue, 15 Mar 2022, Krzysztof Kozlowski wrote:
> > 
> >> On 15/03/2022 00:22, Stephen Boyd wrote:
> >>> Add a binding to describe the fingerprint processor found on Chromeboks
> >>> with a fingerprint sensor.
> >>>
> >>> Cc: Rob Herring <robh+dt@kernel.org>
> >>> Cc: <devicetree@vger.kernel.org>
> >>> Cc: Guenter Roeck <groeck@chromium.org>
> >>> Cc: Douglas Anderson <dianders@chromium.org>
> >>> Cc: Craig Hesling <hesling@chromium.org>
> >>> Cc: Tom Hughes <tomhughes@chromium.org>
> >>> Cc: Alexandru M Stan <amstan@chromium.org>
> >>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >>> ---
> >>>  .../bindings/mfd/google,cros-ec-fp.yaml       | 89 +++++++++++++++++++
> >>>  1 file changed, 89 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml
> >>> new file mode 100644
> >>> index 000000000000..05d2b2b9b713
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml
> >>> @@ -0,0 +1,89 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/mfd/google,cros-ec-fp.yaml#
> >>
> >> Why is this in the MFD directory? Is it really a Multi Function Device?
> >> Description is rather opposite. You also did not CC MFD maintainer.
> > 
> > A lot of the ChromeOS Embedded Controller support used to be located
> > in MFD.  There are still remnants, but most was moved to
> > drivers/platform IIRC.
> > 
> > Please see: drivers/mfd/cros_ec_dev.c
> 
> Yes, I know, that part is a MFD. But why the fingerprint controller part
> is MFD? To me it is closer to input device.

It's tough to say from what I was sent above.

But yes, sounds like it.

We do not want any device 'functionality' in MFD ideally.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
