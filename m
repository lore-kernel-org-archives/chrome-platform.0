Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401EC318B96
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058188; cv=none; b=I04MnBR0B8kwL5gMwMg+MiGf9ky4zDjZwXJ5hqSwTJA6JkMplGxY6/HMKhly89CzV/Oc0lsg8rYgGaY1q+OrwzQP0Iz9fHsQTYKQQrV2FVwMdpUR4gNv46hAchWSKIZWLApZC2vuOkl34PAxGdWoKwVRYsWO9siznjK7tLn3YOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058188; c=relaxed/simple;
	bh=WYggS4ZnMt6fzQmOJcSRrkDc66AvTs7KIbRAtBpTltY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtjIZ4SSTZvx1SYIgkJ0OsZO4jL4SJN+iFpbB3G8p+Sv0DWonShKN2oB5JTaKmRJDAeN9OGVwVOPj4CPR0qjxzFUOVYeD7LZacUuMdEsIYDgkyu6423lCxlAdJoIm5RsixVgBhX6Oy9Bn1VCZ+le5FYNq3bIul56FCDAX982OOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H47IJHk1; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H47IJHk1"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8478a25f268so123325b3a.2
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058186; x=1783662986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTbk3qG2turaWbnOrhzIgpcLjXYgFFUDaRvJ6ZSqU3g=;
        b=H47IJHk1dXHq5vWtgx5wPRMOc0+9qlAlgQ6v96LF187idAj1L6VjWB7IZeikwXFFzL
         P3HVYosku6Udl2Xa2FQJk2zD2X4lfNC1sx3wRU/6tpAMft8Jcu9NuBr4uY5o1WSQrNZ1
         MGaGmhLXSmuOTskBLcc4a5xjbIPr/c4XWRlWSwgNuMfEJW2KDYLiCeGdqsvQuXD3rAqL
         2lOYNBYAjT0IBD2T/IY7hu1smpERnD+VBynjJ59M5iLDpu9TxtB4BcLujROmTO2W+v0x
         9ucv+aNYA9EMvT1AArN3uTkfLcuhtndlXp/JMqQUd8FUnogdkQUrHdPNOBZyKoep69BB
         wp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058186; x=1783662986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTbk3qG2turaWbnOrhzIgpcLjXYgFFUDaRvJ6ZSqU3g=;
        b=gYcjpLsfTfXs/NW+5yTgXhThNtJOT72F2HnZhkQ8OUBYki/nXHkaIV2C0QpV7YQTcO
         YdUlnoMqYl0G/9DWhZKTEawxBWMtqjo/LSxUUJGf26PhU09ozKjjkWG3Sc0iL+SqPvPQ
         5bJKercdFfvWSeE3/XS8uCstKnbDBujJhK38OWoCX51BtLmJ9TENeuOHtT4l4w9dd7T5
         jr7/mRmvMchBbHY8G0SaXHUmE0df5probhMx0Gw3lDr+vS0CmiWSyaIHjMfZmdFzVYRE
         Z0utWUsN2oamg/lvtpeNrSKEvrKW4RvVX7D2fKAIjz09Y4LmPEP+ZGAsv2rPo1ucztkC
         TQIg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8FFyn17BUNMmN+C+/ta5fJNBrsq/wfT2KgVyOBLcPqeUrsbNEoZNcDajMf0koTna5Um7W7eDCBgwcYM3bFOI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5Q7nKrYu3KGMR3Tz9U41Z+4/iP8O6Gn5rsIdE8eZKzsKcXaaq
	j4wAc/AJ9hhS6YBtndCTujmj4OxnTHMlr0MNelR6n/blK37/K+xraJ0K
X-Gm-Gg: AfdE7cnMf1k62tTjgJi2FkMnQUQMUUOEYRzL+Sg/Gyn/3Bfl6swKr01/0mCssu8X2fE
	r6HrFQrWjdduM5lKGjM3AR10PLnjZ8sx5xYoHJv48/1bMXIf8Cqnq6AmlSQ6ikYZ/iW26/htXoK
	6kiWiTttMMqapR57T6rnbFb2PBGIQ44SN9WtzpgKfMmfm4VsXa0/EA239nlQ0rxuVdMjM81Mrr5
	F/MqaySvoSvR1Bb//oDaNoRo9a359V4o/dHPnooP+/4kd/VLRDS6HvIy5mZ4TOnnP/rXzOFpPct
	DHjlpjXnSyzpr2pRi/kqBDVG89vDi34stxupt5lakvAGzER5fCyhCNqr2ziOnREDZwzcuv8iUbo
	dgB6sfnRsZKtcHwy79DXL3UcS9nlqnYrXScbSeoFktrqvui2VQ2nUp9afZI/SbmjsScAuqYuv+C
	k1GDiKeSmtXl9+IEgICPO80OcGB6a6hEiodnqJku7rMb72WQI=
X-Received: by 2002:a05:6a00:414f:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-847c50428a1mr8169003b3a.14.1783058185595;
        Thu, 02 Jul 2026 22:56:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:56:25 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
Date: Fri,  3 Jul 2026 12:53:44 +0700
Message-ID: <20260703055355.244898-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs35l56-shared.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f14e2eaaa4ee..73fe1cba3f5b 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -645,18 +645,19 @@ irqreturn_t cs35l56_irq(int irq, void *data)
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
+		return ret;
 	}
 
 	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
 	if ((val & CS35L56_IRQ1_STS_MASK) == 0) {
 		dev_dbg(cs35l56_base->dev, "Spurious IRQ: no pending interrupt\n");
-		goto err;
+		return ret;
 	}
 
 	/* Ack interrupts */
@@ -680,7 +681,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 	/* Check to see if unmasked bits are active */
 	if (!status1 && !status8 && !status20)
-		goto err;
+		return ret;
 
 	if (status1 & CS35L56_AMP_SHORT_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Amp short error\n");
@@ -688,14 +689,8 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Overtemp error\n");
 
-	ret = IRQ_HANDLED;
+	return IRQ_HANDLED;
 
-err:
-	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
 
-- 
2.43.0

