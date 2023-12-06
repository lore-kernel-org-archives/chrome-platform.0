Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9883D48CEE
	for <chrome-platform@lists.linux.dev>; Wed,  6 Dec 2023 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BTzXdUme"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54c79968ffbso5683176a12.3
        for <chrome-platform@lists.linux.dev>; Wed, 06 Dec 2023 09:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701882058; x=1702486858; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6USO49247dIS4iM67DLL61cvXhjKL/DNTtVy5lpNUks=;
        b=BTzXdUme5q50kmn9TBwZQexqp+vB+uwxq0YfOg4T1SbYfrYeOQvE14iFabZMeXc2le
         Q/lFlNkMXK2G2MgAPuwQ33t5SJkdheHH/LcTz63lzJ4/T9PsDPym1+fgXwqZV/5iJDdU
         qBUTwl/Beb3j5etIDof4I8WR39JQDSEFvDBro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701882058; x=1702486858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6USO49247dIS4iM67DLL61cvXhjKL/DNTtVy5lpNUks=;
        b=gim/MZcgnwGI2uIdNfWOWpwroENYSfuePF+vE1C7/xIM83amjS+0+dMrD3d7czfMHV
         orRk+BTdjzG4NpxHR2mJVTd2FGfzsd4QKf+v3Qm9DSSVJAgr4yItxdV02DTbidu4V1qT
         KuwTsf3AMv3ViU8RfadgN7D3sQOhohCMeoftecxdmb/iiL77Cnb+AIhXxunDYsCNA0eG
         TUsTN63Z+MCi0+YRFWRJ2jx/7e8227yFkyX9OjAhsqbTpfya1548k/8Suj4fT/h+cjGG
         CI+BMFivibze//Ex12R4Y3OIhhVby5lFf+AmzFNL3M5sYdj+7Vc0RPfturaDOpt8RyKE
         HWNw==
X-Gm-Message-State: AOJu0Yxwguz5dwOsUV1ZiinaEfiVy9KxcLM12jTtBbMEiMOXM8Ld0o66
	SfK2Aadpf69b1eTSASn1+VhtbbHNmYJC+MGnZtF+JO4Y
X-Google-Smtp-Source: AGHT+IGoz53vRFljrQAA/tkpwtLoFaWKhggFzx9aYDXLNIZhYzCAEzKMhzCagb4gh7HsnO1xQqZcTw==
X-Received: by 2002:a50:d49d:0:b0:54d:9169:ffaf with SMTP id s29-20020a50d49d000000b0054d9169ffafmr569931edi.28.1701882058555;
        Wed, 06 Dec 2023 09:00:58 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id s15-20020a056402164f00b0054c9df4317dsm189810edx.7.2023.12.06.09.00.57
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 09:00:58 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40b51e26a7aso71875e9.1
        for <chrome-platform@lists.linux.dev>; Wed, 06 Dec 2023 09:00:57 -0800 (PST)
X-Received: by 2002:a05:600c:4e8d:b0:40b:33aa:a2b9 with SMTP id
 f13-20020a05600c4e8d00b0040b33aaa2b9mr101895wmq.4.1701882057134; Wed, 06 Dec
 2023 09:00:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
 <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
 <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
 <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com>
 <3700f05f-2411-4422-972f-f3df690efb84@collabora.com> <CAGXv+5G5fFTv8zn=YamSdccjuYemE5oKBqjb8CSyGzu9aMJ0eg@mail.gmail.com>
 <4b9ea82c-d1a4-47b6-ba03-346cfdedef05@collabora.com>
In-Reply-To: <4b9ea82c-d1a4-47b6-ba03-346cfdedef05@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Dec 2023 09:00:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UMRRYieChp2+4Z6zxL-CSVZabiokuHH=qrnMMSmjNM2Q@mail.gmail.com>
Message-ID: <CAD=FV=UMRRYieChp2+4Z6zxL-CSVZabiokuHH=qrnMMSmjNM2Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>, 
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

On Wed, Dec 6, 2023 at 2:02=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 06/12/23 03:55, Chen-Yu Tsai ha scritto:
> > On Tue, Dec 5, 2023 at 6:22=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 04/12/23 17:50, Doug Anderson ha scritto:
> >>> Hi,
> >>>
> >>> On Sun, Dec 3, 2023 at 10:59=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> >>>>
> >>>> On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chrom=
ium.org> wrote:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromi=
um.org> wrote:
> >>>>>>
> >>>>>> @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
> >>>>>>                   reg =3D <0x2c>;
> >>>>>>                   hid-descr-addr =3D <0x0020>;
> >>>>>>                   wakeup-source;
> >>>>>> +               status =3D "fail-needs-probe";
> >>>>>
> >>>>> While doing this, you could also remove the hack where the trackpad
> >>>>> IRQ pinctrl is listed under i2c4.
> >>>>
> >>>> Sure. I do think we can do away with it though. According to at leas=
t one
> >>>> schematic, the interrupt line has pull-ups on both sides of the volt=
age
> >>>> shifter.
> >>>>
> >>>> BTW, The touchscreen doesn't have pinctrl entries. This has pull-ups=
 on
> >>>> both sides of the voltage shifter as well.
> >>>
> >>> I dunno if the convention is different on Mediatek boards, but at
> >>> least on boards I've been involved with in the past we've always put
> >>> pinctrl entries just to make things explicit. This meant that we
> >>> didn't rely on the firmware/bootrom/defaults to leave pulls in any
> >>> particular state. ...otherwise those external pull-ups could be
> >>> fighting with internal pull-downs, right?
> >>>
> >>
> >> MediaTek boards aren't special and there's no good reason for those to=
 rely on
> >> firmware/bootrom/defaults - so there is no good reason to avoid declar=
ing any
> >> relevant pinctrl entry.
> >
> > I think this should be migrated to use the proper GPIO bindings: the
> > GPIO_PULL_UP / GPIO_PULL_DOWN / GPIO_BIAS_DISABLE flags.
> >
> > But that's a different discussion.
> >
>
> 100% agreed.

I guess I'd need to see patches as an example to see how this looks,
but I'm at least slightly skeptical. In this case the GPIO is
indirectly specified via "interrupts". Would you add these flags to
the interrupts specifier, too? There's another potential pull as well
(PIN_CONFIG_BIAS_BUS_HOLD) as well as other pin configuration
(PIN_CONFIG_INPUT_DEBOUNCE, for instance). Do we try to fit all of
these into the GPIO / interrupt specifier?

Certainly I will admit that this is a complicated topic, but it seems
weird to say that we use pinctrl to specify pin configuration / pulls
for all pins except ones that are configured as GPIOs or GPIO
interrupts.

-Doug
