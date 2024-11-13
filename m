Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E91913D53F
	for <chrome-platform@lists.linux.dev>; Wed, 13 Nov 2024 02:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731465629; cv=none; b=fiLvcMvqhunOgZhRsxxk3uDrFGQfFAQqIfooEqZ8CZ//aJps927YZTj6WbFjhFRC+Z9rQGKRMesHNeJpRqG9CiMZcKIqMmWWppdlW6lsHGc9mTumf+jbSeKDNBJkPoEuzNYPVz/Zrs1X6YWhuwSx5XUh24QkJHkNgoNbmiMa80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731465629; c=relaxed/simple;
	bh=T13dYZj5wf2Zd3XF41N7aemiKFJr6ayRHpqcY9xRpR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tffpi3N8stqxrbV0zKdn2pMDWFkUQdDU2ltFV3FTW4TzkW1Cuj1C5wN7H1wvwJpV0pdnx1lX5Wc4+Qs4AyKMZfP2BaYcy8bIn1V1sGlcUFtAZUUkMeugOmJTzvfcLq1Mhz664yTGilKYf783H1CYL0E/+9pG5BPaC886XEwc5ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YVt4KH5U; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YVt4KH5U"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-210e5369b7dso66251925ad.3
        for <chrome-platform@lists.linux.dev>; Tue, 12 Nov 2024 18:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731465627; x=1732070427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUswgydF4ecDD8gA1hGl988rFxQMVbM/Q/QpWYHHIvg=;
        b=YVt4KH5U2TCU2g+w3TlOg4x2eYXdIuMOkdnefXaX9j1eHu/OFVDGF2Gol0dqK8aSmi
         xPb7hpy5FvdiLYTwf4KMlftKYD7RxQkYx+oUljPzLdM2gfQS5VqG9bG/d1B+zUen8iKM
         YtPCeQ9sKx22IVtoZNisArhDFAQHmwVeTQMGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731465627; x=1732070427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUswgydF4ecDD8gA1hGl988rFxQMVbM/Q/QpWYHHIvg=;
        b=jkq1SydDCvuONWQEjGwARgmhhg9Yu6HOztgeLoCOXboBhbIEDmtZVfDQsXTpZPNt16
         vo0FrpBxAVHDB3vhbs26dR6q/Ud1cN1zK6x+0cBVoqW4BH4NKlhjSYdMDcbJyTuyHaTN
         ozmgNXbglZKNZsqKkf06RkNFDqFu4EQ7vNh/XZJQN3v+Lc+dZEEdHfHXjucSWZT92VDG
         x3gGveC/LhlZFZ8vIpOdeNDQEKEcU0+Z/8IckQTWlt0W0ExHvVLq8HOLX/k8VhWoOZzs
         gsjYqYpZ/twpIENs/xlvfuq8n8zC7mzAIXORem+bYQBUqf5Dx/JOqeDND3jKJcEkmFHX
         zfgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3EXLi4ZV3GZW1hTRtvRQ0Q1A4zqChA77nA10jQpV0dXhjypavH2X66qn2tFNEMXLUlNcp0cLdQ7hBJTziiSE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCJvdUo59QuXGRDyk1xZZ7e8GoxOZaUz+80nA0dv5YZTDrZQLo
	0wn2QqL2BILSv+C/gMBFUmDfdARXw/7ZlOs2duDa7QeWys0+fZvQCZq8sqRWPg==
X-Google-Smtp-Source: AGHT+IGby99YKs2n1DW3eqEgTozJAq71CGujBYHsrQ+I43rpaTsytkJKH0YHFTNW8GkOp0t5qemLMg==
X-Received: by 2002:a17:902:d505:b0:20b:8e18:a396 with SMTP id d9443c01a7336-21183c7e137mr245463495ad.9.1731465627355;
        Tue, 12 Nov 2024 18:40:27 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:3dd4:86fa:9696:4236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e418d6sm101831325ad.142.2024.11.12.18.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 18:40:26 -0800 (PST)
From: "Sung-Chi, Li" <lschyi@chromium.org>
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
Subject: [PATCH v3 1/2] hwmon: (cros_ec) register thermal sensors to thermal framework
Date: Wed, 13 Nov 2024 10:39:51 +0800
Message-ID: <20241113024000.3327161-1-lschyi@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241111074904.1059268-1-lschyi@chromium.org>
References: <20241111074904.1059268-1-lschyi@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec hwmon driver probes available thermal sensors when probing the
driver.  Register these thermal sensors to the thermal framework as well
via setting HWMON_C_REGISTER_TZ as a chip info, such that thermal
framework can adopt these sensors as well.

To make cros_ec registrable to thermal framework, the cros_ec dts need
the corresponding changes:

&cros_ec {
	#thermal-sensor-cells = <1>;
};

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
 Changes in v3:
   - Revert all changes and just as add HWMON_C_REGISTER_TZ as a chip info.
   - Remove unneeded Change-Id tag in commit message.
---
 drivers/hwmon/cros_ec_hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 5514cf780b8b..9991c3fa020a 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -141,6 +141,7 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
 }
 
 static const struct hwmon_channel_info * const cros_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(fan,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
 			   HWMON_F_INPUT | HWMON_F_FAULT,
-- 
2.47.0.338.g60cca15819-goog

