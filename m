Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF4E1842
	for <chrome-platform@lists.linux.dev>; Sat,  7 Jan 2023 10:22:53 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id v23so3930149pju.3
        for <chrome-platform@lists.linux.dev>; Sat, 07 Jan 2023 02:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nT9gdnbLGuBpWnVg5M2Oo4GmVRIc3FKsY2Rh+Wszh3E=;
        b=g/GC21wmf8/MD5LCSsmqw0UM9NPshE0aYYzre7tVqamk7Oyn+DzAMclqiKsgTKXDn4
         ywWy0J6TrILXWq2wgD5zZuI0dwqPYzwix1l72zqSd+PXFJ7gGJM4Pov4BnzTglck6Q9C
         qgRfAuZogdAtS3kDGHsmijJT2ErxmhKQYDAXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nT9gdnbLGuBpWnVg5M2Oo4GmVRIc3FKsY2Rh+Wszh3E=;
        b=7Dv41XiSAoT/VAYh9WOOmhtYlPr1P+IPRMqSP6lgJtRmpExo8PVYyDCJOr7o3dgY8R
         BjFY5Hd8ABBdJQImHVmgCvQuJffNuNaNjlZc+9JHoZlgKi8d2Z3iuwGN2yCYVWAnjNlm
         mRCV3ClqgsleKGwkhvlQuSg4vBxkn7ZAUqCshrPiRUPfFwOgh8/HP6WOFS+yGJQk7lmr
         4yWXsLP6n23UiKhLZyTiHbqUNrPO/2ewnfmr7j0A8oXbowJnuqcsBwrUKhzEwxRE+A4f
         PjLHIVOyMSuR5A1ZG5Ce5VQ8WmvYul1Pz1qF6T7ktCwEuIUWiPHhwi9rgXQv8AVGCtHX
         tkjg==
X-Gm-Message-State: AFqh2kqhudutrRaOVpEV812vZ5+xNlmscL1s4Eza+aJX5+2ejbpMzA9l
	Nm0UM/6z9l5OvI6YjMkh0vslmg==
X-Google-Smtp-Source: AMrXdXshQueVSSjO1qfCj7EmNNm2bUD58eRfmn/kGRv+NVvqzWZPI1/73g/Jc2D6nYXH7+8ktZI3oA==
X-Received: by 2002:a17:902:edc5:b0:192:c882:703e with SMTP id q5-20020a170902edc500b00192c882703emr20430020plk.43.1673086973113;
        Sat, 07 Jan 2023 02:22:53 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:180d:95e8:f4:84fb])
        by smtp.gmail.com with ESMTPSA id b1-20020a170903228100b001892af9472esm2366362plh.261.2023.01.07.02.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 02:22:52 -0800 (PST)
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
Subject: [PATCH v8 2/9] platform/chrome: cros_ec_typec: Purge blocking switch devlinks
Date: Sat,  7 Jan 2023 18:22:24 +0800
Message-Id: <20230107102231.23682-3-treapking@chromium.org>
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

