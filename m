Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB620407575
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692477; cv=none; b=Kl0RprgkQdRusR8FWyoKZUEv89n3bGLdhJ/XxCFBC+ZmaZRBxJOjPMMbWjo1eH1Zrxl4JMbh3fxy1C3ALYV6866BnfmGvtfYGw/09KPd9SUkSgazvvXPjfyyt1SMtXPtctXwlWtSQPJeU9u0zjY1TdwONxc9raz+sjTEtDqy04s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692477; c=relaxed/simple;
	bh=YU9czEwBC/A7klxq2Qooz+npPYdUR9f5C6rwWaGdcy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omrnimEsQuMVtf5bJ4C9TnsdNi19GUyaZ6zdD8sYK9ahruXYzsJoU1jcOs7vbdTogNDFT/aUVXeDiRYbCpZcDyhy9sne8m2UIIDWZVz9N36jeVSurUV7eqWF9RGrZC4wvjGf8g8CjlCC9XrFhX7hcqkZDF7X0G364a8h+HZvmyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQKpvlTd; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQKpvlTd"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30b6dad2382so6289685eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692473; x=1782297273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmFUuCghSI/8BuNtR4hfb7HGezLcFzfjMK34opjT9UU=;
        b=ZQKpvlTdwmRu11O0c7+UZUrbGXDcZ7DDPuRmoTPja1vGeuWCGiJ5F3EQkOAMrKGpi1
         aZ+Df1HN5cF9dBoAySga7B8nH836812yMGUKjlLIAs4hN0YReVOVnvb+Id/3rlVbwJRG
         Os4xcuIJB5qXY2WlyiSHumDaGfFAF8ozsFNxg0FZUUQAbip9RpSW2RaGjke9K3+e2cqf
         ZMok2Bj51UH2OyX3qxrxykAeQfmPUQ0mr1TwD0O7co67fXyFm/G5sfu0jAcvMKMBw1Y3
         3XdmBcCEHW2kf1CqWeQ7pgAyjjO/2lBemGlmgaKaWKCHLGnskxn7sUvCfchEqf7W7Ubg
         Mbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692473; x=1782297273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HmFUuCghSI/8BuNtR4hfb7HGezLcFzfjMK34opjT9UU=;
        b=I8ITyPBHJy4Psy9ravqo3PtM8eDyjCICTQ5P763IrmtNUK10qcJW0Uj9LiidDWuDr+
         RQBosk3cWlIuqv7XnDGXuKqIGFa3LGidR2S6FIaPwCTWNSWVHmzt4lGx6UMQrQK40/gk
         H6Y4+kHVTQgCE259RMXiqowgJQTXVw3MPAGPhiOPXntdi0BnMHPnqr675dCx/XRJPIhe
         Hc5trJ1EyfKTHuARBzAPWKYj7UpMPfXYU3xvwuonQhr9Fw63fVbpeFPTcZO0gM3qHPKc
         FDYcUgOlWeTQdsfZrZgSuBm/PKEF/y2H0q1WbUMcPtjgtkYBQEPtUj9McJ8ih4xrSC4l
         QNjg==
X-Forwarded-Encrypted: i=1; AFNElJ9vdqMeAP5SX28rK+nz1GshIWuehOieaeuMMS3mCU8wsBuJM26pnu/XWa3UhOhK1HUkeNJbD+qmMEG5LAtihH4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdNdz2UN2iW6BK8ldBjvwdgQPm+VoYC8Cdp5P2ST7vz52hiCD5
	VgXZBfSuEY4ok733OsppjVIT9E6uDseMEpgg1b/GnmQgBUpTB7WH2fP1
X-Gm-Gg: AfdE7cm6a2I8NwwYo8aDwreML/Qff8/qfKnR8KUyvlvDhSQa6ncZLOxJIDHy9YwJlEs
	5SbJi/7fxAK6q3rXg9nkjiniDIMUL8Iuswf0/dMeSZ6h44BKxXRpD0eMSnh1kkRm71d76ou2Ymv
	mAoCJr28RRfq6QqEAvW+mGT/k64qKc9dgSdG79tqvK/2oqySIFdrz+lDNr4SJetQtXJUS+Zdl5Z
	0zk2xusxbKb5v+r3TAyMwsKaUXL7G4yIAAjQzM/6UnZkOw+PwLbyQM6qADq75y5jBEVTo52d1W7
	SzAS0kj3dFcZjv1uuR1Y16D8jQeplMza9sO3T0PerVPx57xm6mMZhG/+bstCWl2l5bPoHutB4MG
	VgLeKQ7KmRmXC4bgUWF4INMv6nnHqnzB934fqm/U6Qj4/mc+yRdOfiYRbgV5xUq8rbieRj56xRK
	BJ/49rjHRDn5VGCxlei1LCHqtBjuqMS74Du2edpVda7UH4xfE=
X-Received: by 2002:a05:7300:2153:b0:30b:8860:94c1 with SMTP id 5a478bee46e88-30bcae21d20mr1485679eec.23.1781692472742;
        Wed, 17 Jun 2026 03:34:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:32 -0700 (PDT)
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
Subject: [PATCH 10/78] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:27 +0700
Message-ID: <20260617103235.449609-11-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88399.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index b2ec3503f7e2..5691d3fd20b2 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -1140,9 +1140,8 @@ static void aw88399_startup_work(struct work_struct *work)
 	struct aw88399 *aw88399 =
 		container_of(work, struct aw88399, start_work.work);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	aw88399_start_pa(aw88399);
-	mutex_unlock(&aw88399->lock);
 }
 
 static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
@@ -1702,11 +1701,10 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	ret = aw88399_dev_set_profile_index(aw88399->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88399->lock);
 		return 0;
 	}
 
@@ -1715,8 +1713,6 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 		aw88399_start(aw88399, AW88399_SYNC_START);
 	}
 
-	mutex_unlock(&aw88399->lock);
-
 	return 1;
 }
 
@@ -1939,12 +1935,11 @@ static int aw88399_request_firmware_file(struct aw88399 *aw88399)
 		return ret;
 	}
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	/* aw device init */
 	ret = aw88399_dev_init(aw88399, aw88399->aw_cfg);
 	if (ret)
 		dev_err(aw88399->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88399->lock);
 
 	return ret;
 }
@@ -1975,7 +1970,7 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88399_start(aw88399, AW88399_ASYNC_START);
@@ -1986,7 +1981,6 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88399->lock);
 
 	return 0;
 }
-- 
2.43.0

