Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060A016F265
	for <chrome-platform@lists.linux.dev>; Mon, 11 Nov 2024 09:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318670; cv=none; b=JDrp1S+V3fv3FTDx1Rf5iXjiRu7wS62GQTg46nD74HyXqtJruG4x1LFG47M7JQ0FiFZ+NzYENBVcovfNKaFu/We24xApe9WiVD2YlTvnXRP696l6iuuWqjLMNmfvoa0wkKdddUuhOPu7CvRmkhYjykog6kJe0o0yqmSDU1xul3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318670; c=relaxed/simple;
	bh=sp4pn0wWQK7ChYYcdXe+OIJh/ROCFwgRZjc3zKjTGZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZheld0cepgnb/vV2nCATnr0Lmhv+LVA02YuArqzKPylKbQMKzmst0UFWvu+2HB0NqZ0EcECt6ShJs68fCZPqJfH91snJu/UwnKiKOBzTUlkC0Nw43Zcxle16+AYHwhaPBkD5WDW701lbUb22v3s8PYoQslUZnejOItqmZw1Mck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dVVQYnn6; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dVVQYnn6"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso3206056b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 11 Nov 2024 01:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731318668; x=1731923468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsBmZ6wvsxhHYMiMEORqbpmYgtlxpguU0B8wVsIYt9U=;
        b=dVVQYnn6TzMLEEMoQdj2lrFNOtSYlgLWmONxtH9KFCYAPyZwZaCi2PQ+D1KXNEqLrj
         pNwdCAuzT9WHjWWBSCqlMAwmCyG5RfoP75/QJj5g0FeKpk6l778veU3n9XjvaW+gCLF6
         QrfOTFusGoI4bcOAv+Q6hb/tY2aW2h/uo32Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318668; x=1731923468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsBmZ6wvsxhHYMiMEORqbpmYgtlxpguU0B8wVsIYt9U=;
        b=b1yqfOwa070dmB/5zUlzyTa07tCNQ2H58qX+WkhBOyDByQBgYQt8GPVa+imNBm6MB5
         pMqe4+uf+TWPg1Bht5VwSLmmvvr4bqeFnYRn76v57yW7c4z2DhYjMxoIEkR+MibS6rbh
         CF+B/CaIfVkbORNPT0zZl1PYZshug8hvtTCED1zeV1QUjiw9kAVtwjxflQZNdvb59W1/
         efM2HQemGrbQahLpIrPHfK0jnfEGTey6biEUrg5jRK1xpaUxb9PEuhbVD625PI+d62pJ
         neewh0gKVFNcNjI7mPveFRhBXLtnOCoUCZUC2I+wLGYrpc23IxLwOw+4x4HJf6nrBlcy
         Y9kA==
X-Forwarded-Encrypted: i=1; AJvYcCXhsI7KnKnE2w4dzUEYloR2qye3frXSkcG/90pNuw7ACllge5aOTRCZv41P7ZYFeefxWv2/LApeGbucmVgZtds=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZoNKHAWTMNwA25v/m+bAJYcQCjJ/lKIixHVmtjoMtw6FS3GLE
	mFBjyYjxMci2AfG4puc1o7awzykIe0vFOXVGmQMeI4rpymb6s6ovdg5t+eXSPA==
X-Google-Smtp-Source: AGHT+IF4cIHOSz9YUbrlkgDalw7i2qTBSh2GpPn9ItPJYV3QmoVJ3liH1W72fcX2j9qhdsgx/XaTeQ==
X-Received: by 2002:a05:6a21:6d9e:b0:1d7:1288:8338 with SMTP id adf61e73a8af0-1dc23321c12mr18771135637.8.1731318668153;
        Mon, 11 Nov 2024 01:51:08 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:ec9f:d26:733c:7acf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5b48c6sm8075164a12.18.2024.11.11.01.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:51:07 -0800 (PST)
From: Sung-Chi <lschyi@chromium.org>
To: 
Cc: "Sung-Chi, Li" <lschyi@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v2] hwmon: (cros_ec) register thermal sensors to thermal framework
Date: Mon, 11 Nov 2024 17:50:30 +0800
Message-ID: <20241111095045.1218986-1-lschyi@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241111074904.1059268-1-lschyi@chromium.org>
References: <20241111074904.1059268-1-lschyi@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Sung-Chi, Li" <lschyi@chromium.org>

cros_ec hwmon driver probes available thermal sensors when probing the
driver.  Register these thermal sensors to the thermal framework, such
that thermal framework can adopt these sensors as well.

To make cros_ec registrable to thermal framework, the cros_ec dts need
the corresponding changes:

&cros_ec {
	#thermal-sensor-cells = <1>;
};

Change-Id: I29b638427c715cb44391496881fc61ad53abccaf
Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>
---
 Changes in v2:
   - Rename `cros_ec_sensor_data` to `cros_ec_hwmon_thermal_zone_data`.
   - Rename `addr` in struct `cros_ec_hwmon_thermal_zone_data` to `idx`.
   - Use `cros_ec_hwmon_temp_to_millicelsius` to do value conversion in 
     `cros_ec_thermal_get_temp` function.
   - Rename `cros_ec_thermal_get_temp` to `cros_ec_hwmon_thermal_get_temp` to
     make `cros_ec_hwmon` a prefix.
   - Use `%pe` in `cros_ec_hwmon_probe_temp_sensors` when printing out
     `data->tz_dev` if failed register thermal device.
   - Remove `cros_ec_hwmon_remove`, and the `.remove` value in
     `cros_ec_hwmon_driver` since there is no need to call
     `devm_thermal_of_zone_unregister` for clean up.
   - Revert function signature of `cros_ec_hwmon_probe_temp_sensors` since all
     needed parameters are presented.
   - Revert include of `linux/list.h` because no list data structure is used.
---
 drivers/hwmon/cros_ec_hwmon.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 5514cf780b8b..81e563e0455f 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
+#include <linux/thermal.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -23,6 +24,12 @@ struct cros_ec_hwmon_priv {
 	u8 usable_fans;
 };
 
+struct cros_ec_hwmon_thermal_zone_data {
+	struct cros_ec_device *cros_ec;
+	struct thermal_zone_device *tz_dev;
+	int idx;
+};
+
 static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
 {
 	int ret;
@@ -185,11 +192,30 @@ static const struct hwmon_chip_info cros_ec_hwmon_chip_info = {
 	.info = cros_ec_hwmon_info,
 };
 
+static int cros_ec_hwmon_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct cros_ec_hwmon_thermal_zone_data *data =
+		thermal_zone_device_priv(tz);
+	int ret;
+	u8 val;
+
+	ret = cros_ec_hwmon_read_temp(data->cros_ec, data->idx, &val);
+	if (ret || cros_ec_hwmon_is_error_temp(temp))
+		return -ENODATA;
+	*temp = cros_ec_hwmon_temp_to_millicelsius(val);
+	return 0;
+}
+
+static const struct thermal_zone_device_ops thermal_ops = {
+	.get_temp = cros_ec_hwmon_thermal_get_temp,
+};
+
 static void cros_ec_hwmon_probe_temp_sensors(struct device *dev, struct cros_ec_hwmon_priv *priv,
 					     u8 thermal_version)
 {
 	struct ec_params_temp_sensor_get_info req = {};
 	struct ec_response_temp_sensor_get_info resp;
+	struct cros_ec_hwmon_thermal_zone_data *data;
 	size_t candidates, i, sensor_name_size;
 	int ret;
 	u8 temp;
@@ -216,6 +242,21 @@ static void cros_ec_hwmon_probe_temp_sensors(struct device *dev, struct cros_ec_
 		priv->temp_sensor_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
 							    (int)sensor_name_size,
 							    resp.sensor_name);
+
+		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+		if (!data)
+			continue;
+
+		data->idx = i;
+		data->cros_ec = priv->cros_ec;
+		data->tz_dev = devm_thermal_of_zone_register(
+			priv->cros_ec->dev, i, data, &thermal_ops);
+		if (IS_ERR_VALUE(data->tz_dev)) {
+			dev_err(dev,
+				"failed to register %zu thermal sensor, err = %pe",
+				i, data->tz_dev);
+			continue;
+		}
 	}
 }
 
-- 
2.47.0.277.g8800431eea-goog

