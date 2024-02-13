Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F37A63105
	for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 23:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707866665; cv=none; b=W+6xON1nI5e6QgiJSNwQm8qZMtsfGJU4s78ij85kxBrV3M2XFOqor0QjSK4usNzoveuDJEX/aohMF9F5LVxz6aU2OHvkXGe3Ep+e5mN83fI8wSId5yfTHYgfTK4G/CT+0EJDFDWc7zeW1iS4yhkCYc/z/x6E7ZOyjxAwF7bLrdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707866665; c=relaxed/simple;
	bh=SNOVFhian0wSmfjQUWbhIZH1oLKhGuatN3RQQaM/zI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6FXTIJjf3Q2fCBzwW68k7rC6F7P1Doit4jvIt7ueXjYyUL8YtH2AoWVtQxoBjcXAIEuZh93L1qF+H9chQHssQihwpGAUUqA/vBWHLoF97FcEE0bo9ptmtLmTkV60BELLIBJQ8VMkP8+6CcaGrkKj7++wmP0GVJzriTRMlAlPRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ixgYym5G; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ixgYym5G"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3d01a9a9a2so133377066b.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 15:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707866661; x=1708471461; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyzkdDn36VkqM4HUW3/5Yc8FfYXf+Vgri3xwPCVSUsQ=;
        b=ixgYym5G6SLt7MjaI2r6Jv1Ozhln6atIV3LMNl20qKHpCypbj2ppH5cmnKQMavKL9u
         m25YnaU/YXpePO+1/4A6zFdHqLjuQkCJpcHSf9bMmHkOj/1cL4VKREY5Pmjm7RrFwZAp
         Gl7QaLtsryE3hSu+TMnTpjacTvCDXixEM1PUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707866661; x=1708471461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyzkdDn36VkqM4HUW3/5Yc8FfYXf+Vgri3xwPCVSUsQ=;
        b=n/P8QFHNV9x8ZLLXi6uxpUooRcO7CIdtmjlv3AxcML9tkd8Bx9UDcW9y5D3ufOWHlL
         2Gk0NEMO/kCW/Wo9RC2rRk+0nW9+sHI0P53n0EdTRw6Y6Sw3gfNguYnpDlJ3cS3O/0en
         RhI5E2ktCtmPZyAQjhq42ODzy36/TYEQ8qKxyHjHb5ghEvMAOJAUWyp9XNw2DqBFvY50
         KwD7Gz4Sg2aYTkdLYo7w2DY7FfPuQ0Q7GysUdlXpYUzItArm+OlpGX+XCpuImTXxfZV6
         LANmOx2T3NazZ1ZES40/Hulp7xgED/gPrHNWMwgXdtnQocYoJuaHinLkZAFg59adYCmN
         8Lug==
X-Gm-Message-State: AOJu0Yy8q4mKeZH7G5HSeDgAEV9UlUJ9bRM+BwefmK98XVCts1DgCJWd
	tndIL2eGpUt5WJQFu1WMc6MvJV1h0HVwM2sOrh2syftokr9kg0KCyq/im+l78elzkvkltlW1Hja
	61j+t
X-Google-Smtp-Source: AGHT+IGqcX6kuKinucsaGOSRp1gVube+KXrz3UjpdHxeXZ6XzxLgMQST8DoA2Oeojc5TBFJ8bvkIWA==
X-Received: by 2002:a17:906:b817:b0:a3d:26ee:506f with SMTP id dv23-20020a170906b81700b00a3d26ee506fmr470302ejb.74.1707866661691;
        Tue, 13 Feb 2024 15:24:21 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id ef18-20020a17090697d200b00a3d346d5b0fsm209520ejb.42.2024.02.13.15.24.20
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 15:24:20 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-410cf70a057so97355e9.0
        for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 15:24:20 -0800 (PST)
X-Received: by 2002:a05:600c:a16:b0:411:cf85:9549 with SMTP id
 z22-20020a05600c0a1600b00411cf859549mr57493wmp.3.1707866660353; Tue, 13 Feb
 2024 15:24:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-20-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-20-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 15:24:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XxX9wqZdwf9Wtq2=KOKgTr5FhyJJWp8S9W1xFW3cY80Q@mail.gmail.com>
Message-ID: <CAD=FV=XxX9wqZdwf9Wtq2=KOKgTr5FhyJJWp8S9W1xFW3cY80Q@mail.gmail.com>
Subject: Re: [PATCH 19/22] arm64: dts: qcom: sc7180: quackingstick: Disable
 instead of delete usb_c1
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
> It's simpler to reason about things if we disable nodes instead of
> deleting them. Disable the second usb type-c connector node on
> quackingstick instead of deleting it so that we can reason about ports
> more easily.
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
>  .../arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Bjorn: happy to see this landed any time to shorten Stephen's series.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
