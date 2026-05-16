Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8041EA7DB;
	Sat, 16 May 2026 14:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941841; cv=none; b=qLSPYtr8/Y+vv7mg+kiAU0Wzhj6oLyvr47vvVijJQANWQVlfOxjk6dtflIbn/wbsKHbQGRyxhAbCnHrG8nijRGU58Kmv7H2fHD2G2/9eLb0BfzMC7Wc9McTOVVuuKgeNrGBtbLW8XRXVkb8CF5Y2RlkPneC1TpKI5qndFnNKVsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941841; c=relaxed/simple;
	bh=+VmfiZN2bHst+5NOjkKuH+N2dM9CR9Nbis0U7S/zB+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSYMEQmvDap/sOqKZr07OdwMHMQgmZKEbH32DTrkaUn14VsigmUFRv92xif53VZqKCM93zfrpqf7Fy6kqI6u/1XtiGBeAJnnv8k8VvAxdX6EzX9Xu4d0fEr100A2FcD7u62iQJET/N2f7btvAZEyN0m1a/oZXnXYI99Kh4atw6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qB5ABzTi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qB5ABzTi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AF6C2BCC9;
	Sat, 16 May 2026 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778941838;
	bh=+VmfiZN2bHst+5NOjkKuH+N2dM9CR9Nbis0U7S/zB+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qB5ABzTiFPNrlzt/Oj1uoouvvVQdPGyK1kYJEwbYBm0ZBabz2am3GU35k11uFVAZV
	 Qxy0mHUyPd70SOAaJGlB72XSQkQC7MOiKm0ELi4dIJ7uKqOGX7qsuYEeXB9U205BSb
	 wrwx237QL95jX5ps0oAftLMDr7z5HIIv+0wbM4N5eeu2R3UkI3fnNZF/TZJEXJcg7O
	 HsJkjWwNz7x3/GUMujjinw/fErMNX1DXXPIZrmxY5rJFdfWkoL4o/BJdod5PsWlfvv
	 u4oFRUi2wkTs2VzggrL6Ae1BMc0fNKrrv0fClf8vX91tZcv8PpCvjWVq6iO0D958LF
	 /WTysOvgJF/Vg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] platform/chrome: cros_ec_chardev: Introduce rwsem for protecting ec_dev
Date: Sat, 16 May 2026 22:30:17 +0800
Message-ID: <20260516143017.18560-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260516143017.18560-1-tzungbi@kernel.org>
References: <20260516143017.18560-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a rwsem for protecting `ec_dev` to prevent Use-After-Free on
the `ec_dev`.

- Writers: In driver's probe() and remove().
- Readers: In file operations.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- New to the series.

v1: Doesn't exist.

 drivers/platform/chrome/cros_ec_chardev.c | 68 +++++++++++++++++------
 1 file changed, 52 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 7e046fc56998..450f79759122 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -23,6 +23,7 @@
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
+#include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -38,6 +39,7 @@
 struct chardev_pdata {
 	struct miscdevice misc;
 	struct kref kref;
+	struct rw_semaphore ec_dev_sem;
 	struct cros_ec_device *ec_dev;
 	u16 cmd_offset;
 	struct blocking_notifier_head subscribers;
@@ -94,12 +96,19 @@ static int ec_get_version(struct chardev_priv *priv, char *str, int maxlen)
 	msg->command = EC_CMD_GET_VERSION + priv->pdata->cmd_offset;
 	msg->insize = sizeof(*resp);
 
-	ret = cros_ec_cmd_xfer_status(priv->pdata->ec_dev, msg);
-	if (ret < 0) {
-		snprintf(str, maxlen,
-			 "Unknown EC version, returned error: %d\n",
-			 msg->result);
-		goto exit;
+	scoped_guard(rwsem_read, &priv->pdata->ec_dev_sem) {
+		if (!priv->pdata->ec_dev) {
+			ret = -ENODEV;
+			goto exit;
+		}
+
+		ret = cros_ec_cmd_xfer_status(priv->pdata->ec_dev, msg);
+		if (ret < 0) {
+			snprintf(str, maxlen,
+				 "Unknown EC version, returned error: %d\n",
+				 msg->result);
+			goto exit;
+		}
 	}
 
 	resp = (struct ec_response_get_version *)msg->data;
@@ -122,10 +131,18 @@ static int cros_ec_chardev_mkbp_event(struct notifier_block *nb,
 {
 	struct chardev_priv *priv = container_of(nb, struct chardev_priv,
 						 notifier);
-	struct cros_ec_device *ec_dev = priv->pdata->ec_dev;
+	struct cros_ec_device *ec_dev;
 	struct ec_event *event;
-	unsigned long event_bit = 1 << ec_dev->event_data.event_type;
-	int total_size = sizeof(*event) + ec_dev->event_size;
+	unsigned long event_bit;
+	int total_size;
+
+	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
+	if (!priv->pdata->ec_dev)
+		return NOTIFY_DONE;
+	ec_dev = priv->pdata->ec_dev;
+
+	event_bit = 1 << ec_dev->event_data.event_type;
+	total_size = sizeof(*event) + ec_dev->event_size;
 
 	if (!(event_bit & priv->event_mask) ||
 	    (priv->event_len + total_size) > CROS_MAX_EVENT_LEN)
@@ -206,8 +223,11 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 	ret = blocking_notifier_chain_register(&pdata->subscribers,
 					       &priv->notifier);
 	if (ret) {
-		dev_err(pdata->ec_dev->dev,
-			"failed to register event notifier\n");
+		scoped_guard(rwsem_read, &pdata->ec_dev_sem) {
+			if (pdata->ec_dev)
+				dev_err(pdata->ec_dev->dev,
+					"failed to register event notifier\n");
+		}
 		kref_put(&priv->pdata->kref, chardev_pdata_release);
 		kfree(priv);
 	}
@@ -330,10 +350,18 @@ static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *a
 	}
 
 	s_cmd->command += priv->pdata->cmd_offset;
-	ret = cros_ec_cmd_xfer(priv->pdata->ec_dev, s_cmd);
-	/* Only copy data to userland if data was received. */
-	if (ret < 0)
-		goto exit;
+
+	scoped_guard(rwsem_read, &priv->pdata->ec_dev_sem) {
+		if (!priv->pdata->ec_dev) {
+			ret = -ENODEV;
+			goto exit;
+		}
+
+		ret = cros_ec_cmd_xfer(priv->pdata->ec_dev, s_cmd);
+		/* Only copy data to userland if data was received. */
+		if (ret < 0)
+			goto exit;
+	}
 
 	if (copy_to_user(arg, s_cmd, sizeof(*s_cmd) + s_cmd->insize))
 		ret = -EFAULT;
@@ -344,10 +372,15 @@ static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *a
 
 static long cros_ec_chardev_ioctl_readmem(struct chardev_priv *priv, void __user *arg)
 {
-	struct cros_ec_device *ec_dev = priv->pdata->ec_dev;
+	struct cros_ec_device *ec_dev;
 	struct cros_ec_readmem s_mem = { };
 	long num;
 
+	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
+	if (!priv->pdata->ec_dev)
+		return -ENODEV;
+	ec_dev = priv->pdata->ec_dev;
+
 	/* Not every platform supports direct reads */
 	if (!ec_dev->cmd_readmem)
 		return -ENOTTY;
@@ -414,6 +447,7 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pdata);
 	kref_init(&pdata->kref);
+	init_rwsem(&pdata->ec_dev_sem);
 	pdata->ec_dev = ec->ec_dev;
 	pdata->cmd_offset = ec->cmd_offset;
 	BLOCKING_INIT_NOTIFIER_HEAD(&pdata->subscribers);
@@ -451,6 +485,8 @@ static void cros_ec_chardev_remove(struct platform_device *pdev)
 
 	blocking_notifier_chain_unregister(&pdata->ec_dev->event_notifier,
 					   &pdata->relay);
+	scoped_guard(rwsem_write, &pdata->ec_dev_sem)
+		pdata->ec_dev = NULL;
 	misc_deregister(&pdata->misc);
 	kref_put(&pdata->kref, chardev_pdata_release);
 }
-- 
2.51.0

