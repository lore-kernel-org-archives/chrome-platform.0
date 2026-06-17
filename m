Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D18421F0F
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692750; cv=none; b=kq2xq3GUQ3/8tGFR4NPt/ly3OYjyynHv5wzATimgaP9MqshDAiWBqWWfcLDOV0wrOnqGi+VfK4JedxNmoQvFrKQr+kmYltRC6u1q8xlUkJNlNu3rIKgByIbCIaVoqcUMhfKmaf1HB5d3VeqeEMzUo7tBvqKea7Abcfy16GUsZ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692750; c=relaxed/simple;
	bh=2OS+ZLeJB3Vp7Kq/OKrNMwANrE/9kC0JDhKdYAhqOEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bsRlEgBE6hKKQjaxD/hOZjXVhDjBIqws8hHZpAYSHO13thDZ7w597bD11mKijLL+K9RJbW3nej4VSlBcAdXTC+zTHGDDZta31jA1WcWRKMNh02Vo4d+UDhefwJh/ORmXnU5inCroNO14tZs9XiGGAy9ZHhaQvCVRDDHRJG/0Fl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhEKbZVb; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhEKbZVb"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-307d0405e07so8461058eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692748; x=1782297548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYWRPoZz4ae7K4jnXXMDEkNAOT3Lgww531flfNqozJE=;
        b=BhEKbZVbDX2VDwBLhlUtS19QTeDGUkLbkhW4sWpGSj3ohss5cdxro4PyvIFvDzpi7/
         6yUC+QuiTiuy4yvN66+HcyMH30r8HMxTMPHREaJKBl37G31qDaLsituyuD6CIVf4rdIv
         P2Ucbe7um4RqmErasXs0mA//E6EL/W67cxJw/F8UKK5QZnAYhcZ0/XxpmR2aflz71db2
         Ti+zx6KYlvwYXfpssbj6ESZ+zR190szF+TTpTXaI91EdQ19J48xN1pAix739sUDecjGe
         VzfZY2CmHaylzS7QxKZZXyMaYJggWm4AUCWyIByGP2c6KfZ1HN4z3bwlS21sYV9Bp1wv
         4/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692748; x=1782297548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IYWRPoZz4ae7K4jnXXMDEkNAOT3Lgww531flfNqozJE=;
        b=RMDkjRx9vXxbzidyJDvRYNeIJdGHMvPMRTCqutHEuhqU9AcLqMv51VJGxlvntEkPOu
         xhg8SV/x4gjUaWr2BAxpVe1IoZRNQFyZtPJ64SrCzK2qoJnxP2ld6ffQfhZFPxtvToGN
         M6/gLcvRZfS2SWnOMIg+eDOAED21QbmG6PuRpZrnMTXWeuxIz+Wb+eW7h7X5KebFGsH2
         yFrXfceAZt7Wk9SGlGPvwi3jcxYzE1QXqYAVg4aDBQrTQ5aG6GlusaHg/WtCRpj5LWZH
         DX0xlWZ4eCbBbsXGRNWvU8nw2uEZC0Amz+J3HR30cZA8dLm46ghC3Bu5H5PtlXR27o7+
         unfA==
X-Forwarded-Encrypted: i=1; AFNElJ+dWDxDsHOhfufxPUyO5WOWoC+Azv1GlwRCKgitYBswn2wGHqN7f4ezCfInbm2ClWMKzh36pln2XEuE/GZAyOE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkV1eu+2lzW7Z3XPQLqk5qrU8K+z1F9h9FHywJY7thdlDUvI5R
	dJulOxyn2lYm9SSK0ZT+3Vqo8L0KoEMOr8G95LDaiYA1AM1p08Pxl7BW
X-Gm-Gg: AfdE7cmP7GA/Xay6zx/ijXN442zA0XwRWGaN0HmOuwVWRZ9WgP3Obw1S+ckVteSXuQE
	EAG0ZbHWQtXEFQJk3juScRWrKnJ3/Qt/B8OwHRfL0aR/FwonuJEVO7VL/tSFO91Id5UVuonZeoa
	nfDwE9opWxAkxAI5BFT9uUBOiw3PWsXrHzhk1COPlrK0E3dykKH6rrveXx90W/9o7xIa+ay2guu
	mKPsyKBSQQwli0bHv6wSx3C0pAmxwBzbJ3FnfWPAfWuf7tEKAK1znCx7SmXfT5gnD2w98SJJ/0C
	ngaKD1ffXS1vsnZZMvUYvYj/bX0oLc9ouPEax8vf4MvrS1kygHyKl9cyS83XcU/IsTtxKG7gaiQ
	mbA2P0vWc6gy1WY9QkuNOC+0l82n6VsuTn7lK9bsnOWwqdhaMAnk+jqUU7E7nl6S1C8RtV/Gsg4
	rWQlGKJKHkjhXAbTtNKGG/xVrJDX9SUnpkpiuZouwoEqngDlHli0tKMpM+rg==
X-Received: by 2002:a05:7300:2388:b0:30b:8862:db15 with SMTP id 5a478bee46e88-30bca100cc9mr1489898eec.28.1781692748156;
        Wed, 17 Jun 2026 03:39:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:07 -0700 (PDT)
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
Subject: [PATCH 39/78] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:56 +0700
Message-ID: <20260617103235.449609-40-phucduc.bui@gmail.com>
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
 sound/soc/codecs/pcm6240.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 4ac4448ac3c8..984fabc6d578 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -605,7 +605,7 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int reg = mc->reg;
 	unsigned int val;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	if (pcm_dev->chip_id == PCM1690) {
 		ret = pcmdev_dev_read(pcm_dev, dev_no, PCM1690_REG_MODE_CTRL,
@@ -613,18 +613,18 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 		if (ret) {
 			dev_err(pcm_dev->dev, "%s: read mode err=%d\n",
 				__func__, ret);
-			goto out;
+			return ret;
 		}
 		val &= PCM1690_REG_MODE_CTRL_DAMS_MSK;
 		/* Set to wide-range mode, before using vol ctrl. */
 		if (!val && vol_ctrl_type == PCMDEV_PCM1690_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -25500;
-			goto out;
+			return ret;
 		}
 		/* Set to fine mode, before using fine vol ctrl. */
 		if (val && vol_ctrl_type == PCMDEV_PCM1690_FINE_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -12750;
-			goto out;
+			return ret;
 		}
 	}
 
@@ -632,15 +632,14 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	if (ret) {
 		dev_err(pcm_dev->dev, "%s: read err=%d\n",
 			__func__, ret);
-		goto out;
+		return ret;
 	}
 
 	val = (val >> shift) & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
 	ucontrol->value.integer.value[0] = val;
-out:
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return ret;
 }
 
@@ -678,7 +677,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int val, val_mask;
 	unsigned int reg = mc->reg;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	val = ucontrol->value.integer.value[0] & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
@@ -702,7 +701,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 			__func__, rc);
 	else
 		rc = 1;
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return rc;
 }
 
@@ -1580,7 +1579,7 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 	const struct firmware *fw_entry = NULL;
 	int ret, i, j;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	pcm_dev->component = comp;
 
@@ -1634,7 +1633,6 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 out:
 	release_firmware(fw_entry);
 
-	mutex_unlock(&pcm_dev->codec_lock);
 	return ret;
 }
 
@@ -1645,9 +1643,8 @@ static void pcmdevice_comp_remove(struct snd_soc_component *codec)
 
 	if (!pcm_dev)
 		return;
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_config_info_remove(pcm_dev);
-	mutex_unlock(&pcm_dev->codec_lock);
 }
 
 static const struct snd_soc_dapm_widget pcmdevice_dapm_widgets[] = {
@@ -1890,9 +1887,9 @@ static int pcmdevice_mute(struct snd_soc_dai *dai, int mute, int stream)
 	else
 		block_type = PCMDEVICE_BIN_BLK_PRE_POWER_UP;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_select_cfg_blk(pcm_dev, pcm_dev->cur_conf, block_type);
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return 0;
 }
 
-- 
2.43.0

