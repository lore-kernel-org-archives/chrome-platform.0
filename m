Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436651842
	for <chrome-platform@lists.linux.dev>; Sat,  7 Jan 2023 10:23:06 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so4338409pjj.4
        for <chrome-platform@lists.linux.dev>; Sat, 07 Jan 2023 02:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3S5t/68Sc4/I3QhgTzdc3biXkZb8n4w5hwbgjthP5iA=;
        b=iRDvM88FA/v/BgsXln4muPJMcNVgdMt2+8Kg9RtozhyMdRWwKSSWBqPqgQFxojRAWu
         9edeyIyZKf94BdFBPe07/d1y5jxZJLv8IA0RZE/ozZ4zq+I35DuN3tkQvvPOdYZCmcY4
         hTuIlwnvgpUSCcIttro3VORJ0AIjBXWA8YQhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S5t/68Sc4/I3QhgTzdc3biXkZb8n4w5hwbgjthP5iA=;
        b=QSxAbVA+YgEOH2CevY6VQoLYa3bsM1Z+K5SEzrdQwCH51eHuLxpL5S2YTmYMk0mNlB
         lOk6J6AsMwzBywpcPq8NKF/lpnFccv6au0AMkNkqd9BTNg05c4Gv2srM37kABJ6UXiuW
         x0LNokDt2kNmGA2traG5QMr+Vo+SLYehFxLPD787uRASGYaRhw3D0Gio1pZMiXoAmmjY
         Lw6tiZzdXDkyxJF3dCrcbaXjlKqwLTmDU7Zz9udsZ08W8a399olwDEv3ep4v1FcfnS1x
         AE3e1JfXyrrP5+CMutxu975gsaFbQjMy43m5nBaUTEL8dS94xBwBS4ipZfMKeI2135Sm
         JVDw==
X-Gm-Message-State: AFqh2krn0glOVDDFx3SLKmLko+vql/+zuq4FanOQLqNEEzRhfbf8L/Ei
	UCNHJqKrHyNiKoFpGxnRV4JyEA==
X-Google-Smtp-Source: AMrXdXvAkDEaLIlYWujupZOqV82RJZ1RupyZAwcJ+M/u56ufJGv/dKJrl7hd4Fz5TmGm20rZuFDgXA==
X-Received: by 2002:a05:6a20:13a0:b0:9d:efbe:a0f5 with SMTP id w32-20020a056a2013a000b0009defbea0f5mr92391220pzh.5.1673086985804;
        Sat, 07 Jan 2023 02:23:05 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:180d:95e8:f4:84fb])
        by smtp.gmail.com with ESMTPSA id b1-20020a170903228100b001892af9472esm2366362plh.261.2023.01.07.02.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 02:23:05 -0800 (PST)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-kernel@vger.kernel.org,
	Xin Ji <xji@analogixsemi.com>,
	Pin-yen Lin <treapking@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen Chen <allen.chen@ite.com.tw>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	devicetree@vger.kernel.org,
	Marek Vasut <marex@denx.de>,
	linux-acpi@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v8 4/9] dt-bindings: display: bridge: anx7625: Add mode-switch support
Date: Sat,  7 Jan 2023 18:22:26 +0800
Message-Id: <20230107102231.23682-5-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230107102231.23682-1-treapking@chromium.org>
References: <20230107102231.23682-1-treapking@chromium.org>
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

---

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

 .../display/bridge/analogix,anx7625.yaml      | 99 ++++++++++++++++++-
 1 file changed, 96 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 4590186c4a0b..b49a350c40e3 100644
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
@@ -112,10 +113,48 @@ properties:
               data-lanes: true
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description:
           Video port for panel or connector.
 
+        patternProperties:
+          "^endpoint@[01]$":
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              reg:
+                maxItems: 1
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
+
     required:
       - port@0
       - port@1
@@ -164,8 +203,12 @@ examples:
                 };
 
                 mipi2dp_bridge_out: port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
                     reg = <1>;
-                    anx7625_out: endpoint {
+                    anx7625_out: endpoint@0 {
+                        reg = <0>;
                         remote-endpoint = <&panel_in>;
                     };
                 };
@@ -186,3 +229,53 @@ examples:
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
2.39.0.314.g84b9a713c41-goog

