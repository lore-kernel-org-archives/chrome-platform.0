Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1161344A730
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515162; cv=none; b=MtTf0kLFSS3slenziRiHAsZQvO4erCzp3Nl72XUM6awgp4yAcnblhOi1a3YOScNIt27YoCKILULqprDGdRj8VM/ckVPUrNWqmEfsl30xMcqgB8ZDZC1QX/01sgxD5MCp2+ypfokCOO4pSLdYjl340XixmcWW+A2ZEu6bkTwgkI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515162; c=relaxed/simple;
	bh=fj6i3hoRw2lUGwj4QnJCTFx+3YmWMVmLdvQ2+3smyxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1yw3X1F6J/iepQHhWfW7pEwQcsdXVfNpmo0w1kQAl8zDvgq6RgBhHH7qALfjdt771vpOw02sZjAaDeqZLKPrajbs8YWfeAxOYGtxPSohHEGpuKJ5I1WFLuctqjBM71liFNn2dOzLkerpGvBX9hwmgIJd9CItN9h8qUvx/0jq6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psGb3klA; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psGb3klA"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so519820a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515160; x=1784119960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmvNpNrM4hxwguO0fa8BTy0Lbihqp33Ngtal/urQZPI=;
        b=psGb3klAAd8/AVO6vJHxznTRwL+Gl8Oy47ZlGtxA8guRu/j6IA6Lw7ztz4vWlsH9gh
         tlwttN0bQrVeJ4lgAVXsMJ1k6rv8DK4UdS3iic818x537IB0FAYHHQpQf25L36Fa847O
         92ycYiWV9fWJWlcNqOwd8gnA2k3ISx2+9YY/avbfjeDZxcmf+QSLEoxWU9tKD6bJ6Y8+
         uvN3g8pydT8/tZieUFIqgUuDzm/3ZcDkIoyotsMDWKFJtKP8/krUfR8JmcPSkJfQnMyQ
         HRU92+KIz+hUd1eL81iCo/TSppPSnpk9zQkWqOE4bEVjApp8txSUhp93oZK2I0Fw+mk7
         rKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515160; x=1784119960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmvNpNrM4hxwguO0fa8BTy0Lbihqp33Ngtal/urQZPI=;
        b=FPPC5PxVO7muQFG6siyCVWB68n6DAxgJ2zqcWtYpMaCCH/P7sjPvRXXjAZl8FlcWTc
         YspaZu4uK68grpG7cYiypAD3ZpJqH88SdyBL0WnSwWveCPL4cdBYVFPnVEyaqG9Zzw/n
         ovbNXdLVLLE27E0iAYjTjzI3fHWOr7Jdy+KglmLAEtxeTRu1y4hLETD6X9we7XfSlGfE
         aG9J9L0LLmUYMPeQD2X+/sEcXNdk9NPzICOTOV437I82hgxRcD9sBZCNA/fr+g9TN+cz
         AjzRJLrQwcB3Cm2y60DfFjVqxL+17fd9fudxR8GQQbCbJaq8ZwJ4RBZ7bGNS6SFZLgtb
         Ffvg==
X-Forwarded-Encrypted: i=1; AHgh+RpQHHZFWCfc4ATD8Ijs3ekcmCCInRyA6MI3gUTeUgdQioRc7oJGxoxruPXWooRzazrO+YLvNqPa6OUzSC59jmk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy9y6deMA1OYvx+5qZR3lF0snnPCpCZiWuFYz4wj/uL+BuzotR
	NfG97SVi/8aWRjoOCgoacYCG1QiW123na0BzGWTcC7gZZdy9/3KoslGF
X-Gm-Gg: AfdE7cnq3TRlor522V0OiAitdcai0upXm7dcTjx4vMzdHHWN4TfB4ENzU3Mw0M+XRt8
	4i9kJ06c2lbS46yxYKDQwrzQa5+Y1TDrHn6g2zp3/bGON/ol+H635tsN2sbkNZbZ795/t6IGJAW
	k6AT3wSstmAiLOggceoEYBBs8EJhXGrlzWHYLLT06TErtCK367zsgUGkVgP71H2ssihtZ/LqcHI
	jh5KJeCMyn5+MQPGqIQCLecyE2osdphKrKeBx/5raKS9mxKtFyRFC6z+dYaOkct/jj/j1H/V6Ev
	x9hxW2kBp8SAV5pve6OdkLLfV7hPLabGZ3jVmhviDhetDT9j7AxDHmJmSxHih+9VkssyDEvUe7Q
	U12twf6btCRq+RNpJ0fo+LyUYS06FKtMBY8tp36e9j3XjEccI+D+pC4y53blQyLPAh85IBMrSKv
	Gr0RuW5ta0Rbc22sWw/gSrVCpWH+ahmWHTE2Fpk/8CxM2xJds0MVjq50YXLw==
X-Received: by 2002:a17:90b:3d87:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-3893f977bf6mr2394645a91.2.1783515160314;
        Wed, 08 Jul 2026 05:52:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:40 -0700 (PDT)
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
Subject: [PATCH v4 17/24] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:54 +0700
Message-ID: <20260708125002.202515-18-phucduc.bui@gmail.com>
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - Added Reviewed-by tags from Charles.

 sound/soc/codecs/cs43130.c | 72 +++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index e7b06f962790..48d88dad4ceb 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -6,6 +6,7 @@
  *
  * Authors: Li Xu <li.xu@cirrus.com>
  */
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -818,26 +819,26 @@ static int cs43130_dsd_hw_params(struct snd_pcm_substream *substream,
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
@@ -881,26 +882,26 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
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
@@ -988,14 +989,13 @@ static int cs43130_hw_free(struct snd_pcm_substream *substream,
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
-- 
2.43.0

