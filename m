Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152FC184F
	for <chrome-platform@lists.linux.dev>; Sat,  4 Mar 2023 13:30:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYRyH-0000dc-OI; Sat, 04 Mar 2023 14:30:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYRyG-001nZt-Fn; Sat, 04 Mar 2023 14:30:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pYRyF-0027Gp-5H; Sat, 04 Mar 2023 14:30:43 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 10/41] rtc: cros-ec: Convert to platform remove callback returning void
Date: Sat,  4 Mar 2023 14:29:57 +0100
Message-Id: <20230304133028.2135435-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=K+XKlXv766x2AdrMgVzY+f8frj0KOQQ2uyntmhYV3uc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0eGunPhWAJAYFDQBXkKCceudbKWQlDH9+TIZ C6tIOw6+8+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANHhgAKCRDB/BR4rcrs CTD+B/0aDynlGGn7bpYdwp7GEFccUwZxbqpI2nBbPcYr1xv5TIEq/pU1xqAtzNNtw2RKnTSzSbv iZnBeqCX/TABgGHPRTRHwE44uhrdXsXTaMVnqC5JUEZtMkR5I3BiIM0byoUHSmj7xNCAGy1/E1E xsRELQZyfMUEGDilskW9KhLJ6jCSzVOnlXqJbzkPkF2buKTn/+cFGl7ghXeiJs7Q7joRRPZm0ei Z6oos1yW9WJ9lwS0mcafQV3HXF+1NweTeRFAtSzdII1b6oy/p8bwUYqFY50JJQ1W/fYoVpCN4Yg z/znzIle6dsBb/Y8KTn6LMxtM7Xnj3SxeBI2kw+5xyw1tKnm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: chrome-platform@lists.linux.dev

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-cros-ec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index a3ec066d8066..998ab8606f0b 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -371,7 +371,7 @@ static int cros_ec_rtc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int cros_ec_rtc_remove(struct platform_device *pdev)
+static void cros_ec_rtc_remove(struct platform_device *pdev)
 {
 	struct cros_ec_rtc *cros_ec_rtc = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
@@ -382,13 +382,11 @@ static int cros_ec_rtc_remove(struct platform_device *pdev)
 				&cros_ec_rtc->notifier);
 	if (ret)
 		dev_err(dev, "failed to unregister notifier\n");
-
-	return 0;
 }
 
 static struct platform_driver cros_ec_rtc_driver = {
 	.probe = cros_ec_rtc_probe,
-	.remove = cros_ec_rtc_remove,
+	.remove_new = cros_ec_rtc_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &cros_ec_rtc_pm_ops,
-- 
2.39.1

