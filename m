Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEC21EE031
	for <chrome-platform@lists.linux.dev>; Thu, 17 Oct 2024 21:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729199778; cv=none; b=ntmBxaAu4gJ+ZAn8kcn2FnQ8dNiT9Il733L6DLhMyUrnr63WNyd33EwtK85/qYPHh/TKTNlRyjFWUBplRkCrxFIIm/0A/zz4E7JLfa3oUlupy7vBn00ucri/Xegnm3kqPF4oZklbhg6QLCtiYXMCQSvzHa+QTVNf1n6g3EJ6NCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729199778; c=relaxed/simple;
	bh=wQydXNcWdpTBzZQKKEPkKWCSlf0fQmLAmN+bYKHMIS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4BosHvzT9IhRkeolg3e1ricMb2Bi+PaZb887bBLbLNSOW4MhUspx/j/XwyumX26gGYKXZEAaO4td4wcFdi+DUXR4pFiu+wyQ48WFD4Q4mCQvp/RgWLErceU4wnJWbrNzHb5Y2tWtW0p2ub6lM238MapKuvE++HC6tk7Xxib4Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V+gB4tTo; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V+gB4tTo"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so15735331fa.3
        for <chrome-platform@lists.linux.dev>; Thu, 17 Oct 2024 14:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729199771; x=1729804571; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwSGZxm0nPOCcXElvwF4s1O3dQZtjR+E7hVy6q0TNNI=;
        b=V+gB4tTo9Ue/YzXgAB7XmGp8DunzfP75OU7nEwZAdA4B3AVtmcclYFbKLFr+nX4cwH
         OwsZOOcBKigkOEqLLlX6FqITLNPnVvRgkV6PgEYGibZS7lpCC6jy/b6mIYR/urVFUZnN
         svBOPzJdkXob4T3C4sd7w+VLcFmsEkyT/LYxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729199771; x=1729804571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwSGZxm0nPOCcXElvwF4s1O3dQZtjR+E7hVy6q0TNNI=;
        b=CJ6aX6HTUNEu3lXABLpd02B7wYOelPooLi7Y8JKdaB8bdyBQeA30KPO4RuAjK6ZFzt
         X6Hdj3Cre1wv63vtfb2cOMuAq+3997rvtePF0kJE9cBnzXB0AduzSWmGB8tpOq9RliZK
         O49TfvCRh5+Ao0H3B8IBwZvvhSTjn2PuMN4bcMqw7Cq7YS9dMYeXO+HalocR0AhxvkiX
         /Qsy+O40duDfZEg17WxgzEJZPrMobP1iz19TBTwREOMPQp/MdPjcdynZ1n8jecmfbP+1
         xijF5vj20vbjWDt7H2+kdzfFwKLCGq7GqD8H6d6FcsPaf5Ngy/AbMLCQ9YiNEp/CWqA/
         tngg==
X-Forwarded-Encrypted: i=1; AJvYcCVc1PbXle1QTU6AWE+CPqeWdshrm5Tcoqd3CkP5GXSbWmzK6xriJUm+hBMII/OdaVXb37N1w3BkSbVN9Ml4hOc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq6Pxt876DpgYZgSSOVyWgtgxeX11d9BHK6CNnovqkmatnXz/i
	im8pC5fbzfW1JUexCUc7gdLXIVlM7714WDDO1CcicYrsHCVGbj4JjVlodBR5Ddlxvu3LFwBK4MV
	kEYnj
X-Google-Smtp-Source: AGHT+IF/cWeo9ysyiVpG7xgOrxo3F/22EJLNAGHX/T6K/Sp53rbYg41RkK0VcW27XwE8gaSqYyFI4g==
X-Received: by 2002:a2e:4619:0:b0:2fb:3b5f:1875 with SMTP id 38308e7fff4ca-2fb82ea5184mr23761fa.18.1729199770545;
        Thu, 17 Oct 2024 14:16:10 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb80a08911sm317081fa.108.2024.10.17.14.16.09
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 14:16:09 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so17965651fa.1
        for <chrome-platform@lists.linux.dev>; Thu, 17 Oct 2024 14:16:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+gy09Oe5NmcAy9mahG5LXMGayfwZFkaFXrjp5OH4p5c2LJXLvi1dA28u0nLYbmsonmIL0gvtOIGKdUhSrbxE=@lists.linux.dev
X-Received: by 2002:a05:6512:308b:b0:539:f754:ae15 with SMTP id
 2adb3069b0e04-53a15445ebfmr181364e87.41.1729199768852; Thu, 17 Oct 2024
 14:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-8-wenst@chromium.org>
In-Reply-To: <20241017094222.1014936-8-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Oct 2024 14:15:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
Message-ID: <CAD=FV=X-YzEGEc+tp-uB6vdPMEC-V9M=Gb60H69=_XY9w4R8nw@mail.gmail.com>
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

On Thu, Oct 17, 2024 at 2:42=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Instead of having them all available, mark them all as "fail-needs-probe"
> and have the implementation try to probe which one is present.
>
> Also remove the shared resource workaround by moving the pinctrl entry
> for the trackpad interrupt line back into the individual trackpad nodes.

It could be worth noting in the description that it's a really bad
idea to pick this patch if you don't also have the patch
("platform/chrome: Introduce device tree hardware prober").


> @@ -35,6 +37,7 @@ touchscreen@40 {
>                 hid-descr-addr =3D <0x0001>;
>                 interrupt-parent =3D <&pio>;
>                 interrupts =3D <88 IRQ_TYPE_LEVEL_LOW>;
> +               status =3D "fail-needs-probe";

It's a little weird that there's no pinctrl definition for the
touchscreens but there is one for the trackpad, but that predates your
patch and is unlikely to be a big deal.

>         };
>  };
>
> @@ -47,6 +50,8 @@ &i2c4 {
>         trackpad2: trackpad@2c {
>                 compatible =3D "hid-over-i2c";
>                 interrupts-extended =3D <&pio 117 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&trackpad_irq>;
>                 reg =3D <0x2c>;

I should have noticed before, but officially the order above is
slightly off. According to:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

The "reg" property should be higher (right after compatible). It's not
a new problem with your patch but since you're inserting a new
property you might as well match the new dts style.


In any case, nothing is a huge deal.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
