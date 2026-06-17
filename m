Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB97243DA31
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692771; cv=none; b=XkdLDT1YJOM9N3e55GbMOwnNnx+Gk/JHoQuSfo7dK3cL9bRbdgA93V3rVKrMWKCG9laWkKLa8CQMBfdPfPQLxLsNqtgYOx0r9+eUKkMq3RnKhpkhCzZTQYGIEdHXaM+9nJzr3PAXHvHwB5Y6sN0Y762TJ9rhqU3zeoiJEBDW9JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692771; c=relaxed/simple;
	bh=glqReXfZPCSQ9DjYZSYbXgYtCkut9TkNRV+nVhsubfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yw9cLCOEcUIwNvxMKMxl0j0zTRlc56HQEhDe3mfDE+tWygo/k33Iu8Zmknqtomnj8vDVgrK4gT7rZubPQJkg2/82DpWug19zHDH3Fc5v03iHJBp/1AQ7KVVkZFJZcWTh21yV1f8fCoHOwBEVRlu+WQ1+26SShjv3sR9kVZMHpz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMm1MrMV; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMm1MrMV"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30b6dad2382so6296109eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692768; x=1782297568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V8d0Yg4cyesbpB3rX5XFizQgFDCgrflJrinbH7M1Rc=;
        b=bMm1MrMV8J/5WZ1jlZzxVPRXpf9VOPU5kBMdXLkn6+vqG+UKXgA6AOopRTq/MBRd63
         EZ6oWcoLZaQO/s0Je0p8f3vzKdTIc6dyuKh+aDlWlnlAPHz0q6KILOMEwEYkfTHIyKKr
         cb5FJN5qm6jVlUvssQ6yyTWC1rvar4m6qHhVOMJ55pq2hHQpClbXEJh8xj71/Ue7ZeID
         bxRdWXoMyWXG6Mh83gNZfy3sIp9Nf6dv7SQHEYz/g1AQz0c7fBEvaxqUHMN7g13Kt1Bf
         0LeqNSbUxJRgkbVZM5zqcuJOEWqOHjeupatnrO6sxD82BBe0o8tWn/vr29PApvMGWnnm
         WGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692768; x=1782297568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4V8d0Yg4cyesbpB3rX5XFizQgFDCgrflJrinbH7M1Rc=;
        b=B866V2E4eykMLfu/0Hdn8aHmHdMMJm8e377anCxLBIL9aKidLk4aR7hX4ivp8B2BJS
         FaitoLRxBKvNkQx+pJzoPEW7UXbfw8qN8Dr4ipaXABwj5n35e/ArC3oAF9GDUPNcUq1G
         ypRY0YTE9CU6dOmbYQeix1M3koC+mk0ZDvA6hk8B2XKnC+5QE9gSIgOLHg/u07w/kjAv
         jr6g+n2UsDh3C3nqxYwMMsp2HYz9DiCNe65YqBhy+mQicsCtRZHEJwm/OMbQtY4KG6Q0
         d/WodpDJPSyda6NKSQ4jvRIZCSZL97ceNQFFJTbNTsYgqyZY7N290DIo96r+kPUz4a7E
         xZzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9o9/is9RCWyG/MFtjKkxFovRkNE3pRF3gS2ullRFBn9Ajqs5KsglbJb8rz/ZcpXcV/eVVApiMPbL4UhemvhMs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUIAfQjHs3JL2L1ezoxXBuptiMwcLp/ixLzrsNvtCUWFZ8kChG
	YyH4uz5pq5UW+emj9i5jTsuWSa+22ACCx3pF67o5xCqQok7ayUmLqxYA
X-Gm-Gg: AfdE7clRaw6GI3HhEyS90fiVY1mFfPu3ZIM1FeuV8/gc+ZXDVxGMvKadudB+pDUpy7z
	gtquAbRjCZ7v6F51+MrGU1xdxrHrQJEpCM+MIlr+gP+OBgDOIhTcTIbFqbj1bLzXLm0wsT5kzYl
	sD2Ktl0fUrkQnvbM60Sl3oqnxLHj193ijJvA0oy1c1dI8U96TuFY88Af3kRwJRhGwyZ/HEc5RAN
	3b2q7OT9/t6T3Rwen5oNevQekXpJagkREqkT2rCsLNKWyrWUjT7Bvbh0P+BwKBNPO4IJU5eqk+f
	0ZGXO024PBCY6S01fw5qxDt4gJV3yHNJ4xwKg77PiQlq59N76wvNsJtfOVilAdWjWwKo/PAT2YW
	2Y3GXw5oDA3tcllR+VSdAyntI3mr8zPU82rAQHI0Co4cbZxopIzluqAD9CejqnFXzRgGuWcGF4D
	HuyYzK33GxS3fZ6iif39DA4kK0TMwrHmAZZ1St47X/7fkIm/U=
X-Received: by 2002:a05:7300:2d20:b0:304:d835:274 with SMTP id 5a478bee46e88-30bcae227f9mr1625563eec.24.1781692768114;
        Wed, 17 Jun 2026 03:39:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:27 -0700 (PDT)
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
Subject: [PATCH 41/78] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:58 +0700
Message-ID: <20260617103235.449609-42-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5514-spi.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 199507d12841..be4f5f7da22e 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -79,17 +79,17 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	unsigned int cur_wp, remain_data;
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	if (!rt5514_dsp->substream) {
 		dev_err(rt5514_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5514_dsp->substream->runtime;
 	period_bytes = snd_pcm_lib_period_bytes(rt5514_dsp->substream);
 	if (!period_bytes) {
 		schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-		goto done;
+		return;
 	}
 
 	if (rt5514_dsp->buf_size % period_bytes)
@@ -111,7 +111,7 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 
 		if (remain_data < period_bytes) {
 			schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-			goto done;
+			return;
 		}
 	}
 
@@ -146,9 +146,6 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	snd_pcm_period_elapsed(rt5514_dsp->substream);
 
 	schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-
-done:
-	mutex_unlock(&rt5514_dsp->dma_lock);
 }
 
 static void rt5514_schedule_copy(struct rt5514_dsp *rt5514_dsp)
@@ -216,7 +213,7 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 		snd_soc_component_get_drvdata(component);
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	rt5514_dsp->substream = substream;
 	rt5514_dsp->dma_offset = 0;
 
@@ -225,8 +222,6 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 	if (buf[0] & RT5514_IRQ_STATUS_BIT)
 		rt5514_schedule_copy(rt5514_dsp);
 
-	mutex_unlock(&rt5514_dsp->dma_lock);
-
 	return 0;
 }
 
@@ -236,9 +231,8 @@ static int rt5514_spi_hw_free(struct snd_soc_component *component,
 	struct rt5514_dsp *rt5514_dsp =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5514_dsp->dma_lock);
-	rt5514_dsp->substream = NULL;
-	mutex_unlock(&rt5514_dsp->dma_lock);
+	scoped_guard(mutex, &rt5514_dsp->dma_lock)
+		rt5514_dsp->substream = NULL;
 
 	cancel_delayed_work_sync(&rt5514_dsp->copy_work);
 
-- 
2.43.0

