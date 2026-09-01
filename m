Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C7470133
	for <chrome-platform@lists.linux.dev>; Tue,  1 Sep 2026 07:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249004; cv=none; b=fC6IXEhQNJJ09vHhWDbIQpi98D/eBzZUxOihoZ+Ew33AYh6JPtWjDksithwLr1Fnbq06B8AiaNevEeEYYzVXP8+TdnsOmnQkVAcGjy0jtpze4/YyO5OVt+8h8bxUbFOeX8XhzAagMWVsdP1kUn4pCl17FqIHiAmn6QzkUoSMv3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249004; c=relaxed/simple;
	bh=KSh5c40N/ncjUkxNS2dUoSiZ9wDsl5oOe77nz1eIIdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTgvoTQFSV5wcXFg/I08Y3iIEsTmotEaWiShtULCCqA3fmK7TvM5pBktv2aMLxj1pzgg/LVu7o5j1Tvcti+iQIpJnnYu+FlI1/4jTZjPMqkhGleO9CqmfddEM4sry7jp1gjJ5NlJYpuIPPv/lkgpS687U5/r8FjwSkAI43QxHyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U9tMzZro; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U9tMzZro"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d5335cf904so42482535ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 01 Sep 2026 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249001; x=1788853801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJzWbza2zag3QhFxPq/teShXqDf76npySrhO2+9Jdis=;
        b=U9tMzZrojvbfBOVw3Mr4EOdA8dZUSxaoesJrGQ692Gm6rxgWUvgcZTAyTKZOxsCpW6
         XEH091A4+WzZF1iNzaJm3cpZIrsA58vUzf5P+P/neF116KP3RnjD4AUthB6K/0580HPp
         ZwzmCiHD6YhZHNaGpsz/oGSDBnk8uZrhebilA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249001; x=1788853801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJzWbza2zag3QhFxPq/teShXqDf76npySrhO2+9Jdis=;
        b=J2PElgPOBHankI0nBqQ3zz6XXxo49d2mhAZ0/6HIDX9pWkn0ia7281FLIKiKlV/Naw
         Vd1yXuitLKKdXwNBaCwJAV75+wa8rW8RfmymVubmGD0cD3XpIB/9T9wEzHz1xMdwbjU/
         k9n83cRIRgYrEYgBI+iLRZ41q/ScyLnpTfbcy6fEnsbK2CeYFGhXUnBbxbmWkCaC/oLo
         Vka8C7yH+2DZl3vrC4CyQzNYNgPLkVeRIVJ+HTMWMO31WBcRFWKXuTr7KIEv3NmzOLsb
         ZD+PETUA8umAy8Tc0DEMb7AiQRQ4lIGlZQYtxOnQVgPsI/gEuEkIb0YRp0Aa3bcuxGUN
         7dqA==
X-Forwarded-Encrypted: i=1; AKwUvBxiBh1hiBdWHvX0jwWLSQITdhvof1nsz3k8pL1K8Jf198K0LnjkhX7g1LbBog3L1nR1m4ovpLG7dCDc/0ofsuQ=@lists.linux.dev
X-Gm-Message-State: AFuF++mOAeQLdj48h3hj3ktAJW1zc+UBPG6Zu3R0uQ40ppiE3fCCYTI9
	qoseYEiqieAkOGJ72Zdv0PaglR3X649LjyncaXeezlH/P5KYosSYjRxiLc3R7U22xw==
X-Gm-Gg: AYBFou1O57oFU9q967qH1d78Vd9czRm0BnC3LX+IRXmQqg2Qs3OS9j7Ky+XXuh8EECx
	P+UONUTToiByBuOn5zu+b1Yq2JAfNVXfeKTn6hBMQAqyi1SX8jpetDDT+g9VKAFpKkneF47LTLa
	GzISKVJdTCw1PJSQZaiF8wKWnCDQVaxIRDUGIuK79n44zX/FXz7yZF86q5yX7sG+/wmEDpBrgad
	Ks/Rk0ddwmUukN/803qlCrxVIL8n7koekrFXlOMwpAgyBvOfDfY+nKqE4lE0DqG66Bpse9w6UtM
	BACX9cj6ORCtH1zX1OyfykYpKUJzLvO95oi1niFzO0fshyC3Sn02g2Rg6O3Mcyb/Aq6+11bdnX1
	xu+nefuSzQ1XMlNe/WAEGIZ6hMaEnrdkeR/ZoQNE15WwHu7dXM8FhyETKh9GahdTM2P3p+YoVOC
	qrVj0QvByIiBT5feHFhLl9zn0pugGDwaE3MKjLqMDn5uU6eNTF867KIL96bxlnRTXd3Qhu0sokb
	+IAEnXBkOZhG5QOzdFiW8j/Bw/Qp4wB0lwG0/8Jimvogg==
X-Received: by 2002:a17:903:3d0e:b0:2d8:d4d7:f055 with SMTP id d9443c01a7336-2d94a930d44mr91456335ad.22.1788249000970;
        Tue, 01 Sep 2026 00:50:00 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/8] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue,  1 Sep 2026 15:49:21 +0800
Message-ID: <20260901074930.764550-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
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
2.55.0.897.gb25b4bd76c-goog

