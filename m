Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308DCA28
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 16:21:59 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id e11so11778331ils.3
        for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 08:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y/lXxznWJk6t4L5VwAqaMS0+NBIKS0zk3kQAGJ/1b/k=;
        b=JZLXUfRWra54tioTiu2lrYxDJmGtcUX8NNdySo/F7BWBvDruBVnf1bOydWNgXOogN5
         Iz7arnCufrG1kJ9V7DcoDSRxMCbNRVV3btf8XwNiGUJYm3d1E2eS92/RlK7bOd1VQe5G
         IQJLzFRnqEVjliOJs+NOd9nwMMPcEvNaZXjNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y/lXxznWJk6t4L5VwAqaMS0+NBIKS0zk3kQAGJ/1b/k=;
        b=jlo03668u/wMtpZMHQoYDxMcHuTL3rDrm4hUbNWu25aBQrwgCYVGbT487jpueDygzm
         hS/ekUn25oXmVkYKvJF1w92AGED/xEwDLksVSRyN69at0NJx4Dy+SMAqt4oVUM9uRs5P
         gKJZW4J3XbLf5ZrUuJIhVIU1qZWVT3K6TclGYbb52bb8YXGYnRA625IUVeP4TrL6Sk9x
         3Altf4Aag4r8EHulLT90oDkaijUYBnbk7HosKb5DpwOULLoalYciosocn61+GKKcC+P3
         rRG4DAvXbU6OZS63I3ZypkXl4YtAst9Ar70Ogz10P0dZUWRPryq9R4jaxbpc9tdZ+w1t
         Weuw==
X-Gm-Message-State: AOAM5337wBuLre51frETyMvnEC26XXUBI7dZ/lQqH0xRbuApzp6R6aVR
	m0mOLmGuJp7sywyZLnxhL0779agxRwFkjg==
X-Google-Smtp-Source: ABdhPJzijsxXDZtzGKGwbeKlXxRThK63b8zotoiQayeCTyLnKMBjOAvjjGPe0RsssmrRGeiSupymWg==
X-Received: by 2002:a05:6e02:1065:: with SMTP id q5mr106483ilj.97.1644855718056;
        Mon, 14 Feb 2022 08:21:58 -0800 (PST)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id f10sm16999662ilj.73.2022.02.14.08.21.57
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 08:21:57 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id k18so6241168ils.11
        for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 08:21:57 -0800 (PST)
X-Received: by 2002:a05:6e02:19cf:: with SMTP id r15mr119973ill.180.1644855716786;
 Mon, 14 Feb 2022 08:21:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com> <20220214081916.162014-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214081916.162014-4-krzysztof.kozlowski@canonical.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Feb 2022 08:21:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VNarYKq8cZVqWfFKccTqxH46Wmm8Tr979EVsiAoOnT_g@mail.gmail.com>
Message-ID: <CAD=FV=VNarYKq8cZVqWfFKccTqxH46Wmm8Tr979EVsiAoOnT_g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: align Google CROS EC PWM node name
 with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, linux-pwm <linux-pwm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Feb 14, 2022 at 12:20 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts | 2 +-
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi             | 2 +-
>  arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi             | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                 | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
