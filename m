Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F397E4
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 05:37:42 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id b64-20020a256743000000b0061e169a5f19so31453970ybc.11
        for <chrome-platform@lists.linux.dev>; Sun, 13 Feb 2022 21:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=VQ0fcrLFQa5SytEe7w/qOoQOsJ7lIVCuuogL1feOzv4=;
        b=jALbtnI4xhmtv743R1KcTnGNyCR/hveB1agW+EITuGYYJjN7VjULLeZUpg1jpOa+do
         KRXfiDuV651LoMpFUBBLV/zeK8X2XWUJ/ELowaltEMBWhIN7n4bPNHlzrXe+OkD1oWqP
         gxnoayl1wJdVDryxOF/6X366MTp57R+/sdu/hri/7v0/pNMNQANSN3weCfwaxvyX82nT
         esiQTwWunoufA1dWXVdQsue/AV3qEc1DcxLFzDu5Lf/kNmiYYpKKcTCh3wcMKeVSPCKf
         trUt8WyUNoT3bT4CPlw1ssBdYB7X34gQnrZ0YoGtOnQ56HWce0GRObKu4l8u2y2wRu1J
         YOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=VQ0fcrLFQa5SytEe7w/qOoQOsJ7lIVCuuogL1feOzv4=;
        b=iqzSin9fO0cT/eo+r6KaMnkwzInJcTaElG8JmIRj8yGq3OVVJLU4T2y3ShjOkt/6xx
         +UxNjQGaffJePhpKHa1o+lphxXXkPLbbyDZyDztpgqvhu5HuhJBVjtES6ZDa2f4h/ZKP
         IXjPLLgPK26D6Zl1q0YGkGLWHNlJ3sQiJQ/gjt/MOKugLV4ATlbjpn454OzMe6utXMpP
         c6Na0nZtZR67GTrjFnpKA04Eu6/yEDGeZLjibSfC0FI/SWfwDVlgc6v7YfGakgnL4qkl
         P5+OtXBcSDpbYXg8W6idkLgA1yC2P7qeQkFS18L7g8ZaCIx9mMUcM5CGMKBcEsvxb0Ie
         pcCQ==
X-Gm-Message-State: AOAM533SznhI5wFxkHtaji0HbEk4Ky4RMJOW2kXvxD/+JwqYFk3uzFQy
	rPtno8xNhag4woB3Kg7d3fw3hyCR6I4t
X-Google-Smtp-Source: ABdhPJyOH81PjOmuwdU6s3uLtdosLovDzjzTPjpE/E0VxwmsccbFz1wTIadjdqBnfoDQauwB5X/1krvPmrru
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:f315:f92d:e3d3:2539])
 (user=tzungbi job=sendgmr) by 2002:a25:5185:: with SMTP id
 f127mr10214317ybb.396.1644817062104; Sun, 13 Feb 2022 21:37:42 -0800 (PST)
Date: Mon, 14 Feb 2022 13:36:45 +0800
In-Reply-To: <20220214053646.3088298-1-tzungbi@google.com>
Message-Id: <20220214053646.3088298-5-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220214053646.3088298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH 4/5] platform/chrome: cros_kbd_led_backlight: support OF match
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../platform/chrome/cros_kbd_led_backlight.c    | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index 814f2b74c602..ba853e55d29a 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
@@ -128,8 +129,11 @@ static int keyboard_led_probe(struct platform_device *pdev)
 	int error;
 
 	drvdata = acpi_device_get_match_data(&pdev->dev);
-	if (!drvdata)
-		return -EINVAL;
+	if (!drvdata) {
+		drvdata = of_device_get_match_data(&pdev->dev);
+		if (!drvdata)
+			return -EINVAL;
+	}
 
 	if (drvdata->init) {
 		error = drvdata->init(pdev);
@@ -161,10 +165,19 @@ static const struct acpi_device_id keyboard_led_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, keyboard_led_acpi_match);
 
+static const struct of_device_id keyboard_led_of_match[] = {
+	{
+		.compatible = "google,cros-kbd-led-backlight",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, keyboard_led_of_match);
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
2.35.1.265.g69c8d7142f-goog

