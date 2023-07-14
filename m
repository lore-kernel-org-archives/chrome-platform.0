Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B1E53AF
	for <chrome-platform@lists.linux.dev>; Fri, 14 Jul 2023 20:56:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq6-00084f-9H; Fri, 14 Jul 2023 22:56:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq5-00EQSi-EE; Fri, 14 Jul 2023 22:56:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq4-004u40-7w; Fri, 14 Jul 2023 22:56:32 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	linux-pwm@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 05/10] pwm: cros-ec: Consistenly name pwm_chip variables "chip"
Date: Fri, 14 Jul 2023 22:56:18 +0200
Message-Id: <20230714205623.2496590-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/XQEq+e5W3KSA0lJPIW8P70ch6JNuOC7ep9WZ2SJtN0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBksbZsernZYc1YfffBzA7jbAo4jX983pyAi3rjS 9rALaNGCduJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLG2bAAKCRCPgPtYfRL+ ToqCB/0UxIcSEKwlzmVQnXkMFwc1BjdbTtsBGU5YSl1KdSiCkp/5Wi8Yl+MsRclctEbHuKL8QP/ r57MmJ7oa9fThSRBhKGZ4GNcmlq4AaIrqCLhubcJjSgZzwc8uPU6NfDh1o1iq1KrJcKUjGuPzC0 zUgm85uI5uFNBeFZnSUEuhQiKluzIX1KcGx2kvSi+SOq9gGH57FLbaTXSJ4ssIah+bDTnWpmXNL aXnbg8eqZDaD1LeCaSNEk1Zd8jz+jvSp+aYe/mdGnXKoLup7QYm2KPkc2KvP1cEESRP0dVqlPj6 5qEGqVRhmDWyTCoPdQJU4E5hNTtH4hkMVK75B5XdOGH8xbyM
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: chrome-platform@lists.linux.dev

Most variables holding a pointer to a pwm_chip are called "chip" which
is also the usual name in most other pwm drivers. Rename the two
variables that have a different name to be called "chip", too, for
consistency.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-cros-ec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
index 74e863aa1d8d..154ca0f90847 100644
--- a/drivers/pwm/pwm-cros-ec.c
+++ b/drivers/pwm/pwm-cros-ec.c
@@ -37,9 +37,9 @@ struct cros_ec_pwm {
 	u16 duty_cycle;
 };
 
-static inline struct cros_ec_pwm_device *pwm_to_cros_ec_pwm(struct pwm_chip *c)
+static inline struct cros_ec_pwm_device *pwm_to_cros_ec_pwm(struct pwm_chip *chip)
 {
-	return container_of(c, struct cros_ec_pwm_device, chip);
+	return container_of(chip, struct cros_ec_pwm_device, chip);
 }
 
 static int cros_ec_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
@@ -218,14 +218,14 @@ static int cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 }
 
 static struct pwm_device *
-cros_ec_pwm_xlate(struct pwm_chip *pc, const struct of_phandle_args *args)
+cros_ec_pwm_xlate(struct pwm_chip *chip, const struct of_phandle_args *args)
 {
 	struct pwm_device *pwm;
 
-	if (args->args[0] >= pc->npwm)
+	if (args->args[0] >= chip->npwm)
 		return ERR_PTR(-EINVAL);
 
-	pwm = pwm_request_from_chip(pc, args->args[0], NULL);
+	pwm = pwm_request_from_chip(chip, args->args[0], NULL);
 	if (IS_ERR(pwm))
 		return pwm;
 
-- 
2.39.2

