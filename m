Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACB023AE
	for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 10:21:27 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id 4so1132209pli.0
        for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 02:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9KcK1J3it0ftVBy4iMTAiutJ0HoDn4vV6l4PCThFvs=;
        b=EcrwUdGALRkhCF6+jeFlkUBLXIIWyUjpF4rTujN1HxPt2yoZ7bvcgpfN4ZwRsrq2M0
         ySDGRxTUTbLvGC/Sp+B/GHjpyxsqQj/pVTPgwu4fMEuINxqsrxM2OrlP7AbgmQqvP4SW
         MDTgPw1Wfh+96fRcWBl7io3b6fkJXmpeHm+/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9KcK1J3it0ftVBy4iMTAiutJ0HoDn4vV6l4PCThFvs=;
        b=aI8JoY5T2Ox3Wh/KeDQipfSAYpp2O9YCM3oleoaLLMoYfMgQHAn4oFjT3Dd3tmGj6k
         s9V9qdUSa75IVyywG+bJS3nxxlhH4Q7c1ezoDMoFLdeetR+e6AMl1bInXSiZ52NLp+I6
         8jmv55kmuYXCUVesW7UWsuhyZ7usFkcD8Dws4QWXA/rUjsofhnNV9KTPdGFk4Q3+xD0o
         4hNC6rmFiwNMHTencYnQN3aXvDcj/P8cusBt+wyOx/90nOZMA/x9v90r7slKzVDrE3HW
         TU+E21eZ9nwktMGYBaFKGfrtMbKQOSN4wFWFxa1RRwrPIS9KCYN+g8PMkEcG1ijmkAyc
         1QWw==
X-Gm-Message-State: ANoB5pmwJPkJ/oYrqfa9roOHxP3P0+4uC8GS9PCY/2P123tYqHJmW/fp
	78g6imkFx6lRXVxXXpHx3yL9bw==
X-Google-Smtp-Source: AA0mqf46GQ5ufhbsGjVkzHAuwHzwpntLipYUVoKE+qWJzofRfTXK5R5FNxhQAwt7WLq+0sY+rWaWLg==
X-Received: by 2002:a17:902:e492:b0:186:5f71:7939 with SMTP id i18-20020a170902e49200b001865f717939mr15675016ple.162.1669285286917;
        Thu, 24 Nov 2022 02:21:26 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:d446:708:8556:dfee])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b005747b59fc54sm854584pfb.172.2022.11.24.02.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 02:21:26 -0800 (PST)
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
Subject: [PATCH v6 3/7] dt-bindings: drm/bridge: anx7625: Add mode-switch support
Date: Thu, 24 Nov 2022 18:20:52 +0800
Message-Id: <20221124102056.393220-4-treapking@chromium.org>
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

Analogix 7625 can be used in systems to switch the DP traffic between
two downstreams, which can be USB Type-C DisplayPort alternate mode
lane or regular DisplayPort output ports.

Update the binding to accommodate this usage by introducing a
data-lanes and a mode-switch property on endpoints.

Also include the link to the product brief in the bindings.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v6:
- Remove switches node and use endpoints and data-lanes property to
  describe the connections.

 .../display/bridge/analogix,anx7625.yaml      | 73 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 4590186c4a0b..5fdbf1f3bab8 100644
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
@@ -112,10 +113,36 @@ properties:
               data-lanes: true
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/properties/port-base
         description:
           Video port for panel or connector.
 
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
+            required:
+              - reg
+              - remote-endpoint
+
     required:
       - port@0
       - port@1
@@ -186,3 +213,45 @@ examples:
             };
         };
     };
+  - |
+    &i2c3 {
+	anx_bridge_dp: anx7625-dp@58 {
+	    compatible = "analogix,anx7625";
+	    reg = <0x58>;
+	    pinctrl-names = "default";
+	    pinctrl-0 = <&anx7625_dp_pins>;
+	    enable-gpios = <&pio 176 GPIO_ACTIVE_HIGH>;
+	    reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
+	    vdd10-supply = <&pp1100_dpbrdg>;
+	    vdd18-supply = <&pp1800_dpbrdg_dx>;
+	    vdd33-supply = <&pp3300_dpbrdg_dx>;
+	    analogix,audio-enable;
+
+	    ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+		    reg = <0>;
+		    anx7625_dp_in: endpoint {
+			bus-type = <7>;
+			remote-endpoint = <&dpi_out>;
+		    };
+		};
+
+		port@1 {
+		    reg = <1>;
+		    anx_typec0: endpoint@0 {
+			mode-switch;
+			data-lanes = <0 1>;
+			remote-endpoint = <&typec_port0>;
+		    };
+		    anx_typec1: endpoint@1 {
+			mode-switch;
+			data-lanes = <2 3>;
+			remote-endpoint = <&typec_port1>;
+		    };
+		};
+	    };
+	};
+    };
-- 
2.38.1.584.g0f3c55d4c2-goog

