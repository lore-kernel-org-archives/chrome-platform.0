Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39331FAF13
	for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015146; cv=none; b=cJbauMhy9cjfLGEyjbezWovl72Q6oqs8KkY2qSWEegfz1iHO8C3Do9ijRg7WbYuDyieHCipi7yCol8R2f95sWgceKP1Vmc/dFGiv7iyGVGswL51m2CORCPIF7UgYztYPhFQZaDJs9CCIpsx4JfxJVga2kBsNJxAN17SAdZgsieM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015146; c=relaxed/simple;
	bh=d+ea8ccZvUXgrS7wSLnvXQm/IOSNZR9uPNXAF5KAZsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CswqjPsVOwA+PKFnDTtIM5/ett/ymaC8wG4SvipzWANA63uq3I/kd7anMjcE0jBYwyrzYgJTDubXNllPrRq75m1pwkhX9fMDoGgSBlzUlHyX2fOa4wBRbeWl2SOQkI6wNKa+FKaG08rNJOYwWbBNAsRkNbufXWTxOGlK4Qw1fXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bwzaBqUX; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bwzaBqUX"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539e1543ab8so6722220e87.2
        for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015140; x=1729619940; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+ea8ccZvUXgrS7wSLnvXQm/IOSNZR9uPNXAF5KAZsk=;
        b=bwzaBqUXV2dd+maB0x+kSJYnWrEctJkxW83vMYukOZ8EimO0fBrGt5Zmt45knUqSPk
         NvNGVPkBXOKWqVsdpsAoiZBbtauOqq5oZOs2KSPKF2jfXUtf0vTX/hhrV1bwmTkJwlBh
         ONGFZq/BIxnhsiD+Kon8tSoEOiyxHgOsUBHDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015140; x=1729619940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+ea8ccZvUXgrS7wSLnvXQm/IOSNZR9uPNXAF5KAZsk=;
        b=qyqPpfi7FVw06YJhubGoB9rFE42pCHs2+pQeKmRuUVtCcTC2IBcoH4oAZQWWcdYQOw
         ZIyizlmDQq6jhWUPBHGVnU63Oif3hn2W4bQp+cEmpP3GFu6448XTdlGn2oasVLtMnS1c
         gNVQL4OCFyZ+4PGvy60OsZgDdfg4VfbAmnUWHdV1bAUaZW7l84lBtu41X07sQ0oLQTmh
         1hDrc6/KukIUXnLwHjWB8te31uZ5FE10E60Mhhm6k5Kb1HvJLnkIP3nPPwJWjLcru1t2
         VuiA6gVnHvWctywJhE1PKoUh1D9YFP0DHQUMo33Qjf2b3R3VDV33qDsibEEeqaWgKfLT
         ZtCA==
X-Forwarded-Encrypted: i=1; AJvYcCWzAVqj5CFkbY5xjSX+c3JqXEfAmKo3K0v3R+iFbdQAWpGRWNuPcIGNgzzmdS0wIQwTN70bTBhB6o9iFDBpI7Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2NvYqwrEdySjqEmlc/cYlSt1G9aSCRSPjPKcQHIR+Ylmihj3D
	V694H5Q5HwLCREwb69S+AlJjJxsgnhLCMEPMEvFds4K0K6OUSzu4co/+86v6+22bEsZMTDICdLU
	kVS+P
X-Google-Smtp-Source: AGHT+IE8RWE8gTZhNtQ0+z0uvf0pIQ+d+nDZI3JNMKebnWwV0uUo+Vl4wVJ7ipHDqqYwvJovs4GDIQ==
X-Received: by 2002:a05:6512:31d5:b0:539:a4ef:6765 with SMTP id 2adb3069b0e04-539e54d76e1mr8828338e87.7.1729015139678;
        Tue, 15 Oct 2024 10:58:59 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8d48sm222994e87.37.2024.10.15.10.58.57
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 10:58:58 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f58c68c5so4297863e87.3
        for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 10:58:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8qDzeKpA/7aw67ILy66c/8HUQYgznu0T0v9iS/CABcIiTfrC7TWP5xpF2asggIoXK6uMRx+e1AI2leqx/NVs=@lists.linux.dev
X-Received: by 2002:a05:6512:3e01:b0:539:df2f:e114 with SMTP id
 2adb3069b0e04-539e571c9femr7438846e87.45.1729015137476; Tue, 15 Oct 2024
 10:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-6-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-6-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:58:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
Message-ID: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] i2c: of-prober: Add simple helpers for regulator support
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

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> +/**
> + * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C =
OF prober simple helpers
> + * @dev: Pointer to the &struct device of the caller, only used for dev_=
printk() messages
> + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> + *
> + * * If a regulator supply was found, disable that regulator and release=
 it.

nit: was the double "*" starting the line above intentional?

Other than the nit, this looks good to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
