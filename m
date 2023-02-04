Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E1E23A9
	for <chrome-platform@lists.linux.dev>; Sat,  4 Feb 2023 13:31:03 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id g9so5526817pfk.13
        for <chrome-platform@lists.linux.dev>; Sat, 04 Feb 2023 05:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzf2jVYplA8aE3AG7mF8tjqc7YfVHNzTvjn8QCL8QQE=;
        b=XOar4LHD9c/G8nWjPa8i0IQvwhxfLXWogWDL1nY00qKfe23sg9JlyEHPfwz+CEeo92
         GLaqvjPSWVv4K2TTudUs5ZF5iSuQ0FJ7X/5Y4WWrX/XZH9PLpGL6A0gvh8MEtDhfwc+K
         TCRFMMiqfzJygsnq2ww+OpoMZmv0Skk8blvjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzf2jVYplA8aE3AG7mF8tjqc7YfVHNzTvjn8QCL8QQE=;
        b=d42Q+ZDuygUJcIm9K5ltV8ezicqCWaWL/yl2SHkEyDwV1R2WdndP9Kg2Mn7ZAQzNwT
         h6jM0EJHOJf5N2vwmNjQ4zgRON+yC5Rj6DSiJJ0m1BTv4Q/BjCyS0J2A+dIUkReP8hse
         d6R6lL8dkJXrOQI8r7NAD0qHOos0XAhB/UsyO0ENbAAUOH/ZgJXTbi2qxHTlspmYdlUH
         H32xwfweoYgBg0Kg2Xdiph9G26f4bgzcKS3S2iZSbthFVm8vmsVD6RYI6/ETI+CVez1X
         oWNrORhszMd64R22qCQmWJ1R1VMbkgshtT7BZMZQ0ZrmtI78+qiAEa89TDPBl7LXu2zZ
         IVIw==
X-Gm-Message-State: AO0yUKWVSNE2WSs0iwZxwnGTKrdemclM9ONpzsMhuzCodBNUnVDey2Np
	73OCRs89HLgwz4emQV1LbSsvWg==
X-Google-Smtp-Source: AK7set+1X6kXak01XGkVjrrceHshEa07YHswioqgR/Q4wKgCqR/quO47+t9nfD5gFl2gV4MQIY5S/g==
X-Received: by 2002:aa7:80c6:0:b0:592:de72:4750 with SMTP id a6-20020aa780c6000000b00592de724750mr11680416pfn.23.1675517462757;
        Sat, 04 Feb 2023 05:31:02 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:c1ad:2bdc:7b5a:72e3])
        by smtp.gmail.com with ESMTPSA id 144-20020a621596000000b00593ce7ebbaasm3655639pfv.184.2023.02.04.05.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 05:31:02 -0800 (PST)
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
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Allen Chen <allen.chen@ite.com.tw>,
	Lyude Paul <lyude@redhat.com>,
	linux-acpi@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Marek Vasut <marex@denx.de>,
	Xin Ji <xji@analogixsemi.com>,
	Stephen Boyd <swboyd@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	chrome-platform@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v11 2/9] platform/chrome: cros_ec_typec: Purge blocking switch devlinks
Date: Sat,  4 Feb 2023 21:30:33 +0800
Message-Id: <20230204133040.1236799-3-treapking@chromium.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230204133040.1236799-1-treapking@chromium.org>
References: <20230204133040.1236799-1-treapking@chromium.org>
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
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

---

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
2.39.1.519.gcb327c4b5f-goog

