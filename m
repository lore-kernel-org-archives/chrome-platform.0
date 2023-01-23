Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC8BA4F
	for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 09:36:45 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id i1so8318386pfk.3
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 01:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFYzShK5REiM5CKMrVZytypQd+WfwC4rc1Yywb/Eki8=;
        b=KEd/7q40xnCCvJ/LmtQxG11kIuVJDt9n6RS0gxD4tXS0+IvlgcY0oLp1AMwkfsuJ7A
         /k3gbdBtyBc54S9CsIkJr3XbApvmP/hGGGhunLr94b6R1MQGxwcwYrh5VEZP4qhDrSR8
         wyEPVyvToL4EWm+agqnIh/Bk2K0KWIyWu6GxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFYzShK5REiM5CKMrVZytypQd+WfwC4rc1Yywb/Eki8=;
        b=0YoEXgWAQJRviReq0LIc9+z9XYz+GLZlyCLfbL+hY5I4U/29Beq/kDsZu8PWBYcV+r
         UJZkKMLyPrlXgNlBkXLGguXeXOsWATdrZ8AM95A8qm/C59ANWopNHk5hB7E9gf4kK0+b
         rFCH/hWW6j+6+hfdwe23zBeXbkPM7smMa5YYcQJLBhV8KR+QqDnRbpTYC+d6Nu79gbQd
         cyy0JE458TS7+6DbHkvKJCejhefxF6U52eBnhioy7VhcfA52yeS+l79nWlHIpD+HNhTK
         ElaVucymYcJ4XtRNq8k6Y+asQQDvpkdj9CNoHdjfHJUYKzRLQarNITgpPC/lmOGt3dOT
         Q+8A==
X-Gm-Message-State: AFqh2krcY6SWW7hMcDBnVP26pEraYkMnkqDgouWqZZbNIJwxFNEeCpZT
	+9XQi1HMbH74DZLZ3vq65Jpa5A==
X-Google-Smtp-Source: AMrXdXuBya1dQ6d3uii7yx3u6Pukr1ObaBXUwgPT4hfUQ+czkewaLHVKhuAcAOb0HnUGsDjItVpldQ==
X-Received: by 2002:a05:6a00:f07:b0:581:61a7:c8f0 with SMTP id cr7-20020a056a000f0700b0058161a7c8f0mr24701076pfb.4.1674466605148;
        Mon, 23 Jan 2023 01:36:45 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:92d9:f31f:cbe8:b7e7])
        by smtp.gmail.com with UTF8SMTPSA id 190-20020a6219c7000000b00589d91962d5sm25319731pfz.195.2023.01.23.01.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 01:36:44 -0800 (PST)
From: Victor Ding <victording@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: gustavoars@kernel.org,
	heikki.krogerus@linux.intel.com,
	dnojiri@chromium.org,
	dustin@howett.net,
	lee.jones@linaro.org,
	tzungbi@kernel.org,
	groeck@chromium.org,
	gregkh@linuxfoundation.org,
	pmalani@chromium.org,
	tinghan.shen@mediatek.com,
	sebastian.reichel@collabora.com,
	enric.balletbo@collabora.com,
	bleung@chromium.org,
	Victor Ding <victording@chromium.org>
Subject: [PATCH] platform/chrome: cros_ec_typec: allow deferred probe of switch handles
Date: Mon, 23 Jan 2023 09:36:20 +0000
Message-Id: <20230123093609.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`fwnode_typec_{retimer,mux,switch}_get()` could return `-EPROBE_DEFER`,
which is called from `cros_typec_get_switch_handles`. When this happens,
it does not indicate absence of switches; instead, it only hints that
probing of switches should occur at a later time.

Progagate `-EPROBE_DEFER` to upper layer logic so that they can re-try
probing switches as a better time.

Signed-off-by: Victor Ding <victording@chromium.org>
---

 drivers/platform/chrome/cros_ec_typec.c | 30 +++++++++++++++++--------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 59de4ce01fab..f4b3fc788491 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -145,31 +145,37 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
 					 struct fwnode_handle *fwnode,
 					 struct device *dev)
 {
+	int ret = 0;
+
 	port->mux = fwnode_typec_mux_get(fwnode, NULL);
 	if (IS_ERR(port->mux)) {
-		dev_dbg(dev, "Mux handle not found.\n");
+		ret = PTR_ERR(port->mux);
+		dev_dbg(dev, "Mux handle not found: %d.\n", ret);
 		goto mux_err;
 	}
 
 	port->retimer = fwnode_typec_retimer_get(fwnode);
 	if (IS_ERR(port->retimer)) {
-		dev_dbg(dev, "Retimer handle not found.\n");
+		ret = PTR_ERR(port->retimer);
+		dev_dbg(dev, "Retimer handle not found: %d.\n", ret);
 		goto retimer_sw_err;
 	}
 
 	port->ori_sw = fwnode_typec_switch_get(fwnode);
 	if (IS_ERR(port->ori_sw)) {
-		dev_dbg(dev, "Orientation switch handle not found.\n");
+		ret = PTR_ERR(port->ori_sw);
+		dev_dbg(dev, "Orientation switch handle not found: %d\n", ret);
 		goto ori_sw_err;
 	}
 
 	port->role_sw = fwnode_usb_role_switch_get(fwnode);
 	if (IS_ERR(port->role_sw)) {
-		dev_dbg(dev, "USB role switch handle not found.\n");
+		ret = PTR_ERR(port->role_sw);
+		dev_dbg(dev, "USB role switch handle not found: %d\n", ret);
 		goto role_sw_err;
 	}
 
-	return 0;
+	return ret;
 
 role_sw_err:
 	typec_switch_put(port->ori_sw);
@@ -181,7 +187,7 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
 	typec_mux_put(port->mux);
 	port->mux = NULL;
 mux_err:
-	return -ENODEV;
+	return ret;
 }
 
 static int cros_typec_add_partner(struct cros_typec_data *typec, int port_num,
@@ -423,9 +429,15 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 		}
 
 		ret = cros_typec_get_switch_handles(cros_port, fwnode, dev);
-		if (ret)
-			dev_dbg(dev, "No switch control for port %d\n",
-				port_num);
+		switch (ret) {
+		case 0:
+			break;
+		case -EPROBE_DEFER:
+			dev_err(dev, "Deferring getting switch handles at port %d\n", port_num);
+			goto unregister_ports;
+		default:
+			dev_dbg(dev, "No switch control for port %d, err: %d\n", port_num, ret);
+		}
 
 		ret = cros_typec_register_port_altmodes(typec, port_num);
 		if (ret) {
-- 
2.39.0.246.g2a6d74b583-goog

