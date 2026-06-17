Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91D45107D
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692588; cv=none; b=T2tS3kLyrGGj3+ffg2kfHhNTGj8fQ7JqiGJYC5gi+6QVsY/3gYobqRg6pUjxl5BBNgx2kn0n/xu8IdsUrN28IzaxEuco+c+72J0JjO6U/xukfSAl6vKk42C18w7ZLoUaOvcovvs69fKdlvHF1BYS0ydj3hojyLwZPAIvIt2EyQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692588; c=relaxed/simple;
	bh=PK1w8ixg4eqPxCHAGSl2zZcTbcNUnnrCgmRQCcVJPCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fq414L+l49izkyj9jkfMx4vG/HDH/iYGYUeI7qHPhDswXujgyTIZ644DnB9/kV6jT0uxb73pbbQb3v1kC86zyzW5Vpn3+j85c/QyOlVG+BIFmTMD1/avIVW14T7NRmJs0BGqjnzgum1GD2TO3RYjH4zUTUTGtPObl+Tkz7UIBgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=si8qqW+2; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="si8qqW+2"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30bd59b6eb9so788437eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692583; x=1782297383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=si8qqW+2buLx7/bZuV1u2FBQkF7fp/rLBGl/sKU9DEQfL6Gs5ZJuNHQJWeJ3om6SjG
         sD+rhCUDhtcBRQWrF6flzCVZeP7vSbJzvZ1grjjJVqGS0wv8w23VZKQA9UuHVcVrZJOC
         LY3FXFlPAc4daDOo3gkJgDw4jII0pGFYs23A/W9ljIt/JcaXb0bh3lNUNM6/9DuULP7m
         IlwSDKa2qXS0J31ZiQPwulOBiZFC1t/zh4uDl/Evw98wahAbv+vZ71vJznnJRP3IWi0B
         Y3w5ewDmgJsAks6uHf4anJNWdj1oQCuZUlMB4T4BOahZvSlRWZc7L4yIqlYSYYcuefW2
         WLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692583; x=1782297383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=BECvJyUstVwIvQ5Ev6qqLsHF4x/LKXT1nOxDgSMxykmEYEuEp41yjYARknGDeVhlmY
         1QJ6MZXXv/pgUIAuv+2cMdkIx/lp5LAx6G8e7M/XpU+5GnVlKSWxUmcGjfhLnungWprK
         DD4eMW6QP15/8czF5be8Rbo5RP94WluwrylxB6bZh9+WPLNxy/4Dk5V5hjZ7h+zcINT5
         wMV2dXQEmzl2iufVx9qBf1J2C/mQigzEpIy8MK29+TcuvFddwVW7uscWG9K4Orag+YSb
         VGvdIdcw21yJytno+g4SsfpnVKcuUIvJAbwjcLgY7pP9S8MkdiwbRWVPI+347WHMmcEg
         fqQg==
X-Forwarded-Encrypted: i=1; AFNElJ+IvvHua/dWkkA3twRKo8E8KpUxZxzII9/dVPaM87a3yR5s665nlAOXFyPVXYZZ6qpAO6mqGf5Jrd0lb3neGgI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5pI1EQUHXSaORVH/+wjxOLHaEXNYutx9kr3AA3Dc4x5P6WpUB
	a50hjhDPMmpWF6rCVCyOCHnQTaLWSsHrUy32gQuqinoSQpIUeg7VkgmS
X-Gm-Gg: AfdE7ckKLD08ZMAAtZ3CF1joBX0h0zEEx3vIqsfq814H1/Kev5d25JnD378thFXYzYU
	Bdn8Z3pHXp2uHBVUw7UpNNzOIluqBP52wxorzUPY2eEl51jXT+8zCcpr76ioBEiga4f9CfY1u8C
	8qJGVjNToWgwEy97aP2RSoP/IyZVVl4QjCNAiSWcmAbahaid6ByJm5CTnctafyhGusfIlv5jLdE
	ZEf/zDR6j9LcK2R5Sq+i3qU11wOITKM27AyY070AwdRhtCPvYywvac6W5oaUdCjMjDBXYol5TvE
	cI4ubnDQF0ebl1OG/EnXN/ugUjF+vPabOX4VyUi+8WNhFxCt62mre6DrpAWGLJuTD0OgzGirBwj
	P2ZUR7KjuNR0Sd1l66dyPesqnNolFYdUuAnpnIEWfetPUN0bNCEzk2LSdwRTqGZ4kQrwBdlw6jB
	72NVevhFPDdC4W7EAP6d1QS1tZ3FOXUUPO2IbbtE9mOuOj8Z4=
X-Received: by 2002:a05:7300:430e:b0:304:188d:d0b0 with SMTP id 5a478bee46e88-30bca0b8c3bmr1984423eec.20.1781692583469;
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
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
Subject: [PATCH 22/78] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:39 +0700
Message-ID: <20260617103235.449609-23-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l92.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..4abc896caab3 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1892,9 +1892,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1921,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0

