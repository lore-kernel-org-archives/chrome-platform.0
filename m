Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB6E1F5433
	for <chrome-platform@lists.linux.dev>; Fri, 26 Sep 2025 20:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758918159; cv=none; b=A2TUYx5IvuG4cz27wosoWD4J25efGZTGYb2YZdgsZ/cZ4H5xFUmKrOr9nfv8SgqWJ7ZsdgPO6nqw0LhTubyxTSAdDPJVEdvg9sBJnc7+YWE0Bp1SLDiTMybG3wqdgGOViYZFwzHr0AUGpZxAIbswJwjgo1svosBHwKtziHQtoyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758918159; c=relaxed/simple;
	bh=nLJ0YjQ91Yn1shRUwAjWEm4Lx1iLpCqUSzJMgAefpf4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JXX+LSUY+D/QLjoGgRVbzBcW7u1OVAI8qrHJKA42Mr0uD/JvvHhmzcmFHRwm9JHDSSF9XJRDjfB/ZLDaP9WaBi27qtIj52sd3tlKlWrqPITveIsmZxHQhPCXrvZidSI3MqeFSrYjlpvghyNdvs85KzjeW98adLEhk92tHYgYlgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZXCIKaF/; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZXCIKaF/"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2699ebc0319so27614745ad.3
        for <chrome-platform@lists.linux.dev>; Fri, 26 Sep 2025 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758918157; x=1759522957; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KUK9KmZjLjUMk2hCTt2m2lKCqBoaVzjTBMpNGU6OAK0=;
        b=ZXCIKaF/Drmo/1y3rFxtxh3vWaJhdNJLag/bhtt0wdSuPAO2LRBcAdQMPBpTSVDZ91
         oam3xfb43ZTgt3CknazVJAu8vu1b8NcutPZBZ3KF6z7VmnRiC9YUPbZ1Zt3vAONVNmy0
         rpsK//0QGbsQlgr1vCd0f7YKdJALdwulC2a/MS8k4bJzNxQInAMhUU2mfuliWSRrVBYi
         EfdXmO3dXW5HwcjR+IaxkZ+UAoMayt3w7aiHiZefXi+BSswjphFyqWs0XnsrCI/6PkW/
         HY00tjQ88XD0MKYvdO5YXDxBryzHdvXQIykB3HP2izdFm/hjTJCbfpSGBcXkA2cvHy+e
         O0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758918157; x=1759522957;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUK9KmZjLjUMk2hCTt2m2lKCqBoaVzjTBMpNGU6OAK0=;
        b=LmmiNrqBq0oms3KZQuQij3DjBtxcymfEu8f76PRoutP3kP+b4D8unyzd12NiXfUyCS
         aEcGoNGKCFH5Gkvz7L6lEmjLmbrngLyLt0xfYh9BN1I27Lk9t2F/R9vJzoMtZFGINXX8
         e7xdizrqgNQz3JE9QjxoEuiutqsrTFaqM2jo9ArJVWIIMrwU8TyNuiHasomnpFdzkLf8
         +xzOuT6HInfIzKEARECTCzcyCMnodCuqeiMCQwvy8vP0E/jKURjOO0XIsSpgTyyV9DLT
         66asqscX2PPuuYXh9q6dCFvlAWEXSfKtlm4D9bHoVS0J6p7iZI+qQPf0MZkeBVazsloi
         31IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqaGAUxLXAL4W5VLps7ZQEdfBsutaRDzIpGBxCE9h5Og3yaozkZHpW5z3brX7rZjIwCGIKcfNIhwu1v13tanM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLwWwzNs1LT76uQbNcTNHf0J5FVVXWbp75/sOzoMi/mP1I7Yg0
	ECaFOcFMaDegq3+v5iZTwgQPfVU1A+rY/8rEqb1VsvG4NEllQb7WDtu34qihTOK2EQvB5LAvUlv
	j4v3KsQ==
X-Google-Smtp-Source: AGHT+IFFtu5w1uRtH7cszuGSMgHmNrTA+mXAXuGq2GJ1gr+Mu/3R5zNMhkisOrJC892PXwBKAJT1qw79uTA=
X-Received: from pjyw5.prod.google.com ([2002:a17:90a:ea05:b0:32e:c154:c2f6])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f544:b0:246:7a43:3f66
 with SMTP id d9443c01a7336-27ed4a06c04mr101550095ad.7.1758918157312; Fri, 26
 Sep 2025 13:22:37 -0700 (PDT)
Date: Fri, 26 Sep 2025 20:22:34 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20250926202234.3064386-1-jthies@google.com>
Subject: [PATCH v1] platform/chrome: cros_usbpd_notify: defer probe when
 parent EC driver isn't ready
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, bleung@chromium.org, abhishekpandit@chromium.org, 
	tzungbi@kernel.org
Cc: jthies@google.com, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The cros-usbpd-notify-acpi probe currently does not exit when it fails
to get a pointer to the ChromeOS EC device. It is expected behavior on
older devices, where GOOG0004 is not a parent of GOOG0003.

Update the cros-usbpd-notify-acpi probe to check for a GOOG0004 parent
fwnode. If the device has correct device hierarchy and fails to get an
EC device pointer, defer the probe function.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/platform/chrome/cros_usbpd_notify.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platform/chrome/cros_usbpd_notify.c
index 313d2bcd577b..2681bf9d0159 100644
--- a/drivers/platform/chrome/cros_usbpd_notify.c
+++ b/drivers/platform/chrome/cros_usbpd_notify.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/fwnode.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -15,6 +16,7 @@
 #define DRV_NAME "cros-usbpd-notify"
 #define DRV_NAME_PLAT_ACPI "cros-usbpd-notify-acpi"
 #define ACPI_DRV_NAME "GOOG0003"
+#define CREC_DRV_NAME "GOOG0004"
 
 static BLOCKING_NOTIFIER_HEAD(cros_usbpd_notifier_list);
 
@@ -98,8 +100,9 @@ static int cros_usbpd_notify_probe_acpi(struct platform_device *pdev)
 {
 	struct cros_usbpd_notify_data *pdnotify;
 	struct device *dev = &pdev->dev;
-	struct acpi_device *adev;
+	struct acpi_device *adev, *parent_adev;
 	struct cros_ec_device *ec_dev;
+	struct fwnode_handle *parent_fwnode;
 	acpi_status status;
 
 	adev = ACPI_COMPANION(dev);
@@ -114,8 +117,18 @@ static int cros_usbpd_notify_probe_acpi(struct platform_device *pdev)
 		/*
 		 * We continue even for older devices which don't have the
 		 * correct device heirarchy, namely, GOOG0003 is a child
-		 * of GOOG0004.
+		 * of GOOG0004. If GOOG0003 is a child of GOOG0004 and we
+		 * can't get a pointer to the Chrome EC device, defer the
+		 * probe function.
 		 */
+		parent_fwnode = fwnode_call_ptr_op(dev->fwnode, get_parent);
+		if (parent_fwnode) {
+			parent_adev = to_acpi_device_node(parent_fwnode);
+			if (parent_adev &&
+			    acpi_dev_hid_match(parent_adev, CREC_DRV_NAME)) {
+				return -EPROBE_DEFER;
+			}
+		}
 		dev_warn(dev, "Couldn't get Chrome EC device pointer.\n");
 	}
 

base-commit: 48633acccf38d706d7b368400647bb9db9caf1ae
-- 
2.51.0.618.g983fd99d29-goog

