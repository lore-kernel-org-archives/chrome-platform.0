Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211F71925B3
	for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731922450; cv=none; b=jx/xIvtLthtGxsuggNlPDGa4n9UOeH3SuBI1E5jAXBzX+Sp5LzkXfrDsUTMPSrlJ6kxIWhXat7AWAsrBueCyBRTZyN2+WlmLsC4evywduaGnUkNfvvQcwMRETkDO9SHst+ejxcd09+MdtgqN9KTO+GJYu8Evgv3ro30Nuz/0Q8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731922450; c=relaxed/simple;
	bh=oQBa+arFToImvygLUmykUiqwBnm+r3Jm6b2xiExq89A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iHo+AuzYZ4vxYUc4gJqIYG5mUN8/RBZmIylUN3V6rCq7Krmqwj36YXUTRP+SI76BBRjUUxaEjSL3QbeNQtFiOmaBz5atwszkNiqM9RyaxR80O0qy7Y0enbyzNLw/3pIirzGyqVBJAuk8m1Jc0v/E1J9woqtZZWtVzShhVraD+NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XL2tdxzv; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XL2tdxzv"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e52582cf8so1105679b3a.2
        for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 01:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731922448; x=1732527248; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHXQE/YkSfeFGTAAqcokg2A23ODQxbzC48wuYHeeOsM=;
        b=XL2tdxzvq5U3dgI8ngGJtUMpvNkBuLZjnh8TTO2A7Jj1GLcVaDRWsXDb59WWE0qBQ9
         6yBgWNLb33BzpuFEnbWoyZUPi26ax1+5ofNl5c/QGNjtb9CJp81Qm1VBwBWvVhlB+ZaV
         8af2E4GiXtz8fOFS8pxXTp89X53WUZxskOwNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731922448; x=1732527248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHXQE/YkSfeFGTAAqcokg2A23ODQxbzC48wuYHeeOsM=;
        b=gn5eaiv7uBn74O/1kBaXO9TJULY4LRX1aMx1hCpcC4w28+ZYX0/dnv/pzIl1ijDmuq
         2RqDFSWbp//Fa+sXWUvzcJG0uyZ2dvEa3HVzUstdimNlXMyaikFgsQkLJV9aFcsbq/yv
         pyiVbOa+xfdZp4wzzf4HE0EVzj76KC75ZF/8gi+S/DdUnKuY9kojMEedb39ZKs1Irr8u
         PMmOR0f6iGdqZQrEI/Ccq49L7FJroMENtzEOCc32lDnxOQEePEfRQMFxnB93gISJNVvw
         B3aMWo3IU9lSA5M2Kq8hSxVwuvOaoapU9cRV7kjGiscCbt/iklWMryTSEdUg8WCHfr1H
         VY2A==
X-Forwarded-Encrypted: i=1; AJvYcCUBaEurWRDZjfPTQ8YccOPxy15aoh/c3CmnqzzktYephVUTjNRY5bR1rfopaJ+BNLdM7TcYXnl099c5bKPfQ3Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/dT6x89R+XWF/pmgQ3gtOEj1d1tm4Ks3tLBs76oqpemAd3U31
	6D5kJojsi6VjdLWp7BnxPOfY4iwiXtbL27tqf2IGc0XAkIoy5oM54lMhXkE/QQ==
X-Google-Smtp-Source: AGHT+IG2sOF9mqpA9kM4EzBZ19VjQrlcYkQ8SMGZKqRzx8/+WwzPqwYlg+wjyo1LmGg63cIPu7qorQ==
X-Received: by 2002:a05:6a20:7fa9:b0:1db:e9bc:1b1c with SMTP id adf61e73a8af0-1dc90bb3866mr15806642637.28.1731922447589;
        Mon, 18 Nov 2024 01:34:07 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:e40d:fa29:75db:2caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f1e24ce4sm8333500a91.0.2024.11.18.01.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:34:07 -0800 (PST)
From: "Sung-Chi, Li" <lschyi@chromium.org>
Date: Mon, 18 Nov 2024 17:33:47 +0800
Subject: [PATCH 2/3] dt-bindings: chrome: add new binding
 google,cros-ec-chrage-state
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-add_charger_state-v1-2-94997079f35a@chromium.org>
References: <20241118-add_charger_state-v1-0-94997079f35a@chromium.org>
In-Reply-To: <20241118-add_charger_state-v1-0-94997079f35a@chromium.org>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731922439; l=3165;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=oQBa+arFToImvygLUmykUiqwBnm+r3Jm6b2xiExq89A=;
 b=0hwa6pWnShfMj5+1Y8nbF73R9eB01LMvqC0LFFyIM02SGd4i0fyCG/90SbVomYPRHIFQIKrSq
 W9v3H7Xh9w7DOhL9VIqxgvkH4oSz1CMwyOOjNMwi0Y9hSDb15MCQCZw
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

Add new dt bindings for charge chip control. The charge chip control
dt configuration is used by the driver 'cros-ec-charge-state', which is
added in the commit "platform/chrome: cros_ec_charge_state: add new
driver to control charge".

As these charge chip controls are connected under the ChromeOS Embedded
Controller (EC), also add the patternProperties to the
mfd/google,cros-ec bindings.

Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>
---
 .../bindings/chrome/google,cros-charge-state.yaml  | 62 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/google,cros-ec.yaml    |  4 ++
 2 files changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-charge-state.yaml b/Documentation/devicetree/bindings/chrome/google,cros-charge-state.yaml
new file mode 100644
index 000000000000..40e8f6988769
--- /dev/null
+++ b/Documentation/devicetree/bindings/chrome/google,cros-charge-state.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/chrome/google,cros-charge-state.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chrome OS EC(Embedded Controller) charge state driver.
+
+maintainers:
+  - Sung-Chi, Li <lschyi@chromium.org>
+
+description:
+  Chrome OS devices have an Embedded Controller(EC) which has access to
+  battery charger IC. This node is intended to allow the host to read and
+  control the charger current. The node for this device should be under a
+  cros-ec node like google,cros-ec-spi.
+
+properties:
+  compatible:
+    const: google,cros-ec-charge-state
+
+  min-milliamp:
+    description: min current in milliamp.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  max-milliamp:
+    description: max current in milliamp.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  type:
+    description: current limit type.
+    enum:
+      - charge
+      - input
+
+required:
+  - compatible
+  - min-milliamp
+  - man-milliamp
+  - type
+
+additionalProperties: false
+
+examples:
+  - |+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      cros_ec: ec@0 {
+        compatible = "google,cros-ec-spi";
+        reg = <0>;
+        interrupts = <35 0>;
+
+        charge_chip_battery_current: charge-chip-battery {
+          compatible = "google,cros-ec-charge";
+          type = "charge";
+          min-milliamp = <150>;
+          max-milliamp = <5000>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index aac8819bd00b..3db4a48d5176 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -166,6 +166,10 @@ patternProperties:
     type: object
     $ref: /schemas/extcon/extcon-usbc-cros-ec.yaml#
 
+  "^charge-chip-*":
+    type: object
+    $ref: /schemas/chrome/google,cros-charge-state.yaml#
+
 required:
   - compatible
 

-- 
2.47.0.338.g60cca15819-goog

