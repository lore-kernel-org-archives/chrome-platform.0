Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1342228F5
	for <chrome-platform@lists.linux.dev>; Fri, 24 Jan 2025 02:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737685893; cv=none; b=Nhkv/nTxX1xivRozcAUPEEaBC26rja9oulclKBSeTCSwXa1n8BHpaIftFHI57aP0ExkZbqd0YYtORQzyOQ4hvPncO7Wsptm66PAvz6lammJ9ajp7W7QZZqT94+DObLGjfdmN2GnsccRWNG6ddfzXDN+6K9MjeSA3bkicus/OtLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737685893; c=relaxed/simple;
	bh=veADSV+ymaHa8ZESATjmlHR7aEE3veKj52mkqpyNtiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RSyh+/G6Metbw2MD+x7YRAUlg3zj7NzCOubK9qE0RHve7guZckBGXHXNEHn1JujldsjTO0X1/8oFBpUiMkhig/MoVjlg3xiwoXoS0xnwL0kSoPJDaGQrhPrKK0SIHtsxktwpY68kIirJR7Mv6nCTki2EoRMeIu9SubwkpWiMS+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=djfxo4zI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="djfxo4zI"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21654fdd5daso27422495ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 23 Jan 2025 18:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1737685890; x=1738290690; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyt3Fph+zoh7dvyiugW4IF0P/J5Qj+PPXtCLMFmrzdE=;
        b=djfxo4zI5BKdC2lFl5bPNBvluif1CSBOON8GD0ueqMyvPrGtKS9pcOp62kZX18Ta4a
         6MNVCraiD2J2zqlhfneNPJ+LGY3SYFeOT9maYcQ3JMeaJSL86NxcPku/0KJsurlr86vW
         JnutZM+f9t9jyzoS5dHXcgeXzg+a7hT0r23x/G6hvI24E6KoRFnw2XUZ8XTADpk+7XVY
         m4qwlfDbpgJgXYSsL73GXw1avDJwE5BELdEU7utFgafO6xz16L1Byp90mdfSXcEhGl4n
         B52Yw1kVfRkvn9JDOKiGgDK7phIo8OVruJhuIZ5ZtiZmx+uU7r34PQfTVU2kRUne6xVs
         lLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737685890; x=1738290690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyt3Fph+zoh7dvyiugW4IF0P/J5Qj+PPXtCLMFmrzdE=;
        b=HmmMlh8jJsTejD7EUM+JWZKkRNHOn++uFq+DVBw8K7f6KygrjP7GlFjZ/pshsfvgZm
         oPsa6/gEdbb+Yg+hNk4VWio6Hng47BGUTYtXIyjfkiGxKbkUQimImJWyPpDSW66dWvHn
         7feQ4ZJQ5OLDCSlf6CrhwIyjSKaId7/YntKmfr8uQeYqrVOE0LfSrg0gNpt1cbVZPf2e
         PmfiKbe3dCxQvkfFTv9jM1df6cLbgE0kZvX8mvz3orZ2FLCf3RdN8H59PQfyGsY7m6L3
         kAzIkDrhQA3TGUkGAVFrbSb7BWD+H8zUxuJSKJKo8PTkGoK371D7DKmlhS0tmOaciBOI
         C3wQ==
X-Gm-Message-State: AOJu0YwKxDy+MxOM+gcE39SHnyX+8IztvnPnZO8et8ENIrnfU2/yM04f
	9i5TxK1S4QcniCBYdTojawPX6lWYD3a3ND+QZMxe7iAXfCgFAiS1rsWPjaMp44Qrre/5wqcJuF6
	a
X-Gm-Gg: ASbGncuDwj1UNlIO/pyYbnwhmHERuKTY/UdFrMa4sadVMXAtMDc6qSXgOkF+Au7MYPR
	zCSdJhi089dNsv8laWxYFK4hFm7K7cBhrnv8pckbB9pD3DwY2AgWvOKoI/yd0H+wrmNF821wgS0
	JgP2iTHZp0cVcv04u7aUNMaKVd74l/Yl0/xGY08n9ep/yP6og52zqjdNhCcEnZtli3zcNKpgala
	HzfvxzAOPBqeiaQcWDb6NRPG6r/U+AYu5bR4zh+LBO0wE4G+vO71KIg1B/Df0+MuYhR5vwYAjyS
	/o0kVuJARJjILHRs53+fCbs/Yf1F8a6A3VPGdB5huXETX+/3qQ==
X-Google-Smtp-Source: AGHT+IG5CHWn3n+3VQrNsNXiY5vhk0vxMSMJBwWm64V8TRKpYQuDY+uIhNhimCnWdmiqBMkpNvSFbg==
X-Received: by 2002:a17:902:d4c8:b0:216:725c:a11a with SMTP id d9443c01a7336-21c352c8145mr473563825ad.10.1737685890067;
        Thu, 23 Jan 2025 18:31:30 -0800 (PST)
Received: from localhost.localdomain (61-228-241-221.dynamic-ip.hinet.net. [61.228.241.221])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21da3ea2430sm6008415ad.65.2025.01.23.18.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 18:31:29 -0800 (PST)
From: Daniel Schaefer <dhs@frame.work>
To: chrome-platform@lists.linux.dev
Cc: Daniel Schaefer <dhs@frame.work>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux@frame.work,
	"Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH] chrome/cros_ec_lpc: Match on Framework ACPI device
Date: Fri, 24 Jan 2025 10:30:21 +0800
Message-ID: <20250124023021.9418-1-dhs@frame.work>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch loads the cros_ec_lpc driver based on a Framework FRMWC006
ACPI device, which mirrors GOOG0004, but also applies npcx quirks for
Framework systems.

Matching on ACPI will let us avoid having to change the SMBIOS match
rules again and again.

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

Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux@frame.work
Cc: Dustin L. Howett <dustin@howett.net>
Signed-off-by: Daniel Schaefer <dhs@frame.work>
---
 drivers/platform/chrome/cros_ec_lpc.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 5a2f1d98b350..ac951ab26ddf 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -30,9 +30,11 @@
 
 #define DRV_NAME "cros_ec_lpcs"
 #define ACPI_DRV_NAME "GOOG0004"
+#define FRMW_ACPI_DRV_NAME "FRMWC004"
 
 /* True if ACPI device is present */
 static bool cros_ec_lpc_acpi_device_found;
+static bool cros_ec_lpc_frmw_acpi_device_found;
 
 /*
  * Indicates that lpc_driver_data.quirk_mmio_memory_base should
@@ -507,6 +509,10 @@ static acpi_status cros_ec_lpc_resources(struct acpi_resource *res, void *data)
 	return AE_OK;
 }
 
+static struct platform_device cros_ec_lpc_device = {
+	.name = DRV_NAME
+};
+
 static int cros_ec_lpc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -526,6 +532,8 @@ static int cros_ec_lpc_probe(struct platform_device *pdev)
 	ec_lpc->mmio_memory_base = EC_LPC_ADDR_MEMMAP;
 
 	driver_data = platform_get_drvdata(pdev);
+	if (!driver_data)
+		driver_data = platform_get_drvdata(&cros_ec_lpc_device);
 	if (driver_data) {
 		quirks = driver_data->quirks;
 
@@ -698,6 +706,7 @@ static void cros_ec_lpc_remove(struct platform_device *pdev)
 
 static const struct acpi_device_id cros_ec_lpc_acpi_device_ids[] = {
 	{ ACPI_DRV_NAME, 0 },
+	{ FRMW_ACPI_DRV_NAME, 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cros_ec_lpc_acpi_device_ids);
@@ -857,20 +866,20 @@ static struct platform_driver cros_ec_lpc_driver = {
 	.remove = cros_ec_lpc_remove,
 };
 
-static struct platform_device cros_ec_lpc_device = {
-	.name = DRV_NAME
-};
-
 static int __init cros_ec_lpc_init(void)
 {
 	int ret;
 	const struct dmi_system_id *dmi_match;
 
 	cros_ec_lpc_acpi_device_found = !!cros_ec_lpc_get_device(ACPI_DRV_NAME);
+	cros_ec_lpc_frmw_acpi_device_found = !!cros_ec_lpc_get_device(FRMW_ACPI_DRV_NAME);
 
 	dmi_match = dmi_first_match(cros_ec_lpc_dmi_table);
 
-	if (!cros_ec_lpc_acpi_device_found && !dmi_match) {
+	if (cros_ec_lpc_frmw_acpi_device_found) {
+		platform_set_drvdata(&cros_ec_lpc_device,
+				(void *)&framework_laptop_npcx_lpc_driver_data);
+	} else if (!cros_ec_lpc_acpi_device_found && !dmi_match) {
 		pr_err(DRV_NAME ": unsupported system.\n");
 		return -ENODEV;
 	}
@@ -882,7 +891,7 @@ static int __init cros_ec_lpc_init(void)
 		return ret;
 	}
 
-	if (!cros_ec_lpc_acpi_device_found) {
+	if (!cros_ec_lpc_acpi_device_found && !cros_ec_lpc_frmw_acpi_device_found) {
 		/* Pass the DMI match's driver data down to the platform device */
 		platform_set_drvdata(&cros_ec_lpc_device, dmi_match->driver_data);
 
@@ -899,7 +908,7 @@ static int __init cros_ec_lpc_init(void)
 
 static void __exit cros_ec_lpc_exit(void)
 {
-	if (!cros_ec_lpc_acpi_device_found)
+	if (!cros_ec_lpc_acpi_device_found && !cros_ec_lpc_frmw_acpi_device_found)
 		platform_device_unregister(&cros_ec_lpc_device);
 	platform_driver_unregister(&cros_ec_lpc_driver);
 }
-- 
2.47.1

