Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1B21DE3C4
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jan 2025 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738088046; cv=none; b=Kc9MvSLZh1kD7Yk8wwWn2aSAZHLHlpfSFlDUVg6xHQDUoT+asvdqsBVURz9H71vv9bqhxKr7fd509FOkrtIiO61XtHkvUgL5K43pmGuh8bYdV5dax3jZLEfj5g1KJo0iSpv9RaRz3IcUk/iDUQqC0luRiNJH+yLqNOTaAaAWJT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738088046; c=relaxed/simple;
	bh=bJua1lTKogt6HOFIyC4Abu64/vRnoie3gRCF/HWlmVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V8f1RqDl2Zr1ZDepOHPwpb6kLxvwxknGzySV3nooojRJpUZKr3hxumavNdMI4/Do46fkThoWDW7fYPSZne2vvkyvdW5Rk3VvrQoDbOOG8mNjyDYyzbTeGkGjMxczq/7bwaiGf0b6m4ZuIn+bUKPFb1v1cgRkqoIFqZDHUaXqN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=SAFX63od; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="SAFX63od"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2161eb94cceso72427205ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 28 Jan 2025 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1738088044; x=1738692844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ofzF8GmAKLhkWgwfaYSHoeIo2IFyEg1fZ4E2qlEwsdU=;
        b=SAFX63odCpPyqxmFa33fXQTCcuQc2mTANhNvwDUnpIp/1mcqFYIDMW4jmVQ5wYQk3d
         Ir/myYbOBbeJYRA6BEF6Ua97jAP4nyhkCBaen27S/2WEBBR5Ryw6HljPopRE+WrhOY2Z
         jHR2J8DaeHJ8cfJQ2UKQ001WMRpzTVZP1bQ3F1mbKilwwuBF4Csc0EtpEoJQLBsMYyRW
         VQYg/g9+xwFJdqAZ5lsFL/AElpZw9BHnEdRp8wwq+yiU56aLXeOuuTZW/pc4naMFp/5w
         DgZpjINKFQqAFdy7ADYUobKwHI4kV/ng8/HVafTTzlcoYQ+cCO5iDX6FGRMSX1EWU/yi
         rXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738088044; x=1738692844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofzF8GmAKLhkWgwfaYSHoeIo2IFyEg1fZ4E2qlEwsdU=;
        b=MA9O0513IXqfcUwaejrhO5FNeILj8cq5nlLhfMT9EmcfFYNPLSOIZBq1beW2ampw9m
         pNnJC667V4VkQsVE1vGM27drcjfI5mRdf91gNayHhQOjbuLovYV152BJ0rc0gu6AO01E
         2tXxBFxC9GHpagYYzvH259Wfu17i/ytXzvw80g9f/xBuu3kgonZqzMAXCJGgF1xZe0DV
         lX7HojL4fTab8XMzXaoYC5roBVOzd1E8Tw+HT4gNHXIswu+igkWFOD0G49NyihNufHCW
         OumNaZzEPXdhC/PdQNXcQVAJUkRZtA/9kWHIAt71AqR08r7Zyk9QoQ1LbeeX6kgwf7aS
         Rkww==
X-Gm-Message-State: AOJu0YwTh4BYCLSx8u78lETpq+5OiXxryyP9b5HibbSDRU/JJDL0hDkv
	t8mqeXv8q+n5P8lglNjVEdzqs9eW1WjoFuxn+hzD4cFPWsGy/aYk5XbG6gcFIwUGJlZ+uiiOAQN
	+
X-Gm-Gg: ASbGnctkEVXx2FYS/a9rZ5inZC6sU8FwEyf61S83JqDnnjKOjM6ZK/stU29bWU9UH9a
	hRD+mRSPAxpAmQq3L8kvBmOcjNoiQYaRbV4IKalcLp7zslTSootQVqjjmvJ8UgMfZzrK97CM9sF
	hdATcDQgrIEXxlp7Xa84hEoNImjXJscW3k7yH3rMM+SazaO+Wljypor/e4UEg4fVj7GeL/7DiLA
	WrQ2872KQXcS0ovrvgGe+eQ6ntD1lkxLMUBUQ2Ln4apWMy0WAJHEG2/2cSvhMQMc3PkiD2NoG16
	AfwsaES3I4UdVbFVSQ3/TnQWoEPLQbqs8xUhL+ORxyF6WbwrKIovhpgdXxpIFBY=
X-Google-Smtp-Source: AGHT+IFYhwROZ86sL7BqJOQ2cPJ216hh8fcKoJEhe9cwgoViZOVztkJ2DuZVfee+jnquhkYERmp2zw==
X-Received: by 2002:a17:902:ecc6:b0:216:31aa:12eb with SMTP id d9443c01a7336-21dd7d82ff8mr624905ad.31.1738088044206;
        Tue, 28 Jan 2025 10:14:04 -0800 (PST)
Received: from marigold-dvt1-sku2.home (36-227-202-185.dynamic-ip.hinet.net. [36.227.202.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414edbesm85062315ad.201.2025.01.28.10.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 10:14:03 -0800 (PST)
From: Daniel Schaefer <dhs@frame.work>
To: chrome-platform@lists.linux.dev
Cc: Daniel Schaefer <dhs@frame.work>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux@frame.work,
	"Dustin L . Howett" <dustin@howett.net>
Subject: [PATCH v2] platform/chrome: cros_ec_lpc: Match on Framework ACPI device
Date: Wed, 29 Jan 2025 02:13:29 +0800
Message-ID: <20250128181329.8070-1-dhs@frame.work>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Load the cros_ec_lpc driver based on a Framework FRMWC006 ACPI device,
which mirrors GOOG0004, but also applies npcx quirks for Framework
systems.

Matching on ACPI will let us avoid having to change the SMBIOS match
rules again and again.

Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux@frame.work
Cc: Dustin L. Howett <dustin@howett.net>
Signed-off-by: Daniel Schaefer <dhs@frame.work>
---
V1->V2: Remove platform_set_drvdata, handle it by acpi_device_id table instead

I tested all new possible combinations and they all behave as expected.
If there is any match, /dev/cros_ec will be present, with the below
dmesg.
I did not test any device with GOOG0004.

| DMI match | FRMWC004 match | Notes
| False     | False          | 3rdparty
| True      | False          | Current framework
| False     | True           | Possible future framework
| True      | True           | Future framework

```
> sudo dmesg | grep cros_ec_lpcs
[   17.521972] cros_ec_lpcs FRMWC004:00: loaded with quirks 00000001
[   17.534012] cros_ec_lpcs FRMWC004:00: Chrome EC device registered
```

```
[   74.366596] cros_ec_lpcs cros_ec_lpcs.0: loaded with quirks 00000001
[   74.377921] cros_ec_lpcs cros_ec_lpcs.0: Chrome EC device registered
```
---
 drivers/platform/chrome/cros_ec_lpc.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 5a2f1d98b350..ea569037b6b2 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -30,6 +30,7 @@
 
 #define DRV_NAME "cros_ec_lpcs"
 #define ACPI_DRV_NAME "GOOG0004"
+#define FRMW_ACPI_DRV_NAME "FRMWC004"
 
 /* True if ACPI device is present */
 static bool cros_ec_lpc_acpi_device_found;
@@ -514,7 +515,7 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	acpi_status status;
 	struct cros_ec_device *ec_dev;
 	struct cros_ec_lpc *ec_lpc;
-	struct lpc_driver_data *driver_data;
+	const struct lpc_driver_data *driver_data;
 	u8 buf[2] = {};
 	int irq, ret;
 	u32 quirks;
@@ -526,6 +527,9 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	ec_lpc->mmio_memory_base = EC_LPC_ADDR_MEMMAP;
 
 	driver_data = platform_get_drvdata(pdev);
+	if (!driver_data) {
+		driver_data = acpi_device_get_match_data(dev);
+	}
 	if (driver_data) {
 		quirks = driver_data->quirks;
 
@@ -696,12 +700,6 @@ static void cros_ec_lpc_remove(struct platform_device *pdev)
 	cros_ec_unregister(ec_dev);
 }
 
-static const struct acpi_device_id cros_ec_lpc_acpi_device_ids[] = {
-	{ ACPI_DRV_NAME, 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, cros_ec_lpc_acpi_device_ids);
-
 static const struct lpc_driver_data framework_laptop_npcx_lpc_driver_data __initconst = {
 	.quirks = CROS_EC_LPC_QUIRK_REMAP_MEMORY,
 	.quirk_mmio_memory_base = 0xE00,
@@ -713,6 +711,13 @@ static const struct lpc_driver_data framework_laptop_mec_lpc_driver_data __initc
 	.quirk_aml_mutex_name = "ECMT",
 };
 
+static const struct acpi_device_id cros_ec_lpc_acpi_device_ids[] = {
+	{ ACPI_DRV_NAME, 0 },
+	{ FRMW_ACPI_DRV_NAME, (kernel_ulong_t)&framework_laptop_npcx_lpc_driver_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, cros_ec_lpc_acpi_device_ids);
+
 static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 	{
 		/*
@@ -866,7 +871,8 @@ static int __init cros_ec_lpc_init(void)
 	int ret;
 	const struct dmi_system_id *dmi_match;
 
-	cros_ec_lpc_acpi_device_found = !!cros_ec_lpc_get_device(ACPI_DRV_NAME);
+	cros_ec_lpc_acpi_device_found = !!cros_ec_lpc_get_device(ACPI_DRV_NAME) ||
+		!!cros_ec_lpc_get_device(FRMW_ACPI_DRV_NAME);
 
 	dmi_match = dmi_first_match(cros_ec_lpc_dmi_table);
 
-- 
2.45.2

