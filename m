Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E7219E0
	for <chrome-platform@lists.linux.dev>; Mon, 23 Jun 2025 21:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750712724; cv=none; b=pGQ1Dad23yogvZoSzeszitJEJZJVUlqbsKFBmf3cNA7stmspHlUa7wBDxUPEJGlAl9WlG8/ZXDza/8sPBr1eDzOMnNB9VPebYa1pPqHpm37jMIC1XIjM5sbSzvcW5UsNMZCPHG5lVmbsOkfLRxmILBMjcibDjGDoRa6jtvXZc0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750712724; c=relaxed/simple;
	bh=V73qRKXP5nx4/5IRzOhCUlJAQcTWaQ18vq30A6dufAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BDuYIRxhyJVsoNpmLD4jKwLUBG7FmoZ4gLlCyFdO2IVAUs5MnuQMfAhRIYEqBVNrgT4oIDWdM4Zi9A0X5QOUoWtv3n3WSDHjzlr+pTFyroi1qQEO9jJsglqSSU0gvduSRBKFA2ZtiuyrwdaOFmPlUO/blfUk7fDbiwWkkomhQAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lqCwlBfm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lqCwlBfm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234b440afa7so48843875ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jun 2025 14:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750712722; x=1751317522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJQltk/nHVC8N7rXVHtRZK5340H5olTQKj1YkWqp1cM=;
        b=lqCwlBfmyy+mea9JvoSinfaEmT5kdfOaBagww2P9LyF2pEcK4YsHyBOzv5XMecHegY
         zBsJXPHoI2/+0WzNXYfu/imE6GiHvaD5WBJrbPFkVm+91OKxh8AFcw1MqYI7GCJFo3SN
         GzwWh7A7itH7Hgk0X77SmZ6ZonXSCSHLtPhxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750712722; x=1751317522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJQltk/nHVC8N7rXVHtRZK5340H5olTQKj1YkWqp1cM=;
        b=LBh55zvd4RMVDtoDnVd2vwK4+VUgxsJRhcz5ckKVZe+CgFS8kF63yrgHdgujeFJlbo
         68wgoIOs4YTmab6jTr8EwIxi5DoHdpVQOTqKOCPAGU2I84ew3+sowiw9ABdzBQPevPUx
         dbR8f15D2cWv80qrAH758orlHiOvocU0ZzsGpuHGPoZ6s/Av9aiMk9Xh1AYiS7Gzb1Qe
         R2ioDodnzS55ApuPaEZPX1ZmuaFIDZ5uZBNMOGt2bJ4y4M2vTNjNZRKFkJusYbIeWGgM
         xQXE6TthcLJQ0V5eeIOSkseqCIYHnG4J4PDB9vOX9thGsFQrX1BI8RT9/xU1RSwKI+VA
         trGw==
X-Gm-Message-State: AOJu0YxLUj56sfvpY7gmNFvSnm7UQwjwb5DdZ/ojrIdfbxguRqxs5DwA
	fAsUftd5zCl1zcyQjN0HnNm/WOyFaS57j5xDpo8SxTYHuVAlbb+T8y/E8wXU8zClZQ==
X-Gm-Gg: ASbGncumvIdedDXq0yfaEd6mGfa7JmazgncjVtEGlG+vmCoR2XDTgFDckG/9Yqbyl1X
	XBpHJr8ZEw8FqgSSflh/YlUSfUoWdIV6dKC9crdhf9ehgL/n1f2g6phXjJHiNaYJ/zS4tDATHxI
	MkDLwxKIh0V9qyvaBedUTQCI/cBsN/FoP+f9N/5IJHdkrxEEgyu5qn7w1Yo876OH+IsGYB+JVI/
	N/QL5cUbpHiL5KTfLBGbrjxPoJJg4RRRUYSQRuBNEAxPtfoUGOltLyjH/4jWbS1pls90LpaVpzr
	c3/JlIHjS4XhPvidy4GxKuJk3UnXqTC9RkWo6RzBprFgiAy4rGEowvg=
X-Google-Smtp-Source: AGHT+IHwgOQN1cT5ZZlCfDdYxGLZSK6sqvsQ1bHJrkKXJz8/gFMRJ0NPjVmAfj4/BdnGbnSaoUxcyA==
X-Received: by 2002:a17:903:46cb:b0:236:6f5f:cac1 with SMTP id d9443c01a7336-237d998df09mr212202305ad.46.1750712721656;
        Mon, 23 Jun 2025 14:05:21 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:eabe:52f4:36e6:5c0d])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d8611756sm89416655ad.103.2025.06.23.14.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 14:05:21 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH] platform: chromeos: sensorhub: retries when a sensor is not ready
Date: Mon, 23 Jun 2025 14:05:18 -0700
Message-ID: <20250623210518.306740-1-gwendal@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the EC/ISH starts, it can take a while for all the sensors to be up
and running or declared broken.

If the sensor stack return -EBUSY when checking for sensor information,
retry up to 50 times.
It has been observed 100ms wait time is enough to have valid sensors
ready. It can take more time in case a sensor is really broken and is
not coming up.

Signed-off-by: Gwendal Grignou <gwendal@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub.c | 23 +++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub.c b/drivers/platform/chrome/cros_ec_sensorhub.c
index 518152cb4ee10..c246640a9e7e7 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub.c
@@ -8,6 +8,7 @@
 
 #include <linux/init.h>
 #include <linux/device.h>
+#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -17,6 +18,7 @@
 #include <linux/types.h>
 
 #define DRV_NAME		"cros-ec-sensorhub"
+#define CROS_EC_CMD_INFO_RETRIES 50
 
 static void cros_ec_sensorhub_free_sensor(void *arg)
 {
@@ -52,7 +54,7 @@ static int cros_ec_sensorhub_register(struct device *dev,
 	int sensor_type[MOTIONSENSE_TYPE_MAX] = { 0 };
 	struct cros_ec_command *msg = sensorhub->msg;
 	struct cros_ec_dev *ec = sensorhub->ec;
-	int ret, i;
+	int ret, i, retries;
 	char *name;
 
 
@@ -64,12 +66,25 @@ static int cros_ec_sensorhub_register(struct device *dev,
 		sensorhub->params->cmd = MOTIONSENSE_CMD_INFO;
 		sensorhub->params->info.sensor_num = i;
 
-		ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
+		retries = CROS_EC_CMD_INFO_RETRIES;
+		do {
+			ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
+			if (ret == -EBUSY) {
+				/* The EC is still busy initializing sensors. */
+				usleep_range(5000, 6000);
+				retries--;
+			}
+		} while (ret == -EBUSY && retries);
+
 		if (ret < 0) {
-			dev_warn(dev, "no info for EC sensor %d : %d/%d\n",
-				 i, ret, msg->result);
+			dev_err(dev, "no info for EC sensor %d : %d/%d\n",
+				i, ret, msg->result);
 			continue;
 		}
+		if (retries < CROS_EC_CMD_INFO_RETRIES) {
+			dev_warn(dev, "%d retries needed to bring up sensor %d\n",
+				 CROS_EC_CMD_INFO_RETRIES - retries, i);
+		}
 
 		switch (sensorhub->resp->info.type) {
 		case MOTIONSENSE_TYPE_ACCEL:
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

