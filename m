Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C4F38C2B4
	for <chrome-platform@lists.linux.dev>; Sat,  4 Apr 2026 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775289345; cv=none; b=ptKq+ruxoFRGQj69FfF9Ksmf1azIOJUANBwEXtm20MZ/V3svnGYJylHrHpyL4OIu5E1QAVK+C7/ZpmRAHbViX/IKV0SF+zE6nCQi+U5HiFQFPfiJjId7tREjgC6paOfE7CQUCmkYjAM191HLPaaIFmVoySOXQicjiI5rS6Bz3BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775289345; c=relaxed/simple;
	bh=AbGlFa4wXzsFnpZYHBfLP4haUwPJLNbaUTgd9sVhUyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lLZrHzs+TSRyV56c4stUHpMU3CDWI+SOpiNi+RjoC1kY08h26unzRstHX5fEVJsbTfxYTorraAxqpF++ZAlLV2Fjdns0/3LlW5CBX5suh8aPOa2UR9jYlRVSvlelDn1E6UiZHEPf5vQyC9z+KGRZr4AvB00zjvhtvMfheeIcRzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=V9k5F3Nz; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="V9k5F3Nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775289337;
	bh=AbGlFa4wXzsFnpZYHBfLP4haUwPJLNbaUTgd9sVhUyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V9k5F3NzeU2XdFRA5uKdxspEIvstsvVWzCQzpXdpmAgBRKap9Q33RWZBYWx+2sr5U
	 a1YpJUnA1bvxPRX9QUjTlV4gzGQ7rPhRcMAW2nFGDgBCJfIYQOnlZjUrM4jDN6i+NI
	 TuXEUomDWaLLRRKGUXXUanlk+jXDouxIhPnZ/msQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Apr 2026 09:55:26 +0200
Subject: [PATCH 1/5] platform/chrome: cros_kbd_led_backlight: Drop
 max_brightness from driver data
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260404-cros_kbd_led-cleanup-v1-1-0dc1100d54e3@weissschuh.net>
References: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
In-Reply-To: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Lee Jones <lee@kernel.org>, Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775289335; l=2517;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=AbGlFa4wXzsFnpZYHBfLP4haUwPJLNbaUTgd9sVhUyU=;
 b=ovIteRo5FQ4RmBYxymkdo3kKx/57iZjO5BH/YHiFey8qm6mAqY8ttd3y/EC3wNzHZXkkZow89
 tS7jIShuSlUB6l3SqA5W9aD2s5rjuv97czjzR5d0hMeUAWJpXnrJMLh
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The maximum brightness is always 100. There is no need to read that from
the driver data.

Remove the superfluous driver data.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/chrome/cros_kbd_led_backlight.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index f4c2282129f5..39e98e4b9ce6 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -32,7 +32,6 @@ struct keyboard_led {
  * @brightness_set_blocking:	Set LED brightness level.  It can block the
  *				caller for the time required for accessing a
  *				LED device register
- * @max_brightness:		Maximum brightness.
  *
  * See struct led_classdev in include/linux/leds.h for more details.
  */
@@ -45,12 +44,8 @@ struct keyboard_led_drvdata {
 			       enum led_brightness brightness);
 	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
 				       enum led_brightness brightness);
-
-	enum led_brightness max_brightness;
 };
 
-#define KEYBOARD_BACKLIGHT_MAX 100
-
 #ifdef CONFIG_ACPI
 
 /* Keyboard LED ACPI Device must be defined in firmware */
@@ -116,7 +111,6 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_acpi = {
 	.init = keyboard_led_init_acpi,
 	.brightness_set = keyboard_led_set_brightness_acpi,
 	.brightness_get = keyboard_led_get_brightness_acpi,
-	.max_brightness = KEYBOARD_BACKLIGHT_MAX,
 };
 
 #endif /* CONFIG_ACPI */
@@ -175,7 +169,6 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm_mfd = {
 	.init = keyboard_led_init_ec_pwm_mfd,
 	.brightness_set_blocking = keyboard_led_set_brightness_ec_pwm,
 	.brightness_get = keyboard_led_get_brightness_ec_pwm,
-	.max_brightness = KEYBOARD_BACKLIGHT_MAX,
 };
 
 #else /* IS_ENABLED(CONFIG_MFD_CROS_EC_DEV) */
@@ -215,7 +208,7 @@ static int keyboard_led_probe(struct platform_device *pdev)
 
 	keyboard_led->cdev.name = "chromeos::kbd_backlight";
 	keyboard_led->cdev.flags |= LED_CORE_SUSPENDRESUME | LED_REJECT_NAME_CONFLICT;
-	keyboard_led->cdev.max_brightness = drvdata->max_brightness;
+	keyboard_led->cdev.max_brightness = 100;
 	keyboard_led->cdev.brightness_set = drvdata->brightness_set;
 	keyboard_led->cdev.brightness_set_blocking = drvdata->brightness_set_blocking;
 	keyboard_led->cdev.brightness_get = drvdata->brightness_get;

-- 
2.53.0

