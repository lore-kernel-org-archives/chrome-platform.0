Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD41F4169
	for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 04:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741841288; cv=none; b=oF8DjIdojkrA4wGDcF5V4MbGHQBkhhYVShah4flw+GdW+x2RjPvMD1ORRXAToblhEorZ4OapnMki+E2CSR032wT8E5M9Aogk0MBZFbTrHyF49EPyshlnhZxCy8NQMWTffBpjn6Zk8eY75XU3jfh3BFy9hJBaMf3O8XNtdGKOcfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741841288; c=relaxed/simple;
	bh=WgOaRD1/gBWqutG9Z8BbW44fhl6Jh8r0vqcFCFsRRH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLM/3dyxnWNZ3tqgHBP1PXW/M2Q21x2wwlXpeJsRMF25PrDLETpDOgJALTzelRhbsmVvG7V+DXDqjLOXupM+C4KMoX6R59PGS+yfun1WFJMDIE0bVsF4n8vjoDtZhwqPbiKGRoc2I5iSah0q2RVHhSdB+I1xZwfByyWZUB5N7ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WgGG7Ntw; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WgGG7Ntw"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f42992f608so1098861a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 21:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741841286; x=1742446086; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkgK5jX+FCEI8nouFKdll/aGvpUK/LQlAxZ+HobmESs=;
        b=WgGG7Ntw5oSRcogvClU6yrTpuGoszqgXHVAAaffXp51QHM7mWhpBeDYCYgRQSy+R+l
         MkqPP9xxIdbXM3j31ca+PrUR5/M5ILcV6AQmYxpGV5wGFTOfEat0NSP210ZEcdG3dpm+
         UO/VkjqKH6mYUIDN2/f1VSfEAQ19BruU54ltM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741841286; x=1742446086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkgK5jX+FCEI8nouFKdll/aGvpUK/LQlAxZ+HobmESs=;
        b=uHl8DRG6foj095AZZc3RvR9euiEokHSCL0ZuJnDM9wNu7tiOfJ2coxlPrzRAHc2SU9
         1+CAUMJQNC/BxronMe/kPG01XHt+PEz7J7wFaZig/mZz9/bvtIep9bFhKeT2sSgGvdmj
         Fug9Lex22eJETVzmN1Tcr2NxH55BuZKj+9q5nCuR079DEU0FZz8oVaNeDTAQNqDZcazi
         lj0PK1IsIW+bv1O28EXICVubM0b8LdyNaim5TzvpN4NgZ49Fn0ANVnokcaDpRCTCuzlm
         kdkH1CxvZnXo1I6O0jfV6DVQoUcwetVQhJU+EDGcLGvAw3Xu6IE7ulyszuDpVk21DAIO
         f/cA==
X-Forwarded-Encrypted: i=1; AJvYcCXD3zTFrj21J00zZMb/ugTqCGs2JcJMsGpHVnuS5WalTluJVZyBKAZZeX42fDbqmhHtZqSm8E6NpcH57f/y4BE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxttI8UPqfz72AX8H6S3FUh4juZGQtO4aBQyyX36iM0hEFbXcrs
	Ih2me+ZT6QHtDBpi7jxS2Pac5U+oEhzGl2JWKlJA8EF0PjQTExxrcsW/zuDH0g==
X-Gm-Gg: ASbGncs7Mq1Ax3K1mFJVSHXm7KtnJoyaGYHR0U3sv26Bzrorp3LBTlOegYyKDZn89xJ
	smxnY6u0WXFg9vzerGroJyRkY8sT2/P5W40463TJuW4hHoZt7yPjgpNcUKqOAir7+frdr5OGKuJ
	ec8NWvFxSS8j84TqX7PkQWWeYutSr0BQr+IOpq7ohitDD5wW+jBedh+AVBO0wgvzTtRo5XDSKed
	ALpSB5RIfUUF5PlM9UCjUcjQ4gpcbfAA7p78U53JduXQTKyXnBBdO29rqydj0VbO4m63w1n0QSW
	jgNfiHb+09sp6XrrvcAvbm2egrA2aWmtuPp2qFG8p0tZwpm/FkM4fEJiMOcpg6sridI=
X-Google-Smtp-Source: AGHT+IEPWtvXkbZGs7O7/HumRDnQlpIfoYAFZcrr04/lKSaRzbzOgD2nzpzxAWXqpA6A8LJHsLZDTA==
X-Received: by 2002:a17:90b:3884:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-2ff7ce6d7ffmr35825012a91.10.1741841286433;
        Wed, 12 Mar 2025 21:48:06 -0700 (PDT)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:1872:6051:5c24:509e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5c03sm4188025ad.249.2025.03.12.21.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 21:48:06 -0700 (PDT)
From: Sung-Chi Li <lschyi@chromium.org>
Date: Thu, 13 Mar 2025 12:47:42 +0800
Subject: [PATCH 1/3] hwmon: (cros_ec) Add setting target fan RPM function
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-extend_ec_hwmon_fan-v1-1-5c566776f2c4@chromium.org>
References: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
In-Reply-To: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741841282; l=2304;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=WgOaRD1/gBWqutG9Z8BbW44fhl6Jh8r0vqcFCFsRRH4=;
 b=YYMOG4nN0QlC1W81qjF0ONgWNPNT9Xzvf6BHYEGPaJQUnSOwDM6fb6gAJ00Myf30pvq2ikkCa
 ackrFedOqFOAay02Dxg0OYzR57cAdXfXkpD6f40bhyf9h11LpOeevBO
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

Implement the functionality of setting the target fan RPM to ChromeOS
embedded controller under hwmon framework.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
 drivers/hwmon/cros_ec_hwmon.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 9991c3fa020ac859cbbff29dfb669e53248df885..b2fec0768301f116f49c57b8dbfb042b98a573e1 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -52,6 +52,26 @@ static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8
 	return 0;
 }
 
+static int cros_ec_hwmon_set_fan_rpm(struct cros_ec_device *cros_ec, u8 index, u16 val)
+{
+	struct ec_params_pwm_set_fan_target_rpm_v1 p_v1 = {
+		.rpm = val,
+		.fan_idx = index,
+	};
+
+	return cros_ec_cmd(cros_ec, 1, EC_CMD_PWM_SET_FAN_TARGET_RPM, &p_v1, sizeof(p_v1), NULL, 0);
+}
+
+static int cros_ec_hwmon_write_fan(struct cros_ec_device *cros_ec, u32 attr, int channel, long rpm)
+{
+	switch (attr) {
+	case hwmon_fan_target:
+		return cros_ec_hwmon_set_fan_rpm(cros_ec, channel, rpm);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static bool cros_ec_hwmon_is_error_fan(u16 speed)
 {
 	return speed == EC_FAN_SPEED_NOT_PRESENT || speed == EC_FAN_SPEED_STALLED;
@@ -140,6 +160,19 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 	return 0;
 }
 
+static int cros_ec_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long val)
+{
+	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_fan:
+		return cros_ec_hwmon_write_fan(priv->cros_ec, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(fan,
@@ -179,6 +212,7 @@ static const struct hwmon_ops cros_ec_hwmon_ops = {
 	.read = cros_ec_hwmon_read,
 	.read_string = cros_ec_hwmon_read_string,
 	.is_visible = cros_ec_hwmon_is_visible,
+	.write = cros_ec_hwmon_write,
 };
 
 static const struct hwmon_chip_info cros_ec_hwmon_chip_info = {

-- 
2.49.0.rc0.332.g42c0ae87b1-goog

