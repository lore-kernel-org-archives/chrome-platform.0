Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760877E2
	for <chrome-platform@lists.linux.dev>; Sat,  2 Dec 2023 00:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ElX/ZTZ2"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54c7744a93fso515034a12.2
        for <chrome-platform@lists.linux.dev>; Fri, 01 Dec 2023 16:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701478731; x=1702083531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AjpI9QlzX4/sI/azrgjTOEsQmOURin+5qeGoAR1AD0=;
        b=ElX/ZTZ2lyo0gU57w9r0X1p8LlYTozAc6aNWu/6FbaSYnxoSUtwnO9jWxqpaNpfVgE
         lsbVn8P7g2/DFDPkA+8LW/inzyMdizOD8/iEoL5IG5fzB4DGcoWr/HgjEW74HD3KoLxJ
         QUEfZxWfFgaDkTldvefU9aeJQy7lvcFY3zVNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478731; x=1702083531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AjpI9QlzX4/sI/azrgjTOEsQmOURin+5qeGoAR1AD0=;
        b=CCmAedehMr20gx1a+NOSJqjxH0EGbU49JXn4SdfBtbWvV6RB0tUiqNDpZazpdYwXK9
         oSar8JWbYI6gAYiM46RBSzlOd/SnoVQbmPyVBEeWq0brSi2cREgzdBYSi94+ImaM5tvR
         UvBAlkh9kerJZoqNPQGpyYe6M6iX1aPkTo8ak2fSDNjd+d36+V9RLv1UL17/W3oRmwO3
         3JG7/EaU0ynfkOlCm9WZkGA14SwMUI+vXiZ86kcOW1lvD2wm+nB8n5SuxHcQ2N8ypLHN
         4XJKk5inzq6TuLpL562z4cspRbEIliSPenTTqE9H4yBueCC+VftcQ1yffFhaoJumOwqF
         3srg==
X-Gm-Message-State: AOJu0YzjWGBY97DQxdV60GwV2x8LLtjCTg+GA3AXjhRm7qxbKNTq3Vpl
	QVXGfsPTBGrf8oOmKfMHAle7SCUWV/ZcAHlBtqZ3cz4+
X-Google-Smtp-Source: AGHT+IFuHMKUHd6xpVDBCtyLXwfyh/3uCzoshNAhikAEPCYpJPXPcF7C51hxxjDqSuEAZ9H9lgiJXA==
X-Received: by 2002:a50:8d4e:0:b0:54c:60f0:7511 with SMTP id t14-20020a508d4e000000b0054c60f07511mr1471983edt.35.1701478731334;
        Fri, 01 Dec 2023 16:58:51 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id f13-20020a05640214cd00b0054b5d5248easm2138968edx.86.2023.12.01.16.58.50
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 16:58:50 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b51e26a7aso12235e9.1
        for <chrome-platform@lists.linux.dev>; Fri, 01 Dec 2023 16:58:50 -0800 (PST)
X-Received: by 2002:a7b:c4c6:0:b0:40b:3d89:ba70 with SMTP id
 g6-20020a7bc4c6000000b0040b3d89ba70mr237236wmk.7.1701478730440; Fri, 01 Dec
 2023 16:58:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-5-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-5-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:58:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
Message-ID: <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
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

On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
>                 reg =3D <0x2c>;
>                 hid-descr-addr =3D <0x0020>;
>                 wakeup-source;
> +               status =3D "fail-needs-probe";

While doing this, you could also remove the hack where the trackpad
IRQ pinctrl is listed under i2c4.
