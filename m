Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213551ACE6D
	for <chrome-platform@lists.linux.dev>; Thu, 20 Jun 2024 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883323; cv=none; b=DuAy9uG4i2fCp2aJD2lMaFAaOpV+8MwFazQs8SMtvtkO/tOCJuWo836VXwnL2sNERHQ5RbMeqHWI3kHq9vsPEbodB7I5F73kW6QS0QNjtfCqsf0RCVWh3YCiSTqAudWYHhcScK5MfK6MJ3mXc5QeuiST0Vg4CnyReT4WHQ+PJfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883323; c=relaxed/simple;
	bh=se0qu2ScDHev5e2u9T2lUYbcxySx/dcEaULZrF/4POM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aKlmafCjui+TR2ybqdhrbZ2zgs164ybZfSBSuAGMWYX7Lhj1n3zXT/NJBW0PtPCVpvdjMDErQhUPPtqBQGzqIVM06uI2bK5gsIMltedAZYZSpYosOlZb5Tr/bkkOm8EgCNEeBgE1pwEFktLhrxbhdnoCsu6OeqczhbW5axCw3PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=riWmGFuu; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="riWmGFuu"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso7371101fa.2
        for <chrome-platform@lists.linux.dev>; Thu, 20 Jun 2024 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718883319; x=1719488119; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RdxrQ5ek7BKyD1Q5GyGk/KJKbJ7uIbq14OZ4VVg0Iw=;
        b=riWmGFuuLGSgfI+yET4Pc1vJmss+SstL3PBhbnVz5DmLcZ1bv2EBpGVfGnfdhZpjP4
         suvi4dMdjmW1HiBvhApwIWZYYDfSseOtibLOp6q+jjkWWUBzCtKb9ih4GuVPSQzJISzD
         OyYBqvpoTTY+v1GZTf/kZKTig1o1oCQS8ggTMcdaqdfh4nXtubjRHzxWErtgkV1yeagZ
         PQE8klH7dSkz+SQ/I6m17UnXc9x2N416TtIlTCvbkGZO+VmzFLuxMtTemyVKHf4VLUIB
         WXA83DYXoISS49IgK6hy25ZkaDoNVoIbK45ncYGByzaYIt8+LUXIYb0Hz6k4FJxcAdAk
         aABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718883319; x=1719488119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RdxrQ5ek7BKyD1Q5GyGk/KJKbJ7uIbq14OZ4VVg0Iw=;
        b=WJAUM/TL1sxd/xo/kL8Pr1cuYGHB6YgGZqaoUjReAKoJlNtDfsZQ2IvUGmpMPofqkV
         ptQi2kQbZAHvUy+XAZK4ylPj4Z1ikUaST1ZeoQS0srSxlyMgRVvIfqK4EBcRX8Mx5aWf
         ItNnwCvr6M0Aib/4dkh10E5bHBrr+721j4xdwd/oZHG9Ji7a7aTWuWI3vcl9mUNJ6APk
         JbljDwOs9puHg6bN6tOL8mnL8HYZnzRUDH/eFVrnXlD3ZQMBSCIxSkerPR3y0w2VilFH
         OycoimIJ9EQkXq/Tn79y2SkPbq9LmMC6f3Yur040GL69clncZimQ+FotwuR3JBv9DH3C
         h/5w==
X-Forwarded-Encrypted: i=1; AJvYcCWUfiY82MZXJgB/IfkAfFaDATSpcgdFOJPqH2Hc7e9m4I2VCTMb8V4DPDc8cSTg+yu5GI/o5DGrkUsqUF9yVleF20LqAlhZHpYyAdcd84WL
X-Gm-Message-State: AOJu0Yy5qUmHz7HfdXy1Ymo7d/SggkwgSTzmTngFaeR3J2P66MA5pJI8
	WRUp5p72O7Ak3WMCrj5xioE2t/H3dcGGNDZ6/Ev4BwprrdS5B7SiBSQsAiOhPNM=
X-Google-Smtp-Source: AGHT+IFq9QPiqdW/LV2Lp4ipmnGkGcnbeE41LGRET4efCA18VuEBGazMmSwAgyABOsGpRfVB16xuXQ==
X-Received: by 2002:a05:6512:32b1:b0:52c:99e5:6880 with SMTP id 2adb3069b0e04-52ccaa36930mr3166877e87.33.1718883319455;
        Thu, 20 Jun 2024 04:35:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:35:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 20 Jun 2024 13:34:54 +0200
Subject: [PATCH 6/7] dt-bindings: i2c: ti,omap4: reference
 i2c-controller.yaml schema
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-dt-bindings-i2c-clean-v1-6-3a1016a95f9d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=se0qu2ScDHev5e2u9T2lUYbcxySx/dcEaULZrF/4POM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPjSq+rIwMEv+nxqFX6eolXOSM2y3OaG46ld
 hES3qoe0I6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT4wAKCRDBN2bmhouD
 18ktEACWRnxxzFEN5hoHHubQp9ltuAKuiTii5YSgG71yB9jinAqHGF3jmQZasCvFKp/Y+C6XSE4
 7HbfKJqc6iVJUTmJ9IHYa0FDAoP6myAlMkuf4z8mBw8uodhtnA4FPsPAgnKnmpN7CMUkfjsO1IB
 RfuBQlifdmWFTp2bvqqIwWSNTjROsr8uSHUki+Ww8DgzlsWkQ7HfMzwBy4idLIeUkzNtuRb0Rfq
 0QuXu7sAiFPaq4i+V7Z6sDKJckvnHTx5zEpVJv8z2X/D1Z7+jEfByDjXYftdHKCOvK6lWm+qYZc
 VEtxStj3nxMhPO232xFXoij7eu8UKvrFsDseAZkBU/Vq7GCyyhj8SGDlfTlwG9zQN82lD0W8Xlx
 HeX/+LtGE2bjCXPKaMPWGMT9t2tdwsmqAbXgcflvypg+KmDe+kg60qizj/VNKa8JsHWPCLaHpxW
 txJs+EQ+emVa80XM3ga3vvvcum1STbUNjVEDZjuTF3pUGqCyS3IL4fUPjZEXewYueHwtW5RZSTH
 M4z27wsRgrMUTClUO8SVOrHJykSSLhOHYirJ6JupXaT0ju6kviSTzxtG9cYYcu2JJiB/qzGJT07
 3vSZBQyonxBRu0eI7T2ALDo/VeTLqrT166RyOQGK75poPywXVfTIR1nkcED+fABKAkI0znrkI8t
 30sKJbP5RtX6h1A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Reference the core I2C controller schema to properly define common
properties.  This allows to drop several (now redundant) properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml      | 52 +++++++++-------------
 1 file changed, 20 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
index 781108ae1ce3..c9d1030e9857 100644
--- a/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml
@@ -37,16 +37,8 @@ properties:
   clock-names:
     const: fck
 
-  clock-frequency: true
-
   power-domains: true
 
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
   ti,hwmods:
     description:
       Must be "i2c<n>", n being the instance number (1-based).
@@ -55,38 +47,34 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     deprecated: true
 
-# subnode's properties
-patternProperties:
-  "@[0-9a-f]+$":
-    type: object
-    description:
-      Flash device uses the below defined properties in the subnode.
-
 required:
   - compatible
   - reg
   - interrupts
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
 
-if:
-  properties:
-    compatible:
-      enum:
-        - ti,omap2420-i2c
-        - ti,omap2430-i2c
-        - ti,omap3-i2c
-        - ti,omap4-i2c
+  - if:
+      properties:
+        compatible:
+          enum:
+            - ti,omap2420-i2c
+            - ti,omap2430-i2c
+            - ti,omap3-i2c
+            - ti,omap4-i2c
 
-then:
-  properties:
-    ti,hwmods:
-      items:
-        - pattern: "^i2c([1-9])$"
+    then:
+      properties:
+        ti,hwmods:
+          items:
+            - pattern: "^i2c([1-9])$"
 
-else:
-  properties:
-    ti,hwmods: false
+    else:
+      properties:
+        ti,hwmods: false
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

