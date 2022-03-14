Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800607A
	for <chrome-platform@lists.linux.dev>; Mon, 14 Mar 2022 09:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B36DC340F7;
	Mon, 14 Mar 2022 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647248957;
	bh=E9SzhcEG0yZrae6rbEeg5wJt6CnnPJ1ADt5pIuBvFwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MuXhuZw4Qu74R6kocHcSyypqo4JqMrqhE5OaTdsmKAsUI8ibpxHP/Fs0e00jxR6eW
	 fYeBoJj90disFC9LzI4P93bj89s76CtxQN1wQ7esnjUTaBFLLQFFAhgn1AEpP18JDJ
	 sag1+dRlG8L/SX28/7Q2fTIIs562KFboo3IIb1HiVRhz42aXrGjafedTzA6P/HTfxQ
	 yb7AWdl4PJDG/0iJoi8wO+12N1pmrNA0BnnkYcpXuTa3LdP7tpy1M/ZjDEMDrlGtdt
	 N0t4QCh/oMuSiLOuoMrQ/+46ZN/NdaevC1i775A7kRLYjgTIeQC4vnVpO1x29k1blM
	 I4Gl9iViqFNcw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] platform/chrome: cros_kbd_led_backlight: support OF match
Date: Mon, 14 Mar 2022 17:08:34 +0800
Message-Id: <20220314090835.3822093-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
In-Reply-To: <20220314090835.3822093-1-tzungbi@kernel.org>
References: <20220314090835.3822093-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v1:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220214053646.3088298-5-tzungbi@google.com/)
- Update email address accordingly.
- Use device_get_match_data() per review comment in v1.

 drivers/platform/chrome/cros_kbd_led_backlight.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index e26d1d4cd801..1f2750c830d4 100644
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
@@ -127,7 +129,7 @@ static int keyboard_led_probe(struct platform_device *pdev)
 	const struct keyboard_led_drvdata *drvdata;
 	int error;
 
-	drvdata = acpi_device_get_match_data(&pdev->dev);
+	drvdata = device_get_match_data(&pdev->dev);
 	if (!drvdata)
 		return -EINVAL;
 
@@ -163,10 +165,21 @@ static const struct acpi_device_id keyboard_led_acpi_match[] = {
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
2.35.1.723.g4982287a31-goog

