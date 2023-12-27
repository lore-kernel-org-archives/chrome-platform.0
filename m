Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C984481AD
	for <chrome-platform@lists.linux.dev>; Wed, 27 Dec 2023 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L80hWTmd"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5e82f502a4cso34614447b3.0
        for <chrome-platform@lists.linux.dev>; Wed, 27 Dec 2023 13:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703712567; x=1704317367; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m7oxoJfsTMUP9iwmnTMSD6RQtzTxmt4yZyVBW24Hw70=;
        b=L80hWTmd69q0LCmVuGBvwROFXEpJlQI6M1l3Cjo2aUbz4RaG/5jEclKO/cLCKPr4QY
         29V5cFm1BlkvnD0bBSOwK84KCaxTGIJqHIa/RJEDiaXMnVhnm8nSEdcSgYNX4d8Y33Cq
         V9fs+K2mc6GYqpMG6s/u5IwyTcDQwH3Kfp1Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703712567; x=1704317367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7oxoJfsTMUP9iwmnTMSD6RQtzTxmt4yZyVBW24Hw70=;
        b=uq9+gnkFsSOnNktoysLGFlA4Tz0kimXQMGAwbXrVybBwSzwGwpBh7JZSbwADcUcr99
         ubejL0hE/3rsoKib2LN/muz/f0q/GKPZXJAUNOKqHnFevagvQBCNhtRfTsah/ps2AyNl
         4VuomtvbBfGfpL6nnGeDvk/ITM3TAYI0vEv2m8HSRNjI8qwUWMOriueJd+WUQYL6SpB/
         LPhZRKOnZqnUbGm9EzSprkmEq6ejx+HZa0b0aNCa5NRKHLdgcO2/6MiAvjUV+joZBHk9
         3DrsCGy2tw5TX5ie0QDzb4LEPYN3eXLgIaczM0rrKMjV6L2TLBVqR2zLIlL79q2YPEyX
         VOhA==
X-Gm-Message-State: AOJu0Yyl9YUNsxczECTwIvURdZDNp/mvljZc7uiyb66hNcTRFH3eDuo8
	HFOAyg6U+cLkGmKedsePjowPaXQxAjnzz9YUvk77lrCx/xW8
X-Google-Smtp-Source: AGHT+IHM6O2Ltk6OJKM1EuDk73I1Qwup3zWTsOzcOQ48Fb9Khu+LzhrvXXJA3vjtDJm/IZ2A1NJYfGfYQGsSn2lyOkU=
X-Received: by 2002:a05:690c:4606:b0:5ea:5340:fb0e with SMTP id
 gw6-20020a05690c460600b005ea5340fb0emr2233415ywb.4.1703712567158; Wed, 27 Dec
 2023 13:29:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231226192149.1830592-1-markhas@chromium.org>
 <20231226122113.v3.24.Ieee574a0e94fbaae01fd6883ffe2ceeb98d7df28@changeid> <ZYxgQn8L7ENkc0AJ@smile.fi.intel.com>
In-Reply-To: <ZYxgQn8L7ENkc0AJ@smile.fi.intel.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Wed, 27 Dec 2023 14:29:16 -0700
Message-ID: <CANg-bXAN-DOZNsea7NNO4bFoZ6un44_upkseynS_dg5Odg6Whg@mail.gmail.com>
Subject: Re: [PATCH v3 24/24] platform/chrome: cros_ec: Use PM subsystem to
 manage wakeirq
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Raul Rangel <rrangel@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Bhanu Prakash Maiya <bhanumaiya@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Guenter Roeck <groeck@chromium.org>, Lee Jones <lee@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Rob Barnes <robbarnes@google.com>, 
	Stephen Boyd <swboyd@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > -     irq = platform_get_irq_optional(pdev, 0);
> > -     if (irq > 0)
> > +     irq = platform_get_irq_resource_optional(pdev, 0, &irqres);
> > +     if (irq > 0) {
> >               ec_dev->irq = irq;
> > -     else if (irq != -ENXIO) {
> > +             if (should_force_irq_wake_capable())
> > +                     ec_dev->irq_wake = true;
> > +             else
> > +                     ec_dev->irq_wake = irqres.flags & IORESOURCE_IRQ_WAKECAPABLE;
> > +     } else if (irq != -ENXIO) {
> >               dev_err(dev, "couldn't retrieve IRQ number (%d)\n", irq);
> >               return irq;
> >       }
>
> Still I do not like ambiguity behind irq > 0 vs. irqres.start.
>
> For this, and if needed others, return plain error.
> Seems I gave the tag for the previous patch, consider
> that tag conditional (it seems I missed this).

What "others" do you mean? Modify platform_get_irq_resource_optional()
to return success/err? Or do you mean to modify all irq resource based
functions? of_irq_to_resource() already existed and returns the irq
number on success. Modifying it would mean updating all references to
it, in addition to modifying the fwnode abstraction layer (and its
references). I'm open to modifying
platform_get_irq_resource_optional(), but would like to avoid blowing
up this patch train any further.

> ...
>
> >       u16 proto_version;
> >       void *priv;
> >       int irq;
> > +     bool irq_wake;
> >       u8 *din;
> >       u8 *dout;
> >       int din_size;
> >       int dout_size;
> > -     bool wake_enabled;
> >       bool suspended;
> >       int (*cmd_xfer)(struct cros_ec_device *ec,
> >                       struct cros_ec_command *msg);
>
> Have you run pahole on this (before and after)?

Yes I did. The structure is not fully optimized, but this change keps
the overall size unchanged (328 bytes).
