Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211D113B58B
	for <chrome-platform@lists.linux.dev>; Tue, 28 Oct 2025 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665479; cv=none; b=K97eJSQ2iuCm9LGFcxhONnGve+MPPXFAk7JI4pzJ7fKpUtBk0ZNFRACwhlX+jPd2CS8g6xx0m6uojxXJxja6xrnu6FKuns6Fz/DN7n+dOgYzWch3n0KlEi61pComz8TnTbZ77w+JfTOAvgEF72P3RVRijs9sI+gwF81FhkuWHU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665479; c=relaxed/simple;
	bh=zX259koY1ErDXF7Q9x9tWaw7jkiH1R91w6zU9d+geSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HODXQT7+bwvIe5al96nUUsTd+wC08kxtwoRfnW63tU7yDdaN1/ZYWVPEOLbhnw0DH/UVEbpre7zgBs1x5bXudiYYpHWN2gvH2Qs5QjEiU3UgQGojtMWgT/gYHZDg0HT2cAr/NojGdaAZyoLJ9jQi5hugZXN9k7T12AQr6S72nHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TCA4OOXG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TCA4OOXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1761665469;
	bh=zX259koY1ErDXF7Q9x9tWaw7jkiH1R91w6zU9d+geSU=;
	h=From:Date:Subject:To:Cc:From;
	b=TCA4OOXG9+UCc7CZiOkQFM/GW2kS+WqshLkFSOfdh1CxfyXxDbJSftqs9jKgzNZoe
	 TmtQq1VJ4Uku4w05BjiZMp+VddrZfcwCe1cb5+Di0utgFnCs1cwuTokvrAjwnZZFiG
	 EAcUg1uryw/YeAHk0LcW/qUUQFj4DSa4t6wX3CFk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 28 Oct 2025 16:31:03 +0100
Subject: [PATCH] leds: leds-cros_ec: Skip LEDs without color components
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251028-cros_ec-leds-no-colors-v1-1-ebe13a02022a@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIALbhAGkC/x3MQQqDMBBG4avIrB0wASH1KlKKJr/tgGTKDBRBv
 Luhy2/x3kkOEzhN3UmGn7hobQh9R/mz1DdYSjPFIY5hiImzqb+QeUdxrspZdzXnkLCmErAtj0g
 t/ho2Of7j+XldN8MzoG1oAAAA
X-Change-ID: 20251028-cros_ec-leds-no-colors-18eb8d1efa92
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761665467; l=1805;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zX259koY1ErDXF7Q9x9tWaw7jkiH1R91w6zU9d+geSU=;
 b=UjRulbLbK2+GN0xY/1dSSmLc4Xadqk2KEj5cukNLVODnGzdH5+07GuEURF3jX3ChBOKQdGMrI
 xcwvkUNJ4aiB37QDMehwdzZQo2I2NYRAAFwdkgcbDS0vnJkWPwrgOf6
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

A user reports that on their Lenovo Corsola Magneton with EC firmware
steelix-15194.270.0 the driver probe fails with EINVAL. It turns out
that the power LED does not contain any color components as indicated
by the following "ectool led power query" output:

Brightness range for LED 1:
        red     : 0x0
        green   : 0x0
        blue    : 0x0
        yellow  : 0x0
        white   : 0x0
        amber   : 0x0

The LED also does not react to commands sent manually through ectool and
is generally non-functional.

Instead of failing the probe for all LEDs managed by the EC when one
without color components is encountered, silently skip those.

Fixes: 8d6ce6f3ec9d ("leds: Add ChromeOS EC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/leds-cros_ec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index 377cf04e202a..bea3cc3fbfd2 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -142,9 +142,6 @@ static int cros_ec_led_count_subleds(struct device *dev,
 		}
 	}
 
-	if (!num_subleds)
-		return -EINVAL;
-
 	*max_brightness = common_range;
 	return num_subleds;
 }
@@ -189,6 +186,8 @@ static int cros_ec_led_probe_one(struct device *dev, struct cros_ec_device *cros
 						&priv->led_mc_cdev.led_cdev.max_brightness);
 	if (num_subleds < 0)
 		return num_subleds;
+	if (num_subleds == 0)
+		return 0; /* LED without any colors, skip */
 
 	priv->cros_ec = cros_ec;
 	priv->led_id = id;

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251028-cros_ec-leds-no-colors-18eb8d1efa92

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

