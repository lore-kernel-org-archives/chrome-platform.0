Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323603D8132
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692605; cv=none; b=RoUpy5x4FYky7b8sj6Aa7uedgn9qocSMLwUqudjADxjqwj6cUXplPrI/z6h0ICAHxoF8GpLRHPy2RQxs8hVCIzEgZmKqlWH6WOY4aEz9X1jxAxzCkEOwgSLIZGTiUSrRokgdPOXYJ9dUYPlQNStBn+YUzdXh5iYxHu4YXgTxKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692605; c=relaxed/simple;
	bh=aVdb6b0m2JyHDBBXnuACsuL9yrvdbLrDAn8rXRP7U1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDuowEgdt8WCkbewPUKic18vOX8huzPZF8myvkjbDdwrxTvSTQTw8cs7Gb9TfCzsAH72OFUD8VLV2Qp7eVZh0K7kS7zy+rijVr4zbwxmft0+VQeJyRHkTIb74NkjmwlvmXycPlLArr7XZEoWtTp8keGsNwwy9HCPKA4mE4cjkeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6ea2Cwu; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6ea2Cwu"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304f590dd91so6360198eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692601; x=1782297401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNurP/9D2C90fingnCx+/RnV4Jx+m6H05P+75zIDvK8=;
        b=F6ea2CwuKedD8ntyR2waDZ6dAnVKBTj2CnFNjV32/9kqtxkONkJQmYChNCuKVzNG8X
         z690WuVcSGRod4tqkCat89vgzppOvcDJyqoF7EKeHIvKOy0i1Ap6IdJYOG+9EmabDrvO
         FN9ARGAXLcwfdIsm+WNUhpl2boJBbFPxxl0S29BjM+fRIdj7ksU66FBSXJ6tvzB4WrYR
         iitaCektr5Jm9/2CTijcg7YQ6306ettb3aTl+CpWCPLJHNqpyk1AOqEO1ky4lW6zF1fr
         /Y4WwFfaomMVSLWEe80ZEtFDzxySTR8wxOoXaFu1OoDIHrzUVBBGYGzBlMZy0Gt1sTYE
         iJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692601; x=1782297401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNurP/9D2C90fingnCx+/RnV4Jx+m6H05P+75zIDvK8=;
        b=Joue7VQFQiXCXxeX0PXgqeR3HFGrcZJg9NNE16dRfsVYWYi1aQJCFQqyJMMALkVbAs
         oseut9VxT4OmEyPSrcZW3JgLvnqsN4EJ/050M7M3hhL0N4Ta35U1nnxVZQYjiCRV5vZC
         QiwteajkEz/r0v+LOs7QlWSk8AY8k6t8QdJDjzKxkp872PE+oz/nfnEjpVvtQnjZFrlL
         7HpOtDhf9xzvzJwo2l9Fdny53ifSbA7ZL2zMsQN/0vWwVicZ304DsJzuNYAkO0eunGR6
         aKYfyW0+z3g9G55I06p6J1EEvjzUf7HxOTUrl00Gxasg2ODSNfi61y37mW0dfAe8au5Q
         FL9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+y0pm9kQYBuYBZ9PdscCnooYf5CzfXOpG3HyRz9dg38LJFUMx4dpCSU1cpxxMcVrohM0miDaEk573YAAz+cWo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFf4qHzYVK+p3ql2O6DSCVozbx+MVoWGvOzV/JjCUBsUozgqb1
	PpCIN/LP0Hz/HwhF7Swoec+kDsLjBrn11p9vvsyUvxdoyzoyUfxxNeqf
X-Gm-Gg: AfdE7cndWZnd4EmskA+p8aSRPfCzYb8/DqOcZelqjNjqKmOn7de+Pfm8djhtnzrCO2u
	/6oeFg1ee24Y/bMijiAwwlTv4CezHlFWQya/dbmsbn3KNgJ0f24ibX8ufjdwql0bExuXMtILeqY
	10xGYTuUHvyifCCGURt3Oxxd/t/njFMUg5cUdqbKJknSQ2EqrsUz0273HRGKEkqBZlu0VRGZkCc
	t5SrUl0PrFDpbsk6acsPYDskvQ1Ct+Ll7+OArOmS4Bq2AsQ+g57LBQhdtRCQXnUjabvlj6ToM5N
	kBaQhhQ57JWNcAPYzNt1HngGidwhuJZgWL0kIvWe6xKtmLKXDao5xp2YoDu1p60QdPu7kj3+RWf
	SERTohAmOr68oHnrY5ZUn4qOqWbRZJqutEiVNa0zj9V8aCHWH4Q7rSfg7imZamwb4DjFhVV1YhW
	4pOfafO1yQtZbWApxBWa7EWoJ7YGayA6/n2G1e1gd3vShNzLw=
X-Received: by 2002:a05:7300:72d5:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-30bc992dbe8mr1692072eec.3.1781692601209;
        Wed, 17 Jun 2026 03:36:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:40 -0700 (PDT)
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
Subject: [PATCH 24/78] ASoC: codecs: cs2072x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:41 +0700
Message-ID: <20260617103235.449609-25-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cx2072x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804..93fbd21dc51c 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1408,7 +1408,7 @@ static int cx2072x_jack_status_check(void *data)
 	unsigned int type = 0;
 	int state = 0;
 
-	mutex_lock(&cx2072x->lock);
+	guard(mutex)(&cx2072x->lock);
 
 	regmap_read(cx2072x->regmap, CX2072X_PORTA_PIN_SENSE, &jack);
 	jack = jack >> 24;
@@ -1434,8 +1434,6 @@ static int cx2072x_jack_status_check(void *data)
 	/* clear interrupt */
 	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
 
-	mutex_unlock(&cx2072x->lock);
-
 	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
 		type, state);
 	return state;
-- 
2.43.0

