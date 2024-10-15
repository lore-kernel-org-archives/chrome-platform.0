Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF501741E8
	for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728970315; cv=none; b=jf5JetiQqWDjcIri5rnko53dNA21uF0k/KbHuQ5ykyWYHDwme43P2vCha5qNYkusU5YOK9J1lDOuW2reB8FnTGlVi59+FNBoaRBxLW1jUyF3tHb+9M+vs3NHk0qqHOgj4oqtuP+QZlI2l7h3fuyj86wCdEAOLiX2rxKi438VSpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728970315; c=relaxed/simple;
	bh=EfzX5krpuywmG5h0oUk6AHF+dbPj3jlM5kdV7Gl8Lu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vC/LzqSeFEWUy+POkBek/uynlMegPBWwSdKUmmQVzx62wPBopsAhHfHEK/2K48kDZhw1GZfPtTWRe/MQPCS7m2jR2VNfgljc2AhnaTcrC3C/QnGMBIzCq+3UuMusnNehy2u0qks5Q/L5v0OFheteSNvCGPP2dJeLCCpxSam/iT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ITl3FTmN; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ITl3FTmN"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e13375d3so3650794e87.3
        for <chrome-platform@lists.linux.dev>; Mon, 14 Oct 2024 22:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728970312; x=1729575112; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6I9X4HeUOqY4U0CtpRUmEBHzfHV0sdEz17jGz7AVasM=;
        b=ITl3FTmNhlYSXgujQ90wCJVc17GQhWC4M/Ff64Nhg+AnQe+skB8Tmf1vBMfPl7g6BL
         Fopfh+52dwByHbMOo5VBFYo9cebDPO9cBVWbDJJgzTdedPel6yIsKMQFbtf/G/8GjAI3
         ayyqmI/6/+Yo1OKWJFXpTcEisKaRa2/A42PTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728970312; x=1729575112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6I9X4HeUOqY4U0CtpRUmEBHzfHV0sdEz17jGz7AVasM=;
        b=hmkMl5fOCR5YEii3iLZWAPHeCzj27WHEnwXeblTfd3BtOcbKFRv0u31b84j6sTeSjQ
         PM448tT6OH9OHaQzubkK8enm1Dzt1UpHGFWYgi4svccY62fp7DndmaMan4/0n68VNFs5
         dhw3B6efI4qLMGfqboZo2RH1E0laMk3F8/z1k1QqWLOk2caL6zvWZnc3bp36KVcQboTD
         ipwnuImeCW3CALN5r5An9gzI6Ylyjb9U+QmAgV9ZPg3UU8GRqSvk0irCCtcDwRPPiWrw
         u/iwiBaLt3ZPDylAoRUvDNQ/p1XFM/Gizd8WcB5hpHk6Fvss/snv9wB1Y6W8cGuI5j3q
         NsXg==
X-Forwarded-Encrypted: i=1; AJvYcCU4Yh1sQPq57W3ehCT5QbDY/IaL8r68NfVbtLbmz/NyM1DW4KpeGBlta++9Fl6jD32Ur6fnjxvyGH/RVAnxLxU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+6wysI+K7bjcto04fJ9MXt4YR+J4DQ/rGjslXXXFllapB/J/L
	yjAKHaVgBUGoxRkRCzvFkTT2esuxBvTYUB4JlOdySEOuBhJobmbY0EU2QhPbcPNLba4CMcjyYzy
	a7tUza4jX+cVAZ2xMHE2WIwgYCRyWSyuI9GI/
X-Google-Smtp-Source: AGHT+IFnv6XcJ0IaPSidwG2NAv6IbIwCRYACAiR+zoSqxUioN+OKGyLgyzBfN8IaMOcvrXfdKkawj5iYaHp4/g0qQYA=
X-Received: by 2002:a05:6512:2811:b0:539:f4ab:5638 with SMTP id
 2adb3069b0e04-539f4ab57c9mr2610100e87.60.1728970311498; Mon, 14 Oct 2024
 22:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com> <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
 <Zwz-benEP4PHbRb2@smile.fi.intel.com>
In-Reply-To: <Zwz-benEP4PHbRb2@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Oct 2024 13:31:40 +0800
Message-ID: <CAGXv+5EwSZFoE-Uzb5x1QfknkVfd64Z_uzR0YcvZ_pR9ktGUBA@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 7:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 14, 2024 at 12:06:16PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Oct 10, 2024 at 11:20=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:
> > > > Add GPIO support to the simple helpers for the I2C OF component pro=
ber.
> > > > Components that the prober intends to probe likely require their
> > > > regulator supplies be enabled, and GPIOs be toggled to enable them =
or
> > > > bring them out of reset before they will respond to probe attempts.
> > > > Regulator supplies were handled in the previous patch.
> > > >
> > > > The assumption is that the same class of components to be probed ar=
e
> > > > always connected in the same fashion with the same regulator supply
> > > > and GPIO. The names may vary due to binding differences, but the
> > > > physical layout does not change.
> > > >
> > > > This supports at most one GPIO pin. The user must specify the GPIO =
name,
> > > > the polarity, and the amount of time to wait after the GPIO is togg=
led.
> > > > Devices with more than one GPIO pin likely require specific power
> > > > sequencing beyond what generic code can easily support.
>
> ...
>
> > > > +     /* An empty string signals an unnamed GPIO */
> > > > +     if (!ctx->opts->gpio_name[0])
> > > > +             con_id =3D NULL;
> > > > +     else
> > > > +             con_id =3D ctx->opts->gpio_name;
> > >
> > > Can it use positive conditional?
> > >
> > >         if (ctx->opts->gpio_name[0])
> > >                 con_id =3D ctx->opts->gpio_name;
> > >         else
> > >                 con_id =3D NULL;
> >
> > You suggested writing it this way in your reply to v7. Please pick one.
>
> Oh, whatever you will finish with then, sorry for the noise.

Thank you.

> ...
>
> > > > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, s=
truct i2c_of_probe_simple_ctx *ctx)
> > > > +{
> > > > +     if (!ctx->gpiod)
> > > > +             return;
> > >
> > > Do you need this check for the future patches?
> >
> > Not sure I follow. The check is needed because this function is called
> > in i2c_of_probe_simple_cleanup(), but the GPIO could have been released
> > earlier in i2c_of_probe_simple_cleanup_early(), and that makes this
> > function a no-op.
>
> Do you have a known race condition then? This is bad. You shouldn't rely =
on
> the sequence of events here, or the serialisation has to be added.

No there isn't. Explanation below.

> > The helpers for the release side are quite short, but the ones on the
> > request side wrap some conditional and error handling. I think it's
> > better to keep it symmetric?
>
> Yes, but why do you need the above check, I didn't still get...
> I.o.w. you think that there is a gap in time that (if no check) the GPIO
> descriptor might be changed? But then how does it affect anyway the possi=
bility
> that it becomes not NULL even with the current code.

There are two codes paths, either

    a) successfully finding a device and enabling it, or
    b) exhausting all options and not finding a device, because it was
       optional or it is malfunctioning.

After either code path, this cleanup function is called.

In path (a), the GPIO descriptor is released prior to enabling the device,
because the descriptor is an exclusive resource, and as soon as the device
is enabled, its corresponding driver may probe and request the same GPIO,
and would fail if it was not released.

In path (b), nothing was enabled, and the GPIO descriptor was not released
early.

The cleanup function here accounts for both cases, hence the check.

A step-by-step description might be clearer:

1. i2c_of_probe_simple_enable()
   ...
   1a. i2c_of_probe_simple_get_supply()
   1b. i2c_of_probe_simple_get_gpiod()
   1c. i2c_of_probe_simple_enable_regulator()
   1d. i2c_of_probe_simple_set_gpio()

2. Loop through potential component options and probe; if one is found:
   2a. i2c_of_probe_simple_cleanup_early()
       2a-i. i2c_of_probe_simple_put_gpiod
   2b. Enable device and driver's probe() gets called

3. i2c_of_probe_simple_cleanup()
   3a. i2c_of_probe_simple_disable_gpio()
   3b. i2c_of_probe_simple_put_gpiod()
   3c. i2c_of_probe_simple_disable_regulator()
   3d. i2c_of_probe_simple_put_supply()


ChenYu

> > > > +     /* Ignore error if GPIO is not in output direction */
> > > > +     gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable=
);
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
