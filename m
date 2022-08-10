Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06E82C80
	for <chrome-platform@lists.linux.dev>; Wed, 10 Aug 2022 14:37:28 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id z20so16324495ljq.3
        for <chrome-platform@lists.linux.dev>; Wed, 10 Aug 2022 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=R+Ougz4fRR8eTzuJCOGBB5cXOVbi2l3xNgfJfKfekik=;
        b=Lds0fv0b+SulbyNYD4YjOLRTUHDrpRM9pApZFe6gS0IzjVbyRtJutYyamESDlcxsEg
         l2o7LwlQO1VZrJabB69g6/B1nn1uVDB7JJtBAYRK/szW1+NsigbVDPD8NgYKIjYKN4h3
         +fowc+xNrML0jG+0414Bl89xeoHiJX5pkc5HiXb7iw911/v4mqRJlEW+BuygnfcHRcUY
         lTY4L7QlN3vtealDUgO+VR4vuN74Tu6g1k2w5ejyyzUtLa4sNQyNjnmhbvYCxZBZ1dG3
         DlPE9FzrqpRhaqSxVtegd/7HFie09R2rvSv7cmTKU955KNUxOpRWKUJEVRmKNBNI3loE
         /+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=R+Ougz4fRR8eTzuJCOGBB5cXOVbi2l3xNgfJfKfekik=;
        b=ZIpwm27MXAk11sGeqzunyKrlHqiVDI88axVvmJN52hXMXrpEJCERmKjs+nLqkymBNh
         PtABtYlYk3EIXs/vKTnL0kNHZfMf3He4Q3ZAWIHZASQmBJ1oB32Ndi9M41IWdtxKd/EN
         Kt3AAhXZdhzTVnhHG7BNtMIcT0Ta25xBhJ2Ld/eKfYwLFygoBfdHRYBHSjqTdUvlZAoM
         EZN8UqvqMvLIKLniZTJRlt3lfwtfNuw8KGVdZxkwuIqwNgC+7ijJdyOTVhcEqfrCaX9h
         nZ1QB5zJUkz4/ANznTxXJ7ckXwWw3JDzPQRkk85CFMcSvuHBt+BsJvL3DKt0YNTOTRlg
         Oz6A==
X-Gm-Message-State: ACgBeo1JkGC6fhAVYkjEXiEWsqDRHVaADROc1eg+7zH3XmkBzInBS7AE
	bvg8NPgfWAAWKbOSidMqf0cw8A==
X-Google-Smtp-Source: AA6agR5epgFnbUL98NJO8fqilTyQwEnTqSP/AArKazeI+Lbd/CIEuHx4fdNa17GZ7W0kb8lrfOAHdA==
X-Received: by 2002:a2e:a409:0:b0:25e:724a:f788 with SMTP id p9-20020a2ea409000000b0025e724af788mr8208513ljn.300.1660142246958;
        Wed, 10 Aug 2022 07:37:26 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id q23-20020a056512211700b0048b2583fb46sm360445lfr.200.2022.08.10.07.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 07:37:26 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: chrome: google,cros-ec-type: restrict allowed properties
Date: Wed, 10 Aug 2022 17:36:13 +0300
Message-Id: <20220810143613.482724-1-krzysztof.kozlowski@linaro.org>
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

---

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
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

