Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E7323AE
	for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 10:21:33 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id g62so1249579pfb.10
        for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 02:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSARwn2UnE9YTFUF2W3+HZEu0BpMDJn1tvX56Vn2aEc=;
        b=Ug9Id50cct6zOXOQoNNjH9g7+k3Y+GPROT/0at83jSeiIUZNvMxLUnWXIfKhQWwCqD
         BvLcx+EY9+QMbGcQ5JRGAFFNl5qvTOXxO0htrR5T7HhUAP4Z9WIyIPI3a2F/bEF3byyF
         wVpCmNKlejLHByIQdI99O8XbYNYoezW4RvB7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSARwn2UnE9YTFUF2W3+HZEu0BpMDJn1tvX56Vn2aEc=;
        b=ZpI/s8UI+KZzvUWvCiqsQkQt6bzJ4HTlbgZ8GlCCdfUkCmBGf8QvvuzJ2cJlLkQyYB
         Bh7eGgBvl3bn5iVsc4lost2hOchJvk4phC2ypOuJiHgBc3yVHGY0ZcCSfw3Hze+mnpJB
         9Ba243BbSO6FABrzXcdxNnkWp5Ies2n+HDWuhXJp2bIXhOdSppQ0HZI49tfH5OnOG6+I
         B/d6jwGEjC1I+OVzqXmjBJX+WmzdyS1Wt8hIg5lM0VTQ9AdxvOxzvc3Pg0JG8TkDdpca
         jbN7ign8cJWHJVE+oXELcfZB3fd2QZOmWKJCMG1L7CBqDgYnf92PUt4kR4HaNq0bQdME
         JRMA==
X-Gm-Message-State: ANoB5pmEYNxyWfb9OKuZ+zf90MoukI+GvhCfYgEKXboKrqRp2WDct8sm
	MdnqfY1WMn3boazt8Ctl36oFVg==
X-Google-Smtp-Source: AA0mqf7L3iC4gnmNoqCiVBZ9XwHWFS6fSLEjPGOepaa1BcV25Acbf6ifE5OqPVrzqGDBw0HCuMDfIQ==
X-Received: by 2002:a05:6a00:80f:b0:571:8794:e845 with SMTP id m15-20020a056a00080f00b005718794e845mr15217721pfk.18.1669285292953;
        Thu, 24 Nov 2022 02:21:32 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:d446:708:8556:dfee])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b005747b59fc54sm854584pfb.172.2022.11.24.02.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 02:21:32 -0800 (PST)
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
Subject: [PATCH v6 4/7] drm/bridge: anx7625: Check for Type-C during panel registration
Date: Thu, 24 Nov 2022 18:20:53 +0800
Message-Id: <20221124102056.393220-5-treapking@chromium.org>
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

The output port endpoints can be connected to USB-C connectors.
Running drm_of_find_panel_or_bridge() with such endpoints leads to
a continuous return value of -EPROBE_DEFER, even though there is
no panel present.

To avoid this, check for the existence of a "mode-switch" property in
the port endpoint, and skip panel registration completely if so.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v6:
- New in v6

 drivers/gpu/drm/bridge/analogix/anx7625.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index b0ff1ecb80a5..b9e3d6ad8846 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1650,7 +1650,7 @@ static int anx7625_get_swing_setting(struct device *dev,
 static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
-	struct device_node *np = dev->of_node, *ep0;
+	struct device_node *np = dev->of_node, *ep0, *sw;
 	int bus_type, mipi_lanes;
 
 	anx7625_get_swing_setting(dev, pdata);
@@ -1689,6 +1689,17 @@ static int anx7625_parse_dt(struct device *dev,
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
2.38.1.584.g0f3c55d4c2-goog

