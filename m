Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753D41A275
	for <chrome-platform@lists.linux.dev>; Sat, 24 Jan 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769245161; cv=none; b=CjpRtNk71t1in64X8ouERb3jY6GBrf11i/ILqKddu4SKQOqoqkPYuu6pVvTR0kU8oFSEhsfXuEPNflI/1ni2byqQ/hCqMvq4Poous0Ca8xty7CFZolloUnI4OZa8qmXEK9+JYC43aNTzRbrXlFcBX9101kEMdKt+uV6IZHsO4XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769245161; c=relaxed/simple;
	bh=tVkpJUhJV0yz3hIfA1c/ax45SvLSW3anT2CnsFRf0EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q06343ydbVuEkPQZhN8tmjXcm0c48v6qycUOVjzBUwOoN4Uuz1O86anNuCaOXvUUt+3T1QRVKO6GAwCFOo1n3Gf5TT89Sgs7GFqfEsEmiRK8g39laS7KhNftgUR3Nyh+iXheAXk8fTjB9+z/iLUqfFIUJBi0Xv+jvNh4rvvv81k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JnZ1btgI; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JnZ1btgI"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-121a0bcd364so5082911c88.0
        for <chrome-platform@lists.linux.dev>; Sat, 24 Jan 2026 00:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769245158; x=1769849958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SqTGKUjdzlyK/szCvxcewbfYUAFRrUzmh8vPDXqL7bo=;
        b=JnZ1btgIJxDBnjoFfBIF8THF+P3WiWoV0BZL8aXqEWNick0gTO+nMmQdJUudXrAXEv
         nMCnUQsqFJMCnNWbV0/A8o3Hz7N0OO0mhBlXZd1Rh0lqCYcYS4P20YnKCTuPXbvm5dxJ
         TBbH/ymjQhLJKAMLOCh78u1QXOdb4HXKE6cvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769245158; x=1769849958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqTGKUjdzlyK/szCvxcewbfYUAFRrUzmh8vPDXqL7bo=;
        b=QbMVRTAq6TrWp1K3rKtq8xDsP5F3StkMFQZd/chmVcK/En49Qur6f8bQjKt30tc65s
         JkVTD64oe5NJdyu8agPRD1G+6DOu/xbCHT40o1/RQ/rVSRO3zyPp67TwRQZHdfGDVyH7
         i4nknjEcnuZM3VDWrsMXJMu2BgTjw+WtkzYBMwzUk2QyonUCrQGQr4X/WJCXNBbaoytQ
         cM/Z3Kie8iU0UQKwnnyW9eD69Z9+biBcUVKT+qxAhcze/Jq3u3ce+0sAUlQMuFE49vr5
         32RQ6k/7k45xXmvpgHbh04nIazTtLuCEnPey7cDbArXjBAfMXvXJPtyv+URgPzH2op3X
         UibA==
X-Gm-Message-State: AOJu0YxVRabpx66SNaQf5DxQI56NvVUKMUg9Eod23ixrl2I3z8NtjAuJ
	vB+V9DfTYCP4kSf+7e6kCk8tnTZdBKOto6yIxzk3r6wZZsrdKA36iaeWzbj0yRM7hA==
X-Gm-Gg: AZuq6aLmvNgM2E0Se9fFrc6hIPTYLhpJ225wnEwURjGH3R7P7pieQgAcipMvf3y3hSy
	SnAQnZIIUnm0HjIEqWZQWoV1HsNbsmplkXEhJLto1UiapS376tKA5gUjT/v6QY3hNb4DoiJvizM
	WhUfzNJ1J7zBOvRlnHkR43F0XQSvAMHdJ90PS67114iWpdoiqn3KoiN0vbLmitM1FDxHmpHcLDS
	UkQGOmEGSMl0YCTU9ftMdwb8PHO//8ArGpLR6mbFJgm9VjQSoCHg3phnGnZTPtzMZb1V6N2aL63
	b+Swl+EARXyz6yLE3x/TwDSQqz5QtgL/Dlu/Dvw7dG5sCnmF6hlk3GDdbnJoHZHpWtFzsyiZo5C
	iB6L9txit6QJhiFKOyXvFda4FnJZURs398+P13PqKoInrjCxTl/9TFB0WoZewIyPvrdESuF0ruT
	ZJWaE7SFrZj+Mfba6eJ8VWPPUAmBqCGAaGlz9nWjfzOtmQ
X-Received: by 2002:a05:7301:6794:b0:2b7:3678:2d29 with SMTP id 5a478bee46e88-2b739b962e6mr2696910eec.29.1769245158513;
        Sat, 24 Jan 2026 00:59:18 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:d4f3:1875:fab6:7602])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2b73a691fb9sm6059437eec.5.2026.01.24.00.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 00:59:17 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH 2/2] chrome: lightbar: Add support for large sequence
Date: Sat, 24 Jan 2026 00:59:14 -0800
Message-ID: <20260124085914.836564-1-gwendal@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
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
 drivers/platform/chrome/cros_ec_lightbar.c    | 80 +++++++++++++------
 .../linux/platform_data/cros_ec_commands.h    | 12 +++
 2 files changed, 68 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 85f30c8dfba3..d8d66343e2e7 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -30,6 +30,11 @@ static unsigned long lb_interval_jiffies = 50 * HZ / 1000;
  */
 static bool userspace_control;
 
+/*
+ * Lightbar version
+ */
+static int lb_version = -1;
+
 static ssize_t interval_msec_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
@@ -467,10 +472,11 @@ static ssize_t sequence_store(struct device *dev, struct device_attribute *attr,
 static ssize_t program_store(struct device *dev, struct device_attribute *attr,
 			     const char *buf, size_t count)
 {
-	int extra_bytes, max_size, ret;
+	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
 	struct ec_params_lightbar *param;
 	struct cros_ec_command *msg;
-	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	size_t extra_bytes, max_size;
+	int ret;
 
 	/*
 	 * We might need to reject the program for size reasons. The EC
@@ -478,14 +484,22 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
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
+					count, max_size);
+
+			return -EINVAL;
+		}
+	} else {
+		extra_bytes = sizeof(*param) - sizeof(param->set_program) +
+			sizeof(param->set_program_ex);
+		max_size = ec->ec_dev->max_request - extra_bytes;
 	}
 
 	msg = alloc_lightbar_cmd_msg(ec);
@@ -495,26 +509,44 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
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
@@ -592,7 +624,7 @@ static int cros_ec_lightbar_probe(struct platform_device *pd)
 	 * Ask then for the lightbar version, if it's 0 then the 'cros_ec'
 	 * doesn't have a lightbar.
 	 */
-	if (!get_lightbar_version(ec_dev, NULL, NULL))
+	if (!get_lightbar_version(ec_dev, &lb_version, NULL))
 		return -ENODEV;
 
 	/* Take control of the lightbar from the EC. */
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 9cbf024f56c3..5a2fd6acdbb9 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -2020,6 +2020,16 @@ struct lightbar_program {
 	uint8_t data[EC_LB_PROG_LEN];
 } __ec_todo_unpacked;
 
+/*
+ * Lightbar program for large sequences. Sequences are sent in pieces, with increasing offset.
+ * The sequences ar still limited by the amunt reserved in EC RAM.
+ */
+struct lightbar_program_ex {
+	uint16_t offset;
+	uint8_t size;
+	uint8_t data[EC_LB_PROG_LEN];
+} __ec_todo_unpacked;
+
 struct ec_params_lightbar {
 	uint8_t cmd;		      /* Command (see enum lightbar_command) */
 	union {
@@ -2066,6 +2076,7 @@ struct ec_params_lightbar {
 		struct lightbar_params_v2_colors set_v2par_colors;
 
 		struct lightbar_program set_program;
+		struct lightbar_program_ex set_program_ex;
 	};
 } __ec_todo_packed;
 
@@ -2154,6 +2165,7 @@ enum lightbar_command {
 	LIGHTBAR_CMD_GET_PARAMS_V2_COLORS = 32,
 	LIGHTBAR_CMD_SET_PARAMS_V2_COLORS = 33,
 	LIGHTBAR_CMD_GET_PARAMS_V3 = 34,
+	LIGHTBAR_CMD_SET_PROGRAM_EX = 35,
 	LIGHTBAR_NUM_CMDS
 };
 
-- 
2.52.0.457.g6b5491de43-goog

