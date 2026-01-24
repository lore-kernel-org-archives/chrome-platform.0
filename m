Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0022339
	for <chrome-platform@lists.linux.dev>; Sat, 24 Jan 2026 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769245144; cv=none; b=FAlgGxF/XVt3muJH/egboiSm9MAbbRC1llTwO+WOZ2DB3pQx331SlqVqRSAqHhz3uWcUcTzlmfoav3VJ8+oOlmjMZe994+HpkpRBaO8XwU7P8SrSgbzSljL8LUWjbyO9Y5StQgFMcak9U+jA7KRP0J4z4VJ1Y1SJcUgJvGMiY/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769245144; c=relaxed/simple;
	bh=QJ9Dm7qVaRRTTrm96hR0LA4w+WTXFl6dxVGhihQHFAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WnAP2CUjoKwJy3/a3MUYsq3ZPa3XPyPiLu/n3CinaZ3vpd09rK+7Gi332ku2MMoFgpL7x64FoFVQwH9BtxreUo/TLv7+i+tYf1xFwGEkoOyUwSzS33QISEC4hSIYxBpjUmIhKNE35lVIAkWmTolVeJpD5cohnjvHUSWjOG/RH8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dC79/FXt; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dC79/FXt"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4751929eec.0
        for <chrome-platform@lists.linux.dev>; Sat, 24 Jan 2026 00:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769245142; x=1769849942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zAuid/WUExUefVzCkqE8be2m6uqBrj1UpVewCq0bZVw=;
        b=dC79/FXtX2jSBWXWNPhcxh/q3CfWeWQL6xn6NfFRfUX4x5FhiCkcD1zRnH955zutTd
         5zj1oHB90+8yg97zXi5u743DmNS+Zu9Kf/+ZPTKRyEdPwmEZoGt8ArwYV4GK8V0hBIJ0
         r/hSK6N7xEAlB9z9i34Uh/Kibf6mTaTp3A2GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769245142; x=1769849942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAuid/WUExUefVzCkqE8be2m6uqBrj1UpVewCq0bZVw=;
        b=sYokCAAoYetHRFnPAB3nZWSY80EKOpM0fFLct5UviX/Yicys2ipariqg2jUZ2xSyCf
         ZDPeidYCIQroKgxKpJJGvtuC6g72UcTz9Uk2c8+cFsIdcdOjeLcWkSXqmYsTCRb7EqAu
         o2b7Umi6O10QIc82NglEMK66V68aUq7dRdCE8PBu2A9sME7l6LQ2guB2tgOn0pIeNLsk
         vNAxTJ7SaUWeBdKcBYrzYdW6L9RNtSN9rc4jG+rV0qWoAAVritPX58fMHnY7YlAdYbTq
         ojGW8RBo5enKTKEvZN554ZT2TJYC2BoIlYgp/S7rV2QyBtBYmdTBWoDnG97LOQY73a0H
         yL+g==
X-Gm-Message-State: AOJu0Yxj4ALGyUakr4MqeTEBAAqBqafkCtoDDTF/ztDHCaAZP6Q8Vm2d
	FZtC4LSIaQ4S17P20p0Tolx3BA7BusnF7Hr7mnEL1fp6GnogT/9/9kAMjQT2ecUWig==
X-Gm-Gg: AZuq6aKzMAWBwk/eEELU2dOqCfauejfF0y7FdsxcCEEASLcAf+JBmYjZGXMYWnQyCPu
	YqYRhXZc+ApOYy5tLIHmyVktA0lHkB2YyMgeeftyikSTQuIoFe/UzlP09R0dvttSrRnuEOKHTuz
	nbIQHqvka0GNOvjSCrLXFPIMBecj173+XHKKdgHv9ukvuUdgKlOoGtzbx4qR8lwORnOsfDthxF6
	pdkITJ8F9llXHHTUtGhmcPNSPo0SVKCWxlClKfaMJCUePVIpToQcbvxsbU8KfzlSatereBxofa9
	IYF9Ofl0dwKNsjHLc7HcB+BQGkI7nHnGVvdnJGKDM550HHCmKZwAyxsrbJfd/bQdMZMu74/3sUR
	C7X+STh87NyuWj3GMEStavotrP6tow8+VjlSy/GF0Zuag65pbdX9QycYivcUS2+IQQYEjfL/5Eg
	SJsw+j92v0KU/QQQ+xrUj1gcmzQy1gSfuPIbKkJRjjAWyH
X-Received: by 2002:a05:7301:4e0b:b0:2af:b9af:ea7a with SMTP id 5a478bee46e88-2b73995ef73mr2771487eec.3.1769245142014;
        Sat, 24 Jan 2026 00:59:02 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:d4f3:1875:fab6:7602])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2b73a9fbdcesm6972549eec.25.2026.01.24.00.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 00:59:01 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH 1/2] chrome: lightbar: Report number of segments
Date: Sat, 24 Jan 2026 00:58:55 -0800
Message-ID: <20260124085856.826357-1-gwendal@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
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
 drivers/platform/chrome/cros_ec_lightbar.c    | 46 +++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    | 11 +++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 87634f6921b7..85f30c8dfba3 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -173,6 +173,50 @@ static ssize_t version_show(struct device *dev,
 	return sysfs_emit(buf, "%d %d\n", version, flags);
 }
 
+static ssize_t num_segments_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	uint32_t num = 0;
+	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	int ret;
+
+	ret = lb_throttle();
+	if (ret)
+		return ret;
+
+	struct ec_params_lightbar *param;
+	struct ec_response_lightbar *resp;
+	struct cros_ec_command *msg;
+
+	msg = alloc_lightbar_cmd_msg(ec);
+	if (!msg)
+		return -ENOMEM;
+
+	param = (struct ec_params_lightbar *)msg->data;
+	param->cmd = LIGHTBAR_CMD_GET_PARAMS_V3;
+	msg->outsize = sizeof(param->cmd);
+	msg->result = sizeof(resp->get_params_v3);
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
+	ret = 0;
+exit:
+	kfree(msg);
+	if (ret)
+		return ret;
+	return sysfs_emit(buf, "%d\n", num);
+}
+
 static ssize_t brightness_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
@@ -505,6 +549,7 @@ static ssize_t userspace_control_store(struct device *dev,
 /* Module initialization */
 
 static DEVICE_ATTR_RW(interval_msec);
+static DEVICE_ATTR_RO(num_segments);
 static DEVICE_ATTR_RO(version);
 static DEVICE_ATTR_WO(brightness);
 static DEVICE_ATTR_WO(led_rgb);
@@ -514,6 +559,7 @@ static DEVICE_ATTR_RW(userspace_control);
 
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
2.52.0.457.g6b5491de43-goog

