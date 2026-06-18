Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B250D3F0A8E
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781004; cv=none; b=SzjmQs113+rY6Gescgt47tlwZT0rPzPM0AO0LUMThjeLdQXVqyqHq/Q0f6Pov9Te4XaMjBI0WMlTwTyYMd8Au6vMqH05AmGL8IPDlHeF8spfseYEb+wmUGr5hk+HWIegTxh8kMxQXrJVprcChfmbFOLYLZMI8SxgbUhNK5SEA7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781004; c=relaxed/simple;
	bh=r4nP5iq5srzymqWd5sW1nNO9Ilz4j50vuTzEN76jxq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIosT3jeNw0KQQTaWMVshcWbG39c+UvfdjkoGeNHoIRmdlroWCGt1jTDhdnx9BJp/c0TScepR94be2UQzoaEPTOsU+GNjQzc6XMuOCjXzIInhjmUhn+FI7PlqCdMV7OoPLY7Flck2fQn5+HBvp56unGObMfIYIuh+86ubknQBXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVADuLw2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVADuLw2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf22d29dabso5162585ad.2
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781003; x=1782385803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=;
        b=ZVADuLw21WhV0y/5bZDOivhWKdb35CkxA5xxqEPxw82ZJdEpq7gKqiBD+panJkPowB
         ZjfU0YHlop6hHzCwj9CEisQPcyyRp+yGJQ6yVWsaB3LrI1OZPqmW1KxyvQxiKIJwKDOl
         x845XmJk2TiSfnxfLdeLSgpgKw3VebYT7pDhTDpzitX4QKm/GVLQxuOf0q9D5SGkVcrE
         6BncuFyVUZ96opTvMqrVooDAuUFvm0CQoCKPFEbSO7dQ4hG5GOGWJ4glONhpNuqh5ay9
         FtPODEqMbiquXd1hm8o6Kjyic6ZeSPBSg2xalH7lgyGlGzIr/eTYsQ3U0mjHqy9vHUDm
         tYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781003; x=1782385803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ml8Dfg8DiRS+hvlcBV4USOy9unLoDNhfJzJGobm3XwQ=;
        b=EsXiy4lRHKSdg9QXUtuif0/DyEW9oIqXxj1+ZpujSTOUub8RSiC8FZ+As+pFeDwvT9
         ZoGY4UryxuEJhxh7o/aCLTzkWqSAts3YToX2wNoN1/KPsiMWfsjGG3kz4GtS8vjgy02H
         PQtEakFFQzIQOKcX4XZ79PI7zMG0ql6cJkmMU7EVunvrODR30ObDUH1j/qmj9hxcyPAT
         nKWuW+hRE1KQQabUwbl9IhAcn+3wyu14BDOCjhyVmH4PWiYa9aDi6gMHKkIl+0FeZ9gY
         t0DMxs4IgLaFEltYG0U8j7bjdnB0b3CSybHZ5tzGGL2M3b2QKfVXZvZbaH3OTvz8cm8w
         lWvw==
X-Forwarded-Encrypted: i=1; AFNElJ+G2XGpWVBiSEfq4vec4ZTO9ymuKDUVLAyctBIee4AiRSFyyh+GN1Hbq3KuQ1Db+dmphULAmjPDdykoiBUZpOY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGTrh2mXOmQkU5mvZRVAoTm7fem3TTsdJhnauIJMsKeYqEf67l
	qWK5c0Enow2/WWlVMsezcQxKdTWQ2yqZKZZ95NebyE9WxwfxLxCCsMGn
X-Gm-Gg: AfdE7cmBVlTvd3M41wapnfJnH998aKW2yQvFhCtGS1FSQO8UB8Ue1EgGec93sbk0tpP
	gdavIcOkfTJu5tWNjdqhasJY28IYFfvuWR5cP9uPcPUAusGdrLiJqdkHcd6KIE0jJGw50ON25cX
	0G4+hkA1baKC8Ww1R1wgsS8URNrGOITnVS24vzkXHDYP+uuQloP0AWqSd988xeVd54xc/+5uG2K
	lefR9b9divbtUe8O4ittxu3uENOxZ6lETR3UVCsXhmtc9qscTQqNqgVmLdpXSHIhaAfV707AGfF
	Qw/ZH0LOhcKqtCKztgAFygdmzaVy+5Mt1V7d3WR13EsFFFtF4K1/YUIfPXvrWiKr1HIstVwNlQk
	dVK0NDKIhFWJXkjUckCnL0xi0qXT4kUCOwqAPffzJnVbbVjiO+69nlI0aN3ZlSBQPTZmOKVJsOD
	PTZd8qN65LOkdl6UyhSXIKHKHUhDG25x7kk03WmgF9/1azQL0=
X-Received: by 2002:a17:903:249:b0:2b2:ec46:dfed with SMTP id d9443c01a7336-2c6f347409fmr21914825ad.31.1781781003000;
        Thu, 18 Jun 2026 04:10:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:02 -0700 (PDT)
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
Subject: [PATCH 65/78] ASoC: codecs: wcd937x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:14 +0700
Message-ID: <20260618110827.232983-9-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd937x.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index e0169e783ee9..8336316866ea 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -1056,7 +1056,7 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
 		wcd937x->pullup_ref[micb_index]++;
@@ -1136,7 +1136,6 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		}
 		break;
 	}
-	mutex_unlock(&wcd937x->micb_lock);
 
 	return 0;
 }
@@ -1460,7 +1459,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1475,7 +1474,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -1490,15 +1489,11 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD937X_MICB_VOUT_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD937X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -1519,9 +1514,8 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd937x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd937x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

