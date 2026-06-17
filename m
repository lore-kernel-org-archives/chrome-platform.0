Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD4E466B5F
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692570; cv=none; b=cwYQvUj/jRmTHfZi9GWGzk8lnacHUNp/N7yodiU9BdHEjZonnhbaVDQ9bV/6vKHq9rQaoRZmIV73472QAlG4TiWiKIBAEta+rs4WMxs3xdk1/uWFs297VaqYi+b1r67CPOcbvtbolHkSzEKQbcJ3S3eVFuEBOII2ahrLXJ519aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692570; c=relaxed/simple;
	bh=1Ss+Jdqrla/9eoL2y7H5bMd8/rEKPHfX+5UCiREXhpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRTtNeAgbPNZInSGEB3LOSWbm8cpm7Vd2R2vCz+9VY5qdxVw5QuJeHrrgoQ8jpEZnaH4dHsfi5mIngi0Tpz2nZ8YFKhe4Cs/9wMfs99kNvHygBwo2yReksTtU6G2AqBW9KQfTGRqx0Qqh81f22BEiK30m+9tSr0AWa03FzUNlk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKuHO3RC; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKuHO3RC"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bcdf8232fso1790981eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692565; x=1782297365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=eKuHO3RCliNRJJa1Af8YosH8674FXdG6xkJmLMTEFeCM92hAJKU4KEXwnFyhnEj+5r
         cJG8NgGUpAmnBRRktUkBmKVtqUz+xpCaW8EizR36Au1+jgqwsXAL2gWeKTkPX9IEMBkN
         Rhc/2I3D9I4ardUXT+5L0A6cPetmNePpqWF8Un33gx+kDdbKICuOziBtiXufzI4QG2i8
         iIIPy9RYFtH0vlOLXtpBSQkkvp3txUdtKPHicDbettgTekfw6cQR0YGAR+Bhon7I+Bqh
         Q5gXDkTdxWClQyupFprS2j47NvfMZucCwvKkaq3fcZmWz/RXe9yz9iX8sIlHRDs029Db
         eLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692565; x=1782297365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=Prt9jufVlyW6/whGoRZiuLt3P4sYJsO1KBlWFHg6g7z8jpw0HVO8+Q5FsYs5S8KauU
         8uPGkfmDzVCqaUbEKiFuJqvW39PfPN3P9GsTtXHMVi9TpFanW6KqrGAPSqVg72fcQXPE
         fyk4B8zdtU/Iq36ph9My1Mxhrja5TOI8uW8mcAYa+GEH8eUXJqmFfS9bRZNbp/Z/XyQX
         kHFMrQ3lUv6TOhEUU7MQjEdMFfnAYSVKlhF/pkcXOg0LOtDjersSyMwRYdQXIflHZcqM
         fJfWnTCao02v177WF3A0wF14WkknBKtbaa57W0SvNW1cKqzsPQf4fLs/yLnRd7LA4QvK
         Q8CA==
X-Forwarded-Encrypted: i=1; AFNElJ/eVC2eclltjpXtGrTn3RFOcYCsnvKe68FU/D+MCeDEEet8d15iNFSYXOSq4dqdgpuPdBBuNe8CKk+gQqIRXmU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzao+UhbvpFiKn6/4zg6c0pN1H5sDQQMoBnv060B+C5DabTUcI+
	YhjE3fLlAkTkGqfKRvpAOPGE3gCUvNHPgvlrlIEP85pcuLny50kCC88J
X-Gm-Gg: AfdE7cncqU4BwHcCGAo0jnRslJNqRzURB6dbho9jiClFtFtjJP2jpPpUJmU8e8dAQ5v
	u5Px5E2GtxvclzIH7jAfsFUFxnV7I1J5mTDP4Xfu2ks1d7qKJ6vuk/n+8xQCSYTshBR3iuJgO1b
	ktiiH16xjJIhbAS5XsF1LyK5EhHi8NyXpfO6sArDy36ycB6/eXpfgMq5eSLSFgVT/k57+I1M+0g
	Q49o1TjHhPLYBThA4IvxT0z5jFNC5/qB381Ab4p0tZh6uCjLVcx5P1mt3ukPPmr9cfC1jnA6BlI
	7rIIkUF8tmyawdFCArz1eRuD9MvclXpsDTV3S2HasCfZiCqfV0KEIZVag9OlhTqQ1ZQogGZ6aFO
	H0x+ctJqWucjoQJ5q8W77AjPb5yh/r+AaJpAjSJzcowWO1HrsE7pHGPO399hBQPrTMsEtO+mVKZ
	3gxuzHVBWfWpaCCOMmy4rq6BWjZS0iS58ZPsrM45AJSirXD+sgOr2ahOgAtA==
X-Received: by 2002:a05:7300:2211:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30bc9ab88femr1691948eec.11.1781692565454;
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
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
Subject: [PATCH 20/78] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:37 +0700
Message-ID: <20260617103235.449609-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l85.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9c0eaf24bd54 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2504,9 +2504,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2536,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0

