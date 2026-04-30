Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07892C3255
	for <chrome-platform@lists.linux.dev>; Fri,  1 May 2026 00:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593648; cv=none; b=Jefht85mO6dWtlFyvXK1xzA5yz9ft2CPbwrqV2/3RLtAvM0I9zNInqJ6VTX35YkVmuYphrWt01BoEWVw0rSHnKHuJkpI8Qdq0WAmrjqz+ZTPcRoB1VI5uCpKiFA17H33ohCcCHpEMq8KqSJUwogJvKJqnwl1Hq9raLJOQNoVgeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593648; c=relaxed/simple;
	bh=1iYFrQZWmKEVWrScCekgHrk90TTezLU+zo9EhcJOGkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7YrBlHYqyb1d7+K4lIi9MZWteeMW7OKZ5kau+30wrxplVqsM0XVu/YpyTZ1P4F/yrF3iYgPj79hpvB7Jl4xz9YJkgOXrwGnUyAe6QN/U7wFDZlLIaube0cWSC3y4CwRZC7cSWuMn6XKLqusXpAEYepVWFVfgJAdgphmnW68hbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y6Up8B15; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y6Up8B15"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso639315a12.2
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 17:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593642; x=1778198442; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=Y6Up8B15J4qi8OJqptMnkDSYHA088eVc8OslS3DuHoWTe8MPjd37IzwnnU1LlSwX8P
         WEOzqvJLwOpe1vinc+FQDcrXYs28/GGzYjzyDc3MI+WSKtewvgdzV/mvh0Tr8PSYJpjC
         ji6k4A6v8wgxhpEkSxEZQCKoTlbc8OMQSdIBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593642; x=1778198442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=dXlXidHsFjOWbHF26TchT0/QOutHrMlSia3CB93J78HBHm7q2zAaT8PbDS+jeqOL8d
         iQGokbl8ipg9l4aLLRt32rqy0rn/CPeh6O2CopM55gEEPBrZAUY3CU+6eR5Lw6KsgtUg
         I7vRPDC9VT/4wMntyywHebjlwft2eBX6RbwRtnAgIOusFagXnJ6uUmWE3XFpTRghKmfd
         oGU85MRqwZM+nnC0q1lhOEDSwKqrqfFc6r/bfHS455CtX4L+5zw9gRgKSMKF9ReslJQy
         4u3Ac/C3E8c41z5XnS+5TMiW4/438lOaApcc2x4/iiRXPJPiykoFLu7wSWK45Jp+zVMT
         ZC2w==
X-Forwarded-Encrypted: i=1; AFNElJ/xpoO0emOJVYNeyHJtgeJdLW6iyLTmFsF72FadDhPrqMiv+7pgd8EzVsHfIz2bLpE/LRCRhwUyPDlxUDjguvc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvD3uyKlATY43KL1SuZYnrwb0BozQ/T3fR0iH6B7iGxFwpe729
	d6IfQTHHSw/TSYuciiYaL+xRg5bhQrFPd9LiUKqp2eBh4oOzwQsnifD51jGbpnh2FcFU9U89M43
	IQMuxWS5G
X-Gm-Gg: AeBDieuhGYDp8pKAX3Wk66fpa9FF3AL5M9WepXlrfDQQD5317W0abmsQY/UKiT/V7Pz
	BrZF24QzTSZdXslrKcWqGtUFhn3wo7EMhbEJKjOn8LGQ86gcsAisP/r9qV/goBhVo9xcijqZU7s
	HYgnDuopUqJBGc6XOnTmnWUICEMvP7lRa9iTSaN2xiAmBMVW68qlq1xpUnvOE2Pmm7hg12nKmNe
	/KKIxxA7KyU5naaiauNS8pcM+yRTQv8ezGPFQzBcs33e63b4pknWAZytqJDyBbuJ+aSarlfwNxh
	9POBEfX9Y73CkPKZzNAeeXyqt4AKri9QMLjMmHK/ockZBEG+W2mLXCuGlMoBnpR2gpZM7v/XCTQ
	xAPk1cMJL6kMiMmDZ57iCL0XgFJ9m7115aG3h4ahTpI5VwEPk77YDs0kVT1V0VZD0/8GQ6HtGXT
	71zfecGO2G9pFwklbtMsU0tBJdOuz2qxEH4xozJDbXmyVsQUCGSTTgbeMzzm/YLTFAeHQKf4P2
X-Received: by 2002:a05:6402:500f:b0:672:75b2:e8dc with SMTP id 4fb4d7f45d1cf-67b5d84ae0amr2825487a12.24.1777593641897;
        Thu, 30 Apr 2026 17:00:41 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b86e97f4bsm419602a12.13.2026.04.30.17.00.41
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:00:41 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67845996252so2712916a12.3
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 17:00:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Vvb25zLwMSdMzc0pdYfLGYH4jMoTXxLmg1uRWDhzqD6mu0ktCkr5YwkF2mW53bLGU5qZ6J3geAPpK3AddzMs=@lists.linux.dev
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id
 5b1f17b1804b1-48a83d73324mr83882365e9.8.1777593300707; Thu, 30 Apr 2026
 16:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-7-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-7-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
X-Gm-Features: AVHnY4Jn8yjvVDQMrk9sfxS2s1IXmKHM3MKByZAYOfzP-smNW0WjILYj0XY4G5A
Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
