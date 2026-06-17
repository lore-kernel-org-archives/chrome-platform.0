Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B5944BC93
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692720; cv=none; b=fV3Rqoga3De/FIYmlTi7nm+tFrxQ28XiPTrbDfNah0Xiv0/egGAzkTHX3lz6qfLtyZ0bux/zwSBg15Y7pK2V0BymBCM076KVIcs3ZvZ8Ieg3NZQjQVZmHOHe6nSJZ0XziZ0PNxfcsAnwF6Q+Espa+cmdMGs7ISERWjT2DQ5WC9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692720; c=relaxed/simple;
	bh=+Jhubp8Ad5FukANrMioxXXMIcipBw2wUqbSTsnqQwRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwkvIKGEoFnU+94hGxFa4A+P9KA2FzHJM6YYBKDSGgE6/F7ShkvgVMlvMyANW6cWIw6LSmt+MjnTDn/fiLgQR1EPvklEkCvx1/x9GYW2apJbJiEkDk1i3JS2Z3GiiAKUizMniFBecXTAl8ZaS2sVVO/d18zdS5E2iOQoJV/lX60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOKAq7PE; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOKAq7PE"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3042a388168so431121eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692719; x=1782297519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJIy1+pwCeD5f5eJrcAwlX5FxN6nvvTgLzD/CiIu9zI=;
        b=SOKAq7PE6fJFlQ3ywuvCGHozIaRF5YS7Y7eQ+oJdOF0x3YnMP7dgfHttyChnnY4MbB
         PWsvhC2+4FV0oMS27i8xgrBf8V+wtSleekgJL96xWg1Zv3q507IN82niJIkWhx6HdDW+
         pzKOQDbFhST5N3WW3W25dYOlW2GnuPWjEomYkN/jBeX6vhmNeJHddRWMP2FIPlsidHDG
         /xFdrgkxUc08kqaTOqmz4vlPtqxjjlTmZGcu30Tdg7bg4jJDxQS2ydZN/rwBeWXTe8LG
         TnsRNA3u66FCWjg/9NfIEuqM5v/Z0Jqgr3ark2ysH/PXQivbKZfxyqNhl9bS3fBhYaVb
         yyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692719; x=1782297519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJIy1+pwCeD5f5eJrcAwlX5FxN6nvvTgLzD/CiIu9zI=;
        b=d54NTY/h8XbINhak16CGM52EjkUI8FlI2B7M5sBHiRojrrbKTwhTZ5gOH4xuncKvng
         ReKe9XojJh9hHyK/u1UiXb5io1/Cr1yAc9BAy1o/tfQ894mgYxDYKywtc/YA+NHtMPjA
         tn1BjqPz61j2xINegLQr8jmMTO9oaiABaunNVKhfT+kFURM4kS0mIgd/a/CRJR+Ns3M1
         1U8tkyV186pPOqYg7RUrlu6yX3lcUiuxa0aR4UFX5lZ0MrJqdflqv57/WSnnQ7Pfp7nn
         02Os3Doab/tznBn1urRIsfEhX4E33RReIqnzoT4vBOlFre2gHfsw1oJ8ZJ5KAlcGrEhY
         mbJA==
X-Forwarded-Encrypted: i=1; AFNElJ8CWCcoMiPa8C99lepaNKM/mmgG4S3WypkotjCR4+R5dNhrNQcuHfOildAINKttxBnIv/a/Pw2iF/yge0wHNDA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaCnI1PWCG6G0bMJvmUgwLb3fqlFs9CH+QlFX2Q9qJpz0/etPW
	6XlS/Qpq1jUjsLpdXdIBaw3IdsDm/FimePS9oWnMc6SLNi78zIHebm6i
X-Gm-Gg: AfdE7ckq2bAqffWQfgdjWRZdpx8XJ1hdGp4YDZNFJbkg+sjqMpC3fqE13TYe3ZWrY64
	eYzp88MyZBsm/C5VBqHnWCIv1Zq82ZpI1XxdSTC/9PUxF80SOHzSFBehc1UxNcpD72yqUSD22YB
	TrWpcqx0aywZ5csDTBPqF5Pwn3lSqR48OscAVuSPqoCmQCbsPRlHSkQ8z6nn0mVMS7eLT9KNef3
	qzwvnGCNQfHgkWzQyKphkMC6Kxi/oU0wA6HTFVkws+H8H0dinNbAuymO8zbrpMO9UQ0ulVtz5aa
	9YVXCgLj/5u0e7fLg8gRyoVfvIjUpaaMry93PkC9DqLYXN+lHX+mMIZwzWTAufCGHrm1ZWHRtNE
	uzlHWyVTlvvIAFsKLYBgPurBqg+QdPxI0pos4n6/hR1CvYja+cb9Kk4Abb4fYJEdCyIjrCDwxCf
	oXm6ieT4FeW2Rb+j6U2weyF7U6c8Sy+XM0LAILttn671bbw6o=
X-Received: by 2002:a05:7301:1192:b0:30b:d86b:f250 with SMTP id 5a478bee46e88-30bd86c5dcfmr429093eec.0.1781692718566;
        Wed, 17 Jun 2026 03:38:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:38 -0700 (PDT)
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
Subject: [PATCH 36/78] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:53 +0700
Message-ID: <20260617103235.449609-37-phucduc.bui@gmail.com>
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
 sound/soc/codecs/max98095.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..7cdb76f3813b 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1532,15 +1532,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1685,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0

