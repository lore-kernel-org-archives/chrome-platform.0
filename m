Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90DA3812D1
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401206; cv=none; b=PRdGF8vMhaj9kAW+4Fof5Zm02No4Y3zvp+8vIQW5p8Of9c8djnskRUC7cJQ23H+jb04ddYyq1sVD85QWi3x5tcgyRb1emOZKYxAqeiDylc53e3DPq4NqU5QWKU1DG//VZVfBsdMOTCCLWqPIufzFoKXhxqfy0ockopErPP+fhdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401206; c=relaxed/simple;
	bh=+3hlNotW4UMV0IZGCNdumn4+B3/jOqBkQsLXMj3bIIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRn/dk3UUKY03tPQKzEQtmRdOwp5FK7gLmL+rkOsmlKOUZnhqs7omGmPPPoyjPxzV81DM40nI1xr82TVUKoIeLhSlQsaNZ+Xkat5btNYdqE74ISbxorFgMr5KFE5MCCvUikdTqbjHg8olTqMZNMzzam+MHsoILn8sgN4/iendJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGeH0NtE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGeH0NtE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so3920549b3a.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401204; x=1784006004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jI5pXZcspax/jy+Cb7T9z6bqjcP+qI/Rnmy9ZVRY4f4=;
        b=fGeH0NtEQ09Wu3D/pCvoZwkDo9hPCUwTSgf2Y+v9FZTRMWZwhjO+ODz9JspZd6GBt9
         46oVhpdikt16KkEng3mKnZhHc42BlfW9msxyE4HrVWsW3k536LGzWhBXHNC7gKJn0dha
         vs8Lz0L4Mvqd0RImLYWM+RoHYhn8epGR5SIZWGK5X2EQO1FvV55RpHIJC77Sx7Nh9C3K
         BvABlVw8OKCMcJwLCW1sWXJMAniv3Acn4mB+RtM3f0Z11eWwozSBpPMHD0QRlr6py157
         fLOMPQ2/LXLQRqCmwlzj5Pqfwq2IlkjeKI4qeaGBzt7iR0DWQz9teG84H7qP62fG3I9y
         R50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401204; x=1784006004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jI5pXZcspax/jy+Cb7T9z6bqjcP+qI/Rnmy9ZVRY4f4=;
        b=m7CYLAhd64dWm+rAK32ps+8q1jw/0f/ReAskF8TmPlIYvk/QSEb/1rXcuOsPQp7X7P
         W5tp2KJfqLqf5p70IMPkEqtYI/blJ8GmpGaefBVMlF8vHc6jNzP1s0fRXywV05JMAf8U
         mN6rcr/GyvhkIf86MDTOX+YKaD6RUgdJG6ZriI0ENtb5UezjxLGPjOPTRp7SmFAPYUHU
         My3faeesh9JGXZt7uqo3RKgl+DT+jEn0IboviZ0RZGOIGqUesHNVNztfn5JzRllcmpa1
         fYijf6bTFMJ3+SSxe6UEg51o/cTsvFDeIm1T4RFvQ7cazEEHMgtq5IOw5G5yIaoJDotl
         2YWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIvppiRoDWcz5Tlan+ojSgfcK2mHNta+Ize2zhz9YLYdmyce3CxW6WrDDBB/O3QT2p31qr+Y6m751JpGARS4M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ8qNix1lhXoG/tecKJ30mk7F2oX9JlV2jNXINj7++deicSHMy
	trG9eatwODHwmw9HggfjfdSakHZLJTf52nETYoxcy1/swb42lmP+KKNO
X-Gm-Gg: AfdE7ckH5wT3ebLXp3xK+gr0XejvhwXLnwbUGFxGTd9aozVO6F7tbiGjYbpzpCsxooP
	6KlzwZQTB1FsMEnYCk3Kiw6r0/YclM1wi+3WSH0aO5RVQtxbfyMDl1PYe2Xjrcnr22c2GTWiJWP
	PbySkoStPtfS4nBTXC7g2YkXg/pLUPR2cD4a1XUFbmNGY6IxN4utSWgsBuAN8yY6D2ClIJFvUIw
	md9D0Rwu9k+em06lqYkUBZ+QmsNlsZM4urxddW+yZY5opT00ZFEwOYb9dI8Z4t/ukVKd3EALK+S
	YBv7uX5EY4aKJlhqcjgZIJ3pxk5paMRP6HEg5Jd1TXfknAQrJL7tDNS/84SShrETXlOXZ9WPTZM
	ig+K/xrvmzMOARDu+xTP9dmyioqwHqbIrM0FTqrW0A1VILQM1Vf3r/0ENb8IgdsJpffntZs8K/R
	RSTodLandPPaZUfhhBrF+89RXEQV1s867WVuqNjZjQWyv8aq0RmcgrqQZ5xQ==
X-Received: by 2002:a05:6a00:9a7:b0:847:99bb:b6d8 with SMTP id d2e1a72fcca58-84826c33343mr3645283b3a.26.1783401204131;
        Mon, 06 Jul 2026 22:13:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:23 -0700 (PDT)
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
Subject: [PATCH v3 17/24] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:59 +0700
Message-ID: <20260707051006.20058-18-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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

