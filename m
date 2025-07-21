Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D62DF49
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073124; cv=none; b=NOWztBMsgNWKrLTG4MZDKfqSPxk01VVlpAkr7BRCXmUHb1R3jOmVRGLaFdxYZ3SSAxt+GXEyso5sS9RDFK8tIsqJTJi+wuP8Tp/rCOY4n0U5P95pdHTLXTvI4p3e01f/FFQwyEBdfFu0f3YvjVYvmV6NaqvrMIBxKI8CAA9NApY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073124; c=relaxed/simple;
	bh=Z3N4D5pEIvVYMUsOykIVfjzFC7s7QuG8/aH/+r9mbkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=urFjevm2NORdNYSSGA0IRmYzFRuNJOyE4+Hk/hcg0np3ueXiFMmxsU8lZsdqf2S9I3XEc2Y0Sh5tBISLGMstLFlXh+XLlNmwVoW9udSoa3zmBlU/LNfqxHQYzc8N0LWMM0PrNIxGGDDdhqVLsuGuaK366KWtim7wcxk2HmqUvXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wjd2tFg0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wjd2tFg0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DE7C4CEF4;
	Mon, 21 Jul 2025 04:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073124;
	bh=Z3N4D5pEIvVYMUsOykIVfjzFC7s7QuG8/aH/+r9mbkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wjd2tFg0o83eYJlqfQQUxlvRD1TUKHtGy9yzyHnO6CVzl4KwGhgozSHispMl4jIV6
	 gH/0LlTssQyPskv78FwpTAkiKocKRr6napruc1YqGxD/6k9oMWA/tQiB/NGHx97ZBv
	 je+I/VpF55k1dekssrIhLoRFU+2eBjfu0ATrgY0VTU8Mm4azjBxPNU0a7xLPZi5jSK
	 BOg55OtEyV9NMj0EEIwkFwtvtt0yawWtQggpw4YcpEZmJDRdjuKqySqZtHveIZFg91
	 hMZTj1mXlERZS7vt+ZEBzEPX0OwKorJAXFXlJYfK8lX1Np/lY9beAvsC+2KU+HvcsI
	 bcHWRKhgI9OXQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 4/8] platform/chrome: Disallow sending commands through unregistered ec_dev
Date: Mon, 21 Jul 2025 04:44:52 +0000
Message-ID: <20250721044456.2736300-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250721044456.2736300-1-tzungbi@kernel.org>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return earlier if attempting to send commands through an unregistered
struct cros_ec_device.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v2 (https://patchwork.kernel.org/project/chrome-platform/patch/20250708080034.3425427-4-tzungbi@kernel.org/):
- Use atomic_t for `registered` so that it doesn't need to be handled with
  locks.
- Add new helper function cros_ec_device_registered().

 drivers/platform/chrome/cros_ec.c           |  5 +++++
 drivers/platform/chrome/cros_ec_proto.c     | 17 +++++++++++++++++
 include/linux/platform_data/cros_ec_proto.h |  4 ++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index fd58781a2fb7..42512e2b4f65 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -9,6 +9,7 @@
  * battery charging and regulator control, firmware update.
  */
 
+#include <linux/atomic.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -200,6 +201,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	if (!ec_dev->dout)
 		return -ENOMEM;
 
+	atomic_set(&ec_dev->registered, 1);
 	lockdep_register_key(&ec_dev->lockdep_key);
 	mutex_init(&ec_dev->lock);
 	lockdep_set_class(&ec_dev->lock, &ec_dev->lockdep_key);
@@ -300,6 +302,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 
 	return 0;
 exit:
+	atomic_set(&ec_dev->registered, 0);
 	platform_device_unregister(ec_dev->ec);
 	platform_device_unregister(ec_dev->pd);
 	mutex_destroy(&ec_dev->lock);
@@ -318,6 +321,8 @@ EXPORT_SYMBOL(cros_ec_register);
  */
 void cros_ec_unregister(struct cros_ec_device *ec_dev)
 {
+	atomic_set(&ec_dev->registered, 0);
+
 	if (ec_dev->mkbp_event_supported)
 		blocking_notifier_chain_unregister(&ec_dev->event_notifier,
 						   &ec_dev->notifier_ready);
diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 3e94a0a82173..ee3050ffe226 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -3,6 +3,7 @@
 //
 // Copyright (C) 2015 Google, Inc
 
+#include <linux/atomic.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/limits.h>
@@ -656,6 +657,11 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
 {
 	int ret;
 
+	if (!cros_ec_device_registered(ec_dev)) {
+		dev_err(ec_dev->dev, "unregistered ec_dev; cannot send command\n");
+		return -ENODEV;
+	}
+
 	mutex_lock(&ec_dev->lock);
 	if (ec_dev->proto_version == EC_PROTO_VERSION_UNKNOWN) {
 		ret = cros_ec_query_all(ec_dev);
@@ -1153,5 +1159,16 @@ int cros_ec_get_cmd_versions(struct cros_ec_device *ec_dev, u16 cmd)
 }
 EXPORT_SYMBOL_GPL(cros_ec_get_cmd_versions);
 
+/**
+ * cros_ec_device_registered - Check if the ec_dev is registered.
+ *
+ * @ec_dev: EC device
+ */
+bool cros_ec_device_registered(struct cros_ec_device *ec_dev)
+{
+	return atomic_read(&ec_dev->registered) == 1;
+}
+EXPORT_SYMBOL_GPL(cros_ec_device_registered);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("ChromeOS EC communication protocol helpers");
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 3ec24f445c29..9ab83a8318ce 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -122,6 +122,7 @@ struct cros_ec_command {
  * @dout_size: Size of dout buffer to allocate (zero to use static dout).
  * @wake_enabled: True if this device can wake the system from sleep.
  * @suspended: True if this device had been suspended.
+ * @registered: 1 if this device had been registered; otherwise 0.
  * @cmd_xfer: Send command to EC and get response.
  *            Returns the number of bytes received if the communication
  *            succeeded, but that doesn't mean the EC was happy with the
@@ -180,6 +181,7 @@ struct cros_ec_device {
 	int dout_size;
 	bool wake_enabled;
 	bool suspended;
+	atomic_t registered;
 	int (*cmd_xfer)(struct cros_ec_device *ec,
 			struct cros_ec_command *msg);
 	int (*pkt_xfer)(struct cros_ec_device *ec,
@@ -272,6 +274,8 @@ int cros_ec_cmd_readmem(struct cros_ec_device *ec_dev, u8 offset, u8 size, void
 
 int cros_ec_get_cmd_versions(struct cros_ec_device *ec_dev, u16 cmd);
 
+bool cros_ec_device_registered(struct cros_ec_device *ec_dev);
+
 /**
  * cros_ec_get_time_ns() - Return time in ns.
  *
-- 
2.50.0.727.gbf7dc18ff4-goog

