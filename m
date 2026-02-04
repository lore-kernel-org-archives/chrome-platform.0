Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B62DD5F6
	for <chrome-platform@lists.linux.dev>; Wed,  4 Feb 2026 03:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770177553; cv=none; b=UK+kJKsIF+1oNa/T0QpsAbr2FHox3ELpxbcIbX9Cn1cayP+KJX4q2scYKS+C1n3GNCtFcZEmJ7o3PqeuJX7TJyjD3hHd/L7ZprpgD/5AE+aHotg7F/f+9V3fOSZUeYuvqRTsTc77p0sbc9nT127O48VRCEm0kooy4OcT7G3x3Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770177553; c=relaxed/simple;
	bh=l2Tn5DwQcxUSsV0CdaRcijOjOZtthNul1Ch9aUl+Uh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XctlWaPPLvB0vRjbirxVJC6XitALTj7si5aCJbvbwWkLj651t+wK1DFaZGiC1dhl9D4xAAB6nS/kDa84wP2PR59AUVq0yUh4DFqaORCzLvEvGMF7gvpJ7ysAq94K3ffRlqFHyOem2EeQSrTQfci6Rxr8P6XFQpaXwWB7M9913hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hpGY5r/M; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hpGY5r/M"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124566b6693so5268157c88.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 Feb 2026 19:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770177551; x=1770782351; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aFbTfhomqZ9IlV2S94N/up0i2VH8QxHE9TAewGEB644=;
        b=hpGY5r/Mn00WsoYwkcU2R8UPU4EboJT0A8cF16Was/kNz3Uj+27WDnTfPeuOWnxaWJ
         hlqOZzFmVkwEtIJtQCuoaIxUQvvCDaKZOF2ZZfVqlN4nkSSmMmC4bZDmu2EB6WMv86Jz
         0GtHn0e8CFyGP04t2D8DeEqY6p192hJ3aDQAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770177551; x=1770782351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFbTfhomqZ9IlV2S94N/up0i2VH8QxHE9TAewGEB644=;
        b=cz81KqY61HO+zuzAk5DvsdDkFXvd+jgMsOfcya1GWtpEO7ETQmxpWthj2GPG4Xy0he
         iKxkHZt0ILQN+6qe58c9Q+XvEXyZeMnFzzcunoFiYmELzkdPzJEEW9rnWLrWy/+A3Xwm
         CtDu2F3Lc/NqUD93LRT+tSC5AQToc9Ldut3T0cXQUcdE0r1/41HNpubb0k+0B31Yt8mG
         StTj8kXzJPU3p5Hu7PYGVhRj653HAfsvM6Ef2YZZttqGKSPFbomBrRmxKN5CJSFsbyjo
         M2xtt6I5q/WA69AAQJ8bj1MHKE9AB5BneQhXUwt3Fj5zUywYexs+NX3qzrSAb+LiPqUz
         GYGw==
X-Gm-Message-State: AOJu0YylMgrKxqqZ/9iCuBwsIl6jtdV2PvsSIWwPWETRehzFNn3Eo1Fx
	JlS/PbLM4MVqHmf1u2Kr/hqYs1P9EM+oD1ayIsx/eQrWetP3GwlwqFK1ZOoyq71E5NP/hDv2bFM
	rbQo=
X-Gm-Gg: AZuq6aIORrqxsdOvTYydlbf/GhP/Uu5MuauDzq85EJ4LlKQqGtzbhSQkDg2pVNSRVOC
	SaCmCvP/Xi6SLt5Xz+JbffG5QQsJzhF3OV4dL1KG1Bi2wYE49ZXL6eNBbJCJdvwUFsncSGtr1Vh
	IbDnfWje/vhRTE4+aQpAWhgy6M4SC+3yPqjNwy4fKvTbMDzqWjslEdLzA47vmlchhXNFQUzpcUW
	FuUD3i3fxIPa3AXCkgTjMYlz9NEAjziwJiAnZxGa8zUl1IWM9eIlD/iW395J6lDt6NUc7zPOGRF
	U8/N5eTaq6A/CVniSxrMmjpcwubTo2sRAzNTD6XUGV9XWFgMPgbysqWmFprei9WsHtI6UhdZ1Af
	ncF6DS67jTaOGFsv55e35XLuso8j/r4GasgFZd3gSdxrtlo4yWyOoiEuGCZawdly6hRedl5F9VS
	UyghGiGoZcnoH9xSPQlm/4t5L9qEKGh5Pnfb1KhS5vP1w=
X-Received: by 2002:a05:7022:6b97:b0:123:3bc6:1ff7 with SMTP id a92af1059eb24-126f47c429bmr662779c88.27.1770177550517;
        Tue, 03 Feb 2026 19:59:10 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f344:7386:c61:daf2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-126f5030df4sm1073704c88.9.2026.02.03.19.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 19:59:10 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH] platform/chrome: lightbar: Add on/off switch
Date: Tue,  3 Feb 2026 19:59:06 -0800
Message-ID: <20260204035906.703625-1-gwendal@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add write-only sysfs entries 'on' and 'off' to switch
the lightbar on or off. Survive reboots, return to `on` on EC resets.

Triggered by:
echo 1 > /sys/class/chromeos/cros_ec/lightbar/off
echo 1 > /sys/class/chromeos/cros_ec/lightbar/on

Signed-off-by: Gwendal Grignou <gwendal@google.com>
---
 drivers/platform/chrome/cros_ec_lightbar.c | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 2d1aa6edda1a..d17e2c463fde 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -262,6 +262,69 @@ static ssize_t brightness_store(struct device *dev,
 	return ret;
 }
 
+static ssize_t single_command(struct device *dev,
+			      enum lightbar_command cmd)
+{
+	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
+	struct ec_params_lightbar *param;
+	struct cros_ec_command *msg;
+	int ret;
+
+	msg = alloc_lightbar_cmd_msg(ec);
+	if (!msg)
+		return -ENOMEM;
+
+	param = (struct ec_params_lightbar *)msg->data;
+	param->cmd = cmd;
+	ret = lb_throttle();
+	if (ret)
+		goto exit;
+
+	msg->outsize = sizeof(param->cmd);
+	msg->insize = 0;
+	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
+exit:
+	kfree(msg);
+	return ret;
+}
+
+static ssize_t on_store(struct device *dev,
+			struct device_attribute *attr,
+			const char *buf, size_t count)
+{
+	bool val;
+	int ret;
+
+	ret = kstrtobool(buf, &val);
+	if (ret < 0)
+		return ret;
+	if (!val)
+		return -EINVAL;
+
+	ret = single_command(dev, LIGHTBAR_CMD_ON);
+	if (ret < 0)
+		return ret;
+	return count;
+}
+
+static ssize_t off_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t count)
+{
+	bool val;
+	int ret;
+
+	ret = kstrtobool(buf, &val);
+	if (ret < 0)
+		return ret;
+	if (!val)
+		return -EINVAL;
+
+	ret = single_command(dev, LIGHTBAR_CMD_OFF);
+	if (ret < 0)
+		return ret;
+	return count;
+}
 
 /*
  * We expect numbers, and we'll keep reading until we find them, skipping over
@@ -591,6 +654,8 @@ static DEVICE_ATTR_RO(num_segments);
 static DEVICE_ATTR_RO(version);
 static DEVICE_ATTR_WO(brightness);
 static DEVICE_ATTR_WO(led_rgb);
+static DEVICE_ATTR_WO(on);
+static DEVICE_ATTR_WO(off);
 static DEVICE_ATTR_RW(sequence);
 static DEVICE_ATTR_WO(program);
 static DEVICE_ATTR_RW(userspace_control);
@@ -601,6 +666,8 @@ static struct attribute *__lb_cmds_attrs[] = {
 	&dev_attr_version.attr,
 	&dev_attr_brightness.attr,
 	&dev_attr_led_rgb.attr,
+	&dev_attr_on.attr,
+	&dev_attr_off.attr,
 	&dev_attr_sequence.attr,
 	&dev_attr_program.attr,
 	&dev_attr_userspace_control.attr,
-- 
2.53.0.rc2.204.g2597b5adb4-goog

