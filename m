Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDEC17D0
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 07:41:51 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so19084802pjg.5
        for <chrome-platform@lists.linux.dev>; Tue, 10 Jan 2023 23:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=91Hl8ALzV5o3Qqh2oJ2f58Tkievk2YyNfJYPWLBG5zY=;
        b=KOC8hIBS7gHa/z1x6KYK3seu/8QGIKV7MfnUR3HhqTKq5quWCtTXmOpFs/TdNvU8uR
         mjl+orXvITfxVIQt2xarBTgcMbyUZOjQuCH2nOsjUlkxK+0SaQfcCiuK5DGGxoAal+7B
         aZ7byKYIBQMPIxd2sgt0BaQ5n7c3sBbGpe28k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91Hl8ALzV5o3Qqh2oJ2f58Tkievk2YyNfJYPWLBG5zY=;
        b=abgRrnWjZenjFChWlaNfZOwlsd8tqQfbZAfdw7aWRcUn62bCWWGlbh/IoNypmUnS21
         HWSnfa0mX04Dyo6YeO/kI+MsGKe6lpQEmhIiNJPrhmSQlDnER/vhjeOIRTatS9h+PVfB
         v55AW+xO5jiTrUWkOvDIdcnfUSoPrE1duAfajS7Z7MWg8BCQM1jcrc6RjkAdcFJqfFhh
         4WVlSKlkQ4kylhnbMht2bYfAtnY4E6rrHSVOvrQvIa1STRB47Qp0VcO8tOefTkNr4Vnq
         3nZ/Q8gcC9oWynT0+QFjpbNZTw2npcnLLDKdLnjwXs0kld9FFPHR8gfDQXwgf2bUutAQ
         p2rQ==
X-Gm-Message-State: AFqh2kqUxFlkVnP2fmuimW9qHpGGErg9qZu49u1m+djwIGyZW9PXb0sQ
	fSo9VMMn2MG2XdlJ41KHkuAVUA==
X-Google-Smtp-Source: AMrXdXsKXNltb9JG3d2sEMw7OnLKpXPoycXYzb++Za+0RnKzms6DGt9jIIC1ppkYgxTY6uckBguywA==
X-Received: by 2002:a17:902:ccc1:b0:191:3098:8b with SMTP id z1-20020a170902ccc100b001913098008bmr1723052ple.58.1673422910505;
        Tue, 10 Jan 2023 23:41:50 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:70b3:ecc:72b:d324])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902784200b0019309be03e7sm9428091pln.66.2023.01.10.23.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 23:41:50 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/chrome: cros_ec: Use per-device lockdep key
Date: Wed, 11 Jan 2023 15:41:46 +0800
Message-Id: <20230111074146.2624496-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdep reports a bogus possible deadlock on MT8192 Chromebooks due to
the following lock sequences:

1. lock(i2c_register_adapter) [1]; lock(&ec_dev->lock)
2. lock(&ec_dev->lock); lock(prepare_lock);

The actual dependency chains are much longer. The shortened version
looks somewhat like:

1. cros-ec-rpmsg on mtk-scp
   ec_dev->lock -> prepare_lock
2. In rt5682_i2c_probe() on native I2C bus:
   prepare_lock -> regmap->lock -> (possibly) i2c_adapter->bus_lock
3. In rt5682_i2c_probe() on native I2C bus:
   regmap->lock -> i2c_adapter->bus_lock
4. In sbs_probe() on i2c-cros-ec-tunnel I2C bus attached on cros-ec:
   i2c_adapter->bus_lock -> ec_dev->lock

While lockdep is correct that the shared lockdep classes have a circular
dependency, it is bogus because

  a) 2+3 happen on a native I2C bus
  b) 4 happens on the actual EC on ChromeOS devices
  c) 1 happens on the SCP coprocessor on MediaTek Chromebooks that just
     happens to expose a cros-ec interface, but does not have an
     i2c-cros-ec-tunnel I2C bus

In short, the "dependencies" are actually on different devices.

Setup a per-device lockdep key for cros_ec devices so lockdep can tell
the two instances apart. This helps with getting rid of the bogus
lockdep warning. For ChromeOS devices that only have one cros-ec
instance this doesn't change anything.

Also add a missing mutex_destroy, just to make the teardown complete.

[1] This is likely the per I2C bus lock with shared lockdep class

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Changed subject prefix from "chromeos" to "chrome"
- Changed "passthrough I2C bus" to exact name, i2c-cros-ec-tunnel
- Added kerneldoc for new "lockdep_key" field

 drivers/platform/chrome/cros_ec.c           | 14 +++++++++++---
 include/linux/platform_data/cros_ec_proto.h |  4 ++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index ec733f683f34..4ae57820afd5 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -198,12 +198,14 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	if (!ec_dev->dout)
 		return -ENOMEM;
 
+	lockdep_register_key(&ec_dev->lockdep_key);
 	mutex_init(&ec_dev->lock);
+	lockdep_set_class(&ec_dev->lock, &ec_dev->lockdep_key);
 
 	err = cros_ec_query_all(ec_dev);
 	if (err) {
 		dev_err(dev, "Cannot identify the EC: error %d\n", err);
-		return err;
+		goto destroy_mutex;
 	}
 
 	if (ec_dev->irq > 0) {
@@ -215,7 +217,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		if (err) {
 			dev_err(dev, "Failed to request IRQ %d: %d\n",
 				ec_dev->irq, err);
-			return err;
+			goto destroy_mutex;
 		}
 	}
 
@@ -226,7 +228,8 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	if (IS_ERR(ec_dev->ec)) {
 		dev_err(ec_dev->dev,
 			"Failed to create CrOS EC platform device\n");
-		return PTR_ERR(ec_dev->ec);
+		err = PTR_ERR(ec_dev->ec);
+		goto destroy_mutex;
 	}
 
 	if (ec_dev->max_passthru) {
@@ -292,6 +295,9 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 exit:
 	platform_device_unregister(ec_dev->ec);
 	platform_device_unregister(ec_dev->pd);
+destroy_mutex:
+	mutex_destroy(&ec_dev->lock);
+	lockdep_unregister_key(&ec_dev->lockdep_key);
 	return err;
 }
 EXPORT_SYMBOL(cros_ec_register);
@@ -309,6 +315,8 @@ void cros_ec_unregister(struct cros_ec_device *ec_dev)
 	if (ec_dev->pd)
 		platform_device_unregister(ec_dev->pd);
 	platform_device_unregister(ec_dev->ec);
+	mutex_destroy(&ec_dev->lock);
+	lockdep_unregister_key(&ec_dev->lockdep_key);
 }
 EXPORT_SYMBOL(cros_ec_unregister);
 
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 017d502ed66e..3db26c891d5c 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -9,6 +9,7 @@
 #define __LINUX_CROS_EC_PROTO_H
 
 #include <linux/device.h>
+#include <linux/lockdep_types.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 
@@ -122,6 +123,8 @@ struct cros_ec_command {
  *            command. The caller should check msg.result for the EC's result
  *            code.
  * @pkt_xfer: Send packet to EC and get response.
+ * @lockdep_key: Lockdep class for each instance. Unused if CONFIG_LOCKDEP is
+ *		 not enabled.
  * @lock: One transaction at a time.
  * @mkbp_event_supported: 0 if MKBP not supported. Otherwise its value is
  *                        the maximum supported version of the MKBP host event
@@ -166,6 +169,7 @@ struct cros_ec_device {
 			struct cros_ec_command *msg);
 	int (*pkt_xfer)(struct cros_ec_device *ec,
 			struct cros_ec_command *msg);
+	struct lock_class_key lockdep_key;
 	struct mutex lock;
 	u8 mkbp_event_supported;
 	bool host_sleep_v1;
-- 
2.39.0.314.g84b9a713c41-goog

