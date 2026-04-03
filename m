Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC81374E5C
	for <chrome-platform@lists.linux.dev>; Fri,  3 Apr 2026 22:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775254992; cv=none; b=TeD/hL3VS8SBLrLhCRHLkavEfMYgfFlqKCxqWdNFksQuSWlnA46zs3ymF64TEcPN19UCbN7Zq0fTl6Dwwz7tQRzun0h+hF5+nq/DQP9sI0LgG3dzrbfs7Z0g37ylpgeurlYAk2zaKZxGr/GYcv+kRsCgyM8GSmmlHqOTcERu1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775254992; c=relaxed/simple;
	bh=tUs03xfRhr0/4Kj+RLDdjg2OwVNhqIqNUqoEiMApBBE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h/xxE2rbIvaOjd2AOgJ5mqhcxIEBMjb1RgZ8YW3S91Kdbhm7UxDqLcXBKef9h4+yMtNvb94fAyZYtjHkbrYepiomNxBl4GVp0q3hZ62toxuLsiB2wfwco0OTE29BkzQWIrpNF+HRii1tU/9olMvw4ghFcCMkWYAfjBP5UIDganU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mzSv7ush; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mzSv7ush"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso2886753eec.0
        for <chrome-platform@lists.linux.dev>; Fri, 03 Apr 2026 15:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775254989; x=1775859789; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5x6Pgh8rN/XyVYOuWDISX9Lht73hIQJmSqNkuOIMnE=;
        b=mzSv7ushSvCwvHFgn2+1T3T6piQlJY3cVxw4bURXxeTwlovHJTeakQdKNbWeJDPpFR
         X2l+VFUTg3KZRVlNR3AkMT0BoCTxh3SEs3Oi7rbL+t691qWhc5b/bzvY6B7bXb7PddP6
         ypHxXt4TSwEwnPm3GVupYJK6dBCcZ9CtaU/SPXFDFcPg+Svfug4lZql3ETQbVQaO6GsC
         qm0z3/WBQBgktMXfeT1LAmTDSdPBzoFIdYMT1JIs8dcpYLqncvAFX3KlN3p7ZvVc+Cxo
         RMC2U7kKv5VdphoMRrUMjFtEaXheQooyPPTE3Ip5jWAsJvVVayVLcyuSPR/HPRrG6buo
         dFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775254989; x=1775859789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5x6Pgh8rN/XyVYOuWDISX9Lht73hIQJmSqNkuOIMnE=;
        b=IFadR28TfcXekOWxjtqiI34cD6Pok9EIqWWF43e8hMeQRArryzqurP6iDR4cPpQa8w
         o4VxLdMVbpR6zIydN2DSLkood8R1rmYL8Ji292/W9bAG1p/mDn2Q0xE2bENltFRvlyj7
         2XIW3A8MifSC534B5c4x6d7oScPSSd5BtjQCM4PEecGyFKsbMLGVu/fgTt6+vWvsjVrt
         /WEF3pn0Lv1wPoj8PXGJKpPSK9wRcJT5G394fiqhhUje15oCNzVFgTSKzTQmAmdNjmfM
         C7ZCaDYf5TriCawnp5pzO2nA9lmacSnl1ciGagQbFMLirHfS7Lld8gNZPxiuASEXkIyp
         7G0g==
X-Gm-Message-State: AOJu0YzjBrb/XX7UKse/bipXFxMQfWkoZJslb4R3ki1qSdOUh0ellnIF
	5sVANzljDoq4Q+jeuXDqkanbAzlUqPKq9z+KZK5s+C74eZ66tLIGu2MFjfKzwU2Z3RGnZp8kbcf
	RmEDY6w==
X-Received: from dycmz18.prod.google.com ([2002:a05:7300:ea12:b0:2c0:be02:79e8])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fb91:b0:2cb:7663:322a
 with SMTP id 5a478bee46e88-2cbf9fe7dfamr2381762eec.13.1775254988749; Fri, 03
 Apr 2026 15:23:08 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:22:53 +0000
In-Reply-To: <20260403222253.1888991-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260403222253.1888991-1-jthies@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403222253.1888991-2-jthies@google.com>
Subject: [PATCH v1 1/1] mfd: cros_ec: Don't add cros_ec_ucsi if it is defined
 in OF or ACPI
From: Jameson Thies <jthies@google.com>
To: lee@kernel.org, bleung@chromium.org, tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	abhishekpandit@chromium.org, akuchynski@chromium.org, ukaszb@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
defined in the OF device tree or an ACPI node. If it is defined by
either OF or ACPI, it does not need to be added as a subdevice of
cros_ec_dev mfd. cros_ec_ucsi will load from the OF or ACPI node.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/mfd/cros_ec_dev.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 39430dd44e30..70d64b7c6243 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2014 Google, Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/kconfig.h>
 #include <linux/mfd/core.h>
@@ -131,11 +132,6 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_rtc_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_rtc_cells),
 	},
-	{
-		.id		= EC_FEATURE_UCSI_PPM,
-		.mfd_cells	= cros_ec_ucsi_cells,
-		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
-	},
 	{
 		.id		= EC_FEATURE_HANG_DETECT,
 		.mfd_cells	= cros_ec_wdt_cells,
@@ -264,6 +260,23 @@ static int ec_device_probe(struct platform_device *pdev)
 		}
 	}
 
+	/*
+	 * FW nodes can load cros_ec_ucsi, but early PDC devices did not define
+	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
+	 * the driver should be added as an mfd subdevice.
+	 */
+	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
+	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
+	    !acpi_dev_found("GOOG0021") &&
+	    !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
+		retval = mfd_add_hotplug_devices(ec->dev,
+						 cros_ec_ucsi_cells,
+						 ARRAY_SIZE(cros_ec_ucsi_cells));
+
+		if (retval)
+			dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d\n", retval);
+	}
+
 	/*
 	 * UCSI provides power supply information so we don't need to separately
 	 * load the cros_usbpd_charger driver.
-- 
2.53.0.1213.gd9a14994de-goog

