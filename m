Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0D2ECA
	for <chrome-platform@lists.linux.dev>; Tue, 19 Apr 2022 10:12:31 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id b15so20593614edn.4
        for <chrome-platform@lists.linux.dev>; Tue, 19 Apr 2022 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6YIh3HDPztean2NUp4hEk/5KOUaDqmdwW5sVxL2kVTo=;
        b=rBaRAPk3AqWA19QNZAYo+MvnfyKVAXmMzDjvfxy3awdYBFUjJDIWchT/uoTa2lA/MB
         t3li31ngEqo03wKDbvw8LAOv1yBoOBt6+QholcPsrxhmjRiJy/BNE6Pz81qIWA2uowW9
         yyDTHs9EyS+BhjseTzNCJgcEdeWnf3Oqqh/f/4UJQz1uGRvSIB57/76S5PQ00R7BmicR
         YJ+wXaEppdTpEJhnUBj6rjf5ex2MOlpNzvWV2tgfhxJ02lP58q+4+BgHjqnR+zyb6PA+
         TJo1dnPANE4XQltS95X9dsjNYDJZQCP2ejYEQeCTCv0C8WBzc4J6pS5gkLHjooVGE72q
         B4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6YIh3HDPztean2NUp4hEk/5KOUaDqmdwW5sVxL2kVTo=;
        b=vg7O1ohoMO20Ave2gyt7w9pjPowaidaowLGn1DvXvGv3UJsnDTLZiz/49iocx6Bf6I
         oO+SaOCecqkoH5ZCi/k8Wg+wEmG2LwlsuVeke09beEBrVOpCxLYrnSEftp9LofXTumm2
         YP1fN5tkk1bjgNiMyEtsDeaItAQUv0eHqxPpOOb46eeNnRfwfnmJ+eaSB44+wSgRLnRr
         xSb6BgVh5B3FI1kJNux0dMqy70RYu4zqXLMhbYR+Jkebn6g/Tn4dBLkC1+leekmD7YNy
         T8/+Lj6noK9JMKT84aRJbOC7SVAfSFKO8zCOqoUHq92TkFrpQG7Tl5pnJf8dCKtuwWjV
         Qv8Q==
X-Gm-Message-State: AOAM5307kuE3yiepLZK+YXk1ltZ9f9GT7GCaQErEEMZOKEa7VIMpg846
	EzpdHm1aSPc44m4T5ZngSv4oDQ==
X-Google-Smtp-Source: ABdhPJzzS0g9hBuwjfOsu4N4YsswKBvUI+7x79YPwkoHM+EZQ0AKr3/TO+o5s/RZeAxjY2G/d8x7DA==
X-Received: by 2002:a05:6402:350d:b0:419:547f:134a with SMTP id b13-20020a056402350d00b00419547f134amr16773920edd.405.1650363149990;
        Tue, 19 Apr 2022 03:12:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v21-20020a1709064e9500b006e8973a14d0sm5581177eju.174.2022.04.19.03.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 03:12:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Benson Leung <bleung@chromium.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 2/4] arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
Date: Tue, 19 Apr 2022 12:12:25 +0200
Message-Id: <165036314213.180327.2519068046721343173.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com> <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 14 Feb 2022 09:19:14 +0100, Krzysztof Kozlowski wrote:
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
> 
> 

Applied, thanks!

[2/4] arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
      commit: 559d2104bff0c9a6379db652136d30836859252e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
