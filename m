Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D72026CE2C;
	Sat, 16 May 2026 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941833; cv=none; b=CH0fBm19OaB5uxyEcukLw3ODe0WJhPikJ9eAVy3rez1Ec+mAjX+bxVwzJpXfF8ntdRjJ0i8QeCyCdGb2aSoNRt4vqvREZAZInLP9aYNAiWjU2tU5c/2C2zuCVeFSLzrTjYyfIBCAen34bTLjlHj9GE19zGvp7Q2ne9Ez1/TqD3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941833; c=relaxed/simple;
	bh=qNzWBhkVDMAkAiqI7oCx8UjwD1geNvhZU8T1u90P9ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWzMjZAkgkO2eH7F5WHP+RExqgiZxktUKqxYrJ4757UyDcpMJSigcOqjxtRVWWRwPbWKkp59aqiT5d1LYi1IQIb3DQBy4EGUltHdHYL7x2w2qHBn2P3VR2o5wlXy9uhnV2oqAJ+HnbvKKZsWX2FdkHX00OqlQZc2q+dzqF4opQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYPmBDRh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYPmBDRh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EDAC2BCB3;
	Sat, 16 May 2026 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778941832;
	bh=qNzWBhkVDMAkAiqI7oCx8UjwD1geNvhZU8T1u90P9ZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GYPmBDRhOqcYL3A+l1LZP9KItOgP4dBdiZSPD0pEHomsTrwlnY17GrsKbT87YKMuK
	 8sPnfhyx6fChIKLTwzzP7wgxv3WlzHGaOyWr2lztdfcafr2b9p0mOFepj7immQUeEm
	 NxAfWhbFwUbQT4O3TZc3ag2p5ETcX6hjttQBeCxr9SAO2LOaasRBFED8NZnL0tP/hX
	 zNv0bbr7+iDrH5dZUt+KSagxWJ2R/vvHbitlPQ5EKcs2FcqYekwS6zFPzDTopA5S9V
	 qPRxJ2tXbB9eIw0+w+/RN7brtt+x4lQ8VvTCa4/4saKMSwiqQ0mu+kjM3OOXx7rzpI
	 chE6zOT/85/PA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] platform/chrome: cros_ec_chardev: Introduce chardev_data
Date: Sat, 16 May 2026 22:30:14 +0800
Message-ID: <20260516143017.18560-2-tzungbi@kernel.org>
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

Introduce struct chardev_pdata to hold platform driver data.

The platform driver data is allocated by kzalloc() instead of devm
variant, allowing for managed cleanup that can eventually extend beyond
device removal if files are still open.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- No changes.

v1: https://lore.kernel.org/all/20260427134659.95181-6-tzungbi@kernel.org

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

