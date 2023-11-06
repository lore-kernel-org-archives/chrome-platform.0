Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6692029420
	for <chrome-platform@lists.linux.dev>; Mon,  6 Nov 2023 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r03ES-0005QV-28; Mon, 06 Nov 2023 18:17:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r03ER-0075yL-Lk; Mon, 06 Nov 2023 18:17:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r03ER-00DrIp-Cr; Mon, 06 Nov 2023 18:17:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 02/18] mfd: cros_ec_dev: Convert to platform remove callback returning void
Date: Mon,  6 Nov 2023 18:17:11 +0100
Message-ID: <20231106171708.3892347-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
References: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LCw3bj2aWliMJeRhvUQKWZ55KhVQThCiahgEmDcwN4c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSR+WcxZ+4UCl/GvDKW8mubt9953vOUXfszBV1 wxXWkcEyzCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkflgAKCRCPgPtYfRL+ TiREB/4kWsYQRmP0otyW3G2NEmZg3ZVs2O8juB6dL96i6NfV/rgbFVRCQonBUwBVCorEAtsynPs eghVQCc3smqLpGrVQIVphKAv4RkjE4DPFrevxjQjxlAuCX07cRYlK9co8q7Tijytij6iH6vnfgd gfCqgAuWWA8g2Pfqjs4kKiCO1r0LndYVXeLkYfbOQ1aUtxTwETA8XtC0gDM53M9SXULtFGAVxAR OrazOLbm0TBGi44DHa+cgOPSCRm6k+x9AztRIC/hW9C9xK98jxSv+jlv0fpIgOGp7sH3wZ8joga K2+viDE6xNRz53FRS9+ROlpJ3VXUbpML8Al9nGwRqcjoFstE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: chrome-platform@lists.linux.dev

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mfd/cros_ec_dev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 79d393b602bf..603b1cd52785 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -288,13 +288,12 @@ static int ec_device_probe(struct platform_device *pdev)
 	return retval;
 }
 
-static int ec_device_remove(struct platform_device *pdev)
+static void ec_device_remove(struct platform_device *pdev)
 {
 	struct cros_ec_dev *ec = dev_get_drvdata(&pdev->dev);
 
 	mfd_remove_devices(ec->dev);
 	device_unregister(&ec->class_dev);
-	return 0;
 }
 
 static const struct platform_device_id cros_ec_id[] = {
@@ -309,7 +308,7 @@ static struct platform_driver cros_ec_dev_driver = {
 	},
 	.id_table = cros_ec_id,
 	.probe = ec_device_probe,
-	.remove = ec_device_remove,
+	.remove_new = ec_device_remove,
 };
 
 static int __init cros_ec_dev_init(void)
-- 
2.42.0

