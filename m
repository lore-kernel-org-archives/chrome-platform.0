Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC81C3D
	for <chrome-platform@lists.linux.dev>; Wed,  7 Aug 2024 02:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722999257; cv=none; b=OzBEaM6aHNErEwgL0SWixetZ0XCrcjBbygNlvKBLwwOaQO40gUrG/Wm7zv9UejAkKHy48C21cHdd7YkQiAW4go0et2lSgt0UIyZQ2Uh2dwmW7FsYx9V5Oj2fOe2EnoGsuQBmTzfUPpUoXDQ5IXpOSQh7Fog2by02bmKUK8Fo80k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722999257; c=relaxed/simple;
	bh=+Fyy7N4Y3q8zWAobAXHbB8/o5rNlEMF6NC5rzBxMxf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WdYbu6Fz4K0XP3iTrSvZCFxKB7AEY6Cp9k6+LsSq1HJLvRE+p/px4nyIZy7cyewm1CKWQd3BKfBDDueUTXcOX+8IOecPAawsquXBtxAKFY4ttb/wFbJfrTxte11YMWbzbIaoxuBnnX51/5vcWls1QEfUwtx9SHjjSv0EMLwe75s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b=c01D4hsL; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b="c01D4hsL"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a1d984ed52so66159785a.0
        for <chrome-platform@lists.linux.dev>; Tue, 06 Aug 2024 19:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett.net; s=google; t=1722999255; x=1723604055; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kOjErioseEgfWdhbxjOt3RI5+TU/AecLrizO2nWxLMU=;
        b=c01D4hsLfpsjz1hCp22IZDxVyRljjRbWMdqD9TLXggIqXu0keEMkHBAQwqEwcjagC8
         Tc9qsOmfk/65ZLJu8cNSi0Wccfb3C5/Ts7X3eoUIgdDSPREgIzWDpwFMLuJYFY3bM7kw
         KOivNSgr8QbO20ZJaJ7x0pgcG09ainBNcsgrUUnpKuA3lngQiRzYkVumDzEERgRtHLlr
         PEksionJDkfhRSH5yr0AlVK9nGkogzc9zduhtQwq6pvhaXcgCkKDGcWt+kK7V9RbRq8z
         hrBReWZc0CV9mVSpNYM5jBN9Uhmf7hpZMHzp7VbU+iHAX/hctnTJzsK4zZR8vfn9uQ6H
         Tb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722999255; x=1723604055;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOjErioseEgfWdhbxjOt3RI5+TU/AecLrizO2nWxLMU=;
        b=uNjiO6+Ltb5VlSz6edLnijMNDuYi51aNDUGYXLBn2i8Z9N9/gg9joP7cTZofFOhTh0
         wZCO0cvri009Jn0j6I5d+ps36+C5s+KxxakvUtZjBDHt5+XaNPBicP18KTWXnqhHbQFM
         /cutY6v/rumu5mBULd9lFEFxquhNJhrsMMRE4T0BAjwasdrIMzd5Jf8S/kLdFzIQ2L07
         96I/E/tYxw4rkkEfMM5LM5rZm70w3YUpy7LRDIaqU5/2PdvQ4i3CDF/31QZ7AvHAwwYE
         VDFjVxOoxtxR08mai2l1VkLAt+eXmzkX6klq408rGaZp4wq3TbDxXOKORPvVTiWZvkB4
         cdMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmjtwyWCiILmL7KD2ZNtrKSQ3unS7b2w6N5h6aeC19yDbDaxL1fnIPeURaBBLNLvsKw+88s8K5KAmnkItF6WGez/rBMuPyIHIA3NxOayCG
X-Gm-Message-State: AOJu0Yyz/tytu4HQTMu0WLBMlFGwMl+/Hbv4/X3gYqLf6dgLp+D8BxOS
	YGWQELCGw8XuZxXm0LhX7UBFWtpa9wqBZUZ3VEKY7B5bKkNPTC+sbd+9BFbQlA==
X-Google-Smtp-Source: AGHT+IFE/ss6aSSgFJBqO9IEKW7RTVLB23k5j0NUIQcBVuPB9q5iouav3oob7PHwTYpOXXk/fphv2g==
X-Received: by 2002:a05:620a:461e:b0:79f:a6c:f422 with SMTP id af79cd13be357-7a34ef0ed72mr1963139685a.24.1722999254822;
        Tue, 06 Aug 2024 19:54:14 -0700 (PDT)
Received: from [127.0.0.1] ([2600:1702:5e30:4f11::b37])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7a3785e5a0asm19467485a.45.2024.08.06.19.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 19:54:14 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
Date: Tue, 06 Aug 2024 21:54:09 -0500
Subject: [PATCH] platform/chrome: cros_ec_lpc: switch primary DMI data for
 Framework Laptop
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-platform-chrome-cros_ec_lpcs-change-the-default-disposition-of-the-framework-laptop-v1-1-09e0d602b215@howett.net>
X-B4-Tracking: v=1; b=H4sIANDhsmYC/y2O2wrCMBBEf6Xk2YU2Vqn+ikhZko0Npt2wGy9Q+
 u+G4uNhmDOzGiWJpObarEboHTXyUqE7NMZNuDwIoq9sbGv79nTsICcsgWUGNwnPBE5YR3Jjyk7
 hXykTgaeAr1TAR82ssVQvcNijIDjTh+UJCXPhDNb2F7RnNwwYTF3OQiF+91e3+7b9AEXk1hWlA
 AAA
To: Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 Alexandru Stan <ams@frame.work>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 chrome-platform@lists.linux.dev
Cc: Kieran Levin <ktl@frame.work>, "Dustin L. Howett" <dustin@howett.net>
X-Mailer: b4 0.13.0

Framework Computer appears to be moving away from the Microchip embedded
controller seen in the Framework Laptop 13 with Intel Core 11th, 12th
and 13th generation processors. All newer models use a Nuvoton NPCX
embedded controller.

Changing the default DMI match for Framework's products to match their
newer product lines will reduce churn in this part of the cros_ec_lpc
driver.

The new match tables are:

- Microchip EC models
  - "Laptop" (product, exact match) for the 11th gen. Intel Core
  - "12th Gen Intel Core" (product, exact match)
  - "13th Gen Intel Core" (product, exact match)
- Nuvoton NPCX models
  - "Laptop" (product family, partial match)

---
Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c | 36 ++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index f0470248b109..c784119ab5dc 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -631,12 +631,12 @@ static const struct acpi_device_id cros_ec_lpc_acpi_device_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, cros_ec_lpc_acpi_device_ids);
 
-static const struct lpc_driver_data framework_laptop_amd_lpc_driver_data __initconst = {
+static const struct lpc_driver_data framework_laptop_npcx_lpc_driver_data __initconst = {
 	.quirks = CROS_EC_LPC_QUIRK_REMAP_MEMORY,
 	.quirk_mmio_memory_base = 0xE00,
 };
 
-static const struct lpc_driver_data framework_laptop_11_lpc_driver_data __initconst = {
+static const struct lpc_driver_data framework_laptop_mec_lpc_driver_data __initconst = {
 	.quirks = CROS_EC_LPC_QUIRK_ACPI_ID|CROS_EC_LPC_QUIRK_AML_MUTEX,
 	.quirk_acpi_id = "PNP0C09",
 	.quirk_aml_mutex_name = "ECMT",
@@ -696,21 +696,39 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 	},
 	/* A small number of non-Chromebook/box machines also use the ChromeOS EC */
 	{
-		/* the Framework Laptop 13 (AMD Ryzen) and 16 (AMD Ryzen) */
+		/* Framework Laptop (11th Gen Intel Core) */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "AMD Ryzen"),
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "Laptop"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Laptop"),
 		},
-		.driver_data = (void *)&framework_laptop_amd_lpc_driver_data,
+		.driver_data = (void *)&framework_laptop_mec_lpc_driver_data,
 	},
 	{
-		/* the Framework Laptop (Intel 11th, 12th, 13th Generation) */
+		/* Framework Laptop (12th Gen Intel Core) */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "12th Gen Intel Core"),
 		},
-		.driver_data = (void *)&framework_laptop_11_lpc_driver_data,
+		.driver_data = (void *)&framework_laptop_mec_lpc_driver_data,
+	},
+	{
+		/* Framework Laptop (13th Gen Intel Core) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "13th Gen Intel Core"),
+		},
+		.driver_data = (void *)&framework_laptop_mec_lpc_driver_data,
+	},
+	{
+		/*
+		 * All remaining Framework Laptop models (13 AMD Ryzen, 16 AMD
+		 * Ryzen, Intel Core Ultra)
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Laptop"),
+		},
+		.driver_data = (void *)&framework_laptop_npcx_lpc_driver_data,
 	},
 	{ /* sentinel */ }
 };

---
base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
change-id: 20240531-platform-chrome-cros_ec_lpcs-change-the-default-disposition-of-the-framework-laptop-2249a26c88af

Best regards,
-- 
Dustin L. Howett <dustin@howett.net>

