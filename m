Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811BC1DE4CD
	for <chrome-platform@lists.linux.dev>; Tue, 30 Sep 2025 01:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759195472; cv=none; b=HhWOoFSYg1H3SBrfGzaEKSh0lhMIkX1Z4v7KKRaiDzoUJqNYpiCtBkZs4Cw8v/xALYmxJKmy8JxDj6RwW+W8AQe392L7ZhJ/i8dw+6gVFvv4l/Qkof3BhlIaZDLlUHi2+yb+8MeBK0JmmQ5o/TZ6i7y8jiOi+Y+Gh+lAbsTbDfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759195472; c=relaxed/simple;
	bh=N4kLniQHDskmFQXBLT0LHBLGRHO/htZMq5n45mo5spA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yt9u3RG2i0jih36J8jGDNtpIGiZhPxfdaIzF4itnPDzIcmmtKoxc/dDmUXdQmmLo0vaQrJwhQ2yKqX+/uo8Xx5WuLAU2tbcjPAbVQfZy2vVTYo1wjIlWhTqng3koiruq7Nbwj7AWvRkH477geL+wurvxA3yL6+fc5IpCtXL2alE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YtPt091T; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YtPt091T"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-745c3f7e569so48210297b3.1
        for <chrome-platform@lists.linux.dev>; Mon, 29 Sep 2025 18:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759195469; x=1759800269; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=atjRbq2Ix0kpQpih72xPV1a5tslbrY8BWtKFpnViPQs=;
        b=YtPt091TFppB3kdBjF0cgqpOdgPDSZMoj6q5oTy0QnNMPLo+SZw/KSJuOxyUtUc2Rn
         eR1k43j6jbX8n2zQeC1N3F7NGGM1Tevk+zcQ5dpQ4EyMRZfyECmhgokW9OlZEUCAiF/M
         K2Zp0pX/by115FoNBtGAsJ2cPRkVdeYQsrQjKmpx+vULGq+o6fh1RXMDnEVYuRk8/Hhr
         8/G3AmfZbKraDnh+0PZyyiERJze3kPulOtafvBBSZtHEAnRB5W2q8vZ3c2IVkKCQmpCK
         2M2LBcTqb7Uq8C6YTbjS2D1xIs3fxBg3pLQcuIfpfXIIi/AyhsvXdC/oybeIKkOXfIb1
         8ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759195469; x=1759800269;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atjRbq2Ix0kpQpih72xPV1a5tslbrY8BWtKFpnViPQs=;
        b=ip3Ev5Ccf8odHoIHjG+4ssi8drN3AlgKXiifR2vgIAdQ9vJEPm5Tr8RsNUKmYsZozV
         lrqcEEAkrdq+5opuyaz3427iw6+3e4nF7dvAOCj6wbAH1JUTcB1H78O4y8ar3MRfIhlG
         Fm2M45V2RCKizuHQTNwMvrcJuvHSm8dVwrNKv8DaPp/1yC3cA6ZL50DG/xMiEQjJmI2O
         AXhLZFznA+j6bJbTHC/MUGLmkvY2+jKGjVmv9M8eHNIaymHg4vR7MFLBGPeFNXd/C53p
         TJhm8OulMSQpLSecH3Z3tjy9Kpa6BXkYDaQP0NPZQZguIazALpeHzLkfoWkt455mMrWi
         +joQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfhm9cSVweGwXIwF19ET01uxPyP5L4+r6kd4OMJEmU1TkbLNXJE76ThvJR02Eo+tv6oWyM5XMe3QECtji+qT0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrxYV79QorvbsFx7pcltFJ/kubCrU1g2Yv0SyutwRchluqHMzO
	163kuptsiip7bz02kcQAjDpDTNATAfTx5FRcK2iMI6kzaB8K/gTIGtFvydRzE7qg3KJ+eiuIZpP
	jJl2qpw==
X-Google-Smtp-Source: AGHT+IF0AUjaRoUFbB9ad+iQ92cEe5cg6xNX0XH44Xe7Y4Ue8xeSsrOu4IjOY25U6TTP0/J2T1TylPh/qAM=
X-Received: from ywbnh10.prod.google.com ([2002:a05:690c:5c0a:b0:735:7cbc:a939])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:3608:b0:766:6507:686b
 with SMTP id 00721157ae682-7666507767bmr165283147b3.8.1759195469484; Mon, 29
 Sep 2025 18:24:29 -0700 (PDT)
Date: Tue, 30 Sep 2025 01:23:47 +0000
In-Reply-To: <20250930012352.413066-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250930012352.413066-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.570.gb178f27e6d-goog
Message-ID: <20250930012352.413066-3-jthies@google.com>
Subject: [PATCH v1 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
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
2.51.0.570.gb178f27e6d-goog

