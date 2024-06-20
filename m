Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A971AC76F
	for <chrome-platform@lists.linux.dev>; Thu, 20 Jun 2024 11:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883318; cv=none; b=VlWFLq4+rU71utbB1/XhmL74D83PZUw98F4SVjcZpw7tE5gtAMOgCcv91EtFCC9YxVVfMkN332XbpCJxA5Sb4CmipmJxHDqJrC7rEfmopZHy1kzdIEatdtMTquAPb2nCHdECruP/WSPZw8Nj3ZsujiKuZdBRzwkadPtE0qUxE1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883318; c=relaxed/simple;
	bh=rVL5TZdNAPCclrb5nE/XztIDuSnB+tAbeOBu2bqcECw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YcFjbWJYaM6Eoo1ee4xEjIgEQN0XlD31f42QNKo6noCVRFP2HlQ/yu5II3cFBP5KhYrtVR/tUXPfVRJz0WYoWap/nNXtyBQJvKpk7/CmXEKtQGW/Uq1+R59nIs0deeowmieprOhzrkfgNKdOMNaRFkHl/cHVt8P0KuSk6lpAKSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wYAxEaLU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wYAxEaLU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso11902445e9.0
        for <chrome-platform@lists.linux.dev>; Thu, 20 Jun 2024 04:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718883315; x=1719488115; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwhUYUm1LCcouMp8HtttE3x8uGAo7twu336vKpgolWc=;
        b=wYAxEaLUgtolKB+8SOIgtoePkT/yBgPp7CD/buyWSYbj3E4BbDRFH4XyhOusQ9/7x1
         D8v3kv+3Drb/sZIV7uwtOuUWgIIvFGU5gNLL3JtLs7Vc4arrPJ5rdE6KJ8yj7StF8fzz
         U3wcnlgpv2nP6RGjy6hrxHMmBLB9MZIvamceQKal5/v3FvTifq0KNThTNIm0UhPlyxN6
         mU99Ut3axaZjjYkCMeJLn6RJvlwWP3OAlIOhvb1rOu3p1gdKJOKTcHUlXJQuW7CYvpe/
         sa6TJj4QmhpPygZaF+GZ03/gjE2wsvlUj+0RfW59LFSkUhI6g91Js6N8wrOTaFIyzKSC
         8oUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718883315; x=1719488115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwhUYUm1LCcouMp8HtttE3x8uGAo7twu336vKpgolWc=;
        b=ZdH4MYzwgvP9hsUmMycU0Cjz9vrc+lh0WZ+lxKvUzBgGDAJKiEisg6S7b+tSmc0mT1
         iAlI5j0elGXOP3wOTSm9Ia0eCcZG9eFO1Nr0/DKR0e8Idq++D9YErfNBlCJZHsZQQPvl
         VgeEHBfgDqQIUGw7/nDfrSmmBleDP9qzCvBlIPKNswX30C8Q4IPl9a5dHVD7zZdvtIoj
         n9rTsm5o2LtA2UG591IIDxmDyKd8Sa+oiUHHh8wpipp3bfMZ/nJ7vNj+OHO7j9DJ74HG
         6ExK91Ia3Gs8olXhpB5fNKDOmqjO+f59nA+fo+RXoHQwlNfIPNhbJYpEHoHC5iN8mypM
         TNMA==
X-Forwarded-Encrypted: i=1; AJvYcCXurI4M5g7fEIxEOieRHbUyW+TA0JZKqWYp2epXc9QhO3ZSi+po3+0Rba1uWtgc/qRpE1NxDoDsTKeN/UhiGHDWpnr2kD46qaj9qHD4bpY8
X-Gm-Message-State: AOJu0YwBr9oHFZv1VCj+u2RlF162JrtE08JAHLlAfbUQ41yTQrKUDjiJ
	oswT7axSvcJc+3fDnXuUwbctQ2j6P8Mp1hQHOYOpgzj3emPvr//fAiV3Z2Tmm3g=
X-Google-Smtp-Source: AGHT+IGi5yGLp+acd2pIdKmRbWvISb3mjF6HWkCd3+3m9OrI9Xm2zm7H3RAJLTnEbn4GReVJ1cf5AQ==
X-Received: by 2002:a05:600c:3587:b0:421:661d:89d6 with SMTP id 5b1f17b1804b1-42474d34551mr54893695e9.14.1718883314652;
        Thu, 20 Jun 2024 04:35:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:35:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:52 +0200
Subject: [PATCH 4/7] dt-bindings: i2c: nvidia,tegra20: drop unneeded
 address/size-cells
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-dt-bindings-i2c-clean-v1-4-3a1016a95f9d@linaro.org>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sergiu Moga <sergiu.moga@microchip.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Chris Brandt <chris.brandt@renesas.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-omap@vger.kernel.org, 
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=838;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rVL5TZdNAPCclrb5nE/XztIDuSnB+tAbeOBu2bqcECw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPhjRGCc4lUC0U2O07I7kHcdltVj1nTGFgwC
 sahQvJaFr+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT4QAKCRDBN2bmhouD
 12X5D/4yRWWhLEtJEV2feHXZffzW+59NtR0n+V00C033mlHpgQOTkhIS6zxDZ9Ih4FxyzLDj7YK
 O2It2+JIbRxDrecf85UGoK+tTE0FzqCP7d69y+m/UzIgFRP2pNU0NPWnfOBBzxiiML3umIdULgJ
 +dUK1G/T9q3fKI37S6r9tgcToya4zy9hc+u3epP3GNDyzSV5a+zu8I/8ixl5sUmVQZktup9m7ne
 z+77q551bwrbrlt827awh4P92x4TUFZf6kmjmFhbOBQmPiRClZrCaVXMRNxCWmegmRhu4jrE+wi
 fP0Rn7GayfdZGnB1saS8C0pk7HeZ9TdsdJLwKd59SrfIj35el2+XJNIG8F61/70oGd3/inIk2lu
 TdWGlqbT9KY8akeyN91YjW2iJPDpW2E8MjuzpDtMPHhN/NNZ7i5NTOSa/k61K51GA0CapxzmSKR
 hnrfwBfEL8hx49L/5etkLgTSv7P1lGG3ciAYf5qtvIWqTCFLpQycfuw8MP/WRBpQYf05igbxknN
 WFLaqzmm/h4jcIhixhvwXQg7HkX8gYQJaSFp2+HGzgQnWD0QR3S1Iv7d2kGSPJx5EWn/TvO5CIK
 byiD4qhrGyvTGswfSZ9mK6OWmGtpFqGSnH25fmndDM1KCre0xxbt0qUE4AZ5NJwTHLfOcqfxDBJ
 HPsn8SEE1+PLGag==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The reference i2c-controller.yaml already defines 'address-cells' and
'size-cells', so drop them from list of properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 424a4fc218b6..92fbc1a2671a 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -87,12 +87,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  '#address-cells':
-    const: 1
-
-  '#size-cells':
-    const: 0
-
   clocks:
     minItems: 1
     maxItems: 2

-- 
2.43.0

