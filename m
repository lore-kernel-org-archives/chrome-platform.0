Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C45444707
	for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 12:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450854; cv=none; b=GqyRzQKtDen46UJnY5y8/6X8RI2iecoiDx7YCiO1rA4HSSYQ/wajJyRBotGOddvo6HQd1N40tMQ/tvdb4jdThYsaLGGP68xcIyNZWPMD0MXI8poNacPyntZYdo22MDF+tXJGVI4MNPIYmeTUestfy+OgpTWoW9JFzRU0/mFlExY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450854; c=relaxed/simple;
	bh=uirJlTrzUDnDWGluHgHaYZhmNeiDmkFi3DnjsuZpHfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqutvm+Ai8IrQx/ctFmpqVI2uM8tSu1HmN7WJjZr/sT+9P9WPGLT8h/7ffzF65WOzeatbnXniq5ACvo6zthBhZLPlHIm/gVTl8lV25VVBeLTtoEnMUpZze3WkRr7izfgbkbjzECyQ4H77/EMhfqC4/dfvYVX5770EZf2vIGN0Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XJDCMNHy; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XJDCMNHy"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so732744b3a.3
        for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450851; x=1787055651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsFbGvUc+lL3nEmcNAop98oZPFXcbP5zb4ZbtxDxx0U=;
        b=XJDCMNHycSm9urAbAX0yV6jjVJOEMLrb4xScQqdWd2beRDuoKUDOndZc1K6C8ZgWXC
         GlkNinuBtbqVxM3BxF6w5T917thl3fraxsLrC/e5xjO3CUfyrE2CjRNJQ81toABsO4xi
         9h376/8rgJhQgNlWucB/81r0SLEhh86+2D+uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450851; x=1787055651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GsFbGvUc+lL3nEmcNAop98oZPFXcbP5zb4ZbtxDxx0U=;
        b=qH3ldOOAGm2h0YpA9JdipaYs42yedvt3eGwRIxpMk4Nt/53P5OivyqLADSJru1V/XH
         KIZLkpM2Bow9pzdEhT8HczHbT0cIIxGSYx4VwjJRulxXc+BwNG3874/PgmkE2lssznTo
         N1I4M6eoIKyEJvDIeZiJKGayl1sJIowqDSQNBzA2I+Tc84yiiMkXhyYLfZuhWbnbtk4X
         f2JTPPvHAANLguXSl6wtOY4Lpz2fCo7wzjEd6IzoDBIPzLWI3IWFDsEjXpFriYhGLb1n
         USsQE+7MqXJqv65Iz9t+0wuOoMltgkOHpSOauY7UsIFC2qBX20cVnhy8jxTDtOhVPMvP
         NSvg==
X-Forwarded-Encrypted: i=1; AHgh+RonSrmdArymTvPD3VTHy1iwLxGDPYBlpeSq/quNXA1BJ60PAbGdVoJQOgkqLP8AYDrRxC/jcI24UuctxNouc/g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpmEwvFljRfs6b8Yn+m1PQL/1tzQblpmWzAvpnFQJuksVG2o5g
	nS1hXrAOL+YYYbnX3io69BVDjN4Wm7Tio1rOCFYXHmRGcNBiiWUY0fZyKPIBuAseCA==
X-Gm-Gg: AR+sD12Fs5V9zh0CiLinjmQmDazkSnxzeRB8Pw2e1+pYqc0NYf/QUREbw11ngfl43Sj
	1VSE9NgRcOLQmUVpO3qBrpwSHOGOMr+yQN4LsKr8geawfnvzWjc665beQoOWR0VHqqJgq0z41PS
	a9cb7yG9xzxzvDX6h0i50jeyHKgmcEFmthR5x4cwMmHbMX2fWtcjqLW9jyNa+8IEtNcouBUY2r8
	8S16Coco4I+jAV2DamwsfiwdJhjed6uNDJ3COUVloguPil7UKILYVkgseGygDUIgXRblc5UXFBT
	wxmezl286Uxe1Dx6VxSQg+uNkwZWveC77ImyhO4JLRhbMsKAjv58e/Z/sw8frAieymd/07aW4IX
	I0i3kTPY7M9Bit/cyEb4zUSERzabi6Hzgi40yRoDZ33uBWVPePpKlMrBPKSzjHyp/44efICGHMX
	Z6Od3K3xWCbw95txNJPOczfGhfAYZhaWiCLhKvlZyBMDBQ96d6UGAkbi4CQkq8jUJjsM71bUWah
	QfXszcIfI6AfqKVHlz8PE++shrQv2wqya5MuBRITCjs0A==
X-Received: by 2002:a05:6a00:8d1:b0:846:22ea:e171 with SMTP id d2e1a72fcca58-84fa872c289mr2761703b3a.3.1786450851388;
        Tue, 11 Aug 2026 05:20:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/9] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue, 11 Aug 2026 20:20:04 +0800
Message-ID: <20260811122011.3539250-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.55.0.679.g6767b8d81c-goog

