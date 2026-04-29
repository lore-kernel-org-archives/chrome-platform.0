Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627923264C3
	for <chrome-platform@lists.linux.dev>; Wed, 29 Apr 2026 04:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436244; cv=pass; b=UL29pgJ51Zy3dtVlETASIRBrE+CLoVKo4g/H8yEiL5TUH3eSMJlkH80HmPNH7+lIbl+Tw+bnGXDdxMpkES1dsOZmKkr7HQyDzA4tu4izXeAvvO810GLCh7pDhA6kf7vZMIfeWRHluPP+JNcTJTG2GTNLpLw3QFNixomMv1fotR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436244; c=relaxed/simple;
	bh=ucY3TNrWMvRb0oHVhltYdiDBL03lh8F0+Cv3NgZ1q9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EId41DTECxVnjng3AqYPdMYsa00dd3phJL/SxnMpZ7q2LRQQSoEoveaFk5NxPBmV+HsV1z6Vtaz9nmCFtX1o5xPKot6C2+lGvYmbX4GOLZXIuWpN0OolN1G/0GoFmFMvouB7rTm2/NHzYMVd5Md99jPnrqyPtauzvHSmxn8F6DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YdFc1hRX; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YdFc1hRX"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a41099fa86so10722626e87.2
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 21:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436241; cv=none;
        d=google.com; s=arc-20240605;
        b=ZbvD4EToYPUof3x00qwOk8l0zwUIDf27qhLRThlqyuB1BD/zsj5tf6GMcy3xmgKpLK
         fLNduoQryv/cd+qZv7f9HdWKrdo0LhLZ9uZ3bmKKUatpK3cYzZRWnI3fAQ1912B6ES6O
         o9Htr5JMSDP4qC6nTlw7HOzntWPDBy9YmUEB6DBzSaB4mWSQI2P1EzquHTDSNMsnEeFE
         d1GRX7NVKZSK3ZNCyS/tRsWb6RkiXas4b/NXnVPqXug5PUTycDubG3x1HXbFWkEdVai8
         vUH91ObRUa1TIeFI5GRj+woylbJjxGqpFotQVGaCoKDXwUc4bza6tp8qWUNqsDjVVMQs
         /l6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        fh=IMEJ63iir0GS+5jcA0tmxHqEsTT87FM6tShGUgAF304=;
        b=U2Fh1yduXa8mrczfF9iCN3iOOIAz7Zodm4qULjaidnmb23ZXz0StjJNf4mVhF+ZOUR
         oq/ipz/qN0bvMg0s9lM+iSpFxmK4vNyYVShcU+I8ffnNP9Ie/zjTaoeikhRkc1DDpr7u
         rspUHgznlX1q6aGmpNujsDy/hzg6LVGyTUJ7OxRy0dtLOr9Pd3bo8WCrEqGQOrODibfK
         5UxVvJ3Us2pUSBs8Jk+7HyFA/DsZGyKIwqlPFQZtYCABntb8IfRv4tU8ydf1M9tpJaO/
         eZ9d8QAz2EYmnOzUa4ndqtQZ1ATEVifNiVD7p3wP6ToMo6avfwd9OKHRmPWkGV5JqM/n
         Xp7A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436241; x=1778041041; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=YdFc1hRX5D23FHByOVnObmPiwwMrdmpVx82OpnACXrupw+sP2gO7xQ8jUbUisWUPMa
         5CHImb3SntX65J8whbftv6/8nt1o8eZIeWepkbLRmQTLrL0aNBXIZOGwEJXecx9rizMm
         MmkmYNOElFNjkHnJvktuknrbUWfgbT+rmd2dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436241; x=1778041041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=Cmk07oY3Rj8H1NrUdQkHlGdmselzVRHEe3CKK5neojmwKTnRnuWCMQVwYK5Bekh1LG
         9O/MkqcVxXSb0jHtcGL6KapepIeNIdmjcqnxV9m9XRAI1rfcUlEvH7lkqJ7iTlWN831U
         vkgYxboF8gxXs5750AQ/c4GsEsKyUXnTh+Bb2auM9yLls0+ygoe9dm9D3j/yGv2xzXjL
         640zMU3Ja7Djt4u5gmtT89uUneh0skuIzt3bP0FV1n+DA3rEcwvRaqkaPD6dmjy7RvnZ
         Cxx52mGh7ebJa+2kkv8Lm9UAiIxkGb1SjEgTWBUu7MPLPOHB/n28ZLSUIsw/pTYmb5OT
         0ZSg==
X-Forwarded-Encrypted: i=1; AFNElJ8dxyR+H/F6/HpsjSo1Wz0WPAtDBEZYulJfVA/HSj5V6R7OCzS4pimfXQPeHP3uadxG1tIGPlFTlTsGCjGAKWI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4tRbwa6gvUmZnhhClZ/nlfobUE03JBjmaNTZNIzNb7PVgoayg
	9UhFLph9QNAf4BZRTUwYUqdh6Wfc8rDr1kderucYWIJSoELAHDb98cOSYyItlcmBqb97hqmJjqs
	gXrMBp5RRTOQwsAClPXRmUo65j7oBI4DECWlA3iGS
X-Gm-Gg: AeBDieuT1P1sHWsTtcJDRLDXPfRv0u7WI/ihAWsA/A9oeEvGblNgy1NE8efiYSUPQJ4
	aO4jjdMaSo6yBWPRflU/tN72iZ2Wyygw9TR6UKoSCFzaasrVugZyTE1ei15POGkpVeXAmyK8Vyg
	3irIMnDffoqZBeXUtrBazS8fUOmWAikBNQQIx7Q16APKOvku8nPf7gUc0Pj2uvlO48ipj1nRHey
	oZSNtxVWBQ/O++zQ9fMFyKMk/Hrm9V6wRkobLh3hPWcV+9Wf+oaa5+fdjsJ0tWbB1YTj+VIb8oT
	wtoE1BTBaAqVx1gNAg==
X-Received: by 2002:a05:6512:3983:b0:5a2:836a:ca47 with SMTP id
 2adb3069b0e04-5a746623733mr2096698e87.20.1777436240634; Tue, 28 Apr 2026
 21:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:09 +0900
X-Gm-Features: AVHnY4JUF2jGqzImUjvVT0R20VSVC4ANB99NMBVznnvWckelDQ9DcqAgZCUM5q8
Message-ID: <CAGXv+5FZ0kTqrqWEu8AX_1cxtEQD0urr=FJO=Van20h75_Z1Xw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
