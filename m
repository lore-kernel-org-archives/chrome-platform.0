Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900A938D69E
	for <chrome-platform@lists.linux.dev>; Sat,  4 Apr 2026 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775289357; cv=none; b=AIgXDaXMdbsTX1IUongSdFj9/0mM3e0AJKSPT24JneNoD0Wdj/91HlLDKdECS0R2B869xLZRtUCW+e3NN9RQF0yVGF8OAXlE6JWIblogCIlckB64b09Tqmryte2qx2B7AxGbFQSw8UqeRYCG/jQ47m6TU6hvev9EQ5lGrZ0K7Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775289357; c=relaxed/simple;
	bh=jLcN/sgi7unGmJQao0t+kwBlJj+Ly6jJZJFfbLQhKRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nC0CtTz3D1I9acNcLrFMvnK8bnbeGhwk/4kXhqvhGhaj094wqPYG4LyvAL9Wr1eUCujjrf/wnXaHtSgSHl/glItzCeOJcda2KfifkI5f4ZlguSSFpD0E6RiSuUVBb0YdhO51p7A7yi6i508Pzcu4Z8mvQPaLYSCp/yj+cS+8Esk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KAlkjErO; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KAlkjErO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775289337;
	bh=jLcN/sgi7unGmJQao0t+kwBlJj+Ly6jJZJFfbLQhKRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KAlkjErO7dsaECt2CKFWXUgZlX0tio2c+sn/Iyt6FcaFOmprAS2NixveKctX0+B3/
	 TsuPgdrDtNTJEaRGFQSjxNUX/bWI5X7lKj0kNDcSHzxOUeUHFjmu24lB8bgdAhRJR2
	 qxoFYhPXIu/JmojPjUAEEDU1RA0Osv9BYRtUbu2g=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Apr 2026 09:55:30 +0200
Subject: [PATCH 5/5] platform/chrome: cros_kbd_led_backlight: Use
 cros_ec_mfd_get_ec_dev()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260404-cros_kbd_led-cleanup-v1-5-0dc1100d54e3@weissschuh.net>
References: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
In-Reply-To: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Lee Jones <lee@kernel.org>, Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775289335; l=1174;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jLcN/sgi7unGmJQao0t+kwBlJj+Ly6jJZJFfbLQhKRQ=;
 b=ew9QQf8kbE/nk8/NDtY1Tpn8FzRqjQdzWYIZXL0wzUW0CxGvFfdy4EejajTVtOg2nLaRShTtA
 aNdk0+pjvbaA1I6/FwjR9YWEmVQINoqN0x0qCpsf2mNfeIlqEXzZq7D
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Use the new standard helper to make the code a bit easier to read.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/chrome/cros_kbd_led_backlight.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index 80dc52833dc9..f97dc4cf6bbb 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/mfd/core.h>
+#include <linux/mfd/cros_ec.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -119,7 +120,7 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_acpi = {
 static int keyboard_led_init_ec_pwm_mfd(struct platform_device *pdev,
 					struct keyboard_led *keyboard_led)
 {
-	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
+	struct cros_ec_dev *ec_dev = cros_ec_mfd_get_ec_dev(pdev);
 	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
 
 	keyboard_led->ec = cros_ec;

-- 
2.53.0

