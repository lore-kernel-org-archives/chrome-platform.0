Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D1C3F0759
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780996; cv=none; b=BQBNqCDPVNf9enRUUo1DtUtCwDqtT/DUtminNsC44fiiLxlG2/Y1lbqi6diEQWHw4g0yxcoGqdDHLNyGQTg07u2zW/1o40LARpa+46l/5HAfeccsZ0iMEJwxKITSiXLI0g5xQfOC1Zf/8TDbc4SKcngivSXe7AMymj8ibz1JusU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780996; c=relaxed/simple;
	bh=c5O372q2rjDQ5irwM8M2Qw2a9PpNWbTIU2zvtjVkg3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOyvPtjnOxOGfW0IrIDqrTfAKyFXh5wsMYepSLJl5CNp0NcrjGqhc3fyEr9lFkVl9n/cOIAfnSv0WseqQsWmOMakESSW0muRYqoxKMXbAWYbKqPGQ+mCw+L6OfhdyK8RvwMHpUI85CXXAVnG4W0RZ/iX03LS7XvsRhFHH7HEE6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7SL/4mM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7SL/4mM"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0aa420401so5167765ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780994; x=1782385794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr2TzHHPLOZ5QRNblYXdE64EZ52E5yqz/2kOl9/QETA=;
        b=I7SL/4mMk5ErUO4uuwFiHpurdxLf/sUTyr//lh8J6bIE+YcKsPr3670GqgXO7bwtpd
         +1qTBNu3HiUY7uj3UNOD4lvKjqxaZdIwVT9Gw8gV41W542zNnVYdAJQixUCyYk8VFZIB
         9tudi1VQU/VjUnORq8z60eOsb3nDBP0b8+Ix0Z4RymgIqMdv2A0R6uji85QXFix1DsRS
         FVdF1F4eMkbF6E4Hxk3pa8LtvfW5+/DttpwNAPgUGHi/Pc4td1UXqarhFpqcq2vqPa4/
         uBJifvgemZagjMRPubAer55hsdgvQJwo/CmEUWX5TLm79tzuij4wPgcgvpMybOfoGvus
         0/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780994; x=1782385794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mr2TzHHPLOZ5QRNblYXdE64EZ52E5yqz/2kOl9/QETA=;
        b=ntrrEVrPvtBIlCotZNdlrpso6ip/RzUG0/qIzQyyOUUmQqlX1FGPX4KC9BvmCuRMIS
         sMhm2ih8tjdtJrGUFqdSFxlB8yKgCo1UU0hIAQUgu5t4JpiqxaN9WCz76kPOZUHvfWP+
         vZontmKy5rGTvBfLMVgG7GEMpT6T6kn5EpwC79FRZbp1GB+ockJhnvbpy/MPhxw4E6Hg
         aHNEKgiCfkLkoLrjoga+fpqIwkN4sjkAMSllQzr7ueJ58ZdOOpxB6kcs6rSwKZsrvcww
         qGTv7DDa2SM4Tp1z/BDkb36N7bEk4bKMnPyarDFUSTZcED/EkgCDXpML6iGcs0FRAo05
         mhAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9l9zz9foDIlgNi30t+T4De8TSafYB9ZGhXkqz/10pJQ1MUmO/D7u2OdH/TlNI+xyt0Yh5s/4dMO9Wro4x4hOE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQXflm0f6SAXlsP//BTMT5W61bIoi/NHmPqB2igsjtSjpQH3dr
	7x4ET0qevLypIVT9sINGTxeH4YIRmPl/LQTWR6IllNoezHMQ2gtmiTTX
X-Gm-Gg: AfdE7ckk4BWPtVStvZ7ZVSc/KGTfbN4+6R1LFJeogBjpCHuzcRbyA3mW7LlKhB3tKIH
	tDljH1/78PVub5qGmsxFvvHPt/f+l4A+J3P9CpXUCuvNCkD0wc99dCV+LYF7rL+zGsNFnLNuIm0
	B6oCAiTHsn8UAbL/F2eUd83Abt0SPiMoVHCvRiEEAarrVQlN5CvZ5NMolfrIPGhRacWEfQO8FtF
	un4zTr/qylKUbiARaOhrvsSsH12p3pl9DHcotp3ahPRKfmFrY+48WZFaprFn7F0MSgxSIR+rxRh
	ZDsXEq4QZK3Y+SMReRSJr2we7A4MPtYe/8/RgCNABULP8vCdxvc3DlyhWv1Yv99oBr5FaBZgCRc
	4mZ4uLdEbvQSapx7eLsU5TiOV39hth3bk75PGSzdoGZEYbyLk6BFifHyIi/dRej98XF3XBJEJ4T
	paXPA6AjFL3YDhlQD13b9Ht1ybmMeo29FUKkCUdMhz2PRbCtk=
X-Received: by 2002:a17:903:1b6f:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c6bc25ca62mr81275545ad.30.1781780994455;
        Thu, 18 Jun 2026 04:09:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:54 -0700 (PDT)
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
Subject: [PATCH 64/78] ASoC: codecs: wcd934x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:13 +0700
Message-ID: <20260618110827.232983-8-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd934x.c | 46 ++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index bc41a1466c70..817ad53595fc 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1265,13 +1265,12 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 
 static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-
-	if (++wcd->sysclk_users != 1) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (++wcd->sysclk_users != 1) {
+			mutex_unlock(&wcd->sysclk_mutex);
+			return 0;
+		}
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_ANA_BIAS,
 			   WCD934X_ANA_BIAS_EN_MASK,
@@ -1328,12 +1327,12 @@ static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 
 static int wcd934x_disable_ana_bias_and_syclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-	if (--wcd->sysclk_users != 0) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (--wcd->sysclk_users != 0) {
+			mutex_unlock(&wcd->sysclk_mutex);
+			return 0;
+		}
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_CLK_SYS_MCLK_PRG,
 			   WCD934X_EXT_CLK_BUF_EN_MASK |
@@ -2384,7 +2383,7 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 			__func__, micb_num);
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
@@ -2446,8 +2445,6 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&wcd934x->micb_lock);
-
 	return 0;
 }
 
@@ -2488,7 +2485,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd934x_codec *wcd934x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -2506,7 +2503,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2521,15 +2518,11 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD934X_MICB_VAL_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD934X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2550,9 +2543,8 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd934x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd934x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

