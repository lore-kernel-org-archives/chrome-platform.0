Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614E843E4A1
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515184; cv=none; b=um0EGUf3n25augVGo10TjodBDNtpjxgMADnTwjY+T2vL+APPX8oeDPJZdauEocgh3lHyopW3hloiHXb+M3rJv0Qy5RcXwxeCXkbA2wrd6F3F9nscwSMVyoe8K9WoHGdEjCvUMtDZz6UK0PcNOXUzC1AOK5/Ap89d6xgFSKr/CRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515184; c=relaxed/simple;
	bh=myMc8cB5TZmyPAjZl2RU5Pqsd/fh0JTdU74J2r/32DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKwh6rAQNt1RO9HCpBzDodA5F7RFL7/Kyb+4rUvB/tPyKk2aU1yYJG3ngnNzI2pAfrfgGJ4s/6oJzTGbcOBR10WVIhFHKHs3tkFGQqwPGY+BC/oQkTjK1eAFtYziNj0zwRocpsH2oT3tgXpgq7iwm7iusk0h2mBW3FlUDkHFqHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eum6+VgW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eum6+VgW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so814447a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515182; x=1784119982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=Eum6+VgWD6ZArPm+j+Q3+hOUFEV4gFXR+NPBKfnMZw0kLAaZPRQrAKjZWjVijrRA6p
         I3zSZz1ErtqELtV7xFTpK/sY+zSMdnNz4RsShjzsjQrigtWTZtUyOLfLiWBdHRuq6mtC
         jbArmwWvQ9OO1pHFIMLednmGf9jlwAELNfde9Ypm1BIepo60p3ka9X/x12n1VbEsjH3O
         Vxa3ei3OK5aeh0WTO4sq9MD0G99Phk0/Zn1KD1Z5Vl9922T7Wm9k12aSNPQTm0ZCyZoW
         U0i7tZneTndCiPs9lJvNJFnvUho0MeDcLNNXzO8H9LaxZ0vJNbSSubHwQTulmDAC5Q3d
         e+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515182; x=1784119982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=Zh4jfv0kiAZDfrCBN+IMWIBuvzfZj45AKR/KmUxZ4ZEAnFUwKJ6/3vddJh6Od2isxn
         jMnb4MDJVj8FVlgBAIC+lJusJd5kmFo26m7L4t5rJJylgV8DtvQJBQhRGKJrOUGBIwwF
         nc2ud1fSLL/XPzT0PQf8AcmHhXY0Jgie9V5JEICJqwKj4AkGZtSkscK6YyyvU2X5rMO4
         wEoBt8LexuvbmvgzQCbNX3dAGs6MQ1LREP9LNYnDdBStK7Fpx8VvYB/JI58Kk7K6CfaO
         z1XHNkvBhbKXvCdvDozfKDaqy4+rRAsSOhPjtwDotbJERjRlP2UwGgQnOcj3H+laZWGj
         E+Ww==
X-Forwarded-Encrypted: i=1; AHgh+Ro/CtNUO2w95xGgPSbjQGUimvBJjNVysVeAmqFiv2mltpaahMzR1LbQp7w4yn769HvE5907gLrcayvsHpNNYIg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7KBewWHFf8L0jwNTkM8Ho5cjIn4Kf7tPsrpHHOAgzDGXBCQxZ
	ML4Oz7dMv6IpccVQ3Q94KGQud42cDi7kqvHw9Q9lfwHEg0NMJTRbqkeT
X-Gm-Gg: AfdE7cmFTxse2znmh1ymURyDilzTlO9FYE74WfAT1VcoEx2MHQIAUUd/cYQ7AuS1LhJ
	9nMssNQVHcR3IYNdtybkJkBvIWQ5twyO5aBOvQczNnEPoSJuyCn/ljsDzWqNMluoNTyrsu8h6yp
	kIFm45sHuc5HDpNNDQP2giSqOpK1OjeK69rkqehBKu0g9MYTPmkI713mJ7bBg2mEC+VdnuiToP6
	f/ELIJfcEnNlZ4FjeYPS530z8ihxxC5TnO96evLfyUj6ZuN3wAeDIZnAu0tc4n9w+emU4Wih2X0
	5KSfLbCjy4DOz/EY9V2l9Dbta2SyQTg6m2LXCnUw6nwp0GKzkNzGKKzrfQNPoD4OYSSAYPm/dmN
	SISR8KQPg67jDG+ZvKckGLM6XItg476gMvMG1uBwSrZXgeMhG1DxSsFz4KWt9otxjtmvgpZpydQ
	lDvGoLKERm+rXH0JN/dtO4Jzewl+uD5bQq8X5uLo0/NIVYsOM=
X-Received: by 2002:a17:90a:da8b:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-3894053d0b1mr2454692a91.16.1783515182657;
        Wed, 08 Jul 2026 05:53:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:02 -0700 (PDT)
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
Subject: [PATCH v4 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:57 +0700
Message-ID: <20260708125002.202515-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l85.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9ee60616c04c 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2504,9 +2505,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2537,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0

