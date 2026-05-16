Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3272C27FD51;
	Sat, 16 May 2026 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941837; cv=none; b=nHLkIh/gCSty0b3ZiV/1CfG/EEhJArUl269c/wfHMtUZ4k3Hn0+SC3wNzoag8L8b7DJDQPqEQ8dXe6fFXgiRtp2JhtnpydKRbNNkOPCz9I6RSWdglcGD5Dp8k+M+oBFMyOEzRFUX9TwIRa4jflGZt5p3XEQD+87XGqz33w8nfvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941837; c=relaxed/simple;
	bh=XZSsGTNI11K6aBtp7x0IktNr37oxC/+W8z0Aa/axUk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVNQTy1OCRMPBHaDmxgfPGfimEfSL42wKI3rbaa9/bATJ1pABGKZC6ulgERB0CZieljXN2hhvO8+JtYKer8T17ncSxWmag7QuG0LuJbY/7VKIJqfTdISskKO+iz5I7zZdPUFJ0SspI9tYQNg4Y4lPhRQQGHazT1m/eescn0TNSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9h9VHkn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9h9VHkn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E698C2BCB3;
	Sat, 16 May 2026 14:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778941836;
	bh=XZSsGTNI11K6aBtp7x0IktNr37oxC/+W8z0Aa/axUk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T9h9VHknKfpehH7oV1jMjgxduBZ76vSuPcA3eZdjydXQoVXtEFVZPkhj3WpcowHGb
	 BiKFms9UIbdieBaI7+tHGCaAO+7dv7fl1Kz83fe0dPYRRasm1Ykm3viEZbw2OOpXUR
	 rBACKlOIpTVXgVKIjsK++eyiVyTxrkEAH8mKwX91Ts2VJ+Go19XcEQflhPnQpqvtdj
	 Y5FwZWAHtWO+pwfr9OoveyNOJo7cEWptbyh9Z5sv1o0J7Uz9atfENyFc5ZYKFzlN41
	 5Au3PrkA78Mp4cOwABLu7lmbTY9gsyLQLicO645RUDOm1c3sSQzRY65DDp4hyMhKtc
	 qi/8Tpjf3HaOw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] platform/chrome: cros_ec_chardev: Add event relayer
Date: Sat, 16 May 2026 22:30:16 +0800
Message-ID: <20260516143017.18560-4-tzungbi@kernel.org>
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

Introduce an event relayer mechanism.  Instead of each open file
registering directly with `ec_dev->event_notifier`, the platform device
registers a single relayer notifier.  Individual files then register
with a local subscribers list in `chardev_pdata`.

This allows the driver to safely disconnect from the event chain
`ec_dev->event_notifier` during cros_ec_chardev_remove(), preventing
events from being delivered to open files after the device is removed,
while still allowing those files to be closed safely later.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
This is an implementation of the idea from [1].

[1] https://lore.kernel.org/all/20251117153301.GD10864@nvidia.com/
---
v2:
- No changes.

v1: https://lore.kernel.org/all/20260427134659.95181-8-tzungbi@kernel.org

 drivers/platform/chrome/cros_ec_chardev.c | 32 ++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 352d61a2f3c6..7e046fc56998 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -40,6 +40,8 @@ struct chardev_pdata {
 	struct kref kref;
 	struct cros_ec_device *ec_dev;
 	u16 cmd_offset;
+	struct blocking_notifier_head subscribers;
+	struct notifier_block relay;
 };
 
 static void chardev_pdata_release(struct kref *kref)
@@ -49,6 +51,17 @@ static void chardev_pdata_release(struct kref *kref)
 	kfree(pdata);
 }
 
+static int cros_ec_chardev_relay_event(struct notifier_block *nb,
+				       unsigned long queued_during_suspend,
+				       void *_notify)
+{
+	struct chardev_pdata *pdata = container_of(nb, typeof(*pdata), relay);
+
+	blocking_notifier_call_chain(&pdata->subscribers, queued_during_suspend,
+				     _notify);
+	return NOTIFY_OK;
+}
+
 struct chardev_priv {
 	struct notifier_block notifier;
 	wait_queue_head_t wait_event;
@@ -190,7 +203,7 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 	nonseekable_open(inode, filp);
 
 	priv->notifier.notifier_call = cros_ec_chardev_mkbp_event;
-	ret = blocking_notifier_chain_register(&pdata->ec_dev->event_notifier,
+	ret = blocking_notifier_chain_register(&pdata->subscribers,
 					       &priv->notifier);
 	if (ret) {
 		dev_err(pdata->ec_dev->dev,
@@ -271,7 +284,7 @@ static int cros_ec_chardev_release(struct inode *inode, struct file *filp)
 	struct chardev_priv *priv = filp->private_data;
 	struct ec_event *event, *e;
 
-	blocking_notifier_chain_unregister(&priv->pdata->ec_dev->event_notifier,
+	blocking_notifier_chain_unregister(&priv->pdata->subscribers,
 					   &priv->notifier);
 	kref_put(&priv->pdata->kref, chardev_pdata_release);
 
@@ -403,6 +416,14 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 	kref_init(&pdata->kref);
 	pdata->ec_dev = ec->ec_dev;
 	pdata->cmd_offset = ec->cmd_offset;
+	BLOCKING_INIT_NOTIFIER_HEAD(&pdata->subscribers);
+	pdata->relay.notifier_call = cros_ec_chardev_relay_event;
+	ret = blocking_notifier_chain_register(&pdata->ec_dev->event_notifier,
+					       &pdata->relay);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register event notifier\n");
+		goto err_put_pdata;
+	}
 
 	pdata->misc.minor = MISC_DYNAMIC_MINOR;
 	pdata->misc.fops = &chardev_fops;
@@ -412,10 +433,13 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 	ret = misc_register(&pdata->misc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register misc device\n");
-		goto err_put_pdata;
+		goto err_unregister_notifier;
 	}
 
 	return 0;
+err_unregister_notifier:
+	blocking_notifier_chain_unregister(&pdata->ec_dev->event_notifier,
+					   &pdata->relay);
 err_put_pdata:
 	kref_put(&pdata->kref, chardev_pdata_release);
 	return ret;
@@ -425,6 +449,8 @@ static void cros_ec_chardev_remove(struct platform_device *pdev)
 {
 	struct chardev_pdata *pdata = platform_get_drvdata(pdev);
 
+	blocking_notifier_chain_unregister(&pdata->ec_dev->event_notifier,
+					   &pdata->relay);
 	misc_deregister(&pdata->misc);
 	kref_put(&pdata->kref, chardev_pdata_release);
 }
-- 
2.51.0

