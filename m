Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37570429802
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692557; cv=none; b=GEcXuzx9QDkPvSy6u+R82JbM3mIDHOffIcfmcdYIOYT07Ew5OkWH6F4C91eWHY5I/bgBLqqSzbQRffpjbPvVQzhoispwNp9exM7iAHsdCsyzb7QVaZ+SE9yUdmXxSmky5j++SCdRaUnM6ZfaqPAJWdLkMmZbqj3W2u9ddZqI7W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692557; c=relaxed/simple;
	bh=HwBnP5jMPzDPf7Fr6DP+mqDNQGTymWfg0eGYV92iBBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l74sX7N2fQLUJfMDHrehjxQP7Zv6QDj4wz6aYcrfKXbY0pfmxdiwvnfsUh2DF1QTj9KqrcP7dob52H4oHzaX6YEapLgEjORyk3FTOvACPmWvsWqATib6uhGqB2oOcxVopOlRsqOpWqe4fxZCLZ99onj4aOOqULJUbYr+IwARfIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnONDQ9y; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnONDQ9y"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304d8362a58so601494eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692547; x=1782297347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3pG1tEFOJl9HudGSqGDOqn89cYK/BAFq0QnLsL5JtM=;
        b=NnONDQ9yKOG61dmDCMsOwpGrkbK5kioVegYJ9zmbMJ7O3MJFmbXhIuYZFZiey+wSjr
         5PBxlmZzKvJRYsqtXJJAG/jrbaoL9W67OjhxIN+XudCO7M82g4zLeZLULWNkj3EXOO8L
         rhVJDBPYTZ9VE6Nnw6gOnmsaUZARsW8jBitCGo+5jKETdlr9EoWBIgXe1y2b/lNEKNX2
         coJA4gx4Gef9Bmq+eiq8CdDtyrnUrY5OGeAqRNtCJaRoKV6vj+kk3zBv/7EqgrHIF/6p
         bD/dDgtT2bgEhAmPh8/HKRadZQvclkjgNGLqTR1N4YaNskrk90KiMm41xD/XvpsPHyPM
         uETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692547; x=1782297347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3pG1tEFOJl9HudGSqGDOqn89cYK/BAFq0QnLsL5JtM=;
        b=AlQRZXP+gxZN8mmJt4SmId4VzNF27BNSjOeWEVIEBY1WxRDIRfuwIBGwiVwn2QAYp1
         st7K1WQMgbEUSZWxIip/fjo1T0dL9xXjbg3fxngaU1IBA0Z1DTVayq+v1V3Dpm/SUpIp
         OHrTWVeOLSDOTM3VAjeVbAVqpx6O0qaBgV9Bozi3OaO5euaNKHGaQyLoWK/QmtP2KIh9
         3ffign7T3bQ32VxNmbzxgFOdz4p2uYUS07jYWZOuBOXFgI/Z3Z7tVuEWzjT4UbVzw5Qx
         HDq3df67qPvAcgsN84Muip1u4YX4ml41sDSoGxi7lbhw4rAc5fTjVChb6qdG2ZwKP8tV
         KInA==
X-Forwarded-Encrypted: i=1; AFNElJ/BPvNLYKbwAeyYc6QlV0MB6tnRA5V5YBmEiCON3qdYV70YcQe32ZZuI1JaDOuUrkHsGkdWtnMVJo7iI5aHc64=@lists.linux.dev
X-Gm-Message-State: AOJu0YygCR1vRZqv76XvaN2OXfE8z19EnS212dnEPQR3ABH/o2QnAqaj
	tt6Nv06weTsndVeaGpmUWsFUFDb/7jDR8grrwYphtatEoBREORHkXKEW
X-Gm-Gg: AfdE7clo4qBs+z65PXVC16SsbaweECeBFsutVoZg+a750cDyZ+Pl4o0XYxg4rhfqOjJ
	3A1o0zodLKch4feGoNxhSLd9AYjqpBi77ijlxCeM19nRW/CznrQFzJce9AB+T1/sCDkke2+naDo
	+SW8atIln09rKQ3anugHEG8xCtJWs+IZp3SdvhIF/8a/qlua75DXe2+QaVgQq0BxWruK/p86N++
	92mi3CDde+qgGVinQr6VEYOKar6jH/oeA8MxtPYUT8hLjnuoNZa4ra5hgMwNfn4qb+vtx7YpfkV
	06sE7nz4UYnsIhGsf6SjIANwTXLsKlO+qFVPFHDHbIYlnoiKnVhNdOPabou0wlPX3lBl+M5ZRff
	zToWmbt+n6KS9Egnc4ajrtCXw8iu/0hU9YrgPgY3o879dnt+ga4toO7fRLDWWGBeHuSX9m5VKg4
	LPdvnWVvPBay9n/sb3rCGaAwAXsbd0HfjuAwheJx2+wC5ByGs=
X-Received: by 2002:a05:7301:6402:b0:30b:d209:dc18 with SMTP id 5a478bee46e88-30bd209ff68mr689839eec.10.1781692547532;
        Wed, 17 Jun 2026 03:35:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:47 -0700 (PDT)
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
Subject: [PATCH 18/78] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:35 +0700
Message-ID: <20260617103235.449609-19-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l15.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..7a69f79fe496 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1285,9 +1285,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1316,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

