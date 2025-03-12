Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260511EC012
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 20:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741809619; cv=none; b=MIYzOu3qX5riCD1mQickeGa+tSnWPFM3zwT/2dBC3ps4na6Lg46cUMfUCO2++nVJy/muYWPmazygGff31Hzz49FA2bXJr+QVB5LHADQczIPyWAIJT5S8ai1yKIMzE5hOX3M3lsBi3hndpzIUIqSUTNP8eL+WOFbFVjZoNXHWURI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741809619; c=relaxed/simple;
	bh=0GWy3rp0F7KpgF0wRntfFfUSkJ3mXo1eZ4Tv31fz+NU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ARja3jSM/n7OXCbPE+Ktm/ITpaQ+2TS3TMT/CQT6RGEJQnT9Y9u/1MKDUlyYwZKNkvDw+dTNJyj6uKXqVBkn9u5pmniY/AXspm9avO12kmlYW2GkdS04W3PUEq7ziQo6DOXB1aMhtC/e6qTsVE7+6bxAb5hlJaGnwdiBkXicWpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rZooeoAH; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rZooeoAH"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2242ce15cc3so3312595ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 13:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741809617; x=1742414417; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VDEU9Q/7+kilAtJ4k6780hVL8+VoEsG1QL4aEk8tmxQ=;
        b=rZooeoAHCunQF+C2jLVEAlpCtk6gpauVJ40dGdLkToqHlgk8QxAW5ym45pNtXbRILO
         DamHU7zcuGdBDrGbYTICVyOMEylzuEaJpe9fUxi2JLW4kYRfBWYXqOvrRnO2UAKYGM7u
         QEA/QKoT5WrBgDEVvDG8E+bCOoDKcsqOotZI2eOLBXcY8wU4J51S7DJIGCP8O62JNWlv
         E26RMisq/bL47DiD4e6AXImAlF1e8c/z3Aymv0m86mMAZBBw09DQIiG5OkSxumjYoY/R
         qSUaQk/J6sf9xvAoU5uSr9SSebvmXD79fwmdWU7oEP4pBvGV6Ce42whpcHtKuESuwujz
         AHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809617; x=1742414417;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDEU9Q/7+kilAtJ4k6780hVL8+VoEsG1QL4aEk8tmxQ=;
        b=avk3j9WatjJS0zGrQk+lGjlZKAH8h7ug7WBLwa4LMmxUPu132Y8n334BtsQmiW7mJE
         mkLdxk7HsPv83dlQZjzuu5q4NwRVheknVuUb+NSytKNKMK2XADpRC95MUGwXMCuT4f7Y
         xdysPLqaOS9lewQlW7h8LJ2OFiCsb2T+6hLFroQ1qzArV782APiKfOIwbo2J0me0m6s4
         xi6VfNaZjPnD6siR86A7tEovn5t7aDQNBiR94P5tBg41koBia92sDLbBM/WWKcVIMtsR
         6YYbty/TpmvtWKVjNVz7TJ9WriAZ8zCe5FRHraXSjq4XgQ3mGr5ZbP+sAsz4TIIOYagU
         a26w==
X-Forwarded-Encrypted: i=1; AJvYcCWoV8gyE0MKXljkFlyT1qDKuvohuxvugBfsIBpx4P1rpgeLpXhUYzrFnEGc8acqO6gBjBvJaXKooHRVEbzShtQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwJHAdg9aFLf7nzkomJeWQSSi1Tk7rQRUAhmuP8pvrY3LLwWJQ
	525ZYilm+ih1LEjd1Megjb+VtaDNq3NgcuRolwr1hljA8R0I098sEsKR5DxrrNGmtc+HSOyz1Qx
	g8w==
X-Google-Smtp-Source: AGHT+IG+7wN0jLCNhozwudp+CmZ2bIOC2JWCQMC5PPVbBuF1mi37k+/+m0ELnNvF8x64iohsHTAqLd5wRsg=
X-Received: from plbjy16.prod.google.com ([2002:a17:903:42d0:b0:223:37b7:2388])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:234d:b0:220:c34c:5760
 with SMTP id d9443c01a7336-22428c240demr280258275ad.51.1741809617329; Wed, 12
 Mar 2025 13:00:17 -0700 (PDT)
Date: Wed, 12 Mar 2025 19:59:11 +0000
In-Reply-To: <20250312195951.1579682-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250312195951.1579682-1-jthies@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312195951.1579682-3-jthies@google.com>
Subject: [PATCH v1 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: tzungbi@kernel.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org, swboyd@chromium.org, 
	akuchynski@chromium.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
compatible devices and "GOOG0021" ACPI nodes.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index c605c8616726..d916893b8908 100644
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
@@ -226,7 +228,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *udata)
 static int cros_ucsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
 	struct cros_ucsi_data *udata;
 	int ret;
 
@@ -236,7 +237,14 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 
 	udata->dev = dev;
 
-	udata->ec = ec_data->ec_dev;
+	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode)) {
+		udata->ec = dev_get_drvdata(pdev->dev.parent);
+	} else {
+		struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
+
+		udata->ec = ec_data->ec_dev;
+	}
+
 	if (!udata->ec)
 		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
 
@@ -317,10 +325,24 @@ static const struct platform_device_id cros_ucsi_id[] = {
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
2.49.0.rc0.332.g42c0ae87b1-goog

