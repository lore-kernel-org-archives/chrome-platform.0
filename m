Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B89B23B5
	for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 15:50:35 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id x26-20020a4a9b9a000000b003211029e80fso24864800ooj.5
        for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 08:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=I4c51xsdjxSyFom4STgtqxq6o6AKdTW8OLe7O5/jVnI=;
        b=RdbsXMNlP8wYdG7quqOUWkNI912I8J8v2dI1CpPrFRzvPMlqWvYUjRZcc3CPAOO29S
         Yge/Doop6f6uEsSFKCqhOIsjsvZ/KqP+eWOLjwNC9rSDGozrfKDRjbcvxa5z0pCPEIve
         c5NtXIfspKzVJ4hupGwMTdkiQ23FjnfxTBn9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=I4c51xsdjxSyFom4STgtqxq6o6AKdTW8OLe7O5/jVnI=;
        b=U03bHHsSYM85EA8lOwgxJf1qpcZWjb/mYpj8NEbxECmS07L9azKzrLhq99PBfHH3c8
         N760Oi0OSmF52+CRjRn1PGEYqr6+k/IlWh19ZcoDQGpu/O8hDl0az+jQuqw+XThDx9V1
         a7hg0utvXZRESoTocLUWywx6fGeYBNO3LPXvXimc2aF3fqKyfCoFHAkKXk+yFgw48N89
         //JLMMysizaCKt6ZYHDuGaG0OPfJ8BmCraqI5NblJBQ8x7HJdmBYcFKfiFEayKGusctJ
         Cse1DABzXL2NzVvodM+A4R6BzCXpd0IW6tfVN0R77m/hj1rPBdXFkWHvnJQVX9iMyXpe
         WaHg==
X-Gm-Message-State: AOAM531YE8syRWFITw885IJHe4A8ZVLDhdvYP4diVzBJwYPlOIWQVV8T
	PxVYfSV71Q5xhT/W+O00pEFmqUaInR0qMgz01IA3hg==
X-Google-Smtp-Source: ABdhPJyHK2Q+ikMVle/mFHZsw86q2VaSnh4TIjabq9UlQBoV+QZTX64BB1/3Nt6dBd6/Mt4xS0Vdwi/ekXUmIzZbJxQ=
X-Received: by 2002:a05:6870:c0cb:b0:da:2bcc:aa09 with SMTP id
 e11-20020a056870c0cb00b000da2bccaa09mr1821164oad.63.1647359435184; Tue, 15
 Mar 2022 08:50:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Mar 2022 10:50:34 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAHNYxRwFYBbgxUqz79jYXbDxSd-r+NdHWQPucEyuNK83U577xw@mail.gmail.com>
References: <20220314232214.4183078-1-swboyd@chromium.org> <20220314232214.4183078-2-swboyd@chromium.org>
 <CAHNYxRwFYBbgxUqz79jYXbDxSd-r+NdHWQPucEyuNK83U577xw@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Mar 2022 10:50:34 -0500
Message-ID: <CAE-0n50A2yrSbQJA8EMum3AoLf+w263ddFh6sA5d+tfMMMkarA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add ChromeOS fingerprint binding
To: Alexandru M Stan <amstan@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Craig Hesling <hesling@chromium.org>, 
	Tom Hughes <tomhughes@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Alexandru M Stan (2022-03-14 17:23:38)
> On Mon, Mar 14, 2022 at 4:22 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > +        compatible = "google,cros-ec-fp";
> > +        reg = <0>;
> > +        interrupt-parent = <&gpio_controller>;
> > +        interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> > +        spi-max-frequency = <3000000>;
> > +        google,cros-ec-spi-msg-delay = <37>;
> > +        google,cros-ec-spi-pre-delay = <5>;
> > +        reset-gpios = <&gpio_controller 5 GPIO_ACTIVE_LOW>;
> > +        boot0-gpios = <&gpio_controller 10 GPIO_ACTIVE_LOW>;
> This should say GPIO_ACTIVE_HIGH, since there's no inverting going on
> either with a real inverter, or the convention (of 'N' being in the
> pin name).
>
> It might be easier to reason about if there's no invesion going for this signal.
>
> Consider it like an enum instead of a verb (unlike active_low
> reset-gpios which can be considered: in reset if it's set):
>
> enum boot0 {
>         normal = 0,
>         bootloader = 1,
> };

Ok got it! I have in my notes that physically high line means normal
boot mode and physically low is bootloader mode. I confused myself. I'll
fix this.
