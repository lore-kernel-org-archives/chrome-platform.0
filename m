Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6F9EA4
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 06:16:34 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id k18so13769528pll.5
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 22:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3qoCzkgMC3epjfmYnac3zJtIxKInIgHtPqJ9iFFjX4=;
        b=mR+amAtNWxbL3sA+wpkIkPIIcvTPSDrMy97m7q/pylWU/wwE2DWzPHkWp83Ckp+w6Z
         k98nQsH1uxTqwj+6sNcXWnj0XjYhSdcD3i30W7y4l24O83KOIiYmSSppmuZTO9+hFVyY
         HC70CkuaCOE//3gfhOvfA0fRDB2f8ddk2Sc2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3qoCzkgMC3epjfmYnac3zJtIxKInIgHtPqJ9iFFjX4=;
        b=3AzgcoqUe6MB2NmTXNAlZI4p6Yik77ctVafnN4ek1NLqdiwsVDtlxQ9PTDFh8lV5Ur
         c+9HGDlfIvQlyXksEoDgwr0BAy/ce2B0nHNpSDhZbBMY5yMuhajImfIGAuXD2dAHzbhk
         JIPltUT8MM814K64Q+3EVPLhbrnoAmhjnkS3kuRBPSahXncKic5lzyGbSlNPJjJ0MkAM
         apHARt62K3KUt6mIqwFgKgn3nUZws9wGEU0C0HUwUCleIUWkBLiG+x37lmWyIWBnIokQ
         3Pb8Sa6eOJIbXOFpFwCQ5bQCQMWw7nH0oG6tdBp+Zsk0zcqjbbarjoGGDXIGoYNoCFdu
         5ulg==
X-Gm-Message-State: AFqh2kpCzMzl8o3P6jqoOzeE6mh/sysyqJYn+/5g7BMv4C473SSOHVlr
	jl0CIHE68AY9E7j0fuZUDWPeTA==
X-Google-Smtp-Source: AMrXdXuz+AkjLaL4BZlGjmx7tJSWQRpncIw7ghQdyTfBKvKulfydLevszk+cR8nza8tt/b0H5uoc1A==
X-Received: by 2002:a17:902:bd95:b0:192:5282:6833 with SMTP id q21-20020a170902bd9500b0019252826833mr25801358pls.29.1674540994101;
        Mon, 23 Jan 2023 22:16:34 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:92d9:f31f:cbe8:b7e7])
        by smtp.gmail.com with UTF8SMTPSA id t1-20020a170902e84100b00187197c499asm752584plg.164.2023.01.23.22.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 22:16:33 -0800 (PST)
From: Victor Ding <victording@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: dustin@howett.net,
	lee.jones@linaro.org,
	bleung@chromium.org,
	dnojiri@chromium.org,
	sebastian.reichel@collabora.com,
	gregkh@linuxfoundation.org,
	pmalani@chromium.org,
	gustavoars@kernel.org,
	groeck@chromium.org,
	enric.balletbo@collabora.com,
	tinghan.shen@mediatek.com,
	heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	Victor Ding <victording@chromium.org>
Subject: [PATCH v2] platform/chrome: cros_ec_typec: allow deferred probe of switch handles
Date: Tue, 24 Jan 2023 06:16:24 +0000
Message-Id: <20230124061521.v2.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f-goog
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

Changes in v2:
- Coverted switch-block to nested if-blocks.

 drivers/platform/chrome/cros_ec_typec.c | 26 ++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 59de4ce01fab..580f3bdf091c 100644
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
@@ -423,9 +429,11 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 		}
 
 		ret = cros_typec_get_switch_handles(cros_port, fwnode, dev);
-		if (ret)
-			dev_dbg(dev, "No switch control for port %d\n",
-				port_num);
+		if (ret) {
+			dev_dbg(dev, "No switch control for port %d, err: %d\n", port_num, ret);
+			if (ret == -EPROBE_DEFER)
+				goto unregister_ports;
+		}
 
 		ret = cros_typec_register_port_altmodes(typec, port_num);
 		if (ret) {
-- 
2.39.1.405.gd4c25cc71f-goog

