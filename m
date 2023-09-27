Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B11D520
	for <chrome-platform@lists.linux.dev>; Wed, 27 Sep 2023 08:11:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPdB-00081z-8y; Wed, 27 Sep 2023 10:10:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPdA-009I7T-6z; Wed, 27 Sep 2023 10:10:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPd9-005BQk-Tu; Wed, 27 Sep 2023 10:10:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Zhengkang Huang <zkhuang@hust.edu.cn>,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 11/27] platform/chrome/wilco_ec: debugfs: Convert to platform remove callback returning void
Date: Wed, 27 Sep 2023 10:10:24 +0200
Message-Id: <20230927081040.2198742-12-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bdoY/EtxbzwGac07X7QaXwCA5t1k2AQDGRrpm1QXcFY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlE+NqvJA6HQaG3wjrRzTg5qUXDxciOD4p/u8Io H+ZbLvmskiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRPjagAKCRCPgPtYfRL+ Ti+cB/oDTY0N5rzLT7v1Lf+32NNSBMke3xMTEuFylY+/55IpS3H8pe0o6vOI7lxiG1ZAQFHzcdq xgG+BVpp+Knl/ZtIoU5KeOpLhVIxrHBN0Ct+2h6jKH0ibrwaAsJm9t5ps/8XaRF9kYr5UdtkDrv F0E2JTIfg28prv/MpX/AR5b3ceFq8tVw79lWPCP1fwMeJYX2DGJvdj+i7BvX2pZA7zCuLjnH2x8 WYaUlZPkPxZ5xqwf50GXR2e0RdfZszlF+GjUkU/gK1YQH7yOGSKG30uyPsdIQKSkSaZn6TKVSIm 53KsZkhiRVIlIO3FS14kTK/s0Z0f89vQucQdWt9DdxB9cJTi
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
 drivers/platform/chrome/wilco_ec/debugfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/wilco_ec/debugfs.c b/drivers/platform/chrome/wilco_ec/debugfs.c
index 7a13f13b16cd..93c11f81ca45 100644
--- a/drivers/platform/chrome/wilco_ec/debugfs.c
+++ b/drivers/platform/chrome/wilco_ec/debugfs.c
@@ -260,11 +260,9 @@ static int wilco_ec_debugfs_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int wilco_ec_debugfs_remove(struct platform_device *pdev)
+static void wilco_ec_debugfs_remove(struct platform_device *pdev)
 {
 	debugfs_remove_recursive(debug_info->dir);
-
-	return 0;
 }
 
 static struct platform_driver wilco_ec_debugfs_driver = {
@@ -272,7 +270,7 @@ static struct platform_driver wilco_ec_debugfs_driver = {
 		.name = DRV_NAME,
 	},
 	.probe = wilco_ec_debugfs_probe,
-	.remove = wilco_ec_debugfs_remove,
+	.remove_new = wilco_ec_debugfs_remove,
 };
 
 module_platform_driver(wilco_ec_debugfs_driver);
-- 
2.40.1

