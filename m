Received: from mail-oa1-f74.google.com (mail-oa1-f74.google.com [209.85.160.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1B817AE11
	for <chrome-platform@lists.linux.dev>; Thu,  9 Oct 2025 01:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759971805; cv=none; b=ao6k6tfg/ElAYIld4elUSDwVy71M/EWgzpJkbY1TNNVnTvrz/mxz4dyKp0xj9xj4AJNh87TSPp5lExI9hM8joI+sZmJ2gXVYBB0T1OdZ9jyqC2oYmJACR1q4EWBpJCC+bPQesBXwFhkWpZwwuPIbscaykpTJMMLWqvxR+NfR5T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759971805; c=relaxed/simple;
	bh=00pwX8rLB5k8Lb3COtxEncyyDckCIf4Wtb9DdeVqR3Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ehEs8DsCaNmiTEZZm1Z/fiP+WEyLwo9N/yMRFfZUL/WBMtyOBSrCFfFfOBb2GmVUDVErMr5vqenMHR65M33Vc+3dbXDH9psYeCrnuKwSXM8N2R6Wg9Bac3QMCQN5KG2GVlISmmPvLD8g2lrTxhisxdCpUu1EBSN7lZQ4dEhhYJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t83AYc/D; arc=none smtp.client-ip=209.85.160.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t83AYc/D"
Received: by mail-oa1-f74.google.com with SMTP id 586e51a60fabf-30cce8e3ceaso1002226fac.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Oct 2025 18:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759971802; x=1760576602; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCeRiv6OyS5ejnolBPMxDl1i4JKGbiO+/woSsXQ2sg0=;
        b=t83AYc/Ds5wAQ31ahNcAJsPG9RwxaLgVbLFDFqsFWSPzDW3sxE+5XJYu4IyCLiPMU7
         CHZVStyoB/Jmzjep0ukkWijhULSPJpWb2R0ilf55aSTxz4mJbl9g2/a2mvBNxDKP9has
         EW8vGs3pn61ZTLZ9c5fOyZ2EU4RBye66YMklwYxejddBqBovq14KLphVDtZlhZ8UM1Wn
         QS0t3qHzF+tqPK+Q2iUt8NfvKir6TZgfuUq0jA2+i2eo/PlYqpt8JIbNXWojNEma6Tub
         rt260lgqiGKO/PrCw9t0to466ThAEIx8/5G6PmM2ClmBRCyWPM/qDRCRvTwD+++b1WLe
         EQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759971802; x=1760576602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCeRiv6OyS5ejnolBPMxDl1i4JKGbiO+/woSsXQ2sg0=;
        b=MCqzz8O4LJmIxvTbUNE+TvoxEXOJzU/eLMOonMvDqJF2hVyrMhu4tqVi/sihVLOryw
         aLvRO1i1wkkBpE16wZ7ctiCVzRJX8lRF1yxblD5CHQFZp+7d06NADWRdy4CYyL/PYHBY
         29hU3QXdKs9uvs0XEl+TPhgeRysMKE024erSL2ITXKBY24VoY2zmb3RkwrBgex+bDDE4
         br2W0BeAnb8sShjGmR7VzEedy1jvuH1H2JnJzvYH7/1ZFH+6DRzfJpr3Fqbix1ws9LyD
         pSPx6hGQQMJiCkhgpTHlqQkBBabd0uH01WbrhUs54+qeKkOCXMyu3T18nXkbvlFwCf5v
         OsIA==
X-Forwarded-Encrypted: i=1; AJvYcCW5mMbo/lO8r4FbSQ/JXzdHbbul0ZOBdemmEtY6ekVlvGhMiK7RRRaJ8nSlt6NMwlUGwf4Ruy4gPAyZlD6AJq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwAaVSCMMvSJFrcoRZHg5DkxcnMaGWG9zcu3p15JO1vgpBUUwj
	QiSpZuHf0yJmaJJVCoLw0APlq6a6cg1jpZYVw/3ypkZ1Y8vhd39g76dwVoDTD2xL372ESEKeHLT
	bnSGvTA==
X-Google-Smtp-Source: AGHT+IF0qbDcxH3MGVrqr+Rn2sXSBv3+09P7txZ+7QoM8RfbyeoIQUaC8Byu4yqvRximfoLKLV3kORtUsFI=
X-Received: from oabyy48.prod.google.com ([2002:a05:6871:25b0:b0:34b:1c16:5c46])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:e992:b0:3b1:8e5d:d42a
 with SMTP id 586e51a60fabf-3c0fb72a8famr2648272fac.49.1759971802265; Wed, 08
 Oct 2025 18:03:22 -0700 (PDT)
Date: Thu,  9 Oct 2025 01:03:08 +0000
In-Reply-To: <20251009010312.2203812-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251009010312.2203812-4-jthies@google.com>
Subject: [PATCH v3 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is defined
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
 drivers/mfd/cros_ec_dev.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index dc80a272726b..1928c2ea2b8f 100644
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
2.51.0.710.ga91ca5db03-goog

