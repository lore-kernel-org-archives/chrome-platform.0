Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E0A44BCB5
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692533; cv=none; b=LkDI9anBxIMIIJsYQCdkGxk+37Ljm8PdVeHtSQapeSjaSF0A6BHmSJ9XTJ0baU8D6Cgovq+M+MNuohfhb3av8rDcym19fVOZKphgc6/ntHlxdmRTg02x+qU68+ocg5a5gRs/mqHlESTM6o7/xJ2rIM5XllxrCp0+BuHtFLn572o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692533; c=relaxed/simple;
	bh=ywyecjY5IPnCpFu8t60JAxjAocTPdOv2KzNz4XTlQY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwT7y98Fcx8/7++drPwcqBP0QmI3fM8ZFjz9t4ySM0BRtjL+kQOu9JY2sfvR2dNRpyFblmJK1U3NgEuoMJ/lfpg0QKM/jJT7Ekm6HTdQ8q+68QfHJe/Ip+e1vH8ZIUUESKSSo8XbLKofslecrD/gHu5TWF+/akPn3nRmpOzN3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yys2Owoa; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yys2Owoa"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bc806fcf8so1067195eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692529; x=1782297329; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=Yys2Owoa8DAKKtqGgMHYXTkUlU7YsEDq2G/ryIxzoyE22hP6Pw7zcnx34Il/xwDMFU
         LF0MVGPP8G6K5kzab968Pvkl7FBOkAnIkCB6nI49nwwo7n8dQu4f70AlFZYcI6gliTnt
         h5Vfg646ep7xwpTM1Opz5j0Gm/MniR6QTiOsebGpsgacZGio5W07TrZECU70wGMxUUwi
         hLFvs+73qRjiIxlMn/xxVgsg5J8isq02JIzecZAAQMCbhSrI2/wwFicRr2yhdDL8PSWy
         30HXe2AnhLkU/zucSGPNoi1TtwZaoSxd9wF2yEBb8W6m8Sn4TNwL/CzhgwlauY287xcS
         hp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692529; x=1782297329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=AsNMuSx3YzLYS9upuPVoSIZU3Y5klj49EKJSTGFT5+iAUaWhAqxzOrCFoBQJv061xv
         tx+0SzMHl9s7kNMpsvssNXcxyum0EA2G7W0aaBNkQSEuj5VMAnEi5ESnp/bJQIjzk4XZ
         +SNUXHm6QNTohxekGWqUkM+4YTKwA6mdnW6cCK/6igDiQMnRIMY6CZ4xFjtLRe7+dp8L
         BYKx90No/0XuG3E3gpjxFsQg7zGM6mDzjTwPbfv0cr4KYcnPMdVXQnbgESbXIcSRUM34
         XdKKWyEifSonz1biwjBMc25+oFT3UrBOBY7sLXYMldsc5GTqkRl4zTkScknAEsmsb/d7
         OWpA==
X-Forwarded-Encrypted: i=1; AFNElJ+XPO8k/A9qJ9Ef5dgov3anHWAWw7hQ1H+3OKvf8cwCAcb6VHPz8/S82G//Q6scbAx3JnY29pSRIgvqZqQsRe4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyGND/miZSNIm/KtgeJwJbrqGoSfKjF0CDVyLq+ErK7jlJyEIV
	Tp3E3WlP/q2R5fMKxEGIxA+CPWaGUaDLQuOiD+fXxFc7AifDBg9RWzFU
X-Gm-Gg: AfdE7cn5QA1rYDbZTh+9fsP6y58YTPyzyRQSPB9hk0IAxvbs536XDYbXvTqcj/vA6Y7
	UXE6rUAncZMNDsvEmeCP7HlMFr/3MAr0OcieZCck+T6gZSqEe9mfuHJ4+BimhR7rx5L3pN5wv6c
	XmySXUWk6eshBf7oRox/XKhS+2/tEzI2lRer0Kv1tVqdddYu7/ailt73KIMYZFOht6TDnJID/Rg
	IlrAdvWi/zuVNUwkG65JehBSC5mdpjD2kvLYIkcmZozA+1JV/h31EqEVAZ2m1MwksczxFGZpinr
	RJnPH6IIKEaLXEw6ARn/GGY93vXLoOCbFaqYhNFYjjUX1HKyHf64dmh8zSrVhXv4hTfgvx5BEDL
	CZrcZiv9GlXZ/Z+BkeFwBizbGGeMQaazG2MaNgn1pCnWdmaOyv/IfgtEEa0eTigEDCt8mwgpV65
	5Pe9Szh9rp5xzvzwM+FFTsxpcN78brfVHnkeG/Zn3MTFmGOTo=
X-Received: by 2002:a05:7300:6dac:b0:307:91f5:92e2 with SMTP id 5a478bee46e88-30bca90bafbmr1658562eec.4.1781692528915;
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
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
Subject: [PATCH 16/78] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:33 +0700
Message-ID: <20260617103235.449609-17-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs42l84.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..a212f6891b40 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -281,10 +281,9 @@ static int cs42l84_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l84_private *cs42l84 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	cs42l84->jack = jk;
 	snd_soc_jack_report(jk, cs42l84->hs_type, SND_JACK_HEADSET);
-	mutex_unlock(&cs42l84->irq_lock);
 
 	return 0;
 }
@@ -831,7 +830,7 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 	u8 current_ring_state;
 	int i;
 
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l84->regmap, irq_params_table[i].status_addr,
@@ -902,8 +901,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				break;
 			}
 
-			mutex_unlock(&cs42l84->irq_lock);
-
 			return IRQ_HANDLED;
 		}
 
@@ -919,8 +916,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l84->irq_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0

