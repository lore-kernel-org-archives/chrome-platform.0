Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A4945BD4E
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515133; cv=none; b=XJUirs6rVBT5jtc8o0T0KOESgxYzBV/tQ8+Fw4SJXblLYangl8YrdDXbkcZtBqLQh7FapatwJ2D08vpiL4HDnp4yYkY+wAEu8f7JESTuw5Tb4N9eF9B/JFVHeBy/srMtjyRUC3k2Z632ejI0dpeEKyVVt+dmwmus6qRNiXnV894=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515133; c=relaxed/simple;
	bh=qUr+fNpdz4ea/WIvD3lcshXcnaFtxMEAdTJe2mi98JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQNA1pSBqqGAMCPZTZR8gaXqrew5s37zHyUI84GiVLGxPPan/vlC+WJxsOe5ovuTOCqx+eC+MXOm1AIBODZcoxLrMHw+xtpZliKKsHFE6+wMagoLcUNZz8ciza+8JwnsaIIyyMQa0oxm4Q+auQtLW4DU9MAaPVJYy7iI1gXnzXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqT/cI8o; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqT/cI8o"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so654835a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515131; x=1784119931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51CRpJHLoRQMeub3TqfUaFFVSs7Z8ueXHsjY5PJ2KlI=;
        b=HqT/cI8oElDd7nDU+vXdPZwKZumLQcfJ9XIw4FXzFzby6a042xb66LbplocNcmhuNg
         9tL+S1UbK46Mg/dVuZIDW/FXhr5gNxFK3NFeztz6CLpb5V/Xoy/HpPoTMET4NIoxRMfT
         D2l2Xj9hksDRfbo2xwwgmHpvTXqij3nvy5p9EdcDw/mWvQ71HAWTmH0QJ0TYhlQ7OSy8
         TeqaIUcYEgdvLHEh3v/zEcb+eC2zUCghWxHHRHzlD1ZATo02PAehbMOgZWhRluobFW2z
         TPltGle95cgua2mkg2xa7AcVckZQqzm4xyxqwVGrGlofFxlcIg4d0oQMCxFQ6cmPQKjD
         iXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515131; x=1784119931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=51CRpJHLoRQMeub3TqfUaFFVSs7Z8ueXHsjY5PJ2KlI=;
        b=OOxbH8aKksWD+SYgROkufAIzkpgci8W9mvjxc5wGzPXVyGUMYz9eT5WS8MvBblbIrY
         dd+6MBLNrK9geLcmsR6lDm7ISI73U6lYp7aPLdtQ/3wy6NcOuBAl5r98RyQba5jmeR4U
         MN3q6GcrlGabqCJxk3t5aGvHfhn8GvyhGHwlOCMOS8A/ZwvFVS14qWzRH2f9BaHK1vwu
         ehcB48nwTVtE2sDJgXvaH1m/Loekro3Rg3azLByuei0VbHmVJ8AEu9je5MgfnoCL0e7k
         m23V3ETNHtSSYGNCmmLdFX0Atb/dxUNHfNLT/LnwloyPOdBwjMcK2/j+kCiOkWKLrmWU
         NrwA==
X-Forwarded-Encrypted: i=1; AHgh+RqTdOjxUPbbYJoo1P01cL0oatsJtlapA6+WCJzrlyT+/cM5d6MYxillfRMKBY7+WGbfwN2ABk4c1Pc4BdXs8os=@lists.linux.dev
X-Gm-Message-State: AOJu0YzH3xoT9m0FBAsu7aGhzeuWfDD83lTEb6C97Z5oELgPvS8vjYiW
	U+vCQS/3yNwLrpXRMK8m+1KCKY0BmCYwcdPx1/IlEu/JM/tjYWt4rCxW
X-Gm-Gg: AfdE7cl4JogxCKrKJ+QQmerV0IVny9TWi2yqmF+bpMon+iqutZEm8btIRkPjxYSNxFL
	lVWYGShx3eldhJ+D+WRHfE/2ibQqiCrF8kUQuFfi0CIg5vNvKNPqZ4NlSW2HIX8hKTfF7QZTNRW
	Q3Yar9uGGxJNtO+uKpgVCYel+zW+FIRzIZ2llpEo1wdb+XXTxw2HKdKQLSdvt3lCHriMakvyuhs
	y/oyWea6rCrW6IGUOMll1lyJ711IKek/zf0OEzDdYv5iQbhQIXxyhk9XM3DRGwxqJNE4FfmEOTO
	U9GIN79TSuAgW8EOE+Bd7H+fpgru+zbiMu+mJaHPz8LWrcoUFakKCRJFzxM5ZWb0PdlyCj9Vnvs
	ABkOjZAPt44jiUWfNhXdBS/InvLJBZ5QptC6p7243gAtXERmxDJojsANjJ7GB6yTKOQLaSnnVmv
	BTrmRbeOUiIfr5t3XxHYUpwS3PKSAZ3vzc6urMIejT0l15gVs=
X-Received: by 2002:a17:90b:2dcc:b0:380:873:49cb with SMTP id 98e67ed59e1d1-38941205948mr2366147a91.21.1783515131416;
        Wed, 08 Jul 2026 05:52:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
Date: Wed,  8 Jul 2026 19:49:50 +0700
Message-ID: <20260708125002.202515-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Convert the interrupt handler to use guard(mutex) for automatic mutex
unlocking and PM_RUNTIME_ACQUIRE_IF_ENABLED() to manage the runtime PM
reference through scope-based cleanup.
This removes the explicit cleanup paths while preserving the existing
behavior.

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 Added Reviewed-by tags from  Richard.
Changes in v3: 
 Remove unnecessary blank lines.
 Remove temporary variables and return directly.


 sound/soc/codecs/cs35l56-shared.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f14e2eaaa4ee..d5817e420847 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -640,23 +640,22 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	unsigned int val;
 	int rv;
 
-	irqreturn_t ret = IRQ_NONE;
-
 	if (!cs35l56_base->init_done)
 		return IRQ_NONE;
 
-	mutex_lock(&cs35l56_base->irq_lock);
+	guard(mutex)(&cs35l56_base->irq_lock);
 
-	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(cs35l56_base->dev, pm);
+	rv = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (rv < 0) {
 		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
-		goto err_unlock;
+		return IRQ_NONE;
 	}
 
 	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
 	if ((val & CS35L56_IRQ1_STS_MASK) == 0) {
 		dev_dbg(cs35l56_base->dev, "Spurious IRQ: no pending interrupt\n");
-		goto err;
+		return IRQ_NONE;
 	}
 
 	/* Ack interrupts */
@@ -680,7 +679,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 	/* Check to see if unmasked bits are active */
 	if (!status1 && !status8 && !status20)
-		goto err;
+		return IRQ_NONE;
 
 	if (status1 & CS35L56_AMP_SHORT_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Amp short error\n");
@@ -688,14 +687,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Overtemp error\n");
 
-	ret = IRQ_HANDLED;
-
-err:
-	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
-
-	return ret;
+	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
 
-- 
2.43.0

