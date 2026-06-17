Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DB63A05F2
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692543; cv=none; b=mztBC/InYUe6EbqiWyuBu4TfwgkIeW6tESIcDxiZ8ifuG7CRBVZkcm+Q1vEltoarXyqe0lSvDC7OuCfts5/gvDs5DILE5JTPxx7jqRtnPwC5xbVzO+9zgtLklc8WfISaB/B2+Ly7+rOvmSdpzdFq+8i2pjJIgx4miSM+GRNa94M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692543; c=relaxed/simple;
	bh=FvCY6IHEvGanI+XwNJYJXJPRA6+zOndXmAvYxeKo0xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LLroBehxIJHpRTnbUeR9JLKTF4wQ0NpTYEEaY9Yxucp9+7cUGmwDugRnaGKze8xtOiuWOia8gebDx+eu9FwhbIXKWFfsaCtXW0dTReOabAK5jqw1hPiO9H7I2Hqg0f92IIL57EsA0CkVruOAPXclGjoMZye4KsQL3g5KP0IslUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPUu+sp7; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPUu+sp7"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304d8362a58so601387eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692538; x=1782297338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8VWF2SeEtHF667M6jhaZnBwcldxW4ZuQhlBOZBeK1Y=;
        b=IPUu+sp7OEdVkxu6MbryW3CmrcBFKnyI4smiiowtM8RsbN9zTFnWK1NKez4UY1mgX5
         Wgp245mQBEQ66D+ikbWO2EvQKxoM63OY25V519Lea/wK2AHO1gw2fdumGfOydPO25NO6
         pgukpju56I6BU30GOyje5jBbpZYFwc7wRxL4kgbJMNOEifnGgt7RugOHFCQXeQNwGgCF
         mSSN6rE3hDiEVuxP7SblfYRbBmjuHXTNdL21mrLUuFcf9r9ymvowufDdkL/LChtlYchg
         mDHVCbfGZJaTRbeTpVgHNWHtTGAaYe9M7mw7kd58B7s3/IamGGsBKb2dR68h/St2DIoJ
         sQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692538; x=1782297338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8VWF2SeEtHF667M6jhaZnBwcldxW4ZuQhlBOZBeK1Y=;
        b=fXffF0NRmEbJPE25fRyOIWvChz20Ahj6t9gxMX2HoG7gzrYl/ZIZwMliu8kz0Xl2+U
         X9gHLKxBEMrcOycMwhAGwI1l3e4fwSsRr9EuDEA1Pf/hMykJc7lmdmKTPTkmoA/Wva+a
         DplE5HTWy62R+QSqQJYXwDK4qekgYx+KTtrr8cfJjcJmV4gLxzGLo6uo3YwDcQLGahd/
         LInnxVh5LZKdpnmFNemfI8sfRzw5fLp0U2x8vEUU6HVOeJVWbZ/EWu4hxCXF9JBgw2/0
         zXo3psfOtKn0b8AktK11cnodpBg1nMPm6NwmuJraN+NvyXRQT9yedrd+TkrTnPETjEy0
         G9RA==
X-Forwarded-Encrypted: i=1; AFNElJ8+fF6RprW7w6hHdCS6L6JhqJfAj5gfzCQK0Uc3iy57/Zpc0JU60LLOG9qmikIv2OzN4lS/kQF0pat631xByWM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaFJFfyPAwNHNlXLT69y1LcdEQdtnVd24YOfxXCzdgNURtT5tw
	we4ZG0HZni3nVGHRigEc3vNUmipwOQe1VXyHSSQO2VcN5/0eKOl97/qb
X-Gm-Gg: AfdE7ckJSkUXHtO5FeivVWtRRmmAIZQOjGVycpaGWk+s/VuN2Qs7HdCYH8cEccbRKtH
	X4iy2rB6Nz8sRgZufcMD70drfDOUAJzCvJMXe2jRxOlc1cZFg8xB8I7WiH5CjbW1Yaphpaz1InO
	IcsKxdfudrNcmhYN8kTbxbs0z76aI1vDAcCzcJpQORX4+xbdo0Th6kPACHFaiZqn0CsezdpLydj
	E0kbsZ/hyuqdp3Vsi10KzdLm+VrrU2tgVdLTbrVxiUBPePZ6TkQ9LnYnusJ88TKw6U4MJo5Wg6/
	5vpfBJhU65eZUd6caZKx4jZ5sxHq7a4qbW4kjMOl+kyOIjZ82MS7PmANoJKKAvHOPoWWcTJFXDm
	sq4hcMFaUnovMZvvIFUHQBSkWC/O4e21Op92D3bUrpLnBSHz3ud/QTpZK2g9zUUFeRY0VcuXW0x
	dMA/J7QgyQKT91R1aRxyBhnDmiXwJt7mpHXVVxowmWhZevb8g=
X-Received: by 2002:a05:7300:6420:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30bcf5ff5abmr1289238eec.9.1781692538389;
        Wed, 17 Jun 2026 03:35:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:38 -0700 (PDT)
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
Subject: [PATCH 17/78] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:34 +0700
Message-ID: <20260617103235.449609-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs43130.c | 96 +++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 49 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index e7b06f962790..5e7472e9e107 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -818,26 +818,26 @@ static int cs43130_dsd_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (params_rate(params)) {
 	case 176400:
 		dsd_speed = 0;
@@ -881,26 +881,26 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (dai->id) {
 	case CS43130_ASP_DOP_DAI:
 	case CS43130_XSP_DOP_DAI:
@@ -988,14 +988,13 @@ static int cs43130_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&cs43130->clk_mutex);
+	guard(mutex)(&cs43130->clk_mutex);
 	cs43130->clk_req--;
 	if (!cs43130->clk_req) {
 		/* no DAI is currently using clk */
 		cs43130_change_clksrc(component, CS43130_MCLK_SRC_RCO);
 		cs43130_pcm_dsd_mix(false, cs43130->regmap);
 	}
-	mutex_unlock(&cs43130->clk_mutex);
 
 	return 0;
 }
@@ -2132,18 +2131,18 @@ static void cs43130_imp_meas(struct work_struct *wk)
 
 	cs43130->hpload_done = false;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* clk not in use */
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, CS43130_MCLK_22M);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
-	}
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* clk not in use */
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, CS43130_MCLK_22M);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-	cs43130->clk_req++;
-	mutex_unlock(&cs43130->clk_mutex);
+		cs43130->clk_req++;
+	}
 
 	regmap_read(cs43130->regmap, CS43130_INT_STATUS_4, &reg);
 
@@ -2215,12 +2214,11 @@ static void cs43130_imp_meas(struct work_struct *wk)
 	regmap_multi_reg_write(cs43130->regmap, hp_cln_seq,
 			       ARRAY_SIZE(hp_cln_seq));
 
-	mutex_lock(&cs43130->clk_mutex);
+	guard(mutex)(&cs43130->clk_mutex);
 	cs43130->clk_req--;
 	/* clk not in use */
 	if (!cs43130->clk_req)
 		cs43130_change_clksrc(component, CS43130_MCLK_SRC_RCO);
-	mutex_unlock(&cs43130->clk_mutex);
 }
 
 static irqreturn_t cs43130_irq_thread(int irq, void *data)
-- 
2.43.0

