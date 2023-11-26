Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB70E12E60
	for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 19:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="A2+0EE5M"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-77d63b733e4so187106185a.2
        for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 11:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1701026745; x=1701631545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOEfYnzVQ/0R7YLkmOSjhQ1I/vLdB55xU9yypEKMGxg=;
        b=A2+0EE5MpAc70LGTydMO0jc0PK/w9Uc8rEQAvzBKfBknQ/wJMPSxGewvV6OD3kGLOb
         3EQjjups7JouGPWLTWQx1xcWmrdacZFNEuAf8AhPXg3TXgN1TYAJKYFDm43gFMs9akEa
         CQMu90ViFX/3P9AiwAiXkQXp0+nRu0scooIO60PQqhW7gqfxaoJW7VYr744vi76BdCYh
         HisAr/6nvxvu24jL1QNb0A3FUNYYIqQpFH4ow04Fg7cDBtkaKyPg488UHNOIe3vEvc73
         pnQrfe6/Y2ltlARn+sir8B2RR2VBZNIOZcaqaYhKwM6g9fu2I9LZoOArtLi5GNxW4y7G
         k8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701026745; x=1701631545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOEfYnzVQ/0R7YLkmOSjhQ1I/vLdB55xU9yypEKMGxg=;
        b=I0pCzlCIKiA9j44voQqbRrC1qSaLYjPsfN0BE4eGo/Gt0OnSeXJ8lJch/P8uj1YWuv
         CUeAn/tmPQRVZv9JcCqJnwrHZBXRy0SiTqHWZ7GRluX3FNs8PDiTyISyl/iuJwy/OMre
         igaSSLuHlDqEjY5a/vXA25B3+wn0UpX/lF4G15cHhg81QZserJLt11MrVpZqHcAjOp/U
         3pJXJ8IqMttIRusVV5k9VrFKv7xsWDK3sHX4ziTW3P/k8Qv5gNNV8DbgsQfY4ybvedJg
         WD6WjeKSheC5jP1BxoKP2NHT6HMJxgLn6L1dO4XPQaN5rKdkJX34KXfSRb1huseBXAmx
         uJtg==
X-Gm-Message-State: AOJu0YzswdFWlJCLUMu2Mvm5IR31+xGGvAjdsCToV8y5LneJ65GvH9Hh
	o4Bl3VAhvhFKRmI7yxzu0PsPcZ/ePDSlmgXo0aU=
X-Google-Smtp-Source: AGHT+IErIveg1DiqJ7LTAYI7BHg6soOgsEfhgBKjH+O+8l9H03en8AOWSL0jx+BApAQX2kbyFFVzYA==
X-Received: by 2002:a05:620a:6193:b0:777:73e8:e24d with SMTP id or19-20020a05620a619300b0077773e8e24dmr10268854qkn.21.1701026745415;
        Sun, 26 Nov 2023 11:25:45 -0800 (PST)
Received: from localhost.localdomain ([184.169.45.4])
        by smtp.googlemail.com with ESMTPSA id tx10-20020a05620a3f0a00b0076f1d8b1c2dsm3099040qkn.12.2023.11.26.11.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 11:25:45 -0800 (PST)
From: "Dustin L. Howett" <dustin@howett.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Cc: "Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v2 3/4] platform/chrome: cros_ec_lpc: add a "quirks" system
Date: Sun, 26 Nov 2023 13:24:51 -0600
Message-ID: <20231126192452.97824-4-dustin@howett.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231126192452.97824-1-dustin@howett.net>
References: <20231005160701.19987-1-dustin@howett.net>
 <20231126192452.97824-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices ship a ChromeOS EC in a non-standard configuration. Quirks
allow cros_ec_lpc to account for these non-standard configurations.

It supports the following quirks:
- CROS_EC_LPC_QUIRK_REMAP_MEMORY: use a different port I/O base for
  MMIO to the EC's memory region
- CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION: only attempt to reserve
  0xff (rather than 0x100) I/O ports for the host command region

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c | 42 ++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index f1d1615d9b37..a65c9a8bca5e 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -34,6 +34,29 @@
 /* True if ACPI device is present */
 static bool cros_ec_lpc_acpi_device_found;
 
+/*
+ * Indicates that the driver should only reserve 0xFF I/O ports
+ * (rather than 0x100) for the host command mapped memory region.
+ */
+#define CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION BIT(0)
+/*
+ * Indicates that lpc_driver_data.quirk_mmio_memory_base should
+ * be used as the base port for EC mapped memory.
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
@@ -363,8 +386,11 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	acpi_status status;
 	struct cros_ec_device *ec_dev;
 	struct cros_ec_lpc *ec_lpc;
+	struct lpc_driver_data *driver_data;
+	int region1_size = EC_HOST_CMD_REGION_SIZE;
 	u8 buf[2] = {};
 	int irq, ret;
+	u32 quirks = 0;
 
 	ec_lpc = devm_kzalloc(dev, sizeof(*ec_lpc), GFP_KERNEL);
 	if (!ec_lpc)
@@ -372,6 +398,20 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 
 	ec_lpc->mmio_memory_base = EC_LPC_ADDR_MEMMAP;
 
+	driver_data = platform_get_drvdata(pdev);
+	if (driver_data) {
+		quirks = driver_data->quirks;
+
+		if (quirks)
+			dev_info(dev, "loaded with quirks %8.08x\n", quirks);
+
+		if (quirks & CROS_EC_LPC_QUIRK_REMAP_MEMORY)
+			ec_lpc->mmio_memory_base = driver_data->quirk_mmio_memory_base;
+
+		if (quirks & CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION)
+			region1_size -= 1;
+	}
+
 	/*
 	 * The Framework Laptop (and possibly other non-ChromeOS devices)
 	 * only exposes the eight I/O ports that are required for the Microchip EC.
@@ -420,7 +460,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
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

