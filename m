Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D882EB07
	for <chrome-platform@lists.linux.dev>; Fri, 22 Dec 2023 22:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SyXZ+xKS"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5d33574f64eso24025757b3.3
        for <chrome-platform@lists.linux.dev>; Fri, 22 Dec 2023 14:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703283705; x=1703888505; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G4TYuyMVVFBv/5d5uEIDyQ93KWASjprBwJ7UzWDp5l4=;
        b=SyXZ+xKSlpwqQXfeBImHH5+nxZwG8B2oKOc2C7phnKilgD2c0FOqHOI5v/bxDPxn7N
         2z4/gznSfpN1KkmqTgPwzkHSrBlC5TTpbqbDbBHumxg2+xJmdJhzpupnW8OeAY5rmGdg
         xTghHjgAZ2P5nwIhCt5++ZP+5SZL1CRmh1r3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703283705; x=1703888505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4TYuyMVVFBv/5d5uEIDyQ93KWASjprBwJ7UzWDp5l4=;
        b=ZikE7eKXfLJonDdRo1wrxTaCrY69agDeoVQ6MK7Ika6aR2VQPWB4v3l1lEwIHHkxPr
         WeRTkjc+Yyp4H6AX2EwdhQzj/YgjXViw0pFtoJpaW6Vkf4yFQmtXjNU1vTUmkNxozB4i
         PN0Z+3lc+C6ovMBxHseTuaM8r4iAU3fMWCDkiL0Lm2SL3O83/sVMHgyq2ceQd7SW0NDC
         qcVmjzR1/HWZ53ElsQ1KLjraOov+bWW008BLn6WYjObBDE6DEFDPk//0Tt3O2PMCJH4l
         WoWQLNVjSQoN3fbKlyKAx45Oy5Hk81OXRQTe42z3S8zxhDVBUGHsSKBsLzXWcXJMe1nR
         agNw==
X-Gm-Message-State: AOJu0Ywcizc45JkzX+eNyTKdW232oMF73eE1kWHwUFwPbk1lTHf47GMl
	x7O5ATMhZOOKjbnu1pf0wQF7CQhyamliHv2sxYNXHvYaO94w
X-Google-Smtp-Source: AGHT+IGkjz6Odo4CLWpg8zVwNYsU50f9HSYjCqJ/gKsU7KxypayB+myzZoHbRluSbDRI6RfCfovlRKor0RUO0yKux0Y=
X-Received: by 2002:a0d:c383:0:b0:5d8:e267:78e5 with SMTP id
 f125-20020a0dc383000000b005d8e26778e5mr2182094ywd.61.1703283705579; Fri, 22
 Dec 2023 14:21:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231220235459.2965548-1-markhas@chromium.org>
 <20231220165423.v2.22.Ieee574a0e94fbaae01fd6883ffe2ceeb98d7df28@changeid> <ZYRdjHVgES1odZAQ@smile.fi.intel.com>
In-Reply-To: <ZYRdjHVgES1odZAQ@smile.fi.intel.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Fri, 22 Dec 2023 15:21:34 -0700
Message-ID: <CANg-bXAgiMB2Q_fHOc_BBm4pRXdVveu-Rs6uZrLCAjkzaBYm4w@mail.gmail.com>
Subject: Re: [PATCH v2 22/22] platform/chrome: cros_ec: Use PM subsystem to
 manage wakeirq
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Raul Rangel <rrangel@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Benson Leung <bleung@chromium.org>, Bhanu Prakash Maiya <bhanumaiya@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Guenter Roeck <groeck@chromium.org>, Lee Jones <lee@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Rob Barnes <robbarnes@google.com>, 
	Stephen Boyd <swboyd@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > +     irq = platform_get_irq_resource_optional(pdev, 0, &irqres);
> > +     if (irq > 0) {
> >               ec_dev->irq = irq;
> > -     else if (irq != -ENXIO) {
> > +             if (cros_ec_should_force_irq_wake_capable())
> > +                     irq_wake = true;
> > +             else
> > +                     irq_wake = irqres.flags & IORESOURCE_IRQ_WAKECAPABLE;
> > +             dev_dbg(dev, "IRQ: %i, wake_capable: %i\n", irq, irq_wake);
> > +     } else if (irq != -ENXIO) {
> >               dev_err(dev, "couldn't retrieve IRQ number (%d)\n", irq);
> >               return irq;
> >       }
>
> Yeah, this is confusing now. Which one should I trust more: irq or irqres.start?
> What is the point to have irqres with this duplication?

irqres is needed to pull the wake capability of the irq. I agree tha
irq and irqres.start should have the same information. I chose irq
because it's more obvious what it represents over irqres.start. It's
also more concise.

>
> ...
>
> > -             dev_err(dev, "couldn't register ec_dev (%d)\n", ret);
> > +             dev_err_probe(dev, ret, "couldn't register ec_dev (%d)\n", ret);
> >               return ret;
>
>                 return dev_err_probe(...);
>
> ...
>
> > +                     dev_err_probe(dev, ret, "Failed to init device for wakeup");
> > +                     return ret;
>

Tzung-Bi pointed out there are other areas of the driver that just use
dev_err() in the probe path. My vote is to drop the use of
dev_err_probe() to stay consistent with what exists. A separate patch
can be sent to modify the statements to use the
dev_err_probe() variant.

>
> ...
>
> > +     if (!np)
> > +             return;
>
> Why do you need this now?

It felt intuitive to return early from cros_ec_spi_dt_probe() if no
device node exists. This does not fix any known bugs though. Dropping
as irrelevant.

> >       ret = of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val);
> >       if (!ret)
> >               ec_spi->end_of_msg_delay = val;
>
> > +     if (ec_dev->irq > 0 && of_property_read_bool(np, "wakeup-source")) {
> > +             ec_spi->irq_wake = true;
> > +             dev_dbg(&spi->dev, "IRQ: %i, wake_capable: %i\n", ec_dev->irq, ec_spi->irq_wake);
> > +     }
>
>         if (ret)
>                 return;
>
>         ec_spi->irq_wake = of_property_read_bool(np, "wakeup-source"));

The other interface drivers only analyze irq_wake if an irq exists. I
think that makes sense and would like to stay consistent.
Thinking:
ec_spi->irq_wake = spi->irq > 0 && of_property_read_bool(np, "wakeup-source"));

>         dev_dbg(&spi->dev, "IRQ: %i, wake_capable: %s\n", ec_dev->irq, str_yes_no(ec_spi->irq_wake));

> ...
>
> > @@ -78,6 +80,7 @@ struct cros_ec_uart {
> >       u32 baudrate;
> >       u8 flowcontrol;
> >       u32 irq;
> > +     bool irq_wake;
> >       struct response_info response;
> >  };
>
> Run `pahole` and amend respectively to avoid wasting memory.

No savings to be had, but we can defrag the holes from sizes 3 and 3,
to 2 and 4 by moving irq_wake above irq.

pahole --reorganize -C cros_ec_uart cros_ec_uart.o

struct cros_ec_uart {
        struct serdev_device *     serdev;               /*     0     8 */
        u32                        baudrate;             /*     8     4 */
        u8                         flowcontrol;          /*    12     1 */
        bool                       irq_wake;             /*    13     1 */

        /* XXX 2 bytes hole, try to pack */

        u32                        irq;                  /*    16     4 */

        /* XXX 4 bytes hole, try to pack */

        struct response_info       response;             /*    24    64 */

        /* size: 88, cachelines: 2, members: 6 */
        /* sum members: 82, holes: 2, sum holes: 6 */
        /* last cacheline: 24 bytes */
};

> > +     dev_dbg(dev, "IRQ: %i, wake_capable: %i\n", ec_uart->irq, ec_uart->irq_wake);
>
> str_yes_no() from string_choices.h?

SGTM
