Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84983F9A08
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692731; cv=none; b=VUeguvHLkVHGDWAAenolFyZK5JBCMlzZQPeSMZXmLrLKkrh/NbspwMLpqmU3t/Hek7NBqmv0T9o7RF8W08bvcOflZJpFFGG7curHCEM4+Czs170U6fYI5oIK3YS3ucZgmSeb9sPEjHbFfOJ5HVmp3i3ASg/Ft6lXbRv+YBnrGPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692731; c=relaxed/simple;
	bh=OOjMBd7CyBdHcAZuYiDu+E3s9djgXa4ysbiJU+FU92s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjSFou4PbFAUp4IHd9lODJWXSvesDTTwcly8pJ1HWSRO+H9cK0+6LJmKyTDFoAcKBusSIN4LDCMmBjOI0BnCUtVjK1Hd280Rbtc/8CBKnVdnjp/ZT0LxniJmZIehZF6afa8qissG9zA50y+9u/RIRGBpgzF6nuZJOTySms0LerU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USZ1WwUr; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USZ1WwUr"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304d8362a58so603177eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692729; x=1782297529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCUXvrbdh2cMObj7Yx72xMWUVLVGbJrlQPkt6NyxLyU=;
        b=USZ1WwUrx8f3nVZlnO45ahmZYpdygxi2JKQwKT1quTPu5ct8OdR9iaCkub/hWsuAvI
         oXQbfjr1Omo+dwIpYxTUHsDQcb+YoaoUZSLsIHzfJnZaHr9cYieA1ddPHgS8WKrPsRjm
         +HrqsnYtiEyp27J7gogigzOjfczENlOuash4h+0VWCeVmZB9JPG9RsRW7sWUZCu11Xy2
         iWg1En3vVJ+q6rNEpGt3UkxK+AKakn6hZdKcr4bzyEllVnnsH3j8C5203U8Pxpo6Y3ez
         1Q9XADHCRVCJE60Gx4iD49TSAxuMhZaesV2xDVIp/ecSvM3xKLkIHNpBujj5uUpp0J2T
         N/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692729; x=1782297529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oCUXvrbdh2cMObj7Yx72xMWUVLVGbJrlQPkt6NyxLyU=;
        b=dDBIYZ5oD/+kUYX/TkyQ3QhA26IrNbQQiL9cko+hQ5pONO5M7rDEZhdDAeJZHdDqdB
         wK+Q68X+TpcRf+NvLeH6H4e0dVCPIVk322jVNEYdCuasJBQt4PAusWy5lGDwsmwLvQDt
         7jzgF2DE1yUPYK7xkGRqVLhm7nCnXJf421cxRSpGD7mt1kCpeSgNfR/eqhJazo83+gIk
         5PlqRbfXregIBZBz/ZADUbqqb49nBOgfUVVumNDbkzVpGuHFnHDW8c3Zor20yBd7VD7P
         3gWPBlmhsHd/k5Tjs6sHfU7td6Z5M+3oyqj+IHJN4ZGW0jjN/nt1wI3LjkkLaMiPLM6l
         c0gQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EQzmuuqnwBdA0ZSB5LiecBhDu0XVibsBtncF0xGJTRoxHX9Qy386GPl8moj2hduadE1boQXFYWXjm2KIPs7c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcENh6FUv8CPSN9Da9Zn2tQdORsgKPuipSaXee3IMAd3uY9P/1
	Px6i2paBJNqS2+LftBJqWZK+ZQrcwP5QIR6SkEch9FkQj2EpJVjr2Sxn
X-Gm-Gg: AfdE7cnFDTlnXT0sdvpgQT3kBk/ssHYRQCJE5SZjWbw+99wPNYX1up9oEX1GrNZLrxx
	GyJ6dIF2FRLsJDTlVzlmkw4Phk05OezXg3Gxz7wdR/q7P4Nj2/22xT4/2AQ7q4AUUYUwwpBj441
	VxIIkd8Le22o3chTCGCgWPfxV5dCAVfJ3mP7oeoVhWo+DVLcelldnqRsCMoHD2n4L2JIOWjn6ct
	5HcC3l/wPuYdH1BtXQQ7PI6he3n6awSk7Z9b2Z4CLdw8EsEpbk+PIifhdyCxtIlbZwYV44dapQa
	xEE8vHqRdoz68tpAfhVxpBAbYcSa3SAUf0lizSEsn9M8WVjRozfZRdZ+lDAEsFWgl7at9SfU5FN
	udFz0Nq5vWYc8yCvbzUnTGtPbeofZBY65mmEqRvJc2J/Dss3+PTBjSrIEDLeotIOtasqXtpW22o
	PUsaERQSg1bdxQoL7BEQrVtq4d1mOxMusyUfEKwpJYWA3Kshg=
X-Received: by 2002:a05:7300:3aa8:b0:30b:df3b:fe94 with SMTP id 5a478bee46e88-30bdf3c0705mr265671eec.3.1781692728927;
        Wed, 17 Jun 2026 03:38:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:48 -0700 (PDT)
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
Subject: [PATCH 37/78] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:54 +0700
Message-ID: <20260617103235.449609-38-phucduc.bui@gmail.com>
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
 sound/soc/codecs/mt6359-accdet.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e..5feefd0cad75 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -398,14 +398,13 @@ static void mt6359_accdet_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, accdet_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	priv->pre_accdet_status = priv->accdet_status;
 	check_jack_btn_type(priv);
 
 	if (priv->jack_plugged &&
 	    priv->pre_accdet_status != priv->accdet_status)
 		mt6359_accdet_jack_report(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static void mt6359_accdet_jd_work(struct work_struct *work)
@@ -416,7 +415,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, jd_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	if (priv->jd_sts == M_PLUG_IN) {
 		priv->jack_plugged = true;
 
@@ -450,7 +449,6 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 
 	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
 		recover_eint_setting(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static irqreturn_t mt6359_accdet_irq(int irq, void *data)
@@ -459,7 +457,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 	unsigned int irq_val = 0, val = 0, value = 0;
 	int ret;
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
 
 	if (irq_val & ACCDET_IRQ_MASK_SFT) {
@@ -474,7 +472,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 					       1000);
 		if (ret) {
 			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
-			mutex_unlock(&priv->res_lock);
 			return IRQ_NONE;
 		}
 		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -498,7 +495,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -521,7 +517,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -540,7 +535,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 		queue_work(priv->jd_workqueue, &priv->jd_work);
 	}
-	mutex_unlock(&priv->res_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

