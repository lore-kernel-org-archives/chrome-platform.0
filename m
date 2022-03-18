Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F111715C0
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 01:54:56 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id mr5-20020a17090b238500b001c67366ae93so4751012pjb.4
        for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 18:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rxw3CHXEYejW4ccJG856QD+F55RYD67woHuYROci7qY=;
        b=gdTMA0vCi7X9A9ohLapQh8US+e2d60RkEr7Ib9edeaFroKoB6x/9n4A2lU7+WQAyHN
         RG3T/kFfoEUYbF+516owpmIn1SCozFbWiENSEdpZZy9ic7B3fct2h/MsymuMu6CSprIN
         vvMEKt/rUdC02qRyHrDTf7YBzfefl9DjJ/0Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxw3CHXEYejW4ccJG856QD+F55RYD67woHuYROci7qY=;
        b=S8HoFM6cX/1SiE8noVy0eAnAhTwo7gDX5KPgHGMjawpG4LVx7dwVZR3B277KIcCDXB
         BIjt/YKhNY88txrl6gJxNnEfrsTLC01dqwsreYeasoQi8uYXDxdMQpx326K4IZlXowzc
         +8flHtn+iW28F+r04VGRykokZEuvE9vu282oV2fxnX8QU+NgRtQEWKuLyeHmQnEmLcGm
         rCGWCtKakFc2vTYOa7nyl56ArkbHg4t7fA/uvyFL8dltW5Xb5UG/VrpKxFiDH1HHJkCm
         kkP6vCiDE3Fr0MTNSj5rsN1E7ydRqtbRqcTmGfxDSeLFCmI69kEusrjF9XxVLfGu4Q16
         Rg7Q==
X-Gm-Message-State: AOAM531sBNted1DEMaHFDXh39A0nXV6an+Xq/80phf5T5I+xgcgbNEM/
	9W3eaq4SM0PExtA6aMtB23VqKA==
X-Google-Smtp-Source: ABdhPJzsh0bkMdgCWzUa/NDTDzi6Tr0Yq5+hHOgXzbSg+iFkiCEFp5CxVi6Hfu8LOVgcVvbVf8NmmA==
X-Received: by 2002:a17:902:f686:b0:151:d866:f657 with SMTP id l6-20020a170902f68600b00151d866f657mr7708777plg.112.1647568496456;
        Thu, 17 Mar 2022 18:54:56 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:49cf:7701:359e:b28f])
        by smtp.gmail.com with ESMTPSA id u10-20020a056a00124a00b004f783abfa0esm8050201pfi.28.2022.03.17.18.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 18:54:56 -0700 (PDT)
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
Subject: [PATCH v3 3/3] platform/chrome: cros_ec_spi: Boot fingerprint processor during probe
Date: Thu, 17 Mar 2022 18:54:50 -0700
Message-Id: <20220318015451.2869388-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220318015451.2869388-1-swboyd@chromium.org>
References: <20220318015451.2869388-1-swboyd@chromium.org>
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
index d0f9496076d6..13d413a2fe46 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -4,6 +4,7 @@
 // Copyright (C) 2012 Google, Inc
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -77,6 +78,8 @@ struct cros_ec_spi {
 	unsigned int start_of_msg_delay;
 	unsigned int end_of_msg_delay;
 	struct kthread_worker *high_pri_worker;
+	struct gpio_desc *boot0;
+	struct gpio_desc *reset;
 };
 
 typedef int (*cros_ec_xfer_fn_t) (struct cros_ec_device *ec_dev,
@@ -690,7 +693,7 @@ static int cros_ec_cmd_xfer_spi(struct cros_ec_device *ec_dev,
 	return cros_ec_xfer_high_pri(ec_dev, ec_msg, do_cros_ec_cmd_xfer_spi);
 }
 
-static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
+static int cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	u32 val;
@@ -703,6 +706,37 @@ static void cros_ec_spi_dt_probe(struct cros_ec_spi *ec_spi, struct device *dev)
 	ret = of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &val);
 	if (!ret)
 		ec_spi->end_of_msg_delay = val;
+
+	if (!of_device_is_compatible(np, "google,cros-ec-fp"))
+		return 0;
+
+	ec_spi->boot0 = devm_gpiod_get(dev, "boot0", 0);
+	if (IS_ERR(ec_spi->boot0))
+		return PTR_ERR(ec_spi->boot0);
+
+	ec_spi->reset = devm_gpiod_get(dev, "reset", 0);
+	if (IS_ERR(ec_spi->reset))
+		return PTR_ERR(ec_spi->reset);
+
+	/*
+	 * Take the FPMCU out of reset and wait for it to boot if it's in
+	 * bootloader mode or held in reset. This isn't the normal flow because
+	 * typically the BIOS has already powered on the device to avoid the
+	 * multi-second delay waiting for the FPMCU to boot and be responsive.
+	 */
+	if (gpiod_get_value(ec_spi->boot0) || gpiod_get_value(ec_spi->reset)) {
+		/* Boot0 is sampled on reset deassertion */
+		gpiod_set_value(ec_spi->boot0, 0);
+		gpiod_set_value(ec_spi->reset, 1);
+		usleep_range(1000, 2000);
+		gpiod_set_value(ec_spi->reset, 0);
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

