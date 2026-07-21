Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FEE43635E
	for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620461; cv=none; b=LRZCLj2GCX15sOkKBqBMu8fNbxBnkGN48SOq0ekA6vclGBugUFdabC16Z1MhjSbXpctCqEO7nUarmsWIusBAyebDqmyToSPobH41YrLl0Ml6YxQxDWJHr+1fRqK/2jNRd0z1yGuCqK1kiow2GeK0evx06vGpAOHGGD3PHCxVtow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620461; c=relaxed/simple;
	bh=v6GPocRuAdYXxfW5GCiY7PkoQqyVIhzeyfAlaB/90Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqOB/75TGmc3oxvSDtPAN+jS2dE7ynhxkdSWzSxxR9+F8nXEd3wM4y+WAzJ130E4qF1z42NlgtS+nXI8FH6Id+Xcr4waMUT81smdMVqi6Ca4h3SwHjaPC4U9jdGRNVpyLOq5RIH7NihFQsBL0dosbeVMWK6/UDmmjgUhzDMs048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lQvhXdvU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lQvhXdvU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so98888355ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 00:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620459; x=1785225259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwE3F1d5K76sODY+n24O04o43zDEBUUtH4OGbkRqhTY=;
        b=lQvhXdvUK0iNv1sEb69o3S5UHJ0/IzLPdZfJ+BCSwgVAiiGyfiY+ri5P+6YVL8hjF+
         apKsZHRD/l8PkthhTERJ2gRRv0MN21X/NoC3uWmzEkYQwb6Tefj2/ot1FivwOu4BpJ+r
         4NbtUrzQD21FPLynt9u53Qx+AI7uHnboVMYOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620459; x=1785225259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fwE3F1d5K76sODY+n24O04o43zDEBUUtH4OGbkRqhTY=;
        b=R/mAWJXgXkm9ByEMcj9R4PGLYiv70/iiqao9RDMp34HEzRE8I6VCGCa0B2Y8O/f/BQ
         Dpms3I/J4yytzpwy4EgdeQQrfa4CpeabaUTHt5FqoLtrKraYQrkdVTIM5bCH5jRHx4r5
         QYn+5dfUHe2qKzAYWzADmZSAWPPyyP8f4omnNIVDpwBmqwsmNIdwKySsupD6x33C66eg
         n/hJGyfokLznT6VlIvjlOKPIeB1wNRqo4Ot2IvD/wuC9MzBTYRgKb6OyT9cfZloWI5L2
         VvwELp0E55D5PQxXq0oZSX1UduuF2APKHfOyLWyQDCaOKhgEEFc+2FtGB0npHKdOdZyn
         sQjA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2gLAGheEUo0TKS7RUWS567rd3UXjztHMR0q+I/GoiZOG8PA4NsFdu6VAgeRz/gN5UT8aN64nu3DHB7XbyQBg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIiGn/OI9dagJG2U0mjOyv8/zrIVgpxT47BSG0T8On3L1DTV/L
	geYLqd8UTw8YOMZEuuZS4ygnbxdo6NGv7pN7FAjJ7ueTTqRqtgjoFaLXEDEmFGkjaA==
X-Gm-Gg: AR+sD11fwv0NzKnv4S2Q0BGhjp5+Qz0bGoJH2AIwghuO8+OUKagO4XHHJBx38pgs819
	9sApTH3YD0wbZruHRhYuljzl1j49sBkIbHmugWPjXKlPO6/JKAIKARar8ccQXZanAbGQQty5Rt+
	wF2iNMNRTjN6H4xpRbiKPQGaHdbIrZLnhYihkrXKyBtXvNepEqJVizt0cwOeB7MSm7BoO9s+mZU
	exhlrJrfgVZe4qu6CXqmiltqMIidT1bk1LVe50aeFYVConjeQGGTxZ76Yra9KZH6r+5f4hKvxkS
	h0yONWITZ06uIa/iSJ9oVfQrPPyBeLCJzqlwL6Z5CAp+EC+EINIrXCaoSPdrGGegcWSNyT85F+G
	0FbVZ+10EAuTd7r6ubcWQT6GXvANH8notG+/QFzxrEeBhS2LNI9itEG7zkZ1rrauK1JvVal5JZt
	Dg2R9gsXCFSoWBL4oMbJ6Qeoa9FFXTxILexE1ekrOQMY3PWHVAFHJT0AdDz9c=
X-Received: by 2002:a17:903:1ae7:b0:2c0:e5ee:f554 with SMTP id d9443c01a7336-2cf34895672mr185287855ad.8.1784620458954;
        Tue, 21 Jul 2026 00:54:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:18 -0700 (PDT)
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
Subject: [PATCH v3 5/9] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue, 21 Jul 2026 15:52:19 +0800
Message-ID: <20260721075226.2347933-6-wenst@chromium.org>
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.55.0.229.g6434b31f56-goog

