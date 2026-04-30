Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E43D9DD8
	for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 23:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593327; cv=none; b=uarpHDo0fGBOg7tStjAsMZsguBNSXwQT/0n0V/c47hiSnND3gqF8oSrNA5oM4JXgYvZDLAxkegtIirG1cMRpYNsCpKYtBayX/ZSGDxU3lynmt6OysLthR9QhBJBHFlhjPOkICbW7Hkw0Wnl1CizIIs27EUiJmPFdS3JfbbVXGP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593327; c=relaxed/simple;
	bh=Po793qEB14FDeszlUgfCZzMNPlO0hdsx5m4i9+Am1UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ab+wxVAHNcmuH5Avc8rvsd88VwCiqwwYyPR2PVQV3Aa2P3YYWr588nVb3pfNGm8SwqdiBON3S15ZJSYABqwCo37EVrW6gZ8mrVsyitDrL238Z1cQNqSr9h4Ohx4kRhkAjW+r+4ubcfvPlcoh9SQ9d7qAP/dSm7DA6o1QDfZ9kxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ExZ9rqoS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ExZ9rqoS"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ba51e69988aso250312466b.0
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 16:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593321; x=1778198121; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=ExZ9rqoSdSnAfeXmfX+BYs5OWtGBlD9z1ENASnUBpDiYAWTTnc8Wyy81pIx/oMqL11
         PLoUfxx14lJde16MMVCusHWY5blwLFTDSHrx+yX6/rITeBDYq3ijAkOmpfxpCzRvM/HK
         WTTn7+Ny8YvuUvpr2EFSw14zC4b+F2dK2GWms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593321; x=1778198121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=Lza/UnTeIRNGUbaHszZ+4Bwpw1kBuVSWCtJvJS82uNemG9dNev41I4a0okT+8HeCoG
         FLODWiYsHTaDlrSDKj/Y0nDWmU8jI/U1Rt+e/EOdOJFSXVG1+lOAk1mUXZjO8seiEWG7
         diEvuHCqHCGVpmei47Luf8YcTLFUgMQjWQgRLNAQHSqhHQAzGLMbs1SePYThqk6XU67g
         6QWufitU7caBPLrVbHiwmiCKFfVtVDWIv7TLB3rrLgBEilOJlTh80PDWqxvWHaQrIsge
         dsMWN3dr7YHSuqWVFv2gGUIcmaeHExA5vDJuCoREdCzSeP50+hUONwd0zmEj9wEgm0EW
         VIzg==
X-Forwarded-Encrypted: i=1; AFNElJ8pGdMMfnstgOCa6WiCzHhnOVjiw8VYgcX5WxMpyDv6uSumhdSuJ0nfnPxsSPdtEgGWKvfWT989PPDiQeUO5pE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwacFvKK2jn+RqhJrg9d9JkZkaeMxWUcPqN7vBnADBxxU8D1Nd
	OpZYCN6tJTjW1BvwmsQvAqhtC9ljQpCT1/MnodvnqJBeYyAJhYk57xz7fYKWQqha9FNyH/xB7cn
	+zs93uw==
X-Gm-Gg: AeBDievd//idSB4VMJGO1vlQSp2KBzFFB2OC1PFMkqfBMR4Vzpe4ZNDaKSzWQjV6uhT
	bsYTVGUSjvc8gKpoUaLUkIpIORPruTo87vtzqVyxJsC2nF3z6vZZqOT/RkTviMKxjZx0jsGmScI
	GKH9woq9lhwZQX4+ekOJ5RVHNhlNwmMJsmbLxGR/WxgD4Xqlk+APhFCdPKh3Pj2iD+OBUcYwBm4
	wjxtPuQunuU+jRaUcu4l6ZUALF7GmLZxU1qOwPEkBofFX70btfQMn7tfgPmG4VxRTJ4iTJc3ILN
	7eYQdcFejeTDpVXCCvKU3MRUkCCRk8jQB47brsuRBg23zZtB847oDff6vn6mxgVAh059wiA9Lsp
	21yXm1nKsI81lC3nSN9GXT9+aSSunlH1DeLmI6HHigRwf39fwUEQqee2tfjkNrLfJxzuz75jYhv
	xRASKEy3PlQH5NAhLG3LWqPRK/Hu1s+tH2I+cY3KkJ0nvRDwNAKUIsEvvTzNeWc/iP0/0r6leG
X-Received: by 2002:a17:907:970a:b0:ba6:5855:1cc0 with SMTP id a640c23a62f3a-bbebe520250mr39889966b.2.1777593320934;
        Thu, 30 Apr 2026 16:55:20 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6ab4fbe7sm48992766b.28.2026.04.30.16.55.19
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:55:19 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so1162356f8f.2
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 16:55:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/erQrQSFANkysq4t2r3T/eFEwlxYnXZGIUTJrcTuOq1iQH8mAhCVWExCW9cZwOa5tY3LqS6KYQxMDUHHfGNyk=@lists.linux.dev
X-Received: by 2002:a5d:5846:0:b0:447:55b5:d532 with SMTP id
 ffacd0b85a97d-44a87f60a32mr1080919f8f.37.1777593318187; Thu, 30 Apr 2026
 16:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-8-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
X-Gm-Features: AVHnY4JV5Y3mu38iXutrpDHLS51XF8wv90SD0VK4jxBhsJoT2PtDnx5IHddvQ_U
Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
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
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 5 +++++
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
