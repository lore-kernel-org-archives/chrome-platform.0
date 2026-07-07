Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF0E3812D1
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401216; cv=none; b=Id2bTubk8/H6GwalMh5WhiksJ1hkcwue4cdnkATRNcZYY1cYjfs4dLy1Bl9FHHOF1DHRwJB/BwBAbPwf4v++7flTKmhuNRQLQ2gPc3EzZtfzo4+M8moQJz3HxDpoetyGMC+Q63FrmJeAxMgZGTlMs2Mi9v/PjviU6Qyp7eR9rDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401216; c=relaxed/simple;
	bh=U8XvbxSxSkTA8/Iu4yHaWeEwL/aIo8CQltei/BWFXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQdDyNldGX86ceW+ZZSt7qghjcrDcKEHQ5pSXHvUBt4wKMv7+S8TuB0Znms+tiZIhri8fKKeBJuRHDPRoucrNflcevNnd8Eb9KGV57kfqpPd/jm/LhB7LM0MXniq87SPW+7fCa9qnsOegHsNeDY4MXIOcFwo6czs3o8yeKVBY7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcxgXlPk; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcxgXlPk"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84783bce476so2716657b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401213; x=1784006013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ov7owr1xn+j7m+V91q4r4G+6t07sw41en2G6nbW7Mjg=;
        b=IcxgXlPkP5d0r9JYy+91N9y4ovDVJDb7CbyPsHg+y1xL3/bVdZ04CzLV3CqWcxHPRj
         JpoZAQfjRSPMd4ke3RW77YsRgBHb5q+4lNy1GD3r5SO7nh9HEW0PCKTM1er8iOq4OqWv
         23Z1CMK0m7Ppr10egJACbTssf7dhnbo1/hGJpjs4QlNZxIJAic4YOpP+cC3VbgR21w3z
         bs/0hadwKVGJCuKCznvi/VZLbIGR/Os0Mr6oYRuBIpwORsjsDRhvIqcNkU3jBQa51FSu
         cWKjDMqRtqhSMGqti5LqF2bDdJ6czB2ZOvoR48xnhlPaclKJ26S2gI9RsZLTTmGA/QE1
         Ucow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401213; x=1784006013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ov7owr1xn+j7m+V91q4r4G+6t07sw41en2G6nbW7Mjg=;
        b=XGDphE4TWcZz61AClI0GIiBWT9ij8ylv9+Z/hdLbDbDwA4MDsv48rO44q3fzCzyKeq
         R1QDeajxEG93zbNhIdlx1RjZ4z+be/uhWURxLqcO+5z/t0oOQkfjPEUfuzXNfNLbH7AW
         j5Gru6pVSHU3OkKfjmTEQQbM5tYXtl4f8Bv2v4BLhA/OhQrgd39uTR7A27d20Ot1m4wM
         RK+MSzZcE8SFQH4F2PVsylEFYzw8mL/6VaAuY1rUWsSBMGW/SMl9CPYJWg7iK52ZqFLL
         jhUQM5PE7NkhD9intOlcrN7oj9jwbFVTDvqUeMu8fWWFl/Y3iNjapLVEy9F2k4VNfyuw
         nXJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqX0kk6mxWHX5NDGFJYDzG60uoR34atlOZC6SwI8ibB3cKfB26/QJ4KgwtBlgnlecdg/d9S4HxhfXnYLhr3jL0=@lists.linux.dev
X-Gm-Message-State: AOJu0YydJh9qtQ1aIXjAygb1X8S0LLkZlzQXLsgDiCkL6iwuOMBPRiLa
	BL34v7TPLzuB542LsNuAcNTUTI1rFuXVJy/uleCI1YcLUK0CCPP9CUs0
X-Gm-Gg: AfdE7cm/JAzHiusygFjWD6lHY+at2L4D6aIlVVahW6vzJEpfoFwJbQXBWOsTzVmePFt
	9Ycvl9WIqwYMeUNWb7sO4UkYg+n89dfEskwogBLFqV5Y0DdRs1tcsw8UtbEvRNsbuJ+Tb5cTMVo
	QfNj9FBrs0htniQfCi+1WaZNpcf38KDCKPkrkl14o3o7zuNhxoNL33lJ/xp2gWJfyZ2Bt0VMi0Y
	I49TKavXxkzhRbUkX95Ex4BJxjDs4boaLM7iofdYaaGwj1D4/iN6E9y/Yl9jaRrln+3pMEEpLlH
	4qpquSMJd2Dlve7nU9yndzFddjXuxk+MPw8bkrz0cFucA2JWWCZtcLGoo4fHdKTM1dqPehr7/HA
	u6g6TOCtWCG/52WmYLS6JV819Mf+RoOCzXHXKL5B+IxGQ6M7S/ka+hLQY2oeYRR+EdLVJOSZ80+
	gWoIqAB6/Sr9Algi9zfZ/RVBRAes+R7nHzye8gSjc2LvTtq3U=
X-Received: by 2002:a05:6a00:3cd2:b0:848:2f84:f428 with SMTP id d2e1a72fcca58-8482f8504c4mr1181064b3a.65.1783401212749;
        Mon, 06 Jul 2026 22:13:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:32 -0700 (PDT)
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
Subject: [PATCH v3 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:00 +0700
Message-ID: <20260707051006.20058-19-phucduc.bui@gmail.com>
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l15.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..2f30dd834709 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1285,9 +1286,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1317,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

