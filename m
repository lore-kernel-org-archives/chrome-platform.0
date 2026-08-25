Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BDF361959
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 04:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632420; cv=none; b=rzLuDU9VyNUsOesqO0ZnGsUyfs2QmjoToiIhnJ6uTsUdDNJ3HYS53nDJ03qkpPtwszOECwobY1TKbQhEQFqP9zqkhxsMmEgHimyKbV/CW39kHU0X08f3MTks98TBYYLSuBKVkkpoYvZy+iSs6Jr788weBfoTXIOWP9bRbl64ku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632420; c=relaxed/simple;
	bh=cRuzIp0YKHNVkHOrNUk+CYNCeyPuFKnnKm3lwy7T2Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqwpDVyKROegT7+9zmL+31KDgLBNvTvwIUuiTuRz+3FGORkx/9rVm9XcpVgt3ZpZYBhh4tRb1vP6J97jRRIkl0f1a6ZJcojyKJhPZNm3BWWZUWaf6JOC8eU9TRUsnwczWKL/1BzM2B/H/VKbXwKAczNhsujkW5JOimVvqFCF7/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lHsPjhu6; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lHsPjhu6"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3964e480f76so477051a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 21:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632418; x=1788237218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3x3zvQVHa95aIkNqH4RuqCyE87uGo0+4gPg8D8l4X4=;
        b=lHsPjhu6oxMEr1bsx56zCng+l5xS1ezSWwhgY4zKw9KxSqwLInp5PsBADwuOFPS7j7
         h2P0fiDNykXZeWscx2Qi7qR/qOgCONtfTn/UL3cqPVH+AdJUsAQzzpqbf1nFydCG1BJM
         DHX3B1eag5FhGWW6zMW7jNw0XI/Nm2ZhsBOzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632418; x=1788237218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3x3zvQVHa95aIkNqH4RuqCyE87uGo0+4gPg8D8l4X4=;
        b=rt8nPWWe8CzQ6uZhnH0YVzhAJub/IMrivG59bYtpWi5Ojmx+oBaMKAXOSkkO1Lqxwe
         dVCqjHXvLdatcdI1iKwvF8rssydcORgfwPI2WXEx7/XL2QWvGoO5U10L4i9pSVjJgpOM
         f5UFvc1Hj7BzYd1Nlk8HjTHJ2j7l1rvdABZ287krwLtScLDCTwzsSf/PSDZ/+73iH8ZC
         8qL3B2yU2CdyH0jcSpb3AHPpuwuRFkteWYXsA+8nekTf38KFRuQiflHu9LznpNXixWb6
         VSaly2ztQmPUHsbhU/33O1Mv6Yv7Spfz9nPcjm+LsDuz6CaLSrImulmlo1KYlLiK9SGq
         xhaw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/Mv26y1+ya0TB9rexwPNCCqF8cN7iee/52NIwGG38ZA7/MRzjlON0jzrJWrZSytboyN+0aZF9tqBNoNd1GWA=@lists.linux.dev
X-Gm-Message-State: AFuF++livfOJ9IxQttOnKG97bOn89HX9R+5sgVhKEq4ETzAx53i0IroM
	5+ZGz+AMP3N9wCO2xVs5PYO4Ydx13Oix/k8chLRfHLoJiLkTLzKLx5tkJr4SXda11w==
X-Gm-Gg: AR+sD13FaLOsqZtxYmZwQz1kp2nlpFYSiTK5SXydwmpjnLG2YfHqGr58AstRP/m01VR
	SzvhmqfPiCc0VwNVL3erxlx2f7BDqCSgY4DZt4tvsEfKFh8TEA9Kgkl33Iz/wZ+pST+1lwNa70F
	extfJNSy5YdzVCJzaGoM3W9vWNUnMqi3WG4j6tcThNxBc4FjOeAqPJ5nlZBJGCn1vV4VYUnyeb+
	51E6/kGeTjYNQD9JuYmtVgmwIbBHCoDhuIurVUhnzva7X69bt2DNS5phL8d8rOrHjliVGf6L87M
	VCn/ksKbp0d0BQuYXPWgbNC+19hsJF/8JR6iJoKq+ja8MqS9cnbRNEyv/wf8o5BeAEBItBAuS4f
	NT8eMlAjV9n2mSs/+5zDeEdzGxvyiIpxuu76D04tO7UAyRlGanl3sReHwWgwka9NM1czi8pGHYb
	LBjVPDM6JrwGAIrQOxRrnpj8FKdCpGvMLc9pafv/rQRYASA4KefsPZEBfRiVQl1+lfhXgodOthu
	zkjbmwW7rVPZJIjvb/3wpSSI+4NLtTvgXFtdqvKFIYjwl0=
X-Received: by 2002:a17:90b:574f:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-396463f1346mr8081145a91.8.1787632418173;
        Mon, 24 Aug 2026 21:33:38 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:37 -0700 (PDT)
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
Subject: [PATCH v5 2/7] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue, 25 Aug 2026 12:16:20 +0800
Message-ID: <20260825041628.988369-3-wenst@chromium.org>
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

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Switch to the new regulator_enable_and_wait(). This makes sure that
enough time has passed since the regulator was first enabled, satisfying
the power sequencing delay requirement. This allows the delay to be
skipped if the regulator supply was already enabled by some other part
of the kernel, such as the I2C OF component prober.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Link: https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API

Changes since v1:
- Delay only if the regulator was previously disabled / turned off
- Link to v1
  https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
---
 drivers/input/mouse/elan_i2c_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f5e505edbc33..4bbc6cef8be6 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/time.h>
 #include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
@@ -47,6 +48,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY_US	(110 * USEC_PER_MSEC)
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1260,7 +1263,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1416,7 +1419,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.55.0.860.g4b6b3295ed-goog

