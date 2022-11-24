Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE13623AE
	for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 10:21:45 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d20so1087273plr.10
        for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 02:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nI+gZT0pcePdydFoBeIT1UIcJJFwcuKGSk5zJ0RL4tU=;
        b=h0Y+v3WtWtEa8b3ysBdsgKHNq8g5LNo8YXyeBfLFNKlHmk2xzqlJdZf8/dacjprErY
         tqXVFAUTRiP5vbsey1w3Bn7mDO1Aj5qfei74MJMrTMNQGNjyKJFzy0/VEY2MFVV/zBrN
         g0H+3UT1NOjdvCDGiisvDtceQxOMvoHjs9rpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nI+gZT0pcePdydFoBeIT1UIcJJFwcuKGSk5zJ0RL4tU=;
        b=bs25UivP871OS4DykkKZVlz+AqG5Dr01UmuRUCdPBRuvyMBYTPFv7Zj15vGER6sYYk
         dkEbxqwLlydjWqGdyyBEprbLMhc5apRXQx7ab4yq9ELCk7yF5oRuwCf7c7J53JGj6vqP
         wIjpqsfK4VsEXrxsHSXPDjv41gXf1w3S/vyNNMAlQAXQ7cOCYJON4y5O/lhI4sUPCvA7
         iUAMjvv5xCN7FJAMPWKNDChleiYYhebuQx8PdeZhJWqOz/Q9Hayz5r2gO3HQPJ9B6gEg
         vXX3Fo59ZTxTZweu+ME2Mz29IoRAT90/DFd5wyL9v0xsXfANREWqfFiLkgHfz0v0KhZH
         PAjg==
X-Gm-Message-State: ANoB5pkKDLXgIejcTXVjtbAaZ6BKMKWOglzBS6XkUvoloqw3re197n3N
	3FMPEWTCvtRhERFCpmI+zlYQEA==
X-Google-Smtp-Source: AA0mqf7hh4W9Fkbv8iFQguyRhGwjrTAFkMKQsz1viXpfZVWTjFkqR6ffAp9vqXowTDad2gm63u4YVA==
X-Received: by 2002:a17:902:b613:b0:181:9900:18df with SMTP id b19-20020a170902b61300b00181990018dfmr13219005pls.70.1669285305357;
        Thu, 24 Nov 2022 02:21:45 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:d446:708:8556:dfee])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b005747b59fc54sm854584pfb.172.2022.11.24.02.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 02:21:44 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Stephen Boyd <swboyd@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	Marek Vasut <marex@denx.de>,
	Xin Ji <xji@analogixsemi.com>,
	Lyude Paul <lyude@redhat.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Allen Chen <allen.chen@ite.com.tw>
Subject: [PATCH v6 6/7] dt/bindings: drm/bridge: it6505: Add mode-switch support
Date: Thu, 24 Nov 2022 18:20:55 +0800
Message-Id: <20221124102056.393220-7-treapking@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221124102056.393220-1-treapking@chromium.org>
References: <20221124102056.393220-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ITE IT6505 can be used in systems to switch the DP traffic between
two downstreams, which can be USB Type-C DisplayPort alternate mode
lane or regular DisplayPort output ports.

Update the binding to accommodate this usage by introducing a
data-lanes and a mode-switch property on endpoints.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v6:
- Remove switches node and use endpoints and data-lanes property to
  describe the connections.

 .../bindings/display/bridge/ite,it6505.yaml   | 94 ++++++++++++++++++-
 1 file changed, 90 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index 833d11b2303a..b4b9881c7759 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -52,9 +52,53 @@ properties:
     maxItems: 1
     description: extcon specifier for the Power Delivery
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: A port node pointing to DPI host port node
+  data-lanes:
+    maxItems: 1
+    description: restrict the dp output data-lanes with value of 1-4
+
+  max-pixel-clock-khz:
+    maxItems: 1
+    description: restrict max pixel clock
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: A port node pointing to DPI host port node
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port-base
+        description:
+          Video port for panel or connector.
+
+        patternProperties:
+          "^endpoint@[01]$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            type: object
+            unevaluatedProperties: false
+
+            properties:
+              reg:
+                maxItems: 1
+
+              remote-endpoint: true
+
+              data-lanes:
+                minItems: 1
+                uniqueItems: true
+                items:
+                  - enum: [ 0, 1, 2, 3]
+
+              mode-switch:
+                type: boolean
+                description: Register this node as a Type-C mode switch or not.
+
+	    required:
+        - reg
+	      - remote-endpoint
 
 required:
   - compatible
@@ -62,7 +106,7 @@ required:
   - pwr18-supply
   - interrupts
   - reset-gpios
-  - extcon
+  - ports
 
 additionalProperties: false
 
@@ -92,3 +136,45 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    &i2c3 {
+        clock-frequency = <100000>;
+
+        it6505dptx: it6505dptx@5c {
+            compatible = "ite,it6505";
+            interrupts = <8 IRQ_TYPE_LEVEL_LOW 8 0>;
+            reg = <0x5c>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&it6505_pins>;
+            ovdd-supply = <&mt6366_vsim2_reg>;
+            pwr18-supply = <&pp1800_dpbrdg_dx>;
+            reset-gpios = <&pio 177 0>;
+            hpd-gpios = <&pio 10 0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    it6505_in: endpoint {
+                        remote-endpoint = <&dpi_out>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    ite_typec0: endpoint@0 {
+                        mode-switch;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&typec_port0>;
+                    };
+                    ite_typec1: endpoint@1 {
+                        mode-switch;
+                        data-lanes = <2 3>;
+                        remote-endpoint = <&typec_port1>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.38.1.584.g0f3c55d4c2-goog

