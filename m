Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB3B1662F1
	for <chrome-platform@lists.linux.dev>; Tue, 17 Sep 2024 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726576904; cv=none; b=rgGobL2WIP7PW566TdxqULfKadIRhjNjWcpVkbwlmo1WnnF3MBL9eKIc9f3ZLLtixFoi85q4jsiQGf0mEi/vYIKa0LGbX/itimmcfZeIaszv6GVpzWeL/P4Pe19OAl9dNCNvw6aVmev5t7jjNf70Uycge7rTl2GAe68xjsXCEZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726576904; c=relaxed/simple;
	bh=ZJFRDeZ8soV10dD+MfPoyVRxBMFppyhwS9UoRQCw/jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMn/DxN+scaDZzHecTRpczjgfYxQTyHjOym/Ht77kmo1T07eTgQxWFiBDZi99DRlATx7s+3yjeF+cGO7I3VqZme95fTXrpPoWSKV3PtOcHVrc4WSQkzMNuZqJykmsKyT/srzIEYYWwEOgvlJgAzFO3TIyswizwZrO9/udVg1AGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Yph3kHJB; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yph3kHJB"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365b6bd901so6192544e87.2
        for <chrome-platform@lists.linux.dev>; Tue, 17 Sep 2024 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726576899; x=1727181699; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpWMPlfIX7YhBeWJyNbMe8FzyW4Hu7Wcs9fzjKwOIrA=;
        b=Yph3kHJBMSVC8cl2WiWDnRMwg+15qH7y+dPus4BXHA4cQgda108lZ+AThRr+oEWahU
         HKJkPvQuV2K6vzDn6VjdSnSbBI1Udb+pFfrQ+3KoMVdDDH+3DbztzTBlZbqRQQuGe3xw
         /aPTKm1MEA3MsxvQI44cj4wUaR8MnWUo2ZQFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726576899; x=1727181699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CpWMPlfIX7YhBeWJyNbMe8FzyW4Hu7Wcs9fzjKwOIrA=;
        b=r8EGEf5Ghpn/xkQa565QO9arAeHwV2vQ0RUlueqnVJQ3U4dnnLvbVO4oXQcwtkUyWx
         nGwSEJqHq1LMhhq+CQCMyr6YWjhpUNTwDZPFhDMvs6Y3JWpXVJM5VQozS1qhcMN1Ox1l
         ofMWMCmucGciehpgNkwae7XVtYiMaN38zL4h8Txud65ca2Q1HFNAJjkrkzyp5EEd0cPA
         6GrxFIxSgApBINT0rOkFwYpi1qDaZ9BsztfnX9YkaKyc5N9yn93KpkScgqDpJPN4tIiH
         J49blomFTQFt71SrCYVAbCjtI+NUNmGUI/FucvXrTOfHiSWB3qDssFFeW3V2KgxElvja
         BOYw==
X-Forwarded-Encrypted: i=1; AJvYcCW/n9RXCa2GjtvxPibPwVCcHEiJxQtfiTdexnvjH1TQeRguvJoJrfypMY8aQnQ8yL1VnPSQgDB5VP89TO/q1VA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLyQvAF9l8va/pEzZG7XOLOEzjW7eE5lC14U4GXezLnqLb/hVy
	7FkWRWkEs2xHWwxFGugk5QWEts1hYqWynKeqcYHFxoTTsU1iVTaDWS3QAjtdGOicWOXqaQG6lhz
	GolpsizPRo7SpNEhwY3ZVbAhlm+SoW402mgkM
X-Google-Smtp-Source: AGHT+IFn3m+495dQ3DEAPrBhGOQnGwVGdz2fTnahxh2yXDyCOMPHxLysb0zN6DNlW9fowNODvzSDvoxEfUfwPvjJvLE=
X-Received: by 2002:a05:6512:3f18:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-53678f6143cmr9822670e87.0.1726576898996; Tue, 17 Sep 2024
 05:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-9-wenst@chromium.org>
 <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
In-Reply-To: <CAD=FV=XvPA0UC87fQ+RvFzPv9qRSEP6eQhT79JOx9Arj87i9Mg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 17 Sep 2024 14:41:26 +0200
Message-ID: <CAGXv+5EcxGfdzvarg8hmk1zR9X0s8KUzayQdxfWTrasEGpj=1g@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple helpers
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 1:49=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Sep 11, 2024 at 12:29=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > +static int i2c_of_probe_simple_set_gpio(struct device *dev, struct i2c=
_of_probe_simple_ctx *ctx)
> > +{
> > +       int ret;
> > +
> > +       if (!ctx->gpiod)
> > +               return 0;
> > +
> > +       dev_dbg(dev, "Setting GPIO\n");
> > +
> > +       ret =3D gpiod_direction_output_raw(ctx->gpiod, ctx->opts->gpio_=
high_to_enable ? 1 : 0);
> > +       if (ret)
> > +               return ret;
> > +
> > +       msleep(ctx->opts->post_reset_deassert_delay_ms);
>
> Like in the previous patch, you need an "if
> (ctx->opts->post_reset_deassert_delay_ms)" before the msleep().

Ack.

> > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struc=
t i2c_of_probe_simple_ctx *ctx)
> > +{
> > +       if (!ctx->gpiod)
> > +               return;
> > +
> > +       dev_dbg(dev, "Setting GPIO to input\n");
> > +
> > +       gpiod_direction_input(ctx->gpiod);
>
> This is weird. Why set it to input?

It seemed to me this would be more like the initial state, without knowing
the actual initial state.

> > @@ -347,6 +438,7 @@ int i2c_of_probe_simple_cleanup(struct device *dev,=
 void *data)
> >  {
> >         struct i2c_of_probe_simple_ctx *ctx =3D data;
> >
> > +       i2c_of_probe_simple_disable_gpio(dev, ctx);
>
> Maybe add a comment before the GPIO call that it's a noop if we found
> something and i2c_of_probe_simple_free_res_early() was already called?
> Otherwise you need to read into the function to understand why this
> doesn't crash if the early call was made. To me, that makes the
> abstraction add confusion instead of simplifying things.

Ack.

> > @@ -92,24 +93,33 @@ int i2c_of_probe_component(struct device *dev, cons=
t struct i2c_of_probe_cfg *cf
> >   * struct i2c_of_probe_simple_opts - Options for simple I2C component =
prober callbacks
> >   * @res_node_compatible: Compatible string of device node to retrieve =
resources from.
> >   * @supply_name: Name of regulator supply.
> > + * @gpio_name: Name of GPIO.
>
> Talk about the fact that gpio_name can be NULL or an empty string and
> that they mean different things.

Ack.

> >   * @post_power_on_delay_ms: Delay in ms after regulators are powered o=
n. Passed to msleep().
> > + * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Pas=
sed to msleep().
> > + * @gpio_high_to_enable: %true if GPIO should be set to electrical hig=
h to enable component.
>
> Now that you've added the GPIOs and more delays, the description of
> this structure needs to list exactly what the power sequence your
> simple functions assume.

Ack.

> I would also say: given that you're providing a parameter anyway and
> you're giving the GPIO name, can you please move away from the "raw"
> values and move to "logical" values?

I disagree. When hardware engineers design for swappable components, they
likely look at the electrical compatibility of them. In this case, an
active-high "enable" pin is electrically compatible with an active-low
"reset" pin. If we use the logical value here, then we would need more
logic to know when the logical polarity has to be reversed.

Note that this doesn't work for components that are electrically
incompatible. But in that case a lot more board dependent code would be
needed anyway.


ChenYu
