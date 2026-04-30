Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A91371881
	for <chrome-platform@lists.linux.dev>; Fri,  1 May 2026 00:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593663; cv=none; b=gPgcv0gnhlsg64LuwQ+RJJvFp9roNaDmjJy2/mBMk2gI1YDyIXxPsxBV+oHvqj5W8NlciXEUEi0YWROI1xc9sK7O8xtZ9S+fILVrteGDoJ6ehWdpjLdjsIfOui9+HCUkJiCrCviCq6Yj1EDXpB0VztKNNCiZJw/919ZJTVyJYxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593663; c=relaxed/simple;
	bh=sQxuhOfm4oyjjyHRHwYJHnDekKF9G661/WNU4U8f4VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7/QC6tDxAtGFhIqdog1QPyl2UGnyO+bBHwKhg2yRMpuI8lln0HRTLABIog6nlN3/LimA5G01WzgTwMfwrPaGLqJNkUgQugpiRGQ2I3Kmowykjf0iIu3hE5IWjxcjbyzdLIMz/gmS3Mt+SVVMpE9nLFhN1vL0WbYGHFfr7FJbhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a8byW2Ms; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a8byW2Ms"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso193214566b.1
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 17:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593658; x=1778198458; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=a8byW2MsleKVDQ/0PxpUx36r0nrzFzM0Xrdijt/zvDuBVQp4/B8MtsqIPo8fagWzww
         4lZKBppt+EjvAcQlFjWcvhBPALf/FuMVwtWScG/WArHZCWUPaKWaU9i7YT/Sn7Kk8x4z
         texrY15AkLqTX/DrwnUMzoBoQUK19oCKMBUNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593658; x=1778198458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=i58BNL5JkYvcP6XbMBgvO1+Chvc2iLKZLIbc0/XWn8FyA4/Mm26Wu0eAaoszR9P4lD
         bgQz3EbkwfZQUqg3Me9VlhbpNZVbuQK1aZ1zjHT6iT7OAGFK4qrHorWYRMGwNw0BoXpp
         6n+DL/tSB9FYNjb3MtmZZmhlnaHaAsVCUVz4m/n64bEP4ALrLrT0LGc9MXUzHap1ANyz
         YVGjev10nxxr45SlydeDZDbYIAPJMnBctPmXvRbT67VK33Q2jl1icrj7fdAn5TkuobK9
         w5ii0vaN5JLOC/bWh/zswkag2yExvzgV5bkXYtvzCztAYeCG2IhoFFjqgZ1VC0TZFx4A
         ZT+g==
X-Forwarded-Encrypted: i=1; AFNElJ9KLGWxljiAdBrqwWH4JSpWQflVK4JoEyai6EDTfnoxxq7x+GZhKD1MgknFahtOI3nVt4YhEj78Ozh/LN0b354=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+IsVGc1XHaGyWkVWWgq3Iis4tFlib0XaYPSCjruer2Yogd9ri
	3J1OgnmK80ZZBQvwl74xi0jjkx7aOyoNhLS0KlnIHAXwigfz9/KMcBeDFFeqblJnvmTx3k/7K6e
	nqFZNLx4m
X-Gm-Gg: AeBDieuq32HCtcWCltjNjYKri3BxV/KPmJX+3kSdrWcXfuPWMrFMCToccbTKfKYdSKU
	0bxTglV+Paqra3K7mtTTPL9eni01V4rnQ/naxIIEUoQ+lhHwLFGFP4FCsyr4miagY/n48w6/O4v
	qJVP2yYCHFMd8/O8DxTZTMfgmskstq6rw5D7OU0u+Q0idhlpSGY+ELt4kDmDpsS+iLEwwtwuDjI
	ArGLAXQv5E+8QLM3TcDOGnU06AzQeLks5oEMVnSXHoVSJGcOqjZ0EA7e60Dfn+WpZYlNSGBw66G
	47YC/JrwLIcqyb/MDvosxOlgpRTQqnr5IDKfNqKRyPn8lmbV9H3xip2AszbRPM/C9Oq1rWLqw+b
	D9Uk6DgIuH0bdn9yrgZ+z9woJ6/cwgW76zk3ybKq2aQQ39L4lihICJTYc5EpO0swAFOa9jFztN4
	aM0xUU32HcFtfTDQzibgnA12nJ4obM4QcOmKU6UZXmVzvnLuo519YUbRD/crhjwdKKIOgVzia1
X-Received: by 2002:a17:907:70e:b0:bad:255d:b5bc with SMTP id a640c23a62f3a-bbaca1f8a2bmr330967066b.39.1777593657626;
        Thu, 30 Apr 2026 17:00:57 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6db6f18csm48389066b.57.2026.04.30.17.00.57
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:00:57 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ba36357195bso197867366b.0
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 17:00:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+/TcWLBZcjpv0Af16enpYOFkYQlXyTz75k1d/tPh/Q4H4Rnbe7j48IbEdXrpju1KeDAi0B+PzJPkFcktOiA4=@lists.linux.dev
X-Received: by 2002:a05:6000:26cb:b0:43d:6fb7:fedb with SMTP id
 ffacd0b85a97d-4493ec61e55mr8612204f8f.36.1777593293572; Thu, 30 Apr 2026
 16:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
X-Gm-Features: AVHnY4KLFGb62k1dRvCKyy7EF6W0tPNO3zKHC2HCyssJ_nJGpMzpFc_-TEUNEXc
Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
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
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
>  6 files changed, 30 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
