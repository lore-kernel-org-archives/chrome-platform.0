Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4851DD54F
	for <chrome-platform@lists.linux.dev>; Mon, 28 Oct 2024 15:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130191; cv=none; b=Vw2r8v6alF421rIknK6PqcPraFghga1PrKa8bUAkDmS+Hb7Bp7FMlsF6G6jG0VH3ZPgiwZMp0b5xHLyn3I60u+MQ28xrwMlwYUTzdfBRrbNZwHUxssC5Q8SKqpys8o918AnYFs9VwrWHEc8MU5Ydbz1No9MLp8ssUUPiTb8d9iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130191; c=relaxed/simple;
	bh=XVo/3bwi+PIOaKUXsNSyar2v36pwhDUCgR7r4pY4lo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XCSqdpCgkbJzsc5rZIUtcHMLl3KDbsDf58q/DcESJ8xcjqYFaDbfN25Dz5f8RtLGftbb6C3kpODaddZjLz4963aNWHv7dvc2GhTKwuBOjPYQDwkRo3iyHA3s7DoaRgQGcomrAxiN1RrFKscTTqBx3cy3plWruFU09L0C4cOVkac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gGIIUXN1; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gGIIUXN1"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e63c8678so4470176e87.0
        for <chrome-platform@lists.linux.dev>; Mon, 28 Oct 2024 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730130187; x=1730734987; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/+Fm3T4pn4crwgwgU+f7W2PGkdCB3Gmk2ieoRtXcSM=;
        b=gGIIUXN1b6EtBtbLJN3TmHsJ5KZfzcwHYIAtnhnQJmxKsYYLncJYTVZYbsJQc7VIQH
         U3nml2zyXKL8uFLZMIokiyb8hgccJWnVKeD4sfkb3B1t0y5FoYOesWoDJfIkW6grmVyk
         Or/0At/NF0QWNlfWWoC3DIveY7d3xz32xhZZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130187; x=1730734987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/+Fm3T4pn4crwgwgU+f7W2PGkdCB3Gmk2ieoRtXcSM=;
        b=nMZ6ArAwERtQCJg9Tggrf6NBDhVQ8IKdKcrtY1/tnAiZbUo6kOJkHve3rM3Jjg0LNu
         0j3KaSteoLb8XcXG3AHcFN8kYWZfNchJJ/SMeX2TSqHF+rT6Gh5QSQQau9hxJeZYsoHB
         e0Xds11COG6YXrWSzVZTxbJqFb6xQOxEjSseSP679ibZ0MUhdWL77sKaxADdMxfhk+4A
         QWtWsswzEM/KM6RTw3Vozi34LuoZJKNLMthQwlGXLyzX+lUGV5YweRaHs4raITYlZ3Lj
         szvUgAHo9QFij8fYHqirV7DxHuTvk7c5CINdRevAMz3GIClEfKS3EFc+scsH1rIFEEYF
         KdOA==
X-Forwarded-Encrypted: i=1; AJvYcCXZjFR/k1HWUetP+n80dynenX4Ag3/nTHnQjHjIZbzr6DCT/y+mx2uY1PRUmm97x6WE/bRWwX9emEuS5t8xUIA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLLAQpFjeL9JQxcGaV/UWvqQxoCklb98+Vv2doNkJayhGLmZH8
	vLlVJ4l5FJVlqYtHDIi7eqc2+J+PyIYeGmX1kO9ZLJ7NFmpHI4FaT4cjb9LVBK8HgwMTO7bR9+u
	jRA==
X-Google-Smtp-Source: AGHT+IEbaFuJrgg9H/tbLfcRccgoQM9f0n/8k5IHlTBNih+jL9oBBA6vkooMYtBSlPjCtYt4HO00lQ==
X-Received: by 2002:a05:6512:a95:b0:539:94aa:d512 with SMTP id 2adb3069b0e04-53b34a34618mr3573431e87.53.1730130186763;
        Mon, 28 Oct 2024 08:43:06 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1f40a7sm1112797e87.292.2024.10.28.08.43.06
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 08:43:06 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso41951601fa.0
        for <chrome-platform@lists.linux.dev>; Mon, 28 Oct 2024 08:43:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWekgipftGIae78m3ffzg9H5brwPXlPCBM7Q5QymuGqQVfqIF8eG2jng/rVcrqlqgC5e+2HCK7FTbvl8ALHORc=@lists.linux.dev
X-Received: by 2002:a2e:bc0d:0:b0:2fa:d9db:7bac with SMTP id
 38308e7fff4ca-2fcbdf6250cmr34338691fa.3.1730130185979; Mon, 28 Oct 2024
 08:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-8-wenst@chromium.org>
 <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com> <CAGXv+5H8kxrr=JJsMMY5Y+HC5JqMN-bMkm7hztOzQgrbew6-rw@mail.gmail.com>
In-Reply-To: <CAGXv+5H8kxrr=JJsMMY5Y+HC5JqMN-bMkm7hztOzQgrbew6-rw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Oct 2024 08:42:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbTMLr8ybCvKwm4aau+UkwCewuj2mqFX_+9hdCALLBRA@mail.gmail.com>
Message-ID: <CAD=FV=VbTMLr8ybCvKwm4aau+UkwCewuj2mqFX_+9hdCALLBRA@mail.gmail.com>
Subject: Re: [PATCH v9 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
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

Hi,

On Mon, Oct 28, 2024 at 2:14=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> > > @@ -35,6 +37,7 @@ touchscreen@40 {
> > >                 hid-descr-addr =3D <0x0001>;
> > >                 interrupt-parent =3D <&pio>;
> > >                 interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
> > > +               status =3D "fail-needs-probe";
> >
> > It's a little weird that there's no pinctrl definition for the
> > touchscreens but there is one for the trackpad, but that predates your
> > patch and is unlikely to be a big deal.
>
> To be honest I'm in favor of getting rid of pinctrl settings that
> do nothing more than mux in a GPIO, as mentioned in my talk at ELCE.
> Such settings are already implied by the interrupts or gpios properties.
> The fact that the OS doesn't enforce exclusiveness between the
> subsystems is not something the DT should deal with.

One could also argue that the fact that the Linux kernel happens to
auto-mux pins to GPIO is not something that the device tree should
assume. Personally I have never liked the "auto-mux" behavior of Linux
and I've found that it can get in the way when you need to do more
advanced pinmuxing, like when a driver needs to sometimes use a pin in
"special function" mode and sometimes in GPIO mode. The auto-muxing
happens behind the back of the driver which then needs to account for
this fact and work around it. Just sayin. :-P
