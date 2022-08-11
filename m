Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F9A28F7
	for <chrome-platform@lists.linux.dev>; Thu, 11 Aug 2022 06:22:50 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id r17so24212657lfm.11
        for <chrome-platform@lists.linux.dev>; Wed, 10 Aug 2022 23:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=myFQW53lMmz4JFfwdyKhJU7fW2/r53OOlYHkexRkvk0=;
        b=kZmCoibdXDwo4VCyOg9H0i19ofJ6qNDdkCQKf+d1OPhuqCtgDoV6C6DRPM1jdhzjgY
         5bzViit6EBDmSkGAMgvUMW49/h3KqkdEDySZjfnyp2Jdut+26LunAq5pH4eZwrA54UvD
         3WTIWaLi8yCDzMPSFRIxRcPDsC/IkJGkv49+tZGfLn9X/QvjmDXJQwswDELsdUvakJ6q
         GzAXtxgm3HLV6dhgOLlrmO9SgY+w12A3nWcl0Tl4bqSBJWLA7UnyxWpXkkBcihOzO3B2
         /vmR293FkhOwLmyWOueapAyyv80CT7mIDMHSLOsOc6HIpV1d6aii8UASVBDNHiiIGBxn
         sOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=myFQW53lMmz4JFfwdyKhJU7fW2/r53OOlYHkexRkvk0=;
        b=Txh0RldIbFNmREN1yKLeJpDHtuHxsBdegiwNOM9Xz+4aWl0ej2+MvP6DhNMq3GMVCP
         uHH0YI33F5g0ML4EcmtkFxs8YlqhZBk8uMHs0CbQ0tE9HyEBxBPOrfSBUQhai0QwxuzF
         8Ai8uQJNCFbPEKIecWTf61asVvdRwzRA9eSH7Igtq308ZvqOw4tcElumwV/pocTBOX0d
         uf//4tmaMLRL5Pv1Piw0ndpoUkWhwNN5K1U/TGzW19ZgSC0+UWa5W3jqC2N+dmFxVhxK
         ItinNIhb9IGPBvhkkcm2v2PJepbzpvwiNnqTpoSdU/vTRf0Y5H0+xtmA91b6mzIdo31m
         7eLg==
X-Gm-Message-State: ACgBeo0BK/ofWLzfWUK79LVTSIJcIvwwSieB6F41lYzoVe0nyeNTyfX1
	7AKzbag3DfPBCJbZMy8U4swzpg==
X-Google-Smtp-Source: AA6agR4X0ticYh1ve9WR7Oyr9gn0xA8WLBimiNGSbaMBCfletyAhGK0Yi1ukgPyk4mAp57e8TWv4Ow==
X-Received: by 2002:a05:6512:3991:b0:48b:3313:2576 with SMTP id j17-20020a056512399100b0048b33132576mr11420442lfu.136.1660198968341;
        Wed, 10 Aug 2022 23:22:48 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0025e66a771efsm677755ljb.136.2022.08.10.23.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 23:22:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] dt-bindings: chrome: google,cros-ec-typec: restrict allowed properties
Date: Thu, 11 Aug 2022 09:22:45 +0300
Message-Id: <20220811062245.4316-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe exactly what properties are allowed in Google Chrome OS EC Type
C port, so the schema can properly validate the DTS.  Existing DTS
defines always connectors with unit addresses, not a sole "connector"
child.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Prashant Malani <pmalani@chromium.org>

---

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Changes since v1:
1. Correct subject prefix
---
 .../bindings/chrome/google,cros-ec-typec.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
index 2d98f7c4d3bc..50ebd8c57795 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -20,13 +20,24 @@ properties:
   compatible:
     const: google,cros-ec-typec
 
-  connector:
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^connector@[0-9a-f]+$':
     $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        maxItems: 1
 
 required:
   - compatible
 
-additionalProperties: true #fixme
+additionalProperties: false
 
 examples:
   - |+
-- 
2.34.1

