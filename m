Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF85D33CE
	for <chrome-platform@lists.linux.dev>; Tue,  3 May 2022 19:00:34 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id s131so19146430oie.1
        for <chrome-platform@lists.linux.dev>; Tue, 03 May 2022 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=sTwtLayt8lSmwFDwuP2xr78Bezhh6psTt6A0s7o6o54=;
        b=ZL64jD3/KfRtxkUsZsMBA2i8ivzG5MZTHTOoiIVfGr4Ec4kMCqf5T5NaRNtr/0JDVI
         TmM+l93APN8yXga262FNK0V1PE1Z9dXb5uWY5SVOcyZAnD+K9ADawpGdHw+9U3cAiT7a
         JD95WlfPU1wAkrstXIwAhfu+Y3QrkiO7kC7kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=sTwtLayt8lSmwFDwuP2xr78Bezhh6psTt6A0s7o6o54=;
        b=4vI5NAtUHb2SQHZU00u76hW510pK2suFSD+ySA2LdAWE4ggAHxnUMfIlJfikvoFe9z
         WUEiDAH+LyCQb07QpwdgKst9iyzvP3ISX/TUjSUiMj6chnn1XNvI6KmYtryOzxs/qiis
         vHWLBcWEoHt5j3Xc1CV5Y9FIaAKNUX696AA8vqldO8lupAN+GNf74LEgaQVKwD5Miquf
         7HcCjiZcI8DsNcw8MepRbINo8Pdgu1dQAn4QryC7sjEyktc6CmWrA20CXeRMC+ZL1Bv5
         TiilEp2UXQoUHnP2cUr4VIUhfbvDo1+bWVAzzFzA6+RBdWMZXKt/CVeLUr/O9ntLq3x7
         Z84A==
X-Gm-Message-State: AOAM531hz3Z1uUOsu9O32WuqIR2OJMr29yLjl6AvcZjDciFhyMjfCkz5
	Aspm1pvLuvXsSmLi37CqoP9cXABjZN+2iEQ0v2Pi7Q==
X-Google-Smtp-Source: ABdhPJyoZVlr00aiP72F5GUeMpviqWaBNJ9GclCz9NF9x+6N/PBIUr0SmkirKve0fuXCbNOFIVsJBrojpRhd5w1GKGs=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr2540169oif.63.1651604434059; Tue, 03
 May 2022 12:00:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 May 2022 15:00:33 -0400
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2280875f-fbd8-0dfd-5a0a-1d7fceb856e4@linaro.org>
References: <20220503042242.3597561-1-swboyd@chromium.org> <20220503042242.3597561-2-swboyd@chromium.org>
 <2280875f-fbd8-0dfd-5a0a-1d7fceb856e4@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 3 May 2022 15:00:33 -0400
Message-ID: <CAE-0n50oGX8jBzfNjYFj01nZkuYbk6ZPsqDj89-zqxHhib=vaw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: google,cros-ec-keyb: Introduce
 switches only compatible
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	"Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Krzysztof Kozlowski (2022-05-03 08:42:39)
> On 03/05/2022 06:22, Stephen Boyd wrote:
> > If the ChromeOS board is a detachable, this cros-ec-keyb device won't
> > have a matrix keyboard but it may have some button switches, e.g. volume
> > buttons and power buttons. The driver still registers a keyboard though
> > and that leads to userspace confusion around where the keyboard is.
>
> (...)
>
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: google,cros-ec-keyb
> > +then:
> > +  allOf:
> > +    - $ref: "/schemas/input/matrix-keymap.yaml#"
> > +  required:
> > +    - keypad,num-rows
> > +    - keypad,num-columns
> > +    - linux,keymap
>
> else:
>   properties:
>     function-row-phsymap: false
>     google,needs-ghost-filter: false
>
> Because these are not valid for the non-matrix-keyboard case, right?
>

Yes, but they also depend on linux,keymap so they're not possible to
set because the matrix-keymap.yaml schema defines linux,keymap and that
is only included if google,cros-ec-keyb is present.
