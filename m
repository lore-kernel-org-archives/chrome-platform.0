Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915C338C41A
	for <chrome-platform@lists.linux.dev>; Sat,  4 Apr 2026 07:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775289352; cv=none; b=SzlmfjNAMDX6mSbdYDAKm0nZjML8Kn6mjT1fPYEOkcKU+XEmKjFdc+Qlfw4Cv7sofyN2AsxuT4Aak604G1mASjrqSc6ZUTBezMkB8yhpjfhRT8KWtJMKROx/g8SBxa+a2c0rsiXeVtGy1MtfXJ28kK3dPehwjSytShdVg6CzXNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775289352; c=relaxed/simple;
	bh=rZMYkk6lPe8wYOaFW6xfLGDgUrO8Ua/S0/vkmCso82A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IL4p9BxfLpITWby7gcw4lWXjmSzLhrwULulX7tByPv/MpFIO8XfOudQRlMvtzpOWqcz+oMlEb6tlO0gWicAi1nCpRD8Ru3OEL8IzIxT6q5scmK+dBUO417RqeYFsBHQTS2xlaEO9BNuzlR6XLZbBi+43kzi+Q/NZjdaMYQmPz90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nVxxYTIc; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nVxxYTIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775289337;
	bh=rZMYkk6lPe8wYOaFW6xfLGDgUrO8Ua/S0/vkmCso82A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nVxxYTIcQmdkdsYGiot1R0NcLt1tVNydpPGvga9mpCnNMnI7U4C3fKZk2T4E3KhOf
	 Q8J5/jFZ7mlOzWpEgqIZFCfoH7XypLXfu4RMnnyBfzrlytyeZXut1iu4Wstlu93tGF
	 U0yKAs7/rUilr2u1foPmsPZ4Of/BmJagGcPGvHWE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Apr 2026 09:55:28 +0200
Subject: [PATCH 3/5] platform/chrome: cros_kbd_led_backlight: Drop
 CONFIG_MFD_CROS_EC_DEV ifdeffery
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260404-cros_kbd_led-cleanup-v1-3-0dc1100d54e3@weissschuh.net>
References: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
In-Reply-To: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Lee Jones <lee@kernel.org>, Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775289335; l=1386;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rZMYkk6lPe8wYOaFW6xfLGDgUrO8Ua/S0/vkmCso82A=;
 b=OBchiDxWEj41P+BNpyBm2FrBdlqWozRP5IuK4lgnS4xaUZOQVQ+3JSaOsuH2d84r0HJOwmQVX
 yT+p7aDhUcJCeYf2wEzZrrmsLfmqrxY3poC36Axz6JkzRfJMlwvFAuD
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The ifdeffery is unnecessary, as the compiler can already optimize away
all of the mfd-specific code based on the IS_ENABLED() in
keyboard_led_is_mfd_device().

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/chrome/cros_kbd_led_backlight.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index cca1ed0e00bd..80dc52833dc9 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -116,7 +116,6 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_acpi = {
 
 #endif /* CONFIG_ACPI */
 
-#if IS_ENABLED(CONFIG_MFD_CROS_EC_DEV)
 static int keyboard_led_init_ec_pwm_mfd(struct platform_device *pdev,
 					struct keyboard_led *keyboard_led)
 {
@@ -172,12 +171,6 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm_mfd = {
 	.brightness_get = keyboard_led_get_brightness_ec_pwm,
 };
 
-#else /* IS_ENABLED(CONFIG_MFD_CROS_EC_DEV) */
-
-static const struct keyboard_led_drvdata keyboard_led_drvdata_ec_pwm_mfd = {};
-
-#endif /* IS_ENABLED(CONFIG_MFD_CROS_EC_DEV) */
-
 static int keyboard_led_is_mfd_device(struct platform_device *pdev)
 {
 	return IS_ENABLED(CONFIG_MFD_CROS_EC_DEV) && mfd_get_cell(pdev);

-- 
2.53.0

