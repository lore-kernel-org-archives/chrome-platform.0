Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596CF2CA9
	for <chrome-platform@lists.linux.dev>; Fri, 26 May 2023 21:47:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2fHA-00054Z-HJ; Fri, 26 May 2023 23:47:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2fH9-0032gH-HB; Fri, 26 May 2023 23:47:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2fH8-008H62-OR; Fri, 26 May 2023 23:47:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Benson Leung <bleung@chromium.org>,
	Dan Callaghan <dcallagh@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	=?utf-8?b?U2FtaSBLecO2c3RpbMOk?= <skyostil@chromium.org>,
	chrome-platform@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH] platform/chrome: Switch i2c drivers back to use .probe()
Date: Fri, 26 May 2023 23:47:03 +0200
Message-Id: <20230526214703.2135137-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wOV/UtjF7fwbmJ+leKtH2A059coffxuOYqYHzSRMEdo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkcSjUGGgEhYx9eJ2GvDuEiC+0Qp2hk04YPN6Eb coHE3efolSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHEo1AAKCRCPgPtYfRL+ Tl8pCAC7QEi+NM7bFFuBUNH4eH0ZwWDYVVQWfoUZ/M41wgRGJlPNtfUcU09r9scAAYsBPFVqOA0 gOtt4Ac88CQ8CqcMHYvZKd4jEtxJeBSjh+uH1ZPaMCvp072TVyAzgkbI7pky1quQXCxVdSTcXeX rrnZKpTcvBlXBi/IFWcbDZn1cGJBf0bJ0Fc4lE8/0TH8Ue5aPC0SjT7nwzccQkDDP9uSTwMwHU0 x+BqYY2W2o4bLa5EB7aX9R95tlNPssdtTqZrKEWR5lqkK9RZJtfOXhpq6vz4v2zspirgz/8YbYi xKqoV79n2z4Z2ZqT00qGMQPzt4c1lQFH61NK6fg1c5RzQ1V3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: chrome-platform@lists.linux.dev

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
convert back to (the new) .probe() to be able to eventually drop
.probe_new() from struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/chrome/cros_ec_i2c.c  | 2 +-
 drivers/platform/chrome/cros_hps_i2c.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chrome/cros_ec_i2c.c
index dbe698f33128..e29c51cbfd71 100644
--- a/drivers/platform/chrome/cros_ec_i2c.c
+++ b/drivers/platform/chrome/cros_ec_i2c.c
@@ -372,7 +372,7 @@ static struct i2c_driver cros_ec_driver = {
 		.of_match_table = of_match_ptr(cros_ec_i2c_of_match),
 		.pm	= &cros_ec_i2c_pm_ops,
 	},
-	.probe_new	= cros_ec_i2c_probe,
+	.probe		= cros_ec_i2c_probe,
 	.remove		= cros_ec_i2c_remove,
 	.id_table	= cros_ec_i2c_id,
 };
diff --git a/drivers/platform/chrome/cros_hps_i2c.c b/drivers/platform/chrome/cros_hps_i2c.c
index 62ccb1acb5de..b31313080332 100644
--- a/drivers/platform/chrome/cros_hps_i2c.c
+++ b/drivers/platform/chrome/cros_hps_i2c.c
@@ -143,7 +143,7 @@ MODULE_DEVICE_TABLE(acpi, hps_acpi_id);
 #endif /* CONFIG_ACPI */
 
 static struct i2c_driver hps_i2c_driver = {
-	.probe_new = hps_i2c_probe,
+	.probe = hps_i2c_probe,
 	.remove = hps_i2c_remove,
 	.id_table = hps_i2c_id,
 	.driver = {

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

