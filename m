Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED936132
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 19:11:06 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id q11so13559376pln.11
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 12:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jo0rr8ZpSLV3qvfVz0KPry1nOi2K/nNJPkdeobJ874Y=;
        b=TlrFMgg0Iz4RdU9/zJvCJydtlUaEdm1Dx1GzEKfdz8n+/zMlFXjX3iTtDwPkf7cP96
         7QCIH/fF850r6VxGxVb1fRE+A8Xw83UKvKdt/oes4mzJp7FLWFhFI61ijIXYIaevTyLb
         Iaet1vwqNWzuzAZlVTZK4jT4Ac6W74FdUo3Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jo0rr8ZpSLV3qvfVz0KPry1nOi2K/nNJPkdeobJ874Y=;
        b=6bZdECnNRadjSbjECxzh2Wftxc5lrVLpgxvppEqXPxs3M5Ql10WaDqcNwJMOYAQsH/
         /R4xvCb0PrUu3I2eSPyuAQAZI5dCxqiuCN6ZwD1ntuo7O4ojSvSM9rwYOWs2EjLrfOX/
         7KDe2g1c8kMOxTvJ9LpP4tynD0SjtcIJVoGXLCs61yRGJK9TepbmT16jmE82r6iULVg5
         XuoLTSG9TmmDhtifptnYNjGNmx8GcUCn2zPjDBrUtduGLawoCG5RN199xDUc5fNMjIPN
         9S0Jkh9QhcXml9YyekR6xRdaj1nieFoCFksasT77Fh3kRz+gEU1Ges7ZP2Ikj7dh+avD
         FA6Q==
X-Gm-Message-State: AOAM533GnIO99w+FeWtoyiia6ztuKEqtKwEPOwT5kGc4ptIgHKwkzg0F
	70BEm1ZysSEpXUMvnG18wAzpFA==
X-Google-Smtp-Source: ABdhPJyTTf34HH9ZLA3L9/IT5iokvHAhZVOENl+IMUqWV3x308aF5Ua1jvXeBcL0FB4/NG6tDowH+A==
X-Received: by 2002:a17:903:11cc:b0:151:71e4:dadc with SMTP id q12-20020a17090311cc00b0015171e4dadcmr14030982plh.78.1647889865770;
        Mon, 21 Mar 2022 12:11:05 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:2ffa:f7a0:c7f5:8171])
        by smtp.gmail.com with ESMTPSA id y14-20020a056a001c8e00b004fa829db45csm3384022pfw.218.2022.03.21.12.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 12:11:05 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Craig Hesling <hesling@chromium.org>,
	Tom Hughes <tomhughes@chromium.org>,
	Alexandru M Stan <amstan@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 3/3] platform/chrome: cros_ec_spi: Boot fingerprint processor during probe
Date: Mon, 21 Mar 2022 12:10:59 -0700
Message-Id: <20220321191100.1993-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220321191100.1993-1-swboyd@chromium.org>
References: <20220321191100.1993-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add gpio control to this driver so that the fingerprint device can be
booted if the BIOS isn't doing it already. This eases bringup of new
hardware as we don't have to wait for the BIOS to be ready, supports
kexec where the GPIOs may not be configured by the previous boot stage,
and is all around good hygiene because we control GPIOs for this device
from the device driver.

Cc: Guenter Roeck <groeck@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Craig Hesling <hesling@chromium.org>
Cc: Tom Hughes <tomhughes@chromium.org>
Cc: Alexandru M Stan <amstan@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_spi.c | 42 +++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
index 51b64b392c51..92518f90f86e 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -4,6 +4,7 @@
 // Copyright (C) 2012 Google, Inc
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -690,11 +691,13 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
 	return cros_ec_xfer_high_pri(ec_dev, ec_msg, do_cros_ec_cmd_xfer_spi);
 }
 
-static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
+static int cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	u32 val;
 	int ret;
+	struct gpio_desc *boot0;
+	struct gpio_desc *reset;
 
 	ret = of_property_read_u32(np, "google,cros-ec-spi-pre-delay", &val);
 	if (!ret)
@@ -703,6 +706,37 @@ static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
 	ret = of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val);
 	if (!ret)
 		ec_spi->end_of_msg_delay = val;
+
+	if (!of_device_is_compatible(np, "google,cros-ec-fp"))
+		return 0;
+
+	boot0 = devm_gpiod_get(dev, "boot0", 0);
+	if (IS_ERR(boot0))
+		return PTR_ERR(boot0);
+
+	reset = devm_gpiod_get(dev, "reset", 0);
+	if (IS_ERR(reset))
+		return PTR_ERR(reset);
+
+	/*
+	 * Take the FPMCU out of reset and wait for it to boot if it's in
+	 * bootloader mode or held in reset. This isn't the normal flow because
+	 * typically the BIOS has already powered on the device to avoid the
+	 * multi-second delay waiting for the FPMCU to boot and be responsive.
+	 */
+	if (gpiod_get_value(boot0) || gpiod_get_value(reset)) {
+		/* Boot0 is sampled on reset deassertion */
+		gpiod_set_value(boot0, 0);
+		gpiod_set_value(reset, 1);
+		usleep_range(1000, 2000);
+		gpiod_set_value(reset, 0);
+
+		/* Wait for boot; there isn't a "boot done" signal */
+		dev_info(dev, "Waiting for FPMCU to boot\n");
+		msleep(2000);
+	}
+
+	return 0;
 }
 
 static void cros_ec_spi_high_pri_release(void *worker)
@@ -754,8 +788,10 @@ static int cros_ec_spi_probe(struct spi_device *spi)
 	if (!ec_dev)
 		return -ENOMEM;
 
-	/* Check for any DT properties */
-	cros_ec_spi_dt_probe(ec_spi, dev);
+	/* Check for any DT properties and boot FPMCU if applicable */
+	err = cros_ec_spi_dt_probe(ec_spi, dev);
+	if (err)
+		return err;
 
 	spi_set_drvdata(spi, ec_dev);
 	ec_dev->dev = dev;
-- 
https://chromeos.dev

