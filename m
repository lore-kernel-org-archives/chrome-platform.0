Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9351A2571
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 08:41:52 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id c6so8766315pls.4
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 00:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuBntEAB46uq9NIQO1VAT8l/nJZs8T0gBPKThJWSv7I=;
        b=iUYEpsOFVpkwHqzDy/fjVHkDanLyXPOt1Soq2FK2phFPaJrYQ0ebAJ/74WqZeulXKz
         byRYe1O+kkr1hb6NxOsEdX9FRk98PV0Fd1Dji04sHauxJwEDbAut7R+pf2Hhw536LOO5
         AOieK5jiddKIvazneu/HxDk5eAY+YX+rdPQxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuBntEAB46uq9NIQO1VAT8l/nJZs8T0gBPKThJWSv7I=;
        b=27dMSllCApNeBmkqTc4trfBDO+W0HtCw2/cOtMJ4f3n0zF8zh2RtrsydWXuNz9qPTI
         AEvzz90FRfHeDe2jO1aOEiSaRgggF6IXlplj/p8rI6LcDF7jAZfGXnMB8Hx1x2LsNZdw
         qNtlP8aKUgIAxnLHQzMap+t5jU2/EmYkaS1czYXbAMHCs34AWTLt1yhjGeZfuXb4zs+S
         iI9oJCmoeLi5KRpwJ+g4Jmr2mIFQr8IDdnaCJkwCy6+z53B82h3OqZZ5kVBhN3/bWf4w
         1nVoa1B2CYKPzl4uTy3TM3s6hjrvi09FJgTVieGyH4pYboOFymNc42H/utHtkkzI3b+C
         1tqg==
X-Gm-Message-State: AFqh2kqkmlQdpzdbpnWvbMfrtfcLVq25DpdptlpnwWPYcG64TlS+KkCy
	1+dPql6CHbYadomvrvYjDkOEDQ==
X-Google-Smtp-Source: AMrXdXsHun6pTGfxbeEaDv1ucxGxQtC9/wu6SrP2pEl4cbUx1LLbkOcZWjTR0FAysNpsioOME3E5/g==
X-Received: by 2002:a17:902:8208:b0:193:10b9:8fc3 with SMTP id x8-20020a170902820800b0019310b98fc3mr10463870pln.30.1673253712088;
        Mon, 09 Jan 2023 00:41:52 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:801:a736:715:9a15])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902d48e00b00186acb14c4asm5568119plg.67.2023.01.09.00.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 00:41:51 -0800 (PST)
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
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <swboyd@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Xin Ji <xji@analogixsemi.com>,
	linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Allen Chen <allen.chen@ite.com.tw>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 7/9] dt-bindings: display: bridge: it6505: Add mode-switch support
Date: Mon,  9 Jan 2023 16:40:59 +0800
Message-Id: <20230109084101.265664-8-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230109084101.265664-1-treapking@chromium.org>
References: <20230109084101.265664-1-treapking@chromium.org>
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

Changes in v9:
- Fixed subject prefix again
- Changed the naming of the example node for it6505

Changes in v8:
- Updated bindings for data-lanes property
- Fixed subject prefix

Changes in v7:
- Fixed issues reported by dt_binding_check.
- Updated the schema and the example dts for data-lanes.
- Changed to generic naming for the example dts node.

Changes in v6:
- Remove switches node and use endpoints and data-lanes property to
  describe the connections.

 .../bindings/display/bridge/ite,it6505.yaml   | 93 ++++++++++++++++---
 1 file changed, 82 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index b16a9d9127dd..94182f131f86 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -77,20 +77,43 @@ properties:
         unevaluatedProperties: false
         description: Video port for DP output
 
-        properties:
-          endpoint:
+        patternProperties:
+          "^endpoint@[01]$":
             $ref: /schemas/graph.yaml#/$defs/endpoint-base
             unevaluatedProperties: false
 
             properties:
+              reg:
+                maxItems: 1
+
+              remote-endpoint: true
+
               data-lanes:
-                minItems: 1
-                uniqueItems: true
-                items:
-                  - enum: [ 0, 1 ]
-                  - const: 1
-                  - const: 2
-                  - const: 3
+                oneOf:
+                  - items:
+                      - enum: [0, 1, 2, 3]
+
+                  - items:
+                      - const: 0
+                      - const: 1
+
+                  - items:
+                      - const: 2
+                      - const: 3
+
+                  - items:
+                      - const: 0
+                      - const: 1
+                      - const: 2
+                      - const: 3
+
+              mode-switch:
+                type: boolean
+                description: Register this node as a Type-C mode switch or not.
+
+            required:
+              - reg
+              - remote-endpoint
 
     required:
       - port@0
@@ -102,7 +125,6 @@ required:
   - pwr18-supply
   - interrupts
   - reset-gpios
-  - extcon
   - ports
 
 additionalProperties: false
@@ -139,8 +161,11 @@ examples:
                 };
 
                 port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
                     reg = <1>;
-                    it6505_out: endpoint {
+                    it6505_out: endpoint@0 {
+                        reg = <0>;
                         remote-endpoint = <&dp_in>;
                         data-lanes = <0 1>;
                     };
@@ -148,3 +173,49 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dp-bridge@5c {
+            compatible = "ite,it6505";
+            interrupts = <8 IRQ_TYPE_LEVEL_LOW 8 0>;
+            reg = <0x5c>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&it6505_pins>;
+            ovdd-supply = <&mt6366_vsim2_reg>;
+            pwr18-supply = <&pp1800_dpbrdg_dx>;
+            reset-gpios = <&pio 177 0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    it6505_dpi_in: endpoint {
+                        remote-endpoint = <&dpi_out>;
+                    };
+                };
+                port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <1>;
+                    ite_typec0: endpoint@0 {
+                        reg = <0>;
+                        mode-switch;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&typec_port0>;
+                    };
+                    ite_typec1: endpoint@1 {
+                        reg = <1>;
+                        mode-switch;
+                        data-lanes = <2 3>;
+                        remote-endpoint = <&typec_port1>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.39.0.314.g84b9a713c41-goog

