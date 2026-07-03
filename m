Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA153624C2
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058148; cv=none; b=c8d6aXA9njcrFvQEMhoUvEoqat7iFzMXq+osGdFP8r6cWxD6mOnTDl8DNzbYq4Y5l1fgPe8JUw3cmKnrsuHNgYrkJcD9akt59kXDH1bGKEp98UHu9gEk3V1KaM8WQU7bl7v/x38+Ot8nup/SBWZCkDgOgUDi65JlsrP2lNzYRks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058148; c=relaxed/simple;
	bh=hI8Uif9OWfUC9nJ4ryYn5lVr61cKx+hjtfZlpJoMJ0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7fxAbSmgTNVZEuY7MJlyxrTDtysuH0heMHv23gJf9evFLM4sXV+7gw0QaGr7jWNttj6ZNAY1LDo+neN0fiwqDPJeK99qLIrbKaQ1uEyWxGWNwOdp2azCSiGwOUoE/AKiedcSgwCgVsbjI7kTBR8X4WCsVXFihBTgm2SygTtQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUjfopuf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUjfopuf"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-847a52edeb2so161992b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058146; x=1783662946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUaUW9hyC9Ct9STDjbyAspp3HtPck/9M1aAPJx5Uwvs=;
        b=WUjfopufQyAbpfWDYIGSfb60yuuCTj7uApsk5esMlKYfRI2/RNyS545VDkpmYtrFY9
         X+6TDNiVKX5eJ+gdMZG7rGhnqjG3MvjNLuIuNZY2rvCPeCnS2ODYr/MB9L7iOk4JECfF
         5kx/3aAi67XKbSGf8Kap/Ua971OYd2MZJZnHlphgbeA4t8bjmpf9g0Qi/sKRUsHmjE4B
         26Np3YK6dgzcChjssnYGdAtelLdfPLvMoE/+46o/J4dyl8UGgf787+R4ZKJjATGhJNps
         ULC+dK+B1debdNP00bZ5dV0myDrUi04p4v5+Ts3sd5EnO1aLBK5c5SrbNvWkD5iu9gwL
         YwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058146; x=1783662946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUaUW9hyC9Ct9STDjbyAspp3HtPck/9M1aAPJx5Uwvs=;
        b=Xef0hAQtbGTJtt+4UvGRzwE3LdCKZcJJGcHO8DNnDKM4pVX2iLeZilzbYx3nw3EI7S
         XCGNyeVDkJyj/AJqtozIW3WtlxFHvpd/xI4Q+pS5/V4GUDG7puoGpD/ynjRBd2AAnoX0
         s/8RAH0StXbEdNa0Pp4GJcDRroUlAUHFjkaAPCl72Z2BgkslUs6holDcVXUN55WUfN42
         ba+bLhO7h4WG58WcPjMalC4oTvHMIqcKfwKwJ5tixyA4CeTlSCcb/RVKBxfeHivoDflD
         sL3H/6rCM2v3zqFjcY6eWd4vyLWb6ZhTaIYLlt52uOKKsfAYp6urjwzwe1ZwvkvpQd4K
         d7wg==
X-Forwarded-Encrypted: i=1; AFNElJ/cIRcaYSSeeVJR0kR5a6K6qiRealVj51FXb2DqJAhVmNBo4jLNH5d4EfKVfn55Xfz0oFYfpv7mn+dPOuChOdI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEGdYhIct9V4EU0buLYzNNVqnFZsyX3pnJLAGov7BbPJrH8S2N
	rHXRVxbip8Rmc5IT21P7gepznQz+HwE+N9GRjGE+HarwWacbU3xjKRuQ
X-Gm-Gg: AfdE7cnwIOxeE09GZ3HGSkMCS7MD7IEKQ+if//PizFet4pb7hUjHGBRlwz2cILTaDQ2
	S8PaZQE//PCRjOFaf1d99RgZFk/VBlm0++CxcjhR1xLWPV/rdt+lGT5yuKWRCa8dyDbjhWFwz+c
	sLBR1ogvgdi0QTrdQPIlwGiyNbm05Fe42AKTOaqMjtJRwF0NdtOS3VqvHWInbI8gDyCPfP0BsjK
	KFhuStG0jTcPfJEuMubtaCcFpJMlbtA7n4KevYHcJS4QCvsX7hP3rcMGeC7sDy1Jv3qViiTXacU
	U5d0tFBRgM1Lim77eDq1hZuTL4VgEHmaQtdyu1bqBe3PRsRaSoz8+VNDv5LA7hYVjJ61lS4/ZRa
	8jPC3SdDF6/La5ZInpaemT4DPcBP5HrSuGo/dil5xfhfRwrQiQsC5U6qX/SvRkZM8oMYY8qduO0
	8YW3xfY/G57VZy824PUJ1MC7VKNAdt/ivBpa5hhjgoJscqkdI=
X-Received: by 2002:a05:6a00:3319:b0:845:d286:1fb4 with SMTP id d2e1a72fcca58-847c094915fmr7587687b3a.50.1783058146418;
        Thu, 02 Jul 2026 22:55:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:46 -0700 (PDT)
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
Subject: [PATCH v2 10/24] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:41 +0700
Message-ID: <20260703055355.244898-11-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88399.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index b2ec3503f7e2..67ea073abdb7 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -1140,9 +1141,8 @@ static void aw88399_startup_work(struct work_struct *work)
 	struct aw88399 *aw88399 =
 		container_of(work, struct aw88399, start_work.work);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	aw88399_start_pa(aw88399);
-	mutex_unlock(&aw88399->lock);
 }
 
 static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
@@ -1702,11 +1702,10 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	ret = aw88399_dev_set_profile_index(aw88399->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88399->lock);
 		return 0;
 	}
 
@@ -1715,8 +1714,6 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 		aw88399_start(aw88399, AW88399_SYNC_START);
 	}
 
-	mutex_unlock(&aw88399->lock);
-
 	return 1;
 }
 
@@ -1939,12 +1936,11 @@ static int aw88399_request_firmware_file(struct aw88399 *aw88399)
 		return ret;
 	}
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	/* aw device init */
 	ret = aw88399_dev_init(aw88399, aw88399->aw_cfg);
 	if (ret)
 		dev_err(aw88399->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88399->lock);
 
 	return ret;
 }
@@ -1975,7 +1971,7 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88399_start(aw88399, AW88399_ASYNC_START);
@@ -1986,7 +1982,6 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88399->lock);
 
 	return 0;
 }
-- 
2.43.0

