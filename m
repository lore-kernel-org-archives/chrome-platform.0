Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA2C34CF1
	for <chrome-platform@lists.linux.dev>; Wed,  6 Dec 2023 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOF-0006ia-C6; Wed, 06 Dec 2023 12:48:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOE-00Dwuv-1U; Wed, 06 Dec 2023 12:48:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAqOD-00FR0C-OZ; Wed, 06 Dec 2023 12:48:29 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: kernel@pengutronix.de,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-pwm@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v4 057/115] pwm: cros-ec: Make use of devm_pwmchip_alloc() function
Date: Wed,  6 Dec 2023 12:44:11 +0100
Message-ID:  <d86e0bbcc2ddd4dea8370640987458e6e0a9e6d6.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2767; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=UFQNRwsVAf+cL3Jmd/2AEBvPhiz5x2emgnk7ihYarxA=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtSCuBV/9OXluZ2i/SN+a7rsYnu3uo9NLWujsc7Vgw0Ba YcLZ27oZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAi2afZ/xdu6+RqUHjN4ax6 M2O32DOTZaGze65xP/Jh7VcJWfHJWjnk/WWVzt5Uww924Wpvq+s+HBWtutWwkf2uzWVOOauDOue fzfqXof43jlP+/ouWHocMr2mxymV9vv06opsnn/XrbmH0D/UqvBltnnb/BmeG5CqbmJkzNyom3q jae3nKRuHOkh6Xe1+fp6qL2H5f0Kcdd3vjf8Xa3mXr9rceF/L4v6W984pZrHj5lW+P14hLXP/d+ e57fPyMP4KuZm8vHfgb+WWit26JjW+Mmbos8+PG7y5cCyyWfv3hany5cZcwT/HpR6t/5M5xq/Mu VZgVPOHpNfF7eR/ntvtek+pc/iXxhqyues5Rk6QVosZmAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: chrome-platform@lists.linux.dev

This prepares the pwm-cros-ec driver to further changes of the pwm core
outlined in the commit introducing devm_pwmchip_alloc(). There is no
intended semantical change and the driver should behave as before.
The probe function had to be changed a bit because the number of PWMs
must be determined before allocation of the pwm_chip and its private
data now.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-cros-ec.c | 40 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
index 6c86cd4ba538..b8b39e9e6343 100644
--- a/drivers/pwm/pwm-cros-ec.c
+++ b/drivers/pwm/pwm-cros-ec.c
@@ -26,7 +26,6 @@
  */
 struct cros_ec_pwm_device {
 	struct cros_ec_device *ec;
-	struct pwm_chip chip;
 	bool use_pwm_type;
 	struct cros_ec_pwm *channel;
 };
@@ -41,7 +40,7 @@ struct cros_ec_pwm {
 
 static inline struct cros_ec_pwm_device *pwm_to_cros_ec_pwm(struct pwm_chip *chip)
 {
-	return container_of(chip, struct cros_ec_pwm_device, chip);
+	return pwmchip_get_drvdata(chip);
 }
 
 static int cros_ec_dt_type_to_pwm_type(u8 dt_index, u8 *pwm_type)
@@ -265,35 +264,36 @@ static int cros_ec_pwm_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct cros_ec_pwm_device *ec_pwm;
 	struct pwm_chip *chip;
+	bool use_pwm_type = false;
+	unsigned int npwm;
 	int ret;
 
 	if (!ec)
 		return dev_err_probe(dev, -EINVAL, "no parent EC device\n");
 
-	ec_pwm = devm_kzalloc(dev, sizeof(*ec_pwm), GFP_KERNEL);
-	if (!ec_pwm)
-		return -ENOMEM;
-	chip = &ec_pwm->chip;
-	ec_pwm->ec = ec;
-
-	if (of_device_is_compatible(np, "google,cros-ec-pwm-type"))
-		ec_pwm->use_pwm_type = true;
-
-	/* PWM chip */
-	chip->dev = dev;
-	chip->ops = &cros_ec_pwm_ops;
-	chip->of_xlate = cros_ec_pwm_xlate;
-	chip->of_pwm_n_cells = 1;
-
-	if (ec_pwm->use_pwm_type) {
-		chip->npwm = CROS_EC_PWM_DT_COUNT;
+	if (of_device_is_compatible(np, "google,cros-ec-pwm-type")) {
+		use_pwm_type = true;
+		npwm = CROS_EC_PWM_DT_COUNT;
 	} else {
 		ret = cros_ec_num_pwms(ec);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "Couldn't find PWMs\n");
-		chip->npwm = ret;
+		npwm = ret;
 	}
 
+	chip = devm_pwmchip_alloc(dev, npwm, sizeof(*ec_pwm));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	ec_pwm = pwm_to_cros_ec_pwm(chip);
+	ec_pwm->use_pwm_type = use_pwm_type;
+	ec_pwm->ec = ec;
+
+	/* PWM chip */
+	chip->ops = &cros_ec_pwm_ops;
+	chip->of_xlate = cros_ec_pwm_xlate;
+	chip->of_pwm_n_cells = 1;
+
 	ec_pwm->channel = devm_kcalloc(dev, chip->npwm, sizeof(*ec_pwm->channel),
 					GFP_KERNEL);
 	if (!ec_pwm->channel)
-- 
2.42.0

