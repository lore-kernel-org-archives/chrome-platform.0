Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5519F1C07
	for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 09:51:40 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id oe18-20020a17090b395200b00236a0d55d3aso4611687pjb.3
        for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 01:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4fVi7HmxcPpWdn3N6vTwqgTV0F5HMpYogidtKQ1pQw=;
        b=nEdFNmWJzn6Q9xlUxWhqBvT69Y8lHI4lKokI2s96szwpyGG+6CuGzqwGglsZpSgRKy
         DxyAIB1tnEQBsiVMLxDIHrixTAyhh5761sWCl3d/ubFuP8Pfo3I6RfNjrEYNYeBosVGl
         Se+8IycDR5zXcM2tqq87BeJYzZMeT+nRbg38U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4fVi7HmxcPpWdn3N6vTwqgTV0F5HMpYogidtKQ1pQw=;
        b=z+unpU/mhRH60cn3G7Th4w81ZfNIr5jHg/sDRJOGYx9uLoh18IY/wMzxd0bT/1MPoA
         GruDI4rf9rWGIO7n1oAWAyWZEiqEg6ULPYYSFR/xyAjRpkocV9Bz8rKVfRxzZJIH3WFn
         LUDxgn9pDm+Z4ZkMgUUeYYQxiE8HWvatVe+Bkg5U+l3asvoPcmLI8rtLEIAN71v2yxJ+
         kK3L/dTPEHoLkhHFk4VF0bCcUdBKuSlSlrZCuthduiHfZC3dhtycsRx4qxRujTBk42Vn
         HQBCghVOv3V1lEpGNkJYShBjHu+TYgiq3yHkHRVNUEDn1iagG4l3CK8l7T/yaNTvGTgH
         X5Rg==
X-Gm-Message-State: AO0yUKWxfPJqVSWaZA6iPtKdxDUsZKAvhznd4sL+3EtTQD9OQ7e/5M2p
	ReBq2XmjNaFHAbt1kkQ0Yum9dQ==
X-Google-Smtp-Source: AK7set9Cq3GKyKWPQU75YWHBmQ7WiE8T/7ZjWs17tOw4kPz+GmxRawlR6jhS9klWWMxegoxMExwMUw==
X-Received: by 2002:a05:6a20:8420:b0:c7:20d8:dc21 with SMTP id c32-20020a056a20842000b000c720d8dc21mr4873634pzd.15.1676973099837;
        Tue, 21 Feb 2023 01:51:39 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:a1f5:f58d:584e:5906])
        by smtp.gmail.com with ESMTPSA id t25-20020a656099000000b004eca54eab50sm3524918pgu.28.2023.02.21.01.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 01:51:39 -0800 (PST)
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Pin-yen Lin <treapking@chromium.org>,
	linux-kernel@vger.kernel.org,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Xin Ji <xji@analogixsemi.com>,
	Lyude Paul <lyude@redhat.com>,
	Allen Chen <allen.chen@ite.com.tw>,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	chrome-platform@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-acpi@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v12 04/10] dt-bindings: display: bridge: anx7625: Add mode-switch support
Date: Tue, 21 Feb 2023 17:50:48 +0800
Message-Id: <20230221095054.1868277-5-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230221095054.1868277-1-treapking@chromium.org>
References: <20230221095054.1868277-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analogix 7625 can be used in systems to switch the DP traffic between
two downstreams, which can be USB Type-C DisplayPort alternate mode
lane or regular DisplayPort output ports.

Update the binding to accommodate this usage by introducing a
data-lanes and a mode-switch property on endpoints.

Also include the link to the product brief in the bindings.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

Changes in v12:
- Removed the 4-lane binding in analogix,anx7625.yaml
- Reworded the description for the mode-switch property

Changes in v11:
- Updated the description of the endpoints
- Referenced video-interfaces.yaml instead for the endpoints

Changes in v10:
- Collected Reviewed-by and Tested-by tags

Changes in v9:
- Collected Reviewed-by tag

Changes in v8:
- Updated anx7625 bindings for data-lane property
- Fixed the subject prefix

Changes in v7:
- Fixed issues reported by dt_binding_check
- Updated the schema and the example dts for data-lanes.
- Changed to generic naming for the example dts node.

Changes in v6:
- Remove switches node and use endpoints and data-lanes property to
  describe the connections.

 .../display/bridge/analogix,anx7625.yaml      | 88 ++++++++++++++++++-
 1 file changed, 85 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 4590186c4a0b..a50de536cffd 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -12,7 +12,8 @@ maintainers:
 
 description: |
   The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
-  designed for portable devices.
+  designed for portable devices. Product brief is available at
+  https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_ProductBrief.pdf
 
 properties:
   compatible:
@@ -112,9 +113,40 @@ properties:
               data-lanes: true
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description:
-          Video port for panel or connector.
+          Video port for panel or connector. Each endpoint connects to a video
+          output downstream, and the "data-lanes" property is used to describe
+          the pin connections. 0, 1, 2, 3 in "data-lanes" maps to SSRX1, SSTX1,
+          SSRX2, SSTX2, respectively.
+
+        patternProperties:
+          "^endpoint@[01]$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            properties:
+              reg: true
+
+              remote-endpoint: true
+
+              data-lanes:
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
+              mode-switch:
+                type: boolean
+                description: Serves as Type-C mode switch if present.
+
+            required:
+              - remote-endpoint
 
     required:
       - port@0
@@ -186,3 +218,53 @@ examples:
             };
         };
     };
+  - |
+    i2c3 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&anx7625_dp_pins>;
+            enable-gpios = <&pio 176 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1100_dpbrdg>;
+            vdd18-supply = <&pp1800_dpbrdg_dx>;
+            vdd33-supply = <&pp3300_dpbrdg_dx>;
+            analogix,audio-enable;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    anx7625_dp_in: endpoint {
+                        bus-type = <7>;
+                        remote-endpoint = <&dpi_out>;
+                    };
+                };
+
+                port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    reg = <1>;
+                    anx_typec0: endpoint@0 {
+                        reg = <0>;
+                        mode-switch;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&typec_port0>;
+                    };
+                    anx_typec1: endpoint@1 {
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
2.39.2.637.g21b0678d19-goog

