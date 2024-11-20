Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E021AA78C
	for <chrome-platform@lists.linux.dev>; Wed, 20 Nov 2024 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732115060; cv=none; b=ROY/ahEdPMnW2Q9h1sgkIYj01VAY3wonxhcQgx99yrlnNcQXsRfrIqGd/RAGPOKvXKuwOrkqSClQPt7o3oYz4tSOukEiVtM/BzNCftHzNrAk5bzRhZiJJUmOLBhT4Ds2nJTTBux7LvhetUDzPIwoIeg0M/aR2b5hoStHe02J3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732115060; c=relaxed/simple;
	bh=6ZuTvqthaqnpYJHZsRvD0W017BVSurPEs90tn5ckqh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iXg06Dvr5jtrSdBoqkyAp0tVcwpf+2Hy2K5C4hREYxjpky3TUSHD0rVDSBYS2fUqy0Lg2cmLCqkctQvIgcahJU2kaahse2hq37z+ecmM2aat7TadA+q5fKYwr5BO+yszKKzUMf8hVkyNL6prSUhSFO2u8xGlalKMIjQy2eXTcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPrJa27J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPrJa27J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA08EC4CECD;
	Wed, 20 Nov 2024 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732115057;
	bh=6ZuTvqthaqnpYJHZsRvD0W017BVSurPEs90tn5ckqh8=;
	h=From:To:Cc:Subject:Date:From;
	b=MPrJa27JcPrp7K6uC5O9uFHOWPxpeRiexs2Kc+YCaF4/TvkBcNAr4toNJFpgo6UIR
	 LXsOj3KhGCdIvtnh+KsSa+BUq9YzKUqZGLYRJTzK8u7q6Su4LEm9EhqlTRD4CEQlZW
	 i4QbgdxhCzaSQMUuvfibNA8ZzDZlr4fMiYL3Mgow3Rqc5jeXUr2TdNTbiHIar4HCIG
	 qgoD+tBzKnv9B9aNPzdueitcVxxsn1wdGATeo2uf9O66RHe0XyBDsYLlTgzrN4uM6q
	 KXH21IveUU7LCb+DDYXw+z2diEiQvdX3dBrrlj2s35x3oOua0kk+JVsOCrwVC3dySU
	 WqWT0DiSnUFEg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH] platform/chrome: cros_kbd_led_backlight: remove unneeded if-statement
Date: Wed, 20 Nov 2024 15:03:59 +0000
Message-ID: <20241120150359.1522694-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unneeded if-statement.  Also s/error/err/.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 .../platform/chrome/cros_kbd_led_backlight.c    | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index 78097c8a4966..374de6dad4fa 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -229,7 +229,7 @@ static int keyboard_led_probe(struct platform_device *pdev)
 {
 	const struct keyboard_led_drvdata *drvdata;
 	struct keyboard_led *keyboard_led;
-	int error;
+	int err;
 
 	if (keyboard_led_is_mfd_device(pdev))
 		drvdata = &keyboard_led_drvdata_ec_pwm_mfd;
@@ -244,9 +244,9 @@ static int keyboard_led_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, keyboard_led);
 
 	if (drvdata->init) {
-		error = drvdata->init(pdev);
-		if (error)
-			return error;
+		err = drvdata->init(pdev);
+		if (err)
+			return err;
 	}
 
 	keyboard_led->cdev.name = "chromeos::kbd_backlight";
@@ -256,13 +256,10 @@ static int keyboard_led_probe(struct platform_device *pdev)
 	keyboard_led->cdev.brightness_set_blocking = drvdata->brightness_set_blocking;
 	keyboard_led->cdev.brightness_get = drvdata->brightness_get;
 
-	error = devm_led_classdev_register(&pdev->dev, &keyboard_led->cdev);
-	if (error == -EEXIST) /* Already bound via other mechanism */
+	err = devm_led_classdev_register(&pdev->dev, &keyboard_led->cdev);
+	if (err == -EEXIST) /* Already bound via other mechanism */
 		return -ENODEV;
-	if (error)
-		return error;
-
-	return 0;
+	return err;
 }
 
 #ifdef CONFIG_ACPI
-- 
2.47.0.338.g60cca15819-goog

