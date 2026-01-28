Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0AA2BEFFF
	for <chrome-platform@lists.linux.dev>; Wed, 28 Jan 2026 03:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569387; cv=none; b=cbkRrZi/W75JsZRj7ItNIIFRf+3QsoGUUP2rwbyuI+smnk6kswLIgHMChf5bh0Q0x2+mXNN4KQ4njiSp4xkUG6eXQgPKC/1WC+EZM/SHakZePNYcnLpiNKXzCCkbBvC9RSTmHhZXnipywsROB5TwNZ3fPM+XkSNJRUzAej22GM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569387; c=relaxed/simple;
	bh=MNNZoNxEE+i856Ja0fEjswHIiHUokfYKbN0wbwdefF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAzIKtHBsxPdQ02ztUMVjicpnmHxm/8WqN9zCsxhHQuf98C5itIXxWEY0SDoHXukFUsHactP22Zh1ebCc2CK7B16QfsGdkCeNB3uo3zpRnWZinH/MBzFpKNS910kIY5x+VVfqtC8m4SVoSyB8PW0xZZpey1WtYYrvzAiA+ecY44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T84ueir5; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T84ueir5"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b72e49776eso10586032eec.1
        for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 19:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769569385; x=1770174185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUtvw7HUm5Tc2HEN8iDh7QVBy9wT0qkN25quOpyiRoA=;
        b=T84ueir55nwaUqYWTlk3kbj+WeN1EeP1jutcxXwXSh8/oN5hQ8OChTdOAxJ+FbigtF
         4La3l8USJbbVraZR7EPdaoVz2Cn+3w0behqh1629SatQB5uje1OnWpM0pB8mOlhHPVei
         GYi0zCVDSGm2kjWg1mPlzKPK8WDNGfhGAmD4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769569385; x=1770174185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GUtvw7HUm5Tc2HEN8iDh7QVBy9wT0qkN25quOpyiRoA=;
        b=PX9Aw2ElG0DZpYpdaJJfTQtfyAYNBEfte1aNXiPetfTob+uVYhQEJ82QdyUVt5Q3fE
         sXu6PKzMk76f3o5PAlHYQkHQN91qT5XIa4MASA8R/kYACz3OSzUlH1qq1nScgWf14AS7
         DEzwgS3l2LK7O5oPrd2niYgM6VvG8QIfblsyWLHBd4QwoqiUjNuHT8Lpfqbud+xhW3RH
         nvXQAMjkEH7vrzM79kS9ZQon8hr6jdAbi5BeWflD4eaqkemjQIShqzlxnkbFvVjnCBSv
         ugT2zb/hVl563MHm3VoeGXorV0ONN0bPUVtI5ZTNAsNAfoRSgxLcb4j0E1ztq/lxnsqX
         iObg==
X-Gm-Message-State: AOJu0YzXqP9H3nBfCfrhuEuaakzZwhECS7VLww/Llk0N5RnpLIzKljTV
	pC42CipkcMoT7zdIvWsCOrOUc8bnBwSm6vTRRFtQ9Q5fnoejq6Y/x5bax9JBe7e6qT+5H2t0Pc5
	72hE=
X-Gm-Gg: AZuq6aISUu69wB+48jMtR51Ro9rjTl4p5eqEpQSvFXsJw3HNFbhq4Jb8FnrojxFdbWX
	C8pojmOmOOTwR1jLxZKm2il/rkN/PL6c+pHCs7EVIVQ8UmwUs4ADWXOBde11ooo/iHiJ/kJu9ja
	iT2mXmscvG1lSwpC9lcfDNAgCzoNugb98YcuTmQxoiWR6Bqz6eRE+3p8hs+9WrBg02gZRBQW3mR
	N8bKYHQoweDBeSdnBJwlI0Q9YAZ/ltrwUhXS5ag5pbTwQzo1YNyhtIoXOEQ+Bp8GnBM8aqpZsMz
	Kc0Gb14MQK/R9hY6hHZXi2ung5J6KR7hNTTg7+Mo+QcGojIPKsWVE96xxE5jGZA5f7KupPflxgO
	h420D93NT2lquHrf70KEg99qyzVQy72Fq/Mx8qwmB4EufqXo0jaBI1pTs+aUHZB/PQrZzVyy7gw
	nO+wq0z4pbEFXPf0Q2rZ57+Yw8TwitTJSy2ih3o/Ff6663
X-Received: by 2002:a05:693c:40db:b0:2b7:97b0:82ae with SMTP id 5a478bee46e88-2b797b09068mr1225585eec.9.1769569384331;
        Tue, 27 Jan 2026 19:03:04 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:bbd7:b5c3:7c7a:45ed])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2b7a1abe57csm1050958eec.22.2026.01.27.19.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 19:03:03 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH v3 2/2] platform: chrome: lightbar: Add support for large sequence
Date: Tue, 27 Jan 2026 19:02:59 -0800
Message-ID: <20260128030259.1703848-2-gwendal@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
In-Reply-To: <20260128030259.1703848-1-gwendal@google.com>
References: <20260128030259.1703848-1-gwendal@google.com>
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
index 30f3e24c84c0..c24be6aa19a3 100644
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
+		extra_bytes = sizeof(*param) - sizeof(param->set_program) +
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

