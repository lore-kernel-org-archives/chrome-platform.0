Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE193F3275
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 09:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650565; cv=none; b=kCaWwqma0yfaO8POjGA+WN38RsvTMFLpS7A86n6a1sD5w6zUecKLN5OJ5nvmiHG4buP92/2DXE9CfJzyNxqorV1qkGA6tipaBHOZ6zuv1E2NFmUotiEcF9V/+xwZlKVHiMUJUnfiyOHg8bkUtQiryBYOpHiF36VGiGVqimqDMuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650565; c=relaxed/simple;
	bh=Gvcvg7qvN+e+3AHxDv4nYpJTCVFO4SL2dt4x3hWWHWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iuQi2w0+SRX3r0MD2YHSaIM6w7pTnUND0NJZfhS1BZVDuk5cChZnPedGIAaT/08r+K/DICnAhAItZQpfgkpeWQ8OguaiANY9w7QPS1zAiFau7fJh98SsG7p6UwQa0AqTODuqMzzbUkJVwhduJYV//V3ojd8NGm74/Sr/ZLroOP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vu2LkaPT; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vu2LkaPT"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so5656973a91.2
        for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 02:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787650562; x=1788255362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgglv4QiDBkUh6JReI7gmaCGhqMs03Wj/b9NbtyBBs4=;
        b=Vu2LkaPTtXVTfLJBhm9vLbYupwvUc1WltNoMeFDXzEFHiBe2dkEGupBu3+K3BTTItg
         e5aSixS6uj8m4gtcD+FNT9hTPbw4dTcN3s9kKhlp6uoirkchNGGLHEMO61Ho1NpCc6sD
         FX3I9oNI6PQRbCk8q+Ur3vVbt3ljAeYvvy7y9lu4KmH3x56LtlFD50wIpOqf6KSq+rw6
         bFIOKO0hDf46Mgw2yjxxUAOF0lnK76fzBkWr6Anq1Sk9H4PLsqHOw3vefK7i/0jSBTmI
         Y4v+4VSyGby9o5FB4Gfg+R3ig1CDc+mM3HFccV/kakckHQ9YkBgeDZe8ByctdVrfhs+q
         SKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787650562; x=1788255362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vgglv4QiDBkUh6JReI7gmaCGhqMs03Wj/b9NbtyBBs4=;
        b=CDandrNbSzZwpYm/A59wITJM8N15U4czxEfm/Vj2QsmIE3UO0/lRLD6QjiA0Xz8fx0
         Z/ArBkcZXa+MeuDqUVV/+hjjAsLHQOIbjkbMav8XwK8iECZsNLSsEtoBCkPW+jyVf+au
         ZO21x6Kryjd0fJAFCsXA1+qTfd6Rp+JxA1g/anWGzY3O1aK/wGIKaR8iOddqlRY40fTR
         G2XymRQUln+yEK43UvE1/qn8HisxdZUwq5uxAfowrCd7dvcTIGLP4yohRbU5pm951L/+
         nHoXV8Mr3n4e1aEd6zgWQjeEocUQTdpbsvG7NJWXpNwmlpmaH9SXWSfZDwCFvL5raZw6
         UffQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdL/EzBG/OBt/Rw1FW82c9V3lpcOaiyLZc7n8x5VO655GezvBsQHfJuahDelTGuIBWjUHRbe71cdjIWllN2bg=@lists.linux.dev
X-Gm-Message-State: AFuF++lThHwIW4iHkbm2FLKZj71BADQwX2ZT14GRRf98leXCdSYaT95I
	JPYqa+Q73fYZ8pj/vZFW4+qoNB0mmQTniBttmoNVXEyNMcRF0pCrUdU=
X-Gm-Gg: AR+sD137lCodvURSxSdsK5OxJ3E8/0VcVSWihmTTGOpTjIEjv4vXo1J1s6qk7F7TQ0w
	eNUquOq3hGXet5ekwuCJ8SWltjY9iuwsom0KofHw5FdhVhgueNLvCJC8RmpKrxZTgkVgX5srb8A
	a7inyEYVD+3iCuE9KBdGgzIaxqF40G8UZUALtqdI8uWYAWDkJwxqrZDavnOPcdz+4jXEshZePV8
	ONkZW4wPgjeMoGQvJsxWrJDXI9ojGbVvw0eVLi+HTX29JzM3gdvpZlh83OiVdlfWprsz+qiqS3+
	FpclLCAAdQKBNq5t/1vTcAplIbWKzFczvLw6JiGk4/eMbN9nTEhNPmWTxNqhUZsjXHeqYXm0+Sf
	eqDgqDVeawBt8L7uIZ6kshuBBeffJo28uKEDFoiPKD2QRQQl4QtEGLXA9ioNIpWAiUbrtqvvx/4
	E7cDxNZDCfN3Dcvkz2wrtvPJtfzcVgpEBNnS2O4QCtlmEbZEm6Sa9C1E2GzZq8wID8/g9Pp0rB5
	Q==
X-Received: by 2002:a17:90a:c50:b0:396:4729:43fa with SMTP id 98e67ed59e1d1-3964729461amr7294256a91.0.1787650561947;
        Tue, 25 Aug 2026 02:36:01 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396425d286fsm960551a91.2.2026.08.25.02.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:36:01 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: triet.hoang.dev@gmail.com
Cc: andy@kernel.org,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	dlechner@baylibre.com,
	groeck@chromium.org,
	jic23@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v3] iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Tue, 25 Aug 2026 16:35:24 +0700
Message-ID: <20260825093524.285443-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821014454.15960-1-triet.hoang.dev@gmail.com>
References: <20260821014454.15960-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from the resume callback.
This is a straightforward cleanup with no functional change intended.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
Changes in v2:
- Use EXPORT_GPL_SIMPLE_DEV_PM_OPS for cros_ec_sensors_pm_ops
- Wrap to 75 ish chars for commit messages.
Changes in v3:
- Update commit message based on feedback from v2, and added Reviewed-by tags.
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

