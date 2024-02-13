Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFA9627EC
	for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 23:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707867299; cv=none; b=bmRs0839BdFySgkmCCR94IyE0lkD5aB1j5rnn9L1rkecpiaIjm8VC25uctsZEfz4XwbKKZkKFNcHvMnWlqh2v4hkZ6eon5BR6+O9zWWOvYBaOPHsfJuPA+IjchvELmefKNuBkHPPmVnQUYghhqDS8ThoKeuAfcBqTEumhFz5Icw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707867299; c=relaxed/simple;
	bh=hZDX0moxKA2jr0nQXnCCS4aPrBUL93MmvQjXD7Vlbz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAm7jjnJN+0iu9UkR0lHE9MG4fN6MF+PVNbXtd2TUygpez2O0u86dW9bfICm3rWNsokXp70VpaBOIqOgpPEgHpc1zvl9UMosRFdfTDfrJs+Ys0M/Smclbt4mOAYvtntXKQWHdWBBj/1eT0oj2exrgwtt4RnN1+bcw2n8vQRaOeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MaFGKuPj; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MaFGKuPj"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51176eb6a4bso5114755e87.3
        for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 15:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707867295; x=1708472095; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egLJA3w8XbBkzhBhvJeKiOGztHliZVh9q//fDQHtqjA=;
        b=MaFGKuPjAMLb9Ffj+mGdiZlDw+qbA6x4HX62/QMPVn8eIl/k29moXLUOXotW+9ImL4
         eDyCiPjzf4g2VC5fS2ZGekXgqCVBhO883IBhBNbJ0QBOOBWJeWfuWmSQ1/qPUB07G746
         yvBlPm0eIis1qpd/og375rijxp7YHu+P8W31A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707867295; x=1708472095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egLJA3w8XbBkzhBhvJeKiOGztHliZVh9q//fDQHtqjA=;
        b=a+pUJCizTeaG/5lyFp/WKDPq4wo1wDfyC0AAs844rpea26Xj0ITzQx+VUm391VybiL
         OzTpg9R0wuPqtGSdhrGDYgdVBRuHF72rrVcfLUZmtLd76SvLMxPmIINyFGFEipsVSeeP
         fv6Z7Qy1ui88A+FsbfHNSofel+zo929BjWe/DNH7aU8Vg5QhwyHplyIGM+vbIfsi4AjJ
         4Rju03va2AA74NRLnXkwaoD7/Qy0U7C/1SPU2qJ14HTLteJ4PyEfAcpmUMA4igHlX5Xa
         6cywYsLd2hS5EZqZaTUhg6ajObqd7OVxWxnQ99hpt5esOwZZKmNjnBi+/TZ/U0jYWbXM
         asQg==
X-Gm-Message-State: AOJu0Yw9it3PcNCDwc+UWYwoNivK6ywOIn+Mf9zAfTFiRQ3+aEsHwK0P
	RNZHpOEmD+dT7t3NtAjH4eUj2GXc3kA3qPRae35I8ZPzKeZKMC8rs3yolR1JUm1EKpfGpX7S93N
	Hu1dC
X-Google-Smtp-Source: AGHT+IHFvW0REVd3n7WxRkkJEv1QNlDsW/S+6zCLqPAqkrs07MvgEe483shJyMYdo8yXNqX8Gwjltg==
X-Received: by 2002:ac2:43a6:0:b0:511:558f:f39c with SMTP id t6-20020ac243a6000000b00511558ff39cmr706690lfl.2.1707867295443;
        Tue, 13 Feb 2024 15:34:55 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id cu3-20020a170906ba8300b00a3cb30d6271sm1761874ejd.143.2024.02.13.15.34.54
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 15:34:54 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-410acf9e776so97235e9.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 15:34:54 -0800 (PST)
X-Received: by 2002:a05:600c:a01a:b0:411:e72d:e5c9 with SMTP id
 jg26-20020a05600ca01a00b00411e72de5c9mr9514wmb.5.1707867294378; Tue, 13 Feb
 2024 15:34:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-22-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-22-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 15:34:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WovmtKFiG0OMzpus9=z8UJ+Ev3TrwsVia8pSegvjwUiw@mail.gmail.com>
Message-ID: <CAD=FV=WovmtKFiG0OMzpus9=z8UJ+Ev3TrwsVia8pSegvjwUiw@mail.gmail.com>
Subject: Re: [PATCH 21/22] arm64: dts: qcom: sc7180-trogdor: Make
 clamshell/detachable fragments
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, cros-qcom-dts-watchers@chromium.org, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 9, 2024 at 11:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dtsi b/arc=
h/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dtsi
> new file mode 100644
> index 000000000000..bcf3df463f80
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-clamshell.dtsi
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Trogdor dts framgent for clamshells

s/framgent/fragment


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi b/ar=
ch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi
> new file mode 100644
> index 000000000000..ab0f30288871
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-detachable.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Trogdor dts framgent for detachables

s/framgent/fragment


> + * Copyright 2024 Google LLC.
> + */
> +

Tiny nit: should this file have a comment like "/* This file must be
included after sc7180-trogdor.dtsi */" like the clamshell file?


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/ar=
m64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> index e9f213d27711..c3fd6760de7a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> @@ -5,8 +5,7 @@
>   * Copyright 2020 Google LLC.
>   */
>
> -/* This file must be included after sc7180-trogdor.dtsi */
> -#include <arm/cros-ec-keyboard.dtsi>
> +#include "sc7180-trogdor-clamshell.dtsi"

nit: Not that it was terribly consistent before, but in lazor you
remove the "This file must be included after sc7180-trogdor.dtsi"
because (I guess) it moved to the clamshell file. However, in other
dts files you don't remove it. pazquel has the exact same comment and
it's not removed. Pompom has a slight variant of the comment where it
explains the reason (to modify cros_ec) and it's not removed. Could
make it more consistent...


Everything above is either tiny typos or nits, so happy enough with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
