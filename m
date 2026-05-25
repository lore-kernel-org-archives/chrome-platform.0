Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC4C33F8CA;
	Mon, 25 May 2026 05:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779686845; cv=none; b=XH9HDhGoEcNOcQ17IS8eX/LCf6YQoSMIn5TZBnLBUVP/+JkqavooOfRB9X9n0/Rx4DuRpg2qW45dgEdB/Aqf5WW0eK/aUXZDAbgPB74UVmNGLh6rk8YOF6Am4Q22ONZ449SV2i4MKUPB5lleoB+1+YiWtVzCCan3HgRvWMVFytE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779686845; c=relaxed/simple;
	bh=bYcAlpcHfb2UrWzsByEXtXNS91MWTby0OxfMSO02g74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMlCwhnIxqc6m7DitEWg0qcNUWqccbM6xs9nVhUb3ewFcYFkG9TVinheuojpkmEKYQlVW7FnPGPTfFHgHOx6r14E8s809SaFK+Ui9MgHjqRxH5eEGloHVpJOfL9eMMz8X02cG8r+wlysZChlaJVxuHX3Vx4UjevGqJKuPZRIUUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lblSpa0o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lblSpa0o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67001F00A3C;
	Mon, 25 May 2026 05:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779686843;
	bh=8EemRlJlbLzk0YdjiJSoovgFtoOVbeNyTe0DajlU9jg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lblSpa0oTw4T+ios/7UeLPIPcVk1xycgJN+b6r2ClAIWogUevalHdZcZvlFVQcWwG
	 qIjjocc5C2raXr495pjAMD2LyZBFKZAyziVe4XhuAPP6nSRhhEgtRVCcl//7ivyUOE
	 5stLTn6CHcLHgzR2ZxmTD3XwJbTCAbfNUHhMy2E9JR7RRR7TzPZrlD/QFdXPd9a5EV
	 qzzTUKrMWsnCsBGhWiwyDajcSTx7vmampbaKO2Y3VpbCQNWS8QF3O4kGfnYxI1IxmN
	 B7EySIfX0uf4ir4zsjM0LLOvVdOcTvCP4pBGRaYmxGLcFwUWg38zfpIHW7HJOqxdK5
	 EYb4d7ZwFktOQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] platform/chrome: cros_ec_chardev: Introduce chardev_data
Date: Mon, 25 May 2026 05:26:51 +0000
Message-ID: <20260525052654.4076429-2-tzungbi@kernel.org>
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

Introduce struct chardev_pdata to hold platform driver data.

The platform driver data is allocated by kzalloc() instead of devm
variant, allowing for managed cleanup that can eventually extend beyond
device removal if files are still open.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- Add R-b tag.

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
2.54.0.794.g4f17f83d09-goog

