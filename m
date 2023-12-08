Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CAA22EF2
	for <chrome-platform@lists.linux.dev>; Fri,  8 Dec 2023 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b9d2b8c3c6so1388693b6e.1
        for <chrome-platform@lists.linux.dev>; Fri, 08 Dec 2023 07:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048217; x=1702653017;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNnSwjzfk0DFwMUnASYe+Mep7H717D8Hg3L4xcCwxL4=;
        b=TL7/H5pr96EzxD99CkhFrCerY3E4SmX449VBIny0ehLvmNPLI67FBNAw8diQCfrF4N
         Fgo6GcYF/Y3+q4nIzd5qfnTaF8gEDQkOrPgIV5ofdhICMP53wWyw+davZAgSsHxW3j57
         S5tCAqfLx9OQI+smYoWkBuYUSuVzM56UFoej2BE0VIAPhowTw9o5hrKqdFo4MxV7fJmc
         UoPW0Dl22rRl1kSccdefqhPUQp4Vem3SDIDfJmKsba3FMROOJ+xMrA9RsPhuctjY38iw
         iQZh430kLhof2AAUYkkiWQox69tE50lckObQo0f3j3frbcd3ug+0EV3vDCTpSG8YVEm7
         ga4w==
X-Gm-Message-State: AOJu0YwJz+8xQ7+A0nGFVL9hPpqstTPAMSnOVY3ze9ugLBgTAoTQr7sY
	jCkESP/i1hoo90TbIIHwiw==
X-Google-Smtp-Source: AGHT+IEvVmbu2+Qv9wFJy8R9H8r5dTeownvX+CKH+WYzlbAzevvw6b0vu0w5WzVXyWLw9sofpqWUuA==
X-Received: by 2002:a05:6808:d4d:b0:3b8:b063:8258 with SMTP id w13-20020a0568080d4d00b003b8b0638258mr172675oik.90.1702048217115;
        Fri, 08 Dec 2023 07:10:17 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 14-20020aca280e000000b003b8b3bdeb6bsm348309oix.30.2023.12.08.07.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:10:16 -0800 (PST)
Received: (nullmailer pid 1354509 invoked by uid 1000);
	Fri, 08 Dec 2023 15:10:11 -0000
Date: Fri, 8 Dec 2023 09:10:11 -0600
From: Rob Herring <robh@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v3 2/5] i2c: of: Introduce component probe function
Message-ID: <20231208151011.GA1289359-robh@kernel.org>
References: <20231128084236.157152-1-wenst@chromium.org>
 <20231128084236.157152-3-wenst@chromium.org>
 <CAD=FV=U_+iQJtV0Wii89DQT1V_fJCeS9wcqA8EJAs-hmmmLLLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U_+iQJtV0Wii89DQT1V_fJCeS9wcqA8EJAs-hmmmLLLg@mail.gmail.com>

On Fri, Dec 01, 2023 at 04:57:46PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Tue, Nov 28, 2023 at 12:45 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > @@ -217,4 +217,114 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
> >  struct notifier_block i2c_of_notifier = {
> >         .notifier_call = of_i2c_notify,
> >  };
> > +
> > +/*
> > + * Some devices, such as Google Hana Chromebooks, are produced by multiple
> > + * vendors each using their preferred components. Such components are all
> > + * in the device tree. Instead of having all of them enabled and having each
> > + * driver separately try and probe its device while fighting over shared
> > + * resources, they can be marked as "fail-needs-probe" and have a prober
> > + * figure out which one is actually used beforehand.
> > + *
> > + * This prober assumes such drop-in parts are on the same I2C bus, have
> > + * non-conflicting addresses, and can be directly probed by seeing which
> > + * address responds.
> > + *
> > + * TODO:
> > + * - Support handling common regulators and GPIOs.
> 
> IMO you should prototype how you're going to handle regulators and
> GPIOs before finalizing the design. I was going to write that you
> should just document that it was up to the caller to power things up
> before calling this function, but then I realized that the caller
> would have to duplicate much of this function in order to do so. In
> the very least they'd have to find the nodes of the relevant devices
> so that they could grab regulators and/or GPIOs. In order to avoid
> this duplication, would the design need to change? Perhaps this would
> be as simple as adding a callback function here that's called with all
> of the nodes before probing? If that's right, it would be nice to have
> that callback from the beginning so we don't need two variants of the
> function...
> 
> > + * - Support I2C muxes
> > + */
> > +
> > +/**
> > + * i2c_of_probe_component() - probe for devices of "type" on the same i2c bus
> > + * @dev: &struct device of the caller, only used for dev_* printk messages
> > + * @type: a string to match the device node name prefix to probe for
> > + *
> > + * Probe for possible I2C components of the same "type" on the same I2C bus
> > + * that have their status marked as "fail".
> 
> Should document these current limitations with the code:
> 
> * Assumes that across the entire device tree the only instances of
> nodes named "type" are ones we're trying to handle second sourcing
> for. In other words if we're searching for "touchscreen" then all
> nodes named "touchscreen" are ones that need to be probed.

named "type" and marked as needs probe.

> 
> * Assumes that there is exactly one group of each "type". In other
> words, if we're searching for "touchscreen" then exactly one
> touchscreen will be enabled across the whole tree.

Does that need to be a limitation? If you just keep going thru all 
devices, wouldn't that just work?

Rob
