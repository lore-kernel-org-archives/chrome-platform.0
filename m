Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B21D693
	for <chrome-platform@lists.linux.dev>; Wed, 27 Sep 2023 08:10:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPdB-00082w-94; Wed, 27 Sep 2023 10:10:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPdA-009I7X-Cv; Wed, 27 Sep 2023 10:10:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPdA-005BQo-3z; Wed, 27 Sep 2023 10:10:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 12/27] platform/chrome/wilco_ec: telemetry: Convert to platform remove callback returning void
Date: Wed, 27 Sep 2023 10:10:25 +0200
Message-Id: <20230927081040.2198742-13-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=49ld1JhVzgaDQZfMoKqFWG6KmV/4hCWeK0rFORIEYVg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlE+Nr8n7BQCGsykVZITS7s6/ahZU543slwD9v0 /FLaGic9FSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRPjawAKCRCPgPtYfRL+ TpZhB/4t7XGbohjP5wIzeFerTgLgJlW5MNt4VJYnj06gyfUWS4TSaP4k1wHzsVzKuAlD+8S770q +szZwk/iajBIUKZQrvw2kwA+xFZ+J+nF7FUDnbtjA1RQwY533GOe7pBriSGpL+IeINvpTh+RAHW fJpZaXLnEonUENT34a5g5jfKr3JwaCmgW+UNcNwxbQ+8SIZa0PgxUxoEe7/9wmA13kzf/4M7kXv 1ImWQwJgRC1kl7AfZP6SQqt2PbZwQrDNSEhw98E8q13MqZDZhGGXjnCnEXaxnToHUYkstyyDJkP /kxMrmy3+FTi3bveCg1RjTFr3nmmozjwhxo2d8r/dnXpO1Bv
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
 drivers/platform/chrome/wilco_ec/telemetry.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/wilco_ec/telemetry.c b/drivers/platform/chrome/wilco_ec/telemetry.c
index 54708aa6c700..253098bace63 100644
--- a/drivers/platform/chrome/wilco_ec/telemetry.c
+++ b/drivers/platform/chrome/wilco_ec/telemetry.c
@@ -400,20 +400,18 @@ static int telem_device_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int telem_device_remove(struct platform_device *pdev)
+static void telem_device_remove(struct platform_device *pdev)
 {
 	struct telem_device_data *dev_data = platform_get_drvdata(pdev);
 
 	cdev_device_del(&dev_data->cdev, &dev_data->dev);
 	ida_simple_remove(&telem_ida, MINOR(dev_data->dev.devt));
 	put_device(&dev_data->dev);
-
-	return 0;
 }
 
 static struct platform_driver telem_driver = {
 	.probe = telem_device_probe,
-	.remove = telem_device_remove,
+	.remove_new = telem_device_remove,
 	.driver = {
 		.name = DRV_NAME,
 	},
-- 
2.40.1

