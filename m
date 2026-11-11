Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417931;
	b=ND5jaL7VJSpxODnVSLYshyzSjbJrMkM9dONE4xmAwujoAqkWYlZ6a3pvx8DLJkyOVqSw
	 hgmxT/xW0SRqLfdjLGPGa54kIAOLfJ3hpJaSZvvNWx1aTJ1/KyRX2Dgu3PzFMok6QgTab
	 uE9+y5bCN8VjM4dcEKREjaCqFm4lE988vWt+ty2nP6Ge8fz5o310mKMf60KNCavgaka9f
	 +kkFBve7T1EY1ZhRnz03DyUcmRuaxpdbMiHpXFnoykgi4fSXk2IrVVN3fjAACTnWq0Vpq
	 6J7VA3sC5HZHxJwvZO1F0th8Ii5mBZfK73rHLgW7KW4Fp2vapyIba/RtonZUf5EPBbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=EPkKw5pYWqZKfuR6l0Uwwj3160zV9BnT9S/XFeYV53o=;
	b=yLsWad4fsr6VtP6fWGgnfittlJroIyomKxABlVzdKjY/vj7G6ONjJdjaQdYtNus5RFyO
	 +MnDBfhgJitMhVontlMBG2ZhGddriJI+kF3A7fNMx5+LBw+tQUGbbHxJVhwrBMkR0qiMU
	 W4+LmI60YTv4fveJDMxj1b9GMgwz/IFuPvruRLznwPeuIZ22b6gchvNMGwECyZpi5Gw+R
	 6UzcFYQSMRUn9bm3GAdtD862JsYsafcBfjoUqKOTIKFM2FVM9LS/2eZhpAVXom8fJ7PR0
	 Xsj3Qntol/QlqqifIpLWF/se68IkCbfcPmNjHI3iAF8jrVp/rjFf+oVoBt0iThk04hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xNNJiQR3;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4CB606A332
	for <chrome-platform@lists.linux.dev>; Wed, 11 Nov 2026 17:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B4CB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xNNJiQR3
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8241a56cd70so2163337a34.3
        for <chrome-platform@lists.linux.dev>; Wed, 11 Nov 2026 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417930; x=1795022730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPkKw5pYWqZKfuR6l0Uwwj3160zV9BnT9S/XFeYV53o=;
        b=xNNJiQR3qWvsAHPEVu/QNC+UwDTrzTWe7J4vKVjg17W+Mk0RdNuYDTXRaRG23p+LWx
         i7h2G6uDlY9woGEhHglllbITSE/24k1XEwjfSdr/YOIb7DncWHhDny4fBVuGOIa/BrfY
         CUvC9EcDqnHE7iuUUcppRhPZ5CMtBSESmwiG7+K2riuczg/mMXMg4zHRPkbNW3QQZXiy
         u++DoWwj1rog5d1AhQG1vQ+B3RuMu58ZqtQZ9hYh3llkHZv+SX5FZkvJzCBHehG90peP
         NyOAzOT/rNbK0tqCPmcQdqNuUAg8znhSgcQn1tiBDGCzIS7JWyq81tOpLtwCutA70GOz
         Y4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417930; x=1795022730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPkKw5pYWqZKfuR6l0Uwwj3160zV9BnT9S/XFeYV53o=;
        b=MAp4w22pXDWD2xw7lBVEP4y+1VZajNBdFLO6jHUSdHpgbUXUF3HtMlxYDMO09sE7eG
         Zwptzdx+Q80bQz20w33x455TTVBxzzxYFiVGOKe3Fa/GH+tl8foKj9xkBQYaTi0UYTQb
         1p4WTg+I1Fuhi3vFJdt+LUNHzh9J6m5tJSSHzqnBpWgcL0/xrlZ2T5kBvZkFSyYAqTCv
         l1RFls6k/JCErtdFM4ObibuwKWshWWNmM8Cu1Pe+towXt6CdfQ3yGATIlwTpjHV38O66
         V5AzTpD5OITDic9m3/GJws/XpRL6gYcvrmo8ssGOaj8gP7s4fI4fnC7zQ7g5poK6q7Sp
         dJug==
X-Gm-Message-State: APuU4Z/Hh2DR+48lX+gQGXJKZwmlhvnNkanWv6apaBUl1UQcV2FiNxnH
	AZ3ilwl2nYrLQCnsb+50/rWxe3GDNy08WGI+rgPmhxOBFlJmUy7pLUBr
X-Gm-Gg: AYBFou3JIupv4b3Ill8AkhD0ujA0SYMAzr2wauAZ0XMFHw872i/2n9IB2XlajExIq03
	CyfxiPVDcO71JnrpTY7H7vJuiU/oR1k93udO0B8pbu7ejuxL4TVNIDgzkmEDU+/CUZdrlKCMbrG
	/LyDmJCHuwZFmteaL4HVrEzZMgETAhoctqYAsLD07SWJ6rprNHn54MXEw4+zAtDIYe/L7b9nLfj
	4MWMR3nSPjogKnqayqr9eQjQKr/3QtWNJmsYayCSpxXrdO7IidlFHxgTXOHUVPoaJWLvU+2XoeJ
	z1WWY0Ul4Bb+F6rI1RzUcVvh7MAp92GXAKukVSOpPJ5N3rPHQmZxQsVrX2s+ESE0t5Y3szeGT4K
	M6ucDwB/Bw0QEF0OroBg66D8HM4VCOFKvT34TkxYHSJ0lKsQPcDimuA5yOnGry3gq0kO/28X/js
	aQGNF/EFTSZVzEg8DG+CTP724NCJc/plCSy5ADAr/4pBX3WgSNO3Jo3fiYvYjuBEMGwtSq/O+F/
	TNjFYNmqnjW65ZhtJvDKu+Ue5CZZPUXF/uVOexpelnyjv9Xx5dksRa8FNIvu1+uqJn+Kz5Dp+A9
	e+9VP0EnNIUphJMMts6TO2/M6NM=
X-Received: by 2002:a05:6830:4128:b0:81f:6ea9:aba9 with SMTP id 46e09a7af769-860f28d9cacmr2316447a34.20.1794417929931;
        Wed, 11 Nov 2026 09:25:29 -0800 (PST)
Received: from sh170r6 ([47.221.188.53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f7b4sm4833693a34.4.2026.11.11.09.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:25:29 -0800 (PST)
From: Matt DeVillier <matt.devillier@gmail.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matt DeVillier <matt.devillier@gmail.com>
Subject: [PATCH] platform/chrome: cros_kbd_led_backlight: use matched ACPI device handle
Date: Wed, 11 Nov 2026 11:25:17 -0600
Message-ID: <20261111172517.1407888-1-matt.devillier@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ACPI backend hardcodes \_SB.KBLT for brightness get/set. Older
coreboot ASL places GOOG0002 there, but newer builds can nest it under
\_SB.CREC, so the absolute path lookup fails even though the driver
already bound to the correct HID.

Evaluate KBQC/KBCM on the ACPI companion of the matched platform
device instead of a fixed path, as done with the Chrome TBMC driver.

Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
---
 .../platform/chrome/cros_kbd_led_backlight.c  | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index 8f992a8f79d05..ad267eee8cadb 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -47,14 +47,14 @@ struct keyboard_led_drvdata {
 
 #ifdef CONFIG_ACPI
 
-/* Keyboard LED ACPI Device must be defined in firmware */
-#define ACPI_KEYBOARD_BACKLIGHT_DEVICE	"\\_SB.KBLT"
-#define ACPI_KEYBOARD_BACKLIGHT_READ	ACPI_KEYBOARD_BACKLIGHT_DEVICE ".KBQC"
-#define ACPI_KEYBOARD_BACKLIGHT_WRITE	ACPI_KEYBOARD_BACKLIGHT_DEVICE ".KBCM"
+/* Keyboard LED ACPI methods on the matched GOOG0002 device */
+#define ACPI_KEYBOARD_BACKLIGHT_READ	"KBQC"
+#define ACPI_KEYBOARD_BACKLIGHT_WRITE	"KBCM"
 
 static void keyboard_led_set_brightness_acpi(struct led_classdev *cdev,
 					     enum led_brightness brightness)
 {
+	acpi_handle handle = ACPI_HANDLE(cdev->dev->parent);
 	union acpi_object param;
 	struct acpi_object_list input;
 	acpi_status status;
@@ -64,7 +64,7 @@ static void keyboard_led_set_brightness_acpi(struct led_classdev *cdev,
 	input.count = 1;
 	input.pointer = &param;
 
-	status = acpi_evaluate_object(NULL, ACPI_KEYBOARD_BACKLIGHT_WRITE,
+	status = acpi_evaluate_object(handle, ACPI_KEYBOARD_BACKLIGHT_WRITE,
 				      &input, NULL);
 	if (ACPI_FAILURE(status))
 		dev_err(cdev->dev, "Error setting keyboard LED value: %d\n",
@@ -74,10 +74,11 @@ static void keyboard_led_set_brightness_acpi(struct led_classdev *cdev,
 static enum led_brightness
 keyboard_led_get_brightness_acpi(struct led_classdev *cdev)
 {
+	acpi_handle handle = ACPI_HANDLE(cdev->dev->parent);
 	unsigned long long brightness;
 	acpi_status status;
 
-	status = acpi_evaluate_integer(NULL, ACPI_KEYBOARD_BACKLIGHT_READ,
+	status = acpi_evaluate_integer(handle, ACPI_KEYBOARD_BACKLIGHT_READ,
 				       NULL, &brightness);
 	if (ACPI_FAILURE(status)) {
 		dev_err(cdev->dev, "Error getting keyboard LED value: %d\n",
@@ -91,17 +92,15 @@ keyboard_led_get_brightness_acpi(struct led_classdev *cdev)
 static int keyboard_led_init_acpi(struct platform_device *pdev,
 				  struct keyboard_led *keyboard_led)
 {
-	acpi_handle handle;
-	acpi_status status;
+	acpi_handle handle = ACPI_HANDLE(&pdev->dev);
 
-	/* Look for the keyboard LED ACPI Device */
-	status = acpi_get_handle(ACPI_ROOT_OBJECT,
-				 ACPI_KEYBOARD_BACKLIGHT_DEVICE,
-				 &handle);
-	if (ACPI_FAILURE(status)) {
-		dev_err(&pdev->dev, "Unable to find ACPI device %s: %d\n",
-			ACPI_KEYBOARD_BACKLIGHT_DEVICE, status);
-		return -ENXIO;
+	if (!handle)
+		return -ENODEV;
+
+	if (!acpi_has_method(handle, ACPI_KEYBOARD_BACKLIGHT_READ) ||
+	    !acpi_has_method(handle, ACPI_KEYBOARD_BACKLIGHT_WRITE)) {
+		dev_err(&pdev->dev, "Missing keyboard LED ACPI methods\n");
+		return -ENODEV;
 	}
 
 	return 0;
-- 
2.53.0

