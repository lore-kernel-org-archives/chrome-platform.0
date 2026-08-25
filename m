Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF593A7F75
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 04:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632432; cv=none; b=s987ZDbeqWyXwkvTX1RFzlPWD1MpnpwWI3QYH79Xt/BIc7Gv8yPI7ntlW0Z7rx/yMPNnIXfLQt+r/LE9vlP9pC6A+olmhDB5JFkZrreEoQ7o4g7ZkmrtpIKzGt4L2FR/acP49I0yNsFjbdk2wcl51HJeuc5bj/Pp22qOSMJwEgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632432; c=relaxed/simple;
	bh=hcSfq4drLww4pOwuoR8efBtvnetanTEdlwrBXzAG9GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RONjCD78ub6IZel+0gKreicZaL/gKzF6X0uQf+lePyf6HVMJrA/dwCAMIv4Ywd8egIxky20gC3oFSw3i2Y2/6uU3TBcMSuHWgo+AUBaBagw6ea1ZxnjcF73k3aIVh/6QmLDKl1rt/xYtwh1yd28KjoihSQW9pB2Du+oogzT7zKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hLcrkvbc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hLcrkvbc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso381826a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 21:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632430; x=1788237230; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oxe4lxlNlfZyQDAPdCLYOQIha/yPu61CBjEM7zjIg/A=;
        b=hLcrkvbcnh0IEXLjCnk7VC26NZRz7nz9lQL4JxUND4FWsak+ce0lZsTxlSrqTD4VDS
         RqEKFB33nHkJzE47RTtOixnk7PASwiU2ouhdHf8z38YDVC7lXMffAiVsmzzBzsTxFJwR
         DMaKDKZ+ICPSL481Bo9Ed/yLQ+m7GztGIBgrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632430; x=1788237230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oxe4lxlNlfZyQDAPdCLYOQIha/yPu61CBjEM7zjIg/A=;
        b=GtYMwujJBvytuO4rXQ/EVmziKAa+IcF/0gOAWiTYTU2tJQ3TEIs3moJJN1/1iYS80U
         6BT33aocmGuPvg2aE1Ab/Tvl1zZc41mnZd9gpS6YWJPDIIViLT1r8Nv0frU93qE7cow2
         z0XFmzhU5qW+6s0x7hrm/vCIUPKbi5cHIXxEQ4Wm6FBXUIuFbqo395odv0ave/KhBqOZ
         F2F0DHUwvUAwQMWZH+MsKU2M4/DGP9ipTnFtsH2ohFfSgbl2pf2kdugrsrdsj4vQ1d5O
         FpnDlMKMWpJfaSN40fMXqD+3NDMJs4pmQKLd1i+Gs56TcH3U77+TyyJYpFVMDUF9rWtS
         YngA==
X-Forwarded-Encrypted: i=1; AHgh+RoRnnh8youlHRCVszG3Loo8lb2M3sHTtcO2zg3VrquvkIGz790iftC4Cl1sVJOt/kciWiFl3wUXMnrjRaiJTzc=@lists.linux.dev
X-Gm-Message-State: AFuF++lQ/ibvgCxUhWMD+b8xfHiPJQS2UTMnayCFtzyW8N9h2bGSbv/C
	JWMeA7w3FatwpFQSOAus6clZz3fMVdgIdz1U64vQPXgNSI/35oKWTNBgeuMYNgaDTw==
X-Gm-Gg: AR+sD11AKo+GvKdhoXO06kwMHgCejqem0wyusN2OSMFih2/XdW7tneyTObDlhwbYW/L
	dX5FQH51yupj17i+yrcFo31T6X9pna3QfyYnHOqAdnVasRS8F4dMmYs0PR8fHfVpmejH8NZb7sc
	vyOrfKgXDEI0FAKc2sjsk5pg6da1r3MZBnbJ3Zt9Dbu8+FXSIHOX3jmH1jVaokR2sJqXPIzJyAz
	U/OSOJG8c/0TMRU/cPw3g1b6kT4cBVgjnzvl0yVJpjE6j156eWHGBkrSiSqwPHtxURIxMCWySQ9
	dfuvsioI/hh+5EebksO9zUNlkEksM+Z+c8Lri9mXXfXlUPJBkUHMcrauhGIDpbr16nwWn24QHkA
	Uw8g6E0WeNU1T23pmVhZkz27/EkmH4LoShQ1ceSvsenBHHQ3AZIWf3EQAauYeR9/8E7upsvMUCz
	ixmpukA/l6s90hQtcmrIvgScesLBr4AA309r5O7ngUGByuE/cfPhzahb2GLkHqTTcr8/37CQ4x9
	nOW778GnkJPDbZUIcs8UKCkne083ycovcCIPouBI1Te59o=
X-Received: by 2002:a17:90b:280a:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-395dee56103mr48478004a91.1.1787632429764;
        Mon, 24 Aug 2026 21:33:49 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:49 -0700 (PDT)
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
Subject: [PATCH v5 5/7] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue, 25 Aug 2026 12:16:23 +0800
Message-ID: <20260825041628.988369-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
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

Tests on the Hana Chromebook showed that if the prober and trackpad
drivers are both builtin, then the time between the prober enabling the
device node and the trackpad driver asynchronously probing is between
5 ms and 30 ms, though sometimes there are outliers exceeding 100 ms.

Wait 100 ms before dropping the enable refcount on our end so that the
actual driver has the opportunity to catch and increase the refcount on
their end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Added commit message section showing average delay needed
---
 drivers/i2c/i2c-core-of-prober.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f9f3c0ef93ff..68c929b16b06 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -235,11 +235,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
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
@@ -356,7 +368,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -401,7 +413,7 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, true);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.55.0.860.g4b6b3295ed-goog

