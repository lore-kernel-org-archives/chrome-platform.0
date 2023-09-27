Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6758C1D520
	for <chrome-platform@lists.linux.dev>; Wed, 27 Sep 2023 08:10:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPdA-00080D-RB; Wed, 27 Sep 2023 10:10:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPd9-009I7P-Vi; Wed, 27 Sep 2023 10:10:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qlPd9-005BQg-MV; Wed, 27 Sep 2023 10:10:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Brian Norris <briannorris@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 10/27] platform/chrome/wilco_ec: core: Convert to platform remove callback returning void
Date: Wed, 27 Sep 2023 10:10:23 +0200
Message-Id: <20230927081040.2198742-11-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ErTBgUVBzAoUk5cH94Ob31zJEYM2LgwwmCXualZPhgg=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlThxxmfEz5LascytexPrvRqs/8+7eD1S0ZyPJxbCj67h 3vmHnHsZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiT4LY/8orBVcvZNkt+buI 93Dtqxz1Wh71Ah11/Z9M0ZmsrL4Pnn48tFCqS83TIjt0gmfo8p97GPWfPjzfZ+0fXBN3upwvzKH kqdH2ZUf/Lo2bZ/fw3IVnW7pUl22v0qlfd7+/X1qtN32vUk9n89V/wbGNaZFzZ00sSbobzfik5L Kl4K5pNz8X9buIPKrZprPfr+2zY4q+q4zZvNXO79vT5DotNa43HZryeun7GskPNSkpz1h2rBc3X Lv5M1P8BVNRfcbChXzvHuSWLZdjfis9L8MjsevK9cK/OQ6nZvRvfXuT1zv1LvMS5+Ssjo898Z2K pkf1uuNzAuateDCT76LknyvRdULhDiv3q195sDat/WkCAA==
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
 drivers/platform/chrome/wilco_ec/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/wilco_ec/core.c b/drivers/platform/chrome/wilco_ec/core.c
index d6a994bdc182..9b59a1bed286 100644
--- a/drivers/platform/chrome/wilco_ec/core.c
+++ b/drivers/platform/chrome/wilco_ec/core.c
@@ -132,7 +132,7 @@ static int wilco_ec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int wilco_ec_remove(struct platform_device *pdev)
+static void wilco_ec_remove(struct platform_device *pdev)
 {
 	struct wilco_ec_device *ec = platform_get_drvdata(pdev);
 
@@ -142,7 +142,6 @@ static int wilco_ec_remove(struct platform_device *pdev)
 	platform_device_unregister(ec->rtc_pdev);
 	if (ec->debugfs_pdev)
 		platform_device_unregister(ec->debugfs_pdev);
-	return 0;
 }
 
 static const struct acpi_device_id wilco_ec_acpi_device_ids[] = {
@@ -157,7 +156,7 @@ static struct platform_driver wilco_ec_driver = {
 		.acpi_match_table = wilco_ec_acpi_device_ids,
 	},
 	.probe = wilco_ec_probe,
-	.remove = wilco_ec_remove,
+	.remove_new = wilco_ec_remove,
 };
 
 module_platform_driver(wilco_ec_driver);
-- 
2.40.1

