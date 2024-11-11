Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE49155741
	for <chrome-platform@lists.linux.dev>; Mon, 11 Nov 2024 07:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731311355; cv=none; b=eyQUH/Pb2f6itUhOzro+ZUVcIqxk+lqphLOffXUmHDSW8XQAAAiurqNeyvJ9uNqcITta4++gzQ2tZ2ziycMxIzH8yyIcLau5+1kPUWtG4+1jTNydxRmk3JU/6nqCaEd6mJ5ercCUCdU81gbC+3Kx6W5S/TmBNp9P6kEcmCXCiMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731311355; c=relaxed/simple;
	bh=etMiFoLcFbrpaYdopWrkyBeX6ozFccYqN9z+oML7f5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o6sUhm0Gree2KFHnMIp5/DQVWYAXz0vwRGgA0J7b/mhlBWxUqq9aOwUijED737JMeG4aCjGLZ/x3oVld1h0QGOBlQKx84CKg1A7lv1D5TZT8EtrPCsup+Y6WNd3bBpndVftaeC240xxQ81m/Toq1XeQMr7fmYDOf/hYSyQSELzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fUA3sbk0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fUA3sbk0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20ca388d242so42378185ad.2
        for <chrome-platform@lists.linux.dev>; Sun, 10 Nov 2024 23:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731311353; x=1731916153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eeqA7VwHd9c3PHpzUCjwptskZweLTdWLnJIKUggNH2Y=;
        b=fUA3sbk0/9xkQm6ssXTN5e4G8lcwoMS3g+0hgNeeuaUN9S7Icq5tcu6fSXcwUQgEf2
         ZGkLRAHdBBI8ox1C1elvS6lEFyrTXlCwWXPg0xfQCsct3K+uvkeg4uiXN7NCBtaHl2F+
         2majTPjENGDm2KMsYOX3GMcKzJ/bzNxaYFkJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731311353; x=1731916153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeqA7VwHd9c3PHpzUCjwptskZweLTdWLnJIKUggNH2Y=;
        b=WWBi4pW1IYJPFi7kxBVcg9WmUyVuBAZ7CcQSqfMUVc8KADfdtt1g80kEPfUTE73Za/
         CalkU6mUyolcm6MHPq2fiyEykAugxOY5C8SQspKBKkGc74a6uF8pwcSCYYZFsiHpCClx
         7Lj9fN0jjxA+8TtVN+xIFXDsd+uWe5honnGT2T43jVde9pK1032KrrhEzCyFT6X4Ccjx
         WrroKVaTlUpqnFsX3c7P5MxL3vUHmIHn49qQmKJ02svau5XlSlDSCkAIg0ayuYzhSu0t
         PkVgHegTIfie/DnainNgAmCf4e54JNCLHfAalnR8c1XvlEjq7yPvj79wsxIBnkYMQgkL
         WM9g==
X-Forwarded-Encrypted: i=1; AJvYcCWAozQgJws7yCgHdAV/oa+s6bO39SJ490EBFs9lb+6txRCKaB7KGBaCctNz6upyRSm9Pjh/rGOnJB8vmipGbKk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBEGJMACUjoXtsji2zMJwZBrjQH0lqbhitDHj/d/zLqqFxo4PW
	WJXZhR2AHejetpIPSCVQ4Rh0ZaViAMEYNTz1DqyPVP1zD2ata+rNGKTvLcRZGg==
X-Google-Smtp-Source: AGHT+IGbCToyCqKsFDBtRgavOqMHz4+HAXmG9aANOtnu1gecTZ79JuCuv2Hd5VlGa/h4GfVvLDFmfg==
X-Received: by 2002:a17:902:d508:b0:20c:8cf9:6133 with SMTP id d9443c01a7336-21183d0b82cmr170236655ad.8.1731311353556;
        Sun, 10 Nov 2024 23:49:13 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:ec9f:d26:733c:7acf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddf0f5sm70433575ad.79.2024.11.10.23.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 23:49:13 -0800 (PST)
From: "Sung-Chi, Li" <lschyi@chromium.org>
To: thomas@weissschuh.net
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Sung-Chi, Li" <lschyi@chromium.org>
Subject: [PATCH] hwmon: (cros_ec) register thermal sensors to thermal framework
Date: Mon, 11 Nov 2024 15:49:04 +0800
Message-ID: <20241111074904.1059268-1-lschyi@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec hwmon driver probes available thermal sensors when probing the
driver.  Register these thermal sensors to the thermal framework, such
that thermal framework can adopt these sensors as well.

Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>
---
 drivers/hwmon/cros_ec_hwmon.c | 69 +++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 5514cf780b8b..4b1ea431e3d2 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -7,20 +7,31 @@
 
 #include <linux/device.h>
 #include <linux/hwmon.h>
+#include <linux/list.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
+#include <linux/thermal.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
-#define DRV_NAME	"cros-ec-hwmon"
+#define DRV_NAME		"cros-ec-hwmon"
+#define THERMAL_VAL_OFFSET	200
 
 struct cros_ec_hwmon_priv {
 	struct cros_ec_device *cros_ec;
 	const char *temp_sensor_names[EC_TEMP_SENSOR_ENTRIES + EC_TEMP_SENSOR_B_ENTRIES];
 	u8 usable_fans;
+	struct list_head sensors;
+};
+
+struct cros_ec_sensor_data {
+	struct cros_ec_device *cros_ec;
+	struct thermal_zone_device *tz_dev;
+	int addr;
+	struct list_head node;
 };
 
 static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
@@ -185,11 +196,32 @@ static const struct hwmon_chip_info cros_ec_hwmon_chip_info = {
 	.info = cros_ec_hwmon_info,
 };
 
-static void cros_ec_hwmon_probe_temp_sensors(struct device *dev, struct cros_ec_hwmon_priv *priv,
+static int cros_ec_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct cros_ec_sensor_data *data = thermal_zone_device_priv(tz);
+	int ret;
+	u8 val;
+
+	ret = cros_ec_hwmon_read_temp(data->cros_ec, data->addr, &val);
+	if (ret)
+		return -ENODATA;
+	*temp = (val + THERMAL_VAL_OFFSET - 273) * 1000;
+	return 0;
+}
+
+static const struct thermal_zone_device_ops thermal_ops = {
+	.get_temp = cros_ec_thermal_get_temp,
+};
+
+static void cros_ec_hwmon_probe_temp_sensors(struct cros_ec_device *cros_ec,
+					     struct device *dev,
+					     struct cros_ec_hwmon_priv *priv,
+					     struct list_head *head,
 					     u8 thermal_version)
 {
 	struct ec_params_temp_sensor_get_info req = {};
 	struct ec_response_temp_sensor_get_info resp;
+	struct cros_ec_sensor_data *data;
 	size_t candidates, i, sensor_name_size;
 	int ret;
 	u8 temp;
@@ -216,6 +248,23 @@ static void cros_ec_hwmon_probe_temp_sensors(struct device *dev, struct cros_ec_
 		priv->temp_sensor_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
 							    (int)sensor_name_size,
 							    resp.sensor_name);
+
+		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+		if (!data)
+			continue;
+
+		data->addr = i;
+		data->cros_ec = cros_ec;
+		data->tz_dev = devm_thermal_of_zone_register(
+			cros_ec->dev, i, data, &thermal_ops);
+		if (IS_ERR_VALUE(data->tz_dev)) {
+			dev_err(dev,
+				"failed to register %zu thermal sensor, err = %ld",
+				i, PTR_ERR(data->tz_dev));
+			continue;
+		}
+
+		list_add(&data->node, head);
 	}
 }
 
@@ -255,8 +304,10 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	priv->cros_ec = cros_ec;
+	INIT_LIST_HEAD(&priv->sensors);
 
-	cros_ec_hwmon_probe_temp_sensors(dev, priv, thermal_version);
+	cros_ec_hwmon_probe_temp_sensors(cros_ec, dev, priv, &priv->sensors,
+					 thermal_version);
 	cros_ec_hwmon_probe_fans(priv);
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
@@ -265,6 +316,17 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+static void cros_ec_hwmon_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct cros_ec_sensor_data *iter;
+
+	list_for_each_entry(iter, &priv->sensors, node) {
+		devm_thermal_of_zone_unregister(dev, iter->tz_dev);
+	}
+}
+
 static const struct platform_device_id cros_ec_hwmon_id[] = {
 	{ DRV_NAME, 0 },
 	{}
@@ -273,6 +335,7 @@ static const struct platform_device_id cros_ec_hwmon_id[] = {
 static struct platform_driver cros_ec_hwmon_driver = {
 	.driver.name	= DRV_NAME,
 	.probe		= cros_ec_hwmon_probe,
+	.remove		= cros_ec_hwmon_remove,
 	.id_table	= cros_ec_hwmon_id,
 };
 module_platform_driver(cros_ec_hwmon_driver);
-- 
2.47.0.277.g8800431eea-goog

