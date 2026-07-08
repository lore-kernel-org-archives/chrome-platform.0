Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E00643E4A1
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515112; cv=none; b=Sm0bPeT6GrhYVJlTKz70JSkvNRhegqttIjk0ZvTdJ6S8N7ze+i+B14g5F7DL5NkEiiuKWDnY4HjS/u/nMjFQDqO0tD1JOBv+bxd6UWUhe/gdzQMCZZOIILeaYqHOy5hNpw/i/tIYwbWbPkFmWawJgSj9rjDBAcV9FYc0ITBkMXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515112; c=relaxed/simple;
	bh=sCVUN8gY1h9/nIWRmRiilIKO/UTVoTdwN5d1OfxbJo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mo57fzA3jI/zhVZGAolzNVhH/d/FMAn9CcSVQr7EfkkNzPYT2lGsJ5ofhxrUcjYxFyo/BAv4Px7+UBhZaIsjObY9RIWA8qxqtzNdfEPq0r848wbAGXzX8voKtZ9ocWVt/6Uk4Qbnx7KdBKt7Lc8acyaZhJDwbRsmXlVKQIT7m3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTptOhHz; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTptOhHz"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so654419a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515110; x=1784119910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwVA092wtCUoFLf5EkOcxNA70xG1xrrJyEkWDUrUIog=;
        b=MTptOhHzLfqwEb/hOT816IgAPimrfIBZogJWg7g+0SDXXtGNXzGDrn7FIV0eHSRODS
         ITSAX4xIgh86kKW89+zne3WTIU4HzIlDo40jG5dVndiOiigR0VToako4zvx5sv9nEbzW
         vpdO1VFAVyaW23oAmkU7h9Q8q9GFOT8xWWoSN5yGs0EoQYxoDrbDKPUv+5oN/7cVBGU+
         huXaStehkA3P+kJvHsA5CZhOyZ4JVL+/zMlkhb+LFMiggkdZ/lO8zddfuC/dK+WDCKUP
         mKT7HCudXQ+zpFr+0WoodNA1umEiIJgOHksf+5Cn28Nno+PmutGHxuEaOzWCejHNKMFm
         1mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515110; x=1784119910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwVA092wtCUoFLf5EkOcxNA70xG1xrrJyEkWDUrUIog=;
        b=h8LwvoVgReahacmvft5bvFhtMQ+C1aOdS5t2rG/945H837BGRKAemRfd+dMtb0s+4D
         xtD0qOG7s4KTz9O7pRj+QcUqFhoD9QE72m4eowV3MaxJBKbqMI/OTKEnMxxsEf9e2JeN
         jG1vJLIYt7foIZwNbFKJOVBXNu1oZuUBpEAAmKM2oN2yXwwsMB3ocgR4hv1Y5WTtQd62
         n+EAqL4igIIysRRD+2yv0sjssJwP/co3qkZ2oRJsvSEbFiTJ48OAw3axBGycEMZdhESd
         gkQBgt3jy6Sg0IcM1GszuTIGZoqnfMU8GYXR+9tXT5Ujm78azGGcaeeb93rJyRXsidrB
         yrFg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+jHLTJ+TN9SrtAAOtrAGKah+ZNIXGosizVDeUUWffPlWI0xZPXkJBRBrRHKuJulPnhi9zZbbcTulTL/7yBKE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpljxaHFoqs44rkEPXA/lNdajoCpTLeuge+/sxBhYOMH5WW/dP
	vPGfTvbp+bo3Wb1JQ8JXj9P0Ptq102ZwiFf7zuCjJXfZ117O76TXhIPi
X-Gm-Gg: AfdE7cmdrKCYJUI5MC6IbdROIxBOH8ZbFxEa+dT6AVH50anmfvBQ7LgiKVi5n4vxb+i
	uBPR6XbnoD1y/s3kF/N1FztSIDEzeRc343wR0/F5a6MIKLJWH91GXc57AbjYhsR1lOsWqOONs1F
	dg+UAuMHb5VPRI1z0XlN2LI2MetAmf59dpuLwxD1RamX1tjdGTSN9PwtN7AE0UvNF1I1b2TC1G/
	f9JE/Z/yi3Uxj+Zc7GmemuLsrLh6qte2+/r2yPk56IsUe4lcUKap6+/lfwVgql5dhV7UfpNah4I
	NAsqCjGANkG0mhtmkCzUY/3wHSt4fceTR/OYx6YkDeSbz7t25x1Y5oBPsPrALd2M0z6Bayo4v3O
	MQMsz3ahFsMs981nMkT+f30G9VhJfZzxIgZj5gzW5boCKO3aeJdR/AWmisfyQu+eJ9C4wGh/VgP
	EgMkCIRrrA85EZivcrGQYVJ0dwY6avogXoanbOyG0/h+2oHU7eoW0kxx3Ehw==
X-Received: by 2002:a17:90b:4d88:b0:387:e0bb:57f2 with SMTP id 98e67ed59e1d1-38941bce1f9mr2462310a91.35.1783515109926;
        Wed, 08 Jul 2026 05:51:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:49 -0700 (PDT)
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
Subject: [PATCH v4 10/24] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:47 +0700
Message-ID: <20260708125002.202515-11-phucduc.bui@gmail.com>
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

