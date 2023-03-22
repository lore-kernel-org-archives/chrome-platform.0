Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80478F58
	for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 17:35:28 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17683b570b8so20115501fac.13
        for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 10:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2HJVH8NQ+L3dWGKI8LYvcw5V5SCoSUd4ykrUldCTjs=;
        b=GlUNTfS1itaKrXrtpRXoqS8Z+UmpGt50w6tvPYfcc29CYNjFftCIr7ksXXPHTLxZvD
         ABa5lMVQQ36SfFpKg99G+H/Cw8nntNDXzWKUZ5QdyAyYMUsLsZzgjCMIdrc36Y4NHqk6
         y624K/t/uqowf/nSy9dgQL71bIHitgTtrMwQrJMUFEhoXUPVyDqhqz1nRIQgfhCtw2x2
         hTKhJrIQ7YQ2U/OKuBBp3rvA5reG7QRGRfDbx+LSWvCjZgTDZqjJ3ukU/vHzCUx7H3XF
         vL80fQQZceLN3z6XBXg00ZC9gmKVkeJLxrnFkk9PsZOgdt1xMEzattChdAu5BO7HE8J5
         TTvg==
X-Gm-Message-State: AO0yUKXN4ieVDcKcOJ53OjLbAHCQhnYeBqc3ezpjo/Ptic5wIGdLHax3
	zIVI04Hz1Q3zx4RJpBxC3g==
X-Google-Smtp-Source: AKy350aKehpe9mY2uKLG/NzguWjKAjUqLy10Rh6whZ8YLNa80OaxPFU52LxNUS4WyXi4QUqD01tEBw==
X-Received: by 2002:a05:6870:392c:b0:177:dfdb:72 with SMTP id b44-20020a056870392c00b00177dfdb0072mr406238oap.9.1679506527672;
        Wed, 22 Mar 2023 10:35:27 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id tk6-20020a05687189c600b0017703cd8ff6sm5379227oab.7.2023.03.22.10.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:35:27 -0700 (PDT)
Received: (nullmailer pid 3971630 invoked by uid 1000);
	Wed, 22 Mar 2023 17:35:26 -0000
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] dt-bindings: mfd: Drop unneeded quotes
Date: Wed, 22 Mar 2023 12:35:18 -0500
Message-Id: <20230322173519.3971434-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mfd/canaan,k210-sysctl.yaml      |  6 ++---
 .../bindings/mfd/google,cros-ec.yaml          | 22 +++++++++----------
 .../mfd/hisilicon,hi6421-spmi-pmic.yaml       |  2 +-
 .../devicetree/bindings/mfd/qcom-pm8xxx.yaml  |  2 +-
 .../bindings/mfd/rohm,bd71815-pmic.yaml       |  2 +-
 .../bindings/mfd/rohm,bd71828-pmic.yaml       |  2 +-
 .../devicetree/bindings/mfd/wlf,arizona.yaml  |  2 +-
 .../bindings/mfd/x-powers,ac100.yaml          |  4 ++--
 .../bindings/mfd/xylon,logicvc.yaml           |  4 ++--
 9 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
index e2046f07a40e..8459d3642205 100644
--- a/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
+++ b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
@@ -36,7 +36,7 @@ properties:
   clock-controller:
     # Child node
     type: object
-    $ref: "../clock/canaan,k210-clk.yaml"
+    $ref: ../clock/canaan,k210-clk.yaml
     description:
       Clock controller for the SoC clocks. This child node definition
       should follow the bindings specified in
@@ -45,7 +45,7 @@ properties:
   reset-controller:
     # Child node
     type: object
-    $ref: "../reset/canaan,k210-rst.yaml"
+    $ref: ../reset/canaan,k210-rst.yaml
     description:
       Reset controller for the SoC. This child node definition
       should follow the bindings specified in
@@ -54,7 +54,7 @@ properties:
   syscon-reboot:
     # Child node
     type: object
-    $ref: "../power/reset/syscon-reboot.yaml"
+    $ref: ../power/reset/syscon-reboot.yaml
     description:
       Reboot method for the SoC. This child node definition
       should follow the bindings specified in
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index cdf1d719efe9..456465e35114 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -65,7 +65,7 @@ properties:
       ARM Cortex M4 Co-processor. Contains the name of the rpmsg
       device. Used to match the subnode to the rpmsg device announced by
       the SCP.
-    $ref: "/schemas/types.yaml#/definitions/string"
+    $ref: /schemas/types.yaml#/definitions/string
 
   spi-max-frequency: true
 
@@ -94,23 +94,23 @@ properties:
     const: 0
 
   typec:
-    $ref: "/schemas/chrome/google,cros-ec-typec.yaml#"
+    $ref: /schemas/chrome/google,cros-ec-typec.yaml#
 
   ec-pwm:
-    $ref: "/schemas/pwm/google,cros-ec-pwm.yaml#"
+    $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
     deprecated: true
 
   pwm:
-    $ref: "/schemas/pwm/google,cros-ec-pwm.yaml#"
+    $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
 
   kbd-led-backlight:
-    $ref: "/schemas/chrome/google,cros-kbd-led-backlight.yaml#"
+    $ref: /schemas/chrome/google,cros-kbd-led-backlight.yaml#
 
   keyboard-controller:
-    $ref: "/schemas/input/google,cros-ec-keyb.yaml#"
+    $ref: /schemas/input/google,cros-ec-keyb.yaml#
 
   proximity:
-    $ref: "/schemas/iio/proximity/google,cros-ec-mkbp-proximity.yaml#"
+    $ref: /schemas/iio/proximity/google,cros-ec-mkbp-proximity.yaml#
 
   codecs:
     type: object
@@ -126,7 +126,7 @@ properties:
     patternProperties:
       "^ec-codec@[a-f0-9]+$":
         type: object
-        $ref: "/schemas/sound/google,cros-ec-codec.yaml#"
+        $ref: /schemas/sound/google,cros-ec-codec.yaml#
 
     required:
       - "#address-cells"
@@ -151,15 +151,15 @@ properties:
 patternProperties:
   "^i2c-tunnel[0-9]*$":
     type: object
-    $ref: "/schemas/i2c/google,cros-ec-i2c-tunnel.yaml#"
+    $ref: /schemas/i2c/google,cros-ec-i2c-tunnel.yaml#
 
   "^regulator@[0-9]+$":
     type: object
-    $ref: "/schemas/regulator/google,cros-ec-regulator.yaml#"
+    $ref: /schemas/regulator/google,cros-ec-regulator.yaml#
 
   "^extcon[0-9]*$":
     type: object
-    $ref: "/schemas/extcon/extcon-usbc-cros-ec.yaml#"
+    $ref: /schemas/extcon/extcon-usbc-cros-ec.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
index 22edcb4b212f..bdff5b653453 100644
--- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -53,7 +53,7 @@ properties:
       '^ldo[0-9]+$':
         type: object
 
-        $ref: "/schemas/regulator/regulator.yaml#"
+        $ref: /schemas/regulator/regulator.yaml#
 
         unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
index 9acad9d326eb..9c51c1b19067 100644
--- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
@@ -49,7 +49,7 @@ patternProperties:
 
   "rtc@[0-9a-f]+$":
     type: object
-    $ref: "../rtc/qcom-pm8xxx-rtc.yaml"
+    $ref: ../rtc/qcom-pm8xxx-rtc.yaml
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
index d6d120a78094..05747e012516 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
@@ -46,7 +46,7 @@ properties:
 
   rohm,clkout-open-drain:
     description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmos".
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 1
 
diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
index ec3adcd3483d..11089aa89ec6 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
@@ -46,7 +46,7 @@ properties:
 
   rohm,clkout-open-drain:
     description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmos".
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 1
 
diff --git a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
index ea3337dafaf5..7902f3c5d289 100644
--- a/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
+++ b/Documentation/devicetree/bindings/mfd/wlf,arizona.yaml
@@ -156,7 +156,7 @@ properties:
       entry has a value that is out of range for a 16 bit register then the
       chip default will be used. If present exactly five values must be
       specified.
-    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 1
     maxItems: 5
 
diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac100.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac100.yaml
index 309606d2d806..f3d8394b27e7 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,ac100.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac100.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mfd/x-powers,ac100.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/mfd/x-powers,ac100.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: X-Powers AC100
 
diff --git a/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
index 9efd49c39bd2..6e880a46d7ee 100644
--- a/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
+++ b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 Bootlin
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/mfd/xylon,logicvc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/mfd/xylon,logicvc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Xylon LogiCVC multi-function device
 
-- 
2.39.2

