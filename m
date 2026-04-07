Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134FC3976B8
	for <chrome-platform@lists.linux.dev>; Tue,  7 Apr 2026 10:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557594; cv=none; b=Um9Oh4ITxEuCAlWNbaw4R3gDMStkZc2k/i4DXHWTwzg++AbxQaddE+4jnlYXhNJiaLce7Su2IPlOQ2cc/cbEUwtf8fiac/7oNvd33f+5iPTyxMiMmCE4UxyXe+3hMibzYBFzokpiHBh5fIldhqqrwA8+mOqFSvZAGDm63AzAtAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557594; c=relaxed/simple;
	bh=tv8x/Qt2ZuBfXFQYFFoWisjn2wtOxBDFPSw25fLKd6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hweqUG0GRQJJ+2Q0ujXogwEOYmU2S7ErbRsutEGZ4S+qF7to/fAgHl7zcbJdIvccfXkr6xf71V/DZEiFP/7ZE7p4pG4Mrr8C4MHC1KDl9ZpcVPBeaKw1SOa81GiEy8FXiOXUSzCEx6zhVZTHE/LLFrRbbPtRY2AIipht9Kg+3tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWG+dOLz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWG+dOLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A184AC116C6;
	Tue,  7 Apr 2026 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775557593;
	bh=tv8x/Qt2ZuBfXFQYFFoWisjn2wtOxBDFPSw25fLKd6g=;
	h=From:To:Cc:Subject:Date:From;
	b=KWG+dOLzt/+NFn7v8NiYYhStLjGegBDm0UieCJuWiAUv+WHW3PT6s2KL416PhQVe3
	 svjz63C6ACxbjMHYmkfXr0Gcfur8bMsmZQW5OLk3qvsWjn3AYiYqQ0rI5ChsZv7nIU
	 ATj4vY7I8cja09UXPVAiKIpJVwMmLXz+6jy09VcxeSbuUkv+wdeeQx3D+sUfrRybcE
	 0+sye2l1tCqVW5GXhZ7yI1hmNLhw2LwE3JZKFZYCj4hLcrY6oJ1Um4N4HJwI+6dH7B
	 tmbnRpK5GdfugSMK/V08IYwKaB+vjVkUhPg8VXss4d4uaak1/nDcsH0nOqdR178XK6
	 2y8uRC5AvFXpQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: jwerner@chromium.org,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	tfiga@chromium.org,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH v4] platform/chrome: Resolve kb_wake_angle visibility race
Date: Tue,  7 Apr 2026 10:26:15 +0000
Message-ID: <20260407102615.1605317-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A race condition exists between the probe of cros-ec-sysfs and
cros-ec-sensorhub.

The `kb_wake_angle` attribute should only be visible if the sensor hub
detects two or more accelerometers.  If cros_ec_sysfs_probe() runs
before cros_ec_sensorhub_register() completes sensor enumeration, the
sysfs attributes are created while `has_kb_wake_angle` is still false,
hiding `kb_wake_angle` incorrectly.

Store the created attribute group pointer in `ec_dev->group`.  When
the sensor hub completes sensor enumeration, it checks for this group
and calls sysfs_update_group() to notify the sysfs core to re-evaluate
attribute visibility.  This ensures the `kb_wake_angle` attribute
visibility is correctly updated regardless of the driver probe order.

Co-developed-by: Gwendal Grignou <gwendal@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
This is an old patch and we still need it.  Revive the patch.

v4:
- Update the warning message if it fails to update the sysfs.
- Fix kernel-doc error `groups` -> `group` per
  https://lore.kernel.org/all/Y3bnYT6TXGXhkh%2FT@google.com/.
- Rephrase the commit message.

v3: https://lore.kernel.org/all/20210804213139.4139492-2-gwendal@chromium.org/

 drivers/platform/chrome/cros_ec_sensorhub.c | 6 +++++-
 drivers/platform/chrome/cros_ec_sysfs.c     | 5 +++--
 include/linux/platform_data/cros_ec_proto.h | 2 ++
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub.c b/drivers/platform/chrome/cros_ec_sensorhub.c
index 9bad8f72680e..f938c3fc84e4 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub.c
@@ -122,8 +122,12 @@ static int cros_ec_sensorhub_register(struct device *dev,
 		sensor_type[sensorhub->resp->info.type]++;
 	}
 
-	if (sensor_type[MOTIONSENSE_TYPE_ACCEL] >= 2)
+	if (sensor_type[MOTIONSENSE_TYPE_ACCEL] >= 2) {
 		ec->has_kb_wake_angle = true;
+		if (ec->group && sysfs_update_group(&ec->class_dev.kobj,
+						    ec->group))
+			dev_warn(dev, "Unable to update sysfs");
+	}
 
 	if (cros_ec_check_features(ec,
 				   EC_FEATURE_REFINED_TABLET_MODE_HYSTERESIS)) {
diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
index f22e9523da3e..9d3767ab1548 100644
--- a/drivers/platform/chrome/cros_ec_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_sysfs.c
@@ -405,7 +405,8 @@ static int cros_ec_sysfs_probe(struct platform_device *pd)
 	struct device *dev = &pd->dev;
 	int ret;
 
-	ret = sysfs_create_group(&ec_dev->class_dev.kobj, &cros_ec_attr_group);
+	ec_dev->group = &cros_ec_attr_group;
+	ret = sysfs_create_group(&ec_dev->class_dev.kobj, ec_dev->group);
 	if (ret < 0)
 		dev_err(dev, "failed to create attributes. err=%d\n", ret);
 
@@ -416,7 +417,7 @@ static void cros_ec_sysfs_remove(struct platform_device *pd)
 {
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 
-	sysfs_remove_group(&ec_dev->class_dev.kobj, &cros_ec_attr_group);
+	sysfs_remove_group(&ec_dev->class_dev.kobj, ec_dev->group);
 }
 
 static const struct platform_device_id cros_ec_sysfs_id[] = {
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index de14923720a5..6ed1c4c5ce2e 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -228,6 +228,7 @@ struct cros_ec_platform {
 /**
  * struct cros_ec_dev - ChromeOS EC device entry point.
  * @class_dev: Device structure used in sysfs.
+ * @group: sysfs attributes groups for this EC.
  * @ec_dev: cros_ec_device structure to talk to the physical device.
  * @dev: Pointer to the platform device.
  * @debug_info: cros_ec_debugfs structure for debugging information.
@@ -237,6 +238,7 @@ struct cros_ec_platform {
  */
 struct cros_ec_dev {
 	struct device class_dev;
+	const struct attribute_group *group;
 	struct cros_ec_device *ec_dev;
 	struct device *dev;
 	struct cros_ec_debugfs *debug_info;
-- 
2.53.0.1213.gd9a14994de-goog

