Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3F934252B
	for <chrome-platform@lists.linux.dev>; Thu, 28 May 2026 06:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779950914; cv=none; b=REBXqMUCClAgHwiDjQUrvYQ+SjWTVRl9/rtf3oan0Een4x/Nblz9iv6w3vXZD0F7rGBiv6ck9XFZqklP4YyjP5YHf5LCxtiqCCEnKtpr2oZiPUKTxSLC8PBb8dkRugd8xdSnKiQatZFJ0NCyc1xKY4syQCN9zd01DdRuorYzJFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779950914; c=relaxed/simple;
	bh=OVYipeSrPi0x9S6evFYUzyubrHv2EiGt+bINl47YVrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KL2MtPRqVMOtkFwKU54uPK9F+NcAF1teprrBi3McoSf4mASf0+LV48EoVeNja78z03tRgPj8ddq3Ip/eL4hxxeXJ1nxRzlSuTz58fDZobcvM9gguRvIrC+Xavwfqzxj7R6+elyGEBxqE4aRt77Sf2cjKf5r1nU2S3238RDIGnhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UB3UU+CN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UB3UU+CN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ed9336049so2071495f8f.0
        for <chrome-platform@lists.linux.dev>; Wed, 27 May 2026 23:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779950911; x=1780555711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1DBeLjdfuvDOOOxi8Lum39+iPU+m01m3AbRKR5wF6U=;
        b=UB3UU+CNXpOzFpq6+etLSOR5xsaFGfVbxvVYf3U2XMTfdWrkcgKIrqjfgwlz37PPT0
         VrMRrPj/oBDmRcV5hmAHDLKymghM0F6bPx9SkJM3nnfZXt5efCgGhUl8w8RIGg3PJ9mP
         RVlD7+QTV37Acg/gyMp89xktyQBwXvSZTFobyMysub0fi0gSefMQwZChr6eoAiXG9N0d
         uMuTN8YNk67QTGVOvdv/CZd1FlSvKwdtOcPN8J/DiPriiQP6CIwPYUrSbsl+wgxhwnti
         v8sWeQ+Q6qLtZj/0KH8bbsht/czbob1v3DQVr3pdN5WLukIgxRxVISBueKqmDnhyTCcG
         JJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950911; x=1780555711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E1DBeLjdfuvDOOOxi8Lum39+iPU+m01m3AbRKR5wF6U=;
        b=SaycYE/aAjYhAi7pSd/oq3Z2fHDKmY5ClyErwhXUuGAwkn9MK3QFLIFHC1wg3q2hlO
         /vxRWoYjIyZWMVlPyF0d0LbJiMWpY/tx7vWbXWlkJKKFTRlwQ6ofgJXjtDAQymlUV5mO
         zHS5nj1FHoSt5xbrWlhKAJPaY5sBjhpgRRsNYOsoUa7/EvC6dZr30bflbzv5hQkQCOI1
         SLQnBVm6Eds+K+vLglctKbPCBCnBPotlb/egcfLxRSOC8XXmIHd61fRIN705xCHSi/3t
         86JlYfjWu6p7kYVmXWobg68tEgwRqQcHc7liXqhvZ/XkZJxIdnF77waYD3SqugIv42Xi
         Eftw==
X-Forwarded-Encrypted: i=1; AFNElJ96WmILzdYNpVpi9271u7oAslb5DmRlQnzdafY6NK3raZVV2/qsxTvgufLnqEskgKcrqp2BXKdFz1ye5t6HQLo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yykrf2B3QQ1yMr2Fhrsq47AJ1+jDgXZ4WbjGDegKFCfkvQvapZB
	eVMM3RUmqc377jTnRNBW89NRSIrw68P3pamm6NQfVmWzIXa2suTrgrEmENnsL9ccSwc=
X-Gm-Gg: Acq92OHFptyKY1ic3k5TuBP8HMm8oUOfr6hbqefp2ja6Q7MJe/RjwDZjlmUN1dqUJTA
	J6CdI+/Q+lot92/Hc7vvtkEqHCyqcHZyuvaM89Uw7fU/5YoD6Vtn5uEmxfOS0GLHVBcAclMHN+R
	yZwrGH6oQRib2bWOOqy2if8K6V/qGeJQHcQkh7uB5B9AH42QgZ8+FppgOAJAZ2RlwZODbQuXlQ6
	l3Ca7LD7IxM/oFWt3aQEmgSS0dMSDH3ML6I6wFptFMlPZmG4EZ+68aRxCg66KyRKv44RSq32aXf
	wZuR29191IhFI7PryjDiuRaSHMze37XDDXnz5wL/YLzYcF/S6Z/K3zAwzsogp8FEDnQ3bxruvv9
	GbiDOs5jE5lzClKb8wObmj8nTUoBn02sZH+AKOg96EkbDAoMeUliuSxcXdTT79Xsqqy2eGPg9Fq
	+HQdfwruBx6yq4AE0cYDpxihVDsj3baq9UyXuuVld8qDGrmj2p3flkCfQrKAL7g25U75phIypDp
	RS1+TOudGfU+lRJ7QwHRy/M+A==
X-Received: by 2002:a5d:6f0d:0:b0:45e:9421:4ca8 with SMTP id ffacd0b85a97d-45eb36acd7fmr41633580f8f.28.1779950911454;
        Wed, 27 May 2026 23:48:31 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ee2a12a69sm4706827f8f.16.2026.05.27.23.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:48:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] rtc: Drop unused assignment of platform_device_id driver data
Date: Thu, 28 May 2026 08:48:10 +0200
Message-ID:  <9ec7a174605a17dd19c011ee2253de28d09b02bd.1779950275.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=OVYipeSrPi0x9S6evFYUzyubrHv2EiGt+bINl47YVrU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqF+UsIynkgOMyv9yXvwy9kAQHjiZBMxY3tgd9h gH17Hu0sCWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahflLAAKCRCPgPtYfRL+ Tn+WB/9Mpf/BWNknwnHZoGhap6Bd/KnlhhFDyj8jk6j4mpkip9ETFJb7hRzcQFgjGBjJXWYMUT2 sXbVA7QBBG2N9pTm1p/NZb71946QdcSWxrJ+sM5XnufYEQ228EKftqSbYntHbOwA4ruC2dwoJt0 7pVHQhdyQFT52+d0g1Nw1a12U4q5GOKjmzxW2FEs2okUB8Eu+GfYfe6BXIRlNfvEeFNWFRO3pkv XiQXyTyFGpT8NgFu91CXrZRGFNhAyAdBWthN7PTteuKMaqisOJuDwwNiqfMZ+Ie6n7jP0ZFFWdo wWb3YSveITFP97CQSeQvtDSQRL94Z97kNdSdJTi6cb5ObhpU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The two drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignments.

While touching these array unify spacing, usage of commas and use named
initializers for .name.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/rtc-cros-ec.c | 4 ++--
 drivers/rtc/rtc-max8997.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index e956505a06fb..f3ecd017e2f7 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -388,8 +388,8 @@ static void cros_ec_rtc_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_rtc_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_rtc_id);
 
diff --git a/drivers/rtc/rtc-max8997.c b/drivers/rtc/rtc-max8997.c
index e7618d715bd8..89203c92e2cd 100644
--- a/drivers/rtc/rtc-max8997.c
+++ b/drivers/rtc/rtc-max8997.c
@@ -512,8 +512,8 @@ static void max8997_rtc_shutdown(struct platform_device *pdev)
 }
 
 static const struct platform_device_id rtc_id[] = {
-	{ "max8997-rtc", 0 },
-	{},
+	{ .name = "max8997-rtc" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, rtc_id);
 
-- 
2.47.3

