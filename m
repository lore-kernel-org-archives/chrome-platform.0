Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7A5382360
	for <chrome-platform@lists.linux.dev>; Wed, 29 Apr 2026 04:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436280; cv=pass; b=AHWL3TV+f0BpLcKtqn6ITEoVBkhYcHL1O2JyBN3Oe43NrfDUGEXT0PczaXqEmHFSoeAICxIcgBvbfAVZKaX0XrE84eQ5NV+6x6cAGhluf5Mc3O99prUf9FVl5WMClcn/fNUIzCgCz4h33RXBzQlPHqAwKZlucMg6ZDtv8f14KhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436280; c=relaxed/simple;
	bh=AzwVlyIqYxfmPExGHlhzDdBcn2kCaAcRsyV/IiibDeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUV7nblf4es4ajYsyi0MNwT3Gd8ekgbKFAr2oxJWldDByBZNCWxLM10rndcvP+kj0H/4CPlq0onQ4J7f4YiAZfNjcsZw1a+DjbzvCvxDQHhVXDt8EtRc0rxxWsmLkBMG1z8Gbx5LU+0XFi1moaR1ntLoSsmOFhkCn4ygYeUcJ6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cHQ8dPOp; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cHQ8dPOp"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso109753921fa.3
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 21:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436274; cv=none;
        d=google.com; s=arc-20240605;
        b=XpQLXa2gyu4vl0Uf8RTA6Q1f+qiaEGI3vu8FkSI9yP51WBYimb+nNcCFTI/+bcZ1YM
         u6nfBaQs7ZwLGCPVPScPgACT10rQnBs8cgzPnKt5ISIV/RbtOMGja2YPZEvBQStmqqBY
         bwYr28eiUrPUuCMhmzgPfLv2QEabJXia4QNq3WvIOLikTACS2Z3+mdHEXyvSB6CJIJ5K
         lShUAc7YuhfnpNZ1/vfWpap4+EiDMPz8rUwKfn7S2tl+/JqIZwqpLxYq22y0Ez8Gf4S9
         0CU8CxWZNbnaIon+61u4CL6imeFOc+Erry0vMPURaUhQMs/T6yuMiMxUeDGh7jHpHBaz
         8LYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        fh=ycTwloiOx6ej2CkP2OGLVEna3P1uu6yE74sdhb7ETgQ=;
        b=Zm6xN2ejhT+A0ERZctI8GuMyxesZ3ukvcDWYUOTFRflGlqmuhzT011Prv/ec1Up4Xr
         7257OIwK/anxLzf9oHmO/UXo8Q3Igpt63vUxedwqBudTGJnBqCtRTwyL4aX/5bx9pd3D
         HCr7WESMRl1xLOmB8zBNxJoeuAcLlV6MLDgxDfrWnP9cee5lyGaPCsjKHqLXOntSQIVU
         MV62iaga4KzsE+32qSz1bs6HjUmELO7twgOZ5VENVHw/jlI9TE1fLdQBvuVx3YBHgqIl
         qqRgYrzvyoQeU0gLHDswmPn56g4rUvazlRLOh61m06dH3OEtbl2r8pfvRIAvVR+AjNBn
         h57Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436274; x=1778041074; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=cHQ8dPOpy2Kug1Lq+2L7VltuGQCFp9DRXciks1QWfxS49LLa3SDUL5YFJ6E8OkTCsX
         B5JJzGaFjQgBI9zYAKJxFoaSZW2jNW5MIeH+bYjIiyg9iLe7ghVrC/QAkfdjFgBu7q4y
         Zi3IK7Of9wEYYH8KEtgDyf47WFL27xUDHnsV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436274; x=1778041074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=hkB7opLQJwlHitlhWy+pK6urGDGZyzW2FWokTUmqqjAWt2qYZOz+c7d5QYDgfYMxLI
         tmPhYRzPINmUPc1HTYWRHpLL/GZe/lLqCJHEaXBqT0mIKBru17KAWnG8lyT22tVZ24IT
         mxXorqQ1HtXFJqVzdStydLNf7z5x8nYwVR/eUsVWeSsh+X+esyeLHcMVlxWYOtKp3jWi
         OOZi7cQhv2zVmdLEnCXrlUhwD9MBtCd4briUNefQQAFMZa3P1/tvzdozxVAxevxdJt7z
         sn8LxXcp53qnPKmDm9T4+BaXxfYFfYbum6uVS4gDk7cq9p97WSDLJD6x/a4PlFElyCtU
         y7ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ96IhaFWExxvtLvcXNkTSPj0CY4ED75eN/l9Mv+vYYdkAHZN/zTZdCtq83i/jeWM1eJxbxgJsrVVQzOrJzEHXQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdaNNSPyTesmrsVPXYoEjIVxNp+NZfQ4pCJd17jCU6SfzMhLYv
	pp6WIiL/C9EtJRlmzDtHBo/y7tFjnKtMlaKoQD8+dyS0RuAbkwUuFcEDnx3UAT75xizbFkupNp+
	HVjIpSwWETcs+NIT7dIE7rBE+RgugJPrpHGrTPD8G
X-Gm-Gg: AeBDieubifXfw3z8tEPMr13cEY8pWAaHQ6/cIEGNphHjr6Sx9nipyOyarsMVuC9NOZN
	+9NBKGmASyzEV4E4AHdOGnEKUUieQUk4kmd2fA4QS+urIBaLv325H69k2VmzIxO6jM4ToDJevRZ
	3rmrbXN3tSbSMH2sZ/nhFbuxMn7yD6NaDZuU8eL7BQOUsZqyIf9GhWX9Q8AyZ7BUPqox4Aem9Iy
	YspiYr9b6Dkk7OQooVATvr889QR5aJmXVVl0X4v8YN7/Nl20dBoPtdI6nOM+BOYyaW6dBI9pOL8
	oKaFOSAbnfdxBf61Sw==
X-Received: by 2002:a05:6512:3b21:b0:5a7:46f1:d96a with SMTP id
 2adb3069b0e04-5a749cf6fd8mr890120e87.13.1777436274082; Tue, 28 Apr 2026
 21:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:42 +0900
X-Gm-Features: AVHnY4JKvPmufJ1LEj4mzB6PnqIoSu-1P7-pbmF9YGak1q31h2Rrygv9WVJBRdY
Message-ID: <CAGXv+5EPpB92d=ttP9ezOipL6=bC6WYpQakkd5L-weDjLpkrFA@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 1:12=E2=80=AFPM Brian Norris <briannorris@chromium.=
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
