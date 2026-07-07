Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D492238236C
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401233; cv=none; b=B03NwMbJTAYXdCKuArqsVFkYjpLDZIZENx8ycVCIE/a7/im8Sp/vSVJQ1RfnDrPuTXm1oTSShKD9Nh6gW4LcMxYiPawrjzNJ9vQC056qqQVfKigBAWAfPgzsy/HCmO2s7okSFLp02Xv5Oe8OlzjSWFKbuZqrlI7RKb9erTabyZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401233; c=relaxed/simple;
	bh=myMc8cB5TZmyPAjZl2RU5Pqsd/fh0JTdU74J2r/32DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxHoHfgvaRD2sE2i7Xi0vCRCy21qdFwWC+PlHiygEz3imiG0uvwczFHAsp5eEMgNhylJ5/WQ1GKOSktNy0gG3PoJ1LNFzRJIUiKjrzvFStut8q4wn2JXVHD1Tt2iPsqOhc/wzi97uOi2c88Pi2WhF2iE4Y8g+ysojw5L/jzH+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9Mc0CoZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9Mc0CoZ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84832ec2615so99536b3a.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401231; x=1784006031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=E9Mc0CoZ/23VqvIYHvr7KnxcUUNdCDNcuBihHj3SWXQ8IJrvEBmZqxYt+Uq8uf+U2C
         0ru19URAYeDFVrfcZW9c/TcFUlKdFgGX5wQqoHmA71SiZWxmbUXHVhMGD2ZrVeoYRXdb
         XbkKL2JzB/FlX3Im5Q32FJqXtMnpRCPuTtH/6w1zEnYBgLqvs8xM0q42Ko02oq4XnkYX
         mQdG3GrN2qFjtl7ZUDImO8CN6UfRRqqOAyhK7Jyp85XO6UdvFYWtCpyTnJyuIrIpTCsD
         ZC2uRTyPHkTaYzIgkwXEiJRMDiskCgjtgcD/4bWdKO3eeQIhKKiYUVW/MnRlA5ht5Cay
         peDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401231; x=1784006031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OMEdxrf5C54lrH2YSFI3RWWEKJwn7a/uRQ+uyEkXurA=;
        b=dAj602qccnFdZ/iGf8MjkFVxLjEI/aDdtPUv6IU3e6p5QSzGFXvtd3dFzO9+EV5NPo
         6kDMm4WkzixAvZHlF+8XCzjpByh4s74+8RM+7D3dZAyso4ygHMZSx26AKIxf3lZKh2wP
         jJMzRKrw1cMmjZgnot2BqQ9IkZB4yKT00ED4qakxkqxJY3YDYKzPiVxQQSpqOQp4686X
         J0KxF4/E7LNfJlYyLHLi/j8n0WaKmTQQ4+x/D8CXKpJo0OlfeTs7YoY8/12BZNFz86tj
         OcDefDtps3bfZsvGhF5RuiQh5lLDBeWq7Peog8zJXh1AdPZIBrgJrBJHhjVKG7QvGUy6
         2C2A==
X-Forwarded-Encrypted: i=1; AHgh+RpOcOXhbFM/V9uSTCG328D+ak5J6NRvbtYRWObYRNhpMK2YVyEZsiDFTnpf+F0L7WX7ZRFvU+hzCfomWGRfg9E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyC88SM1QcaipAO8RS5c4KaxZsTCVPsHk+drAspNkxJ13CCZH4E
	ics60r5j7fkjmf4XZ8WkSTtQc3Zk5lfl79g+B023aUiBmA5FF5OhMzfQ
X-Gm-Gg: AfdE7ckVCpasbvu7tNRSl1Mr7hEIzrEeQ3mzMMMowqNkhlUljuK5tczpZF5CRTf8IDH
	hSKl2Acbl/1s5BZpWEobn4dGnS3cbzkZNfOZ+Gw/GIZRi8UF2+3xuAyce9jFjZxl0MckokuC/5O
	2sA6FyvM0Z1bdy09SB4xfupNUL4+J7NHvGBp2liE51Mo9CV1+Sl4j4D0pcfuZtAJeJOwyxP75jj
	uLDhmwXzZndDn/Tm/7uGfp6eS9haGg+WHorYIZjpJbrpY2VYMbzV4v7Jj4Ht5TivLMWxQm3sIEI
	0toLCCOWwtqqnWmzrvrFcYeDN5EB6dKmYHnCPJnakBM1dXZxfwR42lDPlIHdxic4NYhE+9Y4qRN
	uoMbR7vbcEg3zYVIbUNOiq+WXz6oxebsRYlCP3SLOmU3byDt1kDeqthSjYguhbmXuywYr+zDtGM
	ow5N80WDGRQ39wux0KrY4gQWrs8KETQCykyfxj2mYWyDDuTQ0=
X-Received: by 2002:a05:6a00:3d08:b0:841:58b0:82bb with SMTP id d2e1a72fcca58-84826b8d0f7mr3442321b3a.9.1783401231339;
        Mon, 06 Jul 2026 22:13:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:51 -0700 (PDT)
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
Subject: [PATCH v3 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:02 +0700
Message-ID: <20260707051006.20058-21-phucduc.bui@gmail.com>
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

