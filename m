Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A5B1FBB
	for <chrome-platform@lists.linux.dev>; Sat, 18 Feb 2023 11:17:45 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id y12so229436pgu.2
        for <chrome-platform@lists.linux.dev>; Sat, 18 Feb 2023 03:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrZswIO3s0BfCLiWcvjWhA4ILZgxpyay+bftO3KZDHg=;
        b=ba9IojY/CUj+zzZ/UQHSrVd/cwQfpf6fCIPaEsCNLLepX6wnF3HgOqg3YWXfV31SSH
         Dgpb2oe2njMUAn8gHjEYk3ypaIoyjbybV16Brug2JRVblYSygzOi/VLJB0juzLK3bYkY
         4Rbyeuq8O58WHOcm7PAIUhanqDM4bO0ozTQtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrZswIO3s0BfCLiWcvjWhA4ILZgxpyay+bftO3KZDHg=;
        b=RRhNyRn1DLclKxB3g7WGh9U04o2BjPS0JvanyzmQ1Df1XYtbOXgKKDmtLn+gF2el+T
         O4MjfhHVnCq/lV11cAd70CIBoDwHaQpizeDl3V6uMNou5dAm8EZGuSqEhvyJepresHgp
         0BgT/PANMBQcWPXGdz61muN4Li/M65c9dmEyPLU2tWc5NTfFsOom3To3VbI7fiwJrCE0
         KpaXGIAH5mtXwBDYR3W32vy01PizwEGn254nVorvDrjwa4TOeAAfW+J8YOqNDbJkuB2y
         qhnRkJKD5QgduoE8u+g7oAu0FuatamgoKuKv0rJyaWGi5xjoh9U3e5VVkUENRzuVfFZ1
         dMkg==
X-Gm-Message-State: AO0yUKWRz6irfnKAFt7mgXn6XI0t72xmtftlKpgJMaTHYJS5PA8ehUnS
	+AV79eum1/LgUPcXPySwlfeIvg==
X-Google-Smtp-Source: AK7set/2EtDLkb5CN95kCgHnoYzFvMY65qtuHhNEFZiMAKbzehZIhs0gSwBpIhugJj7RooT5OoFOTQ==
X-Received: by 2002:aa7:9402:0:b0:5a8:aae8:1160 with SMTP id x2-20020aa79402000000b005a8aae81160mr3998360pfo.20.1676719065217;
        Sat, 18 Feb 2023 03:17:45 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:88dd:be84:8f65:fec2])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79157000000b005a8686b72fcsm4457829pfi.75.2023.02.18.03.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 03:17:44 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Benson Leung <bleung@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	devicetree@vger.kernel.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 4/5] dt-bindings: display: bridge: Add GPIO display mux binding
Date: Sat, 18 Feb 2023 19:17:11 +0800
Message-Id: <20230218111712.2380225-5-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230218111712.2380225-1-treapking@chromium.org>
References: <20230218111712.2380225-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Boichat <drinkcat@chromium.org>

Add bindings for Generic GPIO mux driver.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---
Rob mentioned that this series can probably use the common MUX bindings.
Those bindings are designed for MUX consumers that requests a certain
MUX configuration, while this driver is reading a GPIO pin controlled
by the other parts of the system (in our use case, it's the embedded
controller firmware).

Changes in v3:
- Removed ddc-i2c-bus in the bindings

Changes in v2:
- Referenced existing dt-binding schemas from graph.yaml
- Added ddc-i2c-bus into the bindings

 .../bindings/display/bridge/gpio-mux.yaml     | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
new file mode 100644
index 000000000000..e6b82ea2f45c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic display mux (1 input, 2 outputs)
+
+maintainers:
+  - Nicolas Boichat <drinkcat@chromium.org>
+
+description: |
+  This bindings describes a simple display (e.g. HDMI) mux, that has 1
+  input, and 2 outputs. The mux status is controlled by hardware, and
+  its status is read back using a GPIO.
+
+properties:
+  compatible:
+    const: gpio-display-mux
+
+  detect-gpios:
+    maxItems: 1
+    description: GPIO that indicates the active output
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          Video port for input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: |
+          2 video ports for output.
+          The reg value in the endpoints matches the GPIO status: when
+          GPIO is asserted, endpoint with reg value <1> is selected.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - detect-gpios
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    hdmi_mux: hdmi_mux {
+      compatible = "gpio-display-mux";
+      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&hdmi_mux_pins>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 { /* input */
+          reg = <0>;
+
+          hdmi_mux_in: endpoint {
+            remote-endpoint = <&hdmi0_out>;
+          };
+        };
+
+        port@1 { /* output */
+          reg = <1>;
+
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          hdmi_mux_out_anx: endpoint@0 {
+            reg = <0>;
+            remote-endpoint = <&dp_bridge_in>;
+          };
+
+          hdmi_mux_out_hdmi: endpoint@1 {
+            reg = <1>;
+            remote-endpoint = <&hdmi_connector_in>;
+          };
+        };
+      };
+    };
-- 
2.39.2.637.g21b0678d19-goog

