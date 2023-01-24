Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF057C
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jan 2023 07:56:42 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d3so13943044plr.10
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jan 2023 23:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IehvW+ytjBjOfr0jydrmbHO2zJBLkzx2YGJHGnzqhIs=;
        b=ieHxGjYP8uzW4ht7awbJlp0w57w+d3HLN/c5Rpqv9ec8UY15FIC9zl4hbfuNFqvMXS
         +1DHL18xYK4z4sNc5GOQ3vTQk1rY8vSyc4NfPpbQycd6rXjX5DOPYAXZCHpjN/kIvo3a
         VcxuW7hNdsqrJXKqx9WmBg4iCQvJQBQRz+OIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IehvW+ytjBjOfr0jydrmbHO2zJBLkzx2YGJHGnzqhIs=;
        b=5BzfJyXbGUfBF4mx93QPegDfRl5LMaaikrHIcyw1qif/8Iid6Rd8IgSyREkWBvPC+t
         sIztJjwwrt7zbI3iBnhQzRNKtS7xEio7eGLDqgbVCysfirFUIfwzOvT2vhR5Qc6wc6hq
         JbDEfg/ub9KIH5rKRuhqZmf/31re8T27YZzEFGo4ME71FQykorH98eZn4uMESRhUxC12
         g63PbkaFo2P5SwHciyDWAP68dANX7S2d7S96cIlvBK0c/+t5+3dxt4XfDXfzQFjcomOb
         J7fEHvNTNhKhJQXGhAmV4n7g/7968AeLIs5GcjYHmmHHh1/xycWeb+rc15H2bIQj1hHW
         lUVw==
X-Gm-Message-State: AO0yUKWMT0hrJrBEu07e7qq7KmGoanGuYGV3jsOkYGzXHvW7NEIthETz
	/B6k/DdBm3Egvp0Uhy6ehfpUlQ==
X-Google-Smtp-Source: AK7set8ZncBvg0s//J6Daa/MO2C9pY4Ac7/ua4mDRMZHFDHgfdR6jtnM16WToqPBhBhXS7U/oPT2tA==
X-Received: by 2002:a17:902:d4cc:b0:196:11ae:95f1 with SMTP id o12-20020a170902d4cc00b0019611ae95f1mr2252872plg.24.1674547001696;
        Mon, 23 Jan 2023 23:56:41 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:92d9:f31f:cbe8:b7e7])
        by smtp.gmail.com with UTF8SMTPSA id w23-20020a1709027b9700b00189743ed3b6sm1003340pll.64.2023.01.23.23.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 23:56:41 -0800 (PST)
From: Victor Ding <victording@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: heikki.krogerus@linux.intel.com,
	lee.jones@linaro.org,
	groeck@chromium.org,
	enric.balletbo@collabora.com,
	tzungbi@kernel.org,
	sebastian.reichel@collabora.com,
	gregkh@linuxfoundation.org,
	gustavoars@kernel.org,
	bleung@chromium.org,
	dustin@howett.net,
	dnojiri@chromium.org,
	tinghan.shen@mediatek.com,
	pmalani@chromium.org,
	Victor Ding <victording@chromium.org>
Subject: [PATCH v3] platform/chrome: cros_ec_typec: allow deferred probe of switch handles
Date: Tue, 24 Jan 2023 07:56:32 +0000
Message-Id: <20230124075555.v3.1.I6c0a089123fdf143f94ef4cca8677639031856cf@changeid>
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

Changes in v3:
- Reverted unnecessary change.

Changes in v2:
- Coverted switch-block to nested if-blocks.

 drivers/platform/chrome/cros_ec_typec.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 59de4ce01fab..de480ab10488 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -145,27 +145,33 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
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

