Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A31030E82E
	for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 20:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387661; cv=none; b=sZdhMakDh/Xp+t+3EkZHUWzeOvYsafZMQXQA4sAb3ggToy+ViFMWZUTlJLuUVhtlrYrQRapGwkFzBBgVTJFLbsJokfJTcdjyQGm0XzpUi4QFAH+XZu0B/CpH6xDBzQQMWrhgSx4tlcYJpEurE5ykWckL/73TimcHtgug0rZSTBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387661; c=relaxed/simple;
	bh=AW0V5P1Mf/cKqSJ4kn7YwKqdZhOe9eDE0D37bytSyik=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ga2O4bt1Z5m7plHSUwiW16WqndBVH1eqlJFg0xur6HenJNT3tX/Nd1aeZaMial7LtjqfNJCmq/yLnSq/pnpeEXnfkiCxw1ZHDCdclFbagzhnf5O8t83r3VpkenRHR1WwAY1fJxkRg0Vst29t63kP+ainRvSWmjFlDQokocsfMTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k2zyjmrt; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k2zyjmrt"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-286a252bfbfso209807865ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 13:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760387659; x=1760992459; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fRIxa/UzZYfGbKZJakrsYtqcVLritJ5Q3FH0o00R8uo=;
        b=k2zyjmrtEzuPEgMmCJQS7vaZXvLZPibpXG91ZppI1do5GbUqgCNuOBfSgg2leiiGzL
         Am3O9c61Rm6pjOhZKYllMQuQmXshJvV4W7lmnN7vnuC17Utavf6gL6Db8S1YEiVVgQEt
         GkJ9LKjJG/G7EJV4DoYSH78V08wFklhA7fQKodOyM+EbUFhbkmXYX3Du88jQJuMinJRy
         rQx3YYSRjOb/XxKNRAGWEWHBiWyjIYzpuiorML79Tx9PHtVJpMLhBA+XEsMSiKpoveKZ
         c2MEGxxidtZjF9bpcF8hzkHZK/a0M70lbPr3H4X7lyhX7yObzqWamjB7f8hJzrJdkPEn
         2xXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760387659; x=1760992459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRIxa/UzZYfGbKZJakrsYtqcVLritJ5Q3FH0o00R8uo=;
        b=F10wTxzrk+WB4GdfSs9tMPffxtYALKXMxRjJBWVr89ONXDcW3DBNaVlJWWxmK8R/an
         4kllxVWDMIomnpE9YdMWjfDHXnBl8l8j+pxyJk/OvfnQhCVHoNYmrNakAKTvmlHjP/3x
         GjnwOPrg2rkrCpscyroOhnWT/mWObdRnEg3UUqThHkzOcGmIUoIuTLDi+4pWYaSQ0VSJ
         VRCtSyiv08E1VMcMVsN/vUAjHTUF9Td4mhVGIDTTTFVUZA99jDd07CRUGBoCzwoRsLzB
         qS7Nbdf9n59sWGlq8+r7Ifr/xly+6+F4ujWK//pCkZe0NQyGlCmrb7cOATMWSVYo6ZCm
         /W9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/gWrnrC4VnwqHVQSnc09UMD2I0gq9MsXbM7isOjdyOdnfR3qiDggG02g7FsWobmG2++OXP8zEXCOZ4RKN+Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yww26CcTMi4ArNPI1zE9DFJQggzbM1dzSobkCg57qt54uS6CmlC
	C+KdpilEM3+5sFCEn+pG+uq7TZJzqBIuGaFYZtEGaa7ah/MfbPtUMV2J8Z4Zrq6/Fc1PrXqo36b
	zNRgdMA==
X-Google-Smtp-Source: AGHT+IGfxe1pre0Ru6WgDcMEJLC2GoGSa7ujgL6qXJIB7Yn79ai4Bf73VFPBxmxv5ikoVklpodNHzkq0LDc=
X-Received: from plvv9.prod.google.com ([2002:a17:902:d089:b0:28e:804c:cc96])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e786:b0:26e:7468:8a99
 with SMTP id d9443c01a7336-290272c18e1mr271502235ad.36.1760387658511; Mon, 13
 Oct 2025 13:34:18 -0700 (PDT)
Date: Mon, 13 Oct 2025 20:33:26 +0000
In-Reply-To: <20251013203331.398517-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251013203331.398517-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251013203331.398517-3-jthies@google.com>
Subject: [PATCH v4 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: dmitry.baryshkov@oss.qualcomm.com, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, krzk+dt@kernel.org, robh@kernel.org, 
	bleung@chromium.org, heikki.krogerus@linux.intel.com, ukaszb@chromium.org, 
	tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
compatible devices and "GOOG0021" ACPI nodes.

Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index eed2a7d0ebc6..0c19ba84d11c 100644
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
@@ -235,7 +237,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *udata)
 static int cros_ucsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
 	struct cros_ucsi_data *udata;
 	int ret;
 
@@ -243,9 +244,16 @@ static int cros_ucsi_probe(struct platform_device *pdev)
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
 
@@ -326,10 +334,24 @@ static const struct platform_device_id cros_ucsi_id[] = {
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
2.51.0.858.gf9c4a03a3a-goog

