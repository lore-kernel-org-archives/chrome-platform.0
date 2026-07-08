Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F5343CECB
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515214; cv=none; b=IHT7KaR2Jz8qYIZN8V0TLkslG+vyN6xQnPEESEaPceHZiDBdAh9pn6L3311dOfb34juAZyZfi+orYPGw2rViMFY1/J35/89Stpfi624Bge2wE1LN36lehvT29HomKWnJjoTHJf1eh6xCIkmZDMyJKWkbM6hyLiO3hGLx8stitRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515214; c=relaxed/simple;
	bh=hGJisYIpxWO2FMmrkv7mmiemg24xqGVestMhlsmhqYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngVWFy8h4yr7kS2KWX9tWbnMOqx2/j88XhEJQdvjytGEaG76vLwNS+Vj8b6SU1oI7Q+BXG/DKjeG25yDbAhvjNfzZB1/ik4bkmU/8+aABtqpZszMcmAG4+dJETrk/NcLR26Ci0M0Y7FJf7jErGlTNo9cSKsZGD63Om/KadBZwnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDFKN+RZ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDFKN+RZ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so773237a91.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515212; x=1784120012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3l5tTjQV1iS4ShC4Q6Dv1Lqn7dKOZsvCTX3q5ZLt6U=;
        b=HDFKN+RZj3fufF6wLw3CTFzV0oaqPK1L6WIATJjmPEhCFtNV44MOdaOdFEXAXU5UfW
         /DkHvdn6n2XJLrGNbMc7XnFr0TopF7rZMdlZb8I6fJLT33TIFZt2pWGNBa594whVLTIL
         2VEXydf0t8QT4sVpp3ur3WPGpWo5qqdmY+FaQlUq4uQ7segOCqisH1syUM/sqxRCguch
         LATe/os72I4y2bqpg7xzAH5+bnmknXURLwf1HumMmRZ3jwMNBH/EQe+RrT0k7knpl4z8
         7Qs3nWhR9m54aMFiq70Bjl1U7o7lzDNvvJwKSCgSTh51VYxg7Nr/BLXDhWI/R3caemuj
         WH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515213; x=1784120013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3l5tTjQV1iS4ShC4Q6Dv1Lqn7dKOZsvCTX3q5ZLt6U=;
        b=Ab0vb8cAWhAGkRPT6MZP6wrcLz/RSxsxDbV07CJJRFYm9aqNYrpQSnH5mdcKKXZH0J
         0Tno72dnp4h8gTo8bBjJ1giOz1YxM5oDuC2JuuhZnsdHk7k6BPvFqvF0OPLEmNFTQjZ5
         RMBVHfGPebaiJjHImbCo8JJS9aLwSjgQOPjq3+3QjhOAPTX11zVFBFDIx04CaVSJDn9B
         LoMbuc+LfSoOdV9M4NPBv7CiPiZp1iXOWUIauZu98D093WxlYIhPGfOms9MZDGLcaZFX
         B+GGcXVCA0T1lwwB5G5BYYoxdJyTfv3KjxApMr8AaGSLSxs07wkjeZLvjGw3S+XZX6h1
         lAXg==
X-Forwarded-Encrypted: i=1; AHgh+RqAMviUjxgKm9Y/fhMyc/l+KfLR9cwwl63C+g3l/7WmUODj47QOoNtzjb7FvUf0py91qhpzfJ2W6Ncke5s/c6Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YztCqyB1WZC2igY/Du9vhyGNPIgG/zIuUfj1HDcQ+u1GXiVT8Uv
	Sirel7FooJJQi9TXkp9o7nlS8/SXBPh/K+aRQ685CO3b4CdUmWboHp/t
X-Gm-Gg: AfdE7cnUxuHLgTVC7CI7udp13lAQJYPEd6WLoVKt5vsipNMVHi9gnNL0P/ScQNyUvLn
	0ZWJppTelnwzr0TwWo8RNw+SrJ+YhId0w8p/ttBtaXWjqJHiUyRGMlIP3Y78he/lI/hWFgSl6n3
	9EOX8qvvGpiDyWjQv09Omj7hjgUjs2G4QxX0yOpVZdlyVF2dXWahqJiomEr21ItqK8h8Uz1yPQf
	KkkN33AlpY0RqwFSqABT+qGugvFZEp2Gzojsmrlsns4qf+GjWvu6lQaq42+pNnGkO7oYFWXrE6A
	Xmsl4uxS/D92VFVLqaJhfNEf/lopo2OmazKT/xsANfhwtbCd9kEQtQsvUjgsGFkB83bO8Af/0m+
	V9sfbWI8wHjJZY0FUY0UdFoYqvQbilrgG8Am5caSsPjz1En2bbsraWyP+s3ChGR8YsxsVgfAu41
	easWaS4xFCj+V9mCCvpkwy0n4t3mzyZSoMJ22Z49zIMoF5MX4=
X-Received: by 2002:a17:90b:2e0f:b0:387:df8f:1402 with SMTP id 98e67ed59e1d1-38942b823d3mr2508534a91.35.1783515212595;
        Wed, 08 Jul 2026 05:53:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 24/24] ASoC: codecs: cx2072x: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:50:01 +0700
Message-ID: <20260708125002.202515-25-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - Correct the patch subject from cs2072x to cx2072x.

 sound/soc/codecs/cx2072x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804..908344ee5892 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
@@ -1408,7 +1409,7 @@ static int cx2072x_jack_status_check(void *data)
 	unsigned int type = 0;
 	int state = 0;
 
-	mutex_lock(&cx2072x->lock);
+	guard(mutex)(&cx2072x->lock);
 
 	regmap_read(cx2072x->regmap, CX2072X_PORTA_PIN_SENSE, &jack);
 	jack = jack >> 24;
@@ -1434,8 +1435,6 @@ static int cx2072x_jack_status_check(void *data)
 	/* clear interrupt */
 	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
 
-	mutex_unlock(&cx2072x->lock);
-
 	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
 		type, state);
 	return state;
-- 
2.43.0

