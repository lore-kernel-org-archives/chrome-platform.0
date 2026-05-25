Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892BE3431EF;
	Mon, 25 May 2026 05:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779686846; cv=none; b=lcXuySpD7bEZuLDb15fHOATWAqyAZ8QZAfd7z54PI+AapavpH0LgFuTe8RkFYNJDUXJoAT2oHnZGm/099AksG+dBwi5qzx6bWuoxg0/S5ADJUzz8SWfvt1j1KWrm4qlM9wsQ/QJhPLAMdjOfwMn1TXBfmOUERp648J59257QsK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779686846; c=relaxed/simple;
	bh=3us29TQ77rkZK+cVHysBXN3kPHuJOCtSgz0hNQs7npo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=flFnDWoPZUFPf0YnZiBn8pR8LXjys3efUAal0PAHFxSdevWHc7a4cVMSgn/5HrDZUrU9XATN1gCUDEIbaeNexgqvjRGS3iizKbMmgLfo8m+ZEIKGErnw2xdrFjW2oYifS5Fv2fb/OpjpkicMpzXJiFzhJmIrcTLHHJWFgzGGKjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCltEGcm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCltEGcm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422321F000E9;
	Mon, 25 May 2026 05:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779686845;
	bh=bapOEE4PpzBO+X8Jg/4GtBzobTPTAhVIWjSBLXLzaHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KCltEGcmRuj5Hg3fv7mZ9OyT2t3ufiyB2p42aD6UuPRjncArJ8cCxCe+QGJ0Bhs6h
	 Bj4iN5vK4nLLaLTLAa30igE8X097QgF23B7uOzyxfe7ndiD9VtGdr2aZqFdJKLHhzb
	 bcLyP/Ax8sb8yVC6dovqvfI+CdgUv/YWCE2wklakFyTvowyL7JkwjxHY7FZYlWSC8+
	 KBDHZYAEAMbEtyc5qAJlwb974h5GfeWeheG4/vfhm+tHpWn5cQyV31/CVSwo8y1Wtk
	 gv14wJucJGCA0oUTwHGkads+xk/8eEz8mr+sQZ1F2RAyqAXqoQT2k7IJ4c13W8VIwU
	 wBzzfWQdJ04IQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] platform/chrome: cros_ec_chardev: Move data to chardev_pdata
Date: Mon, 25 May 2026 05:26:52 +0000
Message-ID: <20260525052654.4076429-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
In-Reply-To: <20260525052654.4076429-1-tzungbi@kernel.org>
References: <20260525052654.4076429-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move `ec_dev` and `cmd_offset` from `chardev_priv` to `chardev_pdata` as
they are per-device properties but not per-open-file properties.

Hold a reference to `chardev_pdata` for each open file to ensure the
data remains valid even if the underlying platform device is removed.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- Add R-b tag.

v2:
- No changes.

v1: https://lore.kernel.org/all/20260427134659.95181-7-tzungbi@kernel.org

 drivers/platform/chrome/cros_ec_chardev.c | 36 +++++++++++++----------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index e7012e44a006..352d61a2f3c6 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -38,6 +38,8 @@
 struct chardev_pdata {
 	struct miscdevice misc;
 	struct kref kref;
+	struct cros_ec_device *ec_dev;
+	u16 cmd_offset;
 };
 
 static void chardev_pdata_release(struct kref *kref)
@@ -48,13 +50,12 @@ static void chardev_pdata_release(struct kref *kref)
 }
 
 struct chardev_priv {
-	struct cros_ec_device *ec_dev;
 	struct notifier_block notifier;
 	wait_queue_head_t wait_event;
 	unsigned long event_mask;
 	struct list_head events;
 	size_t event_len;
-	u16 cmd_offset;
+	struct chardev_pdata *pdata;
 };
 
 struct ec_event {
@@ -77,10 +78,10 @@ static int ec_get_version(struct chardev_priv *priv, char *str, int maxlen)
 	if (!msg)
 		return -ENOMEM;
 
-	msg->command = EC_CMD_GET_VERSION + priv->cmd_offset;
+	msg->command = EC_CMD_GET_VERSION + priv->pdata->cmd_offset;
 	msg->insize = sizeof(*resp);
 
-	ret = cros_ec_cmd_xfer_status(priv->ec_dev, msg);
+	ret = cros_ec_cmd_xfer_status(priv->pdata->ec_dev, msg);
 	if (ret < 0) {
 		snprintf(str, maxlen,
 			 "Unknown EC version, returned error: %d\n",
@@ -108,7 +109,7 @@ static int cros_ec_chardev_mkbp_event(struct notifier_block *nb,
 {
 	struct chardev_priv *priv = container_of(nb, struct chardev_priv,
 						 notifier);
-	struct cros_ec_device *ec_dev = priv->ec_dev;
+	struct cros_ec_device *ec_dev = priv->pdata->ec_dev;
 	struct ec_event *event;
 	unsigned long event_bit = 1 << ec_dev->event_data.event_type;
 	int total_size = sizeof(*event) + ec_dev->event_size;
@@ -173,8 +174,7 @@ static struct ec_event *cros_ec_chardev_fetch_event(struct chardev_priv *priv,
 static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 {
 	struct miscdevice *mdev = filp->private_data;
-	struct cros_ec_dev *ec = dev_get_drvdata(mdev->parent);
-	struct cros_ec_device *ec_dev = ec->ec_dev;
+	struct chardev_pdata *pdata = container_of(mdev, typeof(*pdata), misc);
 	struct chardev_priv *priv;
 	int ret;
 
@@ -182,18 +182,20 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->ec_dev = ec_dev;
-	priv->cmd_offset = ec->cmd_offset;
+	priv->pdata = pdata;
+	kref_get(&pdata->kref);
 	filp->private_data = priv;
 	INIT_LIST_HEAD(&priv->events);
 	init_waitqueue_head(&priv->wait_event);
 	nonseekable_open(inode, filp);
 
 	priv->notifier.notifier_call = cros_ec_chardev_mkbp_event;
-	ret = blocking_notifier_chain_register(&ec_dev->event_notifier,
+	ret = blocking_notifier_chain_register(&pdata->ec_dev->event_notifier,
 					       &priv->notifier);
 	if (ret) {
-		dev_err(ec_dev->dev, "failed to register event notifier\n");
+		dev_err(pdata->ec_dev->dev,
+			"failed to register event notifier\n");
+		kref_put(&priv->pdata->kref, chardev_pdata_release);
 		kfree(priv);
 	}
 
@@ -267,11 +269,11 @@ static ssize_t cros_ec_chardev_read(struct file *filp, char __user *buffer,
 static int cros_ec_chardev_release(struct inode *inode, struct file *filp)
 {
 	struct chardev_priv *priv = filp->private_data;
-	struct cros_ec_device *ec_dev = priv->ec_dev;
 	struct ec_event *event, *e;
 
-	blocking_notifier_chain_unregister(&ec_dev->event_notifier,
+	blocking_notifier_chain_unregister(&priv->pdata->ec_dev->event_notifier,
 					   &priv->notifier);
+	kref_put(&priv->pdata->kref, chardev_pdata_release);
 
 	list_for_each_entry_safe(event, e, &priv->events, node) {
 		list_del(&event->node);
@@ -314,8 +316,8 @@ static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *a
 		goto exit;
 	}
 
-	s_cmd->command += priv->cmd_offset;
-	ret = cros_ec_cmd_xfer(priv->ec_dev, s_cmd);
+	s_cmd->command += priv->pdata->cmd_offset;
+	ret = cros_ec_cmd_xfer(priv->pdata->ec_dev, s_cmd);
 	/* Only copy data to userland if data was received. */
 	if (ret < 0)
 		goto exit;
@@ -329,7 +331,7 @@ static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *a
 
 static long cros_ec_chardev_ioctl_readmem(struct chardev_priv *priv, void __user *arg)
 {
-	struct cros_ec_device *ec_dev = priv->ec_dev;
+	struct cros_ec_device *ec_dev = priv->pdata->ec_dev;
 	struct cros_ec_readmem s_mem = { };
 	long num;
 
@@ -399,6 +401,8 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pdata);
 	kref_init(&pdata->kref);
+	pdata->ec_dev = ec->ec_dev;
+	pdata->cmd_offset = ec->cmd_offset;
 
 	pdata->misc.minor = MISC_DYNAMIC_MINOR;
 	pdata->misc.fops = &chardev_fops;
-- 
2.54.0.794.g4f17f83d09-goog

