Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900E33CF661;
	Mon, 27 Apr 2026 13:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297670; cv=none; b=V1xMc5GPven45YApAqrjYpMTb3s0bLkW47uBQghJVMcnuDutF57jlIpJR8Ic28BFzIhiQqSTD6504OTMTJGk5kFkJA1nZvV2SVIgGTHcTeysXwrFL/Hvb0lEUTxCqqJvQLXTPgqGuPMpmEsXeTKcb2GrXD8oyFPt4K3djAT09+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297670; c=relaxed/simple;
	bh=ev8Uzb8NFAygRXbVRNS+UAyxgCM23wL8SlQ+mEGd66s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbuA6Vup5HFuFxdg9BiVyr9SO7ZqUan3Rqu2cHE7c8Aho14H1vYWTCkfohgS+pMYPF+yX/qCgtqvNH2v2chWqGLWuJaJZ+8jqDyxJ5Z90NbzhZ2nA1P39kpWC3r94nY1HrX4dULnVhTAPfFh2x7soIh78Fi62vUELwICIUDzk8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYOhnp0f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYOhnp0f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B509C2BCB5;
	Mon, 27 Apr 2026 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297670;
	bh=ev8Uzb8NFAygRXbVRNS+UAyxgCM23wL8SlQ+mEGd66s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WYOhnp0f91+2a+pe/gLHJIhjw1JQZQ2c/OFTFM+ovSAxBWOFuBffFWs7DNSUiGcjA
	 UPTSQPRdVGPjQ4fRRRoze8Ou/4cBssN9YHN70b5zLq5zrPJks3fHrL/6wV60jrUTUm
	 wLJ+GxphQzzOkafzf4C5P2bXmc2QNjjpNQVN8phydPDIYLh52lOwY3Kb2tAStRrcWS
	 h8hhNNvpTNxqCePFEsfpjK72m8imPuUpAbURcW0VZgRa1NCtTcM39X6eU11BZzfz6A
	 UvorinNCaNp3qxG6UGRawYYCUtWAHtlyErpAHGbsRtxG/IKu3Uq9kdloAw/ACUhj3g
	 iXzZdaaBFW6tg==
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
Subject: [PATCH 5/8] platform/chrome: cros_ec_chardev: Introduce chardev_data
Date: Mon, 27 Apr 2026 21:46:56 +0800
Message-ID: <20260427134659.95181-6-tzungbi@kernel.org>
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

Introduce struct chardev_pdata to hold platform driver data.

The platform driver data is allocated by kzalloc() instead of devm
variant, allowing for managed cleanup that can eventually extend beyond
device removal if files are still open.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_chardev.c | 51 +++++++++++++++++------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 002be3352100..e7012e44a006 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/fs.h>
+#include <linux/kref.h>
 #include <linux/miscdevice.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -31,6 +32,21 @@
 /* Arbitrary bounded size for the event queue */
 #define CROS_MAX_EVENT_LEN	PAGE_SIZE
 
+/*
+ * Platform device driver data.
+ */
+struct chardev_pdata {
+	struct miscdevice misc;
+	struct kref kref;
+};
+
+static void chardev_pdata_release(struct kref *kref)
+{
+	struct chardev_pdata *pdata = container_of(kref, typeof(*pdata), kref);
+
+	kfree(pdata);
+}
+
 struct chardev_priv {
 	struct cros_ec_device *ec_dev;
 	struct notifier_block notifier;
@@ -374,28 +390,39 @@ static int cros_ec_chardev_probe(struct platform_device *pdev)
 {
 	struct cros_ec_dev *ec = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_platform *ec_platform = dev_get_platdata(ec->dev);
-	struct miscdevice *misc;
+	struct chardev_pdata *pdata;
+	int ret;
 
-	/* Create a char device: we want to create it anew */
-	misc = devm_kzalloc(&pdev->dev, sizeof(*misc), GFP_KERNEL);
-	if (!misc)
+	pdata = kzalloc_obj(*pdata);
+	if (!pdata)
 		return -ENOMEM;
 
-	misc->minor = MISC_DYNAMIC_MINOR;
-	misc->fops = &chardev_fops;
-	misc->name = ec_platform->ec_name;
-	misc->parent = pdev->dev.parent;
+	platform_set_drvdata(pdev, pdata);
+	kref_init(&pdata->kref);
 
-	dev_set_drvdata(&pdev->dev, misc);
+	pdata->misc.minor = MISC_DYNAMIC_MINOR;
+	pdata->misc.fops = &chardev_fops;
+	pdata->misc.name = ec_platform->ec_name;
+	pdata->misc.parent = pdev->dev.parent;
 
-	return misc_register(misc);
+	ret = misc_register(&pdata->misc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register misc device\n");
+		goto err_put_pdata;
+	}
+
+	return 0;
+err_put_pdata:
+	kref_put(&pdata->kref, chardev_pdata_release);
+	return ret;
 }
 
 static void cros_ec_chardev_remove(struct platform_device *pdev)
 {
-	struct miscdevice *misc = dev_get_drvdata(&pdev->dev);
+	struct chardev_pdata *pdata = platform_get_drvdata(pdev);
 
-	misc_deregister(misc);
+	misc_deregister(&pdata->misc);
+	kref_put(&pdata->kref, chardev_pdata_release);
 }
 
 static const struct platform_device_id cros_ec_chardev_id[] = {
-- 
2.51.0

