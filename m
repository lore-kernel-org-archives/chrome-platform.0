Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189BF12E5E
	for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 19:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="VuWrYxg4"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-77bc5d8490dso207064485a.2
        for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 11:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1701026735; x=1701631535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yjOW47KPDjDxeJtA12FOIyY/Sie9budiJ/BOigC7v0=;
        b=VuWrYxg470q5gLdCpjkzQ9VZQ+nzz0w6jHTCK7X1YWiS7RLF3VBWRbYKbm3yLTjowj
         u5eB0xHCO4bgww18rcwkBXfa4NiE56opCmK5hwkCJrcy5n/K3J30ZldVwq3Ny8uacRun
         clqSRausc417HvciqFdmep7QtiOh/WGCaTBR/0qJ82wBofdgqoOOnf38AAXt8dvZMi/A
         VnhuKSuFT2GJ5c6Z8oRPP6yo4uComavQ/5VfzLi7b7/WidIyfKZ6Gl2o2bN+2N5G4nOQ
         3rwvbhi0xFtTQK8dFq0LOybj/QRlWyfWRDLemKIARWEzUlVjCeNM9vbCU3AuTxw5oI2L
         qV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701026735; x=1701631535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yjOW47KPDjDxeJtA12FOIyY/Sie9budiJ/BOigC7v0=;
        b=CnUKsY7RzJcxAQNSh4Zuf0J7xGxvhHtAtS0UJgedmGnb3+09b1vxWvY0M3SFFFe22H
         zdkJLFMxenEyrqdOdBUeRgtzPHmfEqL+l93XmEwc6M2cACe8geWwrQrCW/vTdl1mKxoC
         i7sc6MDA49kyJowqDGitQb7CKNnR5fu51IwQaCNXXY9zHMjHvm/KGZoo69poMUcDV5Y/
         R5JDbziI8I2aWEm3qug0NzDiBvzc648O96y/QJelT8LZ5FKThEd1mqsOQPxEUH4uA4nf
         veXJkUDJ+0CGk6repTEprJ6lwG/3C7X/xLrhFDuViVyX6eZkd5e5ap8STbkPh9Vr+t+b
         DnMQ==
X-Gm-Message-State: AOJu0YxKcCUYiNEB2uAX54PA8hsoRLXtvaTDcWJDu5qdwysjXIAyVniY
	MvS9lL32K0l9HqkCEYnbHSK4jyIVc/1Z1alswoc=
X-Google-Smtp-Source: AGHT+IG6OSLrvK2Iz/jGyTCz9moY5EeWD2JGQ4M+8a8m2SvOcaNRYT0Hs5wDJmAYsaapLlQP5asp1Q==
X-Received: by 2002:a05:620a:6003:b0:773:cb13:cb7d with SMTP id dw3-20020a05620a600300b00773cb13cb7dmr11377601qkb.48.1701026734807;
        Sun, 26 Nov 2023 11:25:34 -0800 (PST)
Received: from localhost.localdomain ([184.169.45.4])
        by smtp.googlemail.com with ESMTPSA id tx10-20020a05620a3f0a00b0076f1d8b1c2dsm3099040qkn.12.2023.11.26.11.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 11:25:34 -0800 (PST)
From: "Dustin L. Howett" <dustin@howett.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Cc: "Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v2 1/4] platform/chrome: cros_ec_lpc: introduce a priv struct for the lpc device
Date: Sun, 26 Nov 2023 13:24:49 -0600
Message-ID: <20231126192452.97824-2-dustin@howett.net>
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

lpc_driver_data stores the MMIO port base for EC mapped memory.
cros_ec_lpc_readmem uses this port base instead of hardcoding
EC_LPC_ADDR_MEMMAP.

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 356572452898..9f2ea75c76b6 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -34,6 +34,14 @@
 /* True if ACPI device is present */
 static bool cros_ec_lpc_acpi_device_found;
 
+/**
+ * struct cros_ec_lpc - LPC device-specific data
+ * @mmio_memory_base: The first I/O port addressing EC mapped memory.
+ */
+struct cros_ec_lpc {
+	u16 mmio_memory_base;
+};
+
 /**
  * struct lpc_driver_ops - LPC driver operations
  * @read: Copy length bytes from EC address offset into buffer dest. Returns
@@ -290,6 +298,7 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
 static int cros_ec_lpc_readmem(struct cros_ec_device *ec, unsigned int offset,
 			       unsigned int bytes, void *dest)
 {
+	struct cros_ec_lpc *ec_lpc = ec->priv;
 	int i = offset;
 	char *s = dest;
 	int cnt = 0;
@@ -299,13 +308,13 @@ static int cros_ec_lpc_readmem(struct cros_ec_device *ec, unsigned int offset,
 
 	/* fixed length */
 	if (bytes) {
-		cros_ec_lpc_ops.read(EC_LPC_ADDR_MEMMAP + offset, bytes, s);
+		cros_ec_lpc_ops.read(ec_lpc->mmio_memory_base + offset, bytes, s);
 		return bytes;
 	}
 
 	/* string */
 	for (; i < EC_MEMMAP_SIZE; i++, s++) {
-		cros_ec_lpc_ops.read(EC_LPC_ADDR_MEMMAP + i, 1, s);
+		cros_ec_lpc_ops.read(ec_lpc->mmio_memory_base + i, 1, s);
 		cnt++;
 		if (!*s)
 			break;
@@ -353,9 +362,16 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	struct acpi_device *adev;
 	acpi_status status;
 	struct cros_ec_device *ec_dev;
+	struct cros_ec_lpc *ec_lpc;
 	u8 buf[2] = {};
 	int irq, ret;
 
+	ec_lpc = devm_kzalloc(dev, sizeof(*ec_lpc), GFP_KERNEL);
+	if (!ec_lpc)
+		return -ENOMEM;
+
+	ec_lpc->mmio_memory_base = EC_LPC_ADDR_MEMMAP;
+
 	/*
 	 * The Framework Laptop (and possibly other non-ChromeOS devices)
 	 * only exposes the eight I/O ports that are required for the Microchip EC.
@@ -380,7 +396,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	cros_ec_lpc_ops.write = cros_ec_lpc_mec_write_bytes;
 	cros_ec_lpc_ops.read(EC_LPC_ADDR_MEMMAP + EC_MEMMAP_ID, 2, buf);
 	if (buf[0] != 'E' || buf[1] != 'C') {
-		if (!devm_request_region(dev, EC_LPC_ADDR_MEMMAP, EC_MEMMAP_SIZE,
+		if (!devm_request_region(dev, ec_lpc->mmio_memory_base, EC_MEMMAP_SIZE,
 					 dev_name(dev))) {
 			dev_err(dev, "couldn't reserve memmap region\n");
 			return -EBUSY;
@@ -389,7 +405,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 		/* Re-assign read/write operations for the non MEC variant */
 		cros_ec_lpc_ops.read = cros_ec_lpc_read_bytes;
 		cros_ec_lpc_ops.write = cros_ec_lpc_write_bytes;
-		cros_ec_lpc_ops.read(EC_LPC_ADDR_MEMMAP + EC_MEMMAP_ID, 2,
+		cros_ec_lpc_ops.read(ec_lpc->mmio_memory_base + EC_MEMMAP_ID, 2,
 				     buf);
 		if (buf[0] != 'E' || buf[1] != 'C') {
 			dev_err(dev, "EC ID not detected\n");
@@ -423,6 +439,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	ec_dev->din_size = sizeof(struct ec_host_response) +
 			   sizeof(struct ec_response_get_protocol_info);
 	ec_dev->dout_size = sizeof(struct ec_host_request);
+	ec_dev->priv = ec_lpc;
 
 	/*
 	 * Some boards do not have an IRQ allotted for cros_ec_lpc,
-- 
2.42.0

