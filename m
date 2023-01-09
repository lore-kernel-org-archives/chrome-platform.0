Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6502571
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 08:41:22 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso8673210pjf.1
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 00:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nT9gdnbLGuBpWnVg5M2Oo4GmVRIc3FKsY2Rh+Wszh3E=;
        b=jfnx8H2ayZ5mO308ZdpUhVJ+B89s7VdqO305IUVxBNCGj3p+83RjoM4kBlJA4lOH1h
         SIfG/GdKoex8f1/sGihST+zMmkIfKiaYU1MMKj+Ga+YxUbR4CZiBIxQpL6j+SOv3WxEY
         a0wGAzC/7Xhv73l4kEse/49QZ5DteeDPxerPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nT9gdnbLGuBpWnVg5M2Oo4GmVRIc3FKsY2Rh+Wszh3E=;
        b=RjxSEfVJ2XkF9pKwx1Er2pxXJTEcPzfGAKCfh2I1Awnnbq5RmEsgGX2g4TVCEeik0Y
         00hxdlw1ZCeGZNVxmRPLirSl7ku1WitMGnSJ48Dq17SozpJ7KoeiJbA6xCO+0OBnKQPH
         Gxdr5PiZS8z2VikZi7QAqOg7MZMxSN1ASeUlIs3dT/Tz9ZquwoCaV4OrMWSMTy7oTPXY
         921UKeBXVvIJhKXNwdsjgbZUVR9S2JTgtx2FY/4R98FlEd+pFYJB3gGkSSn6QjPQZQlt
         f5itZDey5gdrUHWABXePOkV21YESnEhJh6yKKfqJnkAh5mKLdLMtCSe4gDqpvg8d9S2S
         u90Q==
X-Gm-Message-State: AFqh2kqd0vHuRTwIttyUPoYpoRaDBLBxNkm+Rg24/qLv5QlqftvGdxU/
	y2nxM15iTiqrhS+Hq0q4iWfm0w==
X-Google-Smtp-Source: AMrXdXtR82zELA54+lN4JhPzNpPH9ptRVMeKbMzUNwDjBZPhypvapK6YiSb+RjTmMAhoNSpNCLwPeQ==
X-Received: by 2002:a17:903:2c2:b0:189:c8d9:ed30 with SMTP id s2-20020a17090302c200b00189c8d9ed30mr60564520plk.24.1673253681743;
        Mon, 09 Jan 2023 00:41:21 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:801:a736:715:9a15])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902d48e00b00186acb14c4asm5568119plg.67.2023.01.09.00.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 00:41:21 -0800 (PST)
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
Subject: [PATCH v9 2/9] platform/chrome: cros_ec_typec: Purge blocking switch devlinks
Date: Mon,  9 Jan 2023 16:40:54 +0800
Message-Id: <20230109084101.265664-3-treapking@chromium.org>
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

---

(no changes since v7)

Changes in v7:
- Fix the long comment lines

Changes in v6:
- New in v6

 drivers/platform/chrome/cros_ec_typec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 2a7ff14dc37e..302474a647cc 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -382,6 +382,16 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
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
2.39.0.314.g84b9a713c41-goog

