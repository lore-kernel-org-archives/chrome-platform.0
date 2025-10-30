Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3CB332ECC
	for <chrome-platform@lists.linux.dev>; Thu, 30 Oct 2025 19:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761854400; cv=none; b=f1Wtze/EIfDt5ugfmJszwHbcwBFrmHGTtsB5iCg/KWsZs8710f43B16f2xQqtZdx/rByuJC/gw5rb4MD1bs1+j745eb1veNKU8BRBllFBVG3xxcA1exh5WJ7OyHgjbPG7IJ+10U/v64NiWVFfzwS17zhCF7t+X4xGCvbaLTdNsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761854400; c=relaxed/simple;
	bh=0/Ay5xIMjaO6H9CAGlnV5wtZpnCbDWuIf9Vw4FRb8NE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=prYdiSL9zD5v0f+5JZ5P1WA/FPnCpRIbetItkxzN1Ig92KOq/4/qQI2u7rFrXPJuzLkVuy8/oE/G1Ba4ju9gyusus4SFuCIbMTUZlTdQDGOrU4yRwJokW1AkV8TGTAcMXh1jpXKajdEsQ5o/KvAt8gg0f+rOGmSU6egy3Au+euE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvCXtkxJ; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvCXtkxJ"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-940d327df21so59366939f.1
        for <chrome-platform@lists.linux.dev>; Thu, 30 Oct 2025 12:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761854398; x=1762459198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bWc+qSCsaB++95Y0qEzQptO8LIk3YM0/Lnj21sNqRgI=;
        b=hvCXtkxJl+HraLWbzBE9FjKPuVSqhm4JvHQq1/0eNaFCP/ArTSgs/CGPj4soa4msvu
         cCRaVpkUGUZ82vz42kX58tHoN3TBLgNYNg9JIrpnDUfTn/XkQ97F48UEm2MWMOG3edo3
         s7eRFPhLTYNMH76fmi1oMrbz079WRCEI/QupE0xOpcQ+Tp5wuQdpvCWxWI2PNf6nvafZ
         AvzQpI9Xrw4t8JQpheBbqC0uPrl096mJlSNx++Bx9CS9xUt7hJ4hZmxlvzIcNjQ17MJQ
         G+X8Ezw30+6nijI6nGfrRbdS3wQpNopueb1bDXPCF8o0E9FzEnrFzRrUOV5IGLvKiU4j
         ucCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761854398; x=1762459198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWc+qSCsaB++95Y0qEzQptO8LIk3YM0/Lnj21sNqRgI=;
        b=VYytjp11sF7P6a/83N98dbZlHlzKb03r6aVI31EefF5Y+AnuMeeF2/9hWyw0Jki51L
         05/7VDuv6dNhzr8RR/78FiDS+qRInQMFxzaRLh2XtERiSX0evhtCvb7MUqKT2md1ym18
         0Iy4wVXR4OBpSiSm56wJqauO6Hij9ZB678Tsn6wHRnMAnSJ4bhbaBzmTUGKiQleHjT4h
         7zcQkYSgcWkzuIckEsS7NU3/xuHgQqbFyGgddLo01RnKR2e5IZQ2y4H2+9Y7pbbL2rvx
         uWAhAKVz6Y1gqHvx/Yd3NZGW6Yp9uUwvT6HLNZnzwg5wTcX0oPbuZ0mhhmWD4HFiqf3+
         fZcw==
X-Gm-Message-State: AOJu0YyFwPLIQbb05Wk+C/g1n3bB0eKjXxSdXnFgq3W4592fj9hcqHL3
	g5el6lBnUCWZ28gm6ErUsjywCxi7a7EFG9q8Du22TUKEDMo2UK6T+xDDZvju3L5A
X-Gm-Gg: ASbGncsDu8tdZCiB9I3KOwSyF3nvA7/pXXhsAvs6/xa4NbOhZf6ejvvnD/xVrqFS37o
	WcBt1FxE+kHTXZ9qfIlhOOKqhRfa+D+e7g2biRI9DqFINjmK1oo40LD33gkOvLpQvXzDZ8+8F0e
	ZqejyK3yhz0ew/fdk/k82ce2wdBjwt7zVJelceZk4P9iS89rGJPhEg2jPpQte0+YwBI7swFLEXA
	rZOgjzKdRPjrFibn2aj/v66Pp3dPqnHcvLSJkbZgjIl2frbXg3IzE/SIhfbJsvz0cH6jcuNR5OR
	ucJcJQjiU9bWFwVT22pdCXKUlB9gjut8yTnYmbwoAxPRd1ebMh68oKNsGLKkQat1WVhh2zyK9FN
	bqOA3FNhwATVSBRK5rK3E/NNR7GbbpgvzeT12Sx+ZmqnlT+IA5a2MH9X6d+GP//EnqYQdop/3
X-Google-Smtp-Source: AGHT+IFf9MIiWLP3EO9J80LImBhp1n37tBGg7wCockg/FHC33/k9aal+Cr7NrJrymrQLn7+b2YAlYw==
X-Received: by 2002:a05:6e02:221a:b0:42f:9353:c7bc with SMTP id e9e14a558f8ab-4330d12c587mr16467125ab.6.1761854397804;
        Thu, 30 Oct 2025 12:59:57 -0700 (PDT)
Received: from aperture.tree.net ([2601:40a:8000:28d9::f29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea995d412sm7065972173.46.2025.10.30.12.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 12:59:57 -0700 (PDT)
From: Brady Norander <bradynorander@gmail.com>
To: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Brady Norander <bradynorander@gmail.com>
Subject: [PATCH v2] platform/chrome: cros_ec_lightbar: Check if ec supports suspend commands
Date: Thu, 30 Oct 2025 15:59:11 -0400
Message-ID: <20251030195910.8625-2-bradynorander@gmail.com>
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
suspend control if -EINVAL is returned.

Signed-off-by: Brady Norander <bradynorander@gmail.com>
---

v2:
- Only catch -EINVAL from lb_manual_suspend_ctrl()

 drivers/platform/chrome/cros_ec_lightbar.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 87634f6921b7..893d269f6384 100644
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
+	has_manual_suspend = (lb_manual_suspend_ctrl(ec_dev, 1) != -EINVAL);
 
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

