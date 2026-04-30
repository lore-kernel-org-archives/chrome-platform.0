Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156BB378D7B
	for <chrome-platform@lists.linux.dev>; Fri,  1 May 2026 00:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593667; cv=none; b=BJxCM9j51cPd+eAOHBHKUsjfSHZ8pUYJ8KzhpQKHDgecSkemuD1X0+eutyNtxbBS4EnHix8PF0EC8qEf72XZ3viVl5gA52heD6AY/8yVygfxknVPkBI75IO0da+2STa/GgZrvhOvPYU/kGTZC9E2RSeQirwrLf1Io0XwXsl2jmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593667; c=relaxed/simple;
	bh=AAia2qkIDmebyJmcu5PDgIuA9G3bwKwbRmrU6wAzc8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMUmG7LsrNin3/MulR/X/QkYoK9pTK4JFU13gGXsp0nJhyQtf7ftHSskiHjkjVggiWDjRScRcnGeFSnEWguMwef+PTkG/J7oTEVOFXIHiQPCOjVZ2RUaqP19ynAPBTpJSXXQePNHVdzEXu1ZVeUIcyjV0/m6NDege6xNcwX3upU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Eqpikabb; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Eqpikabb"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38ddd8d3b7fso12771421fa.3
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 17:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593661; x=1778198461; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmXN7WSIeoo9s9Ua/S5/Car8IH3Zms7BcEHEOsscCUg=;
        b=Eqpikabb7MOfTjUHqc6NGiW9SpbLqay+Pdrzp07Ug5rGsRI3TC/WO/ZjcSR1cgDojt
         bEuiWkm6yPNChMmRLODnbCP6ITSHBYC1J7O2at3a7BNTL4DfxelgDbczjJhDmiQulr7r
         MaEmEyR51gCDlH/NzZ23bDQjyFv/95QSuf+ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593661; x=1778198461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmXN7WSIeoo9s9Ua/S5/Car8IH3Zms7BcEHEOsscCUg=;
        b=XsO9ZqV51GeBesxj9rHaM9fCjLpXZZYX7mVwZ/6Op9fU8Kmsg4PPsmUYJyJjCPASyh
         ieWV2YMUAcHj3KEv893GKG/DD1mLiGWyXZcLajWoncwUsXLDUcNujzmHiU5mkmapcFGN
         +v1ZpXRV12iemkDZZknO0NQ9lp7li7p2sqWLD8wmuk8wjgXGTkpi6AzmJktRF9Ylv6VQ
         i7dt4tauvlH3gmQP9G55TXyjEZsRu/9fY80iwZc21ZPaEReQwt6AfElI+keqks/Mdzq3
         1OxTinl9W0Tihp+iR/clG3itYb3y2BxBNzrbTNWvF/kQ4lAThKvt5e2J0/fXvxWmt06Q
         TbuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YSOLSViBA20JKTGrvF+cb7McTxoNN30pwJAb90zRzF34LhfYUugf0Oda6bNkZSdo0aIqMEqEYbiEhCdxXoyc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzuKJP+Nh5CQMFKI64duOz1AuMQClwSyy5ci3SgEq2NwqJP8Kch
	7J4JFznYFtSQ0O5qA4sIefRkvwRylZpvVxFSYQM7pBg0eH7niUQD4F+asmei/4hORzPdkwuWlEi
	48KEMtMb3
X-Gm-Gg: AeBDiestJm/5wZwn0qlQCbOVuR8UPQWJ+kpx2AkOdFZbQLx62StXVjAjfMcnD8zhfQK
	VaOdZF3a5m+YzsMakluoyvhAwaVqZZ2u/1lIbB3CnU5XF6B8Evynf6T92qVjVOrbEq1MFfB2kOQ
	CNYHZtqk/HxpfHIEntniSWjb1eh+nVVsCfu22s14rVPaM4C/iMjqB79E4115TKTRGCcydtJ6NX6
	aOHaFkgbiOZS/7jUgY+UteX08HN2+rLHdB5JQ5ju3O/877lwSTPESSWQQ0Bmvbb2Zu0xCyT9y1Y
	/RNU7r0IP2gh+88hMy1uvx18aJQLkrrnwPBgbbydD/4XjF3fSjlJvauuTCrGFG1RC0rYBg/PQ8e
	YDmJVRmoqO61jSmhSr/72ZVaofFlz4xmYwG3UeeJ5LyxmSAIR1Zu2V7FG+vC4snoj1vlfN745M2
	aQvSVhXI+ubW08j9LnLvxeiFDnmmI50Fg5T7X29n46313eUPWeodlkSlQW72jBEAqv1PiIrbmee
	vbv
X-Received: by 2002:a05:651c:3252:b0:38a:3ad8:6f32 with SMTP id 38308e7fff4ca-3936447cc89mr2360441fa.30.1777593660780;
        Thu, 30 Apr 2026 17:01:00 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39361090d81sm3789211fa.9.2026.04.30.17.01.00
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:01:00 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso16953081fa.2
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 17:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8mzBf2HR6sH9sMif3oqXYMrMU+LX9mJphPG7uRDuQ/m/XRaOxRr2QDzXe2ydl8NRVIG50j0qlf/Fhb3FY8rxU=@lists.linux.dev
X-Received: by 2002:a05:6000:2905:b0:43f:e16f:3cc3 with SMTP id
 ffacd0b85a97d-44a88058b32mr1086350f8f.22.1777593286514; Thu, 30 Apr 2026
 16:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-5-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-5-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XrPJwCC3bUJVQJGPwO3HifNOkK4tFd+xwNac_36kHvqg@mail.gmail.com>
X-Gm-Features: AVHnY4IqCV1PxHRIY-OTvaBqqWEOfyPxbcpa8ZWBIyLwROAiOEZ_SsblLMHW3zY
Message-ID: <CAD=FV=XrPJwCC3bUJVQJGPwO3HifNOkK4tFd+xwNac_36kHvqg@mail.gmail.com>
Subject: Re: [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to
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
>  arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5250-spring.dts       | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts    | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts     | 5 +++++
>  4 files changed, 20 insertions(+)

As per:

http://lore.kernel.org/r/afExm9HeB-FMmP4P@google.com

This patch shouldn't land.
