Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87D52FDC23
	for <chrome-platform@lists.linux.dev>; Wed,  1 Oct 2025 19:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759347245; cv=none; b=RqTOIvJfom3k/DvWvtlxNws8rmaBb1Z6o+ulBHPeOwbYHjWMnIaAaSeEBxyIBrEKz0E0MSJ/P0dtgijUe2bkJVXhl0CEyfvDL8x5pqrDbtx2+Rav1MAdlcmGvBWqmDQ1ifKgSitmSbI/aV5cUz9+XXRTOHNf5kfTSnORQJOjSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759347245; c=relaxed/simple;
	bh=hjVBX5JMtGNkNIWN8eSwy2vTEb4tpKAWKxH7zqEEOj4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=djQnJCvgogXYLN8ymFVKfBgoebIO1mS33DfaEqvHEHTD/1VKXXqSYkCYcW2+xgCg/KPA2D49f5kWY2e62hK4Z83mN6XlVbCZBY99/52XJ8LePE9p5944XtNote1bAUG7QQVYperFhUaliAZo4NP+DTOfxyyx4xlyk1S4FCaNYKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YqEhIiNO; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YqEhIiNO"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-26985173d8eso2458435ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 01 Oct 2025 12:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759347243; x=1759952043; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uUFn2s+3Cx+wxXVgN5taoVqNZX8a68N/oLppB9MWElo=;
        b=YqEhIiNOp4KiYF+hIp+BZFxzyIm8uzuIE0PzF6eHPiVJ0K04g0EyZCuT9y8Kr7Scvq
         iEAFmgbcAI9USRe0KjPo7jygmCY8/PfUuoGwfBmoBbe7zqTKmxcbazyHKyzcTGqTQi15
         DUnzs/xjpt+r1tpxHCeVkR1xWbe16FZitVfCdTuKyJ2ftrUbNXkmccS1EHfOUTLN96fp
         wnRjZkmvhV00JNQI1Arc4aMs+RUxzwRXvozuc6K8h5HqSwMGtZWfF7aMMmqEEdR+WTNT
         BFt1SEUkVgdTiqC8XNWiULhpqEkMQYkFa3eRCmj4i0XdbYInghw0Az5hdsMYZ2AcXNp0
         bMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759347243; x=1759952043;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUFn2s+3Cx+wxXVgN5taoVqNZX8a68N/oLppB9MWElo=;
        b=RfF8Jah5djgGzPifL04gAyPN6ricjP3O0O2aWKXcpHONjQUNms/FctXOFQKlHt3fp/
         n+O60IQEVlUjaWvxyXaxbTm5uy7mnGShcHxb61WoHkw8OX8O9uUdM56k1sMt4CvUz827
         6QEprtsKNrRkc5NVF/+RDJXZ0kueCc4jKfxf8xBOlkfBDVNx2MzUY826PGd00Pc7gw3U
         C5NhUQhDai44qLsBhY8jhikh+XwJVGnhEu5b+PiceYyk01hL27qseLed/0YGTkKhUlCs
         8VRYtNSqPUP7tShuCa1I09CM0mnuTIc0re7pMQZdOmGltQKqnXhL8bEGevot60PpAnjm
         Svfg==
X-Forwarded-Encrypted: i=1; AJvYcCXDk6CP5qN5xFz4qApFMbP5pwwGps+E0XoKWWDe3ByZHZPz8v+cS0JUrPYpod6/sQSZMwQbjpLuIIQ9Z202bBI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzG36OACy1+ge4kWtTOy4fAzXW7Autjpzmvw5AvPGqbC1UYvg0k
	o5naL74ClaRJKBp/Ad6uFt8DSGcZX3PsZllFJuUjBXXyATxZK3hfKsCIlurnnzgKhgaBDaptXk7
	JuTxXDA==
X-Google-Smtp-Source: AGHT+IEuxbvUY4/T7dbFkwsFtVOPEwyefNF8rTwItwF8+xb481LkR2wSDNCKWoFQXCU9ZimIwrDCqEO8hzo=
X-Received: from plkp3.prod.google.com ([2002:a17:902:6b83:b0:27e:ec80:30c6])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19e3:b0:26a:8171:dafa
 with SMTP id d9443c01a7336-28e7f2c5848mr68118035ad.21.1759347243022; Wed, 01
 Oct 2025 12:34:03 -0700 (PDT)
Date: Wed,  1 Oct 2025 19:33:43 +0000
In-Reply-To: <20251001193346.1724998-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251001193346.1724998-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001193346.1724998-4-jthies@google.com>
Subject: [PATCH v2 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is defined
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
2.51.0.618.g983fd99d29-goog

