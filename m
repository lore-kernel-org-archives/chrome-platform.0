Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F914A4DB
	for <chrome-platform@lists.linux.dev>; Thu,  9 Oct 2025 01:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759971803; cv=none; b=hHLaSJRxPYz6EF5j3ebv9Je/reMoI2zOaQXPhhqooblShTQtWoiGvMF4gqSAzfKNW3ix+w1heo4DLHRoQwTiAkVtZce5xeJ59BxDbyaNTNIjGoxpRazta4r0p66+WRki/NfwpDk+Lg2gdRy2QUVg7Cn8C29eKDDjlGTfR1OYr+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759971803; c=relaxed/simple;
	bh=tSONzkd/O/+rs+POwDj3o16Z3uPD6VSUJul2FCsIGzM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sahuib5VsJbB9XU+iju8MmY/SQ/Jo3vbqMg8ClkkK73zsRueW5z8k6H/RuS3OL6HTTxuLSOUYtDRC/SjL29nlbUvrzArc2rDJ1Ia26ackGoOznVeFzgsRvbzofdY64FkRPHVHF8fmg1sUtrAKaIKtU2p+v9xPipRd23czyhuERQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UVWNN/ly; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UVWNN/ly"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b57c2371182so468272a12.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Oct 2025 18:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759971801; x=1760576601; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g/4YIFu4sS9h/R2pTNo5KqxfeVEIXuxRpdzIrSZfq5Y=;
        b=UVWNN/lyo3EuOS+RZOy8cXWxw3vdpJuZblLfCR1WAnc4ZbQ0Ey3WJKC36njsfgjuxM
         t9CGcs7jKlwc7iOEZ7BHE0INVAGhPYYD9EVxPxPOtsXFO3REnQPIiiGypMehzA1ljEiJ
         8PN0rF2lM62dFPv0SGvxG/9LDB9xHmIIcs2EtV49azV0eqpYLOpUgTtNSd183W5+CFhW
         oCbSZukoR8HED2Y+KdNgVchjiTo6GsXfYC7pq0h6RTTQFZbmkHfIeOTsbpFKH49yVleL
         hm12OUQRdRCXba9got5ydnel5176HJgqdFvXpmBKb1IvFfeWpO+1nbkF0VJqF4p3EkDM
         uMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759971801; x=1760576601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/4YIFu4sS9h/R2pTNo5KqxfeVEIXuxRpdzIrSZfq5Y=;
        b=Y1+YVf7eo1KaJ0BmVBGIYwkLs/bVEsGo2g3v5wbW7i/fP6nkq0xXfLfDo9K8T0NI3Z
         qu5tAgS8qIV9zU+T0LJ0wofB/5j8VY2WNVcPLjGK91GdjgPk+CdJwWONkb0+7TpgVN32
         ZGaZRW6gMk6Gf/AFAmPOEXDi5UNxex2JKub2AKXbRcWHGJFiQTPRS4NJ/rcXKArTPfTZ
         jnkB2Myx5u0pTvAAAqlTaOASXILf2byU+7v1JEdd1fzH1pA3Ki9eDMOJXV3Ku50ktNP1
         NPQ/QPhuCSiXzeSdALdrr7syFmo/TYumdvRpyDffUlKUJjlb92b/QEuLKmvXlcGEM7Gd
         CJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSBphL94odoCowQQBjH4Q0hv1MMQdqPY2mBK2e0xjkslkdRPh8itBc6WpWROESieQYOhkGn7BuC5q2c+d0HCA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPG/4P1aWv8ooI/vAtj1/xmHkrjgV2f/z83K5NtztCZ4+Su0w7
	Ah9WSkKqwFUnM4RdwOyHyIPzoyWaJid+ZpvVj0FbQb1DY0Nykd5DUCl3VRLb9w33zm76h9Z6L7k
	GvdzFpg==
X-Google-Smtp-Source: AGHT+IHp9lhngu8Gcn0L1T1mTc3AnO+MfrO5+f6Ss5kpMxPs3s4Tw2S+ucM0AiCl634GfbIg65sr8/46cQg=
X-Received: from pjbbt21.prod.google.com ([2002:a17:90a:f015:b0:32e:a3c3:df27])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1e0a:b0:334:cb89:bde6
 with SMTP id 98e67ed59e1d1-33b51105dcemr6509867a91.4.1759971800738; Wed, 08
 Oct 2025 18:03:20 -0700 (PDT)
Date: Thu,  9 Oct 2025 01:03:07 +0000
In-Reply-To: <20251009010312.2203812-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251009010312.2203812-3-jthies@google.com>
Subject: [PATCH v3 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
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
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index eed2a7d0ebc6..62b80ad85a68 100644
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
 
@@ -244,8 +245,11 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	udata->dev = dev;
+	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode))
+		udata->ec = dev_get_drvdata(dev->parent);
+	else
+		udata->ec = ((struct cros_ec_dev *)dev_get_drvdata(dev->parent))->ec_dev;
 
-	udata->ec = ec_data->ec_dev;
 	if (!udata->ec)
 		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
 
@@ -326,10 +330,24 @@ static const struct platform_device_id cros_ucsi_id[] = {
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
2.51.0.710.ga91ca5db03-goog

