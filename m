Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6987B629
	for <chrome-platform@lists.linux.dev>; Mon, 23 May 2022 09:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B52C385A9;
	Mon, 23 May 2022 09:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653296937;
	bh=Q+d3XF3B7LVnN1nYfZWpSlRiPE0fKGy1w0hTJi3wqlg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SYg6xRayoZlRZAxXhNbLc52kS1I/F99HpDreqKFZ9LDgacRePlG8Is+xcnpqxAhMd
	 6Q61KsXgRPA96C6PCWapoXO8lW5Lo1YMla00HbbFnl2y655w5Xu5Ab2oqVQA8h9yHn
	 CksedTBYu8EAIlmgJQVGet+9Da6V9Fq+wc+Tfo5S56pbM0jrIPDjNe1LAR+8Lk3xoS
	 ADfyvZ7qdRZ968ArSRrMlw3xEIjIYrBwypnxaZ1xL9hkuQ3OtaTr4RcByeV3QUhhjn
	 CLlzcKx4hDcoJ2vNlCULO8mi2G3HltJ8JEBcQ/WTjHlSfjC+r5vuxYkbqzuKa0d9fT
	 2ZIuXznbWC/qQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org,
	robh+dt@kernel.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	tzungbi@kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 4/5] platform/chrome: cros_kbd_led_backlight: support OF match
Date: Mon, 23 May 2022 17:08:21 +0800
Message-Id: <20220523090822.3035189-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220523090822.3035189-1-tzungbi@kernel.org>
References: <20220523090822.3035189-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For letting device tree based machines to use the driver, support OF match.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No changes from v3.

Changes from v2:
- Add commit message.
- Add R-b tag.

Changes from v1:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220214053646.3088298-5-tzungbi@google.com/)
- Update email address accordingly.
- Use device_get_match_data() per review comment in v1.

 drivers/platform/chrome/cros_kbd_led_backlight.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index a86d664854ae..4bca880d7721 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -10,7 +10,9 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 /**
@@ -116,7 +118,7 @@ static int keyboard_led_probe(struct platform_device *pdev)
 	const struct keyboard_led_drvdata *drvdata;
 	int error;
 
-	drvdata = acpi_device_get_match_data(&pdev->dev);
+	drvdata = device_get_match_data(&pdev->dev);
 	if (!drvdata)
 		return -EINVAL;
 
@@ -152,10 +154,21 @@ static const struct acpi_device_id keyboard_led_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, keyboard_led_acpi_match);
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id keyboard_led_of_match[] = {
+	{
+		.compatible = "google,cros-kbd-led-backlight",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, keyboard_led_of_match);
+#endif
+
 static struct platform_driver keyboard_led_driver = {
 	.driver		= {
 		.name	= "chromeos-keyboard-leds",
 		.acpi_match_table = ACPI_PTR(keyboard_led_acpi_match),
+		.of_match_table = of_match_ptr(keyboard_led_of_match),
 	},
 	.probe		= keyboard_led_probe,
 };
-- 
2.36.1.124.g0e6072fb45-goog

