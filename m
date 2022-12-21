Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83C728F7
	for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 18:56:37 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-3ceb4c331faso183235397b3.2
        for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 10:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vkeDQJpVTf6s1YGBospF5WMHq6hnMmsSN6KbLFXrO2Q=;
        b=aYmNc+Ea/2opXxqCb5rJOnnDocH6oxCiON3IEwUeuCW1rqB1BmsUQoqZWgsU0l8pi0
         zm7l8qX6kbqV3Ha8FqkQlOp3myaK0F4dl3TIqQWkoJtxck05mbD20v5ZHFZd3mqJme3k
         OGqPObnxXcb5O1NAMlTsS8lFUPVewLU6PW0s7MHZGM/kmCV0M6xOCjMI3JrYcRUF+sk5
         htT5mJbvfKM9Mkyjl12XJSJG9d/eIbW8IYVFfqQ87s3Cj7H9hERgyirhmXDJBPkT387e
         uQW8KQDgnQSNWoG7phE/pAdUg1BatnPFwWDbtMPkvHs2wJ1G2lWIZBTVHFQzC99LbM9p
         xJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkeDQJpVTf6s1YGBospF5WMHq6hnMmsSN6KbLFXrO2Q=;
        b=XwzOBwPS622dCywcokFmCSnWwsE9dwImoiaT4uMVo2YiLCdepqUNn61gzuBC1v8pLG
         OCUJ6JV207MdAnLcIaps2fgsOQ0NsPuEKlfYYmbGtfaC/XegrZnqFkD9uxaYbSmAmgze
         CauGx1DVJZ5B6be39MuEtD1ySLEDTb0QCHWX/lIqtOF9erS5SRZfoApgOy0lVZpDvhWL
         NbNS8a3KAS7InXhQYhg7+nmSiLlNIpz5z86cp71FmgIS80HgkulHvKH8ADjy8myTbHWZ
         4UoC1U3Ro09GZVyaaOIyaj+XdB4guqIqhTbhqWbN1OD5TYDrmjabIKTTwPur+hke+Wid
         k0Bw==
X-Gm-Message-State: AFqh2kqrjRNrXI+bR0XvF7dFDzsIDCNB6Aggq2uuibvoSC+NIEr0lMC4
	onUBpF5marIXLVCnVXh3f1Gub++YXPfiqHg=
X-Google-Smtp-Source: AMrXdXuDeIb+sACFxzk6jxFrUXna+B8ejbo67esa7ZWyt/BR8swb1R5A2sciDL3RWE1EW+2TDOqo2QdA3Qg4DN4=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a25:aae1:0:b0:6fc:1c96:c9fe with SMTP id
 t88-20020a25aae1000000b006fc1c96c9femr378468ybi.36.1671648996893; Wed, 21 Dec
 2022 10:56:36 -0800 (PST)
Date: Wed, 21 Dec 2022 18:55:41 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221221185540.2265771-1-robbarnes@google.com>
Subject: [PATCH] drivers/cros_ec: Handle CrOS EC panics
From: Rob Barnes <robbarnes@google.com>
To: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: dtor@chromium.org, Benson Leung <bleung@chromium.org>, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Add handler for CrOS EC panic events. When a panic is reported,
poll EC log then force an orderly shutdown.

This will preserve the EC log leading up to the crash.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---
 drivers/platform/chrome/cros_ec_debugfs.c   | 24 +++++++++++++++++++++
 drivers/platform/chrome/cros_ec_lpc.c       | 10 +++++++++
 include/linux/platform_data/cros_ec_proto.h |  9 ++++++++
 3 files changed, 43 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 21d973fc6be2..31637a4e4cf9 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -49,6 +49,7 @@ struct cros_ec_debugfs {
 	struct delayed_work log_poll_work;
 	/* EC panicinfo */
 	struct debugfs_blob_wrapper panicinfo_blob;
+	struct notifier_block notifier_panic;
 };
 
 /*
@@ -437,6 +438,23 @@ static int cros_ec_create_panicinfo(struct cros_ec_debugfs *debug_info)
 	return ret;
 }
 
+static int cros_ec_debugfs_panic_event(struct notifier_block *nb,
+				       unsigned long queued_during_suspend,
+				       void *_notify)
+{
+	struct cros_ec_debugfs *debug_info =
+		container_of(nb, struct cros_ec_debugfs, notifier_panic);
+
+	if (debug_info->log_buffer.buf) {
+		/* Force log poll work to run immediately */
+		mod_delayed_work(debug_info->log_poll_work.wq, &debug_info->log_poll_work, 0);
+		/* Block until log poll work finishes */
+		flush_delayed_work(&debug_info->log_poll_work);
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int cros_ec_debugfs_probe(struct platform_device *pd)
 {
 	struct cros_ec_dev *ec = dev_get_drvdata(pd->dev.parent);
@@ -473,6 +491,12 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
 	debugfs_create_u16("suspend_timeout_ms", 0664, debug_info->dir,
 			   &ec->ec_dev->suspend_timeout_ms);
 
+	debug_info->notifier_panic.notifier_call = cros_ec_debugfs_panic_event;
+	ret = blocking_notifier_chain_register(&ec->ec_dev->panic_notifier,
+					       &debug_info->notifier_panic);
+	if (ret)
+		goto remove_debugfs;
+
 	ec->debug_info = debug_info;
 
 	dev_set_drvdata(&pd->dev, ec);
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 7fc8f82280ac..21958c3b0c28 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -21,6 +21,7 @@
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
+#include <linux/reboot.h>
 #include <linux/suspend.h>
 
 #include "cros_ec.h"
@@ -332,6 +333,15 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 
 	if (value == ACPI_NOTIFY_DEVICE_WAKE)
 		pm_system_wakeup();
+
+	if (value == ACPI_NOTIFY_CROS_EC_PANIC) {
+		dev_err(ec_dev->dev,
+			"CrOS EC Panic Reported. Shutdown is imminent!");
+		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0,
+					     ec_dev);
+		/* Begin orderly shutdown. Force shutdown after 1 second. */
+		hw_protection_shutdown("CrOS EC Panic", 1000);
+	}
 }
 
 static int cros_ec_lpc_probe(struct platform_device *pdev)
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index e43107e0bee1..1c4487271836 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -41,6 +41,13 @@
 #define EC_MAX_REQUEST_OVERHEAD		1
 #define EC_MAX_RESPONSE_OVERHEAD	32
 
+/*
+ * EC panic is not covered by the standard (0-F) ACPI notify values.
+ * Arbitrarily choosing B0 to notify ec panic, which is in the 84-BF
+ * device specific ACPI notify range.
+ */
+#define ACPI_NOTIFY_CROS_EC_PANIC	0xB0
+
 /*
  * Command interface between EC and AP, for LPC, I2C and SPI interfaces.
  */
@@ -176,6 +183,8 @@ struct cros_ec_device {
 	/* The platform devices used by the mfd driver */
 	struct platform_device *ec;
 	struct platform_device *pd;
+
+	struct blocking_notifier_head panic_notifier;
 };
 
 /**
-- 
2.39.0.314.g84b9a713c41-goog

