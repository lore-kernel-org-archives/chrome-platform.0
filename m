Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D595C15C0
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 01:54:54 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id t2so8287266pfj.10
        for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 18:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U+oN2PkESqB41nkMUnSgEXHs7aUpmXvqHqu6nMf9ygI=;
        b=e9WddNIUJiPhK0Y81FA/RAxuWrUeVracIXuSi3Py1u61KIblEyW1HbOKaisIMnBTi8
         TDwzciOOyCOYx0UUy/P3oZnZ7JJRHI6lzJskdLBCaZK0+h7qSdeVxqLbgaNpoQELVCkU
         0zwHRWxvBUzUMAQFsx6V+6ZI0gsKLXAUjhI7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U+oN2PkESqB41nkMUnSgEXHs7aUpmXvqHqu6nMf9ygI=;
        b=Cu+hEj0y6021rFIQNivbLKnhLU5q6cg49OpOhxmn+ZUWl34B00F9ICt0vALqwLW2XI
         DfgaJuaqBehqpdgv10YsFQVoBJnDSqU5aFZFZEKCfU3Fxw2ojJiYcVrNB3wOYT2Y+AZv
         4D5kE4uJV3n24qGG88fJft9iffhuTaI50yAdL2mWu6DAohp7uN8BJE/u4qNBn9isl3mW
         XOqNDd1W5HMvx7rR25TYPxo7x9XYz1FB8zQFO0YDxSiN95tERArwf3zLZ078cBhJ3uym
         B4FsFn45pXcypznPyyaz8FS1RnAIyUG14hkVk9WiV/iCvy0I7NRBYZ0QDLRIFC/iRKfH
         bcyg==
X-Gm-Message-State: AOAM532EQTCUmbLXdMUktxVhJHXoe3fRVYXDeogI8P8x1s2QS3Dh7Mm2
	5d+XvRusoeelgd4e7mjR2h92tA==
X-Google-Smtp-Source: ABdhPJw+tLB09E1yBm6TENEEbz+loQSPysQXCshfbFNSGsjCJDorbQbkjCs89FjWuc0TJkwWng5j9Q==
X-Received: by 2002:a65:45c8:0:b0:380:352e:825b with SMTP id m8-20020a6545c8000000b00380352e825bmr5937245pgr.509.1647568494348;
        Thu, 17 Mar 2022 18:54:54 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:49cf:7701:359e:b28f])
        by smtp.gmail.com with ESMTPSA id u10-20020a056a00124a00b004f783abfa0esm8050201pfi.28.2022.03.17.18.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 18:54:53 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Craig Hesling <hesling@chromium.org>,
	Tom Hughes <tomhughes@chromium.org>,
	Alexandru M Stan <amstan@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 1/3] dt-bindings: chrome: Add ChromeOS fingerprint binding
Date: Thu, 17 Mar 2022 18:54:48 -0700
Message-Id: <20220318015451.2869388-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220318015451.2869388-1-swboyd@chromium.org>
References: <20220318015451.2869388-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding to describe the fingerprint processor found on Chromebooks
with a fingerprint sensor.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Craig Hesling <hesling@chromium.org>
Cc: Tom Hughes <tomhughes@chromium.org>
Cc: Alexandru M Stan <amstan@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../bindings/chrome/google,cros-ec-fp.yaml    | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml
new file mode 100644
index 000000000000..b7fbaaa94d65
--- /dev/null
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/chrome/google,cros-ec-fp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS Embedded Fingerprint Controller
+
+description:
+  Google's ChromeOS embedded fingerprint controller is a device which
+  implements fingerprint functionality such as unlocking a Chromebook
+  without typing a password.
+
+maintainers:
+  - Tom Hughes <tomhughes@chromium.org>
+
+properties:
+  compatible:
+    const: google,cros-ec-fp
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 3000000
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios: true
+  boot0-gpios:
+    maxItems: 1
+    description: Assert for bootloader mode.
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - boot0-gpios
+  - vdd-supply
+  - spi-max-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <0x1>;
+      #size-cells = <0x0>;
+      ec@0 {
+        compatible = "google,cros-ec-fp";
+        reg = <0>;
+        interrupt-parent = <&gpio_controller>;
+        interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+        spi-max-frequency = <3000000>;
+        reset-gpios = <&gpio_controller 5 GPIO_ACTIVE_LOW>;
+        boot0-gpios = <&gpio_controller 10 GPIO_ACTIVE_HIGH>;
+        vdd-supply = <&pp3300_fp_mcu>;
+      };
+    };
+...
-- 
https://chromeos.dev

