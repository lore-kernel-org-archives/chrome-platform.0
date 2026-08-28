Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323D39460
	for <chrome-platform@lists.linux.dev>; Fri, 28 Aug 2026 02:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883272; cv=none; b=Uo1TSCZmSFLmBTsxUIxc1R1JDutbUfyEQBqYSOeIk4x82EvVX7PHI4GZ42995yuTPqh8b4AjJzh1Tx2giaMlxza3EKGPzzzbnTqRzbRmJjiHV+znMJ8uNWVXoScsQFzipcP3IsVjR2nWMYdDB/6BWl+OcSW+85jwDLcJ0hN702c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883272; c=relaxed/simple;
	bh=jxTqiB5pvknMxWIZCebGTM+LY2HU4BCM81AYzWN0suM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/pN4W3VO/Wgv7qT7Zt80gtcUnK+qvpN/0BVbRQg88o9S9FKzOSpbIimP3/OaDhI61MGk1Q7FP0oImHNUhDN6grSCeK7LL30d7Xef9tBezuvTZ18kK/53fDkaS4uZ9Da51Y3/kLgatIq1Rlj3itFhXc+/HjaLY3NLLwKsa6TZ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGvxkBHa; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGvxkBHa"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1005927a91.0
        for <chrome-platform@lists.linux.dev>; Thu, 27 Aug 2026 19:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787883270; x=1788488070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsbJC9GZmokgjHFLchvU7C0YDsWFwymb0mCZdNSKvYg=;
        b=CGvxkBHajC4FiW4rfw8JnUNoDB5RKgwr/JMmUDMPN7cHUMDXLjd0oxh/OpS2yhkeK5
         UHfw/3dY+jphb6cxLxkxg2BFgRIgidFWIZWNHb3BUv77SIHljXk71Yfl9NePvNcMPUQC
         dzOBuGxt/yTrg96u8ulfXkSkKqse8lox79eJ9T0pA7si3hgthS9CiJOqjCCgMydWhxWH
         VjlZ/+hGFx1ddoFiKBcAI74KYRW8f7VMXlC9tzIu9nyM1JoRQUCwWkTiO8m4s66JcnTR
         qYP1wE0AcKpyTyZKQ4rru5CnFF2KKvnT0kwi9suxCfnXbrmsEQ/WbfP4GiALpibpltFl
         EFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787883270; x=1788488070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsbJC9GZmokgjHFLchvU7C0YDsWFwymb0mCZdNSKvYg=;
        b=EPQZZ0WBTHCZvlcsOSgSqV2TJXavxzRxMOUX5pPo9JXDiC5AZb635wQkL4Xm8SkRz6
         WpkQXqxIii37jpW64qvOmes9BcIy6iSOaBu2HosIxwKA6q1OrPW0Q217sDl8LPl5AUCz
         M4SLpHvLj+gtbT7gu7FjfH6i5kR1QhM9jOwAFD7NiYg4XxeMjn69TWHYlxGlUJUDLcxg
         /sI2CNDLUszw07JUXa4flNz6NNxzslKmICuyaxaW+l1FZa/hjht+A8kGFDu8Vdgw4Tnu
         YQikobhJ1pf+8uEeINYRSC2q9yW2OucK9N0o8iw0qk+jXTVX5Ln7Hf8tbWGSo4kgij9Q
         bAiw==
X-Forwarded-Encrypted: i=1; AHgh+RphqiIacgVsBtkXw+YHO8aPJbOAd6+Hpv4ZJpnKbtKnyIyPxwXoEx4WKIkOiEIpgeyF25poq8u2Z1Da8jY/dqE=@lists.linux.dev
X-Gm-Message-State: AFuF++mS4uwk0vKeR1d7SZNPwSY2UkbfwchJ1ks/4lLw/ZBgfrWUjqLF
	+W3bJNS9DFoiLK3ZDN4iEC+d0WikEnV69RWNn1lqK3CEBAJdEyDb9BY=
X-Gm-Gg: AR+sD12WjU6iB4mWrxWizximpsWBRNqfML+Tqyykf4WPZU0JKj8MI+xWYWrLTjILJvb
	XGyaknG+8HdGscgaeSD2lazdZfT3hhGytQlGlX//Z6c266k8vOa+/+2EDYqvx95FRs+R3LMWxhY
	JGveKxnUYMZ4bRV2TebtMJ2PGj35ISuByZbKz43oXjF3PUHjH5/gaQVieLb1F98VdDqMZLFn6hY
	rRdv4ow6QHCS4Ra/OvyfemLzrY1inxK32CTQfi59KnJODNyZeW22geFswqY2BcvFHU4SRsGw2JG
	Wq0RVjziaQliwaQwZ1WxjITY/dkkj9p7TTQvCFcE1Li2B9f5c5pVSzuH7mfeVG8+fmMEXI1/k4r
	cReUe/EYEkF55DRuRXdD50m62kyzw/eQ+TXeLyr1Rw815wt3grgD3QD/lpXMSuFpENgcG7o/wtW
	K9Zfcwd2udOiUmCniZJeJUF015dgt5ztr/ewg/RoYQAnI5GdesaaPLfbofzl1lFI8wp84ZreTv
X-Received: by 2002:a17:90b:3ec3:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-396d0ebd7eemr5881409a91.9.1787883270506;
        Thu, 27 Aug 2026 19:14:30 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([113.185.111.3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa400c8sm586799eec.30.2026.08.27.19.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 19:14:29 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: andriy.shevchenko@intel.com
Cc: andy@kernel.org,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	dlechner@baylibre.com,
	groeck@chromium.org,
	jic23@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	tzungbi@kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH v4] iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 28 Aug 2026 09:13:49 +0700
Message-ID: <20260828021350.1666063-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
and pm_sleep_ptr(). Also replace SIMPLE_DEV_PM_OPS() + EXPORT_SYMBOL_GPL()
with EXPORT_GPL_SIMPLE_DEV_PM_OPS().

This allows us to drop the __maybe_unused annotations from the resume callback.
This is a straightforward cleanup with no functional change intended.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
Changes in v2:
- Use EXPORT_GPL_SIMPLE_DEV_PM_OPS for cros_ec_sensors_pm_ops
- Wrap to 75 ish chars for commit messages.
Changes in v3:
- Update commit message based on feedback from v2, and added Reviewed-by tags.
Changes in v4:
- Remove the "Reviewed-by" tags.
- Address EXPORT_GPL_SIMPLE_DEV_PM_OPS() usage in cros_ec_sensors_core.c.
---

 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c      | 2 +-
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 5 ++---
 drivers/iio/light/cros_ec_light_prox.c                    | 2 +-
 drivers/iio/pressure/cros_ec_baro.c                       | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index b971f8b646be..551b86236abc 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
@@ -311,7 +311,7 @@ MODULE_DEVICE_TABLE(platform, cros_ec_sensors_ids);
 static struct platform_driver cros_ec_sensors_platform_driver = {
 	.driver = {
 		.name	= "cros-ec-sensors",
-		.pm	= &cros_ec_sensors_pm_ops,
+		.pm	= pm_sleep_ptr(&cros_ec_sensors_pm_ops),
 	},
 	.probe		= cros_ec_sensors_probe,
 	.id_table	= cros_ec_sensors_ids,
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
index 5133755c2ea6..d03e40c91582 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
@@ -862,7 +862,7 @@ int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
 }
 EXPORT_SYMBOL_GPL(cros_ec_sensors_core_write);
 
-static int __maybe_unused cros_ec_sensors_resume(struct device *dev)
+static int cros_ec_sensors_resume(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
@@ -879,8 +879,7 @@ static int __maybe_unused cros_ec_sensors_resume(struct device *dev)
 	return ret;
 }
 
-SIMPLE_DEV_PM_OPS(cros_ec_sensors_pm_ops, NULL, cros_ec_sensors_resume);
-EXPORT_SYMBOL_GPL(cros_ec_sensors_pm_ops);
+EXPORT_GPL_SIMPLE_DEV_PM_OPS(cros_ec_sensors_pm_ops, NULL, cros_ec_sensors_resume);
 
 MODULE_DESCRIPTION("ChromeOS EC sensor hub core functions");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/iio/light/cros_ec_light_prox.c b/drivers/iio/light/cros_ec_light_prox.c
index 7ab565b1fb9f..b1c92de7922a 100644
--- a/drivers/iio/light/cros_ec_light_prox.c
+++ b/drivers/iio/light/cros_ec_light_prox.c
@@ -249,7 +249,7 @@ MODULE_DEVICE_TABLE(platform, cros_ec_light_prox_ids);
 static struct platform_driver cros_ec_light_prox_platform_driver = {
 	.driver = {
 		.name	= "cros-ec-light-prox",
-		.pm	= &cros_ec_sensors_pm_ops,
+		.pm	= pm_sleep_ptr(&cros_ec_sensors_pm_ops),
 	},
 	.probe		= cros_ec_light_prox_probe,
 	.id_table	= cros_ec_light_prox_ids,
diff --git a/drivers/iio/pressure/cros_ec_baro.c b/drivers/iio/pressure/cros_ec_baro.c
index 6a567b6075d9..e4bc4df48d01 100644
--- a/drivers/iio/pressure/cros_ec_baro.c
+++ b/drivers/iio/pressure/cros_ec_baro.c
@@ -192,7 +192,7 @@ MODULE_DEVICE_TABLE(platform, cros_ec_baro_ids);
 static struct platform_driver cros_ec_baro_platform_driver = {
 	.driver = {
 		.name	= "cros-ec-baro",
-		.pm	= &cros_ec_sensors_pm_ops,
+		.pm	= pm_sleep_ptr(&cros_ec_sensors_pm_ops),
 	},
 	.probe		= cros_ec_baro_probe,
 	.id_table	= cros_ec_baro_ids,
-- 
2.53.0

