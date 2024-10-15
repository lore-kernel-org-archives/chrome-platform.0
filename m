Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2947A1684A1
	for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 05:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728970506; cv=none; b=cJTzyAIor7CiI3r5iNSu6zbg7Nl79/eycLKvzR41LJ3OJya6YHzdLOaODfJHBrsu7GzO6L4IdmMVZSgxsr65H6JKkK05GH9BEyNFfFNo2lf7OW7GYbz+HvSbu0kcm4RqwlzAMnRdPNXpgxY7IJgQJsOJ33UVKGIi0mqT8t9S4wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728970506; c=relaxed/simple;
	bh=JR6gZ2MYyBQRhGGMVIzq353IT1yqvpAlneMgFsqBvhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/k1E0ClwDtrXstYe9BPsQxEhJX0ihRdZ6m0TQNOFc72eHiEpwtOZnpskNRQsBsuIUAl0SWKsgnZej5l3Q2vqUp7NxZmc+1b/377svEoTQBn88yAnVmrT3dRkdXoxWjGyvLPDtKd5rwthc/0XFEuDSTjTtfK4/emtgoUL/WfhhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PuCSqJv4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PuCSqJv4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539fe76e802so507877e87.1
        for <chrome-platform@lists.linux.dev>; Mon, 14 Oct 2024 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728970503; x=1729575303; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HWrH+K7cTgTjTPYZ+dL7fGmCBNocSiDK/Hn2JY2vEs=;
        b=PuCSqJv4ubvlZ8icg4fhCON/ABOlqhlmXWgsyrXm3rqBViu6SzzODyw0NSOkPE/lg6
         BSL9aMtAYl3ckaiazUOs1+L0YfC68OJR5OuykY+kthDncN1NnHruVcETzqZdMvq9+Jbm
         eb4eZjpii0OHC2cA53R4Vmyfp0K7k/COZGDsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728970503; x=1729575303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HWrH+K7cTgTjTPYZ+dL7fGmCBNocSiDK/Hn2JY2vEs=;
        b=udotoB+/7wu4MEfPhkmO/ZMsxLX6BR02WccZS1oFXdnQRyO7vmDKc9GHvq/PUYNNg3
         KQ4UumMBvd/dQk5pTMzs9C4miqx1XFtUOgkpr23bqukk0cff5ZnnuxTX1WXYO8jb01EV
         YIK2HIcIEXmE2p1BRbk5dWXqZ4Czc9MKcqQi04TSJ0/VjB4+OiG05BU37J1uig4wzaMI
         wwDJiUr6vr1PbihlAKszVTavFr9Vihd1ljCnniuoJdmwaD1C3KWcc0phItilMrFYR1fc
         paCXD9xSbEa2wwdRlL9vn6TVtQkxYnKMrJCfEPoim5dEEoN2ckyMNihsebSPOuj11Fzt
         DjqA==
X-Forwarded-Encrypted: i=1; AJvYcCXBqDZrvgOAPVhOQ7n1AT2pcJOunwCfqoaw838RONXESsunSQN3603WJHGPjdzHuWgV+SVczlif8nnxVkFk5o8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw3aXbpwhYdwAwzeUL1qBEVtCH8VCqGLVcf1q8lTn/b1U8f+ed
	VFUNmbkqHyfheCbUknoNbJnJhSGjiSsTH4vOqse2nwTuHTJBlzyjwndAaCf8L1+9p5xxiT9quQH
	jercCLh07emr0yQ7gJb426TZ1MEaw24U1eOx8Sq2zTaXnjr0=
X-Google-Smtp-Source: AGHT+IE/CwxLRzqmXVYjkMDrcTm2+DQg9NcGd7Zyw9exDfJ8teYEZF+svaLAA8rUa5571DxzVoiZK6455ROycmYsGCQ=
X-Received: by 2002:a05:6512:1598:b0:539:9155:e8d4 with SMTP id
 2adb3069b0e04-539e54d77ecmr4621333e87.8.1728970503111; Mon, 14 Oct 2024
 22:35:03 -0700 (PDT)
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
Date: Tue, 15 Oct 2024 13:34:52 +0800
Message-ID: <CAGXv+5HtDqf9MbGc53axP276fFA6riM85+Sa7nXHPvZcCb5-Pg@mail.gmail.com>
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
>
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
>
> > The helpers for the release side are quite short, but the ones on the
> > request side wrap some conditional and error handling. I think it's
> > better to keep it symmetric?
>
> Yes, but why do you need the above check, I didn't still get...
> I.o.w. you think that there is a gap in time that (if no check) the GPIO
> descriptor might be changed? But then how does it affect anyway the possi=
bility
> that it becomes not NULL even with the current code.

The opposite actually. Either it is always NULL, or it was initially valid,
but the early cleanup function released it and thus it became NULL by the
time this function gets called.

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
