Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223E030D17
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 16:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="U+3733Yr"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-65af1037ca8so6022386d6.2
        for <chrome-platform@lists.linux.dev>; Thu, 05 Oct 2023 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1696522071; x=1697126871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIKhewsUzhXlGubPiW58tzOjf5y8/qBow8TkSh16ct0=;
        b=U+3733YrHwhV3S2LQUmguQ4zO3f/wlqBfxAVP17EJFLHnc1XPAwmnSo1LoawUUw/y9
         KT5qE76hiloISwNkrITXApoeKxf7FDbWo4NfXbE24S0wGCdoU/lKiosm2P3sQY1kI3mV
         cNo7rvAp8BBOo/7Q1KKSwQDyCAdzhcUFg/sl0QzNsbH9JJhzMnTbGqcuTHqj7AZi3G8j
         vRLuovYcy5+JbOv37OVDy4fwrtxh/LiPb7orkmw+Ga6xt/bhlfbgkc1Ta5rHpxw+8c3H
         NQVNWtHWejRTsdfiEbXvhwJoVlp3RcVonuoF9SnqCdyzDUWCsnWWmi/nDAwA6XBMHJJh
         1yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522071; x=1697126871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIKhewsUzhXlGubPiW58tzOjf5y8/qBow8TkSh16ct0=;
        b=iUMYDDsV3XBkGv7v1Z4qACa1bF1SaoN4/T0ST4+M6NR03YKhLWA1TgbaDja1TYim37
         9o6ag/J/ClOn18cpuUF0Vph5BSZL99TfDkWyz73hweXNzlTfTHIIqHirxnx4dBm7XE+X
         tXS+1hxZl/zXMA0kx+TolOX13SLvN9etyn5BcMn1c02IIVd0CzGfnSFvuFVXL1fk1Ajz
         Sr//8DFCcKbLnEf9gVrO7EwMZbGYYLqxA2uImasy/bMQRt91ZJzkFBrkL/5wypamZMod
         lORbpdgBEcJkETitoDrn+5qfZY2aAZBMwjvMFMhFB6GbFtTrocz5A9EoEgjK2yz3enSV
         EGDg==
X-Gm-Message-State: AOJu0YxtjtYa0Z79TZZhCOKMCB1shhn7cs9mo5ZR52d39CdbMGv/oJVd
	R2ZFfs1+gUdorZxTYfzG2SAhD4ABe5P6D7oYk6B6cw==
X-Google-Smtp-Source: AGHT+IENbbnztfC5zYQ3C6sRr7dhQcz2+L/+nXUmgWY3mQBnPpTTm/XHG1yMc2sAaxngc1mlll/gjA==
X-Received: by 2002:a05:6214:3209:b0:63d:2cc7:bef9 with SMTP id qj9-20020a056214320900b0063d2cc7bef9mr5264097qvb.37.1696522070956;
        Thu, 05 Oct 2023 09:07:50 -0700 (PDT)
Received: from tycho.delfino.n.howett.net (99-107-94-179.lightspeed.stlsmo.sbcglobal.net. [99.107.94.179])
        by smtp.googlemail.com with ESMTPSA id k3-20020a0cabc3000000b0063d5d173a51sm611422qvb.50.2023.10.05.09.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 09:07:50 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Kieran Levin <ktl@frame.work>,
	Mario Limonciello <Mario.Limonciello@amd.com>
Cc: "Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v1 1/4] cros_ec_lpc: introduce cros_ec_lpc, a priv struct for the lpc device
Date: Thu,  5 Oct 2023 11:06:59 -0500
Message-ID: <20231005160701.19987-3-dustin@howett.net>
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

cros_ec_lpc stores the MMIO port base for EC mapped memory.
cros_ec_lpc_readmem uses this port base instead of hardcoding
EC_LPC_ADDR_MEMMAP.

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 500a61b093e4..477e22e31757 100644
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
+	ec_dev->priv = (void *)ec_lpc;
 
 	/*
 	 * Some boards do not have an IRQ allotted for cros_ec_lpc,
-- 
2.42.0

