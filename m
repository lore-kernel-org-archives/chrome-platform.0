Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28A528D8F1
	for <chrome-platform@lists.linux.dev>; Fri, 30 Jan 2026 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769760839; cv=none; b=pxWS9R1l1NsRcgbkVZrdAi1sa3MXl0m9bGwHHPYfBTqce4O4bSheI260sIIMp9arGYpiQ6JdtCALhh7Gtq7/usuY4rONkSdI4+PIN4mmF/phHKZC+XZzt7h7YX+2nV1k6wrXTBrYEkBcvBfQtZntcalLsK/pFdq10uRtwmAGXrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769760839; c=relaxed/simple;
	bh=Ist+Wr1w8wJCLydWDU3E/HT2/d51UgMJUFwAcjwonSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZwNnK9eM5GDsS/IC8vYCAs49VQ13mNtzS8rWO+huxFzZXnowxmHjtw94UDFh3CSOuXyNAM4aHOWi32uZZJyTUniygdyOnD6M+TTkB38bdcd2H/mU6atc5Ds/yQUg9cBCeUyeB+COaOqTjV9Mc9ZxGoAwYoluwhczWP8hqC5yYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SbctyA5d; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SbctyA5d"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b720e4dcb4so2304753eec.0
        for <chrome-platform@lists.linux.dev>; Fri, 30 Jan 2026 00:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769760837; x=1770365637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+1+qsxp916IXRTs5HYkRlJHpuMQB20CHQwVpQqnSU4=;
        b=SbctyA5d4aJhJBCYonZJC7J05cuxwlp3yvV5DT1fkR9mLYL+UC1oPth6IYHBrydkOh
         BQkTangSA5rGR2inOf+Xrws0CAzFt5MOln7MCQKD1QQpO3RKwQrOuips2eY8cn2dGq3G
         90rYES84PkeIYFDVMGqO/GhzvTd87ss6Yi7Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769760837; x=1770365637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+1+qsxp916IXRTs5HYkRlJHpuMQB20CHQwVpQqnSU4=;
        b=RgdfOQIf+qOU9ISOQzqQlwJkxsNOUuaL/GacjUJzEQtGgJ/vrYlUTc451HprNLAoYH
         ilc9Ea0UJTEMiAcNTG3sCdqb++kIPb4J1kechKdNevKUEDut4bWpUFFzJGQveQZIj9rq
         1+6Q65ZIJW795fxGX/+cGEn33H4D/jcq4ou2Kz8Hk/Lsy1SEBbQLyRy+LotPPMOEk0iv
         OVWetcqp21UofuMMDJdvc9N3VB/O1jjo04PaOiexgz13vNSJ+05Dbl8VdUPBd8sjzxre
         ByjMkvqoYeV4RJhmukILGo2YnklNU8q8GyQVXkEGJs0+NRt8o7abqtIF0okIONHkBU8t
         AOtQ==
X-Gm-Message-State: AOJu0YwW4Dwu0DlruN2xlgki7dUixwQzwzSF0If3QKwEb4ZM8mL02g7X
	hzSudpKy5WVA0mThIiRwrM/yQyHSzTDDMebjcaqsrGWhe6L+b/FIcbpvOMc4oydRaw==
X-Gm-Gg: AZuq6aL/HL1wNVfdwLEcjY6ZfL34qK8wdBeH8uKXnEIVD/BbkEaJNZ23wsGkVYVriid
	v7oPrBPMHDrtT4AEdc2BzjryCwiCaugC/zCo1J4RMgFmdoZ5q0QjmLJ3jjtexHR7VOy1LHAZiYx
	M02mycchWQiOQs8rPwDuUYo5Kw8ueK+6mtCoPDntfkMpsBZT/MiU56tgfT85VVsTUwcYV9/2m5i
	X64NxUqnSg+UwyGJsnQNUC9NRXs/Y1O2Qg8dOBdQvskrT21tAkQSnFdr2tvDILC1Ra45AFzUp7H
	eF6UP1exhj/JUQzRwiaA/kQvCJQhj5KSXtaMuaphnl9R3fQcGP3/JxwQD6Sf7/VFLZFzvw2xrna
	rrsWTl1dlxfgDVz6nt5wCpdqkmZSIV1gbCUp0uFRN4S6lo9w8M3Io3/kovInMLVmYAk2yNSWRT8
	528rkgQjBeEJdrYkY2jH82PnSWX1a3n94q0QrQAPUyHMqv
X-Received: by 2002:a05:7300:ed0d:b0:2b4:7e6b:9c00 with SMTP id 5a478bee46e88-2b7c88ea112mr819079eec.23.1769760836787;
        Fri, 30 Jan 2026 00:13:56 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:25e3:7f30:7f62:d1ad])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-124a9e0304bsm9473830c88.14.2026.01.30.00.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 00:13:56 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH v4 2/2] platform: chrome: lightbar: Add support for large sequence
Date: Fri, 30 Jan 2026 00:13:51 -0800
Message-ID: <20260130081351.487517-2-gwendal@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
In-Reply-To: <20260130081351.487517-1-gwendal@google.com>
References: <20260130081351.487517-1-gwendal@google.com>
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
Changes in v4:
- Cleanup calculation of the header size by using offsetof macro.
Changes in v3:
- Fix allocation size for lightbar command. Use the maximal allowed
  sizes by default.
Changes in v2:
- Default initilization for lb_version.
- Minimal changes in local variables definitions in program_store().
- Fix errors in cros_ec_commands.h: use a variable length array for
  payload.

 drivers/platform/chrome/cros_ec_lightbar.c    | 88 +++++++++++++------
 .../linux/platform_data/cros_ec_commands.h    | 13 +++
 2 files changed, 74 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 5f14c7425faf..463383bd9076 100644
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
@@ -86,11 +91,8 @@ static int lb_throttle(void)
 
 static struct cros_ec_command *alloc_lightbar_cmd_msg(struct cros_ec_dev *ec)
 {
+	int len = max(ec->ec_dev->max_response, ec->ec_dev->max_request);
 	struct cros_ec_command *msg;
-	int len;
-
-	len = max(sizeof(struct ec_params_lightbar),
-		  sizeof(struct ec_response_lightbar));
 
 	msg = kmalloc(sizeof(*msg) + len, GFP_KERNEL);
 	if (!msg)
@@ -98,6 +100,11 @@ static struct cros_ec_command *alloc_lightbar_cmd_msg(struct cros_ec_dev *ec)
 
 	msg->version = 0;
 	msg->command = EC_CMD_LIGHTBAR_CMD + ec->cmd_offset;
+	/*
+	 * Default sizes for regular commands.
+	 * Can be set smaller to optimize transfer,
+	 * larger when sending large light sequences.
+	 */
 	msg->outsize = sizeof(struct ec_params_lightbar);
 	msg->insize = sizeof(struct ec_response_lightbar);
 
@@ -464,10 +471,11 @@ static ssize_t sequence_store(struct device *dev, struct device_attribute *attr,
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
@@ -475,14 +483,22 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
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
+		extra_bytes = offsetof(typeof(*param), set_program_ex) +
+			sizeof(param->set_program_ex);
+		max_size = ec->ec_dev->max_request - extra_bytes;
 	}
 
 	msg = alloc_lightbar_cmd_msg(ec);
@@ -492,26 +508,44 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
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
@@ -589,7 +623,7 @@ static int cros_ec_lightbar_probe(struct platform_device *pd)
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
2.53.0.rc1.225.gd81095ad13-goog

