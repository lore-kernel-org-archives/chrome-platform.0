Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68EC3B993A
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690673; cv=none; b=sECbbfdlAhhsxUS1tYQVQvYBUmANQDBtFqEsk6zp2Vj4g18ghQiS47+rr9oeeJF+0yJyaXuOpXIAdIJ12avQFg+vI/s71i4M0rRGhKN9IMofHau0af9yeRmEYc7ZUpN8a0B8tdHlfN1dnyPVA/qNaewQ6I+ve/tuy4BFAgdbfSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690673; c=relaxed/simple;
	bh=4s0FTdhbkGY/zOo2qdydmIxkiH9oAib72E8B+UogNjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ojr+DR7APr0g0uSLgFo/DmI3wCAGh1qbMeSAXWS07Z9LZ33LRNDIF+VN9ipDaGtJDH6xIIepEGBiSfXHTUKTujSIqoAE8O+oTn4ac+UL1TehePejitJAGRmHwvOULHgPboxIxazj5UwGAg8gm1Fziwdwxo7I1DnoHNaSczRXLVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UZnszwSF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UZnszwSF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-461a5a39da1so1347250f8f.2
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781690668; x=1782295468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8iywNsFgB0k0R82k+cCh7krqrwnke0rbuWO4aE9FcJ8=;
        b=UZnszwSF31iPsHqDD/s6UndXGZbu/O8sTrIn2Nu+Dwg8Kd2VMRSXnllkNBZzHxH/uP
         FxGkWY+lhK3XpwQv/HqEteDTG8Mc/NMc7tVNQCQeJXV7bvHmWmjWNmWh5LuWp2GWSdhs
         I2Csq41q2XXRaeoC294tSMwIKugqEu0aabhJu28PjkVh0kL9j8X+dLfcBoy9T7rEtdLm
         /uJc8/k4tNxuPdn8xonsWaGA4nOtOGhmLd7kr1tuSAUR4Q6lwC4XFaw6602FxYh0TSiC
         gq8xHbUs/gDdZ/Xcq09sOBMVYbmYpqF7Oo4hShSyyrzp5oj0TbEYGJlBGn+IT1XPUwC8
         eKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690668; x=1782295468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iywNsFgB0k0R82k+cCh7krqrwnke0rbuWO4aE9FcJ8=;
        b=juMnLhT4QKH8ATS/q1MMj7oZOBic4Fjq0VGbsRU2sQdWHJQvFwPl8WGSpfk4Tc2DjR
         hRngjH/L8NtMZkLzgax5NMr1QjtlTOJfdbr62LiXTbpnxfdyTVmKT9NGOyHSHHkA6XdD
         PFBDZUqJJPzKsZBG8Cmj0ZO8CBdWJNyFZHNhUa20GR3EkYdFsi6E40A+kagJ9gsweZh4
         NLyuqWNn04yMzWqsHHc/yenOydqZHO6EyfVrnI3O5WxzTYkrZrFlHQIxT0BF6wB91MiH
         czbYjlxFlp5rImG/tQn6b3Av5EM+XV5/arEmMapzkFif89CyqzFQX5WVHvsYYvhSzBJM
         qFGQ==
X-Forwarded-Encrypted: i=1; AFNElJ95lncFhnFHrzU1rqkzYQYQI5mU4c/u+klcQnJvi+PXY0vFMV8wzRrJtvTx5Nh8e9LrJ8sKMszg7WLS/zkoKJM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdOkeYEfxPd+ha7a6GaZJQRYM/S26o/tJLrM/8L0nlErVu/lRf
	1unDz7yT60PEwktIMZ95uX7p/tDIZpM74dEmq1PDaQNNgIdauuTKAsOYho9gQK4YdVg=
X-Gm-Gg: AfdE7cmWGwUIszI1npOBsoq7y5/5286jDlcTGpj0JM5LPW6wUS4cI2pIcKr4Dh6pzXy
	geuvOsGc4Jrw2ExAUlz3aIs/+1nyVkZCLI80w1xN9py8i22a6/Nf/VwFz2lDHz37Nv23lUvhv83
	N/93UN/lat0uXhH+0RmkjGr1seo6Uhxo1pNmAmUFR4eLfSXAjJi8Jd7Hebr+wHD8vugspXh5cgC
	Ocp4o1g9s7HNb3if3YCUSx3P+f2Mswjm2zjopb7BG7sJuTp8GHmUrDos3HwEk3/CQuX/cvb8qSx
	ZMRxbiMCDqxPYD5jfsY5HnKVbT/uhhPrVOqTx2zrrTKsprDzs0TFHNa1kmbsoy+EQ47dnVpZ63v
	cRwESI9TUBv58D9x1A/itbRlnjILx5cSjKSQZBTYf3lWrFdrLgDyOfYKPlGksahm/woRKwRcPpT
	adPKXXz4ITz3DOTZuJhJG5TQKs1ZQZDPru9Uox5y8/FxQFtE++OjN4t3MUREJco/1zZ8spprMLM
	Jqy
X-Received: by 2002:a5d:46ce:0:b0:461:c779:1e45 with SMTP id ffacd0b85a97d-46235e9bae2mr3776968f8f.2.1781690668099;
        Wed, 17 Jun 2026 03:04:28 -0700 (PDT)
Received: from localhost (p200300f65f47db04bc2080ea3c93ea6d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:bc20:80ea:3c93:ea6d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-462236047c8sm7932612f8f.10.2026.06.17.03.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:04:27 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?utf-8?q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>
Cc: Guenter Roeck <groeck@chromium.org>,
	Liao Yuanhong <liaoyuanhong@vivo.com>,
	Kees Cook <kees@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] platform/chrome: Drop unused assignment of platform_device_id driver data
Date: Wed, 17 Jun 2026 12:04:13 +0200
Message-ID:  <5b72bac661bdf1c874bea4b91ce3c2eccc84bba1.1781690554.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7578; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4s0FTdhbkGY/zOo2qdydmIxkiH9oAib72E8B+UogNjg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqMnEfneevwVJjwmsk0YiJ5LNfZ7BwNRlq62m+q 2ejV9Muf22JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajJxHwAKCRCPgPtYfRL+ Tu9XB/0bjdovv1HbrolJOgV8/slMZbvruZWQmOIRSh5peEiPber8ity+0T34bV61623exQUc6cS z9bddSNmZgT5TtDhMqAIk0k7hOifwJbFvSQEHSwZUQJ/u16QY1eKWAxL0W2PspYtDHRPTnPPGrH 11/SFAT+qxOAKuIGHCk3llxlOfuDAMVNHk0i3c3VWvhQZk6wGC2cq4MvsJh6u9+ZuHHLBwnOjUP 3m3GSPN3cXCmVbRAOktxSjACLp9GbWYGMCsJHI06/l+sAR4qliHQWMh0oWiXTKYwPOhFf3ewODT iHcPeiTBuL+EvXgXcjgFaaZ8JqA8T+6aeOgHy3zAbpPishmJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments.

While touching these arrays use a single space in the list terminator
consistently.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/platform/chrome/cros_ec_chardev.c        | 4 ++--
 drivers/platform/chrome/cros_ec_debugfs.c        | 4 ++--
 drivers/platform/chrome/cros_ec_lightbar.c       | 4 ++--
 drivers/platform/chrome/cros_ec_sensorhub.c      | 4 ++--
 drivers/platform/chrome/cros_ec_sysfs.c          | 4 ++--
 drivers/platform/chrome/cros_ec_vbc.c            | 4 ++--
 drivers/platform/chrome/cros_kbd_led_backlight.c | 4 ++--
 drivers/platform/chrome/cros_usbpd_logger.c      | 4 ++--
 drivers/platform/chrome/cros_usbpd_notify.c      | 4 ++--
 drivers/platform/chrome/wilco_ec/core.c          | 4 ++--
 drivers/platform/chrome/wilco_ec/debugfs.c       | 4 ++--
 drivers/platform/chrome/wilco_ec/telemetry.c     | 4 ++--
 12 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 47e03014dcbe..2565510ecaa7 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -485,8 +485,8 @@ static void cros_ec_chardev_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_chardev_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_chardev_id);
 
diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index d10f9561990c..4b8ae51bfaa9 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -558,8 +558,8 @@ static SIMPLE_DEV_PM_OPS(cros_ec_debugfs_pm_ops,
 			 cros_ec_debugfs_suspend, cros_ec_debugfs_resume);
 
 static const struct platform_device_id cros_ec_debugfs_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_debugfs_id);
 
diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index f69f2f6de276..d7e9928e263d 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -684,8 +684,8 @@ static SIMPLE_DEV_PM_OPS(cros_ec_lightbar_pm_ops,
 			 cros_ec_lightbar_suspend, cros_ec_lightbar_resume);
 
 static const struct platform_device_id cros_ec_lightbar_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_lightbar_id);
 
diff --git a/drivers/platform/chrome/cros_ec_sensorhub.c b/drivers/platform/chrome/cros_ec_sensorhub.c
index f938c3fc84e4..58eb28d6e118 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub.c
@@ -268,8 +268,8 @@ static SIMPLE_DEV_PM_OPS(cros_ec_sensorhub_pm_ops,
 		cros_ec_sensorhub_resume);
 
 static const struct platform_device_id cros_ec_sensorhub_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_sensorhub_id);
 
diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
index 9d3767ab1548..46e8ac7f94af 100644
--- a/drivers/platform/chrome/cros_ec_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_sysfs.c
@@ -421,8 +421,8 @@ static void cros_ec_sysfs_remove(struct platform_device *pd)
 }
 
 static const struct platform_device_id cros_ec_sysfs_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_sysfs_id);
 
diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platform/chrome/cros_ec_vbc.c
index 5ee8adaa6564..9cb4631e1227 100644
--- a/drivers/platform/chrome/cros_ec_vbc.c
+++ b/drivers/platform/chrome/cros_ec_vbc.c
@@ -135,8 +135,8 @@ static void cros_ec_vbc_remove(struct platform_device *pd)
 }
 
 static const struct platform_device_id cros_ec_vbc_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_vbc_id);
 
diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index 80dc52833dc9..7f7483d58170 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -221,8 +221,8 @@ MODULE_DEVICE_TABLE(acpi, keyboard_led_acpi_match);
 #endif
 
 static const struct platform_device_id keyboard_led_id[] = {
-	{ "cros-keyboard-leds", 0 },
-	{}
+	{ .name = "cros-keyboard-leds" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, keyboard_led_id);
 
diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
index d343e1ab6f08..54f04a43cba0 100644
--- a/drivers/platform/chrome/cros_usbpd_logger.c
+++ b/drivers/platform/chrome/cros_usbpd_logger.c
@@ -249,8 +249,8 @@ static SIMPLE_DEV_PM_OPS(cros_usbpd_logger_pm_ops, cros_usbpd_logger_suspend,
 			 cros_usbpd_logger_resume);
 
 static const struct platform_device_id cros_usbpd_logger_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_usbpd_logger_id);
 
diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platform/chrome/cros_usbpd_notify.c
index c90174360004..bdf3b2ab17a7 100644
--- a/drivers/platform/chrome/cros_usbpd_notify.c
+++ b/drivers/platform/chrome/cros_usbpd_notify.c
@@ -233,8 +233,8 @@ static void cros_usbpd_notify_remove_plat(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_usbpd_notify_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_usbpd_notify_id);
 
diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/chrome/wilco_ec/core.c
index 9f978e531e1f..0b13f4509091 100644
--- a/drivers/platform/chrome/wilco_ec/core.c
+++ b/drivers/platform/chrome/wilco_ec/core.c
@@ -152,8 +152,8 @@ static const struct acpi_device_id wilco_ec_acpi_device_ids[] = {
 MODULE_DEVICE_TABLE(acpi, wilco_ec_acpi_device_ids);
 
 static const struct platform_device_id wilco_ec_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, wilco_ec_id);
 
diff --git a/drivers/platform/chrome/wilco_ec/debugfs.c b/drivers/platform/chrome/wilco_ec/debugfs.c
index 0617292b5cd7..69f8ac4d64dd 100644
--- a/drivers/platform/chrome/wilco_ec/debugfs.c
+++ b/drivers/platform/chrome/wilco_ec/debugfs.c
@@ -266,8 +266,8 @@ static void wilco_ec_debugfs_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id wilco_ec_debugfs_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, wilco_ec_debugfs_id);
 
diff --git a/drivers/platform/chrome/wilco_ec/telemetry.c b/drivers/platform/chrome/wilco_ec/telemetry.c
index cadb68fa0a40..ac4c5943da1f 100644
--- a/drivers/platform/chrome/wilco_ec/telemetry.c
+++ b/drivers/platform/chrome/wilco_ec/telemetry.c
@@ -410,8 +410,8 @@ static void telem_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id telem_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, telem_id);
 

base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
-- 
2.47.3

