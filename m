Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410EF43635E
	for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620457; cv=none; b=KlINFGbmH6OEIyGosRioVXhK5+aKfoDH1lISZFyHFaA8usfCKFIzsbF4Hni6VuhCznPkIrTeacM1UbimUhegSsHmv9RDuVH2dxWJYQv1tO7Qzx68bDaZnHmq24zM1+oRzY+J29Ic7DasdXDcGFm/khhDpNXka1/30zBQbzQZPew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620457; c=relaxed/simple;
	bh=J3v6D8PZoDet97Lhy7NyAMAWEZCEiDewv+amHOXW9oI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q3Pf+1xUTCIMAvgdw9NNzc9MyZFWzaOU7dNEq3GCBKOtrojueq9c0MemnsVdYZxQrR79omQnhuBZ6laHd6qVKuSnr/ju1AKIOrAEtvw+4MUeLJHXXejwLhv8hrxBXZgbh2oIgv6S9wMYQcylqfG3m3uro1BePClqVun2e+X8yNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ICcIaEVU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ICcIaEVU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceed7018c8so50274775ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620455; x=1785225255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNKmqRLcn9Q9wFj4nPUvbsCt3JMsfIzkeIOJzLyzvCI=;
        b=ICcIaEVUu+8RBOeobiGQ/2iGOLKlO4XVkyXDfNcugiN9GjdjWqOzt14EXQm62gjscO
         5rKdqYpnpEmGe3H+b+7U2XCA6RQgFRxlKkObJzKIKKUHS2oFTefe9CRfUapqITjGLnQN
         eKcILtAYCzsLjWsF2KYPDdxrdQ2fgt14MeWZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620455; x=1785225255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNKmqRLcn9Q9wFj4nPUvbsCt3JMsfIzkeIOJzLyzvCI=;
        b=d87ysGhKUWouDCL5hs/WViLu8EyImOkH9jN5DYtflFCgdWg8hu228sfeSOkEXKB3wm
         PMk4VWOM/ePojAVwdaRCtGoi4TunWgvFFF9rCQVzdW3sIVGD0lS0eMWOF7me0iMsS97T
         umHK/eiwwEaYMuDeylQJipUb0YqdBC9z9KxIqCufTXeRuHVgxbhvLMVHR5MgENuZ2dyI
         25jqPqwkpSGCnxUdH26SqoMvETGjHqOLCAotLR28ehRkydGraKjYzeKaTlbfv18zTDd3
         6DrKQDk/XWAwsHTn8RVm1aYwCKnyccaaeiKiLTq4LpLeTavEBpGTncJU9rqHXwHn6oeR
         weLw==
X-Forwarded-Encrypted: i=1; AHgh+RqkNK4mkej31n9S/k2DYW1LdzDoIlJjGupj/OkBYX1tLrNOGVgcLlej1EhPSqVWcTxhJtP4L3TCRbs8Q5QGzvc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5KekExYnDV7asQ7J51fWSZ8G1sc/XBIwocf9nBzpVnhoCQzhP
	l06lhZw3J7OgmrECJK+SDJ9cx+j1E+EjifBmcRFaktJkaAUPTxQFvECkQU9dKgtZug==
X-Gm-Gg: AR+sD11AVgbbWjnF7VqyXh4RO6hP5KSy4nEcxNdAMPBuK6I/MJbP0l75eaSk35LScKS
	sDr8y73dyjEzyIh3qtzFyIbhP1+ATn7uOBRbWP/xOLmYrJGJsoFsfQNE7eo/IHSFs4x1j/GrkKg
	7MEkjWiJJ7RIiKiwkCjxMeaRaHKisrC5XlijlP4ZHOyPWiQHJVUFxoYytn27BO/7WQAssvM75Mv
	C6rcKrgJZxfcWukDmlCm+sbeJIC+rsGX5Kl04535P6+XPIH5FnE24Y8MVacQR0ZgZBSvcI4s5H9
	fiwaiTzNmMbdRwpQEaM+oOik/L3LVRQPOWCtxil8zDo7yDHJW2XGp2CqNRyJElK0mOfvrEsbJxJ
	uXDrsAr8OvnSwWGay9EsygNNFOSCWbb8AimwE8bEk7gWXIuLl3+NWsk6siMsQ5btiN6CsIJOZ7f
	G4qIdx3d8PZWpucm6CDhXHLsvDM2zpNvaRbTUWVy6/99/RCry8h7Kk5uMcQDSVk+of2QTTVg==
X-Received: by 2002:a17:903:2f84:b0:2c6:a012:6241 with SMTP id d9443c01a7336-2cf34850f28mr198999395ad.6.1784620455632;
        Tue, 21 Jul 2026 00:54:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue, 21 Jul 2026 15:52:18 +0800
Message-ID: <20260721075226.2347933-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
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
2.55.0.229.g6434b31f56-goog

