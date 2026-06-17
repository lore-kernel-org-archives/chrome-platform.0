Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E323930674D
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692391; cv=none; b=Vo8H+Wm/SRMqGjZ5XLokHclzfW23aFxWlpXqjeiav9ESWbypEVGRkFAyxaRtwk5rvKoge2iwVtQQ/Dbc1CiwFXAx2m64PbMkcOKdsYKsp+JpDGJiGcWVjNgig5/IuQhzIh2I13ukdhwTZTOcheZt6z1zX7khWDA5u/6WGFfCu9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692391; c=relaxed/simple;
	bh=wDcPckElgAa4leEaZuFHYXPup44IDtUb56bKeLoBSxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JOGLpNj2jTrA+Wjhy05mAklfEPu052tk2iVmd2ITWDjvbF75irivcPNhJNNIUOf44OXu2j/FIUnjAunfemXiXbJzyI29rifKrfvC/8z231b9BeNnxzroS5nYNA9UC5zMM6Fb1a/ahkXPwOE9znQoDBlDKQ1C9fh6L0IAHfj/Jjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/eNRwcc; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/eNRwcc"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so2331916eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692389; x=1782297189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xBbIRxBXS5OYYxHEW50Za3vbeVn2bnT2ZgYpZa7ur4=;
        b=Y/eNRwccpHhWe44KsXzfgPP2c8Hcu/YuWM3IZmLQnDumnqDKX5xxPznNyJKXJY0xpW
         pCscLzFPX/e4rcdtKnBZTgl4hPY6+wTxxNi4HyHIdMmCkjbba6XnEmJ3Ip3X5vobb6ag
         LUS5riZ8A9uRrgFCJxDy8+rPiYwNnyZ+0yyaQmEKJPc34fnz22B34LmrZldeqGvzYL4x
         RVA9RHQFTHDQd/IZ9346nwV+knYC7Fh+qLC82v52p1xQJLyXehQVrNounyrbg3KGeFQ/
         jNTqevjWwhlaHZ8Ov9lFAth+S3OdQbLkTajz8c6nmPh26strMhLdisQUuXpy2CmUsyMZ
         angA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692389; x=1782297189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+xBbIRxBXS5OYYxHEW50Za3vbeVn2bnT2ZgYpZa7ur4=;
        b=Y5XStZX0gL0ZbGqNLiBYz8P0aaNOYxXl9Vj/OX7oENrr4IONmGpI/0LP7dzC/PEAv3
         ZKz+3eyZdfYCqayHSfNnPqtrTAAUmrv9FQybgwUPeaRAWvoBNiSp6CGEao4H5aj3+kim
         lZN+HN1tqNa4ydpeXbRsWPPXIZsjLkXuiC8Rhf1ePrO4lOFCo2/DAg/s5FbaPFQj/Ktd
         M2ifZ4WARwJPpKBOqnHduD6LCY6tGw7Ut3eqX7/e50Ask5yZtRcj3YV8XA86lXbHAs2Q
         g94V0IXkx+kn+3b0iHA9OD41CLAVYSKzip2NNwodv6VdKdoWeb/rGB6q/AgA2W3U24NW
         cBPg==
X-Forwarded-Encrypted: i=1; AFNElJ9f029uZJG+XN2SVDl9YvykjMmpZx9DASvf6f/AElim/24FgVqaTNcZjuJAQUCYf3tvQs6aWcaZI0EUOEIfSHU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxwpjpi6xpG3705TubIVTMRmx7QJX6VIwAWpUcOmX7InQZIYBW6
	WFFx33WZELjttLNHBRoqrbpYorGSgKnzAMDPWVC7fKTyHg1ojb7aEq6j
X-Gm-Gg: AfdE7cmJMJiLm1u3Uhn7/IL36TNVNlCTkZmsOpDyE2wE9zPwl8NCJujz1F8k4CDO0q3
	z5EhUxYxYejZZcuQ10mL3uvJi8hzdQrNMjz8WcfMhb6WynVLLgd4D/USPeawhwrLgCRlxFaFLOw
	MJvQAE6hPRI38M2z1UCdgmFvvcQH+6CjYYN5K/dQ7rWyxtY174H8SJMvmBqprJYWcsUDMbnoC4W
	aTnU+whwCKv56ecA8o2vB0LJfyeKzZo4Dq0HjsCb4/mUq0RPcX5DgJJkpwQN4uQ0cYBjDjA7D5x
	uQMpvaLaz0A1w7EuJInGfVmLjKAIhCFlePDYBE2N8iid/pn08i9+NMQZbQCYNEAUMOLE6pF0RqC
	PjZLaPqNy/QENuRZNs31fepoTQFsQJ0J+zG9LKj6cEP16d5aq98GqAZuapM7Hcof+2DfChZztVK
	WQ8mkF923mQPb+NQt2eivGJSJliZbJScwWA3B7MzioeFitFYY=
X-Received: by 2002:a05:693c:2d94:b0:2ed:2942:34ab with SMTP id 5a478bee46e88-30bc990c00amr1603108eec.3.1781692389024;
        Wed, 17 Jun 2026 03:33:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:08 -0700 (PDT)
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
Subject: [PATCH 01/78] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:18 +0700
Message-ID: <20260617103235.449609-2-phucduc.bui@gmail.com>
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
 sound/soc/codecs/ab8500-codec.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..20beb830fd62 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -989,9 +989,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1013,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1024,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1043,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0

