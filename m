Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CE71382
	for <chrome-platform@lists.linux.dev>; Mon, 16 May 2022 19:32:25 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-edf9ddb312so21507049fac.8
        for <chrome-platform@lists.linux.dev>; Mon, 16 May 2022 12:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=J76YW6Wdlh5XkWvWlzC9gchLSjC+e1zZeLVaSHsN2OQ=;
        b=d9CQktVULUaK6nXZ/QzkDqI6+WbJO6m8jOyWYhqDLe6AiSL43teR7zxEi4j/IT7G28
         i0FvQpprMbKCLYaRtRu6xtCLzfxz4D+9LtFXrKoj5wr4IU1XrPGKgaW1ckZhsBjDGdDf
         NM0oeFrayV7Db9eD5+OCdlhAGV0efJ6ydoh70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=J76YW6Wdlh5XkWvWlzC9gchLSjC+e1zZeLVaSHsN2OQ=;
        b=r0dM4DXF5ep8xjgIZx77sPhQ9WxKZerTEnwhSNum6EJCEPlR4YZHok1MG5LtcalA8v
         p6edS9Xp1nzTaGeGDQ6ae44nerLhNxZA43DCk6OQvj+WSs7mfGEk/o3FYO6qGpKjJ2W3
         GflLCK5sVwgO5AeB3epDSOQS9CaXzD2vjuPKvNa+fyNDGCeG2GM+ezAEG+IfjfOddPJ5
         JQxag4TOI+PSV9Mtz1lNamcLF00sICL0CbfsxQSA+LtDEzix/+4zI1kYkn8dd/FckBth
         Rrn5AjRqbecIBWx/Cf1JpS4Bc7UaidLoPfrf4BtXcWpj7dfd4pn/uPZyc2mVUdVzjHb0
         bvVA==
X-Gm-Message-State: AOAM532GL0RlhVNvQhnxQEaDubJ19/i+o6yVApLzD8uHkyup0HZUyk4t
	Oei/47j/aLfBZnmP//1tnIGdhzVh2axUiyQqDLrp+g==
X-Google-Smtp-Source: ABdhPJzJI92I4I96rEOhysGBJGD/K/e+0SB9aptCslRQ20O4rAnvh5bNk0UoYZG3ZWuAynzOHNF45aylQc9TEohySps=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr880663oap.193.1652729544662; Mon, 16
 May 2022 12:32:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 May 2022 12:32:24 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XfmU1GhXZPvUMoh9dqs8iei6s+0gu6Mve-aQ33A+7m3g@mail.gmail.com>
References: <20220512013921.164637-1-swboyd@chromium.org> <20220512013921.164637-3-swboyd@chromium.org>
 <CAD=FV=XfmU1GhXZPvUMoh9dqs8iei6s+0gu6Mve-aQ33A+7m3g@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 16 May 2022 12:32:24 -0700
Message-ID: <CAE-0n53nqrSmxZsnReE=yVzN0OkGw8BaNqFxX6mcRkJyxXyyJg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: cros-ec: Reorganize property availability
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, chrome-platform@lists.linux.dev, 
	Guenter Roeck <groeck@chromium.org>, Craig Hesling <hesling@chromium.org>, 
	Tom Hughes <tomhughes@chromium.org>, Alexandru M Stan <amstan@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Doug Anderson (2022-05-12 16:44:44)
> On Wed, May 11, 2022 at 6:39 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          not:
> > +            contains:
> > +              const: google,cros-ec-rpmsg
> > +    then:
> > +      properties:
> > +        mediatek,rpmsg-name: false
> > +
> > +      required:
> > +        - reg
> > +        - interrupts
>
> Is it worth having an "else" clause here? to explicitly make
> "mediatek,rpmsg-name" required for mediatek?

I don't know if mediatek,rpmsg-name is required for a generic
google,cros-ec-rpmsg. I would guess it isn't, because it's a vendor
prefixed property. Maybe it could look at the parent node property to
see that it is inside a mediatek remoteproc node but I'd rather leave
that to future work.

>
> In any case, this seems right from my (albeit) limited yaml knowledge
> and seems like an improvement.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!
