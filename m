Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2241EBFE0
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 06:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769495689; cv=none; b=RpbGBYAZqhx7m4VpDB5IhmMNUoPbCUIl1U2fJJsXH+MQeWaaTK03HcZC0WwrsGNNMQC3WV0ZMZiafm3RrqmGhAPZ6ox4FZip7MsBS9pGRIehkmbHHQDbwP0LcFHM0pMgVe6XIUdDV1yRKFo4yZCAfpcq/pLXUoti+GzUXT2ZwV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769495689; c=relaxed/simple;
	bh=wLHUmA2UI3HT9oktiMTy8b5kRqo6Gmr4yGQCAW4gDk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csaM3ouYmYtjVU+VAvqZ2BMb6Zz3DlbmogIPrJOsZ2/tBdKus/K53ctMGSNbRj6gnpCr7mlaABBPrYNtvnc8LBhOBPwLhClbiELJKCaatb9Wp0LsxgUWfX3mRkoJpi6mBzhrmcrSXLY89IDW8AlG/mHLWmu6ugpl2dNFb3jpHDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gzw2cN61; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gzw2cN61"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b6fd5bec41so1487236eec.1
        for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 22:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769495687; x=1770100487; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y84YNIIaom1GApu3rWziAd0oCflORVrECNBl94nRLJw=;
        b=gzw2cN61R0N1jLMocKiCLCVSLGiyxZftez+/5E3yH+uzwukUxhsbJ5MePC9bgzC/DB
         P+2u+RbSutgUdOXo0walXfxZ2ll+stpHjDfiNRFQra69OgU62vG9IXOh5WSsOVlrF5mD
         Hdrvde4vapiLFE9ck3k/0L1AZrVES3jiyZzm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769495687; x=1770100487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y84YNIIaom1GApu3rWziAd0oCflORVrECNBl94nRLJw=;
        b=s7DP0lwyzN9qN3tlafZ2hp52cbJFx+tm4jUclqwMX9RRv5v9WLhOQqtI4sE8il/QJn
         sQ4VfbwAas1YtfKi6ZoGPUzQTmcFhx1sxLVzgvfg+1TGKxkY+UCCoU94vO39JsFob0zO
         Sn0cMx6LyR7/hNMpPP9Evp2A2862vdHuSLDBk2dxvcPE1CpLqlc/8nQT4Gmm6tJ0cqXl
         tJfyI5C76tUkDEbvLdGiLvlIvUs5XQYTNxgzyK14YjyxhgRzK5oRT4O1AALIEzH8/77m
         sFsI3HGSql7CW+xYZqNBG7/5KEvmyQcKTm0I32WjcPKNLyMIrGlhqNFM39fT3XdjNKHh
         WvvQ==
X-Gm-Message-State: AOJu0YwSJ7VCQcPTiXjtkj+9zoHGDba8c2xEh3uYGVo8BB2VFLs4usKi
	3uscDdRHpfeEnJBm8gNVUksBCXY79yYVjNJfTZ5oYwMB6cf5RhfpeDRR86f4vlH12A==
X-Gm-Gg: AZuq6aK6ZZWyL8MiS+eMlNRI3lK0cscIOKV/EegreKe2Wrp9DU56X5YKQg3v7XIfTcv
	/T7gNcHNNTxnVQDp2LBd2x7PHn27dEJwQQK1tQBDgSs8n4tyWGFB2jBJGhXoAyzfPcmVYRieFH4
	iYEpkaDbetKzrwbky4BXh25IBH5ZoEShr/ohiOvSReWM0tKBN0ExOdLQa12RHx2cSwcQuvqF8Gp
	Q4K4RyRraF+tij1WT3A+9N2LmeedW235TAeLlVqb/gYXT4Nvz1br2wjFaSPKejN1+6PsOtuT/PL
	eSyH7nZvruPjJKeyHB5o7G4fu7t0RLCYYYZ9BPBqb+4Xa8tKDbuC+bqRLlTPbcSaexC6JTjptaK
	/oYhEjYhAmxiqImbXMSCXuT+1uxg/hmZsCPP9x+B+zXMtk9KpZGzSTX0cHrmN2PkYZtMRziI//4
	9DCl/xClmea46gGI50Rak+SXkpo3v6Vhi6sokIg7+fPsJ0v0JHLouNYfE=
X-Received: by 2002:a05:693c:23c5:b0:2b7:1b54:6081 with SMTP id 5a478bee46e88-2b78d8d38abmr523995eec.11.1769495687239;
        Mon, 26 Jan 2026 22:34:47 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:d47c:2299:5fd3:df50])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2b73aa08964sm16131062eec.28.2026.01.26.22.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 22:34:46 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH v2 2/2] platform: chrome: lightbar: Add support for large sequence
Date: Mon, 26 Jan 2026 22:34:34 -0800
Message-ID: <20260127063434.789047-2-gwendal@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260127063434.789047-1-gwendal@google.com>
References: <20260127063434.789047-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current sequences are limited to 192 bytes. Increase support to whatever
the EC support. If the sequence is too long, the EC will return an
OVERFLOW error.

Test: Check sending a large sequence is received by the EC.

Signed-off-by: Gwendal Grignou <gwendal@google.com>
---
Changes in v2:
- Default initilization for lb_version.
- Minimal changes in local variables definitions in program_store().
- Fix errors in cros_ec_commands.h: use a variable length array for
  payload.

 drivers/platform/chrome/cros_ec_lightbar.c    | 78 +++++++++++++------
 .../linux/platform_data/cros_ec_commands.h    | 13 ++++
 2 files changed, 68 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 632458b82352..44ec46fbd60c 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -30,6 +30,11 @@ static unsigned long lb_interval_jiffies = 50 * HZ / 1000;
  */
 static bool userspace_control;
 
+/*
+ * Lightbar version
+ */
+static int lb_version;
+
 static ssize_t interval_msec_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
@@ -464,10 +469,11 @@ static ssize_t sequence_store(struct device *dev, struct device_attribute *attr,
 static ssize_t program_store(struct device *dev, struct device_attribute *attr,
 			     const char *buf, size_t count)
 {
-	int extra_bytes, max_size, ret;
+	size_t extra_bytes, max_size;
 	struct ec_params_lightbar *param;
 	struct cros_ec_command *msg;
 	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	int ret;
 
 	/*
 	 * We might need to reject the program for size reasons. The EC
@@ -475,14 +481,22 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
 	 * and send a program that is too big for the protocol. In order
 	 * to ensure the latter, we also need to ensure we have extra bytes
 	 * to represent the rest of the packet.
+	 * With V3, larger program can be sent, limited only by the EC.
+	 * Only the protocol limit the payload size.
 	 */
-	extra_bytes = sizeof(*param) - sizeof(param->set_program.data);
-	max_size = min(EC_LB_PROG_LEN, ec->ec_dev->max_request - extra_bytes);
-	if (count > max_size) {
-		dev_err(dev, "Program is %u bytes, too long to send (max: %u)",
-			(unsigned int)count, max_size);
-
-		return -EINVAL;
+	if (lb_version < 3) {
+		extra_bytes = sizeof(*param) - sizeof(param->set_program.data);
+		max_size = min(EC_LB_PROG_LEN, ec->ec_dev->max_request - extra_bytes);
+		if (count > max_size) {
+			dev_err(dev, "Program is %zu bytes, too long to send (max: %zu)",
+				count, max_size);
+
+			return -EINVAL;
+		}
+	} else {
+		extra_bytes = sizeof(*param) - sizeof(param->set_program) +
+			sizeof(param->set_program_ex);
+		max_size = ec->ec_dev->max_request - extra_bytes;
 	}
 
 	msg = alloc_lightbar_cmd_msg(ec);
@@ -492,26 +506,44 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
 	ret = lb_throttle();
 	if (ret)
 		goto exit;
+	param = (struct ec_params_lightbar *)msg->data;
 
-	dev_info(dev, "Copying %zu byte program to EC", count);
+	if (lb_version < 3) {
+		dev_info(dev, "Copying %zu byte program to EC", count);
 
-	param = (struct ec_params_lightbar *)msg->data;
-	param->cmd = LIGHTBAR_CMD_SET_PROGRAM;
+		param->cmd = LIGHTBAR_CMD_SET_PROGRAM;
 
-	param->set_program.size = count;
-	memcpy(param->set_program.data, buf, count);
+		param->set_program.size = count;
+		memcpy(param->set_program.data, buf, count);
 
-	/*
-	 * We need to set the message size manually or else it will use
-	 * EC_LB_PROG_LEN. This might be too long, and the program
-	 * is unlikely to use all of the space.
-	 */
-	msg->outsize = count + extra_bytes;
+		/*
+		 * We need to set the message size manually or else it will use
+		 * EC_LB_PROG_LEN. This might be too long, and the program
+		 * is unlikely to use all of the space.
+		 */
+		msg->outsize = count + extra_bytes;
 
-	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
-	if (ret < 0)
-		goto exit;
+		ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
+		if (ret < 0)
+			goto exit;
+	} else {
+		size_t offset = 0;
+		size_t payload = 0;
+
+		param->cmd = LIGHTBAR_CMD_SET_PROGRAM_EX;
+		while (offset < count) {
+			payload = min(max_size, count - offset);
+			param->set_program_ex.offset = offset;
+			param->set_program_ex.size = payload;
+			memcpy(param->set_program_ex.data, &buf[offset], payload);
+			msg->outsize = payload + extra_bytes;
 
+			ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
+			if (ret < 0)
+				goto exit;
+			offset += payload;
+		}
+	}
 	ret = count;
 exit:
 	kfree(msg);
@@ -589,7 +621,7 @@ static int cros_ec_lightbar_probe(struct platform_device *pd)
 	 * Ask then for the lightbar version, if it's 0 then the 'cros_ec'
 	 * doesn't have a lightbar.
 	 */
-	if (!get_lightbar_version(ec_dev, NULL, NULL))
+	if (!get_lightbar_version(ec_dev, &lb_version, NULL))
 		return -ENODEV;
 
 	/* Take control of the lightbar from the EC. */
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 9cbf024f56c3..144243143034 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -2020,6 +2020,17 @@ struct lightbar_program {
 	uint8_t data[EC_LB_PROG_LEN];
 } __ec_todo_unpacked;
 
+/*
+ * Lightbar program for large sequences. Sequences are sent in pieces, with
+ * increasing offset. The sequences are still limited by the amount reserved in
+ * EC RAM.
+ */
+struct lightbar_program_ex {
+	uint16_t offset;
+	uint8_t size;
+	uint8_t data[0];
+} __ec_todo_unpacked;
+
 struct ec_params_lightbar {
 	uint8_t cmd;		      /* Command (see enum lightbar_command) */
 	union {
@@ -2066,6 +2077,7 @@ struct ec_params_lightbar {
 		struct lightbar_params_v2_colors set_v2par_colors;
 
 		struct lightbar_program set_program;
+		struct lightbar_program_ex set_program_ex;
 	};
 } __ec_todo_packed;
 
@@ -2154,6 +2166,7 @@ enum lightbar_command {
 	LIGHTBAR_CMD_GET_PARAMS_V2_COLORS = 32,
 	LIGHTBAR_CMD_SET_PARAMS_V2_COLORS = 33,
 	LIGHTBAR_CMD_GET_PARAMS_V3 = 34,
+	LIGHTBAR_CMD_SET_PROGRAM_EX = 35,
 	LIGHTBAR_NUM_CMDS
 };
 
-- 
2.52.0.457.g6b5491de43-goog

