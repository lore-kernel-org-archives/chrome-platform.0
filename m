Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CA62E82A
	for <chrome-platform@lists.linux.dev>; Mon,  4 Dec 2023 16:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CIakfIo2"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a00c200782dso638524566b.1
        for <chrome-platform@lists.linux.dev>; Mon, 04 Dec 2023 08:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701705844; x=1702310644; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fXQC8kMEIVpKhirV/8r5WlQUD6sGUWR7e162LHNTZo=;
        b=CIakfIo27+fMMn/DlxIm6NSH117rQEyd7qm+B5p2B7lBTQ9GsjcJrQN/6vNcxM+R7c
         hOB0cS1TDnW6VMLBH/EH21H9sxQJQCoiP9gauFldPUlZNfYBItPHgy2vZBZ2ukQXn4H4
         RShQcn3pWqLVVzBlM4/AHuxD/l0TbPzM948vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705844; x=1702310644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fXQC8kMEIVpKhirV/8r5WlQUD6sGUWR7e162LHNTZo=;
        b=aeSlXY0zLEqAQJU7OVQ20FizjcmC5Zf6o2zORlRn9ZLh0plwVyKJH7wkRqDAXyP34E
         6x2D0z8rFbrgekbUxC4e594t4fGxPvLHcI8+MbHHNBPaw84LtORQ6BZyy2mUvUG2N6Jm
         VLmjs1hcVcu/0l06V80ePwE/qf4vX9BhQntt/2IrXqPKcR6LUVDm/tObg+zUbZaTatFu
         H3TX3mbiU09c1Hicvb4oZTbtuNvwVc04MJXcSfyQ2W4g58C38cJF6cAhSTto7jsH4GR5
         4oxj1hmZ1bRhNEcZtXZP3BBEW7JsXSVP/kNRzUaL9+zR/pom50CZHtn2Y8XEEpTlJrbY
         vxMA==
X-Gm-Message-State: AOJu0YwCWTOFihYn0WDlRLs7chg7D4lpNjSIm3elCO0SjPKk3a+S/ABs
	Ep5xQc/WRFU10rFEnPag02fjaAKUCAQ7KwfPbZc+dA==
X-Google-Smtp-Source: AGHT+IHh9tJBNvBcme+SZb3FoCjMbFV8J4EiBj/bfLceqdrJojJhCdzHVHzs/jgo4SgDm6V3UiYadA==
X-Received: by 2002:a17:906:2259:b0:a19:d40a:d1ea with SMTP id 25-20020a170906225900b00a19d40ad1eamr1983139ejr.182.1701705844451;
        Mon, 04 Dec 2023 08:04:04 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id r18-20020a17090609d200b00a015eac52dcsm5425364eje.108.2023.12.04.08.04.01
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 08:04:03 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-54c77d011acso13865a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 04 Dec 2023 08:04:01 -0800 (PST)
X-Received: by 2002:a50:99de:0:b0:54a:ee8b:7a99 with SMTP id
 n30-20020a5099de000000b0054aee8b7a99mr280850edb.0.1701705841514; Mon, 04 Dec
 2023 08:04:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-3-wenst@chromium.org>
 <CAD=FV=U_+iQJtV0Wii89DQT1V_fJCeS9wcqA8EJAs-hmmmLLLg@mail.gmail.com> <CAGXv+5EpA531O1tW=h1RvK34+LMvtdve3=cNmfN=2+9t1jL_bA@mail.gmail.com>
In-Reply-To: <CAGXv+5EpA531O1tW=h1RvK34+LMvtdve3=cNmfN=2+9t1jL_bA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Dec 2023 08:03:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WtvPUD+tXv0GghreG3w5yWedeHTYzhk-LNzf94fJ6B_Q@mail.gmail.com>
Message-ID: <CAD=FV=WtvPUD+tXv0GghreG3w5yWedeHTYzhk-LNzf94fJ6B_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] i2c: of: Introduce component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 4, 2023 at 1:53=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> > IMO you should prototype how you're going to handle regulators and
> > GPIOs before finalizing the design. I was going to write that you
> > should just document that it was up to the caller to power things up
> > before calling this function, but then I realized that the caller
> > would have to duplicate much of this function in order to do so. In
> > the very least they'd have to find the nodes of the relevant devices
> > so that they could grab regulators and/or GPIOs. In order to avoid
> > this duplication, would the design need to change? Perhaps this would
> > be as simple as adding a callback function here that's called with all
> > of the nodes before probing? If that's right, it would be nice to have
> > that callback from the beginning so we don't need two variants of the
> > function...
>
> So I think I can prototype designs with one GPIO and multiple regulators,
> assuming each node has the same number of both? At least they should if
> they're on the same connector.
>
> More than one GPIO probably means there are some ordering and timing
> constraints, and won't be as generic.

I was hoping to see a prototype of how this could work in the
non-generic case where the board needed a custom function to power
things up. It seems like we'd still want to be able to use your code
for probing.


> > > +       for_each_child_of_node(i2c_node, node) {
> > > +               union i2c_smbus_data data;
> > > +               u32 addr;
> > > +
> > > +               if (!of_node_name_prefix(node, type))
> > > +                       continue;
> > > +               if (of_property_read_u32(node, "reg", &addr))
> > > +                       continue;
> > > +               if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I=
2C_SMBUS_BYTE, &data) < 0)
> >
> > I'd be tempted to say that the caller should be able to pass in a
> > function pointer here so they could use an alternative method to probe
> > instead of i2c_smbus_xfer(), though you'd want to make it easy to
> > default to i2c_smbus_xfer(). I could imagine someone might need a
> > different way to probe. For instance if you had two touchscreens both
> > at the same "reg" but that had different "hid-descr-addr" then this
> > could be important.
>
> I'd say the only specific probable type is hid-i2c. And that could be
> generic enough that we could incorporate it here if we wanted. However
> I think we want to keep the initial version a bit simpler.

I don't mind if the initial version is simpler, but I'd love to
understand how this will grow. It doesn't feel terrible to take in a
function pointer that will probe the device and then provide a
function that callers could pass in that simply did the simple
i2c_smbus_xfer().


> > > +                       continue;
> > > +
> >
> > Put the "break" right here. You've found the device and that was the
> > point of the loop.
>
> In its place we'd have an if (node) { <enable node> } block. I guess it
> makes it easier to read still?

...or perhaps an "if (!node) goto exit" block and then you don't need
indentation? Essentially the loop becomes the implementation: "node =3D
find_the_one_that_exists(...)".

-Doug
