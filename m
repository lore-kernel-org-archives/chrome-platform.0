Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945D11FBB
	for <chrome-platform@lists.linux.dev>; Sat, 18 Feb 2023 11:17:34 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id gt5-20020a17090af2c500b00233d7314c1cso515476pjb.5
        for <chrome-platform@lists.linux.dev>; Sat, 18 Feb 2023 03:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6dHGa2Xgzvsmpkv1OMI3GGLXSZg9rQflTYWwQPQ1MY=;
        b=JY77n9tlE/HK4ICl9GMTuT3xOecSN1t2rBwKN2r6bw9DpB3ugVZniqFJmEP/ZS6pdn
         FZrSdrEN79gLPWOMUK+L66wCzzs3r3Q8uln5PXzclN7b87DKiNVjqYU3DiNx/XLz0qPb
         Of7YZ4EvDZl+ErstHa8fMnpIbvTchMOkO2RII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6dHGa2Xgzvsmpkv1OMI3GGLXSZg9rQflTYWwQPQ1MY=;
        b=c+1R5fPClbNfXm+ztbSKt4xCdblG9+w3cUoCxhtYJBsONUFc4Zwto2nz5sCwh3o80+
         RgduVn6edQohp6x1k3wxcXXEcH6iHOzH2OnviWhzOj/1reLeq0Bi0gPK8e1tGVsFonI/
         zVod2xLi/VpjIcELfv/3zQne16rI0RGCpxns0zmteV4xpwHA5vsF32F2R65S3BXQxYtk
         6ZtI1wxvYrV2t0hFO63VRFveSZJJ8ICaekxvzuT2doCvXWHAOQvuinAeb/sPaz1kBnZu
         TJYEU3y50if7XCoR0BrX+8qEswzKnNy0fE7kTt8RnZMDn1mIwASDkaFCmn7PFKaxbZi/
         m/OA==
X-Gm-Message-State: AO0yUKXiHzREC7l2Y0pvo1n3k9DOR9moXBjqTiWAh5Q9m1Cw0GJHJZ+P
	CjgGdwEFshGeye2t76OcYPvqdW+xhVAbeAKZ
X-Google-Smtp-Source: AK7set/hFbuR6/pwEBTsgMDjBxXuhNwX/DV7X+3lXNMmHiMnzFAlbjwwtNwH3GYu9AIwOZM3LSHFcw==
X-Received: by 2002:a05:6a20:4e27:b0:c6:858d:81b7 with SMTP id gk39-20020a056a204e2700b000c6858d81b7mr3115816pzb.25.1676719054085;
        Sat, 18 Feb 2023 03:17:34 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:88dd:be84:8f65:fec2])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79157000000b005a8686b72fcsm4457829pfi.75.2023.02.18.03.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 03:17:33 -0800 (PST)
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
Subject: [PATCH v3 2/5] drm/bridge: Add .get_edid callback for anx7688 driver
Date: Sat, 18 Feb 2023 19:17:09 +0800
Message-Id: <20230218111712.2380225-3-treapking@chromium.org>
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

Allow the driver to read EDID when ddc-i2c-bus phandle is present in
the device node.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v3:
- New in v3

 drivers/gpu/drm/bridge/cros-ec-anx7688.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
index fa91bdeddef0..a16294c87940 100644
--- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
+++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
@@ -6,6 +6,7 @@
  */
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -91,14 +92,24 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
 	return totalbw >= requiredbw;
 }
 
+static struct edid *cros_ec_anx7688_get_edid(struct drm_bridge *bridge,
+					     struct drm_connector *connector)
+{
+	struct cros_ec_anx7688 *anx7688 = bridge_to_cros_ec_anx7688(bridge);
+
+	return drm_get_edid(connector, anx7688->bridge.ddc);
+}
+
 static const struct drm_bridge_funcs cros_ec_anx7688_bridge_funcs = {
 	.mode_fixup = cros_ec_anx7688_bridge_mode_fixup,
+	.get_edid = cros_ec_anx7688_get_edid,
 };
 
 static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct cros_ec_anx7688 *anx7688;
+	struct device_node *phandle;
 	u16 vendor, device, fw_version;
 	u8 buffer[4];
 	int ret;
@@ -153,6 +164,19 @@ static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
 		DRM_WARN("Old ANX7688 FW version (0x%04x), not filtering\n",
 			 fw_version);
 
+
+	phandle = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
+	if (phandle) {
+		anx7688->bridge.ddc = of_get_i2c_adapter_by_node(phandle);
+		of_node_put(phandle);
+		if (!anx7688->bridge.ddc)
+			return -EPROBE_DEFER;
+	} else {
+		dev_dbg(dev, "No I2C bus specified, disabling EDID readout\n");
+	}
+	if (anx7688->bridge.ddc)
+		anx7688->bridge.ops |= DRM_BRIDGE_OP_EDID;
+
 	anx7688->bridge.funcs = &cros_ec_anx7688_bridge_funcs;
 	drm_bridge_add(&anx7688->bridge);
 
-- 
2.39.2.637.g21b0678d19-goog

