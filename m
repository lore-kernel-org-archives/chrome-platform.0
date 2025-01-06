Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ADA360
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jan 2025 18:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189561; cv=none; b=tWGN162amjIbbZk37ZgudOgT8FjMPgO+iwNvxLiIUpzq9xkXsnZNQg7Dveb5r0TLmihP/OZVdUSQPSKn39A/scGHndd73HAhVCSjtvUp8oXRBi0IAYZ69xqiNcXTGq1vE6btOocPYhOa5GDAWDx738f8oqTQZJheH/diZ/3UV14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189561; c=relaxed/simple;
	bh=Myf0AH37vo6GyPbgxKmAv8mX+iYO7okapE5RfhWbuYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KO414FKMYeaToYmmkWrXXF3WNytvM6FLouOZ1jBrpi1lRgDZYRtc4sxJY3ejPbvyFlsL7bKn/b9R9+vrF4SwaFPjjWgVNhOwFgYVdlei0AfIoWypZ7ElmFGOYI9ylHCLDIGToymLr8F7Osd+SkRp/amYZ7iBLCnzAz61IxareIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aEr1uCbK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aEr1uCbK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2167141dfa1so208703885ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jan 2025 10:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736189559; x=1736794359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGpNOKWXFpqxk0pj2Rc/niyJJ0Ah9pDSJX+dTXoT1+g=;
        b=aEr1uCbKNRWdOaFzujt6M5fPsb+O0/2FH0cofRggXFO9Fl7dj79BicOsZDXmK3wdW7
         Ts2VAcfjdDWycvWT/EvegZNcGWbaRDH7dXKVq0dAwzOwTg6CHW8OIV0/j9T/pq91kQJj
         JNreDqJbbTiC436Yflpk4lO8rsiyAcfRmsptA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736189559; x=1736794359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGpNOKWXFpqxk0pj2Rc/niyJJ0Ah9pDSJX+dTXoT1+g=;
        b=P4LFknRhBjLLL8Bp7nAuh/GGxRV1QYz62U285+bizRNT/fWqRzwAKkGtH/UVMfgSk/
         +bhzcuKF5Go7JLXAsBXAnAkH3e42SaJBhPjqmXoepkwBYRr7Pk1j2kRmR4dFLc8lFOfu
         Hixl5APIWJV5K1aDOZJKrRh+n4xQeORYQxjJ+yGiF40hz2weWsmXW2YqdJU8H4gy8Qxv
         WhMwQ1rLMe6dbPXpTAG5LDrzKEePl+2ldH8W6na+KozxosJPsnrUgJ35FVK0BTiFlRmy
         vsb1mr4ycMo1PpAHBIgyhC4VKG0ur6NZ9dLamdrWR3ey1M/Sm/EIkds/rXzLvbl7jcRW
         A+MQ==
X-Gm-Message-State: AOJu0YyrU/4pg1HO3nQ9swYwWQJQidTiAwxvAcW2uluDIpIP15Rb5AIH
	9HWuBG5t0FzPgXUUTbd2iV6UfmlghLP7ymlUMl+tbgDV+fXDjmLxFu1xslC+rw==
X-Gm-Gg: ASbGncueCkXfZzKYlrx5NMXVRuS14yozvfap9LgXSnrMU2tLjvFaehne+hapd5cnoxt
	sXbIxvyDl8C43wetMIb7kBOuYE+GtYZ8KG8uRzM46ek/JXhu6EFIRPfu/FzOFAmDEIQhNYfprLk
	o9CdYoTHF8hbdYd4LTkBn7JgDotBonjHQSVbFlLBGwPMjcA66MlmMooyFWRq38QU/0Gam+Ddgrq
	mLdNGGFo2mACTPBnBxHeGYlmM5XPm6akDsg0f8kuk+FKH7m8amPhNxn
X-Google-Smtp-Source: AGHT+IGwXicIeoogRWL/YDyJEWGr2zNCT7F3XrOhb29ghYi94f+6lGN8VunAV47Fhdn2J1LTa6lJyg==
X-Received: by 2002:a17:902:e752:b0:216:6284:8a00 with SMTP id d9443c01a7336-21a7a19953fmr5808455ad.2.1736189558674;
        Mon, 06 Jan 2025 10:52:38 -0800 (PST)
Received: from localhost ([100.107.238.250])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc9f5dc5sm295269805ad.210.2025.01.06.10.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 10:52:38 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	dustin@howett.net,
	ben@jubnut.com,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH v2 1/2] platform/chrome: cros_ec_lpc: Merge lpc_driver_ops into ec private structure
Date: Mon,  6 Jan 2025 10:52:31 -0800
Message-ID: <20250106185232.1635556-2-gwendal@chromium.org>
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

