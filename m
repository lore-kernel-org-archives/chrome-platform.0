Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2FF22EEF
	for <chrome-platform@lists.linux.dev>; Fri, 20 Sep 2024 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726845303; cv=none; b=Fz841FfRFRTvNQvDbohXPWzwOTXf0fRiD884cyYgXpzLhSJBIXjx45gY13TBG6m3uPanC/RBqbHbIxK3f3/UWk/YvoXmvhgkMsj11ROu8qzGZrRNlbqwqEjjZWpjiAlmYa+qvGRqyujXGRGh3VrbMu0wYvJleGTvjjMAhruT/2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726845303; c=relaxed/simple;
	bh=cFsBr3StkDCeC1vkQ3JDhtM2ONKt/sit8zF6d+bX2hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BOBmyhLkAZMMrVOJzJx9agMl6y+IMR8G3kiY9gCePveXWUTo7U3KjL8P3d/vl8KN9FIDfumXvANUlhEfM7nMNZYabEpWj+dZSWqlAT966bpAIJgH/1xBZwiixe6Sse26UR617XbSKEeKGr9hB9Nd/JNxtRzyzJ3fg5eC+dnJNkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SqA8bPB9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SqA8bPB9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso13838605e9.0
        for <chrome-platform@lists.linux.dev>; Fri, 20 Sep 2024 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726845299; x=1727450099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHiGHAJi4ckF5J23vXeAUFRDau76ehm8ei3Xr3mR6yA=;
        b=SqA8bPB9MxZZiBTOxjd1OU61N3rZGBFgeDo/OM/e2SKgs+em+0GvovOn5fZDrGiOiY
         GWzqBdEj4x9pKyTo7ccbYBpra6DK/xAGVB2j+xtcxgz1VK0A5GKAFczwZY2kyuHp6xhX
         OVrI7bIQFXLaz5Mxeg+Gev4UoYT1SS2esGmHz2fagisVIateoF7kptuFxk/1e4hWuewB
         aqoYr8kV8V7lgyRwhqcHo0I/vmJtEU9Z570OGhixmirLEkHYQAtESlMqYHm0yee65Dk8
         WqSJzb0wp4Wknu+v9XpdcWJq80ynFjfcFSEhNqVetWt27whVm+ZMOG4pPib4aFfkI9+8
         DELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726845299; x=1727450099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHiGHAJi4ckF5J23vXeAUFRDau76ehm8ei3Xr3mR6yA=;
        b=R14Ji4SoRRByeQ21ylETggTY7NuyZlIjs6dTMgEcsq6g9S0cVfq4ZweGrgE1QlzzaU
         NU68UhnPa3BiCpaWJOJgxVJNSmBwNzry1Wuw0LjkSNTf8QnaJ3wJYSvCkjYPBq03sRrJ
         I0f//IPEqfpdCGDxIBQ337b1f4OhDdiJhP/7xKDiKoZCHV+ddG+D+zqSCKpJ9zT8s2ZZ
         byd039sZUJiGPyKCOsPMkt05TgK4a2zDnxZe0nOgCb24bjlR2xpnnLSyC+RmZkiD5EVd
         DrYjEJB0nydKd+p5XcFFWE0i7qJMVe+Liw3mghEzUJpy6af4//xT3a4LoRTzEuITqZO0
         5BdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdBRNK8Vk/UR+BLc0rRf5uG9yr9IKEedbr4Ey3TaVEmK+sKTp0e+hx8k3rNrYQysijADrITPBjiu8mGckoCeQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8dDJeNDI/Zj/xV3dktNtQ4oIpEO8dbggyzHDbemOxnoi2RwTq
	Kejm6kxKmtH+fDjRgc23E5u2K9KDITNEJtJLj/LlU/WLHfgplCwv8t1beIzo1mU=
X-Google-Smtp-Source: AGHT+IEmi5EtcdfwL5XnbjPphIYjmpZZkHKmQgWgsYHclKsuRdZIQwwOgpkhSEDE92EmXRp8B2C+5A==
X-Received: by 2002:a05:600c:1d27:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-42e743f27ecmr43466235e9.4.1726845299028;
        Fri, 20 Sep 2024 08:14:59 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afd598dsm25665665e9.25.2024.09.20.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:14:58 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Dan Callaghan <dcallagh@chromium.org>,
	=?utf-8?b?U2FtaSBLecO2c3RpbMOk?= <skyostil@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH] platform/chrome: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Fri, 20 Sep 2024 17:14:44 +0200
Message-ID: <20240920151445.499933-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=cFsBr3StkDCeC1vkQ3JDhtM2ONKt/sit8zF6d+bX2hc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm7ZFlgf26I5dAawsn4RZ9fX2tal4VEBijJ3FT4 VEQ0Cr3ZUqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZu2RZQAKCRCPgPtYfRL+ TgGSB/45xgw5EO8yrFcaxAcvoj/2cJFpixTA2fxFWjCHON1qm9YWR97EBmAr28iuvdlMLa5Nr4N /5Kxz11G7FBo3AelAHMJ39OTLQWyTudFi29tnTFGaKzn/pBi0hzuHBQqb8SJkvWDge6KYkk0ffH xmWU7RoNhAv8FOAb73vaoBI+bCfLiLijWf2iPhoF6seGBFwK1sVWWzaaBZ9qjnk0W4rLTgDSGYl SFLE1m9M2Bsyfg2TiABk5GcG1w+L/jUUQT6XTFB6ZUsBfzae4FvRb8/jSH5fFjTorvlQbJFVMpx LN5OCWcGp9JVvt7eBmuFun9Oj3O7NfRsyZ6+gaS4gywAVRXv
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/platform/chrome/cros_ec_i2c.c  | 2 +-
 drivers/platform/chrome/cros_hps_i2c.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chrome/cros_ec_i2c.c
index e29c51cbfd71..62662ba5bf6e 100644
--- a/drivers/platform/chrome/cros_ec_i2c.c
+++ b/drivers/platform/chrome/cros_ec_i2c.c
@@ -352,7 +352,7 @@ MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
 #endif
 
 static const struct i2c_device_id cros_ec_i2c_id[] = {
-	{ "cros-ec-i2c", 0 },
+	{ "cros-ec-i2c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cros_ec_i2c_id);
diff --git a/drivers/platform/chrome/cros_hps_i2c.c b/drivers/platform/chrome/cros_hps_i2c.c
index dd14957ec39f..6b479cfe3f73 100644
--- a/drivers/platform/chrome/cros_hps_i2c.c
+++ b/drivers/platform/chrome/cros_hps_i2c.c
@@ -129,7 +129,7 @@ static int hps_resume(struct device *dev)
 static DEFINE_RUNTIME_DEV_PM_OPS(hps_pm_ops, hps_suspend, hps_resume, NULL);
 
 static const struct i2c_device_id hps_i2c_id[] = {
-	{ "cros-hps", 0 },
+	{ "cros-hps" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, hps_i2c_id);
-- 
2.45.2

