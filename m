Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27601F03C5
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jan 2025 17:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271926; cv=none; b=iq9S0p9NhvFtae07M8uTYBTvv6s6uwjOnO5k/F6J4Jy9BCdBnJD85HHYoDgs5LoCesHMOupdT+YtdDJzTOh1uhVTlUBgitZADUK93G7G/ACjM2hmMetVOSykVZ2v0zH6BmC079gj6ibCLYoeEWI5cch4SzsdhCvTFmlzWnlniyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271926; c=relaxed/simple;
	bh=NscM3Fcs58FWrvtbdrKdZHgkmGv76cv284G8XmfGRvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X2QKI0gYwBCXQKK2p+LKS6r4B0SYr0KKnCwGzQXeLNmV7bOLaTuzdZ2VhTgGhyTzwreaTv7ZpZtJ6sflMWcC8IXDJJC5eu99ZWzr/cL5NhxU4I7a6eVc1xVooydGmwAeVonT64ruY9bHhm0rG5dyvlcy8KzTgWK1bvMSLEfPd6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AREELfWI; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AREELfWI"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21675fd60feso39046275ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jan 2025 09:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736271922; x=1736876722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcfJgzpX6peqZRkZxG6iJ3Memlfn7YsI9T2wfax/s3s=;
        b=AREELfWISw1vwcbdk/sZoo0VgtSnOIlAQoOqXFfL0SBehT65ciZHtOSou1FRXwA4Rg
         c7opmLcQIvDi794XO+o7R9uTR/6jm61pwstkBNrTAKUzYoZcyAD+lTjigYeJmuk1Jc1F
         cZ8SMuoAkdZLPdAdAfDDwGJQ9zg8V3S1ICH2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271922; x=1736876722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcfJgzpX6peqZRkZxG6iJ3Memlfn7YsI9T2wfax/s3s=;
        b=gLGpM74MVuTLLFLIUP7pyrex+7/5gvYGfR9vqEAg8lJaqqEjhSQe1FSER95zzeQ18V
         iR155j+KnZ5nktYY2mxn1tej9htpNflrWu5zy+YG/1UqOPM1wwsN6g3icdJHm1zzZQ6r
         4ib3D2dWyOL8yOj/QLC8TmM7012BOrdaoqUA9OINUelJPzdqcGloxf0AB1ukjirBh8YL
         jah3Om4oN5koT4ByNHNro51BlhhAfkNQEbPdSaRuFVeOUBLMrU1K8+l0fQkkTly597M0
         /6IMlaBCURr7wAOnsOwfOos9JNYIeZBmD+/r6SR0kCfd7cFNe6qPW82yjABEUyOLiMdm
         gAYQ==
X-Gm-Message-State: AOJu0YwkegE54KVwQwVkXM0qJkQqJhBte/jj6TaVwuHhYZkul1ok+FeB
	9wVzPY7SoS5sfg5YW5jc5ilTsIbUCMkulfyHXyVyOmo55N2kM6RTLa7/IUncHQ==
X-Gm-Gg: ASbGncs5GFXi7Q9BdbVRiNRBQ3azlLFwhfnYDKZn8h/BpuwMVGamoVxsZYr3oKuBv+d
	B3RducrEJU3GCDGsrP1W4SXTWEXuDw34aEMoGjvawtEeqlDDDg7h/cUG+1Aa4FpRuOGOL0MKhVk
	ycUIOUGLisBsIVFT/LFl5RlOAaHlqUgxX4yRNkC0iUx+3KR2oVaiyOC8GKuyh0TtU1auousN2Yt
	Y4B4Vg6KyDpTRkgSXhdAwer2g2xRPEmT4UzWeiAcdcXJdLuonKrBI7j
X-Google-Smtp-Source: AGHT+IGwhWvyUgG8/ALsorktVyzFz5QFpYwkT7TKmJJrbYoXv4UTCFx+qd88LzAqhg6i+FEbqAJGvg==
X-Received: by 2002:a17:903:1cb:b0:216:3297:92a4 with SMTP id d9443c01a7336-219e6f14f76mr750236085ad.46.1736271921726;
        Tue, 07 Jan 2025 09:45:21 -0800 (PST)
Received: from localhost ([100.107.238.250])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc970520sm314023355ad.75.2025.01.07.09.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:45:21 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	dustin@howett.net,
	ben@jubnut.com,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH v3 2/2] FROMLIST: platform/chrome: cros_ec_lpc: Add Support for direct EC register memory access
Date: Tue,  7 Jan 2025 09:45:14 -0800
Message-ID: <20250107174514.2748108-3-gwendal@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250107174514.2748108-1-gwendal@chromium.org>
References: <20250107174514.2748108-1-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support to access EC memory region HOST command and ACPI memory
region directly.

The memory region comes from the CRS ACPI resource descriptor.

The driver retrieves the memory information by adding a resource walker
for the CRS region. If a memory region is found, it is mapped and the
driver uses a new set of read/write primitives to access the EC doorbell
and external registers.

Once the memory is mapped, it belongs to the driver:
grep GOOG0004 /proc/iomem
    fe0b0000-fe0bffff : GOOG0004:00

We can verify the communication is establish checking the EC version, or
monitiring the commands using the cros-ec kernel tracer.

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 drivers/platform/chrome/cros_ec_lpc.c | 121 +++++++++++++++++++++-----
 1 file changed, 100 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index c61e69d50938d..288ef9198bb0a 100644
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
+			if (!ec_lpc->base)
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

