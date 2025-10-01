Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E43A2ED149
	for <chrome-platform@lists.linux.dev>; Wed,  1 Oct 2025 19:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759347242; cv=none; b=ljGIaZ6q8YxjetgQtjp+5AlJwGx+G2saiHIrYcNdhdRWc3p+AhJJdvAmFmN64VmYQa0UWDfAinDKDm3B+0WbGaXcEalOrFEHotPQYItK3XT9PnFKzWTVMC6l5F8XYg/2vxgmXIqYapY+4aqjgQU5sblf49wZVnSxYNyS8SEzmOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759347242; c=relaxed/simple;
	bh=Re7GUviQQ/McZMZXcizPzU9VQkGIF/9Gqs/MVdCmSq4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gSXTH3LCKGEYhAUm1Mxm8ejL0y7GVEGXnWnEtk3zLJVRdUpfbREkl88AHCPdOhgT/3bs2fCifVoPSm0P+JlDh/2IOQW4Ynbc40CIT+gTECHVarEMwWZ8x9FfvfEA2+8u1Yj5jAHucvAeGApH/r6v67kjtW/LRtYJMRu8we0zStM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bRLbW8xR; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bRLbW8xR"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b55118e2d01so126698a12.1
        for <chrome-platform@lists.linux.dev>; Wed, 01 Oct 2025 12:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759347240; x=1759952040; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ab9LbOojENiRCLzu2+LM4yAW/ppnt27Oi1gZ0mzkbeM=;
        b=bRLbW8xR8enDOjyp2U0z5ysW0oLLcFW4BWVphHXis8bJW8Jv7N8oKdkEv7j50RNWMT
         6x4KdmigJXobC2JRS47a/Rs55lfHuF6FB1snCavfSX4tPzDfA5QCdSYuX2agKczHe2aq
         ONS7A6ZDi5QxyJxG8bEAmwsQGZpxEb1y1uctFKkhQT/n4muabWYRjzJRB+NyOKw5L1GR
         4AwqNdvCqbn6umWR8VZNlcXlWEjYArNIhKSUnlYppjARP0An+pgWZ1MJH13uPsq4398Z
         QX/d8zQdypj1L9KOSv604qP8VixPKCXPwCN7Y4ZLgyPYLW4p/M8GoHDCMzOl1AyO6LYs
         UwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759347240; x=1759952040;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ab9LbOojENiRCLzu2+LM4yAW/ppnt27Oi1gZ0mzkbeM=;
        b=mOaodDnWF01RHCVpnK2x13PqvPQT7b3r/LzCwjm5aGtNaUQQYoyLrCptwl9sihxcdX
         cbfnfs947UuosuS9icoJCbfBfTCEGiHGENphGUAwYZeGPU9ZwiTdC/kJIVwpQfRJI80D
         YHDwJ+fIA4TGdbnpvryYVRmzd6X+85cXX2nJXiJ9y+5Cn/7jlv79v5pmjlEFDb8lkyPZ
         +M77joySl+AO8k9tpEzT4IrX4LFUuCf38m4wU/DYCWPSfrDfm/wNK55G8KC0r0O/5w47
         BAojf9fWSigp+dSNZMkr5hZEPWUzTP36pxtGNBDQFofOWRSccoc1gG+loV3UxNP6jGzQ
         4gFA==
X-Forwarded-Encrypted: i=1; AJvYcCWTFsRjspDsmqWwQXYlto2nz1frm9Q5NQwYWHgSeHp5hEUNVk3/k+Gy4CdQRiVmQcIalC9b8KggwY2M8Nv5RDg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOdi2HSwzBkq1QstKALmcnN3Lc9gj1gdpvYuFR66G0UiIMUuB2
	U95H1njPWsh4oBDtary8TFD/YM9D+GuBOp3Z4qQlMwo+NP3LMlLVsNmBi+PnoIoHgVODbcM5ewf
	Mb9pXDQ==
X-Google-Smtp-Source: AGHT+IHpeChB7wBWGbIToLlpa6Wkhfvaeaky3iS+MzUWr5j+7Q7cE+k6HmDkvIJbqJHBJhco83UQXyJFy4c=
X-Received: from plpc16.prod.google.com ([2002:a17:903:1b50:b0:28e:8363:fb93])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f70b:b0:26a:589b:cf11
 with SMTP id d9443c01a7336-28e7f315a95mr52240345ad.43.1759347239903; Wed, 01
 Oct 2025 12:33:59 -0700 (PDT)
Date: Wed,  1 Oct 2025 19:33:42 +0000
In-Reply-To: <20251001193346.1724998-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251001193346.1724998-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001193346.1724998-3-jthies@google.com>
Subject: [PATCH v2 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
compatible devices and "GOOG0021" ACPI nodes.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index eed2a7d0ebc6..3d19560bbaa7 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -5,11 +5,13 @@
  * Copyright 2024 Google LLC.
  */
 
+#include <linux/acpi.h>
 #include <linux/container_of.h>
 #include <linux/dev_printk.h>
 #include <linux/jiffies.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_usbpd_notify.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -235,7 +237,7 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *udata)
 static int cros_ucsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
+	struct cros_ec_dev *ec_data;
 	struct cros_ucsi_data *udata;
 	int ret;
 
@@ -244,8 +246,13 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	udata->dev = dev;
+	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode)) {
+		udata->ec = dev_get_drvdata(pdev->dev.parent);
+	} else {
+		ec_data = dev_get_drvdata(dev->parent);
+		udata->ec = ec_data->ec_dev;
+	}
 
-	udata->ec = ec_data->ec_dev;
 	if (!udata->ec)
 		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
 
@@ -326,10 +333,24 @@ static const struct platform_device_id cros_ucsi_id[] = {
 };
 MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
 
+static const struct acpi_device_id cros_ec_ucsi_acpi_device_ids[] = {
+	{ "GOOG0021", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, cros_ec_ucsi_acpi_device_ids);
+
+static const struct of_device_id cros_ucsi_of_match[] = {
+	{ .compatible = "google,cros-ec-ucsi", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cros_ucsi_of_match);
+
 static struct platform_driver cros_ucsi_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.pm = &cros_ucsi_pm_ops,
+		.acpi_match_table = cros_ec_ucsi_acpi_device_ids,
+		.of_match_table = cros_ucsi_of_match,
 	},
 	.id_table = cros_ucsi_id,
 	.probe = cros_ucsi_probe,
-- 
2.51.0.618.g983fd99d29-goog

