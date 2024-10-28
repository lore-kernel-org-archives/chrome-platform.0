Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE541192D9A
	for <chrome-platform@lists.linux.dev>; Mon, 28 Oct 2024 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730106853; cv=none; b=RVIvtKpY7kGeR3s9mBM3wNBcx26Uei+7UlexsZZiNAmB7KHjLFEXzkT4v+cXxROri4hEomgSged+8Ylx/PnPvqu5L3/QIRlAEM3goS94ekCrLHe4yORd8rv6C/3pK/iVkPGHr7q7QCkTqJrZjPaJuibI4ThUD0QkdpHJekoGNqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730106853; c=relaxed/simple;
	bh=XboTEB9di6fAr/3NESQYccJxywyXVQJjrUFONGeb1W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBmGCHXua4sUDj2VQVV3iY8WATdd4b1tSK7+6nGjIBAK9Fj1uZ9J5HkqBEdsxgxbULAmDxefHbOgT0CtnUdR3YWlIwXHhYf0Zd9nSODqO27a14zMOyIUYj1WRm4lsClnDK9NwrDDn+twC+71wwo9m5ZQfuV76oTvmqkAcFLKwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fStjKES7; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fStjKES7"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f84907caso4174779e87.3
        for <chrome-platform@lists.linux.dev>; Mon, 28 Oct 2024 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730106850; x=1730711650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7sEAvP8NG9JnAXi5TH/KAqfu5gH9AuYe39avRf1R9I=;
        b=fStjKES78YP+Y/9P0sje4YURJzeW/1N7dsdC3NhJKFSQeggp83jmE/UzbKwwn8sN+m
         lHLum/HcCDx4UhEXKXBaPAPfnINgL+63+u1q/vZb4cznIgUiHTAQYB/YCNYtwow31J1v
         IddJ6UllPosjl+kVpV+4fZiIy2MHEypduXQtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730106850; x=1730711650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7sEAvP8NG9JnAXi5TH/KAqfu5gH9AuYe39avRf1R9I=;
        b=R0gJtGGTKhR6exzVTewY7IVf+XHIvviHE6Qhal/+irJf4XoEMylM7jFWt02QGY7WPF
         2dFItRjXkMV+7RU3ZbZpP5/J+h3MmPqJFtPwlKW1ArLaMHOwP1NGxZqBSH1GT/7eN2AP
         A7OnynNh07Rt+6IhmgVr4aOJs92emWso0qJq6LqDKrwx73A4+zxMUB45I8s4zR9vIegA
         m4Jtl8ssusWI4vD1SSFGxYVkH5dujI0MK0mcEklR4wNT3EoQr93scVr6pDmuSYjjIoM/
         p3TTS0K8pZumFRyXaGVzojyMtA9go1PoqamtaEc00hoFHyTAVe+sWdm+ziXLeQTBsnMv
         Elgw==
X-Forwarded-Encrypted: i=1; AJvYcCUr/tx+iv3cQhD9YPIRRvmqom5Y3RwLq2RbpfUiEpnYwM2udKY3+t+VIvm3rIqpPgdio4YZTi8sjxuMAMe4y9k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvOvaCqM1xWDhrtEKA9PbWYNYM7d7NM+wixTcTZb0EJCqasZs1
	h1cQllWFjyLxccuBW6qMm0ZMgYdVq5bHemqBpKXjdiPlzp4CFjosgTraaoEbxA5b4bTlG7G5gVG
	ZIzNLabUHnZZNc7/vV5pPCspIMp4OMIM+i02V
X-Google-Smtp-Source: AGHT+IFPHFbPyPXoPFbsVwjDIUW/0WQx3PxGtpf1eVaSW6Z7Z3fXH3i+SJTqnAp2zN1OASRPnjVQ7nAeuz6Vm9QIUx0=
X-Received: by 2002:a05:6512:1188:b0:539:fc26:74bd with SMTP id
 2adb3069b0e04-53b3490ee7dmr2587366e87.27.1730106849694; Mon, 28 Oct 2024
 02:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-8-wenst@chromium.org>
 <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
In-Reply-To: <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Oct 2024 17:13:58 +0800
Message-ID: <CAGXv+5H8kxrr=JJsMMY5Y+HC5JqMN-bMkm7hztOzQgrbew6-rw@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 5:16=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Oct 17, 2024 at 2:42=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > Instead of having them all available, mark them all as "fail-needs-prob=
e"
> > and have the implementation try to probe which one is present.
> >
> > Also remove the shared resource workaround by moving the pinctrl entry
> > for the trackpad interrupt line back into the individual trackpad nodes=
.
>
> It could be worth noting in the description that it's a really bad
> idea to pick this patch if you don't also have the patch
> ("platform/chrome: Introduce device tree hardware prober").

I found that there's a stable tag one can add to reject AUTOSEL.
Sounds like the perfect thing to add here.

> > @@ -35,6 +37,7 @@ touchscreen@40 {
> >                 hid-descr-addr =3D <0x0001>;
> >                 interrupt-parent =3D <&pio>;
> >                 interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
> > +               status =3D "fail-needs-probe";
>
> It's a little weird that there's no pinctrl definition for the
> touchscreens but there is one for the trackpad, but that predates your
> patch and is unlikely to be a big deal.

To be honest I'm in favor of getting rid of pinctrl settings that
do nothing more than mux in a GPIO, as mentioned in my talk at ELCE.
Such settings are already implied by the interrupts or gpios properties.
The fact that the OS doesn't enforce exclusiveness between the
subsystems is not something the DT should deal with.

> >         };
> >  };
> >
> > @@ -47,6 +50,8 @@ &i2c4 {
> >         trackpad2: trackpad@2c {
> >                 compatible =3D "hid-over-i2c";
> >                 interrupts-extended =3D <&pio 117 IRQ_TYPE_LEVEL_LOW>;
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&trackpad_irq>;
> >                 reg =3D <0x2c>;
>
> I should have noticed before, but officially the order above is
> slightly off. According to:
>
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>
> The "reg" property should be higher (right after compatible). It's not
> a new problem with your patch but since you're inserting a new
> property you might as well match the new dts style.

The entry in mt8173-elm.dtsi is also in the wrong order. I think I'll
do a patch later on to just fix it up if it's a major eyesore.

Angelo what do you think?

> In any case, nothing is a huge deal.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!
ChenYu
