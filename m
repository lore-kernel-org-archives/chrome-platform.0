Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EEB382365
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401181; cv=none; b=aYI4964IL0F+EZW02KtwSdzcO8sdy2d0RfprDdZmT21YfqXymIOBPka6W4rp/c6KQCx8PBQ1JJPNNyUkfksyEuLdF6HERYcDdi/udtlhkzn9l6iNGLNK7IZ1NKSQXs0r3xMmxwO/JIpq5R8/mDk+ISxA6uL+LU6v6pDX9J/eLzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401181; c=relaxed/simple;
	bh=ViT4SAYQfWPE+1atmk7kb6K9XAwGWWkC6cl6Dp13LeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jz581Jgo8j1uCUQW5yMbNvaWPMd6Y35HHX3tWrG/+WEEu/02ydzTXQX1g5h6WHzmboIXpj9XRz41q7TDY2nFoL9CanUVa9j/lNk6SgjQFLWW4lwwPdWNEIzf3GtFxjLrJdCmGtnEhwWnQZ4/GGAbvTCKiZraeB8dhf1qwu2eF5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhH+k3jn; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhH+k3jn"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-847a483e344so279881b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401179; x=1784005979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GELCOb8jCO0gF2MBINNZBC9gUyxB3/zkC4nOSWvZgw0=;
        b=bhH+k3jn4OtH8dPRcaxeGz0noBE++SATu63RjpeHug6HsnuY1Qd78bGZUMRYj/b8vB
         0B5lD16tE/LGSkNlbCiNYYtYzaU0MfM6MSpquDsgvKIn7aoHcaKdhYq10m+UfMEgYdVF
         AbCe2Eq8Wr/AXWNqwa9W6uT743Wg10+//FGwjkSrJzrP86p+eWF/ItHgfKFuG3PfeMEn
         UWIm163pY47Y51RNTJ/9oFRNp1HuQMTvYEbI5CWpc5F0V6pF0mnYLBPXsPSHzjaCyl/k
         6Hjzbc8Uzdy8t3tvtHjkJPmn8Jt3OeDokmm+M16UsTm6ItT9XYJ/HtCWAbnbQ5gLYx4Y
         PHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401179; x=1784005979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GELCOb8jCO0gF2MBINNZBC9gUyxB3/zkC4nOSWvZgw0=;
        b=qt6zkQHyoYGTHPyoSczgEhteX3sS/6VydNalF//NkY4dw+zt+6A98xfd2tXxAEpPvg
         tJyAGEaJSSod+Dy4Nm9Sg+Z58sdP5FnGWG84ESoshIXLS3ECZP+To4qcU8/TXyCpH0+b
         8wt985kFM7FBbErH3wGZo/FW+CPlVkv+UESNeaKOsKL1kGMsWgmFoIvs4OElbhOoAufj
         xlNSTskyKwYkXhe3+nR8Yzze54aMGNUt9LHjqnZDGsO2CPEIXy/2hMS7rGFUhwyBg6X0
         m5uC6ax6PbXX+M7DwZ6yk9UJ+0H0iXNKp6qcjnuwix5kb4t8yUmH03NLOoY2WOEEOk8s
         oGrA==
X-Forwarded-Encrypted: i=1; AHgh+RpBH/7uMwhwFrB0JrnSyZXx1gMgLEpfKLtK+7VnxdVxaz2g1qqRGjgJB4A1lB7lMKVhQF3GeDWstQdRLHFhX00=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdcoDQi+tH8VNn0pRj0deDxEkbkbEy5kPKkAnaScpEuwUd20R6
	Fq8xOiJPJl7eQWHfezlLavL892A5dSmkjh06WFPwc3aEWAdCSR+rfOcx
X-Gm-Gg: AfdE7cmR+9bcUtJ169Xvu7yn9BOFZgPSr94J5c5Xw8AWnr/9aEu6NwWD/UCm9zJcimN
	DrTEw3DRLtk2cMFaSb7bZZFgF6l3G0l07IM/duQdWgghlMKqgUOzZ36Kx7FiOfZZpZc/JV2Rqt8
	VBGOsN3J+r+Fo/evzPLkBxg72hSRWmM1ehpYqf2wLvoMSbbadg35xeuI2M2tG+yAL6I01R9WNTO
	nm0juqmk3KlSMG6/sQ4E1KOTfBiIqQn7Hsjq8ORp/xdQFg1EziDLpqHsnFGdGc967AB3O/tmT7X
	EKnbv7I92yLhEX8Vs/Zhqf1timupYqwQqavtuXWQPtdMikZ+a+hnbdxChx9LADcMrEzy+TCwXpy
	WgUR5h6utOHXJmPJNSREnmM1La+A3kUd0/Hu2XvM91gxCrRY8LpjYJUeKztOcBK7sX7g5vyL07p
	X1/oiFeqspdpLORLcchhwA7pCXweAtjAe3AO5GxADiraVANv8=
X-Received: by 2002:a05:6a00:3409:b0:842:4982:825 with SMTP id d2e1a72fcca58-8482f2be228mr1260249b3a.1.1783401178285;
        Mon, 06 Jul 2026 22:12:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:58 -0700 (PDT)
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
Subject: [PATCH v3 14/24] ASoC: codecs: cs42l42: Use guard() cleanup helpers
Date: Tue,  7 Jul 2026 12:09:56 +0700
Message-ID: <20260707051006.20058-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() helpers for mutex locking
and PM runtime management.
No functional change intended.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 54 +++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2652a639a79a..fadf68860601 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -9,6 +9,7 @@
  * Author: Michael White <michael.white@cirrus.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
@@ -565,7 +566,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l42->irq_lock);
+	guard(mutex)(&cs42l42->irq_lock);
 	cs42l42->jack = jk;
 
 	if (jk) {
@@ -581,7 +582,6 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 			break;
 		}
 	}
-	mutex_unlock(&cs42l42->irq_lock);
 
 	return 0;
 }
@@ -1668,13 +1668,10 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	unsigned int current_button_status;
 	unsigned int i;
 
-	pm_runtime_get_sync(cs42l42->dev);
-	mutex_lock(&cs42l42->irq_lock);
-	if (cs42l42->suspended || !cs42l42->init_done) {
-		mutex_unlock(&cs42l42->irq_lock);
-		pm_runtime_put_autosuspend(cs42l42->dev);
+	guard(pm_runtime_active_auto)(cs42l42->dev);
+	guard(mutex)(&cs42l42->irq_lock);
+	if (cs42l42->suspended || !cs42l42->init_done)
 		return IRQ_NONE;
-	}
 
 	/* Read sticky registers to clear interurpt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
@@ -1774,9 +1771,6 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l42->irq_lock);
-	pm_runtime_put_autosuspend(cs42l42->dev);
-
 	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_NS_GPL(cs42l42_irq_thread, "SND_SOC_CS42L42_CORE");
@@ -2163,22 +2157,22 @@ int cs42l42_suspend(struct device *dev)
 	 * future interrupts. This ensures a safe disable if the interrupt
 	 * is shared.
 	 */
-	mutex_lock(&cs42l42->irq_lock);
-	cs42l42->suspended = true;
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		cs42l42->suspended = true;
 
-	/* Save register values that will be overwritten by shutdown sequence */
-	for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
-		regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
-		save_regs[i] = (u8)reg;
-	}
+		/* Save register values that will be overwritten by shutdown sequence */
+		for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
+			regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
+			save_regs[i] = (u8)reg;
+		}
 
-	/* Shutdown codec */
-	regmap_multi_reg_write(cs42l42->regmap,
-			       cs42l42_shutdown_seq,
-			       ARRAY_SIZE(cs42l42_shutdown_seq));
+		/* Shutdown codec */
+		regmap_multi_reg_write(cs42l42->regmap,
+				       cs42l42_shutdown_seq,
+				       ARRAY_SIZE(cs42l42_shutdown_seq));
 
-	/* All interrupt sources are now disabled */
-	mutex_unlock(&cs42l42->irq_lock);
+		/* All interrupt sources are now disabled */
+	}
 
 	/* Wait for power-down complete */
 	msleep(CS42L42_PDN_DONE_TIME_MS);
@@ -2250,13 +2244,13 @@ void cs42l42_resume_restore(struct device *dev)
 	regcache_cache_only(cs42l42->regmap, false);
 	regcache_mark_dirty(cs42l42->regmap);
 
-	mutex_lock(&cs42l42->irq_lock);
-	/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
-	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
-	regcache_sync(cs42l42->regmap);
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
+		regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
+		regcache_sync(cs42l42->regmap);
 
-	cs42l42->suspended = false;
-	mutex_unlock(&cs42l42->irq_lock);
+		cs42l42->suspended = false;
+	}
 
 	dev_dbg(dev, "System resumed\n");
 }
-- 
2.43.0

