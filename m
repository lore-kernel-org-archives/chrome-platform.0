Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA38835E1D1
	for <chrome-platform@lists.linux.dev>; Fri, 29 May 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049923; cv=none; b=lI2tBZxCtBaYMLM5bhzQGTqRTCiR+NAsWxYbwSX0+u3f7wcJ828JOU41dxVIzwj0oxc6CoVcXMheenWbouSr/sBErAUDLJQb6syCkeHlePfWrknTw/EjruTpmgrrYnlsuDKiUFmNphi3duM8h0oX8onnuljdnX05doLRUgghcRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049923; c=relaxed/simple;
	bh=ZGeJDqlQ5zn3sDwaZY5Ll8gY7osGz8I1jAxqo5Bjml8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oRqGXrq5tUBVuYUfptsQm9lYSHwFtIKjfFSO9Bp4mt26kBkFZOuEsd3WjvyqPOJydw03BHqLdwIRdXRFXBA+yM+mhLqeW9e04PFmrtfpyWd79m+vbGoDnGm9hyJrdSanNjiVfFVEnr+juibdC7eIpOepbVg+CpdDuWziQHV96+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RY0F0bxH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RY0F0bxH"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ee1a56328so1856574f8f.3
        for <chrome-platform@lists.linux.dev>; Fri, 29 May 2026 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780049920; x=1780654720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy7L9tmuyHwxiGGTZsJP9P4FkDNJKuKhgUpt1VqiYIk=;
        b=RY0F0bxH3NOrPWiorLsD5dLXkb6b201yDL6Es/BIRItF6tVuSf9SZfmHsGZKgd1K1B
         07et5Rsxi/VIpi6fMod+gXFenP0zyHIBbUnWQ7ZvthynmBzMzBbHwPGv1b6TgUKm8Jj+
         26xy0ml3y8nplJSv8+A+oal5Xnvxos0sublAcyWAvh3Hkj2nFejRE33ypp7X3D9bpab5
         23rGZNzILgOKwv/bP94+/eeFLeIS9MBeMTqsy3XYDMmFwVaqA/FxTF8COWpgQjGMaFto
         xLB9KGM4dU5/EV9Zrog7cfB2pPDL8zEBz0ZJWR2jA4CMZkc2Mj6PXLtAFZEy1mm5FGlP
         cHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049920; x=1780654720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zy7L9tmuyHwxiGGTZsJP9P4FkDNJKuKhgUpt1VqiYIk=;
        b=bznayh5e4gOEHoG+kT35UlGChA0OulYY9+wW9s7T9sSZT/YrvOeHpMSdO2vncnFZPV
         WHjlCYyS8/qQgJqmvutDf/r01dg5DpN19YbB7bYhDyXuNfiJKeoaNUiHOLS/Tm06LZdw
         SvS2Wu0hlDWQ7+S3Hl4xp6KeAG1bm7k+3FW+u+fpcBDPRfN03rB+gSb2cUDSOY12RH8r
         M50oytnqQ9wc5H9xZN4bjIaHMqYCsa7OVUKSWiWYg5+E3eVdHKc97pLcbEF5J7Yura5L
         z/KqXMPapAHC1tZ4g9sSNWfKNrtXXoQEBpL/2CS2lbzXRbLGQbApUOt8o3q+5ADB6FUQ
         WF4A==
X-Forwarded-Encrypted: i=1; AFNElJ+5HhaDcGc2LJUMBnrcd6v5XmdmJESLqCkQQSsaVcoPxe45pNJ+YUE4wPF/U2IVJpHkQkEzah7L/I9/gc5JDok=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRE/fDyAnZSEGMN8G/yQauURdiAMOebhQ3w6/6rOCpG6epSrOd
	LKIj693jKXJBAVdUJfOzL9XPNI4bBxvp/H+rOhOO1SgYh5H9WKf/paieGt2rL+t9QCk=
X-Gm-Gg: Acq92OGk+ldSORt0W+AJgUMxtwGRzqI3+B9EP0b0VzBe6YHW3xBgQP/U+5FjE2Pu3tt
	v6bQGEmvimMCyeklWaB1BrrABlhOtdFZ+u2vj9aFzZSwk3ElmMHnaFPHVD0v6O5TDp168507b9n
	QdmonK6fZ3hepHxCxj3c33RGW9k/cPNp8FSInS/M6u/9v5cjhK5sIcO6sVonSMto/oDj1FuSWK8
	68nGwpTAV2uT2MjJa3dKJQ7GmSDhWf/l/A2xq2E1cVKhqWXx7e6q2gR4wvXECQDtrLrBCyEYhaP
	vBSUB+iPsnzCtc6EX2weLcgOj2cS2raRi9gFi2kNnWb/bqA8rh7K3jY4UPVkeankRWiaFrtS22u
	FfrnLGZEfIJaTLJ1CrC/5um/MyesKqqwqXuwPplLqUteNBHpV0oL8n812oZ3dyZburDSfJ+BOj1
	DdYIG5Oh+XmqhNBWTtwmeC6xyu0TZ/LPzeIblt5UGfZ+2rqLZDQhrnXnlnSP1YlWBDP/hOzXoe0
	4HRs350HMrh7TuCvUeygowbffLjis0lYWxf
X-Received: by 2002:a5d:59c8:0:b0:452:11f9:bc40 with SMTP id ffacd0b85a97d-45ef13fdda9mr3781185f8f.2.1780049920296;
        Fri, 29 May 2026 03:18:40 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef34b7d6bsm2713604f8f.10.2026.05.29.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:18:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/6] power: Drop unused assignment of platform_device_id driver data
Date: Fri, 29 May 2026 12:18:16 +0200
Message-ID:  <ba3589f74a12d86fb02ecb9fa2e89532188c22a0.1780048925.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5195; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ZGeJDqlQ5zn3sDwaZY5Ll8gY7osGz8I1jAxqo5Bjml8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGWfqtfq+9A3frNKKJCHEbGuIcYTcFXCF2IHyc kqICPrBt4uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahln6gAKCRCPgPtYfRL+ ThgQB/0SfE9NuMu7Hd3egut28Uzkkhz9VNhori5S7ABqbeVTWxqb+jUq/TBLBj/5pw6lSBgy3Qz cgzdMp0Z4as+qcuVdCLEf1Vx9Kw7QLHEfEN67xWIV19vtfkQKBzTW/eVYE3Mvk7uRHi88Yf2xc/ ISOMROlVD0YJH0HMpWnlmT+JcSFH9VRMMWZN5ijf0iwLw5P9jmZzvQCbxP7OnHbhQI2bOrcklBo VCLTD6+DS091zAY12+nLJcdNWPQ+ecoroE4BejwRFKfdH1WAOlcZPn8tlsj7c/tmCfoBlFfjR4z gJd3h2J+BsSB749HYL7PAg/+OCFMcYkyBlIu5J51njvCBZ9h
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignments.

While touching this array unify spacing, use a named initializer for
.name and drop trailing commas after the list terminators.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/power/reset/qemu-virt-ctrl.c           | 2 +-
 drivers/power/supply/charger-manager.c         | 4 ++--
 drivers/power/supply/cros_charge-control.c     | 4 ++--
 drivers/power/supply/cros_peripheral_charger.c | 4 ++--
 drivers/power/supply/cros_usbpd-charger.c      | 4 ++--
 drivers/power/supply/max77693_charger.c        | 2 +-
 drivers/power/supply/max8997_charger.c         | 2 +-
 drivers/power/supply/mt6360_charger.c          | 4 ++--
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/power/reset/qemu-virt-ctrl.c b/drivers/power/reset/qemu-virt-ctrl.c
index 01409dfe2265..aa8355270b2c 100644
--- a/drivers/power/reset/qemu-virt-ctrl.c
+++ b/drivers/power/reset/qemu-virt-ctrl.c
@@ -103,7 +103,7 @@ static int qemu_virt_ctrl_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id qemu_virt_ctrl_id[] = {
-	{ "qemu-virt-ctrl", 0 },
+	{ .name = "qemu-virt-ctrl" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, qemu_virt_ctrl_id);
diff --git a/drivers/power/supply/charger-manager.c b/drivers/power/supply/charger-manager.c
index 1b0239c59114..fa7518e9d72f 100644
--- a/drivers/power/supply/charger-manager.c
+++ b/drivers/power/supply/charger-manager.c
@@ -1649,8 +1649,8 @@ static void charger_manager_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id charger_manager_id[] = {
-	{ "charger-manager", 0 },
-	{ },
+	{ .name = "charger-manager" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, charger_manager_id);
 
diff --git a/drivers/power/supply/cros_charge-control.c b/drivers/power/supply/cros_charge-control.c
index 53e6a77e03fc..b489325be816 100644
--- a/drivers/power/supply/cros_charge-control.c
+++ b/drivers/power/supply/cros_charge-control.c
@@ -320,8 +320,8 @@ static int cros_chctl_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_chctl_id[] = {
-	{ "cros-charge-control", 0 },
-	{}
+	{ .name = "cros-charge-control" },
+	{ }
 };
 
 static struct platform_driver cros_chctl_driver = {
diff --git a/drivers/power/supply/cros_peripheral_charger.c b/drivers/power/supply/cros_peripheral_charger.c
index f132fad288cb..9f67a6dbd94e 100644
--- a/drivers/power/supply/cros_peripheral_charger.c
+++ b/drivers/power/supply/cros_peripheral_charger.c
@@ -369,8 +369,8 @@ static int __maybe_unused cros_pchg_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(cros_pchg_pm_ops, NULL, cros_pchg_resume);
 
 static const struct platform_device_id cros_pchg_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_pchg_id);
 
diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/supply/cros_usbpd-charger.c
index 7d3e676a951c..308e1d4e6dd8 100644
--- a/drivers/power/supply/cros_usbpd-charger.c
+++ b/drivers/power/supply/cros_usbpd-charger.c
@@ -707,8 +707,8 @@ static SIMPLE_DEV_PM_OPS(cros_usbpd_charger_pm_ops, NULL,
 			 cros_usbpd_charger_resume);
 
 static const struct platform_device_id cros_usbpd_charger_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_usbpd_charger_id);
 
diff --git a/drivers/power/supply/max77693_charger.c b/drivers/power/supply/max77693_charger.c
index 027d6a539b65..76c58b32a374 100644
--- a/drivers/power/supply/max77693_charger.c
+++ b/drivers/power/supply/max77693_charger.c
@@ -788,7 +788,7 @@ static void max77693_charger_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77693_charger_id[] = {
-	{ "max77693-charger", 0, },
+	{ .name = "max77693-charger" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77693_charger_id);
diff --git a/drivers/power/supply/max8997_charger.c b/drivers/power/supply/max8997_charger.c
index 1ec3535a257d..19da9eff0372 100644
--- a/drivers/power/supply/max8997_charger.c
+++ b/drivers/power/supply/max8997_charger.c
@@ -268,7 +268,7 @@ static int max8997_battery_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max8997_battery_id[] = {
-	{ "max8997-battery", 0 },
+	{ .name = "max8997-battery" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max8997_battery_id);
diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/mt6360_charger.c
index 77747eb51667..69955f255091 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -841,8 +841,8 @@ static const struct of_device_id __maybe_unused mt6360_charger_of_id[] = {
 MODULE_DEVICE_TABLE(of, mt6360_charger_of_id);
 
 static const struct platform_device_id mt6360_charger_id[] = {
-	{ "mt6360-chg", 0 },
-	{},
+	{ .name = "mt6360-chg" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6360_charger_id);
 
-- 
2.47.3

