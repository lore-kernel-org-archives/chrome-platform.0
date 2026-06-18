Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4643F0A8E
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781090; cv=none; b=j+cUCbDXoWku58nIxy6kcPTRZEdA6FBYOAn7Iovu7YsxxEwGor6W4MVNJQs3j7e1IjXI1bUst80deT5XxSIkDq7qnM2IAgJCn/VILYopQAt31lufOjY2H0My8WXdsgkTm1ESnw9/TluW9EVIYvnL5QmEtniXN5CiQDnEmQNufPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781090; c=relaxed/simple;
	bh=86Mglw3sAgj0wl4SUUHXpfzbY0JBBRM8KnaSg4QllDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzrmOE4ub31UsHrhnyYVt0TKqucIOoaN8sXtjTTXtWVtA1eLKH3Uhn5nYeRX8zItu3Y5QxtXvE6vfguzfsypNEDV7bYc52llJal6kqWjM6mmdfJ/LqnVcY7qiMS6/R4gpBJ3Al9JWjbUI8LGB4rDbu3xOKXBHwy122WYpm7Tlzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyVPm2Va; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyVPm2Va"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0b9328c4aso5622995ad.0
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781088; x=1782385888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLWN4LTtmd7hng+ZhZtLQKsiVn6dQ6fE8GmkqrRR6IA=;
        b=HyVPm2Va6TdDHFTVCaafqDgRK/3svkSR9FAanREhszVIxjQ3ev+NjOnXWST44SKJY4
         Fs5PZFbp0pY+VDjMg8unu6CSWEen9gFyBQBbjrIn5yIiqkol+DkTzDUKhyjyHLXMVAUr
         sUkfD7NEYY2v1bIaM1XwjOWuDgim029oFDVu8vki9sZWdtWJak1U8rvkx+einaSo3l6G
         8Ed5TtY12O4pobFEWh8HInYRdckoQMNXqI/M65Q0vvHB1tvEMPmlnEPcfxmtljUQb5pK
         xL5AiG3YLOxEkVIyWP0vTQK42Q3L5XJ8eQjx3P1hkxkLVpaYeGSashpfKj+rYTaxuqU6
         4CVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781088; x=1782385888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLWN4LTtmd7hng+ZhZtLQKsiVn6dQ6fE8GmkqrRR6IA=;
        b=Mnfs8Z5x8KTq+DYof+djj3bNB/B+Yteo6ALWvdHB6MOuZ8VdQqozWqyMzgybOJYK8Q
         xzIqGFifgvoGx2/Bxz3Ujlrqm3Q9bPUyUDzdYns52pVU65VRbYtnYNhYspV6aJM2b/9k
         EFaZtOi+onvSW//5hbQ5BGX1ANIpzqkpTmPFKkc80rVy2vF1VIE87rramHq+Dx6IBMWb
         CNO9cNd7J8hQx7VRTXprQ/2g3DmU/FaF2EvmLWyF+CizkFggdnuBd6xDvmuNx6fXDxIt
         QpLESN5Sxm75593GIEm/rasP1N55acga5Tzsp7TMDoRyP7s2J6lgOoPB62qpfL8zC2g6
         gyQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+oMz/DETSw8uIV1CqoW8EXFRzStTfkixan18CpWg2U7PYxxJxokix6cT7pF5yMvliJ8g6RmEmCVa9s2VJOoE4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTO2aColrx8Qi4yetOZEJCoC+pRxHAk2h3TfNF8hto2nJCNPkM
	WiAAFSkKIaY5+Dmx/dnunnvXK70Ad3CEHfLCVPFOBfpEH8I4wEgymp1k
X-Gm-Gg: AfdE7ck3jBF4kT6Rga55GoQ7xH0k+QrJO8sTiYFx2Abtnni7isyS7iqoG4uRrMs2VX9
	5I+pBWXCzJUyZS/wY5XoZC9ox2klgBin4sId5Ov/xIv6NTmaTMdhiw1ZL1fhyWR9n+X7RQBc7pg
	VVGHB2MoCTNTUgSk4DsxaZoMW0OLH+Sh5uwm7Vx01gmfhLzg/n977MiZHqpomBeV9od29K0oX/H
	6ebAi0v9MaIfWrPTmcSo66M4FoOHclfH3ZV7g0xp9aUJYqd0GJEKYJXkpqVUXkPgCo3kW6fj7JA
	4+TN6nUMcltUBhp1DtY8xVyAVoBOTSNeAeATeoMTMtKdDXE75vrabnkkITY6BtsdlolY1USJ+Yd
	GoZM476VNHZVrnrXACM1Mh+WKUnQl/mQhsI1p2H0/IxBeHWa8LlLrch4/CRmALmBBbd9CMVLTId
	+oRAHQ/urauJ7Kw6ZxfJhnEx7/V9exzdedU0scHt0Zz0mENdScRkyX3ZWgBw==
X-Received: by 2002:a17:903:1a6f:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c6f340c78cmr24421195ad.1.1781781088169;
        Thu, 18 Jun 2026 04:11:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:27 -0700 (PDT)
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
Subject: [PATCH 75/78] ASoC: codecs: wm8994: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:24 +0700
Message-ID: <20260618110827.232983-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8994.c | 51 +++++++++++++++------------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 1d64c7c42ed1..58f18bb0057e 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -766,7 +766,7 @@ static void active_reference(struct snd_soc_component *component)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount++;
 
@@ -775,8 +775,6 @@ static void active_reference(struct snd_soc_component *component)
 
 	/* If we're using jack detection go into audio mode */
 	wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_AUDIO);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void active_dereference(struct snd_soc_component *component)
@@ -784,7 +782,7 @@ static void active_dereference(struct snd_soc_component *component)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	u16 mode;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount--;
 
@@ -800,8 +798,6 @@ static void active_dereference(struct snd_soc_component *component)
 
 		wm1811_jackdet_set_mode(component, mode);
 	}
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static int clk_sys_event(struct snd_soc_dapm_widget *w,
@@ -3704,7 +3700,7 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 						  open_circuit_work.work);
 	struct device *dev = wm8994->wm8994->dev;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm1811_micd_stop(wm8994->hubs.component);
 
@@ -3718,8 +3714,6 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 	snd_soc_jack_report(wm8994->micdet[0].jack, 0,
 			    wm8994->btn_mask |
 			    SND_JACK_HEADSET);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void wm8958_mic_id(void *data, u16 status)
@@ -3785,27 +3779,25 @@ static void wm1811_mic_work(struct work_struct *work)
 		snd_soc_dapm_sync(dapm);
 	}
 
-	mutex_lock(&wm8994->accdet_lock);
-
-	dev_dbg(component->dev, "Starting mic detection\n");
+	scoped_guard(mutex, &wm8994->accdet_lock) {
+		dev_dbg(component->dev, "Starting mic detection\n");
 
-	/* Use a user-supplied callback if we have one */
-	if (wm8994->micd_cb) {
-		wm8994->micd_cb(wm8994->micd_cb_data);
-	} else {
-		/*
-		 * Start off measument of microphone impedence to find out
-		 * what's actually there.
-		 */
-		wm8994->mic_detecting = true;
-		wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_MIC);
+		/* Use a user-supplied callback if we have one */
+		if (wm8994->micd_cb) {
+			wm8994->micd_cb(wm8994->micd_cb_data);
+		} else {
+			/*
+			 * Start off measument of microphone impedence to find out
+			 * what's actually there.
+			 */
+			wm8994->mic_detecting = true;
+			wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_MIC);
 
-		snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
-				    WM8958_MICD_ENA, WM8958_MICD_ENA);
+			snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
+						      WM8958_MICD_ENA, WM8958_MICD_ENA);
+		}
 	}
 
-	mutex_unlock(&wm8994->accdet_lock);
-
 	pm_runtime_put(component->dev);
 }
 
@@ -4028,11 +4020,8 @@ static void wm8958_mic_work(struct work_struct *work)
 
 	pm_runtime_get_sync(component->dev);
 
-	mutex_lock(&wm8994->accdet_lock);
-
-	wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
-
-	mutex_unlock(&wm8994->accdet_lock);
+	scoped_guard(mutex, &wm8994->accdet_lock)
+		wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
 
 	pm_runtime_put(component->dev);
 }
-- 
2.43.0

