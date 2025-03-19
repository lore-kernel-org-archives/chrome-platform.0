Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C0724E4C7
	for <chrome-platform@lists.linux.dev>; Wed, 19 Mar 2025 04:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742358249; cv=none; b=khhDL5yzuu/Givnr7aSehyTf2AO/k/aoMt4NGOO1aKUwwsrDIuLXrWy7nw72Evi8eJ0yfW7SWT9al2mWNKebEwuL9ZvVG7hEfILYLll9ejbcU8TFS/B5YNFazwj3SuCGNX1iPtK0hT8dsPMYODyM8sHoTzB7WefLo/uWJu9Tb4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742358249; c=relaxed/simple;
	bh=a2qNyugN9w/uB1pJA1qv4/kcNutyjnqoIx8nMHelY60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0yR7c3jl6ldAnoiQDeEy9rVA8xGob9ukn9yn2eVgb2yjvx3BkKBU48DwC+/DLb3kWllnWnuNLF75s6SLf49ZY7kfylvHySKfXKtIeW2u8hSJ+fkW4FQFcb4EOdkxAkCdLq7RnVGhJR4bxcFJVN7wd8x0Chf4RLH1d83wqgyefM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UOPHh03B; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UOPHh03B"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499659e669so7082362e87.3
        for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 21:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742358246; x=1742963046; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2qNyugN9w/uB1pJA1qv4/kcNutyjnqoIx8nMHelY60=;
        b=UOPHh03BKJnuVbxlkEhmGRfQ1DS/lIOoK1yqz7/RukgHjOHG3IIM6iwkurghtvn7+g
         HBvPCeh5ItOJBNRCW43b+vyLLPfAWiV0cAoFu6582aA0oVa5LB8xW9boRPK/eg6ZwYtr
         /Zhqf9XVV+e9qGtmSBPoHhAAbmsiKZlYIggdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742358246; x=1742963046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2qNyugN9w/uB1pJA1qv4/kcNutyjnqoIx8nMHelY60=;
        b=rU3y0F/vyBtUUW/r6b62nBEZ2vXa6Uet6yd1g6Cf5ySr09m5LMTwJa+QrnMDmZUo6c
         0xa957h+35JKeBUqSMAylKI3uAyDF3NKGwRTed+6FoMQ5CoGKTTBkRE0IeNnzxMQ4HUT
         crtMIgKolvlyfteomw/OCG+xkStsc+7L5/BTkbYQny8WGOfPY2191JwrpWbjJrZdRJOV
         6cx/zGcnQMg0FlCf7OUqZCw2ZofMkVinYMdfJGn3ogWskC8gby/HAGWsXsQTxE9E4L0+
         +BgRXNjDp2dMxTW5pK2H5s20ZcWvzfFhQ66FjI6njG+N4TSvH3yFrnsrOd9XHeAQcFRt
         RI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYVGggXn51FXp4UCrkIR8pgWYt24FYA+pF3YYuoz7kyGVkhqkCM8fJCbi01wOExN2Cs5BxtIFpLJWun3/hb78=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMMId0AyqYmwWtgRdUan/cWMss0iCwa/txlHlmi09syrS8pJpd
	etRgS/9gmsslKKtimWHCNpBU4YejPrGIEDKE7xvlgw9d+O/6e1I3+VC0uYWJieeUUbCLnVcq56F
	OJvCkSXWyKCn1fdzDVYA1RhgbmVkujtCIw1by
X-Gm-Gg: ASbGncuj7g+nu0ag/Df7f4emSz6ZSYeCJ3qn8m926y3WB3+cZerSSBklwJ69KaaHwaP
	tXqaGv4f11Fgg1L4JF1Eok3U8/sw76qdr1+SAhcZ5BA+UBunvPJm0wj07q9w6BOl7geyqaxgS8S
	NrPfDp32v7FCmj6uB/QQ0v6YMRwk0rgymoFX4hpZY3ajsOya6GdhGu/A==
X-Google-Smtp-Source: AGHT+IEWZEscaVFUOUAsNjIprCbhq625oZrV53qjtBJsRwdVvGNmpIniSb7MX6P22AGKIV1DoFhBcxyYIRqcNBKHkLw=
X-Received: by 2002:a05:6512:2342:b0:549:8cc9:67d1 with SMTP id
 2adb3069b0e04-54acb2050cemr276298e87.38.1742358246305; Tue, 18 Mar 2025
 21:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250318102259.189289-1-laura.nao@collabora.com> <20250318102259.189289-3-laura.nao@collabora.com>
In-Reply-To: <20250318102259.189289-3-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Mar 2025 12:23:55 +0800
X-Gm-Features: AQ5f1JpqtWWWC0q87IWTa2_visyDIAAE7HlagkjknGbBQwFRTMIurzAoihaTquM
Message-ID: <CAGXv+5E-G0BY5q_EsxOkEEJvqXaX5=Y9PWqNbwysLEFfU-UmAg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8192-asurada-spherion: Mark
 trackpads as fail-needs-probe
To: Laura Nao <laura.nao@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	bleung@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	nfraprado@collabora.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 6:26=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Different Spherion variants use different trackpads on the same I2C2
> bus. Instead of enabling all of them by default, mark them as
> "fail-needs-probe" and let the implementation determine which one is
> actually present.
>
> Additionally, move the trackpad pinctrl entry back to the individual
> trackpad nodes.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
