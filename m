Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B277D42B31E
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515065; cv=none; b=S2d43swGD1zC/u1S1Sb6KreE9rhL2fNYDnCvPaDbkijKVB1q/1qQ+oaKZBlmDOlfk3V7RlOXcJ/ngdPdc9Q/E1iUADzH/goDFAAFc2oSe0n5SmCwpiRPYi3WquY1cuj0BS13ighOLBg8p5eMOT5aEs6VIJIVyZ3grlSL0HGkJtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515065; c=relaxed/simple;
	bh=6FLcpNOV0G/lngFmbaJv0KBbbNvewbSjUbmrmr4SBjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/oro6hPTWwgs3wzZQfSPTt/U+pixsJpS/HeqzYx0s8a05qtvjB5FYC51Z7kGl5MWNM5HKmEs7ZNSMxOaBBe1YN37dm2fKCAblZeNV5GfWUnJ5xrBVNT1/ZGDFxEYVizXSdQOz/shPAKIMbYqy+ETNWDzt7W5PieaIhvTauGRGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGBwbNvY; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGBwbNvY"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso728430a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515063; x=1784119863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBAOGNDCN1PJ4euWIObvfkCj8NKOo6+NOGkAVEcmjRI=;
        b=HGBwbNvY1+nVXCVJ6l3R/rIf9ZgA2+xCX76PhvJxRKebghuTEyXcAvsFjHjdqBeKiE
         uhzDjlV7I390Lq80kv86ejLBUR+vwx3p1wLUE3d1ejcfFh1kuy7pEq69eJTsFA0rtXgL
         j7noJcDzRdiYWJz81GlyfBGUyAlK4zjhN4lPa0A5O5mlGKvCn/5dfV6HCNaLUbmGRM5F
         Cww2Jmrfkb4FuskhWrkPsH6FiNpTt79fjCYIClglsi3c2hXO18euMXDP6ZfhipFRnRSU
         KZo337/KOHpwEDgqxGyKg+ojipckxGKT1HI15a0sMcpOGZko8L3MxLlCbOUA+Bxc++TY
         sXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515063; x=1784119863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBAOGNDCN1PJ4euWIObvfkCj8NKOo6+NOGkAVEcmjRI=;
        b=S4U70tGEwWmoVSiE878smn8CvI/6xPJWkhRZYM2Q9ksoBm+DBy8f4W29nfBt2B0cNt
         Szkaklzgg6e1lw4E7+QcGp/8yv5+q91wXvpZiYx1Nx5006XCXnjuYHiE+R9LXzphN+jI
         EvJ6Sf5AvnzKZlwXErdEyNBzdqVGE8T3vB0C9jgNM4feVz2baRAcMc0G0sGcrwH2lA/z
         6Pl0DjfvVIBJge9GXXe3p1PxREY80pQV/sluepjivih94l0Ei7cGW+Xb5wp2NA+1o6ER
         YjIQD1ty7/G0EDmYWbzpPiyok0pQPYLHYZyB4tLYFs6EqttyLu/Hn7+04yRS+kAbbkri
         5elg==
X-Forwarded-Encrypted: i=1; AHgh+RqLDVpeWcDXV98wCxDwCHSde6tdiqJK75wOkTivOjidZRfc0vihFA5VHJxX3Z/FDjBnof/AtOTYWbE78abH5Xw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQD/3DnE/+CLRNekC9lLHxsFKDGFOtANSlP2xrpErPbe0RZ61X
	fuyDKXM2bxPKi884/5Rd4tA3Zq0XSsWRSyacT11LX6uzMIHNb3NW2K3O
X-Gm-Gg: AfdE7ck99kQ4bJ/CCQr//O2f50vL+0Ra4ucQ5GL6zQ1zWrGPTWApdF1QHo8PhHdPRQg
	hgquykxq6oZVwZtyI7X24SjuNdeQmPjOElTNvxDjYmzkYt6XMWMGGyFA2Xe6Ch6OwkzeTcS2VKJ
	BD9TS8LeafOWJvro1dAmwVa7mZbIfX/WtlFsr1ZLzmxZW4G2c9qUpUHWAvi0LqeKrHZpVeQwLEs
	fR/R35ah7uacWm0fjl9QJUVdON83Ag2fFfLyn3wEgCizSLmSsUvHTKQ+INLfOmMR65EggFKb3fs
	xTD8dBoBsdPlmbD1Se9z90GX6GxvJIgCMPnGpFsnFzLrZXbfV/gKCaZPwB6Q6ber7BYTdzLzLSe
	fpwBjfA1WYyHxw3oyf+6BhkFaU94XYy0vPyPIn4N7TTPC+FDMEq1FNZ4z2XMgp0LU09Yb93Kc5+
	AxXhiT7EK8llZ9QCJ+stI9xeSSS6ZIQOLdLRSl/1I3wS5o5RA=
X-Received: by 2002:a17:90b:5845:b0:388:cf45:d72c with SMTP id 98e67ed59e1d1-3893ff6309emr2450019a91.15.1783515062917;
        Wed, 08 Jul 2026 05:51:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:02 -0700 (PDT)
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
Subject: [PATCH v4 04/24] ASoC: codecs: arizona: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:41 +0700
Message-ID: <20260708125002.202515-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/arizona.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 8c683b0bb74c..4411165c3734 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
@@ -1158,17 +1159,16 @@ int arizona_dvfs_up(struct snd_soc_component *component, unsigned int flags)
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
@@ -1179,7 +1179,7 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	unsigned int old_reqs;
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	old_reqs = priv->dvfs_reqs;
 	priv->dvfs_reqs &= ~flags;
@@ -1187,7 +1187,6 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	if (!priv->dvfs_cached && old_reqs && !priv->dvfs_reqs)
 		ret = arizona_dvfs_disable(component);
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_down);
@@ -1199,7 +1198,7 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -1222,7 +1221,6 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_sysclk_ev);
@@ -1657,13 +1655,11 @@ static void arizona_wm5102_set_dac_comp(struct snd_soc_component *component,
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

