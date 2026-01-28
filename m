Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171AF2C21D8
	for <chrome-platform@lists.linux.dev>; Wed, 28 Jan 2026 03:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569385; cv=none; b=nirTtcB3migOvsik85wJhjA2wVhxNS5OzlXwNlE+ofIH4fs8oJuoa+lUSZrxQcmpHDyZWv9inEwnk+uDo+CsLLyIPpnZn/kOnG6C+IiHNvkBVl2D+AZT9EKfcuQQ3rH9s6j8uG0zjmemwKWnbWM9VnrJXE72+/orrFcttcoN5ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569385; c=relaxed/simple;
	bh=THJ5F6jKPe+pWU/+dvh3AJ7ukTkcXCt1zVOobJxsskw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o1PVcojg3/2as9+8Ff4rZtxglozvAnL4vA8lnIUEJBSbx9HX2iOvjUgH3Kc0wsOuYd72aKcWthoQXJdANH0CcgIs6ZTU66g6ODojo9f7IJP+jSGPfok7zGhjcLL/CqP//o4XAEFiTcsP+jGZxdg3K2TwK4gtW9SnfzwSffD5zzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RnpdA5DW; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RnpdA5DW"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12336c0a8b6so1767920c88.1
        for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 19:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769569383; x=1770174183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mDHXnu2aVNpmiqVAA07gW755PeA4YWnDJOTXGi0pmuw=;
        b=RnpdA5DWg7FkSQ3Pt6Z/oMa1VpYUJI/GwsQgWeZVqOsi8+dP24bFFLDUi1lWAqu3vy
         bREAm3QFmnJ1TnU4HkhAWuVXpTMYHSmvpZ1YpB+i0BTG8if9v6Xny0A/e930CwEqqudE
         uRDskalCANu7j2aCXhGUWWSzZEV4A1pQyfrRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769569383; x=1770174183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDHXnu2aVNpmiqVAA07gW755PeA4YWnDJOTXGi0pmuw=;
        b=EhZezlcYDAz4/bofnRX1tgesFZsB1GsXn3OzQ53r6v6ZE5CIsQ/bPIUKpE63ISs+Gc
         blSwXSBw0BBTkf7nIQi2AvTv77U/PdkiBoPP1gTXCSFd4VC2uIeWPQwLRdPiykJpkgk+
         x4K80HZnO+kQRAHwxz2rHYsT6CYrFkNGDeQRE+ZjfoJuOncV/tZPt/S0bFvOi96tfCj/
         QLKPffkJ0pWxHfasCXLekUf8EkUG7lYTlwrD6haULmiZAVMHX6IYUh6TAO755F0d1HVL
         CXhB9DueycJo9LBZugdTRtQaLyhq7rvXNfffg2QP3apU44bLGNecrArb5h5vlmaF54Vr
         +AHA==
X-Gm-Message-State: AOJu0YxVjsfkRByG669+aCrB8F8zYnJUxV8CFIicO2dYuxDvO37I8Yyp
	+F85/xSv24ZHGYD+JjJ+RDySubcXrpsjyoLzLKxS+to0JhiVQc1ONh1gi5G94hVCtQ==
X-Gm-Gg: AZuq6aJdnWbhv8ZdX0aEz7zFE4y3yksLh6tGqcerLFSvcODMVz3C4U8bu089BuaSbIO
	uJqjfd8Wd5qTg07c0bLKYzpTsfj5H+ve4V61yjcqQ1qI15jpwquW2YOvsJM1Mom+wOXolKjM98B
	gWcx2hFgfDd1nAUGNMJRru6vTS79zUxl1rDRmc3kJw8rgZlvT9/xJiAmF//cMxOrNfs41a4LrAG
	cFChinWbQxzEdv1Ao4wK71C3OXpflJfuTgAGMNSzZ440JUJWBFqm1zbk8iVCXltmPozbAcHKyPA
	JpBPt19Znk8kvx4+bTgvnr7qMBmjRAV9EkiyzpN8h9ZMuWZEwP6gRDfp/eDSA8OD4uHDu2GMR1l
	JkMuSlM+7wIYU4OurmArorkKa4B29qPARSGz+kl1YgmkxqY3f2yMckAu5dkq0wVYeLXFrS8pX7+
	jlh3Um70ns0KoLekQsrUMq6qGFLKkU3sLkBZFuGMRFi/r7
X-Received: by 2002:a05:7300:e80f:b0:2b7:2bf3:ce05 with SMTP id 5a478bee46e88-2b78d9b5c62mr2341503eec.28.1769569382884;
        Tue, 27 Jan 2026 19:03:02 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:bbd7:b5c3:7c7a:45ed])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2b7a170ca0esm888282eec.15.2026.01.27.19.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 19:03:02 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH v3 1/2] platform: chrome: lightbar: Report number of segments
Date: Tue, 27 Jan 2026 19:02:58 -0800
Message-ID: <20260128030259.1703848-1-gwendal@google.com>
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
Changes in v3:
- Use proper field "insize" when setting tunning response size.
Changes in v2:
- Put local variables at beginning of num_segments_show()
- Cleanup return logic.

 drivers/platform/chrome/cros_ec_lightbar.c    | 45 ++++++++++++++++++-
 .../linux/platform_data/cros_ec_commands.h    | 11 +++++
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 87634f6921b7..30f3e24c84c0 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -119,7 +119,7 @@ static int get_lightbar_version(struct cros_ec_dev *ec,
 	param = (struct ec_params_lightbar *)msg->data;
 	param->cmd = LIGHTBAR_CMD_VERSION;
 	msg->outsize = sizeof(param->cmd);
-	msg->result = sizeof(resp->version);
+	msg->insize = sizeof(resp->version);
 	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
 	if (ret < 0 && ret != -EINVAL) {
 		ret = 0;
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

