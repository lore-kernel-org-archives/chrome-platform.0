Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C63D9DAA
	for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 23:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593266; cv=none; b=dghk77h8aJxI0weRO/jzLOi+xG9I9UYjDGcNFbLE2tkeTdDrijFYguid3AYf6leZCAm3rd5jt6t0Egzg+NKUNZMSIxYtMdX2lDPN4xjMFpB1kzhr+AILZOToe0Sr5eenjgqKeXUTRBZ3zW6UGbyRQERMePzZIPTbUWpzTRUR6wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593266; c=relaxed/simple;
	bh=K6HjmbNrmRNPQFoeUy4vXzHlo/g/A/oFQFErhjwT8ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rw9uYo+gWAF+O4L5pmTjQ7wp0n8afkWMq+feds/loZYucRGqzGi0J3AXxlY9arwLFerSLRRR8eMXomFm9ztZmtTskx8GyniiheaVokGY24PIihvHRUNwSutn4+DVUfudMsHb6bEiKxVv1IY7UrMfOM9s/cQvBJd6trvR0jz0YBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zp2w+Glo; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zp2w+Glo"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f97c626aaso302002066b.2
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 16:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593259; x=1778198059; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=Zp2w+GloJD0kdlasRt/TMoPRz0toVEKR2n2rd70XSJ7zYqcjLBfut9IxtnCMLSLdON
         k9vjtkrPvdMA8ZWIbWcSmCSa8Les+fIUvR3B4oc+yUZCl7v4+VqNII864PHRVOCw0ict
         qpUBmV+5ckPcYdYDLig9tfFyyv5wx50acr8Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593259; x=1778198059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=jpxXvgzu0zSvmTG3pQLcDE1m+ZcaRlqni3SQHsec4v3F8zSnBOTxxvAdrROcmhxW8n
         xZxwwQWi+6PRyYhU/nUb0iR3xdbNUMoAnk6funNvPhW7PKVTSIOaNCIc8hgfdzR20NzW
         digE5MV6UAQjl65q8rHloJPzJo2P4fU/VAQmrzMZJMukm7d+ECakiOHPx0zT7gLyzyIa
         yd18w9d88d8uhCyT1hapPVVXFjIyYvzp72N8Lr1rmldZ1MgH5nCTBzcM4mh5s3cgSQAd
         iKgVqLhZr5zvW0VrG6nx2wPuDH/1epbng2GpfRrNMPovaFy4jqHEkbXg4zooMo/Asozf
         U5cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6u54+n4C4pdYCS5O7Kb1v5oqfJNO5tMQK9ygZJHdNXK++P6O7LIpDtamHpH52axiwImjsxFCjin+TPl2Xl5w=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywknt8TLMcq+0y8JhJCPPyt+J+Oi3Sy6XO17AElwr0hekeVY2f9
	btaxn1QQaw/4NefWsetDcZWgHBGpwrVZuBimISo/XLv+cejq8Dc4Hpok5AG1aGcAWFuk6N4lEjz
	8Z91x7Q==
X-Gm-Gg: AeBDietN+nuVi3mxmLKqX++I1Iw0iAvCI95ff3ECMgwOnTXANb8Bi70+8v2lpiyf+0b
	Ac10PM8CD5xmxUQH8OHDAgZPVeBoq899Det3AB2Q8Jo+RIcbwmumLIWmyOixKgq6LFc4V03Azvr
	Avb+IVNc9/sdbMHSIvqb3+PUqZ75gmpXsfRMWCB5ZB+KJTJYFaCPtay6ScCXZilpInbUnnG7V7E
	gguw09X4v2rGGcgs5vp6Ft9rZnxW+FhxT15z/vs6pDVYuxSirND8XHja6E/dAFYNcd15+9GLsHT
	Qdd2s9ifqkNaEX0laJJmB7DIyyZvjmOOFB3txIGcgkdd1cwcwZ9WMreYsJRXegWXlPHr3quABK8
	NGRfUzmABwjJh34uVfWWERkmUZeivr/Si773875wi0rhWidPUPL8d3eMLchSyGbCQmf2FUUagDv
	n4S8+PTZS92iyazxmJxENsKrLsf6h1kr4+Kly2+5CsnbUN3mISBx/69XQOALmVxyfmzbXXKpga
X-Received: by 2002:a17:907:6d0d:b0:bad:f032:fc78 with SMTP id a640c23a62f3a-bbb68d0eebdmr296124366b.1.1777593259463;
        Thu, 30 Apr 2026 16:54:19 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d06e23asm49344766b.36.2026.04.30.16.54.16
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:18 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-448528f4e69so922673f8f.3
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 16:54:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8xYU3h2YzDn+YuP+ZhbI/PrKBko1XP+7qe70H9darOiKPGMFSfZijln4A/s0ji0U4ipBdshCzuXlNknoLikDg=@lists.linux.dev
X-Received: by 2002:a05:6000:40e0:b0:43d:50c:6f18 with SMTP id
 ffacd0b85a97d-4493cc3fdadmr8678277f8f.11.1777593256152; Thu, 30 Apr 2026
 16:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
X-Gm-Features: AVHnY4ITNUkQNF1rYH2AzAfyi5kerkzeuZiwFrCYx_qZbGHsYv-60K7BAEKUu9M
Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
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
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-versi=
on
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-sto=
rage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-siz=
e
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-off=
set
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
>
> The /firmware node has an empty 'ranges', but does not have
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
