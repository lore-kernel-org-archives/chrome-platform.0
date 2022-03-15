Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00DD23B5
	for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 15:38:50 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id w20-20020a4ae9f4000000b003243aa2c71aso4734988ooc.0
        for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=khkCTdEEAM7n3P/dQQhrb/HV8J+XYUq5hsAldrDxFGU=;
        b=Nqk0+w29LeOBvre06Fj4cSdo88alwYbpQrE+cuLmk5f/K9gWWBedX5rt1Gkw32yySC
         KeYyPDFEEkoNdevG4aBMWC9xva1lFOR4D4pD06KXSuzSoFcA8ZHr1eBaArzWozJDhcq+
         HrJBnQFdPnmY5Bds1loQdvMF+tunMSlaz/Yak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=khkCTdEEAM7n3P/dQQhrb/HV8J+XYUq5hsAldrDxFGU=;
        b=SjEyGl7gWwevolcSonTEC0aNbXkBpRbmRdz31f18akwXwiHCQlGjXkq5QQtIKeBrDg
         Qp4Ha21W/EFSTxmyedU75bxYR1VUtRgc+C+DxnwVNQ+lqteGTp4imlT3w1bWK0lmkQpL
         EIOJfzcz5ojQmRzbShmgQm3b24I+1/kK5By5Omq+xd2NkcUlRDeyVZKo7iplsr4mffkx
         WX6WRuuphfrdXuDrdBbQhOpqOwEd+A/GMnXs+EEcXLz2u23dTUE76bIHN6Dpmvj62uTd
         0ZuFIkGr3hdYpCP/Lmx5Mo91C5gGdiUUBoNQmlUb+fJ7na1vN0qCNQLhb/N9kG2c0xzY
         Vzhw==
X-Gm-Message-State: AOAM5315iTNZCYez++cei7qhoZHz+/jRX+ncVT3Q27ynCzepNd86TP41
	++22fJ+VTgO5CObQvV3Ziwiu77lRaUJQJg5UjtuANQ==
X-Google-Smtp-Source: ABdhPJws5kjn3G32odVO46AOfForEvxatvad2ia/nqZQ+oT27yL543G4RC11InOG91OxbM21TdaCswYoYg/ePOwb5wQ=
X-Received: by 2002:a05:6870:c0cb:b0:da:2bcc:aa09 with SMTP id
 e11-20020a056870c0cb00b000da2bccaa09mr1799556oad.63.1647358729890; Tue, 15
 Mar 2022 08:38:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Mar 2022 10:38:49 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YjADP+8mNnlkcGF7@google.com>
References: <20220314232214.4183078-1-swboyd@chromium.org> <20220314232214.4183078-2-swboyd@chromium.org>
 <YjADP+8mNnlkcGF7@google.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Mar 2022 10:38:49 -0500
Message-ID: <CAE-0n53waKNBBvxiK-Odff7fd+BEaWR1-3UyKSAK8dTzGksgbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add ChromeOS fingerprint binding
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Craig Hesling <hesling@chromium.org>, 
	Tom Hughes <tomhughes@chromium.org>, Alexandru M Stan <amstan@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Tzung-Bi Shih (2022-03-14 20:08:47)
> On Mon, Mar 14, 2022 at 04:22:13PM -0700, Stephen Boyd wrote:
> > Add a binding to describe the fingerprint processor found on Chromeboks
> > with a fingerprint sensor.
>
> Nit: s/Chromeboks/Chromebooks/.
>
> > +properties:
> > +  compatible:
> > +    const: google,cros-ec-fp
>
> Not sure if it could make sense for FPS with other interfaces: would
> cros-ec-fp-spi or cros-ec-spi-fp be a better name?  I am wondering because
> there are cros-ec-spi specific properties "google,cros-ec-spi-pre-delay" and
> "google,cros-ec-spi-msg-delay" in the binding.

The delays are optional properties so I don't see much value in encoding
the bus type into the compatible string. It would only help us find
properties that are unused on a bus that isn't SPI. Let's not
overcomplicate things.

>
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: reset signal (active low).
> > +
> > +  boot0-gpios:
> > +    maxItems: 1
> > +    description: boot signal (low for normal boot; high for bootloader).
> > +
> > +  vdd-supply:
> > +    description: Power supply for the fingerprint controller.
>
> To be consistent: s/Power/power/.

I fixed the other two, thanks!
