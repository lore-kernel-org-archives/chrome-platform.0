Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E264D34E745
	for <chrome-platform@lists.linux.dev>; Fri, 21 Aug 2026 01:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787276717; cv=none; b=WdhCyPw9qlZ8DOsVPDy6GPpVenxi5xvOO+RJLNFG6d0LR+oeVAv39Gh4ytU62W7WhLR0Ft/Ii9wt6MU3RA31ylSn5bCzRW+ty/RQNdRqT5Ozw7kXu43+RsLm/OwtGZdDoDgM/kQpnlhgUZsKavK8vWvwC+25H5BLAbQcFejuRnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787276717; c=relaxed/simple;
	bh=sbAF0uqvlZvxsWfWk0SRP6ojJ7r9s4RDxyKqD93t8TE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CW6/UIItZaO03yz80qlmZMGg0b2GvcoEm1Hye0zNKCKLPUVTIT+gNDBE2idgtrI1U6x0FK+iclCHhMro2n1xAHToDUE736memN/TxPg1VpC/ATgBhF0k0YeWeq+e920yol5vaH1EtxHJKOXXz3RG2omXdOeD+0fHbB50NPShBMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWBSgqwD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWBSgqwD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d530328efbso4735735ad.0
        for <chrome-platform@lists.linux.dev>; Thu, 20 Aug 2026 18:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787276714; x=1787881514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZttsssqOMabZj0EkbaAGqT7Bp9lWTkosvKZrWr3/hA=;
        b=JWBSgqwDFYGqgEOoKrWMu0kN0gfDDKLhmEkZcRI+qggIG2jXM3WfYS9oTXvf3qjLIk
         d1I5280sUjYWi0Aq2ZdzeH1Xzx6vK5h7DSeSVx7Eg/NyGtO/wd2k+FhLuKizJDGU5ORO
         kelzfe5XqxFrKOBrOgcVKdo8p8UCImgVtowdzBAbtRnsXJtrsTmEGiAydw5MVGfQE8/w
         iUbUJKTPau1+Qbklg1zyGFG+mw+07ijsuSgiOCbZ0snC9FyEixR7LEeVln7LhC8xG+v/
         MZxXXSY+qyA5EJEpCFaHc1zQi6K+enETQf+Bw6FGXKI6mb9gv92NnJumPurTXIOr2hc5
         ui5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787276714; x=1787881514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZttsssqOMabZj0EkbaAGqT7Bp9lWTkosvKZrWr3/hA=;
        b=Ougka8gHTnEqhnfwATo0WxX7hZ1/iOHN72WEndFx+6hC5XarxNBwv1ZgtFNP8WLpao
         p75PG3XIGGRskHwOdfVmokVqkHgD+fsgJConJLTwPIR+Xmzyb7anqwKoctGJsyMYgGPz
         Aydnw3VXddFbyfkVnaEhPYVEOOL9Zqe9BEGO4fG1n+YFVPsfhDVejXsaFsPWmRvkQVh3
         fqCQPTI1Dk2BrA9ZFU8TbRjQwqNTkgFjm/uK+Xm74M/CMApmiK81Qvcxe7atSlYiINgA
         05lHC3ezmtaq4UULtndHxxxRZ5JwLfWKWEkfPCYP01MYxJ5EuafJLGqzTCoMDpb3WMBi
         lbXA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9JMi7OvWD/TlRcEQyo17dAFgrzT0uwRL5sKKFVobxC7FBOLO9sbL7i7emmTmbqCqFXMur+VGU/dQxt5liYRc=@lists.linux.dev
X-Gm-Message-State: AFuF++kp5/PLhmqClk3oj4aJQIFUxLGhyzEI3bx3bt6G97ONV6C3x7k4
	w7qT6TOGNNmI+z5BDJUSbny6xpoxY8OnvWI5YXIcRy55R3yvncpqSz4=
X-Gm-Gg: AR+sD13TkYKclnqHB9eY7Ikx7NJPnZJ8kzG87KK0R34Rw2nX4TrChV/X14xfdDAeV4z
	kZHvibHHYNxzv5ntT4AcCoOW8n9Xf9rHRKCIp1Ok+FfcuvsA/220PbjsrgNzhfcjGciHRB4z03T
	ee+xX3xNlwBOFNcFCA2iTggtknF0sqH40gSytyJLeLqTiI7xVACTnLV9iHm917xgqB861wWwjGl
	0wUm2lNzJl8sYDQ5qw3TAun3Ni+ZX8Ioobj8pOkCMU8kYh2rI2eUfBDylnh+fzLnFiKJ15GTAej
	kYfEw+aJ1k2JXAoIzo5yhJTJ2w41OURqqQ8mxYtzm1R1Uq8Dg9geHOhSfwNzW9TRdLyhiB5GvCr
	FLneDJK0FSwjz2VO6VRGXL4ZagsnFCoC9rDCDcUcXtDgcpxyLjMXhdZRcd64xjmLokIngiO1vPH
	ivoSGOytxNpRZjbU/00+sGhjpOPQXx41ctAdc1Kpr2W9/lspdoV4XzIGsOxICtF8dp+7d++zHe9
	g==
X-Received: by 2002:a17:902:ce08:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d64afe9569mr53845135ad.10.1787276714031;
        Thu, 20 Aug 2026 18:45:14 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e3cced8sm12727335ad.75.2026.08.20.18.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 18:45:13 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	bleung@chromium.org,
	groeck@chromium.org,
	linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 08:44:54 +0700
Message-ID: <20260821014454.15960-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from the resume callbacks, and reduces kernel size
in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c      | 2 +-
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 4 ++--
 drivers/iio/light/cros_ec_light_prox.c                    | 2 +-
 drivers/iio/pressure/cros_ec_baro.c                       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

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
index 5133755c2ea6..7d09f7c7d35c 100644
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
@@ -879,7 +879,7 @@ static int __maybe_unused cros_ec_sensors_resume(struct device *dev)
 	return ret;
 }
 
-SIMPLE_DEV_PM_OPS(cros_ec_sensors_pm_ops, NULL, cros_ec_sensors_resume);
+DEFINE_SIMPLE_DEV_PM_OPS(cros_ec_sensors_pm_ops, NULL, cros_ec_sensors_resume);
 EXPORT_SYMBOL_GPL(cros_ec_sensors_pm_ops);
 
 MODULE_DESCRIPTION("ChromeOS EC sensor hub core functions");
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

