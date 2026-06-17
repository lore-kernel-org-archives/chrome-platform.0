Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1584779BE
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692626; cv=none; b=nx13/WVYsb8w9kMVtkoQO9re5pvo2a41BNWSaJAtjIw+HiVjTVINdkkyRQ6QG5bYZdYw6DAa+yB0yet2UDDHOIaJDRg64XGEoqmf2S1p7JbAbWUdXtWfGao4Tf5ddyIiKoRYkPIQ2qZMM4r7i8gzJvgc7gXpc36UP+7ult9YJe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692626; c=relaxed/simple;
	bh=DOt3EGUqpXHD2f19fHf8exVet1GktAa+R4mDT7U7BeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwoXd7n4PVNNC5dge5wCqvu08j/0yZV85l8ZXONmD+GrvdKFLPF0Tmi2Sm4n+koseIenS6fkXef2Tb6E3JqOajtTZpp9OKIwxYEz6fQ55MrxGO9qLV8X23qzSratB/3U9q+Bxm22K4UGxoZISywQoi8K9OGhvjTeE+fQPnG2p7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmw6HPFf; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmw6HPFf"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-307d0405e07so8458866eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692619; x=1782297419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYw5REkKxp624MWyS0jRryzwnCCP8XOG37PLDOHEuTk=;
        b=Tmw6HPFfhHd33L05Vvee2zrEm3wNPHSk3Yb7aanUYTHcNbf27/x5cBUHms5/0/Qs91
         tGHMoz4UZwpLlMtAqFyswu6rJMBGa7soy3EYF7Q/P2P0nxmD3TVhDg2++VsU50BkUB71
         SjBWtjFYr3oa+kY1JUMKmvRXc1Abg3wKJzIHgDqLRNMUJ1opExqHM0GwfNYeJM5EHock
         abEzE1L7DD8cMuji06Wl26j18WzVsjXOusFnxFToXhpOASb6O6tB31gbF/4FczEBcoyj
         1gABgDQhd+UhdTqd8a/8FTEwk2wXmmdgOokR+T5x73glMxdzHIWfSvfnrtHb5rmgyg8I
         rstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692619; x=1782297419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dYw5REkKxp624MWyS0jRryzwnCCP8XOG37PLDOHEuTk=;
        b=DOySGHvuUsYXoD6rVEUmRFVzzDxMe8lW0gl/9eiu0dBFD1O3kfY6QK+qJud87edG23
         ceOUyKv5aAYZN6LgSDaAlJrMKpn50/X4Q4II7fCQ2g0wC1xq+Odop+1z9mLttrvNb5B6
         kSjip/Xjijf3jtnEaPLEeBVexcLxhYbnR+8pjTaNAwMQF8gGIY6I16a5Km/F5wLsj1DD
         nv+aOmmvOlH7U0Dn8qCIeflxh5IcwBny0qTXG8GLp+cjDsXWNL4GO/wogzY+6kfewu/P
         qV7vMXRjPB9V2R+uW3hecY14HjDkQz82437zslgmuodr5wZLOJ53CZns1wSH07D0kVX9
         rEWg==
X-Forwarded-Encrypted: i=1; AFNElJ8WO/eNoqB5Kf8y/MZJq+22p9SIUi7R75MG0yyRoAklNFRBGmJKlwZ3LKwKtBbGG6BDG3v+1G1AMjjGe3m6yJ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwirdMpeZKyNJ+o4uYc2TbgqlE3xEgsrI4FFXRr8vkTChcNu45P
	WdNLUis1y2DX3Yf+T7zrSxwDUy5IonmtweSMvGlv+tmW2gope/Bsl6nx
X-Gm-Gg: AfdE7ckR+VHevs4o6p8joZSfvm/pGplYRmDj0NJCaYMN+XVSriog5IoZEuWm6K9rOZK
	fEcd4mGPxfMhAcvVlo8+VbtCNupv8pEx90FauLaNRA9ttjZXxldc1J2myI9RIyYQ/3AXq2vxG5u
	goKtAmFZ7b4d5RT39mC5HkW0yrIielxb+F8W1ZaMn+MqT8anNuNMu/XAOt8byUi99mCJbgO/TMI
	sbl3CgsBrHePBOs+oaTspHiDwxzmhAff7g6f3KoH4udJve+UO9ZZMWpbEdF3AdGBaKZ+V+QI/kC
	c/E0FUUThGxTzI0rv/0WGjM3pIVNxilVnuruX7iKl6aiLf4bqbLd1JLbbAQumzLVCz596hXY5PW
	P/YO8KgKEkbtN9R/P+V++2qtvDVdw2c4/nBT/6rlOJ4Qrm0RfzCpo//DOA8RckTVa+1y9rcXMy9
	W2cxUd1qoJq4IiOCeeobngoonJPaFMGgWjCOgL/Ohkuiy0LQs=
X-Received: by 2002:a05:7300:1481:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-30bca21d5d8mr1702825eec.34.1781692619223;
        Wed, 17 Jun 2026 03:36:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:58 -0700 (PDT)
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
Subject: [PATCH 26/78] ASoC: codecs: da7219: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:43 +0700
Message-ID: <20260617103235.449609-27-phucduc.bui@gmail.com>
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
 sound/soc/codecs/da7219.c | 59 +++++++++++++--------------------------
 1 file changed, 19 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f0874d891e12..171ee6346b2e 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -256,13 +256,10 @@ static int da7219_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -270,13 +267,10 @@ static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -284,13 +278,10 @@ static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -298,13 +289,10 @@ static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -422,9 +410,8 @@ static int da7219_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7219->ctrl_lock);
+	scoped_guard(mutex, &da7219->ctrl_lock)
+		ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -456,12 +443,12 @@ static int da7219_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
-	if (ret == 0 && (val_old != val_new))
-		ret = regmap_raw_write(da7219->regmap, reg,
-				&val_new, sizeof(val_new));
-	mutex_unlock(&da7219->ctrl_lock);
+	scoped_guard(mutex, &da7219->ctrl_lock) {
+		ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
+		if (ret == 0 && (val_old != val_new))
+			ret = regmap_raw_write(da7219->regmap, reg,
+					&val_new, sizeof(val_new));
+	}
 
 	if (ret < 0)
 		return ret;
@@ -1167,15 +1154,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	if ((da7219->clk_src == clk_id) && (da7219->mclk_rate == freq)) {
-		mutex_unlock(&da7219->pll_lock);
+	if ((da7219->clk_src == clk_id) && (da7219->mclk_rate == freq))
 		return 0;
-	}
 
 	if ((freq < 2000000) || (freq > 54000000)) {
-		mutex_unlock(&da7219->pll_lock);
 		dev_err(codec_dai->dev, "Unsupported MCLK value %d\n",
 			freq);
 		return -EINVAL;
@@ -1193,7 +1177,6 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		break;
 	default:
 		dev_err(codec_dai->dev, "Unknown clock source %d\n", clk_id);
-		mutex_unlock(&da7219->pll_lock);
 		return -EINVAL;
 	}
 
@@ -1205,15 +1188,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		if (ret) {
 			dev_err(codec_dai->dev, "Failed to set clock rate %d\n",
 				freq);
-			mutex_unlock(&da7219->pll_lock);
 			return ret;
 		}
 	}
 
 	da7219->mclk_rate = freq;
 
-	mutex_unlock(&da7219->pll_lock);
-
 	return 0;
 }
 
@@ -1298,9 +1278,8 @@ static int da7219_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 	ret = da7219_set_pll(component, source, fout);
-	mutex_unlock(&da7219->pll_lock);
 
 	return ret;
 }
-- 
2.43.0

