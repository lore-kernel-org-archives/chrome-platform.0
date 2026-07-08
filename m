Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AED43B6D5
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515097; cv=none; b=GggpHV3JvGQExLhXrVTTIBKjXm2ItQAEF/pCiVIUdk4/G6XtO+E4JytQ3+dD3FIKgtJEIfu7fK5wDVRneXp1yUpeUUPoOnH8SI/vlT/Sswsj7SGExE+NwhLUoJRuWh30NyIVlU2aFdyDn9b/31jG7bfhjvX/JRn6Xx+kTasj/nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515097; c=relaxed/simple;
	bh=FZJHEq+m+NwJ2REYxhVqqiGn9Us8YuJAuO/EjhxISdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j1U/fTkLY0d/95dNjzg/YVe+u1tOe7Kd+pX52q06iWNunmtHbb2IcWD5Rt68Gl5eR/TPjiitKUlLVi5enMlH2V2Io39S69W6Mx+pCUVXuI6Qbnj+yHzEUS08F3yQi8a/yK68wCbKkQ5vuossAWVzj4zAKD7do/65un/BpEWpG1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WG0qnSmp; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WG0qnSmp"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381891a9525so789664a91.3
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515095; x=1784119895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A9Wsb8hutS/8m09pj/ujWNwrZYrSgIajODypS2rlzs=;
        b=WG0qnSmpkzQ7/BvAFwOEUA3nlrRxtB8IS/apNGdfMFtRRjF7rwQX+10JXBe8wDQlS0
         N7ielJv+Wr7xwokk8PCpGg7F9ZUkXc1vsoXmJU0TT6TD+OTnfpF8QOHkdY1NC22b9hYj
         UGlsiPzw5yc5bhvbwbpdjjNZDRK8CnTri9DR2VvWQcUyQfqpzg5wIRWzIXobg5BOIXF1
         0yf2ngaQvsxlZ8Gt7yZBuWDdaMHY0dbN3l/rkNHaWvshLjBMxVIecxHFlaq3Bwdtuib+
         4Afvx30hSbybD5nDchQsHdkNqZ3uLYpYEtO/ZQiyy6zndsIcLKz3+fXD6Gmktx1HHRH4
         AwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515095; x=1784119895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5A9Wsb8hutS/8m09pj/ujWNwrZYrSgIajODypS2rlzs=;
        b=khf/99KCzk1Tb0NOtVmtwrCXu8PD1iLYs7F3ecZ9ae0yOnF9W6ucpZOSrRhsAdmD+6
         kVGVXkT7JxyoEEOWWmxL8hrShfjYoHkSBElm/FBc5wbWzjh2aWh6Kp/jc9Ui66M8iV2V
         d72RUKahQV3p8pa+4s/sj0HFY2zMjjhfB6yZh1W39553CTJs7k5NWrwt50mZpltrc/hA
         ZU8NGWJtlRN+ezOgYBnzZKgiPQjEPNDA6g5n44sdaRRvBOqyJnBEhbAnvxbyqNQGrZvA
         VumWY50OYOo+lFOK3MS/nQGkqeqUObEq5+3T7azCrxfiH1JDJr1olBMZgv2MZ/8pAA6W
         EvSA==
X-Forwarded-Encrypted: i=1; AHgh+RrfxBtCgsxNv+JXfGjYJPYdcjhFSiju3+q2MP+T2YCxeMLHdp65R7BFB8Jum9i+G+Oqa18cEhf8tcIwhuT+zBM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7rKE6Lfun1FkeU1Tv1OeNFAZLuQBIxQZHPgIaiolWDDr8U5TM
	4cafMzoscb2pt6mADsl/1L0k2UG0ejaTXyMqtfcfKxrJM4gFzOIkUEQg
X-Gm-Gg: AfdE7cnrCIL4kp+7vEFxvfBMYHiHR93iKOyZ8EaXK6CRzF8c638rS+DbfcrwXQMFGx/
	rk/X/RBR+w+4rW7rUEKBHcUkzCyGOU1HPR3DpilQkfrOCxQLw54EGjjXoLHUNTcbeqCbKb1lKFw
	+Hc2pxsoI3doT2ET1LAs2gV/LqYkVVr1jLrOhuLtbc/xMMyM3ikH4QVKAHtOhRnag/FzYKvLfT/
	ZNgfNHEMqtIT9phxQgXBZn9brcLpJ1X4aIPOSjMzXTi6++TKmyP/M3r9o7rFU5nyt6mka8BjwT5
	wpq+W02P0YUgARh0GyU1pebj+kAkNvlzwyK3yKVygmpO0hyZpW9nuNBkH3k+HSTdn3v2z4D5F5S
	5AgP5U7XepMSKJB4/MJ+0xddv3qyQO+p+pQA6HQjLXzBBofl2U4bkWOzGKgsOPwGuJLOUnCC0tm
	r3oqPHNnww935LPdOWHP6SCVATTloIlVSMKE90GYbtM+1E4ts=
X-Received: by 2002:a17:90b:384f:b0:37e:1c8f:3dff with SMTP id 98e67ed59e1d1-3893fb746dfmr2587279a91.11.1783515094892;
        Wed, 08 Jul 2026 05:51:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:34 -0700 (PDT)
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
Subject: [PATCH v4 08/24] ASoC: codecs: aw88261: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:45 +0700
Message-ID: <20260708125002.202515-9-phucduc.bui@gmail.com>
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

