Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834A24534B7
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692563; cv=none; b=U6/JVZ/uyMPW1l0V++M11fTGA4e8LBXCJSDgR3MjudQ1uLDam6fyNO+4xFx74zswW6TtZGVoIZGU0iJMNSABiINOo/qR9GmYZriROY4aqUx/rByxIv4pRwfQsrhiLA//wAyY+lYoBANA5RLJFoIoyUMJ9XdUdmCb/gCnJa6lY/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692563; c=relaxed/simple;
	bh=9hWHT0ST4On0+z7FkEqiiZ7FKNgKKOtsAQNxNQQLtbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZX2iU7YRU3YgnFbgJn+oumUU/QYg2dVZyEMnc7xu6pBotmu530auI14/DGukhoN8G0IkK3wvtl/gh3Xfv+nFDhqeZbO4BJrXnmFufEn0eWvlzDNGiY3Vl+VofNkBLboIzWF7cEXqAvEL0+bDN+/DOJ44+hMjjjpX6qOZEk1zcpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJKnNLlq; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJKnNLlq"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304f590dd91so6359484eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692556; x=1782297356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBnOqWbH40FVhs8UqspMubOH0CXFQx0yaen9o+O7YM0=;
        b=JJKnNLlqHUigc/vR0YLskhCDXCEEHemTBeyhW6SLX5MafI0WyPhuAcojFvP7bOEIZC
         g26BfIF6Ab6jBesw7wv41eHpa3+fC3p3/KKsuzyvafGB9Uzs40SqhLrmCuUYMBnxIeox
         H3Ud5BifPUhuKyrwCGrZ9cKLxk849ekhKSyp5Xa7rR1MS63ZseP2Kn68Oa8FTf08oQ3f
         ZzEpLBjo0tSf9+q4uQk59AqZFY5gg8CB9flKkfhv2et6Yt6e1pyWY/y0RLB3T1xmtpd7
         FvkUZMSPOqXBQZl5JTEhMry7Ih8YBswz/eDRzMhquAIzl55rad/QAR9vsSf331/jkelr
         u5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692556; x=1782297356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FBnOqWbH40FVhs8UqspMubOH0CXFQx0yaen9o+O7YM0=;
        b=FxUX6p8tqKL4hOU9AP71G7PY+zKaSQ5WAQSp/JNZbfWmH2rdFnclMRdFhk4DRzJ+kg
         GGiqMs8R/XwQXf8/UHCE7sI8EDaENO8ePGKE80h9hv8b/YHpSamatjtDFRr1xVr/Y8il
         OsucWka0AeUTc7OQQ5z+nPuS5LfiIfM8+CyISxU25scNGO8esTY+du/ITW5x/9YfYDZF
         n0WKquSQTVNJWh4KMg7NLlalJXoLwErgOCCuxQsO9d7TcBP3uEPkDI9M0rloGmBVXb2w
         ytH0anJbvN2hzx9AzCjmDyTI+1TJluDEWUTmD13b2lfJ/ldoelbfwm2tkTYUoieQjotF
         33Ew==
X-Forwarded-Encrypted: i=1; AFNElJ8krqkySq9s1sk3NM3Le7zTW0Mi2dweYcphFkPSBhMTgOFp1lEl+nucLfjnHDf1S55+MiNRQTudaqPu1DbR08c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/D6siKMT/UvOqpuXXx11GbxaXqwhxbeQTqOioaJoKah7u2epq
	2CFKVQ/H+Hzv7WBBB5p8qMhVbuOKAzSi1qP/RTQBVb8CPiNIOfzR8Zhf
X-Gm-Gg: AfdE7clvq1aP3uQiCN9iVx0mPvXshubOvTdWQ97S7n/NoOlQeOTx3ASuwd0nRtuj5Ai
	vFChpxjT/huiaEKmXBKGt2Wpz5gkPYKJSDxi/9ny+iPsnNoXWa82OzTsXqsaJ7bEJfjRUlCmmdl
	V4bt5mZ55MQv3VzP0k2APj9kUf+OcD3UP2NUIwAnEZjKB8orcZOMVitUD+uCY/8sIU9tOKmubft
	h53dDcDvF7YZLNo3rgM0oQIecYh7Okm/6FN3/FSG2nTkIpDuvmZEC9vttwLZn8QGSC0WNJcWGIQ
	vOAuT0aJVVBYa4JhHbtXlBchw+DBrVsvhgMpH30Xn6Um0ShdsUTLgsPFLbQduTlvIFR+euerAnf
	HjgqcJ2iTgiXTdbZ7glXSCnPAS5aVEWRkkRRA8N3SNpcszSYXEK4cWRk61Rg1Nv/wPCKVtX+gbs
	inuRC4po0jokW9uS1i+484oi+2tuORwFu4+LQjMxJNMMUP6RM=
X-Received: by 2002:a05:7300:80c2:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-30bc9ab54ecmr1861524eec.11.1781692556439;
        Wed, 17 Jun 2026 03:35:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:56 -0700 (PDT)
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
Subject: [PATCH 19/78] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:36 +0700
Message-ID: <20260617103235.449609-20-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l35.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a8fe5a99a8bb..c22de7356ce7 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1566,9 +1566,8 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1600,9 +1599,8 @@ static void cs47l35_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l35->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L35_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l35->core.adsp[i], component);
-- 
2.43.0

