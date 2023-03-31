Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EFF23BC
	for <chrome-platform@lists.linux.dev>; Fri, 31 Mar 2023 09:12:07 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id ix20so20690468plb.3
        for <chrome-platform@lists.linux.dev>; Fri, 31 Mar 2023 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680253927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuyGEC/BCL1exOJo9w5cckpDi+j1ToSvkBZ5wHJd1EI=;
        b=asCmRmQnDO169ph3UWKR1Z453FBunIfmYwRDQIA8D06CqqHt26CWm64PBNzQPfLq7i
         9VhRVbihJvA417MwBMmcik33jSerfc/m9zokq3LI30/lC1AN3uxYjN74qdAsdwHwFfEo
         LD6TuuAm1zjPYtesKo5nMx7iPf9AOv/0ZprM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680253927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuyGEC/BCL1exOJo9w5cckpDi+j1ToSvkBZ5wHJd1EI=;
        b=DcqttgrFf3wnqq5ap5rzg/0tq0hjhwxBYFO59+gGp7fW40wNqKi8ctZJyhk7MbefHk
         nowh69xqAP56vVUTPzWX96PttcCUimF5dmBteBoJgDodQz8bDVUnWtdvlb0u3GixJjP6
         PBgudcJfeqfTphTmi/A0TQCyVIy3PVEAcHCI2UFvrpe6scVWBZv7eqNBGmBoO5vkqatT
         BL9jBV6qWbGm2zQK4/BhJ6G1xgJSzJnfPEqIRTQqcfUFvmF4VlAN3J4zrZVN0oEDBVTT
         +rhWfGfWysCgnXXDwysxu42HmKlsrFoQ9G7pZEEasmOiO1wT2WvO7J4MPfEVBowqy8X9
         QPuw==
X-Gm-Message-State: AO0yUKUiXzI/ETxxodqCN6qL52rwUK2IQlyquDSLnY9SyoSqHZ6DvKSd
	p7cgV5ESd/6puncan8DQdf1Zkw==
X-Google-Smtp-Source: AK7set+ubiZHdR0EYwAEQ+6mxM9jDOMo4i5HJvDrMdaVpzntUKo5Gz+rySNDQSajJbJNpYlHL+hJnA==
X-Received: by 2002:a05:6a20:4f1f:b0:be:da1c:df65 with SMTP id gi31-20020a056a204f1f00b000beda1cdf65mr21256623pzb.28.1680253927134;
        Fri, 31 Mar 2023 02:12:07 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:ae9d:db7a:8a71:d458])
        by smtp.gmail.com with ESMTPSA id n6-20020a62e506000000b006227c3d5e29sm1360905pff.16.2023.03.31.02.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 02:12:06 -0700 (PDT)
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
	Marek Vasut <marex@denx.de>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lyude Paul <lyude@redhat.com>,
	devicetree@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-acpi@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Pin-yen Lin <treapking@chromium.org>,
	linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v15 02/10] platform/chrome: cros_ec_typec: Purge blocking switch devlinks
Date: Fri, 31 Mar 2023 17:11:37 +0800
Message-Id: <20230331091145.737305-3-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331091145.737305-1-treapking@chromium.org>
References: <20230331091145.737305-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Prashant Malani <pmalani@chromium.org>

When using OF graph, the fw_devlink code will create links between the
individual port driver (cros-ec-typec here) and the parent device for
a Type-C switch (like mode-switch). Since the mode-switch will in turn
have the usb-c-connector (i.e the child of the port driver) as a
supplier, fw_devlink will not be able to resolve the cyclic dependency
correctly.

As a result, the mode-switch driver probe() never runs, so mode-switches
are never registered. Because of that, the port driver probe constantly
fails with -EPROBE_DEFER, because the Type-C connector class requires all
switch devices to be registered prior to port registration.

To break this deadlock and allow the mode-switch registration to occur,
purge all the usb-c-connector nodes' absent suppliers. This eliminates
the connector as a supplier for a switch and allows it to be probed.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

---

Changes in v15:
- Collected Reviewed-by tags

Changes in v11:
- Collected Acked-by tag

Changes in v10:
- Collected Reviewed-by and Tested-by tags

Changes in v7:
- Fix the long comment lines

Changes in v6:
- New in v6

 drivers/platform/chrome/cros_ec_typec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index a673c3342470..5911cd9640cb 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -325,6 +325,16 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 		return -EINVAL;
 	}
 
+	/*
+	 * OF graph may have set up some device links with switches,
+	 * since connectors have their own compatible. Purge these
+	 * to avoid a deadlock in switch probe (the switch mistakenly
+	 * assumes the connector is a supplier).
+	 */
+	if (dev_of_node(dev))
+		device_for_each_child_node(dev, fwnode)
+			fw_devlink_purge_absent_suppliers(fwnode);
+
 	/* DT uses "reg" to specify port number. */
 	port_prop = dev->of_node ? "reg" : "port-number";
 	device_for_each_child_node(dev, fwnode) {
-- 
2.40.0.348.gf938b09366-goog

