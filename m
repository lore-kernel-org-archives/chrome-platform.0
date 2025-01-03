Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3908C13C
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jan 2025 00:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735863605; cv=none; b=kwS4CD/jb6UYprzVsgXIkm5ucjzy/Tvbzm0NB+izUDSfCWVY+GXW+DtyqxjC2H7QHGwREDP1ZPzOGEFaJgcir6Whm6WsuJyuKfxalMRdZm/cDo042ZrQC9j4OEvd6j38bBtRGMyABLIx2aWCsM69Nm8B2vlSAMafHCQFwkyyKtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735863605; c=relaxed/simple;
	bh=i5FQTLzkcb7SSf1q+bmtqH8VA0AC5WxhrA8sdIO6+34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdBuDYA+1lhCy6zdoETC8TIfMzRidBuYJqE03oqmKYcZV7bxaxYMQVijK3VNXA9WvLjc9Imui/UUBzfvBYYuEFEgxVxVYVDqX6CKxNmWb9+bfPV5Om9QKvIsJjCWFdp6aNtr5Z09y++LDWqSwCblI0NUPUG2udyqCAEcHMupwiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nrJLTQKo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nrJLTQKo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2163b0c09afso159774895ad.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jan 2025 16:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735863603; x=1736468403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sk9hY9rH2n06O5wo6tT+bI+cPFtrNVFPmDit0J2GDo0=;
        b=nrJLTQKoFuGmGXmV1eLNc1kGgoO1eMbLDkAVpIowiCZIJmDiAvVDC0sClqksLXndN+
         liGjgipevL+UCdIdP7VnnMW/OkAhAp90yurABZmN/ijJfkeolOECCg/C9XLwHiwFzPAk
         Zt9rnNqWX13QpAOixHOmbC5lzxML57tLvUEb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735863603; x=1736468403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sk9hY9rH2n06O5wo6tT+bI+cPFtrNVFPmDit0J2GDo0=;
        b=hPjnA9kKni5cOv8m4jOfyD52UTDp2sYHSZStVPilwTBMIo7kJrOa7DEYV0rCU4F96h
         uCeJSfGFVHSpq3sHlxSl6RmLNon29WdjmIiaYfILMYGYiwfhTX2NSfqGkYPOT1lZFyQd
         E6v8nEUkiuFIwQYkEvh/sRQWBFS75Huye2IeuGyPZiRk2lUy01U1Bu0wqIJMHVEttU3G
         s+6KUTCeVlOJDbeVGL6df1wM3Y9SFxycjQiKRKjjim0exrSrbztzAPkc2ogm8NJtuAim
         Ms8jzTPCnZG7qX882Y98+O8MZfMMCR8eC3TDc49Xr4/QTl0gxdcVdvUWwFUqKxm9t/54
         gpXg==
X-Gm-Message-State: AOJu0Yx7crfJBLZu8k/CQuN+p9gDTHMSaE3L20NxNnGCrCL8ozbqD4Q5
	2iyPROJbnED6ntTpfP8ojKGOzJ6Xt10KOb8MvlpOLs6iYg0qLssO89vVfN83Cw==
X-Gm-Gg: ASbGncvhY6x100/HMnFdnpuadUqA9KkdV7d2tizAD2zMD+7gth6iPSezYLKjxle2kuZ
	dzMS8uWhaYQ0D8UdgOLOoxXZagy+Oel7FWpzTpRTHw/JVU0e06CkkFeQTuRJ6MHTSRKz32mLJ1i
	CmrE9Wel464Reu8PDyszeyLehhuwdZSJs4o+Q0W7qxHLxxUnwKBdpiVO4L9lIWfzFhlCuCJ97z/
	vreO3luKwL4ig6x4L5PAfO87Hc4gRePNz/R5jUg1t7O+UtqEAMGYExa
X-Google-Smtp-Source: AGHT+IFB8h0/Qe7HJkmyHnbznkIhFRPxVPqBeH6xvd9DuRBI0nFmDthNZBUW86f1yKwstPKKa+RhcA==
X-Received: by 2002:a17:903:2c6:b0:216:2a36:5b2a with SMTP id d9443c01a7336-219e6f25e3bmr715929785ad.47.1735863602982;
        Thu, 02 Jan 2025 16:20:02 -0800 (PST)
Received: from localhost ([100.107.238.250])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc9f4fbcsm233992945ad.174.2025.01.02.16.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 16:20:02 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	dustin@howett.net,
	ben@jubnut.com,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH 2/2] platform/chrome: Add Support for direct EC register memory access
Date: Thu,  2 Jan 2025 16:19:50 -0800
Message-ID: <20250103001950.2868856-3-gwendal@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250103001950.2868856-1-gwendal@chromium.org>
References: <20250103001950.2868856-1-gwendal@chromium.org>
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
Can observe the commands flowing between AP and EC:
cd /sys/kernel/debug/tracing
echo 1 > events/cros_ec/enable
echo 1 > tracing_on
cat trace_pipe
     kworker/7:0-51      [007] .....   188.619393: cros_ec_request_start: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, insize: 0
     kworker/7:0-51      [007] .....   188.625656: cros_ec_request_done: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, insize: 0, ec result: EC_RES_SUCCESS, retval: 0
     kworker/7:0-51      [007] .....   188.625663: cros_ec_request_start: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248
     kworker/7:0-51      [007] .....   188.635119: cros_ec_request_done: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248, ec result: EC_RES_SUCCESS, retval: 147
     kworker/7:0-51      [007] .....   188.635130: cros_ec_request_start: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248
     kworker/7:0-51      [007] .....   188.642764: cros_ec_request_done: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248, ec result: EC_RES_SUCCESS, retval: 0
     timberslide-3755    [005] .....   188.643039: cros_ec_request_start: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insize: 44
     timberslide-3755    [006] .....   188.650876: cros_ec_request_done: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insize: 44, ec result: EC_RES_SUCCESS, retval: 44
     timberslide-3755    [006] .....   188.650912: cros_ec_request_start: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insize: 44
     timberslide-3755    [006] .....   188.657907: cros_ec_request_done: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insize: 44, ec result: EC_RES_SUCCESS, retval: 44
     kworker/7:0-51      [007] .....   198.858864: cros_ec_request_start: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, insize: 0
     kworker/7:0-51      [007] .....   198.866866: cros_ec_request_done: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, insize: 0, ec result: EC_RES_SUCCESS, retval: 0
     kworker/7:0-51      [007] .....   198.866882: cros_ec_request_start: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248
     kworker/7:0-51      [007] .....   198.874414: cros_ec_request_done: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: 248, ec result: EC_RES_SUCCESS, retval: 0

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 drivers/platform/chrome/cros_ec_lpc.c | 126 +++++++++++++++++++++-----
 1 file changed, 105 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 413c969235a84..342a488afa8a3 100644
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
@@ -160,6 +164,47 @@ static int cros_ec_lpc_mec_write_bytes(struct cros_ec_lpc *ec_lpc, unsigned int
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
+	// Check range
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
+	// Check range
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
@@ -450,6 +495,23 @@ static struct acpi_device *cros_ec_lpc_get_device(const char *id)
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
+	case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
+		/* Ignored, using a more generic way to find IRQ. */
+	case ACPI_RESOURCE_TYPE_END_TAG:
+	default:
+		break;
+	}
+	return AE_OK;
+}
+
 static int cros_ec_lpc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -498,29 +560,52 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
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
+				return AE_ERROR;
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
@@ -594,7 +679,6 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	 * Connect a notify handler to process MKBP messages if we have a
 	 * companion ACPI device.
 	 */
-	adev = ACPI_COMPANION(dev);
 	if (adev) {
 		status = acpi_install_notify_handler(adev->handle,
 						     ACPI_ALL_NOTIFY,
-- 
2.47.1.613.gc27f4b7a9f-goog

