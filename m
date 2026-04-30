Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966593D9DD8
	for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 23:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593288; cv=none; b=gqKOw5uWxwmbH01hG/aN1nAi6UDDMP+8SCJd3L6ECX52wNI2te0pYmxqlcrwhzmaRL9k2yfDy82kgc8pt1R3q0byNktoOI+VqJAeS0UtSakeoMVPHLpr34bl6OrrRkFx+kZfvSFmBAp824XBEPe4KofJu3SIf5o9qOZa6aVKe74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593288; c=relaxed/simple;
	bh=E5GkC4G7rtGBz2MILCU8/hEbtGwGymi8oc5Ct4p7lLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rd3i7xA1Y0BR9VCx7P8xROs+6qNVvTAspq023firdz+tcNhq109rmZ1JzWwg0zkFuXpX0Q5yAhCrCi7XEhHW/nbbMa7K9YuVMpP9YxwbOtJftUOazl4igpUDWwzE06TX2wQetDiddsekWjmTCz4X73H02S3fMukYwZ7VWHwtyUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bYeWTegt; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bYeWTegt"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67b7c77865dso1238887a12.2
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 16:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593284; x=1778198084; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=bYeWTegt04w8fiulgJowIE/UqygiVF05hqFJCpE37DfSVc6bR8bdKR8unzGrzTzgHV
         bsRd5m8Fu39otWJSiwqp5r7//OLqbipLc7V10Lm9FZ4cqn9oUXa3HrUyimzh7r9ShhyO
         NytcVjRPOd7jmD5M1jty9Ve+DkZUQ2ZTrOyow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593284; x=1778198084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=aret+Ac+gVWalZTRt3hB9Nl9INpEEOGtXJHeAz1R4WJW4ZaN73OLaLDOOC2Y4d7WiL
         hsd9Iqv8/w7wQF9R2U17r25tWkR8BQ/c/j3YnXcVbbzL7XZRa+itcV+GpWwm5RPdvayh
         zlhV/TPjsMuWqYFy6GyBDZf+ocprIWk2EXLz6hVjmsNkTUXfdcwVSzH118h653k/sSP9
         fCi9OAFU6I7OPIGCMcoKgU6rGteg2+7I3XC8d+VUwkle26/2BPK11nChgo5EZda07oAC
         eA7W/6DCeYkAU/YLwv1IP0vHKC3GF1TTuM+7GO6BXXe1Xg9P5Bk1V1gfRyvX9pGHCVYu
         1u0g==
X-Forwarded-Encrypted: i=1; AFNElJ+JE6d9E0sUNd9vR86loetGNIUKoZaRJgnNjo7+vP8ihaKUQHcIXJrTpXynSjLdyWGPLY1/HMVJ3q10s7Me2Vk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJP2OR+zVtgIzRU8ggoREBucbjYMmWI/ONQy3TzewHO91Qoj7r
	FvjW5QzVbq64zGKfj+tgKp1jnVKSKnJMZFV5c7dXz4z3bL+84OUCJLsZqukI8uTpJ+GhtLPpVp6
	A5Zk8Ag==
X-Gm-Gg: AeBDiestJ9kEpHYlvm1btfz1QzcKSwdG18rTST0CuBk74GcvyDLTEXKD8mXgAb8srXT
	gtHXqDwuuLYmK5ufQvidYXool9gdrFEe2raLv6WqQHLsJfMgSreUBjrVUOHCLlr/JzZQRjAtcOX
	cxR7WRBkseaSryLVks2dyw9TRpCAZBn5W8D0e5qvqNFlFnId6+0IPmwc+ePOqQNewakvQOjjDXX
	FeU2N4RYa13a5Cs5xw9RQpK1LQo9UPzcq+JeOMwMMR+GkNIAEqHCcWVJc0lmuJTdgjRuYMx/hk1
	jI0ahIIyXVxTUY+zCJcZ9vqkyo/dJC0UIWIrb1DOjS1i4q/rLM2MIE/KLiPTDaXL2c2uy5938F6
	glY7uKvl4WzL23TasMS4Vi4516dadf7ZCNhnds4xLPUz56EYxfiL+lFyFEYVvg8yX4j9q22c03p
	bLXZ1iHpnjobjJ2rZdKWcDmmZ1uTav4IJLtQMSEZDe9+LraQA8wVe9UOy3XCEOYS7WAPX8191X
X-Received: by 2002:a17:906:b388:b0:b9d:6cef:95fc with SMTP id a640c23a62f3a-bbac6bbd43amr250306866b.35.1777593284554;
        Thu, 30 Apr 2026 16:54:44 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6df5c54csm46201066b.63.2026.04.30.16.54.41
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:41 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ba840146so12098635e9.1
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 16:54:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+cHrRrXN7DMvyizcyNgjb78Oq4Z2lyLLMnlnxIquDmGlcl4GGpNW5Uqw8IwdYrpdSTBf/7eVmJEyCMIlV40bg=@lists.linux.dev
X-Received: by 2002:a05:6000:2385:b0:43d:7ba4:6b5a with SMTP id
 ffacd0b85a97d-4493f814094mr7876169f8f.22.1777593281177; Thu, 30 Apr 2026
 16:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-4-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-4-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
X-Gm-Features: AVHnY4Lf_-e67ZfLDh6j0F0tOI3LrjkSTUbSwaFXekuSrX2ugdsS_RxN4nbO7Qo
Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
Subject: Re: [PATCH 3/7] ARM: dts: nvidia: Add #{address,size}-cells to
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
