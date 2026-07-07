Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5422379C37
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401086; cv=none; b=MTeIddDv1y7cJUpbxdxr52a5HO7xJHx5fwiFccJ2f0VPOMVRJ7GSm2S485BDnJ58rq1B4GAA0r9LfS2nPWzErt1jsFAG2NPQO/ngCEJiJOPl0QNEoKvahANnmafGC6KDGXUZ0h6CZ34AVB+t/liqQEsC3uHLW0BChpxwt0itcSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401086; c=relaxed/simple;
	bh=mG5pRpfRueqPRsS1UnGChfxPg+7TVAQuLlVgN6Molhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p92q/StLAUAoLen9zEyV/xOetde4dOtqrSUhyER9/Ub3nmL4yxtM25Z/m1otGaeZeOK8Wc66pRGfowjpVBz3eWK3ieSfA5udN89GifBaF1wMmT9vEbfhsC/S4HC5igCEPhQbOu/fz0UIajdgwu5Uh+qJPB12JK6VdbgK6OW0mjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6epJeTU; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6epJeTU"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so213342b3a.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401084; x=1784005884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7IGUH0VtQ7qJ0ccJyHWYquIdmNZndl5qSSw0oJlA6k=;
        b=n6epJeTUANco60SDF7WyY5QZb/DQJJY8+32Y+EihAWGjPZG/J8CI/3dQLdibkkoXcA
         v0DqkdOxl5IV8coSqBfXXto9B0crcgfPGwuf9OOpMH9CwSiQbcl6Y1UhGLFOoHymiOOW
         DV41K9KX/a39nFgzFavH9TkHIB1+Cra2rHzx6NtdhoNKyE/k3lsG94CLOhRPGEAqEL1g
         mbjHRcSVNQAAiKyC9uOn0DfAwFduGEtuI5rNxVXzVfxYpt1Kb4A61Vw57yVfa8nsqUiY
         s9zdQiKJGNJMo27DdF9jSxI0C8aCmw0tpN0DP3BXVV1wd4FaAnlQOFtCIgWc56dB2LC2
         e+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401084; x=1784005884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b7IGUH0VtQ7qJ0ccJyHWYquIdmNZndl5qSSw0oJlA6k=;
        b=Wus0vRwRzE5MFcFs2O06WkTw7O+qXbI8n0oPMULei/tjY+omqmg5o13XM4qMIFROM3
         VJH3Ue/7QOjhFdWD9zkaugG5jFEgagIJbz7bDv3RPt6TFZ0Hwl6n6oOqJbkAYK9oKG4f
         eXPyZGPM/Lfz8lZAH+r3URGrtmmcM/y1XPGkIpiMixOdpSSDZM0DEzhq5YavYqn24XJR
         L8xTR8Zvw88grg4uoHpEAUul55CuOe0pXJGbpXhYqnyVf4ytlYcTKb1ZgmUsBE9USh0l
         CAEu6BTd2V4lflnZx/An34EtZn2WudaVaRwHE5W8Tqw9Izku0IZsDwVyTgxR4bdzUmSg
         qsQw==
X-Forwarded-Encrypted: i=1; AHgh+RrIhvWnuy1cCWw3PPHtpLG944Tpj8TBVYoL3gtcXn9QMnrZc6E6f3DKHlenFcAvdg8/CHfCJDvsT2AGO0WmYS4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEThsIss0E9tsOUAHXmSGRQOVhG1Y7ustRtCLXEOF8WRMsHD2k
	GrGTBEIISmdUoYv5VycpoIXaGc8xKtVtDFBASfzuIRZy0F8TlYhNeMiL
X-Gm-Gg: AfdE7cnNjn3cEfwPuk7tC6jDam4ycYnWJS3g77uBYCpJHsMYP+9D20BiqkljDpfa/qi
	Nqtdclshos1pZH09Ekh96DTrJc+jfiBLpGFc1roUbtEYHV9FfGW27CP7haoBK/nxndf2e4eYBBZ
	wv8oQFN/aty603WqwMqV6ROFglwsMm13L8SQZN6nhkcNzMAtp3sRyUSNT7OzuQbr/ZQQ5Wd3Qwe
	NUvINx/TC0gPhYhhJPtNnGOdZEEJrZAKrxc4MXUs0YUORGGf2/AYFMlCtnxzobgYFxClJRstMug
	zZVrphM+5fsBob4t2knns3JMpZoqlELuXE0CyLkjWGDdudowVYgOQPpdoMi+M/qT9IDc02LF69X
	Uy1QytLQ7Rlko1GcR1Rq+e2P9jWAiBeRkGUb/BblxgIJCf35d03xeBcoNREr97xa+kN3eloeA5G
	jKupKNAR6iqjeCPyP/ESCzFZVh3MIafLZ2grR3bAIyaRf+Ymd63n+ffXf3lg==
X-Received: by 2002:a05:6a00:f8d:b0:842:6259:5e2b with SMTP id d2e1a72fcca58-8482f5305a8mr1211855b3a.33.1783401084160;
        Mon, 06 Jul 2026 22:11:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:11:23 -0700 (PDT)
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
Subject: [PATCH v3 06/24] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:48 +0700
Message-ID: <20260707051006.20058-7-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw88081.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index d5e886a8f106..a3cc027de606 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
@@ -763,9 +764,8 @@ static void aw88081_startup_work(struct work_struct *work)
 	struct aw88081 *aw88081 =
 		container_of(work, struct aw88081, start_work.work);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	aw88081_start_pa(aw88081);
-	mutex_unlock(&aw88081->lock);
 }
 
 static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
@@ -942,11 +942,10 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	ret = aw88081_dev_set_profile_index(aw88081->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88081->lock);
 		return 0;
 	}
 
@@ -955,8 +954,6 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 		aw88081_start(aw88081, AW88081_SYNC_START);
 	}
 
-	mutex_unlock(&aw88081->lock);
-
 	return 1;
 }
 
@@ -1165,11 +1162,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	if (ret)
 		return ret;
 
-	mutex_lock(&aw88081->lock);
-	ret = aw88081_dev_init(aw88081, aw88081->aw_cfg);
-	mutex_unlock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 
-	return ret;
+	return aw88081_dev_init(aw88081, aw88081->aw_cfg);
 }
 
 static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
@@ -1178,7 +1173,7 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88081_start(aw88081, AW88081_ASYNC_START);
@@ -1189,7 +1184,6 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88081->lock);
 
 	return 0;
 }
-- 
2.43.0

