Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7595B288C3D
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692419; cv=none; b=GC2s3zlxw5cw4H3bMsj75Unr68EhGFkBO6+0nv4IDMYXg8+u6XYNK4q+s/uyAFToRvOMo3oWCu/qfbbO87BWB88hkKQIFlmKNyGNf4ya18zLUcwg0M3pEKqVr+6AbeooloKhOwFiNkb20kIHmZ6HjTEnTZj50/adD13FPEsLWMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692419; c=relaxed/simple;
	bh=GZQRr3sPIaME2wNVw97IuSX0NKDx0HvZiZq995LglkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOxFcDCR5pp0UM6hQzmqiaS9MVHN3D5pkWHsNQFkyAxkODdUFsMOFTcJFTK5vs//sChdLo7uZiJlroForqU5wsIUOp1v9AaaK5WcYts8QogAhuufNUrFe5QkZrGNWEHmwEIyl4efAb12pax+0rE+ZZ9WDZKADJkDWwdF9sEsdQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7epxCns; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7epxCns"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so149719eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692418; x=1782297218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE860yX5MeluInu/xHweWVTpSgNi/lSdv92MvT4+EVI=;
        b=E7epxCnszZoJ/TSLUOZnFex0eloZguywNgOKdwVy7Q7tz+W8mxv8Gq4wha99B67tgQ
         bDHuABmcVncUcUTMH3RVqVqnuPDfQI04osmNvQ7QM4XVEM9GCUchbuevKREAr3S5v9Cf
         7T1qY6SeSdSiCQ41xPxbBsjSJuL6uM2eGWx1gtGt7m3o5NvcOH+79pb59dd9ci3/B5cx
         neMPuRetUKIBQ8+Y8nPI1/CJb3QfWvRiITl6iO8/rQ6Tx5DQnf2pMrpb+pqIVMkWCV/D
         PlzCO9X5J2c8oAx68hGoaYYShqx0sXWR0KcsNDm1oYhM7dkn6LZEASxG4W6cOGIKERPv
         Jgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692418; x=1782297218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yE860yX5MeluInu/xHweWVTpSgNi/lSdv92MvT4+EVI=;
        b=iYHwwm9RCMyPULdDNSRw1Hk5KVMwwGl/JlSMIIF34LuQ28c5lZbJ7VNWX9U1TuqaQM
         /4o3pJ27JhdoafnkqsJHFXoKfroZnbPObXOc8VbIJTk7IENz82bLrxrXnG2Vbao1LH8H
         W+JR6W56MYgXRRRsjXo5VMFfvaLg29tuOIpU5dnqk1nxzl3D8LuymkRoxAVg8hj/Tejh
         rOJIedZtBEwbIBoADIMX+7KGk+mfDoT9vnBp9B0wugYlfzvrALbbjhBB8DeqWBe4tdk/
         zLv/sJz0wCBAK1TlAnQmDXHUC1AkM9DGC+WrIF0QOxIF+gtgevVpWzqDnGHCjISl7UeC
         y0TA==
X-Forwarded-Encrypted: i=1; AFNElJ+ng5ZBUhl1lVKVB+gsfL/cfNuOaKXjEl1+A7kBs48WEbCJTrpY0SY6Ux7eLaz6d/6tlXw1UdHAPZQ5pROHreg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn2qTpKXp2ldP192AQ9mrmjgUyBFf6VGucedqIzJ6TgnnCTSy1
	wu817Xw0fu4yPG2IfISE6JVPFRX9ab3ThvBsSQMO46WYWCqcFF5VWrjw
X-Gm-Gg: AfdE7clAc8yEsVioiXnd5NrLLRSfJgsN35MiKadtI4XAy43eu2ZN45J/3LbX8x0O8Xb
	is+cq4ckysb5AbrM2KfEBvnqsuKjrMI66MSdM1OtETGsIlwxHBdxTv+nAPT1obhQWwA+yLkevyQ
	IvF0vPi+sdMHyLLe/Qfb8+iGuTxYiYEPxAEPH4sxjD5qt7pLY9LPdqc0DWdVQiMtajU/LhJt2wx
	NwtIKG/edX5bieTe++fx+JMi4h6SJVNdU/3MQyKtp7f8Wn4L133uh8FtQ2/UMudRvIHgxqV1beb
	TRqFhfsKcBp8FESBLxUYXOnZ0DT+On4i4fOTDwju9YJ4Ltx7PSZaZ59PHeMEnlenwkmMTEle0Ql
	BvTV6xEcRyDNremN0dvstd5/Dz330iibqWp+jiJomFhOpmqelsWwIvluUyky0kwnfCxyZDgHVVa
	CvhcnlLuE7iyrN7d9Sa35GlIznd8itkrO6kZ2Z7T7lbnteiNM=
X-Received: by 2002:a05:7300:a599:b0:307:286d:c14e with SMTP id 5a478bee46e88-30bcf72520emr1179356eec.17.1781692417477;
        Wed, 17 Jun 2026 03:33:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:37 -0700 (PDT)
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
Subject: [PATCH 04/78] ASoC: codecs: arizona: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:21 +0700
Message-ID: <20260617103235.449609-5-phucduc.bui@gmail.com>
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
 sound/soc/codecs/arizona.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 8c683b0bb74c..77bd02def9c7 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -1158,17 +1158,16 @@ int arizona_dvfs_up(struct snd_soc_component *component, unsigned int flags)
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	if (!priv->dvfs_cached && !priv->dvfs_reqs) {
 		ret = arizona_dvfs_enable(component);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	priv->dvfs_reqs |= flags;
-err:
-	mutex_unlock(&priv->dvfs_lock);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_up);
@@ -1179,7 +1178,7 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	unsigned int old_reqs;
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	old_reqs = priv->dvfs_reqs;
 	priv->dvfs_reqs &= ~flags;
@@ -1187,7 +1186,6 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	if (!priv->dvfs_cached && old_reqs && !priv->dvfs_reqs)
 		ret = arizona_dvfs_disable(component);
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_down);
@@ -1199,7 +1197,7 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -1222,7 +1220,6 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_sysclk_ev);
@@ -1657,13 +1654,11 @@ static void arizona_wm5102_set_dac_comp(struct snd_soc_component *component,
 		{ 0x80, 0x0 },
 	};
 
-	mutex_lock(&arizona->dac_comp_lock);
-
-	dac_comp[1].def = arizona->dac_comp_coeff;
-	if (rate >= 176400)
-		dac_comp[2].def = arizona->dac_comp_enabled;
-
-	mutex_unlock(&arizona->dac_comp_lock);
+	scoped_guard(mutex, &arizona->dac_comp_lock) {
+		dac_comp[1].def = arizona->dac_comp_coeff;
+		if (rate >= 176400)
+			dac_comp[2].def = arizona->dac_comp_enabled;
+	}
 
 	regmap_multi_reg_write(arizona->regmap,
 			       dac_comp,
-- 
2.43.0

