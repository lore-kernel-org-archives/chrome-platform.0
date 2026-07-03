Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5913CC31F
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 11:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079786; cv=none; b=XrxTF9eQHUkBBsa12RtadHlasRS+rYA3xDw+IcsVlrGPWJckRZ/4V2rzjXm42NtpnSvMoFLOKmzz9MwnqLO4KHk//ZO/WaIVOEI8dabRWMXhDcsUaU69mzMNsoolNnMDtL+lpxm4aC7ce1T/avthyVjAR0q4p2imzTx2JVT2dmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079786; c=relaxed/simple;
	bh=Pzcw/PU8fgEt1+CMQEaORchCpFD86JpQkzeAI5IPaoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msqQHxBYLmuN8hYpmEN3Yfz2u7u5fE5X4g9NYH0jUW3SjT4ijWK0jwDfMmHXNwaXcj2Pj6qr4xGtEOpyWxNuaix2ouwQVDBF499P0203AtEQnO8hL/FW2y5ue3sehDpx3IKLhi1JYp+g0OKrPZem2IDUlhOdKMgPUHbOlB30jis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Hchw3O7F; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hchw3O7F"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so358407a12.2
        for <chrome-platform@lists.linux.dev>; Fri, 03 Jul 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079784; x=1783684584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gw4z7buIoW/cUS61jHzCC4K3rs/jF8wPJIaBNozTAWk=;
        b=Hchw3O7F//uwQt3xrSAZIKRwXNFa4+U8pPozdkZ9ObnbMzH6+jCk+WwdsF/Lgtrxnt
         mirf2MeeaGNKT6sPZDzaO6gWbWdGfQcBJPdWul/A66twsrgE1ugJI2beXv9hAbpfpNx0
         B3+XBb9dKkhY0zlW/XY947AXlnm5EvRdGMSq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079784; x=1783684584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gw4z7buIoW/cUS61jHzCC4K3rs/jF8wPJIaBNozTAWk=;
        b=cpMYFP2StNFSk/TOtMldkLkFjWq692AZRTQPiSoIrDYoz/4dVxMBxz8DB67+OAB0pu
         NECYbg57UBnra82zhArxa0NxdTkE1AJhyeNyPFXQPkyvxpbzaAmbiITCldy6XAXrNrjc
         TJRcPLQiGcFfzngri7iaaNNunE+HTha0COx7O/5tIwMjOfd9pT225GR2230GydYg9lfq
         /R9AHBWQfM6LPvHmbo+RPlCymBjR88Lqc31nGkCTiKJ8mBs1FTAG7KPKsHeVisOT3n28
         qFGMmRQuXM0zb1I8K4unN/azcpUUA8r3nQPFKWRkMA9TctH6uLL4HNZ41m5gPkgDIaRS
         X63A==
X-Forwarded-Encrypted: i=1; AFNElJ8GcykaM0d+EFX47TSAAHLLJ/tKbOLS/sszlGSR2zJyEiJOZU3/epPxzcAv/SpzVHrLmO5RlRqun7wRryNWeFk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNO1ybB3Re+mJSwClXkt0vlJBGVfp4Fm0fyEscysEMKWo9bWNK
	m+l9viIuVduGyGAjCXhF2w4TyP0gSP1Yom1Q65+hROx40qiTJTVgSRoZfet1qYFlsw==
X-Gm-Gg: AfdE7cmBzVFINjOFudfPY7vtMxBXNtnEI0a61ogkpCBV07Ur4R9RsDlEHNBtHJZYacR
	h74zPgUJ5SocoX3VajvMgMqcC7r1FWPy/mKvf24EeUSPniGU4XWyclY2cb24h1QOGCXBI8yfYeM
	Ct5zjiXILFo0c2AxahpMymt2ECZHbBNKOQfuTkfoSLQyAQ29QJ5N58DFkpQoKTUYEIGQHOsVaet
	Y/jBv5Of+PdAZ5u5at6kE8dj32IEDqEL2coCOKXqLkfmQibvk1z9BbpeeZg7hPPfLKf9KW3YZFP
	MRal0LrQjGpyYPLkYejoQjoM02VhBNkW0XF4V4rZhOfrUwNin7YxmGgQnQbbonOOekVoL6AxYH4
	ru+PXEZH2DBKmTgA1yDwVLFLBi3leNAG7ZC0MyBwaRIDBuwPeznxvvSLIjrEf0tNjyi0JnJn44/
	zcnx2MZjsDg1KEa0JxoBbmEHRjaLLklV0rcZlnIGB4uWcz8rcYrOOm+JL9LGepU53rJslr+g==
X-Received: by 2002:a05:6a20:1449:b0:3b4:888f:b3f7 with SMTP id adf61e73a8af0-3bfed474d94mr12242560637.42.1783079783900;
        Fri, 03 Jul 2026 04:56:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
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
Subject: [PATCH v2 4/7] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Fri,  3 Jul 2026 19:55:57 +0800
Message-ID: <20260703115601.1323491-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a I2C component is found, it's device node is immediately enabled.
This triggers device creation and driver binding. The prober will hold
the regulator enable reference across this part. If the driver probes
synchronously, then it happens within this window. On the other hand,
if the driver probes asynchronously, there is high chance that it
happens after the prober's cleanup function was called, in which case
the regulator would have been disabled when the driver's probe function
is called. This would then require the driver to wait 100 ms for the
hardware to reinitialize, even if the probe function was just a split
second late and the regulator was disabled a few milliseconds ago.

Recently, some of the drivers for the component that are targeted by the
I2C OF component prober gained the ability to skip waiting for hardware
initialization if the regulator was left enabled. This happens when the
PMIC has them on by default, or if the component prober left them on
after probing the component.

Wait a bit of time before dropping the enable refcount on our end so
that the actual driver has the opportunity to catch and increase the
refcount on their end. The 100 ms delay was arbitrarily chosen.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/i2c/i2c-core-of-prober.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f274e260353c..17495125467e 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -243,11 +243,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 	return 0;
 }
 
-static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+static void i2c_of_probe_simple_disable_regulator(struct device *dev,
+						  struct i2c_of_probe_simple_ctx *ctx,
+						  bool defer_disable)
 {
 	if (!ctx->supply)
 		return;
 
+	/*
+	 * Wait a bit of time for async drivers to probe and increase the
+	 * regulator enable count. This allows the drivers to check and
+	 * skip waiting for re-initialization.
+	 */
+	if (defer_disable) {
+		dev_dbg(dev, "Deferring regulator disable\n");
+		msleep(100);
+	}
+
 	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
 	regulator_disable(ctx->supply);
@@ -364,7 +376,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -409,7 +421,7 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, true);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.55.0.rc0.799.gd6f94ed593-goog

