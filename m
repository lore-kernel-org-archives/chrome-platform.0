Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57D0381AEF
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401172; cv=none; b=PSAawXouPeo0uN7EkcUxo1fY+BqARAWJ2AbDcduIjDmb8VwpZJGmA9rjQV/tSw+yA8+dAMHH/kjVryjO2sjMTapRS0BoBX6WTpLKrDL3k+13dpJvfpf8wbB63leCSZemy041dOODZqJu2/ZwYrC+lPFx13KKy8WiUBOKkjuwvdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401172; c=relaxed/simple;
	bh=YYnwuzA32vCrBS5jxPe5g87ui5erA9BMb2LXDj2ivxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TM+fvY28HermrXtRXmLm14fsHTeEi1U4Rt6t0IYOZYGo8q+LWyyBsIymkYpRPRwSCKe5ArKgsWwvs86quncRI9U2UOx9AUOvQNUo7YJDvpXpUESq7eZzGuakICOteZBHuMsWac3SXzjqBWU3ZY0iaVDaQpr45SkSAo4NPzxUE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8zgBk57; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8zgBk57"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8482074a000so1095580b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401171; x=1784005971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OeTn14ndUmp4M0jbxxRhmn5UH5bvV8+qVb+FxPZ1/7c=;
        b=c8zgBk57M9pawwcRqoFrHZ+QHg37MzFFT2M0B0UXxJmPqG04g11SfbLpQpMniduleQ
         TLrh9KfgcumtBDfZoRXjxEANqYfaqB7FntUYA2fbr9LMpd4uw9uK+27tOsYFnN+mX68i
         +hm08Eo1cvIj3LJniSI5PJ24Pc+wZkRz85006D1jEb6OMyyT+SWTmMLs4BRs1QRbdN6i
         qOhOXGR1W2gdquAQOXJZZ71eFq5MTuQwAFXZmBNMMTTXS6PpEvOZJwGx5hpSvO6LFM9U
         pxFoGzjAo7Pa7nNRbZOYEAIdI/M+h1nE/B5eOtrS80aQuFloZZD8mEOyLgZz5+a2lc3g
         lMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401171; x=1784005971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OeTn14ndUmp4M0jbxxRhmn5UH5bvV8+qVb+FxPZ1/7c=;
        b=WUK0SMUX7+odJxBUKZ1drFY+M9g4IeFgtylqPjpe0zyUiES05rwEWdJkin068X6IDk
         G2XA3PZxJyX3PtW9VXsH7hqvJml5RKXa4zboCg6TbInCYME0nWs5sStgIq+2pNSYl50g
         W+VFomLfdnOGa9z/aITtgkxlYtkW3WRohYb3BuU5/t6IBhDVeNng9yLkhDf6zUctYwNa
         0/46vNdxRrTg5+2ZwleU+ew112TfoHzmIgH2IolI546YZ21/nm+WsFZ8aKzJHTY6kHOf
         acuAFCfsqVQdurguwYbhJGn0BLcVe2Kgap19eT1RpLBBT0rAs7bOpb62ITTrqYSspHwc
         QGiw==
X-Forwarded-Encrypted: i=1; AHgh+RrzYcgI77LO3qF3zWu9Q2SRXqiiv4x+ywgL0Zi7WBFAdBIQyhf5IhSxfWlGmP3jJgNL/vMQ71UnhF83GWv68SM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+E106MRnTO7vWxwTTmUD4iEac4H6koLp0ivDtJL35nHCajVn9
	RvMUXhycgPmPN0xpidFbncZMRsHK888YVsnTy0bUBWfdJSeKR7T1+A/D
X-Gm-Gg: AfdE7cnig5DVxOM0tzv2JK7htiLRNy4+482OmVdsKiF+L4isCOYgzOqGsPBPo9pS6A4
	aFbQS9da9kuxIB1iiac/VXubylZ5hCKbH5QBNc2b1SOeLgIRIy7hmG9tfM2NneqVeqVyXuWhLFB
	c+UAKpd+uX5E8q5DmLeNiIUzYXVrsGx2LBL54EDXHgwt/x2jp0dLZTLv5AhOOhvIt9C7wySTH2/
	A3tKZjesDncsaZkf04Z0j0fPuQf5zTuv2vdpicAjw9pbJe2ht5sh880AQNuxtkRlgmgpBIBEG/W
	6ywQZBNuktVNyTzOSGrM82F+ngb53peL+2/AX/r+b+opgk+t7B7VFyz9cNc4F2yLbh+NiGGSSq3
	PoeM6aEowROZj2h3zNzG/cF0WaZhsHhFELE7CaDJdwC9pwLKukK41JAl59Wn0NZn1kqep+tDXpU
	RCfwReYmZnzMFLFKvICEowT/C3webgUzN2VZ1dTqBJgMiFHXg2H1Ks3MCZrw==
X-Received: by 2002:a05:6a00:338e:b0:848:2f74:1d62 with SMTP id d2e1a72fcca58-8482f742067mr1273678b3a.72.1783401169864;
        Mon, 06 Jul 2026 22:12:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:49 -0700 (PDT)
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
Subject: [PATCH v3 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
Date: Tue,  7 Jul 2026 12:09:55 +0700
Message-ID: <20260707051006.20058-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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

