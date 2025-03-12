Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE5B1EE017
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 20:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741809621; cv=none; b=QV3tnfomnf9962f68jz+60p/w+D5DLwWsgxRlD940YXWISn1qrmidyAYiN7A2DSN2j/pAy0SWUf5CzgDzny3ZM4HeT7OhkJLpx/jcw19xQQK0CL7bpf1fIxyLqoUpLNkqanUyX/ZuZxKOkqaThpGIRSu5nt2aytMwdboLMNLVw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741809621; c=relaxed/simple;
	bh=05+7dVWuOECHdsMMg1bh5t6jzIqyq0QLMWPcZxTVIQY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UtkMYZ5w6VTjVhsf5hcJP0IJOduDwzCXeNgK5IisL+xKz4ZT2xcxc5S7hZNLT5iH5yaAc0Z4MTZh3mWWUoYCkDdiBTgV5J79hTP4rlHhq1tZBenEXje7+yhJQdqf6fiXJzbAPxfO7XN2SjXL8Ia7/mBZ+FENEomBcvuY72K6lTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=muj/B9Lm; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="muj/B9Lm"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-223477ba158so6177295ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 13:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741809620; x=1742414420; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L17RDKhWUu6oMmo9Xalv19pEsxNZy4ncT3jPzEM2UX4=;
        b=muj/B9LmOwffWRJTRTQyWq/Wbo1ZvyLnSbynJWOIDW7fY1nTV0E9AnnUzPArpGkZB0
         4j/HolalKpVGmP28dW+0O1ikDXo+rGqyu/cOT2HyIPhucMBAj3XOxmShz4zu7ACrFR8g
         I9h4xLFLmznYkTJoBhjt/AidyQCJg6ELgjm+GmtdlukxNhU9rKWMAFt+1U5W/X7coZja
         6G3yJCAUNYsiwlIA0JgWkVuIs5NL8afxpG/wmPIKznfD7jPELUefsrXr4eSHjHlju4MX
         eI4BT7fk09VOR94Rt/JEesTKe+m5kRYaAMUDXjunca5BYRvNU6XFo6t2IZT/0vw9chj0
         LUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809620; x=1742414420;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L17RDKhWUu6oMmo9Xalv19pEsxNZy4ncT3jPzEM2UX4=;
        b=owLGZEFHaYlG8ulljNHPlxpIByD4Luw6ETi3EN0M7pwBll6JsIuSKwMxNZpgOwQBKC
         DiUY6g1a0mbHOpPORh2eGtGN7CGX1oAEkXOdTyfBbG5p1oU8DIYHFtgyAgbANmlcvMcE
         RdgLUW0F5d2ak9SJTkWl7QsFyZYoGp3HjtfJWT5vtqW/2lu467fIyD4R7bm+zdYz0yyM
         JV1NomnZnCaR9SbZF5BNR0UywfxTOnQs69nV5SvHGsJzrAx0rnanSXBbA820eECO+Ewm
         qQom/Kr0LHhtKrTCug+4uexYQqu2k9bl7hv4qwA114CpOl4jxxaqFWP93U0A7Y0jM9kD
         q1iA==
X-Forwarded-Encrypted: i=1; AJvYcCV1LgGPgSBie2oaFPyH2IGY1gUaEpChHfk3EDmRP2FyotZ/F5P6qA+H8yw4+ITSJ8XrccFhLrxMGrjyPy4aHzA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGrKsRJAuqhPNNvLwMIJ5o5aYfqsQZF6GN1074jnoqo4INUEON
	sYMQ4V9hk1Yg6RfdagV5Yk4mdbJxXjYKifYwmtHnq1EIYSVrqURNvwHjp0RaldLKT+Eu2bey3iy
	//g==
X-Google-Smtp-Source: AGHT+IH4K/47qeRDt1YjBAXcU3FOe5IP5JjThNYGWQevxtIT/iQUAQ0NeIwRHC3jFWJ6xWJBzD8leYYbizE=
X-Received: from plbmp13.prod.google.com ([2002:a17:902:fd0d:b0:21f:56e1:c515])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2405:b0:224:24d5:f20a
 with SMTP id d9443c01a7336-22428bfdba7mr411018645ad.48.1741809619744; Wed, 12
 Mar 2025 13:00:19 -0700 (PDT)
Date: Wed, 12 Mar 2025 19:59:12 +0000
In-Reply-To: <20250312195951.1579682-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250312195951.1579682-1-jthies@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312195951.1579682-4-jthies@google.com>
Subject: [PATCH v1 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is defined
 in OF or ACPI
From: Jameson Thies <jthies@google.com>
To: tzungbi@kernel.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org, swboyd@chromium.org, 
	akuchynski@chromium.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Check for cros_ec_ucsi to be defined in the OF device tree or an ACPI
node. If it is defined by either OF or ACPI, it does not need to be
added as a subdevice of cros_ec_dev.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/mfd/cros_ec_dev.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 9f84a52b48d6..5fb6cd20c5ec 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2014 Google, Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/kconfig.h>
 #include <linux/mfd/core.h>
@@ -128,11 +129,6 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
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
@@ -169,6 +165,15 @@ static const struct mfd_cell cros_ec_vbc_cells[] = {
 	{ .name = "cros-ec-vbc", }
 };
 
+
+static int ucsi_acpi_match(struct device *dev, void *data)
+{
+	struct acpi_device_id ucsi_acpi_device_ids[] = {
+		{ "GOOG0021", 0 },
+	};
+	return !!acpi_match_device(ucsi_acpi_device_ids, dev);
+}
+
 static void cros_ec_class_release(struct device *dev)
 {
 	kfree(to_cros_ec_dev(dev));
@@ -256,6 +261,30 @@ static int ec_device_probe(struct platform_device *pdev)
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
+		} else if (!of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) {
+			retval = mfd_add_hotplug_devices(ec->dev,
+						cros_ec_ucsi_cells,
+						ARRAY_SIZE(cros_ec_ucsi_cells));
+			if (retval)
+				dev_warn(ec->dev,
+					 "failed to add cros_ec_ucsi: %d\n",
+					 retval);
+		}
+	}
+
 	/*
 	 * UCSI provides power supply information so we don't need to separately
 	 * load the cros_usbpd_charger driver.
-- 
2.49.0.rc0.332.g42c0ae87b1-goog

