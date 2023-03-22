Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A5223D4
	for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 10:47:17 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id kq3so6477699plb.13
        for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 03:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679482037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cS29WoxUQLo4BQ309Cl3H3ZApJrAXVrclnM2SVgJFsU=;
        b=OMtCtiUazE3zaX2l1R50ngdXVHr+uI3FBVunt9kTXSHbM/uN7wiJOvx+pdFWt2TiqP
         9OT8Xv/U8O1i6s5otVZUfFwAvpqurw4vsHaNl4ctoDbP2lDqxe4pJswDEGt0q0UxfbM5
         WBtYPrhNigAP5Qhtnhg3p6Xlh6jiHhH172wzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679482037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cS29WoxUQLo4BQ309Cl3H3ZApJrAXVrclnM2SVgJFsU=;
        b=TvzfyEs3VsEKlj2tE9CulMFtCz96zo7bVKz5Vy83prGQwXGjLWb+QYrenBbR6waX3Z
         vjRirp9Nr0r87Eyf+KtlL89+fVMMJMhGY1TElZjay/SCHrf8sHGpibBenL6PIRd5A3rz
         INBH6wfYgkPqL9vHFF8GjVNBi76BLEsHRD+v6TsUE460ptAnzFUbOjSEoO2klTIKWlhN
         jycBb0/simLF3Jer2BuwOCus0VvuyTYAoVgXjdtETTDvjJHmp0rcJBdGxDvRGXext/wy
         4nMuBfNVYJgXW1spwPJzCe5yG1lu95zajicPSs6DRyY6ZH0dM0unh50ZiEU1aEzavkmW
         teQw==
X-Gm-Message-State: AO0yUKWjy044TsYJBwCzvpmi20lR9Z7pBCocUMGFWSHUle8j+cidBLoS
	52zPZlQsmu5stKCnowU9DdoDmw==
X-Google-Smtp-Source: AK7set8fGmVxBLUWTjSl7r8WnygWcPOj87bCDMAljt4SxYg+KZgChWl1HjWbCDYL09wfME9RVQEO1g==
X-Received: by 2002:a17:90a:191e:b0:237:50b6:9838 with SMTP id 30-20020a17090a191e00b0023750b69838mr3135278pjg.45.1679482036826;
        Wed, 22 Mar 2023 03:47:16 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:343d:79bf:55f9:1da5])
        by smtp.gmail.com with ESMTPSA id hg4-20020a17090b300400b002340d317f3esm9508742pjb.52.2023.03.22.03.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 03:47:16 -0700 (PDT)
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
Cc: Xin Ji <xji@analogixsemi.com>,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-acpi@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pin-yen Lin <treapking@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Lyude Paul <lyude@redhat.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Allen Chen <allen.chen@ite.com.tw>,
	dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <swboyd@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v14 05/10] drm/bridge: anx7625: Check for Type-C during panel registration
Date: Wed, 22 Mar 2023 18:46:34 +0800
Message-Id: <20230322104639.221402-6-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322104639.221402-1-treapking@chromium.org>
References: <20230322104639.221402-1-treapking@chromium.org>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---

Changes in v14:
- Collect review tag

Changes in v13:
- Use the new typec_mode_switch_node_count helper

Changes in v12:
- Updated to use fwnode_for_each_typec_mode_switch macro
- Dropped collected tags

Changes in v10:
- Collected Reviewed-by and Tested-by tags

Changes in v6:
- New in v6

 drivers/gpu/drm/bridge/analogix/anx7625.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6846199a2ee1..3f6bf7674d32 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1648,7 +1648,8 @@ static int anx7625_get_swing_setting(struct device *dev,
 static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
-	struct device_node *np = dev->of_node, *ep0;
+	struct device_node *np = dev->of_node, *ep0, *port_node;
+	unsigned int count;
 	int bus_type, mipi_lanes;
 
 	anx7625_get_swing_setting(dev, pdata);
@@ -1687,6 +1688,15 @@ static int anx7625_parse_dt(struct device *dev,
 	if (of_property_read_bool(np, "analogix,audio-enable"))
 		pdata->audio_en = 1;
 
+	/*
+	 * Don't bother finding a panel if a Type-C `mode-switch` property is
+	 * present in one of the endpoints in the output port.
+	 */
+	port_node = of_graph_get_port_by_id(np, 1);
+	count = typec_mode_switch_node_count(&port_node->fwnode);
+	if (count)
+		return 0;
+
 	pdata->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
 	if (IS_ERR(pdata->panel_bridge)) {
 		if (PTR_ERR(pdata->panel_bridge) == -ENODEV) {
-- 
2.40.0.rc1.284.g88254d51c5-goog

