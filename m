Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6862571
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 08:41:40 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id b9-20020a17090a7ac900b00226ef160dcaso6917743pjl.2
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 00:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C65HbTqm4aoCrwDl2BLz1roa80SXzNKa5x0ufot4CrI=;
        b=kwl6+6yNvmPlViyGA6MWyvEgFFpOn9l6Nlq4UwNmIoOAW/tQ1PUl3kldt28HENt/hv
         K8LSxwF+YxZ+5qLVbgwM7KPc0xLVNZotnK6YLa2G8XMn7DseLbTmvOAdJrBWIllrPZP8
         P2bdx7qO8wYfxT4hoCXs/0pUlVRoM1vyLOEO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C65HbTqm4aoCrwDl2BLz1roa80SXzNKa5x0ufot4CrI=;
        b=eZYdP1cLu1Ft243W/bSFoom4w/OiNNXNUYTPQtSYe+zjx5fN1hTYLh8Or5zxiEDzJa
         o8exZ4GiKbXaC/b4b+LbwzJ34enxzT44/T+x0AG+pEgqb3EJnhyygq9hdLLm2wWQrdJu
         EG6x3KmyvyamXDDbTYisOZNih2XEW0PiebIMhednxzwgdE41/zxFUpPQP2+I5q/VQ0bg
         tdeKpPiQnns2TR8lwKvFYK0C+VIUxGN7mxQb9l9qdHhYABhUnXxEYoBVs1pSIEU/bhhZ
         cyHRTH6/k051eMlJ/xep1OVZEmA/OUKBASkTqp5wktvj4QU0A3VjRenT4+kiVJs5YNz+
         uQUg==
X-Gm-Message-State: AFqh2kqntiDD70OceuhoervdbvtGUS+Z+p8HNykVZFc8IHiRvb1hcv/T
	GTHvmsyZPWTv8B/glv+iHpH4RQ==
X-Google-Smtp-Source: AMrXdXsOBwkHzA3WLtCmaPkcLxG15WmOP32JJT8RVkSGYFpuHvZMUWrKZfx4+BQl2tWsHH3Qve5ieA==
X-Received: by 2002:a17:902:7c07:b0:193:bec:2122 with SMTP id x7-20020a1709027c0700b001930bec2122mr10562741pll.32.1673253700000;
        Mon, 09 Jan 2023 00:41:40 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:801:a736:715:9a15])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902d48e00b00186acb14c4asm5568119plg.67.2023.01.09.00.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 00:41:39 -0800 (PST)
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
Subject: [PATCH v9 5/9] drm/bridge: anx7625: Check for Type-C during panel registration
Date: Mon,  9 Jan 2023 16:40:57 +0800
Message-Id: <20230109084101.265664-6-treapking@chromium.org>
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

The output port endpoints can be connected to USB-C connectors.
Running drm_of_find_panel_or_bridge() with such endpoints leads to
a continuous return value of -EPROBE_DEFER, even though there is
no panel present.

To avoid this, check for the existence of a "mode-switch" property in
the port endpoint, and skip panel registration completely if so.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

(no changes since v6)

Changes in v6:
- New in v6

 drivers/gpu/drm/bridge/analogix/anx7625.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index b375887e655d..1cf242130b91 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1649,7 +1649,7 @@ static int anx7625_get_swing_setting(struct device *dev,
 static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
-	struct device_node *np = dev->of_node, *ep0;
+	struct device_node *np = dev->of_node, *ep0, *sw;
 	int bus_type, mipi_lanes;
 
 	anx7625_get_swing_setting(dev, pdata);
@@ -1688,6 +1688,17 @@ static int anx7625_parse_dt(struct device *dev,
 	if (of_property_read_bool(np, "analogix,audio-enable"))
 		pdata->audio_en = 1;
 
+	/*
+	 * Don't bother finding a panel if a Type-C `mode-switch` property is
+	 * present in one of the endpoints.
+	 */
+	for_each_endpoint_of_node(np, sw) {
+		if (of_property_read_bool(sw, "mode-switch")) {
+			of_node_put(sw);
+			return 0;
+		}
+	}
+
 	pdata->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
 	if (IS_ERR(pdata->panel_bridge)) {
 		if (PTR_ERR(pdata->panel_bridge) == -ENODEV) {
-- 
2.39.0.314.g84b9a713c41-goog

