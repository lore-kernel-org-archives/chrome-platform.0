Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CB930EF87
	for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387664; cv=none; b=HaCoPKkQsQDZVVNeOWePb/pQftNj8eFcuYaKgQ1ITAwYeCFe2A6bnScBLYBPBxOmqsmfslaGITP1PhxQQcdM16lVOFXBqtzSRCvpA1XEZXWEuoZLtj1+g/D6PGHAbkKt47OFlkMSC1ga2Sf8QaZ+xXWnHBP3PTNHEcoYlvK0Jjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387664; c=relaxed/simple;
	bh=R1YnFh8aXUGKuVVtnPClepvt/LVUGJ/UtnMqEulZIYo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jH5FqfPAoao13JHecEAsJkfyxIM/GK3o1VHJeBMmO61CKm6yCyUTLogYDxiLxmJFcs6nfp1KOppwHLeemFwJsbPBlxACMACEnnNSac85dxXemTZZYsqOUw5RQGqbSc4Ect5yBogTqapVgG5AkreqQHRgGJpH9rxBwYcaVBpp7S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3plNWAH8; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3plNWAH8"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-77facc9ef7dso73822357b3.2
        for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 13:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760387660; x=1760992460; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GFnB74J1pAvDm1nl6YVxkFp2KLUlGXZiPBf1NrkOorI=;
        b=3plNWAH8f83d26pCjgikNrrPmi3IBwsDu6gq+aAjnG7BqQd0Zhj215IEoFcGKLW2Fe
         y6xD+YhE8FvNMIsXeH/yRsS49RLeltcBTLDNk6l5MMXiBoFUvmi6snBapXNCyNwZEzCy
         GCO9puujJu0rhU2sBGKTqlaZotATq0S6EgaQ92CB9HhPDpwrDPi4a2V/+Gh8wy0eLYeh
         xICWJPxEHz20EmhWypA8tZPJNjxMlJGQZFy1M+mzHSLzRMU+OsHTknKp736fuNukCbvI
         J27yKJKIblk4z+0/uki2/ykkCL9QHdpsuIKnUpBBor4WN7jKwJP0pi36jq/8RQ7w87Fs
         pmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760387660; x=1760992460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFnB74J1pAvDm1nl6YVxkFp2KLUlGXZiPBf1NrkOorI=;
        b=Rqkx3poBS0d9zSS1uWwffmo6K6NR6vt34UyvSjP7mXNcmfLjpMIJd8RVG2/p713nqO
         OnCfJHKE+xX6Q8WbJcxOcsMKq8NSDu8oZREzL0bubxX3bNfkMy12HVpeHE45INbx3hY6
         GST6othM3B7oiRkzT8o51xF9h6MKj+k2mRpWu0KxJlsO01a6W8NAeWGss4ckb5RLtnhV
         +yESNZGNw2RY5JHS5DJ88NoRhygndkRoVswrcZNGm7yEtfIvR/VlpJid1T60JyryszO/
         emETBD5/EQZU9cOS2Q6t9vxrIZb3KjlrODM+IYLCEmSPtURxllIes6Jn5ECr6YpalC97
         V6/A==
X-Forwarded-Encrypted: i=1; AJvYcCVUb4yAi5kS5Dcwc4kBp8EN9GVMJbFerfCsgKUMt/PIHxwl/Nym10nzZcvVWzTGGNghZcdAiI5QLhT+zdij+uE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqyLLaz9n517ybTzrFg2eYX4AEkR+K0CLsx4UKq+xJW7jh2SJe
	jyxmV8Tw48gmXTvcExXyNJCKTLHVJybnsQCgBE6SJs3MonZGa85Y612GaBv5P+LRytKqBh5HMMZ
	Ea+q9WA==
X-Google-Smtp-Source: AGHT+IEjUm82raEjN7d+M3tvikmOo78EaMWdJ4VaMRN5Im1/+9AxanQNq/18YLWj74gbMAzsjUUto92DYFo=
X-Received: from ywbjh10.prod.google.com ([2002:a05:690c:710a:b0:780:e432:6fc7])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:7487:b0:781:64f:3145
 with SMTP id 00721157ae682-781064f72ecmr131650497b3.67.1760387660244; Mon, 13
 Oct 2025 13:34:20 -0700 (PDT)
Date: Mon, 13 Oct 2025 20:33:27 +0000
In-Reply-To: <20251013203331.398517-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251013203331.398517-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251013203331.398517-4-jthies@google.com>
Subject: [PATCH v4 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is defined
 in OF or ACPI
From: Jameson Thies <jthies@google.com>
To: dmitry.baryshkov@oss.qualcomm.com, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, krzk+dt@kernel.org, robh@kernel.org, 
	bleung@chromium.org, heikki.krogerus@linux.intel.com, ukaszb@chromium.org, 
	tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
defined in the OF device tree or an ACPI node. If it is defined by
either OF or ACPI, it does not need to be added as a subdevice of
cros_ec_dev mfd. cros_ec_ucsi will load from the OF or ACPI node.

Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
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
2.51.0.858.gf9c4a03a3a-goog

