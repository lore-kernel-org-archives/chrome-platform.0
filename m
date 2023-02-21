Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DEA1C07
	for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 09:51:27 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id b14-20020a17090a8c8e00b002349579949aso4103910pjo.5
        for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 01:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84m3FSulx+pWKCpnyEJ3RgcMwe/Bo6Rt70rnUQNfHew=;
        b=Teyu6n12+9jHyEBpVJMRsPinTHx4mlBvUReMYsnpwoUDixoB2lEOVV2Xog1BzRpAvJ
         VYi/SSy+LXeg6/qYwipRJqeLiYxgN+YsKEYFdVZcVBmF+G/kGBAuKijJtP0BtO+IUFH4
         GvwOruadQ0wlgGnbAyXdRip2lNBYu8fXadKC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84m3FSulx+pWKCpnyEJ3RgcMwe/Bo6Rt70rnUQNfHew=;
        b=k+DoerjnpnRC4Ef+tzw9VPLXmW49lTtAFNn5Nf90WTWWOiDOEB4KKhbCGZrRe7Q/2w
         r3hINjH46EZe624W2NEe13HcDHugJC26oBV2VfBzrTDwujjb3UyisUErIzdskoG5OFdq
         7vXSg4RpGCkqYmDpytujlzttRkK5JNSHyja3JZjEmLs2wG+y85KK6j5XEFMp78zTLh10
         K1onvdNvQoAzYyQUhFApLj9wcMZuKMQ86oFAnSbFjXI01Hofj0WrNvGJIv9u05ZTSW69
         st/T0SqwcZ9n+85uIv/AO6eWzN/j39tpjPPUwY3A3AsnQUYrmD/IJsg+DDtkOqh02ndQ
         Z8vw==
X-Gm-Message-State: AO0yUKURi9acEZKcGeW8RN40uS8NI5XLtIPyt7b7u+sEkzjFNB9+8fn9
	/u0LWCx9jJgfY2JuIL5OI8kzxQ==
X-Google-Smtp-Source: AK7set9uPErKNPWkA0C6wXikny0rBTip0v+7aGBXZ2ecMwWeSiY/MrX0F0uijgQvHPcAH9Y6v3wTAg==
X-Received: by 2002:a05:6a21:3394:b0:bc:cff9:f092 with SMTP id yy20-20020a056a21339400b000bccff9f092mr4888829pzb.10.1676973086834;
        Tue, 21 Feb 2023 01:51:26 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:a1f5:f58d:584e:5906])
        by smtp.gmail.com with ESMTPSA id t25-20020a656099000000b004eca54eab50sm3524918pgu.28.2023.02.21.01.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 01:51:26 -0800 (PST)
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
Cc: Pin-yen Lin <treapking@chromium.org>,
	linux-kernel@vger.kernel.org,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Xin Ji <xji@analogixsemi.com>,
	Lyude Paul <lyude@redhat.com>,
	Allen Chen <allen.chen@ite.com.tw>,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	chrome-platform@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-acpi@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v12 02/10] platform/chrome: cros_ec_typec: Purge blocking switch devlinks
Date: Tue, 21 Feb 2023 17:50:46 +0800
Message-Id: <20230221095054.1868277-3-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230221095054.1868277-1-treapking@chromium.org>
References: <20230221095054.1868277-1-treapking@chromium.org>
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

(no changes since v11)

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
index 001b0de95a46..bbc95a3ba5a7 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -385,6 +385,16 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
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
2.39.2.637.g21b0678d19-goog

