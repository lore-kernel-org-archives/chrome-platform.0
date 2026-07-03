Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044F331A57
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058120; cv=none; b=cwvJyC1YaT/4GESOliK2mm1Hr+j8nBvyPq6JQTbrpjXJXJDzlAi/XrOORxqG/kq9jhfZSt/YFMcktPMOLdDWN1F+6DWTgpahG0ZkYc0V8645zvzMyGKDKtiC+/HWYc3auEpT8V7ie1SoAozdIe97aG8KVIzbg3EAHVKaidewATA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058120; c=relaxed/simple;
	bh=gtrP2bW1SWH+Wdjb3rDwdmnkXnip6p0Q8/DaEBD+ccs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5xLcR09/mUEE3gwqkcrDCW+nlmrJ3uyZ7GYR3rVjHvhhGE48vOqhqvLoKOT4E0OzZwuWoyAPRLfcPQ4vrJxGJdsZeRsnw9Xom35kMR/mnk/6dwe3MHN5ppTG9883A+pyqeLryn4KDNzA7iDmjz5dl1USiuvXjqHh+vGm/byc/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4w0Tu9s; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4w0Tu9s"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8478cc93299so178811b3a.2
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058119; x=1783662919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hf6j86af5V0CMOW8UUCIPOBYEcGs8kFKB+l8jBsOWGA=;
        b=Z4w0Tu9svSMrkyXaW9+KU2lbAOvoJz0Fgfq2Wwp2NXAyKt167D8GZJXTF/vx49gYnM
         jsBWilVtE8E9QGSPO01Fkw7nn306vMjysEQeMddqOnSX/Vjm/JUV+C6G2H3cmNhoT4hJ
         OmgeLg9U/8c2K3XaWJ0pQplBgo5OuSh3yOBLpmlgIpfRIzBS4mMdf3SaCKGPpNEscuAp
         QuMSN8b8ynF67N5awyQG+pdNqzmopcAJ+c8kIlgv34E4NYYplgJu3Zy2rTfxrhxRgUZc
         U88jAOCOE2s5Ah4LTVVW5n5iRUnNsoIXln+N02W+3YW+2Bi8d9raUSS8N7xIUWMiYCkN
         kKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058119; x=1783662919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hf6j86af5V0CMOW8UUCIPOBYEcGs8kFKB+l8jBsOWGA=;
        b=Y6B1Hw4ihGu1ia4kta850By0bjr2rVaExuZu+7uS7asBTf3Q0QHPdgtIDcoPH4S+pM
         zWws1kgGBz3ln03Pc5tFBrwlPzUzRLj8CBdZVZc2tsxrYFFDbwcp4xWEztsDhy4s1Sn6
         A0gZ3XXyLu1uEDV2/4IdCLapUFgykDDqmz3s8XECzPUtHT8Amwhtio0MWAoZvYkfOkm3
         GNzkEXo0iCwOS68gLRmLcwbX4eym9lm8CpGafK7Hcf/ZRhYGiur3KP0A3QClrkCWDMef
         dzfH+1W+7zd3GNb5mYKQVGipkQ6aWim9trO1WGjZXoFnEyVR708Kzs7x+xdyEltTnmg/
         VL1g==
X-Forwarded-Encrypted: i=1; AFNElJ9v7J1Upm08oWiR5qUQ5fsZl/Ghx+5Fg6d7bLY2LDMqb7dKcbXB22w9nsJlcJjKaEIh7tfNgOa1B0cGAGkZI5M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjovDgrHqBS266vMubUFZ99LoVdf6aub90uUzD48Gk3ewNDiQr
	UTMHYDCqicTUCa/JHzmoBfEoMWGeZ5FmOZduhhTLBndF/0RACu1dL2M7
X-Gm-Gg: AfdE7cnZEDmxozJORVGs7dInSJTHURND55Dv0bNyAfjLr303C23rhpCNUyNcUVOKqJn
	xA0Y/bX4bW7vFp6weSF+lgKQpsGjuTs+bAsTYTMjSfseeGiV0ow1H8R9tzMPtC0NzYIbgiyDSsu
	ME1x7UncU0dTNw0EaC1pLRulnLyfPh2l1JHMFQ4v68o14RVS0bU8TD+NCcWpaz85aKYxUPJ/PI/
	dg5p4av6Ngcu+93t90ieoQv19lVjFdz7lDYw22YV2zTkFctVaUm0R5BaCFmiUKhBXcciGfMgd81
	iEo9BpGywTBbEXXMd1zjVjPGa1xckYFk26/WLCHl9D4Jp+8mP8X2iTPmCHDTQt+8BdbkCd9rvtv
	s72YDsYMjir7dbiFbCeDJzQ3fo1yfbPWuC8by+iIn5H1bJ9QeZVDnJ/ZABR/lzpDd3uXtNjsaZf
	tYuudzNE28OUQErjx2Sz0NvCeKurv/uDGcwoznTb8z5hg1uc8=
X-Received: by 2002:a05:6a00:992:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-847c0690f7dmr9121802b3a.11.1783058118814;
        Thu, 02 Jul 2026 22:55:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:18 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 07/24] ASoC: codecs: aw88166: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:38 +0700
Message-ID: <20260703055355.244898-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88166.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 3f15f4ac51f7..b72f87f677dd 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -1173,9 +1174,8 @@ static void aw88166_startup_work(struct work_struct *work)
 	struct aw88166 *aw88166 =
 		container_of(work, struct aw88166, start_work.work);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	aw88166_start_pa(aw88166);
-	mutex_unlock(&aw88166->lock);
 }
 
 static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
@@ -1413,11 +1413,10 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	ret = aw88166_dev_set_profile_index(aw88166->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88166->lock);
 		return 0;
 	}
 
@@ -1426,8 +1425,6 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 		aw88166_start(aw88166, AW88166_SYNC_START);
 	}
 
-	mutex_unlock(&aw88166->lock);
-
 	return 1;
 }
 
@@ -1607,12 +1604,12 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 		return ret;
 	}
 
-	mutex_lock(&aw88166->lock);
-	/* aw device init */
-	ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
-	if (ret)
-		dev_err(aw88166->aw_pa->dev, "dev init failed\n");
-	mutex_unlock(&aw88166->lock);
+	scoped_guard(mutex, &aw88166->lock) {
+		/* aw device init */
+		ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
+		if (ret)
+			dev_err(aw88166->aw_pa->dev, "dev init failed\n");
+	}
 
 	return ret;
 }
@@ -1639,7 +1636,7 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88166_start(aw88166, AW88166_ASYNC_START);
@@ -1650,7 +1647,6 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88166->lock);
 
 	return 0;
 }
-- 
2.43.0

