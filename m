Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442E847885D
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692644; cv=none; b=u+OAEv13aHo5svdFAIpRUeEUwfrhLaPHQ+DnERkuGO2By8bH/xNyjDCN8GZ1KPCAclmIKiODr61Oy0MiCcoa42T30U7xg1c98l8pqOnkK9OK7ZHhcQmF+s+azqrLs9LFmr5c0DTDsXLaN8i43CjXHW9MTnZr/MZkT4osKF1x+5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692644; c=relaxed/simple;
	bh=bV0wrsnUSNArsr1QxrKoX10viZPs2daxbLWhpuMFSns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmsLt/IM+1SfGQvqea7opFEmSKSWKs1zXnYo7Faze9/K95WPCDlAMX10OncIGr8NgxKHiLFgOrZqRl/AVTmX52qX7fg3Q45yYnpSoViYrj0AXwafdNZ0U00Zf3dV72cI/s/XPyoWJVpMyXRlFbyjUNDsgeMWyKPwt9WO9TMCALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cltgfvsh; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cltgfvsh"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30be4a661aeso104249eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692637; x=1782297437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS60dBgVHLJM7xKUP9F+W887F9cI3ycWsKsxpAyWFqA=;
        b=Cltgfvshj5Dwgu0Db+25FGxYVL3cct10GArwpEOk/g2WSbNa3vhHhzme9uFRoZ2DX1
         +0IeoaVRVxbzzzh8I9wJw91WZx/TJftmBcG30XmLOcs21oKXCCFJKWizHVFsi5J3uKIf
         GbnJVHHpII0nWm4GEzZb6q5XfRwppkd34px2RKzTlI1LBxfoMokni0Dzg+AgUz8KOB7m
         nx7kizl7YIYTqflGyVUnly4/wlpsDjIobFZT3A7VHCwvQ//JXo+E90iATuH0CzJMjsvF
         gQVY7jqGLNe/WBacSb5FaHypPXEyaEW4/1Njv4n9UUbHGW5kRmFZUX1Ka0x3k4Jx1kWu
         5q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692637; x=1782297437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RS60dBgVHLJM7xKUP9F+W887F9cI3ycWsKsxpAyWFqA=;
        b=dFfYgyrF4rXbXkeP+mbogx9c4FNiH8CcrJwWcLvfTmd0oIGot1aoNpuANZG+WXKnxv
         KmNPWVS4rw2vBYYMMpZ1Kthj1L13JXA4YQu0tOJ6zS8fV4oReXT2nS0wLnF1ecEOkJg/
         H0ldj3hRjHUB1veoGdq0LemHTC3qzd9HW9BfQWehYHmBTud2BsxE40GvoQZBHb5PXxOM
         CY88r62Vq1CgxyCvrXFHem57GKc2TqCPgRLNyImaI3WSp5VYCJbgX4maSK1DPY2qDQ2U
         xr7KAcT3fYhRmCWavqe8K0C+bRPempuKs40qVUMw8+CNTWJ8HkbffZCuWBn9+6A07yjl
         b93A==
X-Forwarded-Encrypted: i=1; AFNElJ8PFb/0TyrWYzHVNSwNpSR+dgZckyPNVixyByGp6MyMNZkmdoLIPtRW5R8Q+64cwoJBKb5lihaF2xaqtqrenGA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwjK3t3fw5pvK/zaPMbSwnXtyjkTd5+q1BiMhRUU1SyxXAYXbR
	J2kkHGZGlEFD6LV+Pgnu6xAXD/Ob5B24vpOCsNR08rrVmlWmT3yculWE
X-Gm-Gg: AfdE7ckDGbrRagK0tE6aEiw55Ch5y13VlkKiYcRrIdqUR1gFr+7uO1+ZquHWUxdlqei
	mmGg5KzGwDk4rMacLg09f5Eue5pi9N/PtPzQ+4QKfh4d8C3aHKID8/Fws/s7VvUWhdFEaWmXciP
	BdTG1f4ZfwRwkaZQCVUoKWvxu8b9vfeTY4WJoQeoFKnE1R0xiQvBAF0WujW1LVMNaEq8v57s3u0
	cnKYZLJVLuaRju5KCjzti2H9vy1beZfpBBBzaCE13cNu3E5cSwPo89RlTLcUNzoX2xjVk2XqnTV
	YSDcUIH8womtru6I6s+Jz4qiFRwKz2sXk+q4Ovbn5Bva+eLrnqmraHJ3dkkc+1Eq+UcYJ/A1UQN
	fTLS3w3O7GQB2ocNLRduaaanRwcuW9jaG5XaGZ+AHvsGeV9mkCkW2xxfz0/D74EFMJreDnNFvje
	cSz69WYOAKSX4E7W6SZSsmxTKgTNNG6j0HdaHfZ2LshN+Mvcs=
X-Received: by 2002:a05:7300:7481:b0:30b:bf5c:c878 with SMTP id 5a478bee46e88-30bca067e13mr1803295eec.25.1781692637212;
        Wed, 17 Jun 2026 03:37:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:16 -0700 (PDT)
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
Subject: [PATCH 28/78] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:45 +0700
Message-ID: <20260617103235.449609-29-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es8326.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a79b2da35099..4aaae6eab7f2 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -790,7 +790,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
 		return;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
@@ -845,7 +845,6 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		}
 		es8326_disable_micbias(es8326->component);
 	}
-	mutex_unlock(&es8326->lock);
 }
 
 static void es8326_jack_detect_handler(struct work_struct *work)
@@ -855,7 +854,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_component *comp = es8326->component;
 	unsigned int iface;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 
@@ -873,7 +872,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE,
 					ES8326_HP_DET_JACK_POL, (es8326->jd_inverted ?
 					~es8326->jack_pol : es8326->jack_pol));
-		goto exit;
+		return;
 	}
 
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
@@ -930,7 +929,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			queue_delayed_work(system_dfl_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
-			goto exit;
+			return;
 		}
 		if (es8326->jack->status & SND_JACK_HEADSET) {
 			/* detect button */
@@ -939,7 +938,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			es8326_enable_micbias(es8326->component);
 			queue_delayed_work(system_dfl_wq, &es8326->button_press_work, 10);
-			goto exit;
+			return;
 		}
 		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
 			dev_dbg(comp->dev, "Headphone detected\n");
@@ -958,8 +957,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			usleep_range(10000, 15000);
 		}
 	}
-exit:
-	mutex_unlock(&es8326->lock);
 }
 
 static irqreturn_t es8326_irq(int irq, void *dev_id)
@@ -1200,13 +1197,12 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&es8326->lock);
-	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
-					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
-	es8326->jack = jack;
-
-	mutex_unlock(&es8326->lock);
+	scoped_guard(mutex, &es8326->lock) {
+		if (es8326->jd_inverted)
+			snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
+						      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
+		es8326->jack = jack;
+	}
 	es8326_irq(es8326->irq, es8326);
 }
 
@@ -1219,13 +1215,12 @@ static void es8326_disable_jack_detect(struct snd_soc_component *component)
 		return; /* Already disabled (or never enabled) */
 	cancel_delayed_work_sync(&es8326->jack_detect_work);
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	if (es8326->jack->status & SND_JACK_MICROPHONE) {
 		es8326_disable_micbias(component);
 		snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 	}
 	es8326->jack = NULL;
-	mutex_unlock(&es8326->lock);
 }
 
 static int es8326_set_jack(struct snd_soc_component *component,
-- 
2.43.0

