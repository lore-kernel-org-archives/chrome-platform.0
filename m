Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B964D32BF55
	for <chrome-platform@lists.linux.dev>; Fri, 30 Jan 2026 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769760839; cv=none; b=I7cCGqdDP7aLZDpxlEt4AxugIStXcDwzz3uJMcZ1XxeMUIebTG6sAehYEyNZIoAkHtOKmjeSaX/J6ez3U357fxbdnieLrXA9XkBJJMHoxV1U6xXjCWxRdkfLmQu0wp2zjPJZYxJCv9AmN6qYW4D+lfTsViZE0bYD4TWmpdGOKBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769760839; c=relaxed/simple;
	bh=1mDa0Kv7DiqdWBjNWjMgPGQaVmo+uY10HA3hocjPPzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vj7ZDDU68Ua9ByznqlLfoomOhO6mVz5rNTdAKHuRFoKUf6Mh2j6D986891cAB6BvJ+Q3qiP4EXBEo93hR9paeGYVrc7DVoEutZFRNRfIHmQh8JAXa1Vq08FcZBQgFyvvuWAdaNGolMDkTsrqOqzW3nJU2nR2IQlYGm/W3Q71Vbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QWaJph2R; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QWaJph2R"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b729f4c154so3611515eec.0
        for <chrome-platform@lists.linux.dev>; Fri, 30 Jan 2026 00:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769760837; x=1770365637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ogtyIwYd+pJEtbDIBk9toJlFYEmwCjsHBPEM7Z8fszk=;
        b=QWaJph2R9d9v+3Nuht5tdALzMsilwcbKhYQ/5XKXGpTTXF9KsaLsFT/Ge/OazI2G76
         MMVvdsG56T5qW/L9ffMGbNbc34oKyrDvxx654fwqeo77zDlrRGCVyqR3bRaRwsQvD0vX
         pvJ/uz4Sq6p1PkzaNXgJfkmvq1MLEl5QAgyjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769760837; x=1770365637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogtyIwYd+pJEtbDIBk9toJlFYEmwCjsHBPEM7Z8fszk=;
        b=JL5Vq7peenNH79FYaVxKDIQ/J45oQUP1zuS7g+Agjpps5hLoYSnxTnMKjmeqJy4k4e
         ThvCjKLEjd/CLZ+BJQdWnPNbKuwtBiWXww1lPvA1MyB5SX88MQ7Fb0PsVyjLIvglyORs
         QFeNoBcgaHKOq8+zRBKF9pHzFufTvXWXB5hGR/eGJ927qngAG8NFoqnrxefdqYsLYsud
         SChmcOf0QhlgPXuEpR8+kEqAmg7CzcVLjcx/274lH9bQNMb00qcFLUvYtoOtVBbJsg8m
         FMBHpw/zxx+8BSt5okHXMfyJsFX96sc0jb1H7n3CobKsk0+Y9xYEBuI/m73hyWszKpXw
         iy3A==
X-Gm-Message-State: AOJu0YymR7f0mntps1zTtxaVW1k+7h8M0Qul7PTgO/EUswOds/JeYdOT
	9oJ2dyDlbuhtsON/prmTMas68yVgXkvlacD6LMA69dCf7YJRWAVoFf1bxf63m8Fhnle8fDcHEfI
	v90k=
X-Gm-Gg: AZuq6aKi9Ir3SyKWD7b4wq+0BTszd7WejJNw8RkJqMNylv8yTvbQGjabpZhPvQoZfod
	blbb7yjMd6gCdesaaOvzEqywUxmYA73+TEEh7gT31Sa/V5MxxtdVOKV52a2IWSrHxw6Zn1R9LhR
	oaU+uNu1mqNxi5/N79vrI+V9691yVENxc2jv4sB2MT4HRzsamnFPvlNE6Ey8xdyIic4PyS3U6bi
	xY045vIfHbjVCoXFszEyhvNCaOjEn2vjUujAHRgQGG7iwgow1CBT/RMahp1foaOknHzvxd3beWj
	ZB3AbXg9/piJqjoAqFnPT7z3mwAXiYXgHH1tw4Kh8CxQBc7EMal73BOqryJTL/VSiVE3hfSf/d7
	pG8Vyw2CmQAqiwuFRK1g0GR6VL88GpQd0CqqAdjlN3iIHNr3Dy/27dcRYu3MhhMIhBvrucIOVDB
	i23M+XyVxdA2Q7nYlK62ROi7yFDVdphzHI/E83G1wzGg6d
X-Received: by 2002:a05:7301:4198:b0:2ae:5d8a:7095 with SMTP id 5a478bee46e88-2b7c864e2a8mr918090eec.10.1769760835262;
        Fri, 30 Jan 2026 00:13:55 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:25e3:7f30:7f62:d1ad])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-124a9d7f95asm9135761c88.7.2026.01.30.00.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 00:13:54 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH v4 1/2] platform: chrome: lightbar: Report number of segments
Date: Fri, 30 Jan 2026 00:13:50 -0800
Message-ID: <20260130081351.487517-1-gwendal@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add attribue `num_segments` to return the number of exposed LED segments
in the lightbar. It can be smaller than the number of physical leds in
the lightbar.

Test: Check the attribute is present and returns a value when read.

Signed-off-by: Gwendal Grignou <gwendal@google.com>
---
Changes in v4:
- Remove fix in get_lightbar_version(), not related.
Changes in v3:
- Use proper field "insize" when setting tunning response size.
Changes in v2:
- Put local variables at beginning of num_segments_show()
- Cleanup return logic.

 drivers/platform/chrome/cros_ec_lightbar.c    | 45 ++++++++++++++++++-
 .../linux/platform_data/cros_ec_commands.h    | 11 +++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 87634f6921b7..5f14c7425faf 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -173,6 +173,47 @@ static ssize_t version_show(struct device *dev,
 	return sysfs_emit(buf, "%d %d\n", version, flags);
 }
 
+static ssize_t num_segments_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct ec_params_lightbar *param;
+	struct ec_response_lightbar *resp;
+	struct cros_ec_command *msg;
+	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	uint32_t num = 0;
+	int ret;
+
+	ret = lb_throttle();
+	if (ret)
+		return ret;
+
+	msg = alloc_lightbar_cmd_msg(ec);
+	if (!msg)
+		return -ENOMEM;
+
+	param = (struct ec_params_lightbar *)msg->data;
+	param->cmd = LIGHTBAR_CMD_GET_PARAMS_V3;
+	msg->outsize = sizeof(param->cmd);
+	msg->insize = sizeof(resp->get_params_v3);
+	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
+	if (ret < 0 && ret != -EINVAL)
+		goto exit;
+
+	if (msg->result == EC_RES_SUCCESS) {
+		resp = (struct ec_response_lightbar *)msg->data;
+		num = resp->get_params_v3.reported_led_num;
+	}
+
+	/*
+	 * Anything else (ie, EC_RES_INVALID_COMMAND) - no direct control over
+	 * LEDs, return that no leds are supported.
+	 */
+	ret = sysfs_emit(buf, "%u\n", num);
+exit:
+	kfree(msg);
+	return ret;
+}
+
 static ssize_t brightness_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
@@ -505,6 +546,7 @@ static ssize_t userspace_control_store(struct device *dev,
 /* Module initialization */
 
 static DEVICE_ATTR_RW(interval_msec);
+static DEVICE_ATTR_RO(num_segments);
 static DEVICE_ATTR_RO(version);
 static DEVICE_ATTR_WO(brightness);
 static DEVICE_ATTR_WO(led_rgb);
@@ -514,6 +556,7 @@ static DEVICE_ATTR_RW(userspace_control);
 
 static struct attribute *__lb_cmds_attrs[] = {
 	&dev_attr_interval_msec.attr,
+	&dev_attr_num_segments.attr,
 	&dev_attr_version.attr,
 	&dev_attr_brightness.attr,
 	&dev_attr_led_rgb.attr,
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 69294f79cc88..9cbf024f56c3 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -2005,6 +2005,14 @@ struct lightbar_params_v2_colors {
 	struct rgb_s color[8];			/* 0-3 are Google colors */
 } __ec_todo_packed;
 
+struct lightbar_params_v3 {
+	/*
+	 *  Number of LEDs reported by the EC.
+	 *  May be less than the actual number of LEDs in the lightbar.
+	 */
+	uint8_t reported_led_num;
+} __ec_todo_packed;
+
 /* Lightbar program. */
 #define EC_LB_PROG_LEN 192
 struct lightbar_program {
@@ -2086,6 +2094,8 @@ struct ec_response_lightbar {
 		struct lightbar_params_v2_thresholds get_params_v2_thlds;
 		struct lightbar_params_v2_colors get_params_v2_colors;
 
+		struct lightbar_params_v3 get_params_v3;
+
 		struct __ec_todo_unpacked {
 			uint32_t num;
 			uint32_t flags;
@@ -2143,6 +2153,7 @@ enum lightbar_command {
 	LIGHTBAR_CMD_SET_PARAMS_V2_THRESHOLDS = 31,
 	LIGHTBAR_CMD_GET_PARAMS_V2_COLORS = 32,
 	LIGHTBAR_CMD_SET_PARAMS_V2_COLORS = 33,
+	LIGHTBAR_CMD_GET_PARAMS_V3 = 34,
 	LIGHTBAR_NUM_CMDS
 };
 
-- 
2.53.0.rc1.225.gd81095ad13-goog

