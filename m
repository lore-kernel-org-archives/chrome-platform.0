Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEA0A21
	for <chrome-platform@lists.linux.dev>; Mon,  4 Dec 2023 06:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I6sja8D+"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50bf8843a6fso445052e87.0
        for <chrome-platform@lists.linux.dev>; Sun, 03 Dec 2023 22:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701673180; x=1702277980; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTNkS8LTnRqCQunaTUOLLsKXlHNWnzfg0xMTKbfGJJg=;
        b=I6sja8D+SW4m8i6ldJYeyEPNPQ71SQ7kXYYExy9dMHzEsGkbvlk4ML6MrwxdnmMj9n
         fgeJ3O8tfihmkWenN9mUTo7O6kTgx1iiqq+bIfiIgij2nyME+Yahq/KUWuczvgACmLBV
         Iw9NoqEeBeY7m9SEwmByu1GbxQS0x0QNmSus0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701673180; x=1702277980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTNkS8LTnRqCQunaTUOLLsKXlHNWnzfg0xMTKbfGJJg=;
        b=NxuK2BhQBL6O7rGPCDsmu0ybiy6kMtE6OOPCf6ZuWJntQn2uJcx2Vy3ELotWf8x++M
         m8iKVQQekNuMbVJjDjbumnh1Obw9/6caxB8J9X9ewWsRKHC1/vssbm3O+ahExdhTRCeK
         3JtCpKjFY4ZM3O6RebljxUE7OGsbiVXMUqfi+X6SQtXagaX75UsMoFlcFNwq2uO1YBpu
         JaVGTLnmASG225vSzRLQdXodzeqFV1fpEhGaDzk3pxBwRrjX1XdaFjRyyx1LhNBkqplL
         oT7hJ21oPYcAt6LLFu0x3d1TRNhfsOh/kZT+Xo4OsFtiO7kpdFaQj72xyDENOFXTppKg
         ln5g==
X-Gm-Message-State: AOJu0YyTZUzrCQLljHy8L2Un09ATYYAUhK38Vk72e0XCbgc0XoaUWMG5
	QXmpaSlapX09YTE+7UU5+uGcve3epIRfyjNAETfX3w==
X-Google-Smtp-Source: AGHT+IHoyWO3QIHEBY5JdBrYFEV7xzgnarDfjr1JxVNq6dHU5EQ6tbsFVJqwEhCrsQ2CBaDRnPGYgwSDkHN9tbdxHX4=
X-Received: by 2002:a05:6512:b9e:b0:50b:ed31:72a4 with SMTP id
 b30-20020a0565120b9e00b0050bed3172a4mr1697429lfv.28.1701673180528; Sun, 03
 Dec 2023 22:59:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
 <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
In-Reply-To: <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 14:59:29 +0800
Message-ID: <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Doug Anderson <dianders@chromium.org>
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

On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
> >                 reg =3D <0x2c>;
> >                 hid-descr-addr =3D <0x0020>;
> >                 wakeup-source;
> > +               status =3D "fail-needs-probe";
>
> While doing this, you could also remove the hack where the trackpad
> IRQ pinctrl is listed under i2c4.

Sure. I do think we can do away with it though. According to at least one
schematic, the interrupt line has pull-ups on both sides of the voltage
shifter.

BTW, The touchscreen doesn't have pinctrl entries. This has pull-ups on
both sides of the voltage shifter as well.

ChenYu
