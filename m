Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61278360
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jan 2025 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189562; cv=none; b=NoIhD8uGWmN/7gDKlZGXXNvf6Lt2WZq5b88p9jq8X/FdIz6numz5+rumW9kVkzpYlnvR682eo5IRs91RzL7dr3o6eiaj27GE1Z5NzvY3wqmBCmVUibgIBqdwsE7FZFjZh+xfvCQyxVKFBcdx119+s98AxWV/SQftu+2ldvF8fuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189562; c=relaxed/simple;
	bh=zm385oun709LrW2JmdACHgnFaNKvQNK5OgTx5gOR3Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WewVI6JSVU3QSfX6LZY7LeEDSww68YKaOXha898SPx+gqOu0weDGOTsTNm3IJzx1i8hXX+3yoe8tay/fJPGNQfKc0UhA2VUFbjjT2Ovkd/NxMvfl33PKAA4NVGpY7trdIaUKhtu1oeCSKM9czXPxvZrl5bBR8Z4M+zsiMnw7XyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OFLgFwDl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OFLgFwDl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21661be2c2dso193852625ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jan 2025 10:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736189561; x=1736794361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTRFC76SOE4GHBCsj2ftGJBdBc8R4QsdiYOBfIQc4+k=;
        b=OFLgFwDluzAhXIzhpa0bLcqjUCQ3gNpk9/kNZiC6GG3edMmL73p2Y37plq3a+1hQRq
         j1G1emAc5udYVhjBCa1AZrrCeCD2Bn41a8wffoqVw1/m/E1fMhFKAJ6rysB2cSJOGXOk
         hhj9B3OEbaDua3+nkACck1N5l1MmhWDAdsDvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736189561; x=1736794361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTRFC76SOE4GHBCsj2ftGJBdBc8R4QsdiYOBfIQc4+k=;
        b=fF6ANYBVDLSwkSfqXTUs5WubF2wlmYL8potXzofggT90dKw/w5v4t+RLj3e0T8yKC8
         nRtN1mRRnnrjHWt4rEI+bSMCXXZm/Sw4PdEw7anN5pyG5Vsb8VfOiEhnDsmsR0ueDA9E
         PDNaDFOnuULVu0Bpr7XUPuhpuPI44gX5qVnPPsxMsqvHe7zq0aVqTfX3JK88SH59tdRF
         VeG5WuVZGjofTeG5iCEbSVM6VTAm8ZTKGbn2i/2fge4KiLwXlC2UnZ0pXiM30SMHx2Hz
         0wORc66LPO/sQbrdH5zYiSl/B0jeHNYp+vP1yqUziRIqzHXbcEww5lJCD42PPhzAwiIq
         K65Q==
X-Gm-Message-State: AOJu0YzxvA97bq7qfSXzhuCizjIFzBMWBPDwnO9q0PJcgmDDY/zQmAPs
	Q3ENX3AtSYqwxRFdiKSUDRd4syxCPLIMDWz+r3zVgGroJMaYu/yssRtQC71tWw==
X-Gm-Gg: ASbGncuSCrdeDuJzt6w3C1dXjc3v0oTG8OVCqA1t3Ttq4r+dbSSOHDPN49AVIfK7GFP
	g1U09IoPAdW1eLfyvIQHswJsEtOAaTPf88OcwIMZcPNjjcv1maZ7mKUBDVgtOw5WyAfT7Rn0tme
	NaWem96Om92xwhNCRlQXpScZfqHO7M5Z0kH5cmnzlmM0Ex2OUhtwchCFhGVSkFYaqNzsJkYkn51
	9fDTCYc7SEoxpe7XbowTfOiWjMmo/+4SwRjKMD5ixvJx23HVb/7gWHB
X-Google-Smtp-Source: AGHT+IEc/g4go0A6TZrnAADjtOLaHZEHGGnUmnYbIkGo04W4k0sGUU/yB01B2NwbXYzNGEayDI5bKQ==
X-Received: by 2002:a17:902:f705:b0:216:6fbc:3904 with SMTP id d9443c01a7336-219e6e9d91emr922248225ad.13.1736189560670;
        Mon, 06 Jan 2025 10:52:40 -0800 (PST)
Received: from localhost ([100.107.238.250])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc972b34sm296853255ad.81.2025.01.06.10.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 10:52:40 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	dustin@howett.net,
	ben@jubnut.com,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH v2 2/2] platform/chrome: cros_ec_lpc: Add Support for direct EC register memory access
Date: Mon,  6 Jan 2025 10:52:32 -0800
Message-ID: <20250106185232.1635556-3-gwendal@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250106185232.1635556-1-gwendal@chromium.org>
References: <20250106185232.1635556-1-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to access EC memory region HOST command and ACPI memory
region directly.

The memory region comes from the CRS ACPI resource descriptor.

Able to communicate with the EC:
```
 ectool version
...
Build info:    brtk-0.0.0-df0ad93+ 2024-12-13 19:25:55 elmo@396-a1a
```
Coreboot must exposed the memory region:
```
cat /proc/iomem | grep GOOG0004
    fe0b0000-fe0bffff : GOOG0004:00
```
Can observe the commands flowing between AP and EC.

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 drivers/platform/chrome/cros_ec_lpc.c | 121 +++++++++++++++++++++-----
 1 file changed, 100 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index c61e69d50938d..77f7837312c59 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -70,6 +70,8 @@ struct lpc_driver_data {
 /**
  * struct cros_ec_lpc - LPC device-specific data
  * @mmio_memory_base: The first I/O port addressing EC mapped memory.
+ * @base: For EC supporting memory mapping, base address of the mapped region.
+ * @mem32: Information about the memory mapped register region, if present.
  * @read: Copy length bytes from EC address offset into buffer dest.
  *        Returns a negative error code on error, or the 8-bit checksum
  *        of all bytes read.
@@ -79,6 +81,8 @@ struct lpc_driver_data {
  */
 struct cros_ec_lpc {
 	u16 mmio_memory_base;
+	void __iomem *base;
+	struct acpi_resource_fixed_memory32 mem32;
 	int (*read)(struct cros_ec_lpc *ec_lpc, unsigned int offset,
 		    unsigned int length, u8 *dest);
 	int (*write)(struct cros_ec_lpc *ec_lpc, unsigned int offset,
@@ -160,6 +164,45 @@ static int cros_ec_lpc_mec_write_bytes(struct cros_ec_lpc *ec_lpc, unsigned int
 					 length, (u8 *)msg) :
 		cros_ec_lpc_write_bytes(ec_lpc, offset, length, msg);
 }
+
+static int cros_ec_lpc_direct_read(struct cros_ec_lpc *ec_lpc, unsigned int offset,
+				   unsigned int length, u8 *dest)
+{
+	int sum = 0;
+	int i;
+
+	if (offset < EC_HOST_CMD_REGION0 || offset > EC_LPC_ADDR_MEMMAP +
+			EC_MEMMAP_SIZE) {
+		return cros_ec_lpc_read_bytes(ec_lpc, offset, length, dest);
+	}
+
+	for (i = 0; i < length; ++i) {
+		dest[i] = readb(ec_lpc->base + offset - EC_HOST_CMD_REGION0 + i);
+		sum += dest[i];
+	}
+
+	/* Return checksum of all bytes read */
+	return sum;
+}
+
+static int cros_ec_lpc_direct_write(struct cros_ec_lpc *ec_lpc, unsigned int offset,
+				    unsigned int length, const u8 *msg)
+{
+	int sum = 0;
+	int i;
+
+	if (offset < EC_HOST_CMD_REGION0 || offset > EC_LPC_ADDR_MEMMAP +
+			EC_MEMMAP_SIZE) {
+		return cros_ec_lpc_write_bytes(ec_lpc, offset, length, msg);
+	}
+
+	for (i = 0; i < length; ++i) {
+		writeb(msg[i], ec_lpc->base + offset - EC_HOST_CMD_REGION0 + i);
+		sum += msg[i];
+	}
+
+	/* Return checksum of all bytes written */
+	return sum;
 }
 
 static int ec_response_timed_out(struct cros_ec_lpc *ec_lpc)
@@ -450,6 +493,20 @@ static struct acpi_device *cros_ec_lpc_get_device(const char *id)
 	return adev;
 }
 
+static acpi_status cros_ec_lpc_resources(struct acpi_resource *res, void *data)
+{
+	struct cros_ec_lpc *ec_lpc = data;
+
+	switch (res->type) {
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		ec_lpc->mem32 = res->data.fixed_memory32;
+		break;
+	default:
+		break;
+	}
+	return AE_OK;
+}
+
 static int cros_ec_lpc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -498,29 +555,52 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 			dev_info(dev, "got AML mutex '%s'", name);
 		}
 	}
-
-	/*
-	 * The Framework Laptop (and possibly other non-ChromeOS devices)
-	 * only exposes the eight I/O ports that are required for the Microchip EC.
-	 * Requesting a larger reservation will fail.
-	 */
-	if (!devm_request_region(dev, EC_HOST_CMD_REGION0,
-				 EC_HOST_CMD_MEC_REGION_SIZE, dev_name(dev))) {
-		dev_err(dev, "couldn't reserve MEC region\n");
-		return -EBUSY;
+	adev = ACPI_COMPANION(dev);
+	if (adev) {
+		/*
+		 * Retrieve the resource information in the CRS register, if available.
+		 */
+		status = acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
+					     cros_ec_lpc_resources, ec_lpc);
+		if (ACPI_FAILURE(status)) {
+			dev_err(dev, "failed to get resources\n");
+			return -ENODEV;
+		}
+		if (ec_lpc->mem32.address_length) {
+			ec_lpc->base = devm_ioremap(dev,
+						    ec_lpc->mem32.address,
+						    ec_lpc->mem32.address_length);
+			if (IS_ERR(ec_lpc->base))
+				return -EINVAL;
+
+			ec_lpc->read = cros_ec_lpc_direct_read;
+			ec_lpc->write = cros_ec_lpc_direct_write;
+		}
 	}
+	if (!ec_lpc->read) {
+		/*
+		 * The Framework Laptop (and possibly other non-ChromeOS devices)
+		 * only exposes the eight I/O ports that are required for the Microchip EC.
+		 * Requesting a larger reservation will fail.
+		 */
+		if (!devm_request_region(dev, EC_HOST_CMD_REGION0,
+					 EC_HOST_CMD_MEC_REGION_SIZE, dev_name(dev))) {
+			dev_err(dev, "couldn't reserve MEC region\n");
+			return -EBUSY;
+		}
 
-	cros_ec_lpc_mec_init(EC_HOST_CMD_REGION0,
-			     EC_LPC_ADDR_MEMMAP + EC_MEMMAP_SIZE);
+		cros_ec_lpc_mec_init(EC_HOST_CMD_REGION0,
+				     EC_LPC_ADDR_MEMMAP + EC_MEMMAP_SIZE);
 
-	/*
-	 * Read the mapped ID twice, the first one is assuming the
-	 * EC is a Microchip Embedded Controller (MEC) variant, if the
-	 * protocol fails, fallback to the non MEC variant and try to
-	 * read again the ID.
-	 */
-	ec_lpc->read = cros_ec_lpc_mec_read_bytes;
-	ec_lpc->write = cros_ec_lpc_mec_write_bytes;
+		/*
+		 * Read the mapped ID twice, the first one is assuming the
+		 * EC is a Microchip Embedded Controller (MEC) variant, if the
+		 * protocol fails, fallback to the non MEC variant and try to
+		 * read again the ID.
+		 */
+		ec_lpc->read = cros_ec_lpc_mec_read_bytes;
+		ec_lpc->write = cros_ec_lpc_mec_write_bytes;
+	}
 	ret = ec_lpc->read(ec_lpc, EC_LPC_ADDR_MEMMAP + EC_MEMMAP_ID, 2, buf);
 	if (ret < 0)
 		return ret;
@@ -594,7 +674,6 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	 * Connect a notify handler to process MKBP messages if we have a
 	 * companion ACPI device.
 	 */
-	adev = ACPI_COMPANION(dev);
 	if (adev) {
 		status = acpi_install_notify_handler(adev->handle,
 						     ACPI_ALL_NOTIFY,
-- 
2.47.1.613.gc27f4b7a9f-goog

