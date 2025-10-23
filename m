Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A857B14B06C
	for <chrome-platform@lists.linux.dev>; Thu, 23 Oct 2025 23:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761263098; cv=none; b=YBn7eS9nrTB834hv4+qE6B4hvSsihtKHmcnvYudXE3Do5+p2QPpIq0UmXjywWmVveMCqvyRmJfDtpE1j29sadCzEUctqDR30NzBHs9FMaDlBtJS3uuTK9EqpjeNr7Nb7Jgy5HkQh3RuhLH8PyOcGQQlcAIn3MrcukuvYwoEDGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761263098; c=relaxed/simple;
	bh=ofon3zRhL7g5DEfj7LACmcneRju3vqklLAunt9FWqfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TPP0wdItUrONfCalDITJTVkfF3a/sIJ9eN7LtpIJ9RalWA7f/VeejgeURECgf3IdVFkso3GJEkUkYfiUAhjsu/GhWDZekQRzdztiFcHPNsKYemufydWrRakLx/Yl/SYAjJYmsaGEPh8XfcowV3tgIDH5kUX2bmAsochKvkM2luU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpNOtj3c; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpNOtj3c"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-93f11fdd538so59747639f.3
        for <chrome-platform@lists.linux.dev>; Thu, 23 Oct 2025 16:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761263095; x=1761867895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AA9DnYHnL0FjnmMgHP+rM1jzEwbK34syKt1KByA1wig=;
        b=YpNOtj3ciANU+aAe7l2uFppEmePntPITIP+ByD66c/YK+nHRh27cQbMEsm+HzTRWRO
         yjl02O8ffOuoPMbIAm0YdaGtH+f5b7BCdzrtAwNvB1kVdG5+1XNopxFVn0q3AHJz8J0i
         /0iMVqkNK5Qkp9fIHEQnTTTJUiM51NEziA/eDrs6tvrEbuRB1vioy30JINh0ldPvRhIe
         YfUl0S1SZUkC8bFn98v5XYPtfak5hqiXgKV3NbBkpXy7ruBkzZMmqHV+xvYIT5JOnu0Q
         jafrP4fIo/+iqtzHWpQQ2wabtXDr9+mXnDytidRl1nW40t2DcThwXV6B2LDx3HLgq57E
         4mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761263095; x=1761867895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AA9DnYHnL0FjnmMgHP+rM1jzEwbK34syKt1KByA1wig=;
        b=h3T1NtnSJuTFZSm+tBPRQE4CNIVuTWW+VjT1db91ap5C4EzGcJBqHm5yyWmTfiHQbf
         xo2iLfNN9NnV2GSQvIT33+TgyoMfT5vUG95Mj5+978CImxcag1HB0gQ35PVVFpnVNYBd
         6TpIgFLYoODUWy8ti6ZwSnMWgygtdpdi7hATXC9J0LQjxEBHJolqsC7wqCur7qBwwyRZ
         3iIvqBOp5yT5qvbmkhJ6RXQJ39ZvwpT5YmXxmuRFuNZgpHBL3yh9vlV0ghxjK4Dxnx3p
         CDwdgS6LZNCwTW/3fsnsnYwUFDy54BQrC2Dt+nvkzZpXjQFasBCei+OXA8hyzfgorVfz
         hmmg==
X-Gm-Message-State: AOJu0YwZa1HpOzuJhakdyZsRseeoKr6jXAGZPfAT3yMdiCE/jMcvUY7v
	IwQeaDDHUc4jG/ztG7oBVq4pvka4OnVSosHyOp/a+BD0eK/oTxa/4e72frNc57Jl
X-Gm-Gg: ASbGnctd7/rr1Kdadd7fK26hZAYWuU1opgbnp+NWd6M2AKkY++TX+7Y9QP/PMRBaaqB
	/exHbblB1O/+hzerGs38Xm/H2DyTotDTgO2ltm0lnfDaJVlgwqqPf+IixX/Ah0OewSHHlcpm9iq
	dk1qCDNJE7bzfswbi6rnED2bYa6O30AY4OE7V3M5haSKkjlF9+ZpG+zJSM0MSUkV1Vt3KhwuV2j
	9+v4aT+MMweoXSaRniH5UIUkpACJIGj9FbSxeMB12bjfO2IQ+S3SavCiW3YYuEY0E/ZLhspfL/K
	kT5uKqAYSouyqcFrtZG9fePS4n/hCWH9erEauQHBfcrUfudjrBQHVdeoJWFpFaZPfujy2jk1oWC
	PUzaYHC8OGknZCRRGAevL6JO9LNg0kjItQx4dB/QAjcUVRcNCxQKDTbzOkTzx5ajfiadJwbyhkd
	Ap711axmg=
X-Google-Smtp-Source: AGHT+IGaw0oK77+a5zH60SDSV4zBNjek6pSZSQhHAvv/0a1tUdsXy8diawp15QZPvbJ2zky1dbp0ig==
X-Received: by 2002:a05:6e02:248d:b0:431:d3c9:66a2 with SMTP id e9e14a558f8ab-431ebdf1645mr8086785ab.2.1761263095610;
        Thu, 23 Oct 2025 16:44:55 -0700 (PDT)
Received: from aperture.tree.net ([2601:40a:8000:28d9::f29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb4e4c958sm1474517173.3.2025.10.23.16.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 16:44:55 -0700 (PDT)
From: Brady Norander <bradynorander@gmail.com>
To: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Brady Norander <bradynorander@gmail.com>
Subject: [PATCH] platform/chrome: cros_ec_lightbar: Check if ec supports suspend commands
Date: Thu, 23 Oct 2025 19:42:40 -0400
Message-ID: <20251023234239.23882-2-bradynorander@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Chromebook Pixel 2013 (Link)'s ec does not support the lightbar manual suspend commands.
As a result, attempting to suspend the device fails and prints the following error:

    cros-ec-lightbar cros-ec-lightbar.3.auto: PM: dpm_run_callback(): platform_pm_suspend returns -22
    cros-ec-lightbar cros-ec-lightbar.3.auto: PM: failed to suspend: error -22
    PM: Some devices failed to suspend, or early wake event detected

Check the return value of lb_manual_suspend_ctrl in cros_ec_lightbar_probe and disable manual
suspend control if an error is returned.

Signed-off-by: Brady Norander <bradynorander@gmail.com>

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 87634f6921b7..1b7e4c4e18bc 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -30,6 +30,13 @@ static unsigned long lb_interval_jiffies = 50 * HZ / 1000;
  */
 static bool userspace_control;
 
+/*
+ * Whether or not the lightbar supports the manual suspend commands.
+ * The Pixel 2013 (Link) does not while all other devices with a
+ * lightbar do.
+*/
+static bool has_manual_suspend;
+
 static ssize_t interval_msec_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
@@ -550,7 +557,7 @@ static int cros_ec_lightbar_probe(struct platform_device *pd)
 		return -ENODEV;
 
 	/* Take control of the lightbar from the EC. */
-	lb_manual_suspend_ctrl(ec_dev, 1);
+	has_manual_suspend = (lb_manual_suspend_ctrl(ec_dev, 1) >= 0);
 
 	ret = sysfs_create_group(&ec_dev->class_dev.kobj,
 				 &cros_ec_lightbar_attr_group);
@@ -569,14 +576,15 @@ static void cros_ec_lightbar_remove(struct platform_device *pd)
 			   &cros_ec_lightbar_attr_group);
 
 	/* Let the EC take over the lightbar again. */
-	lb_manual_suspend_ctrl(ec_dev, 0);
+	if (has_manual_suspend)
+		lb_manual_suspend_ctrl(ec_dev, 0);
 }
 
 static int __maybe_unused cros_ec_lightbar_resume(struct device *dev)
 {
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
 
-	if (userspace_control)
+	if (userspace_control || !has_manual_suspend)
 		return 0;
 
 	return lb_send_empty_cmd(ec_dev, LIGHTBAR_CMD_RESUME);
@@ -586,7 +594,7 @@ static int __maybe_unused cros_ec_lightbar_suspend(struct device *dev)
 {
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
 
-	if (userspace_control)
+	if (userspace_control || !has_manual_suspend)
 		return 0;
 
 	return lb_send_empty_cmd(ec_dev, LIGHTBAR_CMD_SUSPEND);
-- 
2.51.0

