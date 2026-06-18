Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E583EFFDE
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781022; cv=none; b=ozp/MVJa+wf/qRQs/QfvjAXPhM0kh/GrqxW2xJUFtKRLHxhcu+y+4u/fQQHBGlfS+cNMhQL23g6WuakFbxLG53Cw440h3fDWlroRrV8NRHit1pso/F7SFJrOYOPWtzpbu3cdAHhNDY9m0rj/EmREGlNemMiwi8FQJxnmXYCfrP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781022; c=relaxed/simple;
	bh=8buMC4ZD9JZFNnEFGS/4j6mdWskmC/d/IQI+0wOvt4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E427l7+N0ONrCcUTOcO+CoOVPwFxYuelllhzzPxquREQk49car0AOg2QSFnWWJgwnRXGNtgaeEJwrsowufSoo5OHzkfoH8dogQ0+ZlKHeVKDzjqvACZLEAppsfHsYpNCsGDjL6R/SZTB8oXtuPjgo5iifOK6VfRux7qj62KWQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVhSyv7C; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVhSyv7C"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c6d4851142so9087165ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781021; x=1782385821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OY5fb/Dq+8t+PbF847YNuNR+1WYPM7PZhbf7meKQVc=;
        b=GVhSyv7CdUXADTfqY8tBr7JcrKcOPdwBuGA1sK5O2cxya10PL4qTT+fcFMk6Eo5I1w
         MaiG6+mSh+Dg0/8p+Gv9qS80knoIxb3wwLukOuXeQ/FUDEs7hPPDd9ZS8ZgznSMtPecE
         E6oku8xnLPC0OH3G03JmtL1mDDGj1Bk5TFJzeUMXeYKLZWqrl9Vy0MlVKUi1is0YMs5h
         M1wvQ/o1pG6GXKwWbSEOTJjsS5BDOuOCvzunWssgak9MaUws7dNVkAG3hSuoU/O5wBYo
         EPZ2DZcAdgoBjFTLXJfrnv2zeKzNXmWAeQLT/0xkVv1Cp64aL+YP016Oh7VT347YIXdw
         FUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781021; x=1782385821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OY5fb/Dq+8t+PbF847YNuNR+1WYPM7PZhbf7meKQVc=;
        b=qn2zLYxehZFuy+TXiJxe5raiu/eU4iQGEr38ebzDAKtJUUJr7/e7Z2C5E33qJMuCce
         aV9bC48TJNKfUishYn26ivd4i8b6bISO80wpb9M84m8f26lX3AIwo4yyAf3DXGOz8aPu
         3vkNrFpRfrr81RkteKkuKlStm/9sK1tD03G8IqyHZdPvlVQIlEybi3PWT4KKfz2IBHgE
         9Vt0eQj/S/QWHcodS5syOiA30tnG5/nk1RYsU1/Kcxk+rl8KrfnbFwscaegp85XW5P7P
         jht8ODO3tstzqvL7alBBqRcBxbrxxoM1loEev06vYNMVw+3H0ROrXvP/qtoqytKbD7uF
         AE4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8B6STduhlAOjUs91kG3X3+hlhdqMei6NN9/Ldejp+wdcsrkLSrISJ3g1+P2TbEhNCGYFiXOeWYTJSVeWUrqXI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRGz8GaSSYUNDFtsQHdbgbaGpeHMrIlCRvT2wRogDfDuSwpv8L
	sK3WRJheds+o8veNcHCSM0X+u0ZtaMQB+4QMgJBHFJe11j48QaxOearT
X-Gm-Gg: AfdE7cl8D9h8dl6cIytwaW6l7RLvPnAsN25XnpTRSUPpGXd0HyQQe9lj4Ol9ruUECZK
	OhJ38lWXYtgMOsktLMJfOzSyfhoR1I+T2OKGnOyAO2BUuSw8hnjae2s0MylP/itolxjAlzr7pjv
	NdArLi16c7Z8YKPnicZc61gSb9Q0clRg7zXS8t3a+i8eoSHIs8GPfKq24Gs/g0FCbOijAHRSEtA
	9gLSBAK0+CE89Rebbs1pebERCfBUOAPDJhF6f+8Pfji9w3hiejTZzzxeWNS/SF43LGIU7HxPlAJ
	y4oC5rt5YWMN6zsr+hanK4PRK/0uPMGsOsBKmnOO9/q6wiZ+v4yjmKHMTjKCDmhtqgzvU1libah
	DJjMijSUTyw8CjwzWOW++SvXl1aBuR7NJ5+fdGP3taC5cyHx4P5m+jlHKLiKXqmmNBb1SqZNx2n
	smG3ou7dYMXnnM2KZOGJxlpUu1tc1jxvGuCm9UPzLI7eZzS2s=
X-Received: by 2002:a17:903:19ee:b0:2c6:c9e0:2c17 with SMTP id d9443c01a7336-2c6de3f353emr31079685ad.8.1781781020504;
        Thu, 18 Jun 2026 04:10:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 67/78] ASoC: codecs: wcd939x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:16 +0700
Message-ID: <20260618110827.232983-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wcd939x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 010d12466722..922b6a0423a6 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1923,7 +1923,6 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	unsigned int micb_reg, cur_vout_ctl, micb_en;
 	int req_vout_ctl;
-	int ret = 0;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1941,7 +1940,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd939x->micb_lock);
+	guard(mutex)(&wcd939x->micb_lock);
 
 	/*
 	 * If requested micbias voltage is same as current micbias
@@ -1957,15 +1956,11 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD939X_MICB_VOUT_CTL);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = req_vout_ctl;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return req_vout_ctl;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	dev_dbg(component->dev, "%s: micb_num: %d, cur_mv: %d, req_mv: %d, micb_en: %d\n",
 		__func__, micb_num, WCD_VOUT_CTL_TO_MICB(cur_vout_ctl),
@@ -1990,9 +1985,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		usleep_range(2000, 2100);
 	}
 
-exit:
-	mutex_unlock(&wcd939x->micb_lock);
-	return ret;
+	return 0;
 }
 
 static int wcd939x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

