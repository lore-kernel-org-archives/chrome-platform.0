Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DFB3F8232
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692739; cv=none; b=ULs2zuXAQiM9KQw9ZO8zF8cr5/hHkF7YGdsK0jflGQi0P5Gk/lsnugmsh+c6EWKFp4gz3i/E5mJBwjg+0ECqRkydzT1msLYVgCLJefK6OyEiyPDoxrTw0tE5u13L7ihbCF4tTLmR8kFlgQ3Lrq/XiDjYalcxWIP/pJuzfcj9M8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692739; c=relaxed/simple;
	bh=NLE+EBpHa+LlzJ3PP970fGwtuk6PJS4PH4FnLXZPSYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tP5X5Ok/G0tQI/IHw0QA3OuOfVpfcNJr4oL7VDKp/iWr16hKPdPNOXxwBzLmwYmtUproEKQV5DigTvajprsLdsKPviYpuSVh2eZFl5UFPUhKti4x3eFCcqiIv+S7j25W5iQlirWeX/jlV1A3alWeiMVozItJuYql10Ac47DPmvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWx5YoGc; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWx5YoGc"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3042a388168so431256eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692738; x=1782297538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=;
        b=KWx5YoGc7l/QbG9I5wE6bPpa0BuIvuOebNsVRjVDDZttdi5s880Yuyq6EsJmCYOrX0
         NNLpacKALnboi0Rx0xqyz9hiZWbDMoFt5EffhcicMPPdlrB2v4pdEcuS9u3ER4lZtTuV
         ORb6/jGBwhlAbz2y97af3a8E7JkS/zLjURNlAWKh2q9kT+JqiU5WPZDibSf60Ncm9s3M
         20tMXHkOY8ewR7aD/ZYYdZDJ++StzTSwoW/FdAr7NvHmdUzArFXh8rNvPz6kDYbHnQgr
         sG8gGGHQN2LUaHJ/Q/lNDNhhLC9iekyMcVe9hdm/hYXlkskkxB8N2vy4XEjj4l6rNRx7
         sB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692738; x=1782297538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=;
        b=aPEB0M/Bs522JnsbayMsjmvNMS6u5sM0EnruKiddm3OkVtpJa8/k83Fym828P4CaFE
         MRqn4Ro/bfbH5/AiTTP98pRrbHaqinmPC2kMUrtOcNWHScxAiVbOoRBeepIO7VZ2gYjQ
         /DOXRgrSJbq9BqVobx2R4v4UghFwcqHm++uvhvJwMwc0g++oY9zmGa4sJnHiJrq29/j7
         y5tfkITNlymfIIxCZGNGGexZ0usQxXLiUSnIeyD+E1VKVSaWSK9Xt/T8IRnQtVAsArUK
         yT3ONTItz4QhfUnrdkkRDrIF8GOcUu1XahTCiXEpFSZqgYmMkLptFZSZBTMNCzCElk/Y
         qF2w==
X-Forwarded-Encrypted: i=1; AFNElJ+D+7sXjPiX4xWJgX6ECK5VS87DayL73wWNaSMGkH7rsWRuJZ0uyTdCIyyUhhXy36cVUtRIQ3aLRrvJiokPcfs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmewcKtA6twbfU0gOFzCW3vMXMfI3lbnnhF7qyrQOemzfOJm/n
	n7eflocEoNorTYntCdEKteXBnlImCopT0R2/zpbXZJdkqIqTTJW8VZ1w
X-Gm-Gg: AfdE7cnBRD5Vkd6slbcQrF5uszrjOMl2CHTN/PcUDJTAqjNGKaO4zhV9ngGhI/Jzlbc
	eEy4dlX6kPFSyRWIaCDbMu7JkCblUm4dXMXKp8a4ub23T77Y4PuYgcWoh1RHOCML7DkRWHME29K
	ppMfZu8tgd06Ilkuqh2/Ze9HFWKu6SJi1oSmmv7rbo/aCTPKBLzwdKmRpK9Y1txR3iKKzo0byv8
	PfS2LSyPNfSl1B790+y3yYwYBIMBdl7cXeyYJl68M+Mxe02XCYEi7VJk+CkYr5nURHGXi6VZA4M
	sFmMxyqBsdQkjT1kjhDU5/4Wm6/Qq+9SyD1DuONGn309ipdAOu7z1qd3xwGJDQr2yEY5yfKqESA
	F2D66SLAtX9fLRNdvaTaxFB0/vNkgEJavUgYJnMet1dt9VclxFq/YRA2J93lYv9TZd//fk5MluJ
	Dzl8GQcqUIHGnhrt3649dH5DqrGiOhCa+FvuJBNY6BuDzlK3g5G+OlgzLX6w==
X-Received: by 2002:a05:7300:6420:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30bcf5ff5abmr1293252eec.9.1781692737916;
        Wed, 17 Jun 2026 03:38:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:57 -0700 (PDT)
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
Subject: [PATCH 38/78] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:55 +0700
Message-ID: <20260617103235.449609-39-phucduc.bui@gmail.com>
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
 sound/soc/codecs/pcm512x.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f1..f4206f49f5b6 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -399,10 +399,9 @@ static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 	ucontrol->value.integer.value[0] = !(pcm512x->mute & 0x4);
 	ucontrol->value.integer.value[1] = !(pcm512x->mute & 0x2);
-	mutex_unlock(&pcm512x->mutex);
 
 	return 0;
 }
@@ -414,7 +413,7 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int ret, changed = 0;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if ((pcm512x->mute & 0x4) == (ucontrol->value.integer.value[0] << 2)) {
 		pcm512x->mute ^= 0x4;
@@ -430,13 +429,10 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
 			return ret;
 		}
 	}
 
-	mutex_unlock(&pcm512x->mutex);
-
 	return changed;
 }
 
@@ -1465,7 +1461,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 	unsigned int mute_det;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
 		pcm512x->mute |= 0x1;
@@ -1475,7 +1471,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to set digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1488,7 +1484,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1499,9 +1495,6 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 					 200, 10000);
 	}
 
-unlock:
-	mutex_unlock(&pcm512x->mutex);
-
 	return ret;
 }
 
-- 
2.43.0

