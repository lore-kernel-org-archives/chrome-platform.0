Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E33344DB73
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515176; cv=none; b=f7j0nzCa1VNHV0jC5x2+E4YBO6ak/684FLmLZvD8y44E/lj4QK2rtCV1ksbg+KNMF0fvWg7APcQGU6o/6BFWUTzjDUnvI8XtUqqTOyBnBVUcFxia+Nv6jd7yMG26lYtUyARYiZ4FNk4OZYrvoffANvXptzEdde/iQs28MD8V2e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515176; c=relaxed/simple;
	bh=vOc7TQ5vfBLJU8SHQzzz8AAZi3kNOaHPDwAxiAGdE/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFmpmuwnbnrV96HFuT+WXlgev2DeoopGhLWI5cEEOlg0iUJUqJF4yapVt5BP++6wAoOIBUwYOrVIIiMFe06SpT9pxUO5mZXdqv+zbLowseJ/tUv+BryNO9TgITVDgJOYPmyD1A5AUcZmxeGKit6PUtJQPkMpMUfcNLcW/YDo9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5KGI6b3; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5KGI6b3"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso641997a91.3
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515175; x=1784119975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VEzG5HuVwarDh68lMfsN4eBrO01eCuF3pkdbDzIwbc=;
        b=R5KGI6b3cAefhBp79coP/ezZqyUFwVaV2rvp1YUZCd4+TBGsI7yKiFu4Tz8hF9z1K6
         5hj4/DV1vnkBGp70osyIru4Hb0Ab1dTrMmZ4O/pXp9SXn7A2owIh85ia8XDX+2Bxslv+
         0lv4xs6OHaruJ9rNKDV3E9VWTDzUXlsfNYVmWwnWYiwJMXsn35lnqSAy1cst0/fIK8Jq
         nXROJXRfppsaVy6lEzSLjW570kRBOABofCq73i4aZo+beF6nDzgaM1RpBSrqD8JIHttd
         CE2m2UJ8EwuKwXxdAkj2Jy//cCr35n3p6wXmpespZ17J5+6bvyXKL+/LgDgJ94I3oDNt
         4ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515175; x=1784119975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VEzG5HuVwarDh68lMfsN4eBrO01eCuF3pkdbDzIwbc=;
        b=kdLPVw0Wh6L8+Athzfa2SX9h6HM/Pwwr6VMmrBy9MS9UOmJzi6/DRli0+d9hguLw3b
         ubHEfhQouujps2jInJ5jdVSaQvERZstCEJnpQnaSs5dNjoRydI5b9diM/VI4C9mbsUmu
         KkUTVlIoNW9Sr7Oh6/IrX6+O1qaorOTY1vtoQWzc4VqYYIlX0HZSfC+ecwz0spchyovX
         j6FzYVRD5NJUtq6G4+eEqpi3ETYXWfnW8giki0PO7fpwKiRnSFCq8TxBauYU+kFiQXqv
         zQe6SUrvK6G9Sz2ycqlFP2rVxn02c8o6sOLrcGsJye8HLbqmaa5lfMLPfcuI2X0TUM3C
         NWSA==
X-Forwarded-Encrypted: i=1; AHgh+RpWagbatQE5wgtHdytA/GZ3Rw0aDJBS4aEjFr1QIDe14g4Kcx53hjFEthSB35iNmC3vlS4yI/b4kzU/ABsrNh0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIeOeOMaJAAG21T4q85R0Hva5SfmPziB85/lsPiMZtzGPrzq56
	7e0iHfxbSPbcwRWyA5pzB7vw1uaR1Xl+8Y4FOKndJo396OR/L+VsjEma
X-Gm-Gg: AfdE7cm55ExmigwQN+hCRt5rYu6naX7DzLuO+ZFxCK5G8RNIh/NIzbV9GVScNnLx5HS
	SRVnmLu8D4DpdW4iVuk/3KGYqRdUXTS8DMQ/WotmPAGJnUpe4mgoHzDthiS04n5j+eC15iZ/m79
	VyCoOhMQY1t63coI7fOTLFDhM4RgXP9w9Q/ridu3v+QJmlrMwK6Te9cquk2BQNgjKAffQJQcv9O
	c31044Dr1jWHgYss4K/lXVvzI359SM+LsQ4FlYNKXVEC1Az/YncyIBcbYFLyQztQTuoJJd+Lbzg
	VrTqi0pRBDCby1HA9WxDRP23bP5HlsR85mV5qqH6cBPgnYC+uHO4eV+Aq+HS1jBnc2ZpQu+MZXg
	Tr05Qag9N08XdFXVQW/+6srUJKK8ZtIoKoLRf2m3CWM31/ybPV1wgN9ArOY9PBiMIaipmT9HXeY
	vpz4WV4EzRVZckZOfQf3s6dMRno0RHHJe8h8XfNDjDJdePl50=
X-Received: by 2002:a17:90b:5384:b0:387:e0db:3fa9 with SMTP id 98e67ed59e1d1-3894239bfc6mr2461097a91.34.1783515174810;
        Wed, 08 Jul 2026 05:52:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:54 -0700 (PDT)
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
Subject: [PATCH v4 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:56 +0700
Message-ID: <20260708125002.202515-20-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l35.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a8fe5a99a8bb..e77ac7bc8466 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -1566,9 +1567,8 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1600,9 +1600,8 @@ static void cs47l35_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l35->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L35_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l35->core.adsp[i], component);
-- 
2.43.0

