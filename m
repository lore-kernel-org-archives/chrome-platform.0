Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DBD6132
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 19:11:03 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id d76so1664822pga.8
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 12:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y8xKsOKQoYHLByfOe51jB9Pdd/Kku28PTFesOqH+BHQ=;
        b=a/wUtTrzJZ88ZdS3AVoW24UHEU68v+xnSwdesJpUMBwCbIZfekHcio2TCKhij0nOpa
         OCjgj8Per1gAFGqZxA2+1s7a6nhUvF0BOqHNJseprvbjc82DetVtxab7DzbtCBgpfTHx
         pJjaI/x8xXG46eJozZgliPjtIlsw6f/Uzo58M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y8xKsOKQoYHLByfOe51jB9Pdd/Kku28PTFesOqH+BHQ=;
        b=lZAECaq3Z1k+krknxtzkGUS8zeOMRD/wl9o4+fYKB5X+A0ckoYJP3xnaZHWKHJ9dHf
         xOjuNpPxaPVkFn2US8A6AqSNHTMH9yK0JnJ5fROEtPgLjYg6dlV59J/GBVl/hE8Bfkin
         TxB6m0kcamZloxIuDdE2GPjPLyf8PrgHzzAdU3eSRY8WcH71o5aoxFdcwwOOPMdW4sJX
         Q7p4k4EkgjEz48JwQua7VtwYIakvnepiXIEuiHrHCCK1puFdFEY/8ZH5d/EFFqslCMGL
         J9JSXdW9mZKejYlblsxmewGxnQfp/xBY1i46Gt2jGTXOL+VTY0tKCKbjxdvzsefWU0sb
         XeKQ==
X-Gm-Message-State: AOAM53339Fz/TOLso0KAULpaQxpVN9abtkgE9Wbk6XTjGletYYlXpUUa
	CqgwIJ8/Up+oIwzdm1SHqznNTQ==
X-Google-Smtp-Source: ABdhPJzcynlfZI6q4Y8x/ntQYEEgl6MQIbVAzndxpP1vJNsgWD1rHv5EflpnTaA945avao1y2ykHVg==
X-Received: by 2002:a65:6d0c:0:b0:382:a4b1:c93 with SMTP id bf12-20020a656d0c000000b00382a4b10c93mr2390953pgb.237.1647889863416;
        Mon, 21 Mar 2022 12:11:03 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:2ffa:f7a0:c7f5:8171])
        by smtp.gmail.com with ESMTPSA id y14-20020a056a001c8e00b004fa829db45csm3384022pfw.218.2022.03.21.12.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 12:11:03 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: chrome: Add ChromeOS fingerprint binding
Date: Mon, 21 Mar 2022 12:10:57 -0700
Message-Id: <20220321191100.1993-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220321191100.1993-1-swboyd@chromium.org>
References: <20220321191100.1993-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding to describe the fingerprint processor found on Chromebooks
with a fingerprint sensor. Previously we've been describing this with
the google,cros-ec-spi binding but it lacks gpio and regulator control
used during firmware flashing.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
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

