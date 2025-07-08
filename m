Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149EC10A1F
	for <chrome-platform@lists.linux.dev>; Tue,  8 Jul 2025 08:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961767; cv=none; b=jrgO/8a89LT18f+Gtn+x2Prxq4C0ptiI8XCXFpUUns5DAjMJ3nSLez1lPRrGO4lsJ5MYstuDZ+Xx0SDLcF/42RMCd6L7i7Pj3RWKybBZDjbDWcg5MYnL7h3ZNdNcG6n8Y9cotlNB7mhlJZlN+0apThFFTLY0ZxHiWUvVGx675iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961767; c=relaxed/simple;
	bh=kvXShQ/JmyI5zcbp4hspI0YSzBxRWr1XUSMSloX+gQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQay8K5FSpW+TNDV+5NFwvwNUZiU8DJwGiF67/ZTDhKZQ9xVlzFEAg7kbGnPdmKgPI21asJmP0LUwX7BDgu80UHAP0L65OOxIsmNeYec6zPE1QcflNamRgGXbRbKkXdBq3FLVWsNC3+FRpuQLnde43ax0D7vKVYK5LkK7rOnMEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3XtLIT7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3XtLIT7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F84C4CEF0;
	Tue,  8 Jul 2025 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961766;
	bh=kvXShQ/JmyI5zcbp4hspI0YSzBxRWr1XUSMSloX+gQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a3XtLIT78/ywmo7fqqi3jTxNGqJ7x87roEL1plHcKO/ALvPnGpfAO+TVQs0nL1WjG
	 YeO4YCIlf9qpyguMXAHDGHaUdcrMSPlmDUwXzpYuuhaJG590bYp9QP2by7trVh8dyF
	 EdgXspcz7IqO4zE27alRy4Oa2QRBOwp+nCiQfkM2Cl40cdlMIMfCWcZcnhn/XnY2VI
	 loELdPbRfA1v7fElZA7hO6oxl0Ie4TbP96zQ7ClSPxNabG/JK30bP9xLJdwKGFKZY2
	 OSwyJ5FEX0v2deJSqyfzczXM9NJLYN7Re8/ug8e0mYp2bA6u/gML+4M128rtS7LFMG
	 41N+QEBVJckRw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org
Subject: [PATCH v2 3/6] platform/chrome: Disallow sending commands through unregistered ec_dev
Date: Tue,  8 Jul 2025 08:00:31 +0000
Message-ID: <20250708080034.3425427-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250708080034.3425427-1-tzungbi@kernel.org>
References: <20250708080034.3425427-1-tzungbi@kernel.org>
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
New patch in the v2 series.

 drivers/platform/chrome/cros_ec.c           | 6 ++++++
 drivers/platform/chrome/cros_ec_proto.c     | 6 ++++++
 include/linux/platform_data/cros_ec_proto.h | 2 ++
 3 files changed, 14 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 110771a8645e..ea877f44665c 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -200,6 +200,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	if (!ec_dev->dout)
 		return -ENOMEM;
 
+	ec_dev->registered = true;
 	lockdep_register_key(&ec_dev->lockdep_key);
 	mutex_init(&ec_dev->lock);
 	lockdep_set_class(&ec_dev->lock, &ec_dev->lockdep_key);
@@ -300,6 +301,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 
 	return 0;
 exit:
+	ec_dev->registered = false;
 	platform_device_unregister(ec_dev->ec);
 	platform_device_unregister(ec_dev->pd);
 	mutex_destroy(&ec_dev->lock);
@@ -318,6 +320,10 @@ EXPORT_SYMBOL(cros_ec_register);
  */
 void cros_ec_unregister(struct cros_ec_device *ec_dev)
 {
+	mutex_lock(&ec_dev->lock);
+	ec_dev->registered = false;
+	mutex_unlock(&ec_dev->lock);
+
 	platform_device_unregister(ec_dev->pd);
 	platform_device_unregister(ec_dev->ec);
 	mutex_destroy(&ec_dev->lock);
diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 3e94a0a82173..3d657d990c4a 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -657,6 +657,12 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev, struct cros_ec_command *msg)
 	int ret;
 
 	mutex_lock(&ec_dev->lock);
+	if (!ec_dev->registered) {
+		dev_err(ec_dev->dev, "unregistered ec_dev; cannot send command\n");
+		mutex_unlock(&ec_dev->lock);
+		return -ENODEV;
+	}
+
 	if (ec_dev->proto_version == EC_PROTO_VERSION_UNKNOWN) {
 		ret = cros_ec_query_all(ec_dev);
 		if (ret) {
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 3ec24f445c29..2722290688e6 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -122,6 +122,7 @@ struct cros_ec_command {
  * @dout_size: Size of dout buffer to allocate (zero to use static dout).
  * @wake_enabled: True if this device can wake the system from sleep.
  * @suspended: True if this device had been suspended.
+ * @registered: True if this device had been registered.
  * @cmd_xfer: Send command to EC and get response.
  *            Returns the number of bytes received if the communication
  *            succeeded, but that doesn't mean the EC was happy with the
@@ -180,6 +181,7 @@ struct cros_ec_device {
 	int dout_size;
 	bool wake_enabled;
 	bool suspended;
+	bool registered;
 	int (*cmd_xfer)(struct cros_ec_device *ec,
 			struct cros_ec_command *msg);
 	int (*pkt_xfer)(struct cros_ec_device *ec,
-- 
2.50.0.727.gbf7dc18ff4-goog

