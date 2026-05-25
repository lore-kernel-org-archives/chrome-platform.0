Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054CF33FE0A;
	Mon, 25 May 2026 05:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779686851; cv=none; b=FL9Ov0cSevNwuSuRDhrln7a0gv46A5SjxcoaEi1UwWhkFmSLyszTOPX2tqHkFceEDPO/zpw+EivbJMV8o5Nx91m9fzcN6XwugPwITgJGFVXJnSokxBu46iUa4+mST4k6mqV3rM8qsXvDh/swuQtVsgBy2uL5Ki6pMnHuP8g2p4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779686851; c=relaxed/simple;
	bh=2UYza3dytVJ4R1OcS7BQmUP7XLnE4Lnp14/DAT5y9Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FcFruP1MizaalqdYLHWO6YI73svNF67983gRJegAaMLaKU4CoCALg67SMNa2BeJePm8tXfctIunqLw+iuD8YtJiDrRZKAPuay4X2nCRaH2OFCvwgwIJHNx2Up5+JY2L95ri2rKCeiKD6aJoJGa2GoPWVupikLZRXiFdMyySeARY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V14BQrT4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V14BQrT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D1D1F00A3C;
	Mon, 25 May 2026 05:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779686846;
	bh=M9b7pJelEq/t7D2Oa5gcWGxr+jvku3vmtgsCGVHLr6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V14BQrT45iqFKQiv26qr6VZ2ntOxqB3jsSqKBpxDiUiVX+45Ht1xtf1WRafJSiR3p
	 UPW1O7IQLSZtaUYRcXPPCrGvdUAvfpXOVkjGljYzb3i2GlUUdpwEk0Kl49YL8Wmj35
	 YbLMvnuJ+eN6xpiOgnZg9x+gDx/Td0J7X9yPaGZSrQUrlgyaEcm/gLGH+YKjoVMkFE
	 8mcIdXpn154HdGveMx5xDVk9J2MEzBwZJZmwfK8f7N9BKLTQ0LC9lCBAj/pPtevRiB
	 KhfD2SC18vbhrJ0BZgqFYHS3ezQ97/VgqCpQL/gGrtOABLT3zhHjaxDa8WM4mq8gY1
	 +hmFNi0I1zXew==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] platform/chrome: cros_ec_chardev: Add event relayer
Date: Mon, 25 May 2026 05:26:53 +0000
Message-ID: <20260525052654.4076429-4-tzungbi@kernel.org>
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

Introduce an event relayer mechanism.  Instead of each open file
registering directly with `ec_dev->event_notifier`, the platform device
registers a single relayer notifier.  Individual files then register
with a local subscribers list in `chardev_pdata`.

This allows the driver to safely disconnect from the event chain
`ec_dev->event_notifier` during cros_ec_chardev_remove(), preventing
events from being delivered to open files after the device is removed,
while still allowing those files to be closed safely later.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
This is an implementation of the idea from [1].

[1] https://lore.kernel.org/all/20251117153301.GD10864@nvidia.com/
---
v3:
- Add R-b tag.

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
2.54.0.794.g4f17f83d09-goog

