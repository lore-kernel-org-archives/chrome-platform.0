Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E9C33D515
	for <chrome-platform@lists.linux.dev>; Fri,  3 Apr 2026 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255662; cv=none; b=F9qMNhU0iYjS+0Th9Tj1hNayce+BMFBR3ofl8G324VJIUCdAFU5uU0AUXia22ip42Brwu8L2WzUPVqv7tsxIpZ8SooCueZkUVxqLwM5B4vRlXN6lFukNa9UxmEqXMWxQ+SfT4yCpbO4cgwKnfTxGmUOlfFOYsy0G9/OWHtt/P9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255662; c=relaxed/simple;
	bh=dvntkxxmMie+ddQCkiP2EwdOS56VxGjSqZlx8z6hx5s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lWoGaxEsh/maPz8dD8IJM2bXkfaStHiK8PyUBZTBxy+qXbzXxI958x4h1rBrqssXhhikX6m+bYWOxD1r3F64JZLnOs5E4legGEHdE6B4AdHO4CJrJSthAhmaa0ke4N/CR0QLCWD7nTmBXxM5IKQnouDTZ8HFe2bJqERYL5zyGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f+1oue+D; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f+1oue+D"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-12721cd1a2aso11847775c88.1
        for <chrome-platform@lists.linux.dev>; Fri, 03 Apr 2026 15:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775255660; x=1775860460; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc81YdAjdlIvoqkBdkIORHlgXU4Am8QfAVGQhkBrGE0=;
        b=f+1oue+DGfel2uhFk2Fvc7ht7lVUPj8ymBRVOhxgHNaoklFooYqeJ3K4sfWEvId0hE
         NZWdswQS6PhA3fFPR5X6lfc6yQr13tBt+m2UcAcuLFWQsfrYCCs86P3bwbmeGEY/nHM5
         Tba0BdOUBxgrC53Z4Yfudgw+XKcawqUGRWkl7c+CurjydybAHEa2hUE1CG25MIYy8O9D
         pP/TunRJEAiV5GM/5DY0sHwCAOWfKnLKyLJucAEs1R5GSwoSkmjPzZ3YR/aXzDkzDNYi
         M/gQo2WOHIOmnCNgVay2m7iahUwFRlGAnWJ+mzb4nVqfihiPJJvGALhefU0d8GQRHUEG
         gUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255660; x=1775860460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc81YdAjdlIvoqkBdkIORHlgXU4Am8QfAVGQhkBrGE0=;
        b=l5VunOQTVIq/6Z1OPFHSo0xbv1Mf2qFV/37zSBKPs13PMU627USMe4umx8Zbc/P8Ra
         gO4Wz+rxH5uuzd0+SNf/lDYc16exS4D1kzgdbLatsk2lMzawoKCf/cxyMBg+E962o9B8
         TQNPGOtJ7sJcGFrdJ8qdfGXCzT7BvoeklZfbU3bJPRl+mhwVV4Xt71PCqOBWujR9ak+q
         0SUO2wm9TKTyImkKp48/P2FuU8pkOZyndYzikclMDm5P7NlquELN1OZ3nzu2A988iDoX
         fEnxPQTtmtye9UMEuXXw8RLQpMOv8FMFQJBlAREoQeFBJ0hIBwEqRES/b4HgCoCNOgbB
         TX0g==
X-Forwarded-Encrypted: i=1; AJvYcCXlUl7OmR9AqWJ2qsRmZV/FIF+h8nQrV/9Mu0a7Lo676DnV4TbYm+sbOZWXBXVMC6Jb7BOMQPQVXzfeRVW6vzw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3Q/qE8rVXZBJTFkLOHTwVV+MQzXixnJ9+BTC5D2j0k/NzB8Oj
	GbobySQLU2NDPr4mRSpNNHsG8TeYcEgn56O5Jg8BxQ0SvISQMNAh71OxaCZweEd1V8J3sNPJDhd
	1bQDJug==
X-Received: from dycc2.prod.google.com ([2002:a05:693c:60c2:b0:2c4:d97b:c1a8])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:90e:b0:123:34e8:aec2
 with SMTP id a92af1059eb24-12bfb6e8e9dmr2211753c88.1.1775255659929; Fri, 03
 Apr 2026 15:34:19 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:33:27 +0000
In-Reply-To: <20260403223357.1896403-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260403223357.1896403-1-jthies@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403223357.1896403-3-jthies@google.com>
Subject: [PATCH v1 2/2] usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	abhishekpandit@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
compatible devices and "GOOG0021" ACPI nodes.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 6bca2dce211c..251aa7251ce6 100644
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
@@ -257,7 +259,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *udata)
 static int cros_ucsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
 	struct cros_ucsi_data *udata;
 	int ret;
 
@@ -265,9 +266,16 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 	if (!udata)
 		return -ENOMEM;
 
+	/* ACPI and OF FW nodes for cros_ec_ucsi are children of the ChromeOS EC. If the
+	 * cros_ec_ucsi device has an ACPI or OF FW node, its parent is the ChromeOS EC device.
+	 * Platforms without a FW node for cros_ec_ucsi may add it as a subdevice of cros_ec_dev.
+	 */
 	udata->dev = dev;
+	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode))
+		udata->ec = dev_get_drvdata(dev->parent);
+	else
+		udata->ec = ((struct cros_ec_dev *)dev_get_drvdata(dev->parent))->ec_dev;
 
-	udata->ec = ec_data->ec_dev;
 	if (!udata->ec)
 		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
 
@@ -348,10 +356,24 @@ static const struct platform_device_id cros_ucsi_id[] = {
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
2.53.0.1213.gd9a14994de-goog

