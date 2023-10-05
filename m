Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE134193
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="v83MEWeA"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6c4b9e09521so746949a34.3
        for <chrome-platform@lists.linux.dev>; Thu, 05 Oct 2023 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1696522076; x=1697126876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DB/63q7co6BElMzwEVr8DBbzrAtv1Y7+8+dwDw13/rU=;
        b=v83MEWeAMwHCG0wStM+CUvM1xRO3zv/Bq29y2NgGHNs6AaxQo7eebD5+oDWiWVBFot
         8nPb7nh6SwRfbLc9b9f+VjcnbL4rni4vcmb3h4xd01TAHTYj8yo/41nIIZ6HMBmOKmwd
         lzVUVOKDXrPwSBS77ihS/5vzEmi1Oabhx2Jjj0ZNxY93bL6HJDjFfh1O3HKKke1aPL+f
         KXq/zH/MiYWLgNi0ZhLHUJvz3iNW5yz4z9j2POytSyOU056gMiyuAoOCtN8YvdbtP5n5
         Qlu/Dd8UiX9sV5y7xmduzBnlzr8S1MhrI/ToUpIPQRnxHLQjFvrtYpF0qBiU2BiohtWR
         6jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522076; x=1697126876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DB/63q7co6BElMzwEVr8DBbzrAtv1Y7+8+dwDw13/rU=;
        b=kN9G3HMbJKJDzTs3TMPudiLbHiPtLWvwNgF095ryG3b6yQyEM/zj/UFaxgWaByMQeS
         xvm9ZUUNuSqaO4A3i6eQ7Ysq3GCUIFIZnRUSELrvbx++gkXZgOtNSDSPQs0Vx6+bMNho
         WH4R9WF5nauFm7eBseg6Cp0NN3yMBz9YaBvUMeWa6WKPdUxCLjixsHoqT3/QBnUi3M96
         xz3inK6NfA6m8W2JfafyxamBJxWXI1xIMg68Sel1GcnArjeePtw2z+zOM4rsD2N+mEQx
         Qdxcn3cZsJz8rDTat3DOlZVM+5B1l1GvSjecwiVqClf5JzAKxBGl6loTWGq/pjp5vUdA
         FH8g==
X-Gm-Message-State: AOJu0Yxod0Tu4k6XgEMgJnhuJFYOCWI+TSs+Daz/TWenlLo70NQDsz3N
	ot0O7RaAX7rMgUhlT0MBr3kzWw==
X-Google-Smtp-Source: AGHT+IF7BGzIpAcXRZ9L1lRMxSA0PcKYIKfM0MAZ2Fsnukx6tQuLwfpqxRdStuyFiP9QPC3HZRFT3A==
X-Received: by 2002:a9d:62d6:0:b0:6c4:c151:8ebe with SMTP id z22-20020a9d62d6000000b006c4c1518ebemr5819494otk.22.1696522076403;
        Thu, 05 Oct 2023 09:07:56 -0700 (PDT)
Received: from tycho.delfino.n.howett.net (99-107-94-179.lightspeed.stlsmo.sbcglobal.net. [99.107.94.179])
        by smtp.googlemail.com with ESMTPSA id k3-20020a0cabc3000000b0063d5d173a51sm611422qvb.50.2023.10.05.09.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 09:07:55 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Kieran Levin <ktl@frame.work>,
	Mario Limonciello <Mario.Limonciello@amd.com>
Cc: "Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v1 3/4] cros_ec_lpc: add a quirks system, and propagate quirks from DMI
Date: Thu,  5 Oct 2023 11:07:01 -0500
Message-ID: <20231005160701.19987-5-dustin@howett.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005160701.19987-1-dustin@howett.net>
References: <20231005160701.19987-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices ship a ChromeOS EC in a non-standard configuration; quirks
allow cros_ec_lpc to account for these non-standard configurations.

It supports the following quirks:
- CROS_EC_LPC_QUIRK_REMAP_MEMORY: use a different port I/O base for
  MMIO to the EC's memory region
- CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION: only attempt to reserve
  0xff (rather than 0x100) I/O ports for the host command region

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c | 41 ++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index ef7943e6a01d..c06575625d2f 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -34,6 +34,27 @@
 /* True if ACPI device is present */
 static bool cros_ec_lpc_acpi_device_found;
 
+/* If this quirk is enabled, the driver will only reserve 0xFF I/O ports
+ * (rather than 0x100) for the host command mapped memory region.
+ */
+#define CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION BIT(0)
+/* If this quirk is enabled, lpc_driver_data.quirk_mmio_memory_base will be used
+ * as the base port for EC mapped memory.
+ */
+#define CROS_EC_LPC_QUIRK_REMAP_MEMORY              BIT(1)
+
+/**
+ * struct lpc_driver_data - driver data attached to a DMI device ID to indicate
+ *                          hardware quirks.
+ * @quirks: a bitfield composed of quirks from CROS_EC_LPC_QUIRK_*
+ * @quirk_mmio_memory_base: The first I/O port addressing EC mapped memory (used
+ *                          when quirks (...REMAP_MEMORY) is set.
+ */
+struct lpc_driver_data {
+	u32 quirks;
+	u16 quirk_mmio_memory_base;
+};
+
 /**
  * struct cros_ec_lpc - LPC device-specific data
  * @mmio_memory_base: The first I/O port addressing EC mapped memory.
@@ -363,14 +384,32 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	acpi_status status;
 	struct cros_ec_device *ec_dev;
 	struct cros_ec_lpc *ec_lpc;
+	struct lpc_driver_data *driver_data;
+	int region1_size;
 	u8 buf[2] = {};
 	int irq, ret;
+	u32 quirks = 0;
 
 	ec_lpc = devm_kzalloc(dev, sizeof(*ec_lpc), GFP_KERNEL);
 	if (!ec_lpc)
 		return -ENOMEM;
 
 	ec_lpc->mmio_memory_base = EC_LPC_ADDR_MEMMAP;
+	region1_size = EC_HOST_CMD_REGION_SIZE;
+
+	driver_data = platform_get_drvdata(pdev);
+	if (driver_data) {
+		quirks = driver_data->quirks;
+
+		if (quirks)
+			dev_warn(dev, "loaded with quirks %8.08x\n", quirks);
+
+		if (quirks & CROS_EC_LPC_QUIRK_REMAP_MEMORY)
+			ec_lpc->mmio_memory_base = driver_data->quirk_mmio_memory_base;
+
+		if (quirks & CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION)
+			region1_size -= 1;
+	}
 
 	/*
 	 * The Framework Laptop (and possibly other non-ChromeOS devices)
@@ -420,7 +459,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 			return -EBUSY;
 		}
 		if (!devm_request_region(dev, EC_HOST_CMD_REGION1,
-					 EC_HOST_CMD_REGION_SIZE, dev_name(dev))) {
+					 region1_size, dev_name(dev))) {
 			dev_err(dev, "couldn't reserve region1\n");
 			return -EBUSY;
 		}
-- 
2.42.0

