Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235BE400E0A
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692635; cv=none; b=JlLHvwVWDuFoiPKj4b816mZcFClbKjTNG0fngR1n7g8apX1J6Mxi1bPHxl3KkIZ11F8YNI3JTrSfncYAcnAvK79HlezBTBwJORtLtJ2a9ZyTu3HE882XKyVb2fNPIx/KyVlVv5mm1hzTDTi68KsUaEyW99tt5N+29CYRpXZfs9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692635; c=relaxed/simple;
	bh=6JGmkvmPv3bfeFK1z8LiLk2AYl5VVZRgiOOlTyfPPvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cl6mVb/tKN9/503Z7YbSQqQthA3f0q68rOQy6gkMSMaLKHCblEvamu7RFGx08rOBgk03MOrw6FWQ+PC7GsTzwTLWjuvugSuPfxgIOHb4kJCD18pzGYuC6Sd6aCQSGPkWSHDb+eu9ZzhTcVYZ6hs+U4PK/JllnaWwOFnKNaKAWII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEWPKD62; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEWPKD62"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30759632453so8913304eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692628; x=1782297428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcitmHPXdjwjVBCqMlXK3p8pn3Z3237U4G8SnuErAoU=;
        b=XEWPKD62XCfnbticsDC652/NHMkNuF+kYMxlP2pVmnjpUn1blTl4PeVtjajnY86AIX
         4aNr8HgsJKmlCfmAgRgeHiGcEQsi45XBv1ljl8Ql8l07z9zYlu/89OKIQLihBOWe6C0O
         VARgC+fItkDDYNelo92XXljl9rXyj8pQwiZCpFgzoQFYijfnnWFNIfToeDAa1QbtY1jJ
         Vr9qdIu1N6YGfiNMUEhV+jBxD8ogDPEZ6suNGl6Hf9I2gHkp911EvH73q4+EXiE53Ump
         ugNN5YMq7To4E6UTEGu+kSGlWK908DXLINyUqqiUYUOihyzyGhxdQ77fvCf0pcaFCjzM
         3pfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692628; x=1782297428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xcitmHPXdjwjVBCqMlXK3p8pn3Z3237U4G8SnuErAoU=;
        b=afWiaz79zrBTjZCPxOGmdPIY4yKnKNsgrSPden/JnGKF7DvNxjnb2P6gfxaT431II3
         nhD0synoNjf8qJT/UlTj/mNZKgqRZdFVenYCJcV3QWRc+B1albpe+axCY74IEnIZkeIP
         j4wMom9LGe55+p6mywQh6Eqss5AoSXY7mAlFNHiBDBS8LHt6BuVq7X4l+Htm115qKzm8
         BFVPzyn8ro8lXdd+rzPbLCULh+FMjX7MPEhijo6Wj5ELZs7jDrm0eHsN4dt48Mr6Lrcs
         26PAh8mfzPWUp6xYkTjjp4YqWZdwwRjZrLvIY1YY5bOjAWpAcss11p8Nd74iAq9ktHLq
         TfCA==
X-Forwarded-Encrypted: i=1; AFNElJ8imem8JBcBUgGZJVo3GFEBELdSuoJLo2EoHkuEvYH3KwqqtQIiF32u57U6dCgQ+ZT0bGHU1qpjr4IQThcnEn0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTal1vT3HJEl9GW7+ACmWbf5/+O3JSr1Wjc1K1X1TVzdFZvMPc
	iEeJZxGelKIZvieLwDpY6YxUvSudbSSNHSKctG/4t6kC2O7l9jaY5hNW
X-Gm-Gg: AfdE7ck0oLno3pOihck/LE1c4KHUZ930Z2m+Pxov8Yzkx0IgJ3Tamv8evY/nZUkT/R7
	q5MPQacftZrvycSchoR0RlpigbcQZxwFFhOpIFRMrOPMVmI3ax+6iMpPJPYCCSyjnKXh/vwAuQJ
	XQ6E9sfD8ZnXpA6Lm1pluyIU2bUjF//YVMzcLlJDiTie6hWTF0n4X/RELQC0d2Zn6V8LZvvk+cW
	S/OHd39QhzacwUACPirUixtt3IoIqpSpUju8yMsYU5/EGYcO/JiwcXWc65FEFJ2YYtoxoqrBuHg
	UO6aJRJwoa6T4aGelc0FQ2FiizKZ48RSa/xQcA5OkTRFRwiV8i71WzGBVg9EGIVAH4QodQpgkAa
	MT1BW7YN2ZYH3FgIeiLBVxa1psOthM+UMMUTQuMaiIXJK72RVKSypALQu6qhKuJFj2WgMg1XDTE
	xdRq9Wi2VNPhB2VMTJGpxrWMriIQox0s/ax3LR/aSJRtenC8A=
X-Received: by 2002:a05:7300:4313:b0:2d1:d434:cfe3 with SMTP id 5a478bee46e88-30bc92019d6mr1607108eec.0.1781692628170;
        Wed, 17 Jun 2026 03:37:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:07 -0700 (PDT)
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
Subject: [PATCH 27/78] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:44 +0700
Message-ID: <20260617103235.449609-28-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es8316.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 6a428387e496..df6cf8a19270 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -621,15 +621,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
 	struct snd_soc_component *comp = es8316->component;
 	unsigned int flags;
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
 	if (flags == 0x00)
-		goto out; /* Powered-down / reset */
+		return IRQ_HANDLED; /* Powered-down / reset */
 
 	/* Catch spurious IRQ before set_jack is called */
 	if (!es8316->jack)
-		goto out;
+		return IRQ_HANDLED;
 
 	if (es8316->jd_inverted)
 		flags ^= ES8316_GPIO_FLAG_HP_NOT_INSERTED;
@@ -682,8 +682,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -700,18 +698,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
 	es8316->jd_inverted = device_property_read_bool(component->dev,
 							"everest,jack-detect-inverted");
 
-	mutex_lock(&es8316->lock);
+	scoped_guard(mutex, &es8316->lock) {
+		es8316->jack = jack;
 
-	es8316->jack = jack;
-
-	if (es8316->jack->status & SND_JACK_MICROPHONE)
-		es8316_enable_micbias_for_mic_gnd_short_detect(component);
-
-	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
-				      ES8316_GPIO_ENABLE_INTERRUPT,
-				      ES8316_GPIO_ENABLE_INTERRUPT);
+		if (es8316->jack->status & SND_JACK_MICROPHONE)
+			es8316_enable_micbias_for_mic_gnd_short_detect(component);
 
-	mutex_unlock(&es8316->lock);
+		snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
+					      ES8316_GPIO_ENABLE_INTERRUPT,
+					      ES8316_GPIO_ENABLE_INTERRUPT);
+	}
 
 	/* Enable irq and sync initial jack state */
 	enable_irq(es8316->irq);
@@ -727,7 +723,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -738,8 +734,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0

