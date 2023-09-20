Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ACF15AE6
	for <chrome-platform@lists.linux.dev>; Wed, 20 Sep 2023 12:58:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiwmt-000589-Cy; Wed, 20 Sep 2023 14:58:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiwmq-007gyT-Cc; Wed, 20 Sep 2023 14:58:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiwmq-003ICY-33; Wed, 20 Sep 2023 14:58:36 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	=?utf-8?b?am9ld3UgKOWQs+S7suaMryk=?= <joewu@msi.com>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 02/52] input: cros_ec_keyb - Convert to platform remove callback returning void
Date: Wed, 20 Sep 2023 14:57:39 +0200
Message-Id: <20230920125829.1478827-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1871; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OQAF2qHJlA9KLKk3dP+DprpXVKIrGZ6sgkYNptMGDH8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCuw1aRq26N6/CbIta7xEsZog2xli0BLq0OUjI 3oYKrm2SBaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQrsNQAKCRCPgPtYfRL+ Tn4KCACt5khoPHqdccJ9xpNL4578bL/MwxIHsczffxv00SF19LNh20bkE+f/y/dbNzxmsM7cDUZ XHhylbrNkdLmoV9VUx3QQNtXv++3Az6JJO6wCgzl2smJhNyvSE8PDgqE2Mff09OAx+SeyNUn8r3 ca0dq/izKuTSpEpczvYPD/3iCQFMfu1Q1Mq9qGDfyDLsUhB43eS4reStsCt2kj+IRn/FvzirfJo z2LbhJ5AFUzXZoGK66GwvG6Ucz3N57uPbs4tpKrVilVMB7kXxc0tKHUWovsAXUZF/v6iG/HzHcG P0JxThUCk385mg5xBe/ttLc7XRfVlpKgigyVEwhPaZU0Ci9r
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
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/keyboard/cros_ec_keyb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 313b7a69dd69..30678a34cf64 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -743,14 +743,12 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int cros_ec_keyb_remove(struct platform_device *pdev)
+static void cros_ec_keyb_remove(struct platform_device *pdev)
 {
 	struct cros_ec_keyb *ckdev = dev_get_drvdata(&pdev->dev);
 
 	blocking_notifier_chain_unregister(&ckdev->ec->event_notifier,
 					   &ckdev->notifier);
-
-	return 0;
 }
 
 #ifdef CONFIG_ACPI
@@ -774,7 +772,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(cros_ec_keyb_pm_ops, NULL, cros_ec_keyb_resume);
 
 static struct platform_driver cros_ec_keyb_driver = {
 	.probe = cros_ec_keyb_probe,
-	.remove = cros_ec_keyb_remove,
+	.remove_new = cros_ec_keyb_remove,
 	.driver = {
 		.name = "cros-ec-keyb",
 		.dev_groups = cros_ec_keyb_groups,
-- 
2.40.1

