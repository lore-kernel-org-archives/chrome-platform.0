Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89AB1D524
	for <chrome-platform@lists.linux.dev>; Wed, 27 Sep 2023 08:10:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPd8-0007vJ-Sw; Wed, 27 Sep 2023 10:10:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPd8-009I6u-FO; Wed, 27 Sep 2023 10:10:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPd8-005BQ9-65; Wed, 27 Sep 2023 10:10:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 02/27] platform/chrome: cros_ec_debugfs: Convert to platform remove callback returning void
Date: Wed, 27 Sep 2023 10:10:15 +0200
Message-Id: <20230927081040.2198742-3-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=RVm8Wdz9Q6CnBZemItiakkOT9n5aPdyjBNWm3I6HY+c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlE+NfjPNWqXOBMQ5/PjYP/1aJLOB8pO9m/bGEH +7hRgy6jXuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRPjXwAKCRCPgPtYfRL+ TnSXB/4qcuZlqjIVUNIEnCj/w7OquDZWxrEQqF1SMDmuOB+0yDri/5C8xlZccSRZNNvzmBykGrS b83hSmuFoc6kFspKloGJuiBqcTlKhnu+abCJMDIQ040C9XyXO8Oo0w7pMNrj4w89Jx5w1gvaDIT BeFMikNOlGDTobFQf94yy+i8MbhJwREQJt4muLSwg8a4cN3L7jZ/sWY118pcW9nizwI170I1EsT 2fiYscI0cBHRqcb1YLUkrcllUK/1wFHTKk7HCRbo5LIFl9Tcqbr78Vi7bnHpYJU+7r/IsAJwUQu X0/iATJXFUXFLO8y7lEu3BF8iRSxnNBAAmjZhMzKDT0+bMg1
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
 drivers/platform/chrome/cros_ec_debugfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index c876120e0ebc..091fdc154d79 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -533,14 +533,12 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
 	return ret;
 }
 
-static int cros_ec_debugfs_remove(struct platform_device *pd)
+static void cros_ec_debugfs_remove(struct platform_device *pd)
 {
 	struct cros_ec_dev *ec = dev_get_drvdata(pd->dev.parent);
 
 	debugfs_remove_recursive(ec->debug_info->dir);
 	cros_ec_cleanup_console_log(ec->debug_info);
-
-	return 0;
 }
 
 static int __maybe_unused cros_ec_debugfs_suspend(struct device *dev)
@@ -573,7 +571,7 @@ static struct platform_driver cros_ec_debugfs_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = cros_ec_debugfs_probe,
-	.remove = cros_ec_debugfs_remove,
+	.remove_new = cros_ec_debugfs_remove,
 };
 
 module_platform_driver(cros_ec_debugfs_driver);
-- 
2.40.1

