Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EFB63106
	for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 23:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707866683; cv=none; b=sge31N3AugGMrqllILpiKBjEjzgzUBwXG/ye80t+26lg9o27x4RA5quzI+9njj65SHqbHO7FIs7rPz8oVzoA0UUvl4EIoF0A1UEuVrPtOGchOzts7wgQWuVfgdOiOJtpRm2FiiHU0gwxEDeb92zN+tRg+5oo8YJ/NLbtdmeiwZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707866683; c=relaxed/simple;
	bh=bcNZkTfy8xF0KWYq2Ov+PCZSbZ3Z6PXo5Nj4PAZaHYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZt+b4DV1mm32teMoAVlTMLqUeRB0JNW+r39FOr/Hse76vYFXtpCF1eeJUozuEqI/xFfA4IoE51gWOyFO6sIJDpMNWiPiVlZ4n0dOlUlfp/ZyZ86e2jw2f/ZnXTHSSGFXXtKW3LqDbpvyObbqvwwJbGKXO73rFODzUpM2fW2Hdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lF1fJ2bd; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lF1fJ2bd"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so6528148a12.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 15:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707866677; x=1708471477; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owV9kvvQ01YV0IOM7V6TZ+A51SR1Xuk2YazbU2H7zpE=;
        b=lF1fJ2bdnnC9lIRIIze5yGngaK6tvldp6mMnmF3MfBX/m8r9Y+gR27BjvW5Y7mLs1I
         VLQ1qDlUZCBXyNm/3yrlSd123sHX5x33A1A82HVPS7lIFlkGuqI13VKwlrVRb10Q2LYr
         wZPMCx/9dYGsUBRwcVuHh7blREmgT2ijh7Vjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707866677; x=1708471477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owV9kvvQ01YV0IOM7V6TZ+A51SR1Xuk2YazbU2H7zpE=;
        b=jh6bOJ+pvst4Yw7ShAmDq9ALYLENrH6mX8sOEl3J6szyYD5NbBYhLAKjP1+e8buvXz
         PxMgUK6Xh6kTAr7hLxoItBqKPcxivTEV8vo8evf+rm6GwjViSrCyK8CdjKjPAA5yZs5T
         5NZ0ICXh/TqK6OtUfB2Mco/pTFo639NJjS5heTDAUlsBoUt4kK4+hHpli6ox4n5NceBB
         fWKrS9B3psMmfom9Lg6zbMh0KdXOpwrY69fRs1/CEP6ISNQojuL2Dnpo5k037iJAq2uw
         OeqemUp0kVqye1JRi65eviz3I4AS9IQ7OwFdP3B2ignvENWCXNQK9UFkbqodm2ydIXyL
         0oVA==
X-Gm-Message-State: AOJu0YwYrCmzvJpx0LC7ARMsHwKxo2M4hEuydWGPWGbh4L37y84K3Q+2
	audcChMI0cpK+JlvSJ8drBpc011FrHuQCBMZ783q2oLOwT9vqUlNpoALE8rOqSKXK94WNFbuJs7
	ETSGT
X-Google-Smtp-Source: AGHT+IHvJbOabKf2GiNmrCN6pjaOwO5eGkN9kxeiNy2rghk0bn1HkbXV0FTaz3SccW8xWB64D9HF9Q==
X-Received: by 2002:a05:6402:b05:b0:55f:fb4a:562d with SMTP id bm5-20020a0564020b0500b0055ffb4a562dmr892699edb.11.1707866677708;
        Tue, 13 Feb 2024 15:24:37 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id ev13-20020a056402540d00b00560e72d22b8sm4148952edb.2.2024.02.13.15.24.36
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 15:24:37 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-410acf9e776so96455e9.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 15:24:36 -0800 (PST)
X-Received: by 2002:a05:600c:a01a:b0:411:e72d:e5c9 with SMTP id
 jg26-20020a05600ca01a00b00411e72de5c9mr7584wmb.5.1707866675833; Tue, 13 Feb
 2024 15:24:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-21-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-21-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 15:24:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XH=yJdEKSmOq50mXw12hsBc0-oWmhnc4h_itGqfoEjfA@mail.gmail.com>
Message-ID: <CAD=FV=XH=yJdEKSmOq50mXw12hsBc0-oWmhnc4h_itGqfoEjfA@mail.gmail.com>
Subject: Re: [PATCH 20/22] arm64: dts: qcom: sc7180: pazquel: Add missing
 comment header
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
> We put a header before modifying pinctrl nodes defined in
> sc7180-trogdor.dtsi in every other file. Add one here so we know that
> this section is for pinctrl modifications.
>
> Cc: <cros-qcom-dts-watchers@chromium.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Bjorn: happy to see this landed any time to shorten Stephen's series.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
