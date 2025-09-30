Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A81FE47B
	for <chrome-platform@lists.linux.dev>; Tue, 30 Sep 2025 01:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759195475; cv=none; b=JSJKGYtr2hwDTc98rHIG0sX1qg/FjF8kqwcCPShI0AyrgVkVwEML0vdC7aXxRC9OPQ5GsUMuMCb0bb0cNLp9nhy7v1gjAaVzL4B3KRi3Dmh2mrTGb1LzM5FcM/1xmRNiCYZmtzgeST9hf1I0vF4bFz0ZVeqCeUW5Kp1UyncoQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759195475; c=relaxed/simple;
	bh=n5cziPQ61KRp5AtyPFgy8VJF4Lqvc2a81X5suV1ETHU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DUs2tJbyTVMcPrxE/7gIGaS4FJHsN8+kCfR76gYyp5CvSPRFNeP/TX3uKtnMh1YWoghCO6h1xVmqw9EL8RRdrwQajOS02T115t+rbkvvCi4Dxp815ptLVRvDTd/njuQ5pUIttvCQc/WSsqdXRhfcuLGqQOQ3C4xd4eN9kKEGlYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hewkLs0f; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hewkLs0f"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-28c58e009d1so22052935ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 29 Sep 2025 18:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759195473; x=1759800273; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kogf9tvbfBCb39vdLAEVilZDn5JXEZ0lPob5kpAtHeE=;
        b=hewkLs0fZJtr3ltR34UFuzoOoIoNRV91UmP+kz7b+hoYG3FGYL3z4GPY3cIY5Cw9Xe
         gb7+2akcyounOkEzg/puC9i28k5c/p08b/O5Y/jDCbCf1dUl0HhmpCtQtL4QJD0I/RJR
         ySqxqdkR75VhI4kcSeXTm6jQz8UhpwR0cyTAbbbB0a/GBniiHlEgdMye1uE7T3yUbXx6
         8l1lvoBEz16Ebrrm0sm1DsjXdOXvJXOmObuRyXVxSYGOXY+em3g3W4+Hty3oWeMUUOmC
         QnIf9MfFHGQjKTHMOnJ38avSXzYrT/a3+ILEdY+Mb6zXbZDx47R/1Ks2KFYoM/jUdcTn
         bjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759195473; x=1759800273;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kogf9tvbfBCb39vdLAEVilZDn5JXEZ0lPob5kpAtHeE=;
        b=q0JLoneElt6WCvwDa5sUeAgdepmij73YM2HCclE06ZiqdgELuXXxpRvSPQEh2d4zQ9
         XOwtDdqvGz7fygxXh5TLHhqypB8arUk454/l8d4WCJ3PtbXjxGN3nEIbGRPlVaOTy6ra
         7PhSDDS2tUDrkrFeNoZIOI4l8sTQNl7Mmdodr9G/c+WOSAmL21r7EdtaaS8ZdBM4B7/b
         rUBGD+KsK8BvZPJNI3QI7pvJurxqYpyVXXXIlsnCxzRGGqTNw1kHkat/OmDyqvbhTjJE
         iZNpQ8vFXlMk726hzxmoK83JM4Qacks2psJwj08a7PtWL+dkqxaeq7977ejTWRp+PMZM
         kewQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSYIAUUukft7qUh5GSUB6jleLs1hmO7z3VlbPSQ0TXfkPB6Vqw/PCrGsu/oCgo7G8UVMisXURhFphGQwZ7ecE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQePLMGePMqskdrIhG7L8HKpKK16w2f4wNpp3bXtPfss680sd6
	GSaDi81o+JrA1v8/mgCeRQerktQ07mnjZ9BP3G25zNP1NJ9F52F4X1XUHDVmS7mgIosbKvX2hL7
	h2lRNaw==
X-Google-Smtp-Source: AGHT+IHrgMj/I7ewzUlfQ+tAFdK6lsLgX95aSaFSACakL6kqrbRRIQLYFBi7WQqIgbhinM2CjM73dUzXSCk=
X-Received: from plblk8.prod.google.com ([2002:a17:903:8c8:b0:269:96fe:32ad])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88d:b0:272:f9c3:31f7
 with SMTP id d9443c01a7336-27ed4a5e907mr193803585ad.50.1759195473033; Mon, 29
 Sep 2025 18:24:33 -0700 (PDT)
Date: Tue, 30 Sep 2025 01:23:48 +0000
In-Reply-To: <20250930012352.413066-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250930012352.413066-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.570.gb178f27e6d-goog
Message-ID: <20250930012352.413066-4-jthies@google.com>
Subject: [PATCH v1 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is defined
 in OF or ACPI
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
defined in the OF device tree or an ACPI node. If it is defined by
either OF or ACPI, it does not need to be added as a subdevice of
cros_ec_dev.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/mfd/cros_ec_dev.c | 40 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index dc80a272726b..b0523f6541d2 100644
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
@@ -177,6 +173,16 @@ static const struct mfd_cell cros_ec_vbc_cells[] = {
 	{ .name = "cros-ec-vbc", }
 };
 
+static int ucsi_acpi_match(struct device *dev, const void *data)
+{
+	struct acpi_device_id ucsi_acpi_device_ids[] = {
+		{ "GOOG0021", 0 },
+		{"", 0},
+	};
+	return !!acpi_match_device(ucsi_acpi_device_ids, dev);
+}
+
+
 static void cros_ec_class_release(struct device *dev)
 {
 	kfree(to_cros_ec_dev(dev));
@@ -264,6 +270,30 @@ static int ec_device_probe(struct platform_device *pdev)
 		}
 	}
 
+	/*
+	 * FW nodes can load cros_ec_ucsi, but early PDC devices did not define
+	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
+	 * the driver should be added as an mfd subdevice.
+	 */
+	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
+	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM)) {
+		struct device *acpi_dev = device_find_child(ec->ec_dev->dev,
+							    NULL,
+							    ucsi_acpi_match);
+
+		if (!!acpi_dev) {
+			put_device(acpi_dev);
+		} else if (!of_find_compatible_node(NULL, NULL,
+						    "google,cros-ec-ucsi")) {
+			retval = mfd_add_hotplug_devices(
+				ec->dev, cros_ec_ucsi_cells,
+				ARRAY_SIZE(cros_ec_ucsi_cells));
+			if (retval)
+				dev_warn(ec->dev,
+				    "failed to add cros_ec_ucsi: %d\n", retval);
+		}
+	}
+
 	/*
 	 * UCSI provides power supply information so we don't need to separately
 	 * load the cros_usbpd_charger driver.
-- 
2.51.0.570.gb178f27e6d-goog

