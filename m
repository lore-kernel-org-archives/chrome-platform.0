Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B09320B7E1
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073123; cv=none; b=AG1745qyv1D331LhcUWg0sYoAKu4HhR47/SG+ze4iakSr/AEbwy6nMccB4MUMFi4bzc/MtKfXGfbngcG8885urEXaDPZbCNBXVAd2gov+zzo5C59c4JkxNqd0hqP+nrhZ7QstEwfoxwEQFSmNhIvc0NJcshUd1NsLprVmKHfo2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073123; c=relaxed/simple;
	bh=qktmxo/e1SfRCvfWE+Q6j6sz+Bca3YiN2ZNRmvyOJ9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lafUhbu6FJWa41K/r28taG+OJthClpWD+3kFx04JRBiRsQMnLL+jrr7qPgeXS6/jdiaZobqwBW4X1SO9xB8Wnpt+M7k6/ZoE/20ZNiBD2hRh2++6CbK6WGXKo2F6ov6xuS0/qBfVA7JS/10bqeOK4HDsnAQaFrLBZGKiVI8VgIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbaIn+wY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbaIn+wY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A11C4CEFC;
	Mon, 21 Jul 2025 04:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073123;
	bh=qktmxo/e1SfRCvfWE+Q6j6sz+Bca3YiN2ZNRmvyOJ9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LbaIn+wYh3dy0Fe6QdGdolO/RNjAuUjdbFFNLoTEm81hkB+5P5WqZN3ZWM2Ohkvx3
	 mjtY8Qk5zlJEP6shfp+tPJ9uXpTHVCJXOc4ndldjVr9Qbu0isTAMWkrPuxgFlEOWou
	 LuKwoIa9+85xWUeRO0hKXzG6j1yqovWN1+nnRxr6LsIyJBqv/z1aHILIfa2I94o7/7
	 YxM/N5XJM7yHkNKjChnnmecj3tzVgJKSiSVDQ1mVS+rFJW5bK5UQy+VUmjDgisIGyA
	 M2pre2E5nzD7vWs6yZsnkwp7zJ8LbQQSk1Q6Y4XCf8glcNj76lyiKazx1lKKcwCWqY
	 gARoEdyFY6xjg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 3/8] platform/chrome: cros_ec_chardev: Decouple fops from struct cros_ec_dev
Date: Mon, 21 Jul 2025 04:44:51 +0000
Message-ID: <20250721044456.2736300-4-tzungbi@kernel.org>
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

The fops doesn't really need to hold a reference to struct cros_ec_dev.
Remove the references from the fops.

No functional changes.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No changes since v2 (https://patchwork.kernel.org/project/chrome-platform/patch/20250708080034.3425427-3-tzungbi@kernel.org/).

 drivers/platform/chrome/cros_ec_chardev.c | 44 +++++++++++------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 5c858d30dd52..c9d80ad5b57e 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -32,12 +32,13 @@
 #define CROS_MAX_EVENT_LEN	PAGE_SIZE
 
 struct chardev_priv {
-	struct cros_ec_dev *ec_dev;
+	struct cros_ec_device *ec_dev;
 	struct notifier_block notifier;
 	wait_queue_head_t wait_event;
 	unsigned long event_mask;
 	struct list_head events;
 	size_t event_len;
+	u16 cmd_offset;
 };
 
 struct ec_event {
@@ -47,7 +48,7 @@ struct ec_event {
 	u8 data[];
 };
 
-static int ec_get_version(struct cros_ec_dev *ec, char *str, int maxlen)
+static int ec_get_version(struct chardev_priv *priv, char *str, int maxlen)
 {
 	static const char * const current_image_name[] = {
 		"unknown", "read-only", "read-write", "invalid",
@@ -60,10 +61,10 @@ static int ec_get_version(struct cros_ec_dev *ec, char *str, int maxlen)
 	if (!msg)
 		return -ENOMEM;
 
-	msg->command = EC_CMD_GET_VERSION + ec->cmd_offset;
+	msg->command = EC_CMD_GET_VERSION + priv->cmd_offset;
 	msg->insize = sizeof(*resp);
 
-	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
+	ret = cros_ec_cmd_xfer_status(priv->ec_dev, msg);
 	if (ret < 0) {
 		snprintf(str, maxlen,
 			 "Unknown EC version, returned error: %d\n",
@@ -91,7 +92,7 @@ static int cros_ec_chardev_mkbp_event(struct notifier_block *nb,
 {
 	struct chardev_priv *priv = container_of(nb, struct chardev_priv,
 						 notifier);
-	struct cros_ec_device *ec_dev = priv->ec_dev->ec_dev;
+	struct cros_ec_device *ec_dev = priv->ec_dev;
 	struct ec_event *event;
 	unsigned long event_bit = 1 << ec_dev->event_data.event_type;
 	int total_size = sizeof(*event) + ec_dev->event_size;
@@ -156,7 +157,8 @@ static struct ec_event *cros_ec_chardev_fetch_event(struct chardev_priv *priv,
 static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 {
 	struct miscdevice *mdev = filp->private_data;
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(mdev->parent);
+	struct cros_ec_dev *ec = dev_get_drvdata(mdev->parent);
+	struct cros_ec_device *ec_dev = ec->ec_dev;
 	struct chardev_priv *priv;
 	int ret;
 
@@ -165,13 +167,14 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 		return -ENOMEM;
 
 	priv->ec_dev = ec_dev;
+	priv->cmd_offset = ec->cmd_offset;
 	filp->private_data = priv;
 	INIT_LIST_HEAD(&priv->events);
 	init_waitqueue_head(&priv->wait_event);
 	nonseekable_open(inode, filp);
 
 	priv->notifier.notifier_call = cros_ec_chardev_mkbp_event;
-	ret = blocking_notifier_chain_register(&ec_dev->ec_dev->event_notifier,
+	ret = blocking_notifier_chain_register(&ec_dev->event_notifier,
 					       &priv->notifier);
 	if (ret) {
 		dev_err(ec_dev->dev, "failed to register event notifier\n");
@@ -199,7 +202,6 @@ static ssize_t cros_ec_chardev_read(struct file *filp, char __user *buffer,
 	char msg[sizeof(struct ec_response_get_version) +
 		 sizeof(CROS_EC_DEV_VERSION)];
 	struct chardev_priv *priv = filp->private_data;
-	struct cros_ec_dev *ec_dev = priv->ec_dev;
 	size_t count;
 	int ret;
 
@@ -233,7 +235,7 @@ static ssize_t cros_ec_chardev_read(struct file *filp, char __user *buffer,
 	if (*offset != 0)
 		return 0;
 
-	ret = ec_get_version(ec_dev, msg, sizeof(msg));
+	ret = ec_get_version(priv, msg, sizeof(msg));
 	if (ret)
 		return ret;
 
@@ -249,10 +251,10 @@ static ssize_t cros_ec_chardev_read(struct file *filp, char __user *buffer,
 static int cros_ec_chardev_release(struct inode *inode, struct file *filp)
 {
 	struct chardev_priv *priv = filp->private_data;
-	struct cros_ec_dev *ec_dev = priv->ec_dev;
+	struct cros_ec_device *ec_dev = priv->ec_dev;
 	struct ec_event *event, *e;
 
-	blocking_notifier_chain_unregister(&ec_dev->ec_dev->event_notifier,
+	blocking_notifier_chain_unregister(&ec_dev->event_notifier,
 					   &priv->notifier);
 
 	list_for_each_entry_safe(event, e, &priv->events, node) {
@@ -267,7 +269,7 @@ static int cros_ec_chardev_release(struct inode *inode, struct file *filp)
 /*
  * Ioctls
  */
-static long cros_ec_chardev_ioctl_xcmd(struct cros_ec_dev *ec, void __user *arg)
+static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *arg)
 {
 	struct cros_ec_command *s_cmd;
 	struct cros_ec_command u_cmd;
@@ -296,8 +298,8 @@ static long cros_ec_chardev_ioctl_xcmd(struct cros_ec_dev *ec, void __user *arg)
 		goto exit;
 	}
 
-	s_cmd->command += ec->cmd_offset;
-	ret = cros_ec_cmd_xfer(ec->ec_dev, s_cmd);
+	s_cmd->command += priv->cmd_offset;
+	ret = cros_ec_cmd_xfer(priv->ec_dev, s_cmd);
 	/* Only copy data to userland if data was received. */
 	if (ret < 0)
 		goto exit;
@@ -309,10 +311,9 @@ static long cros_ec_chardev_ioctl_xcmd(struct cros_ec_dev *ec, void __user *arg)
 	return ret;
 }
 
-static long cros_ec_chardev_ioctl_readmem(struct cros_ec_dev *ec,
-					   void __user *arg)
+static long cros_ec_chardev_ioctl_readmem(struct chardev_priv *priv, void __user *arg)
 {
-	struct cros_ec_device *ec_dev = ec->ec_dev;
+	struct cros_ec_device *ec_dev = priv->ec_dev;
 	struct cros_ec_readmem s_mem = { };
 	long num;
 
@@ -341,16 +342,15 @@ static long cros_ec_chardev_ioctl(struct file *filp, unsigned int cmd,
 				   unsigned long arg)
 {
 	struct chardev_priv *priv = filp->private_data;
-	struct cros_ec_dev *ec = priv->ec_dev;
 
 	if (_IOC_TYPE(cmd) != CROS_EC_DEV_IOC)
 		return -ENOTTY;
 
 	switch (cmd) {
 	case CROS_EC_DEV_IOCXCMD:
-		return cros_ec_chardev_ioctl_xcmd(ec, (void __user *)arg);
+		return cros_ec_chardev_ioctl_xcmd(priv, (void __user *)arg);
 	case CROS_EC_DEV_IOCRDMEM:
-		return cros_ec_chardev_ioctl_readmem(ec, (void __user *)arg);
+		return cros_ec_chardev_ioctl_readmem(priv, (void __user *)arg);
 	case CROS_EC_DEV_IOCEVENTMASK:
 		priv->event_mask = arg;
 		return 0;
@@ -372,8 +372,8 @@ static const struct file_operations chardev_fops = {
 
 static int cros_ec_chardev_probe(struct platform_device *pdev)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
-	struct cros_ec_platform *ec_platform = dev_get_platdata(ec_dev->dev);
+	struct cros_ec_dev *ec = dev_get_drvdata(pdev->dev.parent);
+	struct cros_ec_platform *ec_platform = dev_get_platdata(ec->dev);
 	struct miscdevice *misc;
 
 	/* Create a char device: we want to create it anew */
-- 
2.50.0.727.gbf7dc18ff4-goog

