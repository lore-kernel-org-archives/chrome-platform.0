Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830D93DA5AD
	for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 23:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593283; cv=none; b=G14yQ148vO9lhxKFRtLcEs+NA3u+59YBuj2fc9KupOKKrDuC6RLEg/w442zAkbV0iHfuVhwUwplKoLwZpHzuR79Ln/V9Y2YKUlewdzWx21X7DPBGdxuQD3dFsiyxxCK7u3EbKOrf8TYvnhZYEZ/DFlTjkXHtsUrzTdwuAC7Cs/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593283; c=relaxed/simple;
	bh=rWDl9l88s5smH4oJB25R8ZD9EUfLZO6b7a2lfjBov+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiZcgF4YaxR7jNOa08jEmcqUrVTUNJGXUzNH0/17r38KzBQWQAljlIGcdIAyj7xvph8KQ4+O3vhoU1NibTMkE439OtuCuN29+vfytCSByvuiGreqB2tyjOzvGXLf2jukO0wSfkx+ENhRStuca5TeGJgqfwM6CckakmYiLwe2wgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I3gQAglq; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I3gQAglq"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba60d78aff3so226124566b.2
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 16:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593278; x=1778198078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=I3gQAglqam+KWcCBClHtUcW9thOmdbej7lhWYm9WQbWbfRuG2cDJpdDot4v0m3Q8t8
         3LXrkG6TAq66Dv389LhxC1ts7PZTFdCvITGtJDPv020WXim1G6usM5gArbxBS/ksDeTn
         zcG1FkRC16kxgIqV5web4yFvWk2ekUHQPvUl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593278; x=1778198078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=cBii3aB2JYJOZvjOdLTLeU/jXbyr5IduisOfbNERN0JNS99KjBWB0Df27ttwteNDq+
         HHl+VuLkIZxm/G8fp10qdpv3aHj2zlDwAtWttvTKPCB5E/ytM26j4RBQ3pt2bGaa5fk1
         +mJFCFBFICTI57XklZims7TJ3T7cgO/RihfOna+cW07xvefE2Nri7v/BZ20Rg0zuuF/7
         UIOtu9cDU9WGZtXuvWrNaYb0BS81r08ClxIZCXqFQRQSGYzXNUOvEvrrE/D6qrZbHN4+
         HEAF+8CaLhO1J1QEYKethfcxck7r9+vfj3NqpSIuYokArqBwEe2rDZzy3K54BB74moud
         jZNw==
X-Forwarded-Encrypted: i=1; AFNElJ/+qZtH0wIFbLAdfCpyBaW/Qd/cOJmPVg1ZRbdeKmWVl+tjHMm4x5GeT5n2XjiVTZ4rws6QaO5J6Mi/CfT4kxU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm7nQk33KYGqwE5gPK6r/Rk2h3iddoXmwzZ81zyNfEmC8/G36t
	qpp5slAE1Avl6bbS6Ip/myKgRjeyqi/iOW0CdIhta5Xli/CyZogYqIDL69eR5v9szAQQ4Sr1aYM
	DKLBfzg==
X-Gm-Gg: AeBDieucwcqliQf3UK5nXHalHXP2HfX/Ywb6nJFrop1wuDrQhOVsTm7NcvWfbBn7XPm
	/krDEroIZ9XDYO0F9bMlHeF9kmlpDR6IPOfeOPHnudSumfyY2uOOB4WIJ6DgHMsGigQP/C0EX75
	rKN+421I3+FPjHFEwD6XfenHqCDPW9lqycQMrrDlsoABQsPmLH8dK49xOXSg12Vr7lMqocVCepK
	0ZjO85MCfI/zoc0/kgHN62ZYlSjpZMClcD6UZ4Q3ZXewV3NBtzyGPfWHxUd8+FnQa3120ViHaA8
	yVlKIqGFhFymoJ7hIdfBa1tNyB9v2ADVoQKxgqoNM9qtrn3bd8kroQLuhDaE/gx0vPv4DCdpdDa
	8dL09ijP3eCKGod8EjZQDGUOyMEiQWFDRas79ljgd3JAYktNGDuwpQASoUOIUCl/cFGJHfeUcYf
	l+NKW90q2njuyFVT1ZYAAYF82UulVgArscQ+ZUIuS8kdb/tSZHrCVaQcJey9/6UkFPOAF6VWrE
X-Received: by 2002:a17:906:c39a:b0:bab:29d9:babf with SMTP id a640c23a62f3a-bbac6bbd5eamr263118666b.27.1777593277661;
        Thu, 30 Apr 2026 16:54:37 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6aa5865csm47553866b.27.2026.04.30.16.54.36
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:36 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so14486875e9.2
        for <chrome-platform@lists.linux.dev>; Thu, 30 Apr 2026 16:54:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Mc6LUEygUfgVVwfkVuwyYYoG12yocX+0uNdoZwFdJ4m/4cGkNsSRw87+0h4EDzdRRxFUQVrYNNM2WAFFYkYg=@lists.linux.dev
X-Received: by 2002:a5d:584a:0:b0:43d:6a0c:9571 with SMTP id
 ffacd0b85a97d-4493dcd3c71mr8939823f8f.11.1777593275557; Thu, 30 Apr 2026
 16:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-3-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-3-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
X-Gm-Features: AVHnY4Kl-1ca-wbSwPcS9uBBAU6zbdhWLbd9Fj0fAjnpUI5H2rQOrfd8cK8P088
Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: rockchip: Add #{address,size}-cells to
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
>  arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
