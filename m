Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F41410958
	for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 19:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="1tVtX68n"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-da819902678so3233944276.1
        for <chrome-platform@lists.linux.dev>; Sun, 26 Nov 2023 11:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1701026751; x=1701631551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1glwClA2ShX4YP8BVdg0b+vmY/dochMncGKUE8uZXs=;
        b=1tVtX68njwUHuczFeVx+BsG7cFXiHAchzGYix85xE3jHvQ2pVFGtpPyNGk3q+1Gb8+
         NLU7J8RosI9FTtLoFNAkxkAgT7W8HDdpMTAnWZ7uO7yo/KkyNTos9OvRQTqG1uqUVa83
         Ew7yUpY0/gZz0zGmkj16kao6BIYPmD6mmF1ke8LLz0PSw1XPsr4bZY7plKX4Ngg1hSL+
         DdYvBy3tcdMO95K7bNS5s5K8LrWus0/B0rvMGnHbi5Ydh1Z+VL804YSl7zmST26PhpM7
         b5SKFUGTn8n5tyy/Y2yjmPJlglnuYA95Q9C/F08vyHtDUPc0KvnJeTS0zDO1rXhkVn+6
         iGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701026751; x=1701631551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1glwClA2ShX4YP8BVdg0b+vmY/dochMncGKUE8uZXs=;
        b=BSyKJRJxJOhF/1oheDvm1x6NlgJzM8ts1sL+IGf85k84z9/d3WS5THO9RX0nlmuk98
         1JFNz7hp32riPeSenBVCW+R5zA+np7BB1CmvhdajWTf5SmjWr4Ni0vLvtnH9xmhGpfon
         tnT1w10V1Wdy0ft0MxAyebaDKlGdY0bqJ3jUGjUJ/WRQPCP5KjnqRwCJ9p309OvkqHn4
         G4HQ6BFjGfDPg0S/L88i4I8Fya7CuaK0gv2fYo/nWBxzyvDXVt5VtxH1FOQo2XICYzIm
         8NfwT+q/0anN0wCQU6OrZpwhzQgcwU7Vt+xVnbkDVLrc/TBbMqU7HVtBhnW0C8mLFVOw
         O7ng==
X-Gm-Message-State: AOJu0Yxm9Emug+Ev/yt196xQgas+D7ID0mcrYmzAyETfzK8T8PFHKYfq
	+jExHww7gZ6IUt//uYha9qKXjAAUmMfAVc0G7J4=
X-Google-Smtp-Source: AGHT+IFj3qNX0qROah4w2T1r21z/o6D9HjZnGJxh52oPym3tdYo0FjR3LjCJz/rPS1dYOumTxsT6gQ==
X-Received: by 2002:a25:abb2:0:b0:daf:7704:3f60 with SMTP id v47-20020a25abb2000000b00daf77043f60mr8639051ybi.24.1701026750904;
        Sun, 26 Nov 2023 11:25:50 -0800 (PST)
Received: from localhost.localdomain ([184.169.45.4])
        by smtp.googlemail.com with ESMTPSA id tx10-20020a05620a3f0a00b0076f1d8b1c2dsm3099040qkn.12.2023.11.26.11.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 11:25:50 -0800 (PST)
From: "Dustin L. Howett" <dustin@howett.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Cc: "Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v2 4/4] platform/chrome: cros_ec_lpc: add quirks for the Framework Laptop (AMD)
Date: Sun, 26 Nov 2023 13:24:52 -0600
Message-ID: <20231126192452.97824-5-dustin@howett.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231126192452.97824-1-dustin@howett.net>
References: <20231005160701.19987-1-dustin@howett.net>
 <20231126192452.97824-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original Framework Laptop 13 platform (Intel 11th, 12th, and 13th
Generation at this time) uses a Microchip embedded controller in a
standard configuration.

The newer devices in this product line--Framework Laptop 13 and 16 (AMD
Ryzen)--use a NPCX embedded controller. However, they deviate from the
configuration of ChromeOS platforms built with the NPCX EC.

* ACPI device _SB.PCI0.LPC0.EC0 only indicates I/O ports [0x800, 0x8FE]
  as being used, rather than the expected [0x800, 0x8FF].
  *However*, the embedded controller does make use of all 0x100 ports.
* The MMIO region for EC memory begins at port 0xE00 rather than the
  expected 0x900.

cros_ec_lpc's quirks system is used to address both of these issues.

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 drivers/platform/chrome/cros_ec_lpc.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index a65c9a8bca5e..9373c39c3ed9 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -538,6 +538,13 @@ static const struct acpi_device_id cros_ec_lpc_acpi_device_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, cros_ec_lpc_acpi_device_ids);
 
+static const struct lpc_driver_data framework_laptop_amd_lpc_driver_data __initconst = {
+	.quirks =
+		CROS_EC_LPC_QUIRK_REMAP_MEMORY |
+		CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION,
+	.quirk_mmio_memory_base = 0xE00,
+};
+
 static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 	{
 		/*
@@ -592,7 +599,16 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
 	},
 	/* A small number of non-Chromebook/box machines also use the ChromeOS EC */
 	{
-		/* the Framework Laptop */
+		/* the Framework Laptop 13 (AMD Ryzen) and 16 (AMD Ryzen) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "AMD Ryzen"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Laptop"),
+		},
+		.driver_data = (void *)&framework_laptop_amd_lpc_driver_data,
+	},
+	{
+		/* the Framework Laptop (Intel 11th, 12th, 13th Generation) */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop"),
-- 
2.42.0

