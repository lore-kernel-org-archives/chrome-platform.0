Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438B01F4196
	for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 04:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741841291; cv=none; b=IhkfHIAIivsg0AHwOx0g1fX3fy8fKNkNqcJbSSUvt1EzxwOhJspmmWRQrtfDQ4h+YF6nyksgWCYmPIjIdg6rdpujr1ow0qylv/YsZct9Emqs5PS7j5On0CPIoqp1gynKgfhm+ylIV+I64UDt68UgFL6yoZ6Is2QJ061TmNNnyCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741841291; c=relaxed/simple;
	bh=dDVtZ1x2j0ImBV1/fGLenYXfzl2AU5H3a103lpK7oR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSN5BgELAD9RuRxeW69+lftTn5QfrzDfQT61k45c/NCB/fxZMv3AGggsFNkr8/u6nBDezI3hH8nOsfQ9GA0uTkXTi17X6aBXm/iBNUttG3BWmxRyBrrgxBu10VO3JRHwQtpVSVYkW8/QOtLOsu/p+JlWiNZVOlIjYarcHX65jxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fXWiHkSF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fXWiHkSF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223959039f4so9992805ad.3
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 21:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741841288; x=1742446088; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBcgfIiObIi/3SSKsTLER8rj7ajdp492rQC6TZ4MQVE=;
        b=fXWiHkSFZoKY5NbHhquVyyQj79NgYsnVX/OJ6e3KQeNoHpU5awNREJ5Haw/S/wmNzb
         +JX5BAhdxty/WkHs6ZKJ2NXd7x713SDeBzPua4UivM2lG6GhzvgWoJsGXOjXlVbb6fH/
         MAnsDhOL9cOh0VgRYur2Lo3jE3NbvzylBMVpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741841288; x=1742446088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBcgfIiObIi/3SSKsTLER8rj7ajdp492rQC6TZ4MQVE=;
        b=EMdjlcRIHYmgU1x8cj5NpN75tNafum8fQn9l7vvsIwOWlEikbB376TMvQVSnyiDXP/
         cMmrJXpjhyWLZADHKsxDYnN/lio8P6nPiKuHz2AofPVn77bIjIqcGhpztzeagrEDbnMj
         1gNb8u6Gyl78dH1PUQa+cDT6M75LTydAJiX91xPRLka2/aRhoQrUqNx9gucXA1tvUic6
         Jcee14yzvLMW7R09vXZgYAT3xuhVlSEoKa4ud+cPIRUlzJ5SgyEx5uReNwhyTDCTG02n
         X0E+6nLfCepQyp1zbA5Q5+mfC5Yato5KAB9ywMQsCdNqn2030bOesZCTuVoDWLbtzhj/
         uuxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9XIneg2GfQVAVdgtLaw03PipShEMt4T/88DHUqy6YwgZ+CQw1eQBN1QAiU74LhHV7X3NmqIAFLF+Tr4/eexg=@lists.linux.dev
X-Gm-Message-State: AOJu0YypM9r5mGcH90R9tmZMUGFhi9X8kVogTNH42gVcYX5Pcpqnq23e
	YuH+5MZH2JMFuOnSSGkrGoCXSt1WcHD/gKR4/jIN399zwOPRk97Tua+qetrJ+2GuHQXUszXCmjU
	=
X-Gm-Gg: ASbGncsw3eTlmraJXlSk1wUI3vVMJmEpytbh5zbN5br6gF4NzfrJhZxbq3BpwkB4NqR
	YILQny66JqSE8YDaDo6E7BVNt0unCz7XM+MrcCQ9itiTh+iIwjGB3H7wPIeO6VL02Ch0XKJjhvb
	OACruFSVxILPj098ztT7rnepjHyBM4eyv3XlIt2U3vk8a2KCFXJRVJSnnr0JZlNSchECAnRqevO
	u7P1PKgSSUzQhr49RnJErF9xy4M0OJCCLFGWEmCIVP8awzi1Q9oTDWVHZftFa1Yl87asbDFO3p9
	MZ0b2kE28cM/h5xZf3oAOA5LrKZmCZzT/3iZcIv1eC84KPV14iKCnKZL15jm70MfJPY=
X-Google-Smtp-Source: AGHT+IHjNI0QVNBBTnp6ns0zk5oW8aMW/Zec9BzzctcovsX2+GdTh5Zv6MRnDFtEeDkwVkOOEuAzEw==
X-Received: by 2002:a17:902:f68a:b0:216:7926:8d69 with SMTP id d9443c01a7336-22428bf1731mr279459745ad.47.1741841288493;
        Wed, 12 Mar 2025 21:48:08 -0700 (PDT)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:1872:6051:5c24:509e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5c03sm4188025ad.249.2025.03.12.21.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 21:48:08 -0700 (PDT)
From: Sung-Chi Li <lschyi@chromium.org>
Date: Thu, 13 Mar 2025 12:47:43 +0800
Subject: [PATCH 2/3] hwmon: (cros_ec) Add reading target fan RPM function
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-extend_ec_hwmon_fan-v1-2-5c566776f2c4@chromium.org>
References: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
In-Reply-To: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741841282; l=1858;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=dDVtZ1x2j0ImBV1/fGLenYXfzl2AU5H3a103lpK7oR4=;
 b=vI0vc/8QKwg48A1HNs3bjMn2lu1UuDOPqIwy47brYYT8UZZvUvyMYKy2fE4WmHPGyLitH8sYg
 nZ6T11fWnlHAxDo2E+ad70qQioiSOcDPfDayDlAvyq2sgniNxypPwEr
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

Implement the functionality of reading the target fan RPM setting from
ChromeOS embedded controller under framework.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
 drivers/hwmon/cros_ec_hwmon.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index b2fec0768301f116f49c57b8dbfb042b98a573e1..73bfcbbaf9531be6b753cfef8045fd5dab5b2ab3 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -36,6 +36,19 @@ static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index
 	return 0;
 }
 
+static int cros_ec_hwmon_read_fan_target(struct cros_ec_device *cros_ec, u8 index, int32_t *speed)
+{
+	int ret;
+	struct ec_response_pwm_get_fan_rpm r;
+
+	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_PWM_GET_FAN_TARGET_RPM, NULL, 0, &r, sizeof(r));
+	if (ret < 0)
+		return ret;
+
+	*speed = le32_to_cpu(r.rpm);
+	return 0;
+}
+
 static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
 {
 	unsigned int offset;
@@ -95,6 +108,7 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
 	int ret = -EOPNOTSUPP;
+	int32_t target_rpm;
 	u16 speed;
 	u8 temp;
 
@@ -111,6 +125,10 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			ret = cros_ec_hwmon_read_fan_speed(priv->cros_ec, channel, &speed);
 			if (ret == 0)
 				*val = cros_ec_hwmon_is_error_fan(speed);
+		} else if (attr == hwmon_fan_target) {
+			ret = cros_ec_hwmon_read_fan_target(priv->cros_ec, channel, &target_rpm);
+			if (ret == 0)
+				*val = target_rpm;
 		}
 	} else if (type == hwmon_temp) {
 		if (attr == hwmon_temp_input) {

-- 
2.49.0.rc0.332.g42c0ae87b1-goog

