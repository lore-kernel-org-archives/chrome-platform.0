Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72428477993
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692807; cv=none; b=CjkxiRU2PUOPKmzt0W8KaNPajoPtJM/m7rAQVDteYBecmvobEsinILVC4aIWG03mGcyCLI4bQP4MvwmZih1Vz9UYieBt9lp3mGXeM3dE+KSdulbA4pfVZ5g/qbCoDZpSzSoSv2GA1cZ9cwsjwnqlpTpK8wwgygNV6E0nql+zyoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692807; c=relaxed/simple;
	bh=B3a+HptmpYhmxBPPB7HraQVI4U2Yl3Y0z79s2iXuwWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=serM5+9uvCQ174vW3zB3Z7oJ3lFTKYX4Q9mowrl6u+LEqwmDfwvDUlgdziBd/z608TVNOdXvasRtEVoHvDy2je+c1wqRmjKwdc5n2wWlUUgkk+rMbHuaE8/kdEy3nnhpVSo+uPrh6f7w2JDz1gDXDkcFsM213u1MrIp3h5FaDkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPVcTILc; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPVcTILc"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bcf74e617so1421416eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692806; x=1782297606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4NAL+Ax67W1fnPekopS276z3NNPB/KQWk3jQSVarPU=;
        b=rPVcTILcKtJrV6RCvxOM3a0+eb7pdkWfwg3JObIRpTbYKpkaGJhfTLlhcc1YSE2NY8
         YH/hJXTGeuNK8HQLFGUajNoxehOnvs9+oFd71v0aGc13LEXmHyZZuQJz7NZ9GlAO0NRQ
         RnRuKrI8tgArRiz3z6PKCg/TQr8p2VA861Pjx+IvjSFMwo6NHlIZqB0M7lverKA0nSqG
         t/CwQZ0KHDG5v+Mlz0WoOFt9loyydpOYpczXzFNV6ctV8cDvcBaT6cj3oHCCNdWMuttf
         RmKdPjr0nhE9F3VhgBA+YL2A6NlnqHuHPI8bEVRBDpD3jrANuKIvJS3Qc+A9C7hAajI9
         62Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692806; x=1782297606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4NAL+Ax67W1fnPekopS276z3NNPB/KQWk3jQSVarPU=;
        b=r1ceal85Dj5lRvDSEbhWSbb55OCJBsjeOo8l82XTEPneg+YXsYLoDG5a2RJ+lugnkn
         XzBWEbYglinZsECHt7GhGqtrksMUQX3v0MlPf9SPBHYYz63vwYBu0RyaHSe2MPcBZxz0
         1WxwYt5iCeqv19isRTbkctyut5g0o1czFwI1wNrpEfecV7Scss0mAjMV0VPdTGT6sj2m
         GMlNSoLHxGLTZK2hm71c/ERohNR221O+rWVsyRnYy7tr8o8TKRPbOFbfT8hNq5FKH51L
         AMj2Pw7Nh1oRWyEIaEgTvHaXZxIjSn/od7yFPd8lhflxG1adPdCddM9nNWToIIfyM23R
         5+8w==
X-Forwarded-Encrypted: i=1; AFNElJ8Yc3jTE5FZMX7sS2ZRLufRM50+aL1J1iFROGH5WjsWB2V4+jBmP89tvc451XQVev09U5J7TmRivNAWj3ZoRUY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0Spy8qpISmpmosw1g3FLTBCqJWCCkqNDVDXXyF5MZ39cPP1bd
	3CjUMSgeDwUC1vwRQY2uSbARfeU4pkV50hsjdgtk86k/TLk7dsv7bKx2
X-Gm-Gg: AfdE7clt8JcPO+XTzVH8b93FyoVgaWQLqq8nHpf9T2G+CKGAC0TGgR2s+R7BAqOK7kM
	nHndr0RoX9rOPbXUmq0iZiBy2/0cYcUEF5j5TurCP8Ucz5LWQ5Oee4nBCxaIqb4e2VkPtH1TTqv
	xHzbsDGYXykpgXDf7xYLD7ljBwAPPgEB+EowwFyIAUf0M1CNlzcu+mz2W6/zteE0mFSZWwB4aAL
	rKlpl8sg1PtCY20XUxEybDymgWT8phrU+olvWno9nlGosvuUGWQPdVV4DLJ+H1DIHBrTRlwJZD3
	PGu2i9u40AdVh7cJjQtAESjkCsQ52aPuba0HCp6Pz9EXpQh9GJvt8mnu9qAiJHHBf+HWvUayoaS
	vlDQrbCIJ1HFzSivBG0haFAeIm+Hzxm49uWUAfapZSWUNFW9BWDF+jkziSQBQZ8d18uFppJ8gCU
	3EAdtw/SU2a3ThGp9UFtlBOva3HthhRpc44rRtaUbySTtDl9U=
X-Received: by 2002:a05:693c:3109:b0:2c0:c5e4:605f with SMTP id 5a478bee46e88-30bca10ce70mr1641138eec.24.1781692805548;
        Wed, 17 Jun 2026 03:40:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:05 -0700 (PDT)
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
Subject: [PATCH 45/78] ASoC: codecs: rt5677: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:02 +0700
Message-ID: <20260617103235.449609-46-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5677-spi.c | 35 +++++++---------
 sound/soc/codecs/rt5677.c     | 77 ++++++++++++++++-------------------
 2 files changed, 48 insertions(+), 64 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 1bcafd5f4468..f559f7b15bae 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -133,9 +133,8 @@ static int rt5677_spi_hw_params(
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	rt5677_dsp->substream = substream;
-	mutex_unlock(&rt5677_dsp->dma_lock);
 
 	return 0;
 }
@@ -147,9 +146,8 @@ static int rt5677_spi_hw_free(
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	rt5677_dsp->substream = NULL;
-	mutex_unlock(&rt5677_dsp->dma_lock);
 
 	return 0;
 }
@@ -311,17 +309,17 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 	int ret = 0;
 
 	/* Ensure runtime->dma_area buffer does not go away while copying. */
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	if (!rt5677_dsp->substream) {
 		dev_err(rt5677_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5677_dsp->substream->runtime;
 
 	if (rt5677_spi_mic_write_offset(&mic_write_offset)) {
 		dev_err(rt5677_dsp->dev, "No mic_write_offset\n");
-		goto done;
+		return;
 	}
 
 	/* If this is the first time that we've asked for streaming data after
@@ -355,7 +353,7 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 		ret = rt5677_spi_copy(rt5677_dsp, copy_bytes);
 		if (ret) {
 			dev_err(rt5677_dsp->dev, "Copy failed %d\n", ret);
-			goto done;
+			return;
 		}
 		rt5677_dsp->avail_bytes += copy_bytes;
 		if (rt5677_dsp->avail_bytes >= period_bytes) {
@@ -367,8 +365,6 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 
 	delay = bytes_to_frames(runtime, period_bytes) / runtime->rate;
 	schedule_delayed_work(&rt5677_dsp->copy_work, secs_to_jiffies(delay));
-done:
-	mutex_unlock(&rt5677_dsp->dma_lock);
 }
 
 static int rt5677_spi_pcm_new(struct snd_soc_component *component,
@@ -507,10 +503,8 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
 		header[3] = ((addr + offset) & 0x0000ff00) >> 8;
 		header[4] = ((addr + offset) & 0x000000ff) >> 0;
 
-		mutex_lock(&spi_mutex);
-		status |= spi_sync(g_spi, &m);
-		mutex_unlock(&spi_mutex);
-
+		scoped_guard(mutex, &spi_mutex)
+			status |= spi_sync(g_spi, &m);
 
 		/* Copy data back to caller buffer */
 		rt5677_spi_reverse(cb + offset, len - offset, body, t[1].len);
@@ -564,9 +558,8 @@ int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
 		offset += t.len;
 		t.len += RT5677_SPI_HEADER + 1;
 
-		mutex_lock(&spi_mutex);
-		status |= spi_sync(g_spi, &m);
-		mutex_unlock(&spi_mutex);
+		scoped_guard(mutex, &spi_mutex)
+			status |= spi_sync(g_spi, &m);
 	}
 	return status;
 }
@@ -591,10 +584,10 @@ void rt5677_spi_hotword_detected(void)
 		return;
 	}
 
-	mutex_lock(&rt5677_dsp->dma_lock);
-	dev_info(rt5677_dsp->dev, "Hotword detected\n");
-	rt5677_dsp->new_hotword = true;
-	mutex_unlock(&rt5677_dsp->dma_lock);
+	scoped_guard(mutex, &rt5677_dsp->dma_lock) {
+		dev_info(rt5677_dsp->dev, "Hotword detected\n");
+		rt5677_dsp->new_hotword = true;
+	}
 
 	schedule_delayed_work(&rt5677_dsp->copy_work, 0);
 }
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index ac084ca008f3..fd060227655e 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -563,46 +563,43 @@ static int rt5677_dsp_mode_i2c_write_addr(struct rt5677_priv *rt5677,
 	struct snd_soc_component *component = rt5677->component;
 	int ret;
 
-	mutex_lock(&rt5677->dsp_cmd_lock);
+	guard(mutex)(&rt5677->dsp_cmd_lock);
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_MSB,
 		addr >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_LSB,
 		addr & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_MSB,
 		value >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set data msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_LSB,
 		value & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set data lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_OP_CODE,
 		opcode);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set op code value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
-err:
-	mutex_unlock(&rt5677->dsp_cmd_lock);
-
 	return ret;
 }
 
@@ -622,36 +619,33 @@ static int rt5677_dsp_mode_i2c_read_addr(
 	int ret;
 	unsigned int msb, lsb;
 
-	mutex_lock(&rt5677->dsp_cmd_lock);
+	guard(mutex)(&rt5677->dsp_cmd_lock);
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_MSB,
 		addr >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_LSB,
 		addr & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_OP_CODE,
 		0x0002);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set op code value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	regmap_read(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_MSB, &msb);
 	regmap_read(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_LSB, &lsb);
 	*value = (msb << 16) | lsb;
 
-err:
-	mutex_unlock(&rt5677->dsp_cmd_lock);
-
 	return ret;
 }
 
@@ -940,21 +934,20 @@ static void rt5677_dsp_work(struct work_struct *work)
 		activity = false;
 
 		/* Don't turn off the DSP while handling irqs */
-		mutex_lock(&rt5677->irq_lock);
-		/* Set DSP CPU to Stop */
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
-			RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
-
-		rt5677_set_dsp_mode(rt5677, false);
+		scoped_guard(mutex, &rt5677->irq_lock) {
+			/* Set DSP CPU to Stop */
+			regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
+				RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
 
-		/* Disable and clear VAD interrupt */
-		regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
+			rt5677_set_dsp_mode(rt5677, false);
 
-		/* Set GPIO1 pin back to be IRQ output for jack detect */
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
-			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
+			/* Disable and clear VAD interrupt */
+			regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
 
-		mutex_unlock(&rt5677->irq_lock);
+			/* Set GPIO1 pin back to be IRQ output for jack detect */
+			regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
+				RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
+		}
 	}
 }
 
@@ -4980,11 +4973,11 @@ static int rt5677_read(void *context, unsigned int reg, unsigned int *val)
 
 	if (rt5677->is_dsp_mode) {
 		if (reg > 0xff) {
-			mutex_lock(&rt5677->dsp_pri_lock);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
-				reg & 0xff);
-			rt5677_dsp_mode_i2c_read(rt5677, RT5677_PRIV_DATA, val);
-			mutex_unlock(&rt5677->dsp_pri_lock);
+			scoped_guard(mutex, &rt5677->dsp_pri_lock) {
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
+					reg & 0xff);
+				rt5677_dsp_mode_i2c_read(rt5677, RT5677_PRIV_DATA, val);
+			}
 		} else {
 			rt5677_dsp_mode_i2c_read(rt5677, reg, val);
 		}
@@ -5002,12 +4995,12 @@ static int rt5677_write(void *context, unsigned int reg, unsigned int val)
 
 	if (rt5677->is_dsp_mode) {
 		if (reg > 0xff) {
-			mutex_lock(&rt5677->dsp_pri_lock);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
-				reg & 0xff);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_DATA,
-				val);
-			mutex_unlock(&rt5677->dsp_pri_lock);
+			scoped_guard(mutex, &rt5677->dsp_pri_lock) {
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
+					reg & 0xff);
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_DATA,
+					val);
+			}
 		} else {
 			rt5677_dsp_mode_i2c_write(rt5677, reg, val);
 		}
@@ -5313,7 +5306,7 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 	int ret, loop, i, reg_irq, virq;
 	bool irq_fired = false;
 
-	mutex_lock(&rt5677->irq_lock);
+	guard(mutex)(&rt5677->irq_lock);
 
 	/*
 	 * Loop to handle interrupts until the last i2c read shows no pending
@@ -5370,7 +5363,6 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 	}
 exit:
 	WARN_ON_ONCE(loop == 20);
-	mutex_unlock(&rt5677->irq_lock);
 	if (irq_fired)
 		return IRQ_HANDLED;
 	else
@@ -5399,7 +5391,7 @@ static void rt5677_resume_irq_check(struct work_struct *work)
 	 * Without this explicit check, unplug the headset right after suspend
 	 * starts, then after resume the headset is still shown as plugged in.
 	 */
-	mutex_lock(&rt5677->irq_lock);
+	guard(mutex)(&rt5677->irq_lock);
 	for (i = 0; i < RT5677_IRQ_NUM; i++) {
 		if (rt5677->irq_en & rt5677_irq_descs[i].enable_mask) {
 			virq = irq_find_mapping(rt5677->domain, i);
@@ -5407,7 +5399,6 @@ static void rt5677_resume_irq_check(struct work_struct *work)
 				handle_nested_irq(virq);
 		}
 	}
-	mutex_unlock(&rt5677->irq_lock);
 }
 
 static void rt5677_irq_bus_lock(struct irq_data *data)
-- 
2.43.0

