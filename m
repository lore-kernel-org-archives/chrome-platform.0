Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1261F8F44
	for <chrome-platform@lists.linux.dev>; Thu, 20 Apr 2023 17:46:27 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-63b5e149dc2so943028b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 20 Apr 2023 10:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682012787; x=1684604787;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5wnobRA6vLHRzKHwpodVGqmfO0qn1B/z74z+EoetQqI=;
        b=2ywcpPDUZ8kXzbdDpRWv4Wfj7nxDsgVOvVhVxXTnMELNLw+goycd1JODV6ZwB0shur
         vo/GTE9b/RCV9vITwaCZfYuvtXH51cNeous1IljQOuePJEAZFbnZEE8pTT6kpoaQIW2L
         rlMOPcQ7jmsCWlQRFlUvHGqPYB/A7+Fpu2pUabyZ+BUC4VgYNwfhbh7+VyLqN9lop67h
         9TJZ8KiDHpxQe8sbuKRxeJuTYz1Be4qBko+K+t8CV8PFdIGQbrgHJ3lpkfv4mcj7/Kof
         sse+uhQiRch8wtgHPs9Cm4AiJheHAQECUGa2CI6ShE3k0y08Hx/vL2CF9/X14F9cSqgI
         GtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682012787; x=1684604787;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5wnobRA6vLHRzKHwpodVGqmfO0qn1B/z74z+EoetQqI=;
        b=BpB8eXkgEUweNjLRK3g02tPXWND7ayvlTHORz4EyRiqtmTKLCx57hH5iuqFntZ+psE
         UF3aBxgKKsqwRZ1dBDdWmqMGwT7bBazdk4jF+c/drIYOB2p9MfwxwOac/DvEzh11K67s
         zwjFh0lK9zAY8h+rEgWG1485CvDMhzCaj+WYR9ab8/Pyl6dCrFbi9x5Odc2PDBS0jiS5
         uwFUJRQwjYN/ujJlYUcqGXTuFM+Bv2hVXb/9xu6eloE57NdAr5i43NV2KEK1SX+VdbST
         0LM1Z/fofiNEAq4IZTM6O9A7J1KliOof9z57f3w6qci9Jzml5nwszMyiHUN5TR54fD0m
         0pJg==
X-Gm-Message-State: AAQBX9dmiN7+R7x8DmKwk6n5EtU6XQIuTautq1/7jd4aInV817O/dAoT
	BrdiRGBV+AgpGy1G8p7R8l4keDJju2HOfm6i3jI0TLKx8nYV3HrWuRmAPx7Zel4GUR2kjGMRPga
	IxEg/9DppbCcRCYSIrWqXMEoHnlZYuZ+dxT1pkbfQvuUPXQKFb8/xE+/zlaER5doP8UxfOxttC4
	TpUowBVA==
X-Google-Smtp-Source: AKy350Zr0LcjJ0L72XvyHKi/ko4N/YFfFX5HxCFH0nMSIEGCVo+8BVeowZBZF5crSUZxvNJkaQbdMfQfpguhD+M=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a05:6a00:b94:b0:63d:397a:8fdd with SMTP
 id g20-20020a056a000b9400b0063d397a8fddmr867529pfj.0.1682012787238; Thu, 20
 Apr 2023 10:46:27 -0700 (PDT)
Date: Thu, 20 Apr 2023 17:46:23 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.396.gfff15efe05-goog
Message-ID: <20230420174623.2794634-1-robbarnes@google.com>
Subject: [PATCH] platform/chrome: cros_ec: Report EC panic as uevent
From: Rob Barnes <robbarnes@google.com>
To: chrome-platform@lists.linux.dev
Cc: dnojiri@chromium.org, tzungbi@kernel.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Create a uevent when an EC panic is detected. This will allow udev rules
to trigger when a panic occurs. E.g. a udev rule could be added to
create an EC coredump. This approach allows more code to be moved out
of the kernel drivers.

Change-Id: I4fe7e4e603dcbf0ae6d4c4506f8978b0486abbbf
Signed-off-by: Rob Barnes <robbarnes@google.com>
---
 drivers/platform/chrome/cros_ec_lpc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index b399f7cbf17be..f2d5b00e6c3a0 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -16,6 +16,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -313,6 +314,23 @@ static int cros_ec_lpc_readmem(struct cros_ec_device *ec, unsigned int offset,
 	return cnt;
 }
 
+/**
+ * cros_ec_lpc_panic_uevent() - Publish EC panic uevent
+ * @ec_dev: Device that panic'd
+ *
+ * This function will generate a uevent to notify userspace.
+ * Typically the system will be reset shortly after an EC panic occurs.
+ *
+ * Return: 0 on success or <0 on error.
+ */
+static int cros_ec_lpc_panic_uevent(struct cros_ec_device *ec_dev)
+{
+	struct device *dev = ec_dev->dev;
+	static char *env[] = { "ERROR=PANIC", NULL };
+
+	return kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, env);
+}
+
 static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 {
 	struct cros_ec_device *ec_dev = data;
@@ -324,6 +342,8 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 	if (value == ACPI_NOTIFY_CROS_EC_PANIC) {
 		dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown is imminent!");
 		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+		cros_ec_lpc_panic_uevent(ec_dev);
+
 		/* Begin orderly shutdown. Force shutdown after 1 second. */
 		hw_protection_shutdown("CrOS EC Panic", 1000);
 		/* Do not query for other events after a panic is reported */
-- 
2.39.2

