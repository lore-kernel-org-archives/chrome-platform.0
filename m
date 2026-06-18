Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6C73EBF02
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781031; cv=none; b=tViwMui9ZNSEdcLQIIZmCANtbJeaFRzgjXZKElJPCua8WZnimVOWerYEqh21+YVN3w2E/SolGALopXKGwruNVTFSL18oql/w7cLZV6k3IETT7tXawkiUFDDeZthQac7NWUSq9sbov/bvhZvxZIAB8mfgoM5hoN4C+sq2Yjf/eAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781031; c=relaxed/simple;
	bh=VepUQOH9I2YScBtyygKkYYIP3OnVwMB6+G3b8wmbhVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gv8zXb9lVFQkUcS/0qWGZX1vpVy5WowVFirrWtdw7DG5BPKtkEYV+EqYyIde/m50WjJFchpsHPlZ4cdL5cyIGFDUzZ1L3xqkkqh35AIgBLNPVXfe/DSXgm1eMMlno2mcWCwCIPwy0ZAcGKnXXD0BC4DrqEniM0SalwDwCJdGA5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cH3fm3nw; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cH3fm3nw"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36b900f350fso922751a91.0
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781029; x=1782385829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUydxf/ZwzEU3byhG6kKewQSumkNnr4b0Y4idMeiddo=;
        b=cH3fm3nwF2p8B/UXWleYu7rVphjhaYAg8BBQ4ySq/apsD8tTzfkcDAF/kjj9I0wZNB
         McBszp8j3J821E1B9vo/Tj/U6XsXvKyuPK3SzZdtAkaJG5O+zwXLNhFNWfDcsWmCh8eK
         sTYSsBb3B/+uPh/bfPwfzzm1HbqyFjIlvw5ig06vD7OzyxWvrEO5e/UoJyDGGqlJfKYt
         lqAhVSb9U47nmAz/3qvh8sfgiabmWqLyZqwPTIBwjsb5lT5NphDqOCxWOueNVHWXt0MY
         FucqY914bSKPyfRfC2T7mXgGRCm4e/3N0zCVygR3rWzN+jM1aw9fG55FuOlWlWVXbsli
         3aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781029; x=1782385829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUydxf/ZwzEU3byhG6kKewQSumkNnr4b0Y4idMeiddo=;
        b=m3cUeBa2LPMG5RGfZPpOFnZO6y5joVfPaP0foW5CUWJdKm8ZfIz9zcA8DqYcNpm0jg
         HCesDhnlCuHYxBHteTrcGb4ftG78Yn2D5hUOwMXbf0qcbVYl+ZAfvPZDimWhQrgnC1EY
         KxTIW98lCfn4K3H5UvOCMX4/0vOnT82/WPQ170tSAx6HfrsC38CzaeikB+zqdF+VCp/K
         SVAejpSpkeIENNrYJhfLS5SGX+r60T25D9OkZ1YidVD2cjJABG7fCa3pCv48I3khVXQJ
         Zy91rq4CqnfBUNjjQdrA+fhrSH+vLswrBD9XWK3IiGB5gpv/VlDTLgf0hN3Ll9JmC2Q5
         Z9qA==
X-Forwarded-Encrypted: i=1; AFNElJ/ceUUX2uuHqmls4AGi6sAFI7h0883k0X8bVH6XTdx/bs5d+j5Y8b+Ae6V259SizfXxRleQbUXgiDn4qS2IacQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzgTCnwPjXPYeGH8s5bo28jo0BxZfNPOMYo0XrqtY6sfF7kfW5
	IeksrZXSJl4vxH/G6EngdXuVaQHaA1TXpk2mZUWSAO+IXStZT0cLjW23
X-Gm-Gg: AfdE7ckF7OvPClnfOOAORm5vJHC1AyKnqwtkBxgnlCYRw3IcGHyoBvAmHhAIFQlY3c6
	j6xmpsD0WpqgwB5WeEb1GEQTn1gI0waJLIMqnsWPDLtDHruTSEbHm3Y9J8WunExey0cdxWZ0d1K
	qsYN2seXuqlyJBtFnh/yJgp2vVkblbnU6F19V7VGiivWrW5ViXsCjVBfvVT7mB6t/sckG52SgaD
	iU/Op6JwQVYkN4tyGcojJz6+U+l6V1j3KL4cKkHBwYSG4eUy4EH3g0T6tsQy0M9aNyz2qubF60A
	QH/WV4ie5lhIh+Wrcgj/cuosxoxSdNxqE+OCkbZkZ7gridjvHXzFbQwrFstSZHAMEXal50GCgKy
	xQ0gQ6nCkYkpEboH5yuQgI0AbvOyjHmoEoT8GYAkknbeudeojitUEzzDJPd0gEGYSuevWbHace6
	NTAVdhC9s72wTQ+RrWtyfoM8RnYCSCF2CBidK1rog5MdXEuZhXEGgIFDJFAQ==
X-Received: by 2002:a17:902:c945:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2c6e5155763mr34980605ad.19.1781781029264;
        Thu, 18 Jun 2026 04:10:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:28 -0700 (PDT)
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
Subject: [PATCH 68/78] ASoC: codecs: wm0010: Use guard() for mutex & spin locks
Date: Thu, 18 Jun 2026 18:08:17 +0700
Message-ID: <20260618110827.232983-12-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm0010.c | 63 ++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 2a8c61a72c17..aeca42e4caba 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -148,13 +148,11 @@ static const char *wm0010_state_to_str(enum wm0010_state state)
 static void wm0010_halt(struct snd_soc_component *component)
 {
 	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 	enum wm0010_state state;
 
 	/* Fetch the wm0010 state */
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	state = wm0010->state;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		state = wm0010->state;
 
 	switch (state) {
 	case WM0010_POWER_OFF:
@@ -173,9 +171,8 @@ static void wm0010_halt(struct snd_soc_component *component)
 		break;
 	}
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_POWER_OFF;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_POWER_OFF;
 }
 
 struct wm0010_boot_xfer {
@@ -190,11 +187,9 @@ struct wm0010_boot_xfer {
 static void wm0010_mark_boot_failure(struct wm0010_priv *wm0010)
 {
 	enum wm0010_state state;
-	unsigned long flags;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	state = wm0010->state;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		state = wm0010->state;
 
 	dev_err(wm0010->dev, "Failed to transition from `%s' state to `%s' state\n",
 		wm0010_state_to_str(state), wm0010_state_to_str(state + 1));
@@ -558,7 +553,6 @@ static int wm0010_boot(struct snd_soc_component *component)
 {
 	struct spi_device *spi = to_spi_device(component->dev);
 	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 	int ret;
 	struct spi_message m;
 	struct spi_transfer t;
@@ -568,10 +562,10 @@ static int wm0010_boot(struct snd_soc_component *component)
 	u8 *out;
 	int i;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	if (wm0010->state != WM0010_POWER_OFF)
-		dev_warn(wm0010->dev, "DSP already powered up!\n");
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock) {
+		if (wm0010->state != WM0010_POWER_OFF)
+			dev_warn(wm0010->dev, "DSP already powered up!\n");
+	}
 
 	if (wm0010->sysclk > 26000000) {
 		dev_err(component->dev, "Max DSP clock frequency is 26MHz\n");
@@ -579,7 +573,7 @@ static int wm0010_boot(struct snd_soc_component *component)
 		goto err;
 	}
 
-	mutex_lock(&wm0010->lock);
+	guard(mutex)(&wm0010->lock);
 	wm0010->pll_running = false;
 
 	dev_dbg(component->dev, "max_spi_freq: %d\n", wm0010->max_spi_freq);
@@ -589,7 +583,6 @@ static int wm0010_boot(struct snd_soc_component *component)
 	if (ret != 0) {
 		dev_err(&spi->dev, "Failed to enable core supplies: %d\n",
 			ret);
-		mutex_unlock(&wm0010->lock);
 		goto err;
 	}
 
@@ -601,17 +594,15 @@ static int wm0010_boot(struct snd_soc_component *component)
 
 	/* Release reset */
 	gpiod_set_value_cansleep(wm0010->reset, 0);
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_OUT_OF_RESET;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_OUT_OF_RESET;
 
 	if (!wait_for_completion_timeout(&wm0010->boot_completion,
 					 msecs_to_jiffies(20)))
 		dev_err(component->dev, "Failed to get interrupt from DSP\n");
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_BOOTROM;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_BOOTROM;
 
 	ret = wm0010_stage2_load(component);
 	if (ret)
@@ -621,9 +612,8 @@ static int wm0010_boot(struct snd_soc_component *component)
 					 msecs_to_jiffies(20)))
 		dev_err(component->dev, "Failed to get interrupt from DSP loader.\n");
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_STAGE2;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_STAGE2;
 
 	/* Only initialise PLL if max_spi_freq initialised */
 	if (wm0010->max_spi_freq) {
@@ -693,11 +683,8 @@ static int wm0010_boot(struct snd_soc_component *component)
 	if (ret != 0)
 		goto abort;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_FIRMWARE;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
-
-	mutex_unlock(&wm0010->lock);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_FIRMWARE;
 
 	return 0;
 
@@ -708,11 +695,9 @@ static int wm0010_boot(struct snd_soc_component *component)
 abort:
 	/* Put the chip back into reset */
 	wm0010_halt(component);
-	mutex_unlock(&wm0010->lock);
 	return ret;
 
 err_core:
-	mutex_unlock(&wm0010->lock);
 	regulator_bulk_disable(ARRAY_SIZE(wm0010->core_supplies),
 			       wm0010->core_supplies);
 err:
@@ -734,9 +719,8 @@ static int wm0010_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE) {
-			mutex_lock(&wm0010->lock);
-			wm0010_halt(component);
-			mutex_unlock(&wm0010->lock);
+			scoped_guard(mutex, &wm0010->lock)
+				wm0010_halt(component);
 		}
 		break;
 	case SND_SOC_BIAS_OFF:
@@ -832,9 +816,8 @@ static irqreturn_t wm0010_irq(int irq, void *data)
 	case WM0010_OUT_OF_RESET:
 	case WM0010_BOOTROM:
 	case WM0010_STAGE2:
-		spin_lock(&wm0010->irq_lock);
-		complete(&wm0010->boot_completion);
-		spin_unlock(&wm0010->irq_lock);
+		scoped_guard(spinlock, &wm0010->irq_lock)
+			complete(&wm0010->boot_completion);
 		return IRQ_HANDLED;
 	default:
 		return IRQ_NONE;
-- 
2.43.0

