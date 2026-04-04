Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9E238CFFA
	for <chrome-platform@lists.linux.dev>; Sat,  4 Apr 2026 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775289350; cv=none; b=D0k9eZLjghCoAzL89XjiHKQeBv0JsZDX12ua4YwoDH0YSL/KUJVTYmH1ZqSPkYJ6X0APzsd4k6EIBUwpVHRLT9c15muUujgCmz7XGjGRRWGKYqaZYk9cCFmFxw3rjVxzavxtnC+UXN4l/D1kvQhrImtIMu4oNdOz/mdqvADL7lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775289350; c=relaxed/simple;
	bh=M2BPlkL1HI3MlCzRAC6tPaZUt+YgNNhQy7qqPZSLn0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Psw+I7RdjUdkn7z73/gmZ/8j+JqyuNFJZpR7gm2DSUuM4bKv63HhT0hFfMqf+ASVFfm6oJlea1B/sz67vr0yMHZ3Vt22P95QTt0vGNWT7ZPeIXf0eHQxr+sKPM27UjpjnByaGik1h00o7/3/64BPJZ/ArqW0kPiTBUUcO4tiEio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=X0561q8O; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="X0561q8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775289337;
	bh=M2BPlkL1HI3MlCzRAC6tPaZUt+YgNNhQy7qqPZSLn0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X0561q8OVHjl0Cq8Hf6DcBjBdSJ11gBoG2BMiE/5BqjzPcvNSpuij4XLuMmfwCwU2
	 2KCy+6wPKyuWlXbFfQFvrAnefA+xIe5CLfscIblZ1xdia4bL3MKSuLtLjOKVJ4FCyX
	 iX57l73zIGXNnwiMqbDc+uK1hrRu0V5GnTZi5jHo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Apr 2026 09:55:27 +0200
Subject: [PATCH 2/5] platform/chrome: cros_kbd_led_backlight: Pass
 keyboard_led as parameter
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260404-cros_kbd_led-cleanup-v1-2-0dc1100d54e3@weissschuh.net>
References: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
In-Reply-To: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Lee Jones <lee@kernel.org>, Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775289335; l=2284;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=M2BPlkL1HI3MlCzRAC6tPaZUt+YgNNhQy7qqPZSLn0Y=;
 b=lwAVjAvPzvcf/QBsg5WfINFTbXCI761ToPcYbqS+RQj2BdqKron7mKf1NqtEZdOuqag6UzLkL
 HJskOSdNjf2AmiHMD00j5gNsiXpSqj0To1tYPznd6aTXTbhnBZ5nYkA
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Make the code simpler to read by passing the 'struct keyboard_led' as
a parameter to the 'init' callbacks instead of relying on the platform
device driver data.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/chrome/cros_kbd_led_backlight.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index 39e98e4b9ce6..cca1ed0e00bd 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -36,7 +36,7 @@ struct keyboard_led {
  * See struct led_classdev in include/linux/leds.h for more details.
  */
 struct keyboard_led_drvdata {
-	int (*init)(struct platform_device *pdev);
+	int (*init)(struct platform_device *pdev, struct keyboard_led *keyboard_led);
 
 	enum led_brightness (*brightness_get)(struct led_classdev *led_cdev);
 
@@ -89,7 +89,8 @@ keyboard_led_get_brightness_acpi(struct led_classdev *cdev)
 	return brightness;
 }
 
-static int keyboard_led_init_acpi(struct platform_device *pdev)
+static int keyboard_led_init_acpi(struct platform_device *pdev,
+				  struct keyboard_led *keyboard_led)
 {
 	acpi_handle handle;
 	acpi_status status;
@@ -116,11 +117,11 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_acpi = {
 #endif /* CONFIG_ACPI */
 
 #if IS_ENABLED(CONFIG_MFD_CROS_EC_DEV)
-static int keyboard_led_init_ec_pwm_mfd(struct platform_device *pdev)
+static int keyboard_led_init_ec_pwm_mfd(struct platform_device *pdev,
+					struct keyboard_led *keyboard_led)
 {
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
-	struct keyboard_led *keyboard_led = platform_get_drvdata(pdev);
 
 	keyboard_led->ec = cros_ec;
 
@@ -198,10 +199,9 @@ static int keyboard_led_probe(struct platform_device *pdev)
 	keyboard_led = devm_kzalloc(&pdev->dev, sizeof(*keyboard_led), GFP_KERNEL);
 	if (!keyboard_led)
 		return -ENOMEM;
-	platform_set_drvdata(pdev, keyboard_led);
 
 	if (drvdata->init) {
-		err = drvdata->init(pdev);
+		err = drvdata->init(pdev, keyboard_led);
 		if (err)
 			return err;
 	}

-- 
2.53.0

