Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F7340DFDF;
	Mon, 27 Apr 2026 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297673; cv=none; b=hFzLLlXkSfS2xWXg2KBAufqTeieUjHf25bxRQeIuMamwuIiDsD/0ByBZnf7qjzd3TwwUSWtFz+e6sb27Vn1bRlY5ejNCB3TRLJnedQDERA4S5rLAvObvceVJ7SIFg6o1njxjTj9RH+puX3Pc2VjYab99VgCMzVsHRgAODwpzTVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297673; c=relaxed/simple;
	bh=THXG6dCEWQOLj4JzTbpzVn+Zl7+CynI0QspgzGj9O88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1jWqtYThEzvytHeAKtXpLUfbp3hrJf6SvH/6n0D55Z5bLAJZ1b7taO0a7aDOVUXAM52e3iiGgMIE63BSCc7CXDrWD6Pv3mwn5mtCgJgawLz/+2gWz3MQHpHrxzvcI8FNgeLLRk49legmyjvTlUvs7+BrqOEerNfjbjwZLTug2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRpcZYl2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRpcZYl2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2F7C2BCB7;
	Mon, 27 Apr 2026 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297673;
	bh=THXG6dCEWQOLj4JzTbpzVn+Zl7+CynI0QspgzGj9O88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VRpcZYl2N3blY64EdC94mtsHwT247xSG1ZwrSyzzZb+kUThn0PXXCjEGvf2JOBU5K
	 T0xAmyInOMRgpuF+5O4mJtzNOQD8bTRkIR2sRfTyPlTEqoSvc+uJFvt31FAJiNPzKV
	 nT/YK5W1SpCfwc2338nsPX9JqZgewPCJZ5HmZZbPNP1sfpbCMqcPPKDiJAZ16Ol5Pz
	 /jIwLcwfbfyiEy+MXjrgJuWViE/6cOp3xzYM1iEIVRtgUv86HaYnm3h6XMwoRPy+Lk
	 GEfPt7AeY8E+BxeW8urdC/kx2sVx1XxHKGjN8o0x0ZTRkuRNhxk8fNR4YxoyBQf4To
	 Ck+mmazxyPMdA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 6/8] platform/chrome: cros_ec_chardev: Move data to chardev_pdata
Date: Mon, 27 Apr 2026 21:46:57 +0800
Message-ID: <20260427134659.95181-7-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427134659.95181-1-tzungbi@kernel.org>
References: <20260427134659.95181-1-tzungbi@kernel.org>
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

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
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
2.51.0

