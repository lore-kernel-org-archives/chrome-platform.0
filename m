Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE0E39B4A5;
	Mon, 27 Apr 2026 13:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297676; cv=none; b=QhSV6ka/5dw123FCr2bwSLGIefpw6GU/q8bPi9xp9GrSn63gM28J1qmaekGZJwd5sG5t8xGcTk0pr2811HQy4sPlFxfQGSEdydMb0TzD5ir3VWCEe9LvNR0X/ZFMKwYpwJjNfgwW7JB8dbiYZldDuUYN7Q8jOANRWzG1ho9tGpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297676; c=relaxed/simple;
	bh=DKCK86c91tEYjL8fuzP5xRgj4Ndnp6lODrr6RdtLdOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tb84qS8KwevkuzXwp0QA4EnVmPeMo/3gWyyDjdraucD5bWqBx3m0/BAIc24UzXkzyXvx0GQj0jkSxFDB0OQIa5K1MUg4uzIpx82Pxi9PdTBL3qWq8hSyUzq/UBfLHABRtIDk0XxWZWNMohiV+rAx5/MNkxGyI89w+pL7ct32bEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GofOUR/z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GofOUR/z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA8AC2BCB5;
	Mon, 27 Apr 2026 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297676;
	bh=DKCK86c91tEYjL8fuzP5xRgj4Ndnp6lODrr6RdtLdOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GofOUR/zFMSeZcxBfdnizQxm+IRNoX0s+z/25Kovb8TqLXAHDcbaeZ7LwcUW6I2tw
	 xQGY98Iyep1AbY1VvMr+tbeth/bhAeInkahc6ozBV9x+pFp8D1EhOPfaF/tI0o8VBc
	 A4IST8CX+ZC+bEWKjCzttXihrbi3nJth6CP99Bw+JftoC013vMpivZoCWkcTgSb5St
	 O/bqpv/RpkPPMrDWKSQXKnB7Ryn9xAW07x2Q0f0qoLwZTykV1nkD7z+SjCtMm1/mzL
	 9CgbAPeWTBmmRiI7gXEB1uaMNuM0UO2XWRxkHhMDjBn727CFRaaeP/15/8yiOwfx2l
	 D4CCDdkfM5keQ==
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
Subject: [PATCH 7/8] platform/chrome: cros_ec_chardev: Add event relayer
Date: Mon, 27 Apr 2026 21:46:58 +0800
Message-ID: <20260427134659.95181-8-tzungbi@kernel.org>
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

