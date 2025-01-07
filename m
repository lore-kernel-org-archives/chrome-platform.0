Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB48F18C01E
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jan 2025 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271926; cv=none; b=uOn+aaKxUBEVOJjYg9058e+7UGsJecdzmzGP5DgE79NyzxKLEu1aKDA96CTP8yHtvMFGPG+FndicHrk8gRKuXTYoQkOrbe1Rk7lAh01np1QC3recwVqpFkXlRN7dqXdBWzFROcXFiFDd4bFKmcBTwDQa6FxHfx3yjb+gNY+e0ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271926; c=relaxed/simple;
	bh=Myf0AH37vo6GyPbgxKmAv8mX+iYO7okapE5RfhWbuYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEUgcADjvBu34OsTsLirYq6inEHTLrSPiouABIHV6pJ+LeAwM0hChYoHc2Ehk9tvZQ+pTkRrr1bV2+y/xXSXaK/yz2wMA6VlpuqR8U0e5KsgUQtehKzFQn8Wq3z+4Uyqnkob0ccj8sTbxP8dTnuFRSmLlifJBA4XVcFWs6nj7UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EhM8oqEX; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EhM8oqEX"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2166f1e589cso15121285ad.3
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jan 2025 09:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736271920; x=1736876720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGpNOKWXFpqxk0pj2Rc/niyJJ0Ah9pDSJX+dTXoT1+g=;
        b=EhM8oqEXtB3iWL0IMtoAOiVDOTlv9EkwHmYTuEWhYNDdCWK/cFXBgJiQ9EzIdnoRzA
         BoWqtD9WjaEHlpvoF7Isdr+NDFQWnM41vmvdqQt8r+p1cFihCu1XeSwlQ+x/NB110II/
         043KEPcbwy6+el2phKLL2jK4b9N48wc/l4CX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271920; x=1736876720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGpNOKWXFpqxk0pj2Rc/niyJJ0Ah9pDSJX+dTXoT1+g=;
        b=YB3pAHrjH+5Um8F7mE3oyHo8DY7EqYrXifYDsGES4fmltfcQQOt2CXjO0qF85uMs5+
         nqg3EeBBPL0Dtx1sjhCUYNlcqtVUh8FHhML1RRXGTDqRJP/Qiqg3eA530713KwvidOX+
         Z5q5TDEkWinl50Y0NtydPVL+2ER/ZfY1FOppeyIb/JPeBHhz7T6MyYDv/Md7C/4cfIgf
         KnRvpGK1DExOxt2hMeVKsl2AqPIFyFug4XgCyaKYqoFQZ2+gYcl/pnxa/D7z/k/z89FT
         /RkqxTUL+usg404V9tiF5FRls6XqZvTOGFmkl6JWi9XFjHtGk76DV6AKI1ekaMmI4EYr
         cDvw==
X-Gm-Message-State: AOJu0YwNZr/fCZpH8Zn5ALPTpnTn4LIig9dY3txcPK4/EtLOutZ4nzfj
	muL/4FNstGVCm5/e1YuckCw77TgeUAyEgce/B9dy5zHHJyNNAViDzdpm20VWPg==
X-Gm-Gg: ASbGncs48+w86119SQDbZIpuiNNJ5mDzlDkIQE4NVlyDp/NE2ol8Vi5nSd8NXe1Cudn
	iyc8maiD5MRQPAYsJg46vvn9uc3DVJTrz6a8FSRevrTzVu91Ef9tWMkfjY1EINQ1TFYhJzeTKPq
	AguddJyG8DG7uO1l9fhYi6FFQkPKxf1O/+dBZ4ji0rVoHA1GGCTCtT7uYQvB8UhXOaJgvh6s8uP
	I6fjdkf/S6JoeSLj5xU37cKbx9YKAsTNWkf0xe+xr0Ye3v75Sm+KFFq
X-Google-Smtp-Source: AGHT+IHmnS4aIUbQnBYRoRODRttQqdW/2CgJXhGuZ4gz8ZAHI6CqoJmb3WWS+eYsRfubcpupQfaEIw==
X-Received: by 2002:a17:902:dac6:b0:216:32c4:f807 with SMTP id d9443c01a7336-219e6f25fdcmr764323595ad.45.1736271919927;
        Tue, 07 Jan 2025 09:45:19 -0800 (PST)
Received: from localhost ([100.107.238.250])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dca02f72sm314366185ad.249.2025.01.07.09.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:45:19 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	dustin@howett.net,
	ben@jubnut.com,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH v3 1/2] FROMLIST: platform/chrome: cros_ec_lpc: Merge lpc_driver_ops into ec private structure
Date: Tue,  7 Jan 2025 09:45:13 -0800
Message-ID: <20250107174514.2748108-2-gwendal@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250107174514.2748108-1-gwendal@chromium.org>
References: <20250107174514.2748108-1-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove cros_ec_lpc_ops global variable, since EC specific info can be
stored in the device private structure, introduced in
commit e4dbf9d65e4218 ("platform/chrome: cros_ec_lpc: add a "quirks" system").

Add ec_lpc pointer to read/write function to be able to access ec
specific data.

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 drivers/platform/chrome/cros_ec_lpc.c | 86 +++++++++++++--------------
 1 file changed, 41 insertions(+), 45 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 89957ad3c99cf..c61e69d50938d 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -70,13 +70,6 @@ struct lpc_driver_data {
 /**
  * struct cros_ec_lpc - LPC device-specific data
  * @mmio_memory_base: The first I/O port addressing EC mapped memory.
- */
-struct cros_ec_lpc {
-	u16 mmio_memory_base;
-};
-
-/**
- * struct lpc_driver_ops - LPC driver operations
  * @read: Copy length bytes from EC address offset into buffer dest.
  *        Returns a negative error code on error, or the 8-bit checksum
  *        of all bytes read.
@@ -84,18 +77,19 @@ struct cros_ec_lpc {
  *         Returns a negative error code on error, or the 8-bit checksum
  *         of all bytes written.
  */
-struct lpc_driver_ops {
-	int (*read)(unsigned int offset, unsigned int length, u8 *dest);
-	int (*write)(unsigned int offset, unsigned int length, const u8 *msg);
+struct cros_ec_lpc {
+	u16 mmio_memory_base;
+	int (*read)(struct cros_ec_lpc *ec_lpc, unsigned int offset,
+		    unsigned int length, u8 *dest);
+	int (*write)(struct cros_ec_lpc *ec_lpc, unsigned int offset,
+		     unsigned int length, const u8 *msg);
 };
 
-static struct lpc_driver_ops cros_ec_lpc_ops = { };
-
 /*
  * A generic instance of the read function of struct lpc_driver_ops, used for
  * the LPC EC.
  */
-static int cros_ec_lpc_read_bytes(unsigned int offset, unsigned int length,
+static int cros_ec_lpc_read_bytes(struct cros_ec_lpc *_, unsigned int offset, unsigned int length,
 				  u8 *dest)
 {
 	u8 sum = 0;
@@ -114,7 +108,7 @@ static int cros_ec_lpc_read_bytes(unsigned int offset, unsigned int length,
  * A generic instance of the write function of struct lpc_driver_ops, used for
  * the LPC EC.
  */
-static int cros_ec_lpc_write_bytes(unsigned int offset, unsigned int length,
+static int cros_ec_lpc_write_bytes(struct cros_ec_lpc *_, unsigned int offset, unsigned int length,
 				   const u8 *msg)
 {
 	u8 sum = 0;
@@ -133,8 +127,8 @@ static int cros_ec_lpc_write_bytes(unsigned int offset, unsigned int length,
  * An instance of the read function of struct lpc_driver_ops, used for the
  * MEC variant of LPC EC.
  */
-static int cros_ec_lpc_mec_read_bytes(unsigned int offset, unsigned int length,
-				      u8 *dest)
+static int cros_ec_lpc_mec_read_bytes(struct cros_ec_lpc *ec_lpc, unsigned int offset,
+				      unsigned int length, u8 *dest)
 {
 	int in_range = cros_ec_lpc_mec_in_range(offset, length);
 
@@ -145,15 +139,15 @@ static int cros_ec_lpc_mec_read_bytes(unsigned int offset, unsigned int length,
 		cros_ec_lpc_io_bytes_mec(MEC_IO_READ,
 					 offset - EC_HOST_CMD_REGION0,
 					 length, dest) :
-		cros_ec_lpc_read_bytes(offset, length, dest);
+		cros_ec_lpc_read_bytes(ec_lpc, offset, length, dest);
 }
 
 /*
  * An instance of the write function of struct lpc_driver_ops, used for the
  * MEC variant of LPC EC.
  */
-static int cros_ec_lpc_mec_write_bytes(unsigned int offset, unsigned int length,
-				       const u8 *msg)
+static int cros_ec_lpc_mec_write_bytes(struct cros_ec_lpc *ec_lpc, unsigned int offset,
+				       unsigned int length, const u8 *msg)
 {
 	int in_range = cros_ec_lpc_mec_in_range(offset, length);
 
@@ -164,10 +158,11 @@ static int cros_ec_lpc_mec_write_bytes(unsigned int offset, unsigned int length,
 		cros_ec_lpc_io_bytes_mec(MEC_IO_WRITE,
 					 offset - EC_HOST_CMD_REGION0,
 					 length, (u8 *)msg) :
-		cros_ec_lpc_write_bytes(offset, length, msg);
+		cros_ec_lpc_write_bytes(ec_lpc, offset, length, msg);
+}
 }
 
-static int ec_response_timed_out(void)
+static int ec_response_timed_out(struct cros_ec_lpc *ec_lpc)
 {
 	unsigned long one_second = jiffies + HZ;
 	u8 data;
@@ -175,7 +170,7 @@ static int ec_response_timed_out(void)
 
 	usleep_range(200, 300);
 	do {
-		ret = cros_ec_lpc_ops.read(EC_LPC_ADDR_HOST_CMD, 1, &data);
+		ret = ec_lpc->read(ec_lpc, EC_LPC_ADDR_HOST_CMD, 1, &data);
 		if (ret < 0)
 			return ret;
 		if (!(data & EC_LPC_STATUS_BUSY_MASK))
@@ -189,6 +184,7 @@ static int ec_response_timed_out(void)
 static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
 				struct cros_ec_command *msg)
 {
+	struct cros_ec_lpc *ec_lpc = ec->priv;
 	struct ec_host_response response;
 	u8 sum;
 	int ret = 0;
@@ -199,17 +195,17 @@ static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
 		goto done;
 
 	/* Write buffer */
-	ret = cros_ec_lpc_ops.write(EC_LPC_ADDR_HOST_PACKET, ret, ec->dout);
+	ret = ec_lpc->write(ec_lpc, EC_LPC_ADDR_HOST_PACKET, ret, ec->dout);
 	if (ret < 0)
 		goto done;
 
 	/* Here we go */
 	sum = EC_COMMAND_PROTOCOL_3;
-	ret = cros_ec_lpc_ops.write(EC_LPC_ADDR_HOST_CMD, 1, &sum);
+	ret = ec_lpc->write(ec_lpc, EC_LPC_ADDR_HOST_CMD, 1, &sum);
 	if (ret < 0)
 		goto done;
 
-	ret = ec_response_timed_out();
+	ret = ec_response_timed_out(ec_lpc);
 	if (ret < 0)
 		goto done;
 	if (ret) {
@@ -219,7 +215,7 @@ static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
 	}
 
 	/* Check result */
-	ret = cros_ec_lpc_ops.read(EC_LPC_ADDR_HOST_DATA, 1, &sum);
+	ret = ec_lpc->read(ec_lpc, EC_LPC_ADDR_HOST_DATA, 1, &sum);
 	if (ret < 0)
 		goto done;
 	msg->result = ret;
@@ -229,7 +225,7 @@ static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
 
 	/* Read back response */
 	dout = (u8 *)&response;
-	ret = cros_ec_lpc_ops.read(EC_LPC_ADDR_HOST_PACKET, sizeof(response),
+	ret = ec_lpc->read(ec_lpc, EC_LPC_ADDR_HOST_PACKET, sizeof(response),
 				   dout);
 	if (ret < 0)
 		goto done;
@@ -246,7 +242,7 @@ static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
 	}
 
 	/* Read response and process checksum */
-	ret = cros_ec_lpc_ops.read(EC_LPC_ADDR_HOST_PACKET +
+	ret = ec_lpc->read(ec_lpc, EC_LPC_ADDR_HOST_PACKET +
 				   sizeof(response), response.data_len,
 				   msg->data);
 	if (ret < 0)
@@ -270,6 +266,7 @@ static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
 static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
 				struct cros_ec_command *msg)
 {
+	struct cros_ec_lpc *ec_lpc = ec->priv;
 	struct ec_lpc_host_args args;
 	u8 sum;
 	int ret = 0;
@@ -291,7 +288,7 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
 	sum = msg->command + args.flags + args.command_version + args.data_size;
 
 	/* Copy data and update checksum */
-	ret = cros_ec_lpc_ops.write(EC_LPC_ADDR_HOST_PARAM, msg->outsize,
+	ret = ec_lpc->write(ec_lpc, EC_LPC_ADDR_HOST_PARAM, msg->outsize,
 				    msg->data);
 	if (ret < 0)
 		goto done;
@@ -299,18 +296,18 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
 
 	/* Finalize checksum and write args */
 	args.checksum = sum;
-	ret = cros_ec_lpc_ops.write(EC_LPC_ADDR_HOST_ARGS, sizeof(args),
+	ret = ec_lpc->write(ec_lpc, EC_LPC_ADDR_HOST_ARGS, sizeof(args),
 				    (u8 *)&args);
 	if (ret < 0)
 		goto done;
 
 	/* Here we go */
 	sum = msg->command;
-	ret = cros_ec_lpc_ops.write(EC_LPC_ADDR_HOST_CMD, 1, &sum);
+	ret = ec_lpc->write(ec_lpc, EC_LPC_ADDR_HOST_CMD, 1, &sum);
 	if (ret < 0)
 		goto done;
 
-	ret = ec_response_timed_out();
+	ret = ec_response_timed_out(ec_lpc);
 	if (ret < 0)
 		goto done;
 	if (ret) {
@@ -320,7 +317,7 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
 	}
 
 	/* Check result */
-	ret = cros_ec_lpc_ops.read(EC_LPC_ADDR_HOST_DATA, 1, &sum);
+	ret = ec_lpc->read(ec_lpc, EC_LPC_ADDR_HOST_DATA, 1, &sum);
 	if (ret < 0)
 		goto done;
 	msg->result = ret;
@@ -329,7 +326,7 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
 		goto done;
 
 	/* Read back args */
-	ret = cros_ec_lpc_ops.read(EC_LPC_ADDR_HOST_ARGS, sizeof(args), (u8 *)&args);
+	ret = ec_lpc->read(ec_lpc, EC_LPC_ADDR_HOST_ARGS, sizeof(args), (u8 *)&args);
 	if (ret < 0)
 		goto done;
 
@@ -345,7 +342,7 @@ static int cros_ec_cmd_xfer_lpc(struct cros_ec_device *ec,
 	sum = msg->command + args.flags + args.command_version + args.data_size;
 
 	/* Read response and update checksum */
-	ret = cros_ec_lpc_ops.read(EC_LPC_ADDR_HOST_PARAM, args.data_size,
+	ret = ec_lpc->read(ec_lpc, EC_LPC_ADDR_HOST_PARAM, args.data_size,
 				   msg->data);
 	if (ret < 0)
 		goto done;
@@ -381,7 +378,7 @@ static int cros_ec_lpc_readmem(struct cros_ec_device *ec, unsigned int offset,
 
 	/* fixed length */
 	if (bytes) {
-		ret = cros_ec_lpc_ops.read(ec_lpc->mmio_memory_base + offset, bytes, s);
+		ret = ec_lpc->read(ec_lpc, ec_lpc->mmio_memory_base + offset, bytes, s);
 		if (ret < 0)
 			return ret;
 		return bytes;
@@ -389,7 +386,7 @@ static int cros_ec_lpc_readmem(struct cros_ec_device *ec, unsigned int offset,
 
 	/* string */
 	for (; i < EC_MEMMAP_SIZE; i++, s++) {
-		ret = cros_ec_lpc_ops.read(ec_lpc->mmio_memory_base + i, 1, s);
+		ret = ec_lpc->read(ec_lpc, ec_lpc->mmio_memory_base + i, 1, s);
 		if (ret < 0)
 			return ret;
 		cnt++;
@@ -492,8 +489,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 		}
 
 		if (quirks & CROS_EC_LPC_QUIRK_AML_MUTEX) {
-			const char *name
-				= driver_data->quirk_aml_mutex_name;
+			const char *name = driver_data->quirk_aml_mutex_name;
 			ret = cros_ec_lpc_mec_acpi_mutex(ACPI_COMPANION(dev), name);
 			if (ret) {
 				dev_err(dev, "failed to get AML mutex '%s'", name);
@@ -523,9 +519,9 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	 * protocol fails, fallback to the non MEC variant and try to
 	 * read again the ID.
 	 */
-	cros_ec_lpc_ops.read = cros_ec_lpc_mec_read_bytes;
-	cros_ec_lpc_ops.write = cros_ec_lpc_mec_write_bytes;
-	ret = cros_ec_lpc_ops.read(EC_LPC_ADDR_MEMMAP + EC_MEMMAP_ID, 2, buf);
+	ec_lpc->read = cros_ec_lpc_mec_read_bytes;
+	ec_lpc->write = cros_ec_lpc_mec_write_bytes;
+	ret = ec_lpc->read(ec_lpc, EC_LPC_ADDR_MEMMAP + EC_MEMMAP_ID, 2, buf);
 	if (ret < 0)
 		return ret;
 	if (buf[0] != 'E' || buf[1] != 'C') {
@@ -536,9 +532,9 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 		}
 
 		/* Re-assign read/write operations for the non MEC variant */
-		cros_ec_lpc_ops.read = cros_ec_lpc_read_bytes;
-		cros_ec_lpc_ops.write = cros_ec_lpc_write_bytes;
-		ret = cros_ec_lpc_ops.read(ec_lpc->mmio_memory_base + EC_MEMMAP_ID, 2,
+		ec_lpc->read = cros_ec_lpc_read_bytes;
+		ec_lpc->write = cros_ec_lpc_write_bytes;
+		ret = ec_lpc->read(ec_lpc, ec_lpc->mmio_memory_base + EC_MEMMAP_ID, 2,
 					   buf);
 		if (ret < 0)
 			return ret;
-- 
2.47.1.613.gc27f4b7a9f-goog

