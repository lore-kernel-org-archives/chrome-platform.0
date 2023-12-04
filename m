Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2267924A04
	for <chrome-platform@lists.linux.dev>; Mon,  4 Dec 2023 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FNZdqj0E"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a18b478e4e9so595982966b.1
        for <chrome-platform@lists.linux.dev>; Mon, 04 Dec 2023 08:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701708618; x=1702313418; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8E333mX0LWpYdsutAHYgoOIGzA9DDLQh7glRXD1fJM=;
        b=FNZdqj0E1bsey4kT0QkAI25p0PeaROxHJqC0isMfNvA8HFixxW5Ze4URe/GCS4PoiK
         +Nee2jmkNU9ePaFnKwXJcipxkk6gat509WxegFmokwcqnFxhbsoynypFSIX2RbnLf8oC
         1ZKp/t54jtrFKaqLW/TySNEPG8feT+42xouFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708618; x=1702313418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8E333mX0LWpYdsutAHYgoOIGzA9DDLQh7glRXD1fJM=;
        b=KCPGB1Kpw+fbULGFjZYwP/LlXAINQLPI6jJMrVWRYIyRVAVc0x5MzGDUT1fg12gu5f
         LxXRF95N/2KES4hbdbK90Vsyb9258/PXxrlHhjuMPvCFnVyjcRjqSQ8lmyk5Q4g2MrNQ
         bcKbS8zicYxCF25sphmx0UVZ/51d23xPVuqpVc53LFt5b9OfZSPFmUN9TaIbp0KuSVgH
         54gtu7KupZfbuddQvavkAJK0Bs+89O0MDLb3DFz1V66pt4lb9z547lbC0LM3v/VNkrzm
         q8Z1kZ6t0mwBCzZ+b7fmktkdCmRjNZHE7o94kqYDaEl32OpiscPOSrhdxNNcVZBKEebg
         1nRQ==
X-Gm-Message-State: AOJu0YwPYj99C7zNelupKlTgdphqsHX2GCL6QKgLsuI901XJt2fNc3HB
	WcgkWgwWCRToHFIi5vW6wERjVqVPM467d71/tTvnPZoC
X-Google-Smtp-Source: AGHT+IHD0hESXkdzk/4NObyR7qByaV4Gr0I/rdm2jTnXvb+f35Fy7HMxc1EK6V6pI4gZnXqgiInIHw==
X-Received: by 2002:a17:907:3c16:b0:a19:a1ba:da44 with SMTP id gh22-20020a1709073c1600b00a19a1bada44mr2816065ejc.107.1701708617881;
        Mon, 04 Dec 2023 08:50:17 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id k15-20020a1709063e0f00b009fc24437439sm5464354eji.158.2023.12.04.08.50.16
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 08:50:17 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40b422a274dso115765e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 04 Dec 2023 08:50:16 -0800 (PST)
X-Received: by 2002:a05:600c:5247:b0:405:320a:44f9 with SMTP id
 fc7-20020a05600c524700b00405320a44f9mr414355wmb.5.1701708616473; Mon, 04 Dec
 2023 08:50:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
 <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com> <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
In-Reply-To: <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Dec 2023 08:50:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com>
Message-ID: <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Dec 3, 2023 at 10:59=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> > >
> > > @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
> > >                 reg =3D <0x2c>;
> > >                 hid-descr-addr =3D <0x0020>;
> > >                 wakeup-source;
> > > +               status =3D "fail-needs-probe";
> >
> > While doing this, you could also remove the hack where the trackpad
> > IRQ pinctrl is listed under i2c4.
>
> Sure. I do think we can do away with it though. According to at least one
> schematic, the interrupt line has pull-ups on both sides of the voltage
> shifter.
>
> BTW, The touchscreen doesn't have pinctrl entries. This has pull-ups on
> both sides of the voltage shifter as well.

I dunno if the convention is different on Mediatek boards, but at
least on boards I've been involved with in the past we've always put
pinctrl entries just to make things explicit. This meant that we
didn't rely on the firmware/bootrom/defaults to leave pulls in any
particular state. ...otherwise those external pull-ups could be
fighting with internal pull-downs, right?

-Doug
