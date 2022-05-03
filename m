Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9323204
	for <chrome-platform@lists.linux.dev>; Tue,  3 May 2022 15:46:39 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id z26so19371957iot.8
        for <chrome-platform@lists.linux.dev>; Tue, 03 May 2022 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DmEYqT+9Ka7njk/TwR9G+Gdm+tqkABc7dcTcU/7kYZY=;
        b=IPLzFJvRDQ9r0mh8TcbmuNu1p2ZCdA+ba9sSjOT1tZkhVfsHcEFr2+YTCL1iNWL6fI
         2UmCRjoVIb5YpVcAKV+QVUbX4nNZeBM0yzyPY5NKn8pVRSa1OAvQJTqAPGL6I1tR9/7p
         o7JiIwX99eJ9jk7iN47UV8C2OJuigQEUnteBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DmEYqT+9Ka7njk/TwR9G+Gdm+tqkABc7dcTcU/7kYZY=;
        b=loWNbMvR308fhx6GNkghQmJ1ry/YkjCx6p8hmMCgwHpw4HP6FzHkRh4gIsJ/gbhtMb
         wyH0SYW8XhE+VqQBnCfbBhRExkqoshic0gJLbs5rD+c3murYNjoCdXeST/r9tF4D3Zu4
         10WgT18ZFrzuyfXs5KUYn2XH4o+BrF0QdnlxBJ1mmSRpfYgeTK6zyKR5ierZO8GTsDoC
         vD6YlEH+t6obGVbbpSjqjo1NhNJZoFcxEkPbkxM/1o7Zzjy6drlFev5IVjO9fpKN/tkh
         pA2VdEQv+rJNhUBOc0AW8nvl1LhIzpqfKWzq2uZBUIZSUZS9a6oLXIl/K23A5ZyEXIaF
         QEyg==
X-Gm-Message-State: AOAM532jR43bCrraKKaO2W4FRJI//a4jC46FlTWReVwMbw+iEfWL0hs0
	ZoZDKE9xbixzjEFnynuU3k0fEnPr7HzO6Iez
X-Google-Smtp-Source: ABdhPJwbzzanq0HAO12P36R6BhOj7qHk88CYfCBc9wop8l2zcQzqudd15CXQb6N3yD1wjjyoXTMhYg==
X-Received: by 2002:a05:6602:2a43:b0:65a:9e8c:7f2 with SMTP id k3-20020a0566022a4300b0065a9e8c07f2mr112474iov.191.1651592798499;
        Tue, 03 May 2022 08:46:38 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id v7-20020a02b907000000b0032b3cfba0b3sm3973663jan.123.2022.05.03.08.46.36
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 08:46:36 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id d3so9978779ilr.10
        for <chrome-platform@lists.linux.dev>; Tue, 03 May 2022 08:46:36 -0700 (PDT)
X-Received: by 2002:a92:c263:0:b0:2cf:c0e:bd81 with SMTP id
 h3-20020a92c263000000b002cf0c0ebd81mr4741427ild.220.1651592796090; Tue, 03
 May 2022 08:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220503042242.3597561-1-swboyd@chromium.org> <20220503042242.3597561-2-swboyd@chromium.org>
 <2280875f-fbd8-0dfd-5a0a-1d7fceb856e4@linaro.org>
In-Reply-To: <2280875f-fbd8-0dfd-5a0a-1d7fceb856e4@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 May 2022 08:46:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UEBi9dctmhaAi1z+c+Sj5gtcRrc3FRW294T55dTiAidQ@mail.gmail.com>
Message-ID: <CAD=FV=UEBi9dctmhaAi1z+c+Sj5gtcRrc3FRW294T55dTiAidQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: google,cros-ec-keyb: Introduce
 switches only compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>, patches@lists.linux.dev, 
	chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	"Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, May 3, 2022 at 8:42 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
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

Isn't that implicit because this file has `unevaluatedProperties: false` ?

-Doug
