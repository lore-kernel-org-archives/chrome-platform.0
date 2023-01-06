Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0D7B
	for <chrome-platform@lists.linux.dev>; Fri,  6 Jan 2023 04:55:43 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso625139pjf.1
        for <chrome-platform@lists.linux.dev>; Thu, 05 Jan 2023 20:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=75oGTaUkN/py11vcc7/YWZBcNN2MEQjFwocRCZ9uca4=;
        b=jIiu/mV4pjrdZCVtNS8MvKcx2JPsnHpD/Vofw6AwdJ7Jm4qIj6H8Cyyra2vNxndO0t
         g9PM4Z4ZBjy7euXsOppK3mb5JGSIdSS53dfjRsB1ysxRiPGFRdJupri2tHhI/sudZs9i
         wJABQOh/tqy9+wt0tFTBZQj0sP6z0Kd7ulY0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75oGTaUkN/py11vcc7/YWZBcNN2MEQjFwocRCZ9uca4=;
        b=6qY/xnUlBN2m0fayzYAJTDMxI8XcIM4tfEfonIZaEkHYKyjJtn9k6VKqpF7X7BUnqf
         i2UwfOPortBSNcGDQo0AhYff56DUOuIx7yKHUZbDgUwD3ZGY806kJjyzOOiTZw3TgmGy
         Hq8TJsCehSxe0B8kBi9Dvtt1wJnRr25m7YSBMB5i8jNyGrqGgmbcYvr0Xr4zcEa6DJvG
         kxOPGueoeleO9KjwfPT70zVP2sMgAvTJaJoxWGRtftnjkwl73zfTx9LaWNF/kUYVN5EH
         cZBZxnSIUOmPaBraKDTvzvCoPyly3YL6gqd/msatWI7mBg1uxAwuGp+9gPXcXEOB+fnh
         lIZg==
X-Gm-Message-State: AFqh2koYiJsBQ2gN4bDPmJ+WO0iuFkgTYARRX4P3dcYF1Gg3PAPUhchi
	JYwlkZMy5LHsI1l+LMs1lK9CojPPZnWwhYVI
X-Google-Smtp-Source: AMrXdXvlF2ZUsMqMw34/vaVNd3qpaVCXQRAX/6uAwPaM+sWkW+RS24JbRw1kHrXHb0YsMn2+3EUHVg==
X-Received: by 2002:a17:902:f293:b0:192:5c84:63fa with SMTP id k19-20020a170902f29300b001925c8463famr42581960plc.65.1672980942750;
        Thu, 05 Jan 2023 20:55:42 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7428:62fb:34cf:24f4])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090311cc00b0018c990ce7fesm26969390plh.239.2023.01.05.20.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 20:55:42 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/chromeos: cros_ec: Use per-device lockdep key
Date: Fri,  6 Jan 2023 12:55:37 +0800
Message-Id: <20230106045537.1243887-1-wenst@chromium.org>
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
4. In sbs_probe() on cros-ec-i2c (passthrough) I2C bus on cros-ec
   i2c_adapter->bus_lock -> ec_dev->lock

While lockdep is correct that the shared lockdep classes have a circular
dependency, it is bogus because

  a) 2+3 happen on a native I2C bus
  b) 4 happens on the actual EC on ChromeOS devices
  c) 1 happens on the SCP coprocessor on MediaTek Chromebooks that just
     happen to expose a cros-ec interface, but do not have a passthrough
     I2C bus

In short, the "dependencies" are actually on different devices.

Setup a per-device lockdep key for cros_ec devices so lockdep can tell
the two instances apart. This helps with getting rid of the bogus
lockdep warning. For ChromeOS devices that only have one cros-ec
instance this doesn't change anything.

Also add a missing mutex_destroy, just to make the teardown complete.

[1] This is likely the per I2C bus lock with shared lockdep class

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/cros_ec.c           | 14 +++++++++++---
 include/linux/platform_data/cros_ec_proto.h |  2 ++
 2 files changed, 13 insertions(+), 3 deletions(-)

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
index e43107e0bee1..677d2eae1692 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -9,6 +9,7 @@
 #define __LINUX_CROS_EC_PROTO_H
 
 #include <linux/device.h>
+#include <linux/lockdep_types.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 
@@ -160,6 +161,7 @@ struct cros_ec_device {
 			struct cros_ec_command *msg);
 	int (*pkt_xfer)(struct cros_ec_device *ec,
 			struct cros_ec_command *msg);
+	struct lock_class_key lockdep_key;
 	struct mutex lock;
 	u8 mkbp_event_supported;
 	bool host_sleep_v1;
-- 
2.39.0.314.g84b9a713c41-goog

