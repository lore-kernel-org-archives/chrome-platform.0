Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D781EBFE0
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 06:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769495685; cv=none; b=iWP2BMPKuQkPNHsCrHiRGrt1lP3R+8sxu1OTUNWcokCRHdzWvGnEtPDt8PFGO9YlaPwLdMckLN6tUiYR1ZlnY6Ep3LABlGWBiDkxYG7GJzarpMAJh9wLyIRlMTYCn4jrm/cZeGaryRVKOG3S7MeCEXm459yjCW7tOlJEb1k0avU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769495685; c=relaxed/simple;
	bh=v0/UMX0hZeVyTxOecIyPWzO35MBHueKWQrC+YOU4dgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=saM01LnWRWRP0rNMIx4EtTghHJVmaP/esmJuBGhkRKSLqHykdBosROAMscEAjNVp1WVLAk739bDrNDJ6mzHKlkt6jsOvvWFJ3CJL6cnEDIZDxMOg5J9ODtfRkyRnTXMwUPQvr54huT83CQh8UiEOCPB4Q0P7ai9W90RQO9t6TN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YC5K/P1g; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YC5K/P1g"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b71320f501so11216827eec.1
        for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 22:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769495683; x=1770100483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tt1VRalfXY8XLioz7H+sQ8LPvXjpz8rdfJNJO45ht78=;
        b=YC5K/P1gygqNh6FYPkwYGS7rsytbPkZLH87JJbnAmYW/hNQk1dX3/0YfVWF+5eQohI
         vnQ7B71R788OdlM43/7KBqP6GuGpTuTuUGJKfsxfHJU2IX+TtGbJaJi0uSENOWjrmC0r
         85qyeWrtIrsPdBPOM1xfljbNtozUsXWqcUGcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769495683; x=1770100483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tt1VRalfXY8XLioz7H+sQ8LPvXjpz8rdfJNJO45ht78=;
        b=AjRlhmA/CzOUf0iv/8C2iKl2gM+XwwGVK5qZaINRB/ULJp0kTDtdO5MnMZHASvHcn1
         +2BVj/FomP3BLvmbzFdMarTGBKlul3zStHXjE9nw72a6R3Vvf15rsuDnWCp5G6rJKBUm
         gniiTb7wBIbHbKJxPi7Eblny64gXtScRbsTXfy/SruXaPQrUfGHNht0Ejz5xt1hD7T3Z
         CePtubv71uyNLgxSglkwv63thNCYCix/UdRTMr5AnXxewETm8gZZIXX32zaxjjJYEJsL
         x+5JrEuVdT7DGaUQ/zpAy/yXxmJ7cxoKyXhb5lA/i+2eFG7dj1ch6gpLmbu30sobVSO7
         qPFQ==
X-Gm-Message-State: AOJu0YwlL/sQKbZn9qZHioV3usq115vP4bUdBQqehYXSFbhRgF/MB4Lt
	pYK/LurVQleuA1sCVGVft0qknf+NmK6Ni5Kv5m4tUrw+TW/E8HDUjIvzgKxZL+voRCaJrIbfgMt
	DuWU=
X-Gm-Gg: AZuq6aK1dG1iJptxn1bED/gh25W1p3rq0acA8vDJdt1daFKs8VhDLaTcIzVx2yiLr8F
	qx5JISgTcQNFxlxyyc/swg6lwyyec9r52AMPEQ5W3/EpokSk6FH7wkvYanF34iySctRy7tGGe+Z
	am3/lynK68daBKvkTNQ5KzMArceJ/tOCP6E2D7PilG7xV6Aa3iOzRBGIu7q+tKbnabeDqIP41lg
	0aQcxarPo+A7CDpSRS519iQeaOyrtzhcrE6d+1FIbsXY7HS/K2KoyoVRns5OLd/lNSus/jOPuxu
	aanNPhY2ej27jVSwfWNPzYoVTgvp9C/mjHqoTtTVA2gIyWgSbUNsLpqn4Wq3UUcjYM3K0KJ0YPn
	36YRHb+eFz2/yj9koaqbryXXzBig4BT4qsRdsc38gZ7sriHQHs+orpi/Jye71HF9WEPIyOqIpOn
	fEgyFJtsdf+JtiUed/mJXISrG+S7UI4+N648moXlhvEKcAwX+VzkhSeic=
X-Received: by 2002:a05:7301:6086:b0:2b7:1ef:5867 with SMTP id 5a478bee46e88-2b78d92319amr454240eec.16.1769495682664;
        Mon, 26 Jan 2026 22:34:42 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:d47c:2299:5fd3:df50])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2b73a691fb9sm15948682eec.5.2026.01.26.22.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 22:34:41 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH v2 1/2] platform: chrome: lightbar: Report number of segments
Date: Mon, 26 Jan 2026 22:34:33 -0800
Message-ID: <20260127063434.789047-1-gwendal@google.com>
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
Changes in v2:
- Put local variables at beginning of num_segments_show()
- Cleanup return logic.

 drivers/platform/chrome/cros_ec_lightbar.c    | 43 +++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    | 11 +++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 87634f6921b7..632458b82352 100644
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
2.52.0.457.g6b5491de43-goog

