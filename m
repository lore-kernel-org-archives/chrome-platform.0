Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D1E3D3329
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454446; cv=none; b=Oc7M63ISzgA0/WcqxRdEFycC2cjUFu5tiobZwDGQVq0nDy/N8brdCiy7NM7ifCANEb7TaPEXhtWzqhjd8aqoQV/ft05T/6wHvyz4kfnIDqEPzlrBHMk0uoWpP7VTMGxc3xYetjDUb5Df1KFf9UE1Z5f/6bP9r9MT5vyZClpQ5NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454446; c=relaxed/simple;
	bh=R5s11lRtMkt0ChjmDAyftHMZY8EG7E4owWfhRXPCyQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIoR6EeaR90aBI4mu6datLkMukyqKDsHLYAGpXij0yV0CXiDQwaX+thcGWONawdxtB2HLrmCZ3JRtKFxZphD4AYL8lNnl5ZpPG245ffI4xI42M1ojff5UIn2Z4UjBsR1VaIM4GzQodhcbJ78GBk/gsZ1YmBbE0w2IG82oEMX118=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDlbZAUB; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDlbZAUB"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37da8b5540bso381537a91.0
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454445; x=1783059245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAhghodzghWLNkWnKkUJE2/QxTnbZ4g560t7Ra+4Ai0=;
        b=ZDlbZAUBlm+0YCY16DhUrSGZ+0i0DQyZA2376jE6v+skcuJHCp+8zJL6Hi5oxl1/uR
         NlXkUGYJgKXGmm34P/yMUa3/A/fBl0r+RLoDSa4Y315AsyvzNE012tH4u5vwVTLNC9Xq
         cU5k/nuGUkFUzZGJ+meFqx+zshkUEDOIjoeXiY8sc2661DcFOyuereaYa2UHt8ahj5L7
         mhgYtI4JkJQBg1SdJyMQ1L2AwVVaXcd+NJgZU7BroPelk0XL4cZv49uYbsZNnOa2Vs/1
         CDsTsyp0TjOatHnKVgcDr4VomySmvVRZPBJKMVUZpLFJcyomDrUobuJiG6BjLI69kDvh
         Zg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454445; x=1783059245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IAhghodzghWLNkWnKkUJE2/QxTnbZ4g560t7Ra+4Ai0=;
        b=ePtGk6tYW4RTQreMnkZlbt6zlp2Dq2WqPkW6BpVP2f1Qh3/pE+uKp6i45Sb42L9TUU
         ZF1IUSLbAd1iPP5FPySpSDgUI4Oa6ExnigFpt+BIsEY5qFScEkBJTeWRuUE5Jvb2ZnRn
         uCb4SudlgxiwCPsPSvH8GE2OGC8hsSsqdYvN7uOUan4DX9HOBnEgfp5CY3MJdN90Q+C5
         wqGO4qlxaHy3lv5ZBCcH3v9qTnp1EXsVafxeoHL9XonoLXROkByiZ5Z3iI8049bQUjJw
         2ojFQykPf4RtVJXEr87k0A1Wlgc7fcSmJi9+gN6uw3DgyQT7Lk3wKzEtH1cbyg3YY14n
         cDgg==
X-Forwarded-Encrypted: i=1; AHgh+RrvdgTQtB2RpIvcnZXrytvHJsuAdLyhN4z66Jq7LT2CR3xG0s/KQ9+JP/dSSDBM4OjrQIgFLR1SAdLyXCvOp8U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+b6ZKHnZ3EaShHLNttfoO5kOx17c4dPlKtckjMRIM5LZdrVEb
	DIlvYhALJx8WBBRWTGC4OoH3z7Na4n2zK1AOm4gWUFCmaDp4czgeJBUS
X-Gm-Gg: AfdE7cmwWtWMS8xIdZuHlmTu1csIuoBeUkAZW761TLbX9e3SDHC0qRLFgObPRVI+p4W
	58OdEjMrnQ8TnfYrYsFcHVhCuSAdQlOEluzE393JtuwgvQURuv+gXun+9Bv486htQ9EFdXg1UYH
	Gcc8zY0KoZ7jyLDeEfyd1frrTsz+GluSONmhpqmc7yBbGbgy8QLq2f/snYmMIizVAwHOezg+oK+
	dYUu9rt/qqaJl9k2H70atQDYstD0s8EHROVKx8o2gNW5yqzzc2nICVzCIUV/h6wenlw1ukd5IoP
	+8xcZHhtLKuT1hOnoFzHZbl9BlhhCx9SLiK3zT6qzHu7pgUK+/UcvLtVkg6BKcinvvRYVelUvZA
	8uPRuEDSgJABpPx7QTbd7Y6shHqtLJ0YFZfCKzEIL+/0X5lWYrIsrT5EE1oZjR+FU0RVcSHX+sN
	wcjPHelVlVxpP4dg6HmoL6BpsGfYYesgMz2PiFoveafxkazSo=
X-Received: by 2002:a17:90b:5826:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-37dfa251534mr5702221a91.15.1782454444842;
        Thu, 25 Jun 2026 23:14:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:04 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/24] ASoC: codecs: arizona-jack: Use guard() cleanup helpers
Date: Fri, 26 Jun 2026 13:13:08 +0700
Message-ID: <20260626061329.23264-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() helpers for mutex locking
and PM runtime management.
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 39 +++++++++++++++------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index a9063bac2752..b0af32e0ddc8 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -5,6 +5,7 @@
  *  Copyright (C) 2012-2014 Wolfson Microelectronics plc
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -707,15 +708,13 @@ static void arizona_micd_timeout_work(struct work_struct *work)
 						struct arizona_priv,
 						micd_timeout_work.work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	dev_dbg(info->arizona->dev, "MICD timed out, reporting HP\n");
 
 	info->detecting = false;
 
 	arizona_identify_headphone(info);
-
-	mutex_unlock(&info->lock);
 }
 
 static int arizona_micd_adc_read(struct arizona_priv *info)
@@ -921,12 +920,11 @@ static void arizona_micd_detect(struct work_struct *work)
 
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	/* If the cable was removed while measuring ignore the result */
 	if (!(info->jack->status & SND_JACK_MECHANICAL)) {
 		dev_dbg(arizona->dev, "Ignoring MICDET for removed cable\n");
-		mutex_unlock(&info->lock);
 		return;
 	}
 
@@ -936,7 +934,6 @@ static void arizona_micd_detect(struct work_struct *work)
 		arizona_button_reading(info);
 
 	pm_runtime_mark_last_busy(arizona->dev);
-	mutex_unlock(&info->lock);
 }
 
 static irqreturn_t arizona_micdet(int irq, void *data)
@@ -948,10 +945,10 @@ static irqreturn_t arizona_micdet(int irq, void *data)
 	cancel_delayed_work_sync(&info->micd_detect_work);
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	mutex_lock(&info->lock);
-	if (!info->detecting)
-		debounce = 0;
-	mutex_unlock(&info->lock);
+	scoped_guard(mutex, &info->lock) {
+		if (!info->detecting)
+			debounce = 0;
+	}
 
 	if (debounce)
 		queue_delayed_work(system_power_efficient_wq,
@@ -969,9 +966,8 @@ static void arizona_hpdet_work(struct work_struct *work)
 						struct arizona_priv,
 						hpdet_work.work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 	arizona_start_hpdet_acc_id(info);
-	mutex_unlock(&info->lock);
 }
 
 static int arizona_hpdet_wait(struct arizona_priv *info)
@@ -1018,9 +1014,9 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	cancelled_hp = cancel_delayed_work_sync(&info->hpdet_work);
 	cancelled_mic = cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	pm_runtime_get_sync(arizona->dev);
+	guard(pm_runtime_active_auto)(arizona->dev);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	if (info->micd_clamp) {
 		mask = ARIZONA_MICD_CLAMP_STS;
@@ -1036,8 +1032,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	ret = regmap_read(arizona->regmap, ARIZONA_AOD_IRQ_RAW_STATUS, &val);
 	if (ret) {
 		dev_err(arizona->dev, "Failed to read jackdet status: %d\n", ret);
-		mutex_unlock(&info->lock);
-		pm_runtime_put_autosuspend(arizona->dev);
 		return IRQ_NONE;
 	}
 
@@ -1057,7 +1051,14 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 					   msecs_to_jiffies(micd_timeout));
 		}
 
-		goto out;
+		/* Clear trig_sts to make sure DCVDD is not forced up */
+		regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
+			     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
+			     ARIZONA_MICD_CLAMP_RISE_TRIG_STS |
+			     ARIZONA_JD1_FALL_TRIG_STS |
+			     ARIZONA_JD1_RISE_TRIG_STS);
+
+		return IRQ_HANDLED;
 	}
 	info->last_jackdet = val;
 
@@ -1111,7 +1112,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 				   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB);
 	}
 
-out:
 	/* Clear trig_sts to make sure DCVDD is not forced up */
 	regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
 		     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
@@ -1119,9 +1119,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 		     ARIZONA_JD1_FALL_TRIG_STS |
 		     ARIZONA_JD1_RISE_TRIG_STS);
 
-	mutex_unlock(&info->lock);
-
-	pm_runtime_put_autosuspend(arizona->dev);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

