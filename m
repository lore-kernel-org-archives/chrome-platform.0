Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2D91D557
	for <chrome-platform@lists.linux.dev>; Wed, 27 Sep 2023 08:10:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPd9-0007vx-Hi; Wed, 27 Sep 2023 10:10:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPd9-009I78-4c; Wed, 27 Sep 2023 10:10:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPd8-005BQP-Rv; Wed, 27 Sep 2023 10:10:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 06/27] platform/chrome: cros_ec_vbc: Convert to platform remove callback returning void
Date: Wed, 27 Sep 2023 10:10:19 +0200
Message-Id: <20230927081040.2198742-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230927081040.2198742-1-u.kleine-koenig@pengutronix.de>
References: <20230927081040.2198742-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=pRAFLcjtBRkjAHFm0hdN5Z1Edd3V/IN+r+RHfA3N/cI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlE+NknKE5ENkvfTD1DnSisbqpVw7SmCWcyCB/y o/2TihxkEqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRPjZAAKCRCPgPtYfRL+ TphwB/90LVptfTjJ6jikR/SzCxT9BZNEfHxziPKECJUhxG8bsif93ilg1HxOl+2mCRXa44k7z/J M84fKFNYRo8WFJs7J2HOQWAMiDtxcOsVNo/ts6rSI4qbuHJJsFITqtnHsZyWxViKWNiBtj4P9M9 HUanRLmZ2V+A3UfSypt3uk4/Opel6bK20O6U3KGaB1x22/HWnPk93y7RKPAwuFqpirhMmsWGD0R +Rfd97eGQQKVwRpkGJyT2cZiZbq7ACAGUv9JYCgVIsHpLDbKZx43Ddi/X349LJZZJeSkUvF5pHn BC6QZl3O1zz0JnsKRweYCxF4pMG3fM27dc+Jxe9KtJBZWZYy
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
 drivers/platform/chrome/cros_ec_vbc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_vbc.c b/drivers/platform/chrome/cros_ec_vbc.c
index c859c862d7ac..2e4af10c7679 100644
--- a/drivers/platform/chrome/cros_ec_vbc.c
+++ b/drivers/platform/chrome/cros_ec_vbc.c
@@ -121,14 +121,12 @@ static int cros_ec_vbc_probe(struct platform_device *pd)
 	return ret;
 }
 
-static int cros_ec_vbc_remove(struct platform_device *pd)
+static void cros_ec_vbc_remove(struct platform_device *pd)
 {
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 
 	sysfs_remove_group(&ec_dev->class_dev.kobj,
 			   &cros_ec_vbc_attr_group);
-
-	return 0;
 }
 
 static struct platform_driver cros_ec_vbc_driver = {
@@ -136,7 +134,7 @@ static struct platform_driver cros_ec_vbc_driver = {
 		.name = DRV_NAME,
 	},
 	.probe = cros_ec_vbc_probe,
-	.remove = cros_ec_vbc_remove,
+	.remove_new = cros_ec_vbc_remove,
 };
 
 module_platform_driver(cros_ec_vbc_driver);
-- 
2.40.1

