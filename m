Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCD630DEAC
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058086; cv=none; b=Pb2JFZHQgvuGfCCNlDp9NXAt86/CsoGXwUhwvbsmwBs8scmitOaBVGrbuXBEEK2W3obGMEhxojD3p+WgafnPsYGbYVTlROnSCQVqXEPhPAqgUFF0M3q0mXL0kmThmH0kb1oirWv0W6a6FSOjoXf5Q962wghxuXqFCuOKafMMLFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058086; c=relaxed/simple;
	bh=GYv/+ILl65IMAg4NpYN5XfF4HUUV5EZMs3DQnk/Yubw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X6CMph7a6hgBHo9WVc1U7Fd3SqPGwEY13CjqExSPZRxh4RasXhDCuMx0+WHxWNXF8WMkVVlsFWpk+zegirHquQ8bUtPPKbv7/njfD2C8J17urKQ8AlwNb/gggiQWYxZFQEJtT9NZYVcSPd10nacvBG72LmKoRXvVup7R+6ueclI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oieo28dM; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oieo28dM"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8478fe07f65so200454b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058083; x=1783662883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHxo5NErxklm1dhHWxncjqeyHm0XMFYuV/aXdQRXGFA=;
        b=Oieo28dMOXMup3hnx5nWZ6H1iWGGoWLkM5V0YCNSPXrSYKmbC/itsVG3sF9ziMTDak
         5yX8jqyeC5vDZSXOJJO6+Heq8BN6eAazJ9bScPBKqxWryVEDk7x1JDxd738Zk0bpmZCU
         q0KjMiGR0s+MX5PQLHshlAktmDEH7hZrCPoDb/yX9xl4TUVvuE7O48K9rZcw1O8vKFdZ
         NQB/A5hey21eOIKm+24NQBuVSXm9vIlRu7GUkjpIyfMlPn7FtgpiMltqoXVt4hrgwo/e
         CsnliassRyyOme5xK++T9Ly+U7r2CcxIihfaDrwtnAuLPnKfnASxcav0n+2FDxN2hdtS
         1PmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058083; x=1783662883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PHxo5NErxklm1dhHWxncjqeyHm0XMFYuV/aXdQRXGFA=;
        b=MlgoSl9y5xiyszI9arQmede+sh8hTW9R8SZBW4eI4/QNQcm3OL9or9k2ue0wp/jbrX
         +OD0p1LHPEy7ZjYfwZQ4F0/3mN57CAFMzQ55gcotwKfCECqyCYgmLsWpJTK9xBqUz04r
         wVfFnA+5znSd0FhT4Gr9XiY0N3/7yoQYWHSjzg5uGeuZOMr0gzZUNoTbRHsX8+67IciS
         tpbQdZvPFsthmb0IGPYWlCNHjd0bl8TfuKZNpuqDIwAySCh78OboyHOeHlxYgUm6ifZQ
         snETT3pGlgvj+m2TCfLlAx9AsRqI2mgHgWaoR33rfplHUQ/AH0QAFGaBVQGm4DleaJuC
         hQ3g==
X-Forwarded-Encrypted: i=1; AHgh+Ro//J1Ky4CZr4o0QPKgJAm+wskVVCfm90An2UyhGMEloVxKbvsPCEfGXyRsO819aqM23Kp4ZAsUk9oqDx06PmY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1QqLPimuLf/+SkKa1XBfks5kYaXMC9qSgK+48HFcAhkZSKdmb
	pL2EskAgLZaQmesNb16IkdtEWw5m+0zZcM2x3B4cC7Y4c8quDwG3DkQt
X-Gm-Gg: AfdE7ckvlwZURZHPT+SkggUSSeaRCZFw0+cYl0GnpT7/vb+cp+mZ9AW0BpgRPrnNf5y
	Z9NiYPqHGItMyNxvQDWDEKq250szes1Ls2wZz7/j08XEzMOBrsjPXmSx7uYxfLE2t+Gq/FAnBGc
	yqD3NgtiK9QxEmZ4cWx/3dvRQU4T5EzxG2zhgtI3mc0bcM5YMNClj3AHdmh8YBtwlJ30Wx/0r3e
	voVFKGTmR/jEwokyVRGMSgCG0Csy1XLPKKVJzgJJuY2TP5Ewk0zwFJDeQQkWWj6ycOgSo7v4e29
	K4UayJ2WVPmq964s6NWoed5+TvSwVeM80dcO6v0A+56cPPKbxhBbDGDM7hKn6ZZ3NmSv+v8tFPf
	VduQRgUSNIphXIkuvPQviwf4L52XYre3UX/twz9pZ2agjGVki0/DhZ0L/oWZEGRQsZyjmDiO8mm
	ooCpEYHFVYebQ0fC899xxmiKdY7StPFzYBraWKq7Tyysy3ICqmNVAAEjVPLg==
X-Received: by 2002:a05:6a00:1746:b0:845:d2e3:263b with SMTP id d2e1a72fcca58-847c0951299mr8839908b3a.53.1783058083260;
        Thu, 02 Jul 2026 22:54:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:54:42 -0700 (PDT)
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
Subject: [PATCH v2 03/24] ASoC: codecs: arizona-jack: Use guard() cleanup helpers
Date: Fri,  3 Jul 2026 12:53:34 +0700
Message-ID: <20260703055355.244898-4-phucduc.bui@gmail.com>
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

Clean up the code using guard() helpers for mutex locking
and PM runtime management.
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 Reworked the code to use an if/else structure, 
 avoiding code duplication after removing the goto label.

 sound/soc/codecs/arizona-jack.c | 116 +++++++++++++++-----------------
 1 file changed, 53 insertions(+), 63 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index a9063bac2752..7ea8112e0d79 100644
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
 
@@ -1056,62 +1050,61 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 					   &info->micd_timeout_work,
 					   msecs_to_jiffies(micd_timeout));
 		}
+	} else {
+		info->last_jackdet = val;
 
-		goto out;
-	}
-	info->last_jackdet = val;
+		if (info->last_jackdet == present) {
+			dev_dbg(arizona->dev, "Detected jack\n");
+			snd_soc_jack_report(info->jack, SND_JACK_MECHANICAL, SND_JACK_MECHANICAL);
 
-	if (info->last_jackdet == present) {
-		dev_dbg(arizona->dev, "Detected jack\n");
-		snd_soc_jack_report(info->jack, SND_JACK_MECHANICAL, SND_JACK_MECHANICAL);
+			info->detecting = true;
+			info->mic = false;
+			info->jack_flips = 0;
 
-		info->detecting = true;
-		info->mic = false;
-		info->jack_flips = 0;
+			if (!arizona->pdata.hpdet_acc_id) {
+				arizona_start_mic(info);
+			} else {
+				queue_delayed_work(system_power_efficient_wq,
+						   &info->hpdet_work,
+						   msecs_to_jiffies(HPDET_DEBOUNCE));
+			}
 
-		if (!arizona->pdata.hpdet_acc_id) {
-			arizona_start_mic(info);
+			if (info->micd_clamp || !arizona->pdata.jd_invert)
+				regmap_update_bits(arizona->regmap,
+						   ARIZONA_JACK_DETECT_DEBOUNCE,
+						   ARIZONA_MICD_CLAMP_DB |
+						   ARIZONA_JD1_DB, 0);
 		} else {
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->hpdet_work,
-					   msecs_to_jiffies(HPDET_DEBOUNCE));
-		}
+			dev_dbg(arizona->dev, "Detected jack removal\n");
 
-		if (info->micd_clamp || !arizona->pdata.jd_invert)
-			regmap_update_bits(arizona->regmap,
-					   ARIZONA_JACK_DETECT_DEBOUNCE,
-					   ARIZONA_MICD_CLAMP_DB |
-					   ARIZONA_JD1_DB, 0);
-	} else {
-		dev_dbg(arizona->dev, "Detected jack removal\n");
+			arizona_stop_mic(info);
 
-		arizona_stop_mic(info);
+			info->num_hpdet_res = 0;
+			for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
+				info->hpdet_res[i] = 0;
+			info->mic = false;
+			info->hpdet_done = false;
+			info->hpdet_retried = false;
 
-		info->num_hpdet_res = 0;
-		for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
-			info->hpdet_res[i] = 0;
-		info->mic = false;
-		info->hpdet_done = false;
-		info->hpdet_retried = false;
+			snd_soc_jack_report(info->jack, 0,
+					    ARIZONA_JACK_MASK | info->micd_button_mask);
 
-		snd_soc_jack_report(info->jack, 0, ARIZONA_JACK_MASK | info->micd_button_mask);
+			/*
+			 * If the jack was removed during a headphone detection we
+			 * need to wait for the headphone detection to finish, as
+			 * it can not be aborted. We don't want to be able to start
+			 * a new headphone detection from a fresh insert until this
+			 * one is finished.
+			 */
+			arizona_hpdet_wait(info);
 
-		/*
-		 * If the jack was removed during a headphone detection we
-		 * need to wait for the headphone detection to finish, as
-		 * it can not be aborted. We don't want to be able to start
-		 * a new headphone detection from a fresh insert until this
-		 * one is finished.
-		 */
-		arizona_hpdet_wait(info);
-
-		regmap_update_bits(arizona->regmap,
-				   ARIZONA_JACK_DETECT_DEBOUNCE,
-				   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB,
-				   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB);
+			regmap_update_bits(arizona->regmap,
+					   ARIZONA_JACK_DETECT_DEBOUNCE,
+					   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB,
+					   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB);
+		}
 	}
 
-out:
 	/* Clear trig_sts to make sure DCVDD is not forced up */
 	regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
 		     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
@@ -1119,9 +1112,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 		     ARIZONA_JD1_FALL_TRIG_STS |
 		     ARIZONA_JD1_RISE_TRIG_STS);
 
-	mutex_unlock(&info->lock);
-
-	pm_runtime_put_autosuspend(arizona->dev);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

