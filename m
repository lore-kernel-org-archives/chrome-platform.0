Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B38D23A9
	for <chrome-platform@lists.linux.dev>; Sat,  4 Feb 2023 13:31:35 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 7so5439028pga.1
        for <chrome-platform@lists.linux.dev>; Sat, 04 Feb 2023 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScndThhwtHpV5F0P8Xxb0ofinCCGGRNciaNDDZjg+H0=;
        b=XMXwPJoH3Jms7/I7o0HdRZ4tUuiI4VmyzVUL9oedcnMVzKlm7ozMMe1HWsADEeRwbd
         oC+UHxdLK8yGWyjG6ha5JBruOBKtnWQuF/6JQWuoKG+nVieQxr08s56ut91LsVj2TE05
         qU0HcnTGMmxp+onUUbbVvUqAXMRjZ4An/6UKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScndThhwtHpV5F0P8Xxb0ofinCCGGRNciaNDDZjg+H0=;
        b=TP4zv91CPag+atCsdkrZ4awJWlkFaRTUoGe32GMiifphrr3ngz/ZaDpDjW29mr73p4
         8Bsti6ktvm+NIk1HhN2JXs2LX52rXIc1rkfcw4UqdX35J9KG31tuijyk8WHqx0YkZaMe
         9i4udacZZAuPTu6usRt4tFT4z44cuFZJEPxughRIfMRtTFDOq6ei6ecOtSHWtniMAGbB
         yXiaz2pxy6vc23SPPBUALD9bsy8S0FsBWP6N4hLJsPrrGi4qyY+/bbI+aYTlzDkqy4hC
         /Khfo+sxX4cwdVi1+lM1q6hbcOU5UcyP/BUjjReKJ9x6k2rZP8JAy98m+Lpps+ws9qX6
         HWUw==
X-Gm-Message-State: AO0yUKWOBiluMZEAhcD4RPMJyBVx4G5JXOdt9mmpdVOT+u7y25Y6+wb8
	YGlc9ChB9dVeKvG4xl2ahZ0g9w==
X-Google-Smtp-Source: AK7set/zF6HqbNPS6IKmws2CM6dRhPc7IBJbyhe+r7yBH+N3hD5Manh9iXqhdIuaKdhLNAEUJTOGUA==
X-Received: by 2002:a62:388f:0:b0:590:74f1:8c8a with SMTP id f137-20020a62388f000000b0059074f18c8amr12515095pfa.15.1675517495112;
        Sat, 04 Feb 2023 05:31:35 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:c1ad:2bdc:7b5a:72e3])
        by smtp.gmail.com with ESMTPSA id 144-20020a621596000000b00593ce7ebbaasm3655639pfv.184.2023.02.04.05.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 05:31:34 -0800 (PST)
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
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Allen Chen <allen.chen@ite.com.tw>,
	Lyude Paul <lyude@redhat.com>,
	linux-acpi@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	Xin Ji <xji@analogixsemi.com>,
	Stephen Boyd <swboyd@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v11 7/9] dt-bindings: display: bridge: it6505: Add mode-switch support
Date: Sat,  4 Feb 2023 21:30:38 +0800
Message-Id: <20230204133040.1236799-8-treapking@chromium.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230204133040.1236799-1-treapking@chromium.org>
References: <20230204133040.1236799-1-treapking@chromium.org>
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

Changes in v11:
- Updated the description of the endpoints in the bindings
- Referenced video-interfaces.yaml instead for the endpoints binding
- Removed duplicated definitions from inherited schema

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

 .../bindings/display/bridge/ite,it6505.yaml   | 101 +++++++++++++++---
 1 file changed, 88 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index b16a9d9127dd..8ae9c5cba22c 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -75,22 +75,49 @@ properties:
       port@1:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: Video port for DP output
+        description:
+          Video port for DP output. Each endpoint connects to a video output
+          downstream, and the "data-lanes" property is used to describe the pin
+          connections. 0, 1, 2, 3 in "data-lanes" maps to TX0, TX1, TX2, TX3,
+          respectively.
 
-        properties:
-          endpoint:
-            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+
+        patternProperties:
+          "^endpoint@[01]$":
+            $ref: /schemas/media/video-interfaces.yaml#
             unevaluatedProperties: false
 
             properties:
+              reg: true
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
@@ -102,7 +129,6 @@ required:
   - pwr18-supply
   - interrupts
   - reset-gpios
-  - extcon
   - ports
 
 additionalProperties: false
@@ -139,8 +165,11 @@ examples:
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
@@ -148,3 +177,49 @@ examples:
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
2.39.1.519.gcb327c4b5f-goog

