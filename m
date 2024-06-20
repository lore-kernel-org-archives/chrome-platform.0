Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB701AC78E
	for <chrome-platform@lists.linux.dev>; Thu, 20 Jun 2024 11:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883321; cv=none; b=jIOW5XjtZrnJ4Gu5bWBiwFZu1Qd2dqS3vS7TGPCG/tdh8Hp/0M/gAw2HfD8wV+I9+okNRQqCYL+EZpOvoHbmZcYhkoqcLgh8NX5FRmDcs6OggXwgOP6U6PdY0Tr66as1nDSN94XydxeTyjz0hI1w0cKf7SRrcIM3WEOxDYEpUgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883321; c=relaxed/simple;
	bh=zPPCGCpVrPzpnwGMQ8MGX8wE9ElLtDgEtXc1fM6D7sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+xY9WsY5GF3cSFCuRwfcDyAQ4uJ+SSsMvf67W0kFJTKvX1fKkt6AKz3+cLK4F81zELSEcljWSfP9L3EEtQngtU/6H/AvDt7bxUH35cOowpPA7jzM6Lisk2OP3vBYZOf2PF6T7V0bIa20ncgiEJVExckSo0YKtGmdjlyJjEzkIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THsCLlkM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THsCLlkM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso11902715e9.0
        for <chrome-platform@lists.linux.dev>; Thu, 20 Jun 2024 04:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718883317; x=1719488117; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fk1qcrUS7VR6uiv3rXSOo78BTaK4F+eyz6aHAa6MhHk=;
        b=THsCLlkMoumxyGA8C1r9fpgrjvcaGuLN/wHmiyvKcRQs7wgF1y8vXUrrwp32Lr1DYJ
         tJI4Y+SPDRlZgE3h5/TprvtAO6SgPQPvOaGkQ8ReCOodGZjms9gjPk1vmethJR/SFYZJ
         dRklm4SsFgC4aEHNJMXA0XsZLnKO2SVz/UTjsY59461gFrNtlmj3dvs/mtI56SdbOhHV
         rJ1GySjdJZ5Xt+jwE2OVYIlSXMpnNdlausVbONCBpG5NhGPXKSIVSuFN4STEHRhyPL/g
         ih5ws73invDR0qVXIJUSEYeGrBQBxnSrm+apFaVhM5HW/drKX8Ikc87JsrM9ffc+fwDx
         bD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718883317; x=1719488117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fk1qcrUS7VR6uiv3rXSOo78BTaK4F+eyz6aHAa6MhHk=;
        b=YURMlVbazS55e4GYxKTWafvtT+5moBK97KkN7uqGe8UdIb+pimxiY1MiDI2P1Bl45C
         lO+hMpCnwwXznzCwy1kCfwZxGaRlCw14hs23D+jFNH5LP9AaA6HBLTyXlDEa6tCEjAfi
         LFUj2HuIccMh2kZEtk+ePztPr6smvC5YCTq6Da/g8rn5ZcijxY1GPdTI4PNbW9tuuVZS
         57Wrte/1KOU4+ZjBdWTtc5x1KksQo94x1po7W55gU5Js3fVTXq7FBdjdBzRD+Om+lajm
         HBrsl3Ozs1cO9PEbWbayzgcWtes2W5okDxc3JMhnokP+v2o5PmZ2O7FXL5EBaWHpoRfh
         gcYA==
X-Forwarded-Encrypted: i=1; AJvYcCWv4Bwi8PKNesdWb0NOKosy1UPPOzoqoljnZp3F7ELNcAG0hT/E7j3uKVBbiv+BST7cgrazNncAe+UjaqIJ/6C5zGKQ7h0YveSIXbK7R6Ej
X-Gm-Message-State: AOJu0YzhQ66GBjDy6p0GMQRNyPMmd/iXtIQYBgo5nqUcyANCd38h6xgT
	paRZxS2y7dHWZV6VHRUuZXpmpHd0k5/78SX0Hdlnm7jXg4dBvj10+alE2z9x47o=
X-Google-Smtp-Source: AGHT+IGMJUumhVd5zXX1rZU2J+BofHfd7fe0MAIVGxolusk6jZTAFq1NMKscErXYaaG68fe04/BU0g==
X-Received: by 2002:a05:600c:787:b0:421:8179:6127 with SMTP id 5b1f17b1804b1-42474d41065mr43498665e9.20.1718883317066;
        Thu, 20 Jun 2024 04:35:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:35:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:53 +0200
Subject: [PATCH 5/7] dt-bindings: i2c: samsung,s3c2410: drop unneeded
 address/size-cells
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-dt-bindings-i2c-clean-v1-5-3a1016a95f9d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zPPCGCpVrPzpnwGMQ8MGX8wE9ElLtDgEtXc1fM6D7sg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPi8sMmfgAT+DLum6aX4eAJT720TZZUkgMYw
 dBmfI6bvhyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT4gAKCRDBN2bmhouD
 1+1zD/9KzXHoic8Js9IUevJUSUE5qw0ydGDkJYZhaxsct+uBZoLdqQn/whX6ZYyfBFgZ7o8weCW
 z/uL4moE2VBBBYfuHGCyQ9b8c36gL4uV9ejRbYShlKCl/52gH52I0+TEJ4p7+94ez47mPJi7uXo
 I7mz+pEIhzb0Rp9eltBnyTfZw4CF6G6Ly+R5egovOIwM4oVYMdgsAoo9TQHlrE/y4oFzGmSpZTf
 wZ/50+rdWr/hWGodiJZSlqWWaVdAvC3SxDTY67//Hjub/2cs6ALiP4v7Xulsx1QHLr7U7s8JTq/
 uXr8Sezuzi0p91Qzipa5Nurvs5ZQncV5xL8VZgXAUeClC/+gnqxYJywGSdcCmLV3j/IdiU7y3fs
 KLcXmrlkHX317BwGXdSJUtmt8uUKXovBI92qdGwmuCR3hx7MPJlVPpA613HrEDC/mai2fYLEpKu
 aI7SzB+vmya07U34LGOSdSO6uQkuCh7xz+r1rRRzVbXG1ZcO046fMm5ORSXwzEN5mQPHQl/GDpR
 XcXClw/9IHKj6Eo1W+tfACtgWDPEqIOAFMcxgZL0LTlT8UYNU68n8drTzsA6meXAy9nHLfkUCTL
 8B5IPOyaQppDn4T67+uRuvq7EkaQHLcnqvOWaj9tAMnsvQ/Md8kToe1yTrTWBQau2bGEO6+AMoC
 UAk2iDhLThbpVhw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The reference i2c-controller.yaml already defines 'address-cells' and
'size-cells', so drop them from list of properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
index 1303502cf265..bbc568485627 100644
--- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -26,9 +26,6 @@ properties:
               - samsung,exynos850-i2c
           - const: samsung,s3c2440-i2c
 
-  '#address-cells':
-    const: 1
-
   clocks:
     maxItems: 1
 
@@ -73,9 +70,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Pandle to syscon used to control the system registers.
 
-  '#size-cells':
-    const: 0
-
 required:
   - compatible
   - reg

-- 
2.43.0

