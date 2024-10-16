Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B4320E03D
	for <chrome-platform@lists.linux.dev>; Wed, 16 Oct 2024 15:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092863; cv=none; b=D4ubLFhoECzgRfn5Ci4a9uO25+Svh/7PMnJESsPDG7iVvXI+ibhq2hg8hqhI4MrAPHYDIja0SYTk3Q0eqIA5ucDVbEw4GhQU216/ZcFq6tLg19gQoLacA7ukxLM4blHnA2BiXluVDHJEeKwm3pWjQn9QRKNrbsrS0I0ezEO2Yjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092863; c=relaxed/simple;
	bh=nJMbjUcKi6EbniPKKMf5mPOzUN+tw8qhO/6T2EniAjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDerAq17FMNln/FPH0FQI8/Gr2bQh57WiDrxFpjeuU1DYwGDLsAddaQzWwbaRo6Al0avNJlVPhiMnXDl3kpeJEwDwCGAnrL4eTeHlSpDAmiJl0LWh+mAsyANeVbekfjFs4W3YtMTISvZomkjoLmRnNfSYZIIMim/tf1Zg3aAoqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Np35KTZL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Np35KTZL"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so3882608e87.1
        for <chrome-platform@lists.linux.dev>; Wed, 16 Oct 2024 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729092859; x=1729697659; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJMbjUcKi6EbniPKKMf5mPOzUN+tw8qhO/6T2EniAjY=;
        b=Np35KTZLC3x+5nq2XJz6Id6aFjbuaWfJzcb78YpQYUx1MyxR9zGYWHxkz4d2buuVuH
         U3IrimLLY15702ieKSbd5+vZtAzXUM6HsnFG5bdew3aS8iWtRki6WLcSPE0K/KFsSD/g
         a3U5m1oi8ZCm68v6QIrXPbv67Wvt3vRITVG6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729092859; x=1729697659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJMbjUcKi6EbniPKKMf5mPOzUN+tw8qhO/6T2EniAjY=;
        b=L9Dkra2H883cJ4Nfq8tLRD2aDhgaqqJjrnEVadNfwzPrqOMjuMUESL/u28RIPidtMM
         PyD/x5eQgAOaLo/38gfP9MKlGDnWW1xDVG23Hb8TVPtzExgGu5qYqiw9DJEX46e532WC
         jHhnnwUiPL+zhtuNbn78YOtCl34dHBIeMd5am0X1kZf1AJ/HOAiV8qKBgBa6kLpLFk8+
         ErlBk1dvsl+UOrT0dvZ4vP8YtnCUFMPnzZQqY+hHsgQvHJzDuF6DE72rGqPHStchaxci
         mH9MwcyfADm9vbKbSkrKkc7Oxo4hIhSTo03/Ifg0LuLzJU01Yq3CPStBxZy4o0sjc9j/
         srEw==
X-Forwarded-Encrypted: i=1; AJvYcCVzeM2pN7aW/0Ytl5dmY0h953b9ChC0VI7jDFkuk2jMRyfEudOiQsSaU+x8TiFFYQY6p1sa6Q31xFTbdImN4HM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvZpjvthFwIoIkcUEydWMNXuJWcoF3MiT5pfjDqXOiligEgTQB
	o16b31QXKowN+p0238n132Kd1LXaXZsT4RighZGHtxzAzVrjq2kBqGpelHKZIOB5/xgPokDVWus
	qB/Ii
X-Google-Smtp-Source: AGHT+IHc9J8k9O4E49YN1RLx5Vi+03oCXrxwfocNwCLLgK5sJ9Ou4rLGaUQhoH5+aMdD5y5mAjKMUA==
X-Received: by 2002:a05:6512:a8a:b0:536:54d6:e6d6 with SMTP id 2adb3069b0e04-539da3c5ecbmr10120790e87.17.1729092859273;
        Wed, 16 Oct 2024 08:34:19 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a000134basm479230e87.250.2024.10.16.08.34.17
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 08:34:18 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb4ec17f5cso32784431fa.3
        for <chrome-platform@lists.linux.dev>; Wed, 16 Oct 2024 08:34:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkjp16TmwNMAj9+TPU2lYV0kXHfkiCb6bQixW1/45MrpgsBOosAQIaPL016nOTQyXWg6AstYAKe9y0nHMcuAg=@lists.linux.dev
X-Received: by 2002:a05:651c:1509:b0:2fb:6465:3183 with SMTP id
 38308e7fff4ca-2fb64653a19mr17100581fa.3.1729092857448; Wed, 16 Oct 2024
 08:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-7-wenst@chromium.org>
 <CAD=FV=X+_iYi0_RSakh6bzVYuNpiqUvjHTrL81n8h4dO+WZf9g@mail.gmail.com> <CAGXv+5FTdNqK14OYe=PN5_BcF9Ve7-FyBTKz=mJ+1QiiUzu0_Q@mail.gmail.com>
In-Reply-To: <CAGXv+5FTdNqK14OYe=PN5_BcF9Ve7-FyBTKz=mJ+1QiiUzu0_Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Oct 2024 08:34:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XNZJ82e2rfMicAiXmxAx5hwydsnMVO8naaakRfroyNow@mail.gmail.com>
Message-ID: <CAD=FV=XNZJ82e2rfMicAiXmxAx5hwydsnMVO8naaakRfroyNow@mail.gmail.com>
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
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

On Wed, Oct 16, 2024 at 12:49=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> > Just commenting nits, so:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I assume this stands even after Andy's suggestion to drop the gpiod check
> is applied.

Yeah, sounds fine.

-Doug
