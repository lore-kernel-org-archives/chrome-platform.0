Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D44219E99
	for <chrome-platform@lists.linux.dev>; Mon, 17 Mar 2025 06:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742193645; cv=none; b=cgTKu8s00wC27WiNrd808y65nMikkizwLMDJFfxUvRvymcinAOU5Qk1WEDWPm++ldEJy3gewnEpm6lV7CflgsheegrkJxXM2c2ZElvHn0oBY6POj74urrF1MF3/HN0BVYy3DS2g7O8OVy7wQ4wrCne4d6zj4KOkCm9f9PDB9RSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742193645; c=relaxed/simple;
	bh=NNI2Z3H1Z1taOsrJKmGeSBymwwLbUWhciwJiqkKYPCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GO+1LMI0+7V+pWl7tULLn+rxHEUy1XcGwnBlqqPrdluhafcDK3IsYu3ToTve9TyA2lOwZNkfBam2MlLhmRcKtmQ6odtdh8YjEO7OgIctZwMRBvsjcKzkwXLT4nNjKm8t92bgiCj/9FLLLPTXOb54j5DH0aP2uRywcgZTlj2YGGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UbISuFos; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UbISuFos"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225e3002dffso33732935ad.1
        for <chrome-platform@lists.linux.dev>; Sun, 16 Mar 2025 23:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742193642; x=1742798442; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQk6j3M79hEoncMWZINU1Z+Ssb2ztnm1q7nYaYaJel4=;
        b=UbISuFosBFCO8hJapHDcspduSGM0gmMcmxcBjYqqiMWzTfZ7+HlbQNz0haixGWtfgs
         eJ1LktAQ4h8jqiD201a6Zg7CEQQRDu6HypHcCBpcQoyqnXaLN0FBQ/p0uk+TwEyTu0pn
         PzoUV9OQDUMUA8tUGDOvBeYoZhv1jnUZhBONs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742193642; x=1742798442;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQk6j3M79hEoncMWZINU1Z+Ssb2ztnm1q7nYaYaJel4=;
        b=rbst8UxW6nSo2bvo+w0RUhCEMbiBK/QujJSu2t4e14AutmDhlyqQm3tWErcYA0iAfx
         84ZfhRkVgPB6qfgBb9LGVMJ54XzSVPPO3HKp20vUFthR7u/LsHgRdHP6n2GqguoOOoh6
         SwJWGnZ9eM5N4IEGtQZw4ZwcZpsfGyftG8It1NPDpLNxs9kcnsULW7jLojbFbp3OlSPD
         nU03d+BX5H6rYTXcoY2FBJu05N07HxoOdym+3eorVWh7kNzLBqo9ZZ6mB/MnIK76iR8i
         ZJNqWdlIPlgqKiKMl19cApNMAJPiFkphK/Vg2vAf56fkbCN4v/JUQzcQxJSWITgBc18q
         OCew==
X-Forwarded-Encrypted: i=1; AJvYcCW5R+WsvzNqAKF2+0ahfXNwF5m6NFbwKd8fh9CAoHS1Zg/qogWEOoQ5E5vQ+dlzw1jz1fMG/eWujVAK0E1EmJU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQMr4gFfkfAxqRu8s8qXbHi+/KWKfLwYk23ah6GGYY+lh/k/Dk
	aLuMA/T7z3hT5EMIeWpt4EkiY8LZNo+BwN4ssT5tcSvKHWfGTb6S0crw7cjoAw==
X-Gm-Gg: ASbGncuKw6fRzX4+9GKg1MCgzb+XGYP92n/ndOlAj1OYsKaUBRfQKNUmOct/8u2d4M5
	9AznTW02JC2+gKuvLV1rZk0mWV2Qw8PnVXUHdvu06Ao1+hkLuu94+52RqnYD5XC+LAN/c6EvOS2
	jhAuXyUh0VDqYuwc8XeII30jD4cVTb7ce0f33u8iIuF6wMPPPNk7Cr40H0TxrZ1kjXJGfRSfYQZ
	obFSLfkzwrHCHIH5ueS24wWTQONjjpCl9TT+q0n/lF3e/A82R33lIHrYzuV+sTWJ+CB+mvGEoZ1
	B8Hiq6ng2DHFxiTMVo4UtoX/gZCEVtxSWUavYQOXvXul+WV/uilWhAVdZPT8X9v8d08=
X-Google-Smtp-Source: AGHT+IGvST1WW6xrrmRCUrQ9geHSg+2is3Fy2cyAzWBdbqKnhPLUHPqAQ6MYtun3HvFH4+LCOhrjkQ==
X-Received: by 2002:a17:902:e84e:b0:224:c76:5e56 with SMTP id d9443c01a7336-225e0a6b222mr134440485ad.27.1742193642285;
        Sun, 16 Mar 2025 23:40:42 -0700 (PDT)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:77b5:e0b8:95d2:83db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbcb24sm67619675ad.169.2025.03.16.23.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 23:40:41 -0700 (PDT)
From: Sung-Chi Li <lschyi@chromium.org>
Date: Mon, 17 Mar 2025 14:40:26 +0800
Subject: [PATCH v2] hwmon: (cros_ec) Add set and get target fan RPM
 function
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-extend_ec_hwmon_fan-v2-1-13670557afe5@chromium.org>
X-B4-Tracking: v=1; b=H4sIANnD12cC/32NQQ6DIBBFr2JmXRrFgmlXvUdjCOIgsxAasNTGe
 PdSD9Dle8l/f4OEkTDBrdogYqZEwRfgpwqM035CRmNh4DUXddu0DNcF/ajQKPeeg1dWe6aFFVe
 tB26GFsryGdHSelQffWFHaQnxc5zk5mf/93LDaiaMkLLrpOXmcjcuhple8znECfp937+jYcglu
 QAAAA==
X-Change-ID: 20250313-extend_ec_hwmon_fan-a5f59aab2cb3
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742193640; l=8426;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=NNI2Z3H1Z1taOsrJKmGeSBymwwLbUWhciwJiqkKYPCc=;
 b=ICbiLycT3VjgaMdDZnSIQZOmLY1PFd1I1c7IyKvp7jnTi9I4PzfXt5M6yyXhm3oHEWFVCwZgZ
 PiU2t7CIWcQACWIOg18QJIiP/9FAM5PZ278hQspJIav1d8egOr31QrA
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

The ChromeOS embedded controller (EC) supports closed loop fan speed
control, so add the fan target attribute under hwmon framework, such
that kernel can expose reading and specifying the desired fan RPM for
fans connected to the EC.

When probing the cros_ec hwmon module, we also check the supported
command version of setting target fan RPM. This commit implements the
version 0 of getting the target fan RPM, which can only read the target
RPM of the first fan. This commit also implements the version 0 and 1 of
setting the target fan RPM, where the version 0 only supports setting
all fan to the same RPM, while version 1 supports setting different RPM
to each fan respectively.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
ChromeOS embedded controller (EC) supports closed-loop fan control. We
anticipate to have the fan related control from the kernel side, so this
series register the HWMON_F_TARGET attribute, and implement the read and
write function for setting/reading the target fan RPM from the EC side.
---
Changes in v2:

- Squash the read, write, and register of fan target attribute to 1
  commit, as they are the same topic.
- Probe the supported command version from EC for setting the target fan
  RPM, and perform the set fan target RPM based on the supported
  version.
- Update the used variable type to kernel types (i.e., u32).
- Link to v1: https://lore.kernel.org/r/20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org
---
 drivers/hwmon/cros_ec_hwmon.c | 130 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 125 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 9991c3fa020ac859cbbff29dfb669e53248df885..b118a355f67d7238a6f596cf01a49d5b621b31d6 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -21,6 +21,12 @@ struct cros_ec_hwmon_priv {
 	struct cros_ec_device *cros_ec;
 	const char *temp_sensor_names[EC_TEMP_SENSOR_ENTRIES + EC_TEMP_SENSOR_B_ENTRIES];
 	u8 usable_fans;
+	int set_fan_target_rpm_version;
+};
+
+union ec_params_pwm_set_fan_target_rpm {
+	struct ec_params_pwm_set_fan_target_rpm_v0 v0;
+	struct ec_params_pwm_set_fan_target_rpm_v1 v1;
 };
 
 static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
@@ -36,6 +42,25 @@ static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index
 	return 0;
 }
 
+static int cros_ec_hwmon_read_fan_target(struct cros_ec_device *cros_ec,
+					 u8 index, u32 *speed)
+{
+	struct ec_response_pwm_get_fan_rpm r;
+	int ret;
+
+	// Currently only supports reading the first fan.
+	if (index > 0)
+		return -EOPNOTSUPP;
+
+	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_PWM_GET_FAN_TARGET_RPM, NULL, 0,
+			  &r, sizeof(r));
+	if (ret < 0)
+		return ret;
+
+	*speed = r.rpm;
+	return 0;
+}
+
 static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
 {
 	unsigned int offset;
@@ -52,6 +77,49 @@ static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8
 	return 0;
 }
 
+static int cros_ec_hwmon_set_fan_rpm(struct cros_ec_device *cros_ec,
+				     int version, u8 index, u16 val)
+{
+	union ec_params_pwm_set_fan_target_rpm req;
+	int req_size;
+	int ret;
+
+	if (version == 0) {
+		if (index != 0)
+			dev_warn(
+				cros_ec->dev,
+				"v0 only supports setting all fan to same RPM (cannot just set idx %d), set all to %d\n",
+				index, val);
+
+		req_size = sizeof(req.v0);
+		req.v0.rpm = val;
+	} else if (version == 1) {
+		req_size = sizeof(req.v1);
+		req.v1.rpm = val;
+		req.v1.fan_idx = index;
+	} else
+		return -EOPNOTSUPP;
+
+	ret = cros_ec_cmd(cros_ec, version, EC_CMD_PWM_SET_FAN_TARGET_RPM, &req,
+			  req_size, NULL, 0);
+	if (ret < 0)
+		return ret;
+	return 0;
+}
+
+static int cros_ec_hwmon_write_fan(struct cros_ec_hwmon_priv *priv, u32 attr,
+				   int channel, long rpm)
+{
+	switch (attr) {
+	case hwmon_fan_target:
+		return cros_ec_hwmon_set_fan_rpm(
+			priv->cros_ec, priv->set_fan_target_rpm_version,
+			channel, rpm);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static bool cros_ec_hwmon_is_error_fan(u16 speed)
 {
 	return speed == EC_FAN_SPEED_NOT_PRESENT || speed == EC_FAN_SPEED_STALLED;
@@ -75,6 +143,7 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
 	int ret = -EOPNOTSUPP;
+	u32 target_rpm;
 	u16 speed;
 	u8 temp;
 
@@ -91,6 +160,11 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			ret = cros_ec_hwmon_read_fan_speed(priv->cros_ec, channel, &speed);
 			if (ret == 0)
 				*val = cros_ec_hwmon_is_error_fan(speed);
+		} else if (attr == hwmon_fan_target) {
+			ret = cros_ec_hwmon_read_fan_target(
+				priv->cros_ec, channel, &target_rpm);
+			if (ret == 0)
+				*val = target_rpm;
 		}
 	} else if (type == hwmon_temp) {
 		if (attr == hwmon_temp_input) {
@@ -130,8 +204,15 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 	const struct cros_ec_hwmon_priv *priv = data;
 
 	if (type == hwmon_fan) {
-		if (priv->usable_fans & BIT(channel))
+		if (!(priv->usable_fans & BIT(channel)))
+			return 0;
+
+		switch (attr) {
+		case hwmon_fan_target:
+			return 0644;
+		default:
 			return 0444;
+		}
 	} else if (type == hwmon_temp) {
 		if (priv->temp_sensor_names[channel])
 			return 0444;
@@ -140,13 +221,26 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 	return 0;
 }
 
+static int cros_ec_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long val)
+{
+	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_fan:
+		return cros_ec_hwmon_write_fan(priv, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(fan,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT,
-			   HWMON_F_INPUT | HWMON_F_FAULT),
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_TARGET),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_LABEL,
@@ -178,6 +272,7 @@ static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 static const struct hwmon_ops cros_ec_hwmon_ops = {
 	.read = cros_ec_hwmon_read,
 	.read_string = cros_ec_hwmon_read_string,
+	.write = cros_ec_hwmon_write,
 	.is_visible = cros_ec_hwmon_is_visible,
 };
 
@@ -233,6 +328,27 @@ static void cros_ec_hwmon_probe_fans(struct cros_ec_hwmon_priv *priv)
 	}
 }
 
+static int cros_ec_hwmon_probe_fan_target_cmd_version(struct cros_ec_hwmon_priv *priv)
+{
+	struct ec_params_get_cmd_versions_v1 params = {
+		.cmd = EC_CMD_PWM_SET_FAN_TARGET_RPM,
+	};
+	struct ec_response_get_cmd_versions response;
+	int ret;
+
+	ret = cros_ec_cmd(priv->cros_ec, 1, EC_CMD_GET_CMD_VERSIONS, &params,
+			  sizeof(params), &response, sizeof(response));
+	if (ret < 0) {
+		dev_err(priv->cros_ec->dev,
+			"error getting target fan RPM set command version: %d\n", ret);
+		return ret;
+	}
+
+	priv->set_fan_target_rpm_version = (response.version_mask & EC_VER_MASK(1)) ? 1 : 0;
+
+	return 0;
+}
+
 static int cros_ec_hwmon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -260,6 +376,10 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
 	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
 	cros_ec_hwmon_probe_fans(priv);
 
+	ret = cros_ec_hwmon_probe_fan_target_cmd_version(priv);
+	if (ret < 0)
+		return ret;
+
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
 							 &cros_ec_hwmon_chip_info, NULL);
 

---
base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
change-id: 20250313-extend_ec_hwmon_fan-a5f59aab2cb3

Best regards,
-- 
Sung-Chi Li <lschyi@chromium.org>

