Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDB97E0
	for <chrome-platform@lists.linux.dev>; Fri, 25 Aug 2023 02:50:42 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c06f6f98c0so4575085ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 24 Aug 2023 19:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692931842; x=1693536642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwICLIlnF2PyH3qiH1kQTn5EruolauYY2CVfJRzsF/M=;
        b=BPPniuRdIiMJVP4lAndNN/lKagYyq2VUzOzwi5CEuD5vcuagOLX7H5vyKsFlfpPTQ4
         w8xDxVf0phpzfvZILMWjOvM3aqPb+0JxbVZVHWq8wuy06LeCM9AtV2oGoK6FfE0rj6qg
         hoZD6l66tIz8sOI/4Qjo/dlkKmr5tCS1KCIWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931842; x=1693536642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwICLIlnF2PyH3qiH1kQTn5EruolauYY2CVfJRzsF/M=;
        b=WQ6bwxmfldW7z8JU5omBJ/B82znA5maenPMnUBbYwetJOlcclU5paEAXmwwlUittdf
         sCJz1VCtQ97WaZkr1ZSF5GrKgDJ8ihc5qGGPRMof89NAmZHeVXGKB9915FMjES4UMJ0v
         9VxNt9RSGngHeodOTHOjhSxfS7C82J0aQIiX77COmEwPw28LjZn2y7dRO6hYkcJ9wnLG
         m18OoqYJBvo6DtAt2fvG5Szzbgit4zrQEIfNmzmWvQ+rE/TEM2zjzBBWmpHnLpHEhwAw
         jDUYKE5XDo4kJ1AmrKp5RO+bpIqYaQ1BM32766fqN71qDSsn7hlFRP3TnRXtm+GrZ0Us
         +OsA==
X-Gm-Message-State: AOJu0YxzwzCcyIsSTurpn0z/E6+PhQnSJ4bW4c7ru35J9+e6phxcDlRh
	HeTffo0uvEsYv/L3/KLsf1c5LA==
X-Google-Smtp-Source: AGHT+IGLpuSuNPhPZKzf14nGeV/qQhAaXcXBtZJBmWZWhIyS1pRKJf0xPSsydJtyvVgCSpQ/V4KqHA==
X-Received: by 2002:a17:902:c404:b0:1b5:64a4:be8b with SMTP id k4-20020a170902c40400b001b564a4be8bmr23137100plk.35.1692931841795;
        Thu, 24 Aug 2023 19:50:41 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:9fe1:d4b1:42cc:882f])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902a3ca00b001bb0eebd90asm420847plb.245.2023.08.24.19.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:50:40 -0700 (PDT)
From: Reka Norman <rekanorman@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Stefan Adolfsson <sadolfsson@google.com>,
	Reka Norman <rekanorman@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/9] media: cros-ec-cec: Manage an array of ports
Date: Fri, 25 Aug 2023 12:43:55 +1000
Message-ID: <20230825024735.1443836-3-rekanorman@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
In-Reply-To: <20230825024735.1443836-1-rekanorman@chromium.org>
References: <20230825024735.1443836-1-rekanorman@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support multiple CEC ports, change cros_ec_cec to contain an array of
ports, each with their own CEC adapter, etc.

For now, only create a single port and use that port everywhere, so
there is no functional change. Support for multiple ports will be added
in the following patches.

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

(no changes since v1)

 .../media/cec/platform/cros-ec/cros-ec-cec.c  | 147 +++++++++++++-----
 .../linux/platform_data/cros_ec_commands.h    |   2 +
 2 files changed, 110 insertions(+), 39 deletions(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 8dd95fb38546..d76a25ae0cf1 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -21,21 +21,40 @@
 
 #define DRV_NAME	"cros-ec-cec"
 
+/* Only one port is supported for now */
+#define CEC_NUM_PORTS	1
+#define CEC_PORT	0
+
 /**
- * struct cros_ec_cec - Driver data for EC CEC
+ * struct cros_ec_cec_port - Driver data for a single EC CEC port
  *
- * @cros_ec: Pointer to EC device
- * @notifier: Notifier info for responding to EC events
+ * @port_num: port number
  * @adap: CEC adapter
  * @notify: CEC notifier pointer
  * @rx_msg: storage for a received message
+ * @cros_ec_cec: pointer to the parent struct
  */
-struct cros_ec_cec {
-	struct cros_ec_device *cros_ec;
-	struct notifier_block notifier;
+struct cros_ec_cec_port {
+	int port_num;
 	struct cec_adapter *adap;
 	struct cec_notifier *notify;
 	struct cec_msg rx_msg;
+	struct cros_ec_cec *cros_ec_cec;
+};
+
+/**
+ * struct cros_ec_cec - Driver data for EC CEC
+ *
+ * @cros_ec: Pointer to EC device
+ * @notifier: Notifier info for responding to EC events
+ * @num_ports: Number of CEC ports
+ * @ports: Array of ports
+ */
+struct cros_ec_cec {
+	struct cros_ec_device *cros_ec;
+	struct notifier_block notifier;
+	int num_ports;
+	struct cros_ec_cec_port *ports[EC_CEC_MAX_PORTS];
 };
 
 static void handle_cec_message(struct cros_ec_cec *cros_ec_cec)
@@ -43,27 +62,28 @@ static void handle_cec_message(struct cros_ec_cec *cros_ec_cec)
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
 	uint8_t *cec_message = cros_ec->event_data.data.cec_message;
 	unsigned int len = cros_ec->event_size;
+	struct cros_ec_cec_port *port = cros_ec_cec->ports[CEC_PORT];
 
 	if (len > CEC_MAX_MSG_SIZE)
 		len = CEC_MAX_MSG_SIZE;
-	cros_ec_cec->rx_msg.len = len;
-	memcpy(cros_ec_cec->rx_msg.msg, cec_message, len);
+	port->rx_msg.len = len;
+	memcpy(port->rx_msg.msg, cec_message, len);
 
-	cec_received_msg(cros_ec_cec->adap, &cros_ec_cec->rx_msg);
+	cec_received_msg(port->adap, &port->rx_msg);
 }
 
 static void handle_cec_event(struct cros_ec_cec *cros_ec_cec)
 {
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
 	uint32_t events = cros_ec->event_data.data.cec_events;
+	struct cros_ec_cec_port *port = cros_ec_cec->ports[CEC_PORT];
 
 	if (events & EC_MKBP_CEC_SEND_OK)
-		cec_transmit_attempt_done(cros_ec_cec->adap,
-					  CEC_TX_STATUS_OK);
+		cec_transmit_attempt_done(port->adap, CEC_TX_STATUS_OK);
 
 	/* FW takes care of all retries, tell core to avoid more retries */
 	if (events & EC_MKBP_CEC_SEND_FAILED)
-		cec_transmit_attempt_done(cros_ec_cec->adap,
+		cec_transmit_attempt_done(port->adap,
 					  CEC_TX_STATUS_MAX_RETRIES |
 					  CEC_TX_STATUS_NACK);
 }
@@ -93,7 +113,8 @@ static int cros_ec_cec_event(struct notifier_block *nb,
 
 static int cros_ec_cec_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
 {
-	struct cros_ec_cec *cros_ec_cec = adap->priv;
+	struct cros_ec_cec_port *port = adap->priv;
+	struct cros_ec_cec *cros_ec_cec = port->cros_ec_cec;
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
 	struct ec_params_cec_set params = {
 		.cmd = CEC_CMD_LOGICAL_ADDRESS,
@@ -115,7 +136,8 @@ static int cros_ec_cec_set_log_addr(struct cec_adapter *adap, u8 logical_addr)
 static int cros_ec_cec_transmit(struct cec_adapter *adap, u8 attempts,
 				u32 signal_free_time, struct cec_msg *cec_msg)
 {
-	struct cros_ec_cec *cros_ec_cec = adap->priv;
+	struct cros_ec_cec_port *port = adap->priv;
+	struct cros_ec_cec *cros_ec_cec = port->cros_ec_cec;
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
 	struct ec_params_cec_write params;
 	int ret;
@@ -135,7 +157,8 @@ static int cros_ec_cec_transmit(struct cec_adapter *adap, u8 attempts,
 
 static int cros_ec_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
-	struct cros_ec_cec *cros_ec_cec = adap->priv;
+	struct cros_ec_cec_port *port = adap->priv;
+	struct cros_ec_cec *cros_ec_cec = port->cros_ec_cec;
 	struct cros_ec_device *cros_ec = cros_ec_cec->cros_ec;
 	struct ec_params_cec_set params = {
 		.cmd = CEC_CMD_ENABLE,
@@ -260,11 +283,55 @@ static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
 
 #endif
 
+static int cros_ec_cec_init_port(struct device *dev,
+				 struct cros_ec_cec *cros_ec_cec,
+				 int port_num, struct device *hdmi_dev,
+				 const char *conn)
+{
+	struct cros_ec_cec_port *port;
+	int ret;
+
+	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	port->cros_ec_cec = cros_ec_cec;
+	port->port_num = port_num;
+
+	port->adap = cec_allocate_adapter(&cros_ec_cec_ops, port, DRV_NAME,
+					  CEC_CAP_DEFAULTS |
+					  CEC_CAP_CONNECTOR_INFO, 1);
+	if (IS_ERR(port->adap))
+		return PTR_ERR(port->adap);
+
+	port->notify = cec_notifier_cec_adap_register(hdmi_dev, conn,
+						      port->adap);
+	if (!port->notify) {
+		ret = -ENOMEM;
+		goto out_probe_adapter;
+	}
+
+	ret = cec_register_adapter(port->adap, dev);
+	if (ret < 0)
+		goto out_probe_notify;
+
+	cros_ec_cec->ports[port_num] = port;
+
+	return 0;
+
+out_probe_notify:
+	cec_notifier_cec_adap_unregister(port->notify, port->adap);
+out_probe_adapter:
+	cec_delete_adapter(port->adap);
+	return ret;
+}
+
 static int cros_ec_cec_probe(struct platform_device *pdev)
 {
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
 	struct cros_ec_cec *cros_ec_cec;
+	struct cros_ec_cec_port *port;
 	struct device *hdmi_dev;
 	const char *conn = NULL;
 	int ret;
@@ -283,18 +350,13 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	cros_ec_cec->adap = cec_allocate_adapter(&cros_ec_cec_ops, cros_ec_cec,
-						 DRV_NAME,
-						 CEC_CAP_DEFAULTS |
-						 CEC_CAP_CONNECTOR_INFO, 1);
-	if (IS_ERR(cros_ec_cec->adap))
-		return PTR_ERR(cros_ec_cec->adap);
+	cros_ec_cec->num_ports = CEC_NUM_PORTS;
 
-	cros_ec_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, conn,
-							     cros_ec_cec->adap);
-	if (!cros_ec_cec->notify) {
-		ret = -ENOMEM;
-		goto out_probe_adapter;
+	for (int i = 0; i < cros_ec_cec->num_ports; i++) {
+		ret = cros_ec_cec_init_port(&pdev->dev, cros_ec_cec, i,
+					    hdmi_dev, conn);
+		if (ret)
+			goto unregister_ports;
 	}
 
 	/* Get CEC events from the EC. */
@@ -303,20 +365,24 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 					       &cros_ec_cec->notifier);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register notifier\n");
-		goto out_probe_notify;
+		goto unregister_ports;
 	}
 
-	ret = cec_register_adapter(cros_ec_cec->adap, &pdev->dev);
-	if (ret < 0)
-		goto out_probe_notify;
-
 	return 0;
 
-out_probe_notify:
-	cec_notifier_cec_adap_unregister(cros_ec_cec->notify,
-					 cros_ec_cec->adap);
-out_probe_adapter:
-	cec_delete_adapter(cros_ec_cec->adap);
+unregister_ports:
+	/*
+	 * Unregister any adapters which have been registered. We don't add the
+	 * port to the array until the adapter has been registered successfully,
+	 * so any non-NULL ports must have been registered.
+	 */
+	for (int i = 0; i < cros_ec_cec->num_ports; i++) {
+		port = cros_ec_cec->ports[i];
+		if (!port)
+			break;
+		cec_notifier_cec_adap_unregister(port->notify, port->adap);
+		cec_unregister_adapter(port->adap);
+	}
 	return ret;
 }
 
@@ -324,6 +390,7 @@ static void cros_ec_cec_remove(struct platform_device *pdev)
 {
 	struct cros_ec_cec *cros_ec_cec = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	struct cros_ec_cec_port *port;
 	int ret;
 
 	/*
@@ -337,9 +404,11 @@ static void cros_ec_cec_remove(struct platform_device *pdev)
 	if (ret)
 		dev_err(dev, "failed to unregister notifier\n");
 
-	cec_notifier_cec_adap_unregister(cros_ec_cec->notify,
-					 cros_ec_cec->adap);
-	cec_unregister_adapter(cros_ec_cec->adap);
+	for (int i = 0; i < cros_ec_cec->num_ports; i++) {
+		port = cros_ec_cec->ports[i];
+		cec_notifier_cec_adap_unregister(port->notify, port->adap);
+		cec_unregister_adapter(port->adap);
+	}
 }
 
 static struct platform_driver cros_ec_cec_driver = {
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index ab721cf13a98..cb2ddd10a613 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4436,6 +4436,8 @@ struct ec_response_i2c_passthru_protect {
  * These commands are for sending and receiving message via HDMI CEC
  */
 
+#define EC_CEC_MAX_PORTS 16
+
 #define MAX_CEC_MSG_LEN 16
 
 /* CEC message from the AP to be written on the CEC bus */
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

