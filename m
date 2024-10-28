Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5060918C92D
	for <chrome-platform@lists.linux.dev>; Mon, 28 Oct 2024 08:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730103996; cv=none; b=l35GzSN3jpmAac788z7MoxUDrPc1lDlvhhjP0k8QbPwcgNuaEcKbQsmz0VOnK3nw613hCG8v3I36CaWhEYArEVv96nho3OlD0FDvKZlb3Tp0hxieus+83pgeqDmBx3oWARwhl9+tDHnSrop6r7uOSCiI1ttgOB1CLcflCbMStDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730103996; c=relaxed/simple;
	bh=2RROZOcH+oga+LkTQCQ3HKoR/p0c6zp5n24zcxYyRyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MlHayzOrdPp/UoZB948F7Ia0K0B7+tGdR25cQ7DuJqaOiJpKUgCkzyX/JBvNsAYZjWKIxSmK5j3VwlSIKqO0wZlit3eil7fzFlVxl9HN2G3Ds1ESf0RFljQfE1C271IQx/9OiI36VA9x+6xMFSAWHj9x1Ha4snRsoPz+rnJ13Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S++V2ld0; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S++V2ld0"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f7606199so4344937e87.0
        for <chrome-platform@lists.linux.dev>; Mon, 28 Oct 2024 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730103990; x=1730708790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4lUb1leR//RH9HeSKC0++QvL2bwzenRxNlIlRUSSGA=;
        b=S++V2ld0eGNWeNfg0a1des39yRSlB7+3v36JRTrBzHfGEuzQ0pRcdoHBUnSDi2xjh0
         04sBxWAeeQ6Zg8P/S9F2lMoObwf+G1FuoCjzlbAxUYvTM3M/Kft5a1SjUV2AfM4eETfN
         wkb6Redk6kvB+I/WjDILjC/MaiR3QMod7VbIJRfXbCJZcPq/BSMXq7nEBL7d7ox8cCw4
         3qhGsD1+hMs4Rxm8bGWYWGRZVPlsYueGfFXEHjDBNoT+bgaO+7G6+bc+CtHkT119MngV
         Cli6N7cD/SJAhs/yMdVEc100r9GCb+nAGui0CPLB580j9GHUw+QajsHwObQ0OwZ0F8z9
         pRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730103990; x=1730708790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4lUb1leR//RH9HeSKC0++QvL2bwzenRxNlIlRUSSGA=;
        b=ohyDI8+QxczNlj+TGlB7RWk8MbitFd2s+is0EOaZHPI9F/4fOBVGRuUZ7cvZhPXEBU
         FV7Y6wh3icrEoikrz62PEe3ljFyY1FzY/p+ninsogcpG8gRZy11uzGsu5mHCeW2EQhv6
         FeWxU5RwoL5IJaD6GKZtYwnobqg/ZsBPJD/NyqdzypWlYzWWsVMM+lARjshibdjDKhzf
         C07TqX2Uhoeyuxd/W/fESKrxjfdizMyF/HPZ/39e97la88zHYV5HziOQprAFVkkaeqxy
         4h+c6GLrKT+mWpOzj7ePLpvtfl8hTmGWQnV9Fm+EMS9G2ZEqhm4HIJvYq0pRTH3CzSoy
         M5wg==
X-Forwarded-Encrypted: i=1; AJvYcCXDzsDh9jnpnz97ZIznCVQZt/GkAE3jsX+jqtCpmZfEn0/KKPBqvtHa+lfH6abzYfr09XOXLnni4in1BKzBHLE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvBNkaRVBxCl6Kc/GQiFioLwI/3kkDoTQmNnB1UlYEVGtwKN0z
	QiuBynbW66tAcB61heomgVGA+hQ5ZBNVtYl0/wzBOJIgmDJ2n5Ye81mZRmWFgoM=
X-Google-Smtp-Source: AGHT+IGsx6b7R19/shmolSABawjSU1DLfRoeRAdMYcjKqH8zZId/xh3T0FxtiqljvTjayLaCaauwtQ==
X-Received: by 2002:a05:6512:1386:b0:539:f699:4954 with SMTP id 2adb3069b0e04-53b34c36247mr2181986e87.58.1730103990357;
        Mon, 28 Oct 2024 01:26:30 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4317d03ea4asm108693965e9.0.2024.10.28.01.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:26:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/chrome: Switch back to struct platform_driver::remove()
Date: Mon, 28 Oct 2024 09:26:11 +0100
Message-ID: <20241028082611.431723-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8955; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=2RROZOcH+oga+LkTQCQ3HKoR/p0c6zp5n24zcxYyRyw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnH0qkMUSO5Fz/R5dHF7h+xrROdaiCMDlI4oIHX iBN8ITSMPmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZx9KpAAKCRCPgPtYfRL+ Tk02B/0U9Xz9cdoNPwJj9Ib7XsJIZzjlVD353ChiFsftx4MXJon3RyGSzG7OKOGNrIFnhRAucqJ kjFgam2FdKYpLZEATWXOYH6lpYsF6xMJCK9ZQI38I0ryrhfMmEoS4v5e0Svi133F5FDm2iBMtWU mOoPPv26PjtOl4UEzCLpi+X9VYE6qcknKt9L3gZU1hQDc9qr20AAw+bLFgVdTtmLAlb7cb0Vd0r bTTD0oXoZSXYcbQwxrz2cSwn/HvbMRr0ZuIuHQA9l1UHiqmZB/YpUCnrg2xMkxkhAvdVMm1KKag AF1rQm1rdMFuwCbeatcrXFIAVv+5cnIQTslnUWcvyJEQk3mi
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/platform/chrome to use
.remove(), with the eventual goal to drop struct
platform_driver::remove_new(). As .remove() and .remove_new() have the
same prototypes, conversion is done by just changing the structure
member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/platform/chrome. While I usually
prefer to do one logical change per patch, this seems to be
overengineering here as the individual changes are really trivial and
shouldn't be much in the way for stable backports. But I'll happily
split the patch if you prefer it split.

This is based on Friday's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend.

Best regards
Uwe
 drivers/platform/chrome/cros_ec_chardev.c    | 2 +-
 drivers/platform/chrome/cros_ec_debugfs.c    | 2 +-
 drivers/platform/chrome/cros_ec_lightbar.c   | 2 +-
 drivers/platform/chrome/cros_ec_lpc.c        | 2 +-
 drivers/platform/chrome/cros_ec_sysfs.c      | 2 +-
 drivers/platform/chrome/cros_ec_typec.c      | 2 +-
 drivers/platform/chrome/cros_ec_vbc.c        | 2 +-
 drivers/platform/chrome/cros_typec_switch.c  | 2 +-
 drivers/platform/chrome/cros_usbpd_logger.c  | 2 +-
 drivers/platform/chrome/cros_usbpd_notify.c  | 4 ++--
 drivers/platform/chrome/wilco_ec/core.c      | 2 +-
 drivers/platform/chrome/wilco_ec/debugfs.c   | 2 +-
 drivers/platform/chrome/wilco_ec/telemetry.c | 2 +-
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index 7f034ead7ae4..21a484385fc5 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -415,7 +415,7 @@ static struct platform_driver cros_ec_chardev_driver = {
 		.name = DRV_NAME,
 	},
 	.probe = cros_ec_chardev_probe,
-	.remove_new = cros_ec_chardev_remove,
+	.remove = cros_ec_chardev_remove,
 	.id_table = cros_ec_chardev_id,
 };
 
diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 839154c46e46..92ac9a2f9c88 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -582,7 +582,7 @@ static struct platform_driver cros_ec_debugfs_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = cros_ec_debugfs_probe,
-	.remove_new = cros_ec_debugfs_remove,
+	.remove = cros_ec_debugfs_remove,
 	.id_table = cros_ec_debugfs_id,
 };
 
diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 1e69f61115a4..87634f6921b7 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -608,7 +608,7 @@ static struct platform_driver cros_ec_lightbar_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = cros_ec_lightbar_probe,
-	.remove_new = cros_ec_lightbar_remove,
+	.remove = cros_ec_lightbar_remove,
 	.id_table = cros_ec_lightbar_id,
 };
 
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index c784119ab5dc..924bf4d3cc77 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -783,7 +783,7 @@ static struct platform_driver cros_ec_lpc_driver = {
 		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
 	.probe = cros_ec_lpc_probe,
-	.remove_new = cros_ec_lpc_remove,
+	.remove = cros_ec_lpc_remove,
 };
 
 static struct platform_device cros_ec_lpc_device = {
diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
index 9c944146ee50..bc1a5ba09528 100644
--- a/drivers/platform/chrome/cros_ec_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_sysfs.c
@@ -359,7 +359,7 @@ static struct platform_driver cros_ec_sysfs_driver = {
 		.name = DRV_NAME,
 	},
 	.probe = cros_ec_sysfs_probe,
-	.remove_new = cros_ec_sysfs_remove,
+	.remove = cros_ec_sysfs_remove,
 	.id_table = cros_ec_sysfs_id,
 };
 
diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index f1324466efac..ae2f86296954 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -1326,7 +1326,7 @@ static struct platform_driver cros_typec_driver = {
 		.pm = &cros_typec_pm_ops,
 	},
 	.probe = cros_typec_probe,
-	.remove_new = cros_typec_remove,
+	.remove = cros_typec_remove,
 };
 
 module_platform_driver(cros_typec_driver);
diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platform/chrome/cros_ec_vbc.c
index 787a19db4911..7bdb489354c5 100644
--- a/drivers/platform/chrome/cros_ec_vbc.c
+++ b/drivers/platform/chrome/cros_ec_vbc.c
@@ -145,7 +145,7 @@ static struct platform_driver cros_ec_vbc_driver = {
 		.name = DRV_NAME,
 	},
 	.probe = cros_ec_vbc_probe,
-	.remove_new = cros_ec_vbc_remove,
+	.remove = cros_ec_vbc_remove,
 	.id_table = cros_ec_vbc_id,
 };
 
diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 07a19386dc4e..8d7c34abb0a1 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -318,7 +318,7 @@ static struct platform_driver cros_typec_switch_driver = {
 		.acpi_match_table = ACPI_PTR(cros_typec_switch_acpi_id),
 	},
 	.probe = cros_typec_switch_probe,
-	.remove_new = cros_typec_switch_remove,
+	.remove = cros_typec_switch_remove,
 };
 
 module_platform_driver(cros_typec_switch_driver);
diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
index 930c2f47269f..cd71f1caea81 100644
--- a/drivers/platform/chrome/cros_usbpd_logger.c
+++ b/drivers/platform/chrome/cros_usbpd_logger.c
@@ -262,7 +262,7 @@ static struct platform_driver cros_usbpd_logger_driver = {
 		.pm = &cros_usbpd_logger_pm_ops,
 	},
 	.probe = cros_usbpd_logger_probe,
-	.remove_new = cros_usbpd_logger_remove,
+	.remove = cros_usbpd_logger_remove,
 	.id_table = cros_usbpd_logger_id,
 };
 
diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platform/chrome/cros_usbpd_notify.c
index c83f81d86483..313d2bcd577b 100644
--- a/drivers/platform/chrome/cros_usbpd_notify.c
+++ b/drivers/platform/chrome/cros_usbpd_notify.c
@@ -156,7 +156,7 @@ static struct platform_driver cros_usbpd_notify_acpi_driver = {
 		.acpi_match_table = cros_usbpd_notify_acpi_device_ids,
 	},
 	.probe = cros_usbpd_notify_probe_acpi,
-	.remove_new = cros_usbpd_notify_remove_acpi,
+	.remove = cros_usbpd_notify_remove_acpi,
 };
 
 #endif /* CONFIG_ACPI */
@@ -230,7 +230,7 @@ static struct platform_driver cros_usbpd_notify_plat_driver = {
 		.name = DRV_NAME,
 	},
 	.probe = cros_usbpd_notify_probe_plat,
-	.remove_new = cros_usbpd_notify_remove_plat,
+	.remove = cros_usbpd_notify_remove_plat,
 	.id_table = cros_usbpd_notify_id,
 };
 
diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/chrome/wilco_ec/core.c
index 3e6b6cd81a9b..9f978e531e1f 100644
--- a/drivers/platform/chrome/wilco_ec/core.c
+++ b/drivers/platform/chrome/wilco_ec/core.c
@@ -163,7 +163,7 @@ static struct platform_driver wilco_ec_driver = {
 		.acpi_match_table = wilco_ec_acpi_device_ids,
 	},
 	.probe = wilco_ec_probe,
-	.remove_new = wilco_ec_remove,
+	.remove = wilco_ec_remove,
 	.id_table = wilco_ec_id,
 };
 
diff --git a/drivers/platform/chrome/wilco_ec/debugfs.c b/drivers/platform/chrome/wilco_ec/debugfs.c
index 99486086af6a..0617292b5cd7 100644
--- a/drivers/platform/chrome/wilco_ec/debugfs.c
+++ b/drivers/platform/chrome/wilco_ec/debugfs.c
@@ -276,7 +276,7 @@ static struct platform_driver wilco_ec_debugfs_driver = {
 		.name = DRV_NAME,
 	},
 	.probe = wilco_ec_debugfs_probe,
-	.remove_new = wilco_ec_debugfs_remove,
+	.remove = wilco_ec_debugfs_remove,
 	.id_table = wilco_ec_debugfs_id,
 };
 
diff --git a/drivers/platform/chrome/wilco_ec/telemetry.c b/drivers/platform/chrome/wilco_ec/telemetry.c
index a87877e4300a..7d8ae2cbf72f 100644
--- a/drivers/platform/chrome/wilco_ec/telemetry.c
+++ b/drivers/platform/chrome/wilco_ec/telemetry.c
@@ -417,7 +417,7 @@ MODULE_DEVICE_TABLE(platform, telem_id);
 
 static struct platform_driver telem_driver = {
 	.probe = telem_device_probe,
-	.remove_new = telem_device_remove,
+	.remove = telem_device_remove,
 	.driver = {
 		.name = DRV_NAME,
 	},

base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
-- 
2.45.2

