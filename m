Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B623D2FFC
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454473; cv=none; b=qgdw5zjYmo3VV2jBV0zgT9P1zsEDAughvMWa7ldnim5cf2Lw3ggCPOpm7Z1V322DVnpf0YYd7YyKThMQ51JG8AycQyIkMT+H1wUmDZDxK2Bt5y116nY4l9ReQ7t/zJFaeK7B4EgwWIkU4R3mn4soT+JBF3ocFhHrLHkYNoJ8sYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454473; c=relaxed/simple;
	bh=OqNQ0wtsuuL6+CNsnbsafgnka32swlgaGxVNsspVsn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yd3utUPiFmkS3GLOYc+wCUNPd6B8rmJT6j1P1jBzj4cewmgLKe4UH4YCmrBfwXxfjXTEP0EA/8ZWrbjadD+nW9Ck/pT8LQfhPe+V4R13iPlBwgcl2bPzEzEAMmDL1aj5YcBYslphxOVKyGiG/ttvxnih39zaUOl6yJQYaUA56TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cN7cQVwT; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cN7cQVwT"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37df72c9984so296536a91.3
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454471; x=1783059271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntmU0j7UTDsaoP65JVvadIw5ilAlCiOGjFq2v2/q4mw=;
        b=cN7cQVwTMGP2vubRbdZB41JhBcz+t4U7Iy8Wsj9OQrE2FCjB6xbPU3fsZK6xI5AgxE
         sSFw/BdytUPdw0l9KJT+zHUw8Q1jAZoKHGjzbzeHNQIFFIGiAt8IVgMs+H/+wKgGmOby
         0onCac2ojTCit8eZPy3aJBInU4GtFwuZlep31TVrXaAAMpgOSkNtsREtychjjX7Areo7
         gkDes4NDrPwsycyHd2cWfnTBF9AOay/KKMeFKx8IXaykqiEAw0oaiUvwUrAE9SBr0bn6
         iY20mhc6RmN9OV7DAzImDYpGNwSvoFvfjO1YjaCjTkVkrj8AEXcaVNqBv5dCEk3zCTlN
         8+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454471; x=1783059271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntmU0j7UTDsaoP65JVvadIw5ilAlCiOGjFq2v2/q4mw=;
        b=h1mnYUl7h7B+WbY9b7KpLgdGfrdXOa2LTUcxyvH/cb6fl8daW6rswm0kcMwgppscjO
         ACHlz8yMlaoFB6FUGAOZ1jCdqUsL0VQcfPv6/6J4JchJKfsc5IuozJtGVcATYkT6ZDoL
         pasP5N5honWw444mjiBh/VL1XHafhcqNgClZi4+PCP4rC53ZgT6uWZEFqoee57rdFno5
         WXEHqFt7VvBvi/wnavfvj3DONumLQm33t6U/C8GHIG2jsooLP5ltjjSbA9n0XjyEgAqQ
         GlZi9ALYgkOP3Ro3cL4vCu3ACw25KidjshFuQovtzusiFCndLWCzkElXDwvYyvK3wCdq
         dSuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJHnSs3NunXeKXLVZhYkI76DyBGPhpNOLTKOfh+9ZS2W//s2kCz0eRxTfKhEYe69jDnqyD8ZUullVLGlNRCik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/4udEYPUNweY33yelVUII6sEUkNDnhlhccP9cycfX/VRRGbt3
	tVq+7lCDsbXzr7zm8dbmoyr241JAT76LGYuNmQ0tAINMFigScpaDF8M4
X-Gm-Gg: AfdE7clUVJzlueR6chcs1UFA/ehsT5FD5M7vfFHG1g4YM59UfGZE/ehIDRVrIyGzNi4
	scMFle1hOaWu3K8PS3cnNWP1VyGPwPI+iWPRXdTlYCL9ScuvNp5FGd7ykOE1pzNqbqHJR1RwLg0
	N2FTDGrfat137h7P5bwyeC7wTmQ4wNjI2hKkIxJRc5WsEoFU9wKD1eW9LpeYsN0qheasaEIjU9V
	JnlbBNoEG4fh8r5Zjc23z6L+YzIepuTZ+NMWBQXz+gHVvqjNmc4Ew3f/BZ7nOMvnyHlXvXQgxEh
	Pd4HIiI8cgud+t4vIwrmUKOQDdPIP7b7JyYU9hg4opgHulngSI9z3O2OcxPnVEQxFgU/bW0A2GM
	KuiDnzk9jrrV3wrSNYrHzREfwgC8mOCGELV2wVJfEYWjNefClcJzP4IYDWAOCUoASvgVsOCIR16
	0mBy0OYid3ubK27YONc7/y2dIinzs7uLsw9tx0ChccyvzNTRE=
X-Received: by 2002:a17:90b:56c5:b0:37c:6cd1:a157 with SMTP id 98e67ed59e1d1-37dfa1b783amr5141987a91.13.1782454471342;
        Thu, 25 Jun 2026 23:14:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:31 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/24] ASoC: codecs: aw88261: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:13 +0700
Message-ID: <20260626061329.23264-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88261.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 549783d3e75e..b931b8602566 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -8,6 +8,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/bitops.h>
@@ -960,11 +961,10 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	ret = aw88261_dev_set_profile_index(aw88261->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88261->lock);
 		return 0;
 	}
 
@@ -973,8 +973,6 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 		aw88261_start(aw88261);
 	}
 
-	mutex_unlock(&aw88261->lock);
-
 	return 1;
 }
 
@@ -1038,7 +1036,7 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88261_start(aw88261);
@@ -1049,7 +1047,6 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88261->lock);
 
 	return 0;
 }
@@ -1188,12 +1185,12 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 		return ret;
 	}
 
-	mutex_lock(&aw88261->lock);
-	/* aw device init */
-	ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
-	if (ret)
-		dev_err(aw88261->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88261->lock);
+	scoped_guard(mutex, &aw88261->lock) {
+		/* aw device init */
+		ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
+		if (ret)
+			dev_err(aw88261->aw_pa->dev, "dev init failed");
+	}
 
 	return ret;
 }
-- 
2.43.0

