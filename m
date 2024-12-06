Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6781175BF;
	Fri,  6 Dec 2024 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733454941; cv=none; b=jHmVMalOcgNwXVMDDujLDmET7b9GInq6BJ7jJY9/591n3poZanSzMMHcXBgpVriAv8aLn/ROpAyA8Jup/Yh87JfvTrBSBXKNahyW6sSpDRpxcFHly/puVC8hNNkvfyZ272766lquqCIxl7iy7HErs+WkQS6IU5loSC6t2cVNsVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733454941; c=relaxed/simple;
	bh=o4+0+IH8PfFCNM8c/KDKyLJoIqY/FQgX+RJohW3TncY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrS4gIeDpSe8lI3TuuSExGF+ToVfCEWcb+5fWP70cmQ9/xbcw0XqGwux9ZnEho8oe0IM4rNyd0gSYRvEST/ywEZJaLYimjaP5SazmYrCOjfGfkkBpBYXBXdXCKTP2kEiiMb3iqPNsshgON0kuLQsBHMIfdNTpFO7V4JEDFZYY9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iB2E+Xmc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iB2E+Xmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397D7C4CEE2;
	Fri,  6 Dec 2024 03:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733454941;
	bh=o4+0+IH8PfFCNM8c/KDKyLJoIqY/FQgX+RJohW3TncY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iB2E+XmcAQycmHDkcuegvFBOqlQgaB61K1wRRnjr2+OL9JRgrPnwHQnQarp4iU3eV
	 TXc9kgx+L8/us3DiUoMYqXAUBmP1GvwNZHfE/8ZJjcWTIMLsUPkl7O0JO1Sl6yVQ5y
	 WXX+XBghrVvcpEXaytneszGXh6gouBYW1pY6oUVJOPuVIsanOq3Kr0o3i9LpU+AMQw
	 BVsWU95dnJjF4GjpML6MteJ7gQnIbKqo0+w2eQh5DVGLjGKBJRPg6WssPlLiDl1Zn0
	 D/wt3uV88S/N2v3C8QvnhPJLTgg9X07aR3TB7g48e9SBOxKPy+FI0KLVzdX/1ao/hf
	 L3sVgWyMcE6Vg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux@weissschuh.net,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	bleung@chromium.org,
	groeck@chromium.org,
	tzungbi@kernel.org
Subject: [PATCH 1/2] platform/chrome: cros_kbd_led_backlight: Remove OF match
Date: Fri,  6 Dec 2024 03:14:04 +0000
Message-ID: <20241206031405.1711996-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206031405.1711996-1-tzungbi@kernel.org>
References: <20241206031405.1711996-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After applying 4c03a44e2668 ("arm64: dts: mediatek: mt8195-cherry: Remove
keyboard-backlight node"), there are no users for using the OF match.
Instead, the device is added via drivers/mfd/cros_ec_dev.c by
970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight subdevice").

Remove the OF match.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 .../platform/chrome/cros_kbd_led_backlight.c  | 62 ++++---------------
 1 file changed, 11 insertions(+), 51 deletions(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index 374de6dad4fa..fc27bd7fc4b9 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -121,7 +121,17 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_acpi = {
 
 #endif /* CONFIG_ACPI */
 
-#if IS_ENABLED(CONFIG_CROS_EC)
+#if IS_ENABLED(CONFIG_MFD_CROS_EC_DEV)
+static int keyboard_led_init_ec_pwm_mfd(struct platform_device *pdev)
+{
+	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
+	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
+	struct keyboard_led *keyboard_led = platform_get_drvdata(pdev);
+
+	keyboard_led->ec = cros_ec;
+
+	return 0;
+}
 
 static int
 keyboard_led_set_brightness_ec_pwm(struct led_classdev *cdev,
@@ -169,44 +179,6 @@ keyboard_led_get_brightness_ec_pwm(struct led_classdev *cdev)
 	return resp->percent;
 }
 
-static int keyboard_led_init_ec_pwm(struct platform_device *pdev)
-{
-	struct keyboard_led *keyboard_led = platform_get_drvdata(pdev);
-
-	keyboard_led->ec = dev_get_drvdata(pdev->dev.parent);
-	if (!keyboard_led->ec) {
-		dev_err(&pdev->dev, "no parent EC device\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static const __maybe_unused struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm = {
-	.init = keyboard_led_init_ec_pwm,
-	.brightness_set_blocking = keyboard_led_set_brightness_ec_pwm,
-	.brightness_get = keyboard_led_get_brightness_ec_pwm,
-	.max_brightness = KEYBOARD_BACKLIGHT_MAX,
-};
-
-#else /* IS_ENABLED(CONFIG_CROS_EC) */
-
-static const __maybe_unused struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm = {};
-
-#endif /* IS_ENABLED(CONFIG_CROS_EC) */
-
-#if IS_ENABLED(CONFIG_MFD_CROS_EC_DEV)
-static int keyboard_led_init_ec_pwm_mfd(struct platform_device *pdev)
-{
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
-	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
-	struct keyboard_led *keyboard_led = platform_get_drvdata(pdev);
-
-	keyboard_led->ec = cros_ec;
-
-	return 0;
-}
-
 static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm_mfd = {
 	.init = keyboard_led_init_ec_pwm_mfd,
 	.brightness_set_blocking = keyboard_led_set_brightness_ec_pwm,
@@ -270,17 +242,6 @@ static const struct acpi_device_id keyboard_led_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, keyboard_led_acpi_match);
 #endif
 
-#ifdef CONFIG_OF
-static const struct of_device_id keyboard_led_of_match[] = {
-	{
-		.compatible = "google,cros-kbd-led-backlight",
-		.data = &keyboard_led_drvdata_ec_pwm,
-	},
-	{}
-};
-MODULE_DEVICE_TABLE(of, keyboard_led_of_match);
-#endif
-
 static const struct platform_device_id keyboard_led_id[] = {
 	{ "cros-keyboard-leds", 0 },
 	{}
@@ -291,7 +252,6 @@ static struct platform_driver keyboard_led_driver = {
 	.driver		= {
 		.name	= "cros-keyboard-leds",
 		.acpi_match_table = ACPI_PTR(keyboard_led_acpi_match),
-		.of_match_table = of_match_ptr(keyboard_led_of_match),
 	},
 	.probe		= keyboard_led_probe,
 	.id_table	= keyboard_led_id,
-- 
2.47.0.338.g60cca15819-goog

