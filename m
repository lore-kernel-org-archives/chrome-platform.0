Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EBC1FBB
	for <chrome-platform@lists.linux.dev>; Sat, 18 Feb 2023 11:17:30 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id a20so757093pls.2
        for <chrome-platform@lists.linux.dev>; Sat, 18 Feb 2023 03:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRUarQyWTXy/UaQ+aTCiS9aEshqx6SrntwaJME4vnY0=;
        b=FhaH7iwlgirzBhkctvbPIaE33nUBelcGHAF8fq0lsjOkQ+cusRFz/4cccjVw6NEftK
         PpoX0TZ8w3vqQVGe5P/lYxblKHcsFlSVpBKNCV54TFjvgawSpSzJc1EE02sPm2cIp82b
         392DVfxuznUnL2wiI4prL2FfCxja2ElN7chAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRUarQyWTXy/UaQ+aTCiS9aEshqx6SrntwaJME4vnY0=;
        b=fcpUidAs6ZnijVBaca7iV4l2J9/7nd9swUMN+vq/qGfxyZg10P1rlAVtIh7SGRkJyQ
         mWG7QGvo+rBt/vD4FEs+0VdljddO8sKuXeD/vSPVvnofjbuX6E1+V/ydwtwrQ2tR7yMN
         U5KBXzRiRyoPgSUPTbjGAILady+PWDZ7BVKqYxdN4ZemgFJ4swxliurIM67mRXFOH6hl
         jaRvPyz7Ysmv/LDUFNPHwPD8REVYhc4xBechH3LmhzVit2rh/zqU0BogDVx7SYg4Hg9U
         Kulu9MZphtb1tcjN6MevEQ6LMnfCVlyfavqgxJP0zU+qXwW3Pq7zF3feo7gliid1Ww/+
         XwbQ==
X-Gm-Message-State: AO0yUKW6p7RjKV7dG9RphsLD13JRhsfHJdPyMoOvOmVNR8FttH1W7d6v
	5M/q9fsDaok/Bfu5ymeso6UQ3w==
X-Google-Smtp-Source: AK7set+FohWYixBOFWTvodfYG9ONEn4rCbUp2cY1CE91qYHZ6E0/D4C1ES2aYaY6oImj8VUL+8mG8A==
X-Received: by 2002:a05:6a20:1610:b0:c7:5983:7a82 with SMTP id l16-20020a056a20161000b000c759837a82mr7002881pzj.27.1676719049830;
        Sat, 18 Feb 2023 03:17:29 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:88dd:be84:8f65:fec2])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79157000000b005a8686b72fcsm4457829pfi.75.2023.02.18.03.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 03:17:29 -0800 (PST)
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
Subject: [PATCH v3 1/5] dt-bindings: display: bridge: Add ddc-i2c-bus for anx7688
Date: Sat, 18 Feb 2023 19:17:08 +0800
Message-Id: <20230218111712.2380225-2-treapking@chromium.org>
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

Introduce a optional "ddc-i2c-bus" property for anx7688 bridge. This
allows the bridge to register a .get_edid callback.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v3:
- New in v3

 .../bindings/display/bridge/google,cros-ec-anx7688.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
index a44d025d33bd..9d5ce8172e88 100644
--- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
@@ -25,6 +25,10 @@ properties:
     maxItems: 1
     description: I2C address of the device.
 
+  ddc-i2c-bus:
+    description: phandle link to the I2C controller used for DDC EDID probing
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -59,6 +63,7 @@ examples:
         anx7688: anx7688@2c {
             compatible = "google,cros-ec-anx7688";
             reg = <0x2c>;
+            ddc-i2c-bus = <&hdmiddc0>;
 
             ports {
                 #address-cells = <1>;
-- 
2.39.2.637.g21b0678d19-goog

