Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D149447
	for <chrome-platform@lists.linux.dev>; Mon,  4 Dec 2023 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hFAtlF/I"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50bf37fd2bbso949603e87.0
        for <chrome-platform@lists.linux.dev>; Sun, 03 Dec 2023 23:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701674693; x=1702279493; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Xxz1IMztyI/DW8EzDBtMH+QkyqwQ5t+SJRSYEC/SOc=;
        b=hFAtlF/ID6WL89c3+9ePoTeaR6/tzDP3/jE+T941jMjWixjiP5n9A3F6dJkr1sKjEP
         n/7LJDJxmwYMRaA6hEKM4Xkes2bREL0CMlkicw2Dfo62q9N598oMf/X15mh08MbkDJf7
         Wa1N69Fz5Ofe88tlms8ZnwwkUtlQ9pZ69EYZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701674693; x=1702279493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Xxz1IMztyI/DW8EzDBtMH+QkyqwQ5t+SJRSYEC/SOc=;
        b=Km3RbOQ1xVdZPfMVNV4HK1fT4vYGV8LDh3f5XO1BYrJtwD4z/0h1wkFg9xzyGbf3ip
         vODFy6o1DWr/bkX7PnZg0kotq1QjIjuVa5ZDE0cjhyfhTqbk1XQLRUjJYvtxsmaJuT1/
         /ZPmjLPtfywoQMTtyC9m5BeEmmX85XkjRB/ZJ9BTDhOfYGl0gOuhz37ZLHjbW2jumDVn
         j32iKrIaFJU10twy24hlQfU8taIuStH1amOEguhf6MekRPr6C47xFvGLgdf3AwHFnCDT
         xDQMp8h2xPHkMd2nUrMSWz0Bn7XQm3Ha2lhuOfiS+GkLY+CjKuYC9JH3rqNWPeC8Dbts
         tWlw==
X-Gm-Message-State: AOJu0YxYxobnzdXXCZkwcOLTxeRLERCioXzYZvGzVvoInrDF20n8ixFX
	DmVXdvX/k1C+KFLEEjbu76ELf+cy/CS1Oq/mY5mA8w==
X-Google-Smtp-Source: AGHT+IFtbMn5A8+mOCK7ju+ZruOqp6ANHem62c8eBAnYZlXhRPomaeKDI0QPJC1GJ9Q8Tj324VrRaJX0WX0KLLlp1+M=
X-Received: by 2002:a19:ac4a:0:b0:50b:f51a:299a with SMTP id
 r10-20020a19ac4a000000b0050bf51a299amr600460lfc.32.1701674693388; Sun, 03 Dec
 2023 23:24:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-4-wenst@chromium.org>
 <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 15:24:42 +0800
Message-ID: <CAGXv+5Hz3wfjCRa2AiOQgOv7zo8bzAmtG=a=jWJhO2MZNrFtpw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
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
> > @@ -61,6 +61,17 @@ config CHROMEOS_TBMC
> >           To compile this driver as a module, choose M here: the
> >           module will be called chromeos_tbmc.
> >
> > +config CHROMEOS_OF_HW_PROBER
> > +       bool "ChromeOS Device Tree Hardware Prober"
>
> Any reason that it can't be a module?

No technical one. However if it's a module, the user has to manually load
it. So I think it's more of a usability thing.

OOTH I think this needs to be a module if I2C is built as a module.
Somehow I had thought of it at one point but then it slipped my mind.

> > +       depends on OF
> > +       depends on I2C
> > +       select OF_DYNAMIC
> > +       default OF
>
> You probably don't want "default OF". This means that everyone will
> automatically get this new driver enabled which is unlikely to be
> right.

I thought this whole section was guarded behind KCONFIG_CHROME_PLATFORMS.
So if the user has CHROME_PLATFORMS enabled and has OF enabled, they
likely need the prober.

> > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > +{
> > +       for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> > +               if (of_machine_is_compatible(hw_prober_platforms[i].com=
patible)) {
> > +                       int ret;
> > +
> > +                       ret =3D hw_prober_platforms[i].prober(&pdev->de=
v,
> > +                                                           hw_prober_p=
latforms[i].data);
> > +                       if (ret)
>
> Should it only check for -EPROBE_DEFER here? ...and then maybe warn
> for other cases and go through the loop? If there's some error
> enabling the touchscreen I'd still want the trackpad to probe...

Makes sense. However there's no extra information to give in the
warning though.

> > +                               return ret;
> > +               }
> > +
> > +       return 0;
>
> Random thought: once we get here, the driver is useless / just wasting
> memory. Any way to have it freed? ;-)

I don't think there is a good way to do that, except maybe marking all
the functions as __init? But that likely doesn't work in combination
with deferred probing (say the i2c driver is a module).

ChenYu
