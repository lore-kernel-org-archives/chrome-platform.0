Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3064E356757
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058247; cv=none; b=Q/JDRAXdYBdVICfoCnoXh5NKjeqtw79vukP6CgiepxyeDqOi29kdilBsCl0/ov6pk0kFMh3rn9b8YwlLtRHhCj7cdCMC0hxXcm96EF318qaKaaYrJT1MZRbwvf6IwAG5W7QUtGMVl9q3h0xFF+tQsuRUqcXoIDz30M5UM29DEFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058247; c=relaxed/simple;
	bh=l6qs5I0JUI9K1DiRIyWqpra8GOK6b66PJxrAnmuwY7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uk1IenUXKx4MBo5bv5gV7rcpjdELPH4GX7QxcLj4lFwHrAOnkCh3wEJJc5KwB7LpJGguFVzO06wQZkPFNwNuAix0mOxWJpIl1Jb9jPN8KDS6Kz62uz2mxqtHeoW7F8ExicbiG9icbXvsYp+AM0l66TkUDCPWG3X9yxYKzzB5Mmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFoyqgCB; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFoyqgCB"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8454160043aso194446b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058245; x=1783663045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUf2B3EuRxEbD2AxXAzHzC6DSRPTYh22ar9PET4jqsg=;
        b=aFoyqgCB3EYporVhxXy3aCalLy4aZ9m0N3OgsXMPL6gY+sGPIp0+1Kp3qg/kDeuZDo
         FurvWjkcGyLRHEmNg+dzCsJkljEh1QTSsU8Zkb3yKAOJDLA3u6GQKUuveihn3Y0rCE9z
         c3Lt0YFSTO7wR/CENwL4TaIw8P6ak4TI6+2M22okF6JNea0wJPP1FGd9TkHAKSaNh7as
         +NBYKjnW/N6/mYUJNUJpsZrs3p+2LXCFGv/tpN+UgHK1F0CGiaHzXqdoiSFC1MKOGyL5
         bqypMD+08xFoyPpRDACVxzqyucL37Z4MO66i41x+canUcRHgC+OqL+M0ZX9jernJ6k4j
         PbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058245; x=1783663045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUf2B3EuRxEbD2AxXAzHzC6DSRPTYh22ar9PET4jqsg=;
        b=NMRjqeu1EgfxiJXyJnjvJk7ouTjhREuyKSHehdwauCv3o9xzYeL7lvlK2kRRjYPgxe
         ipauICUhOzZxVDU2c61OZrH+ud9b/GKh0QwmYCSTvqP50ov2Zbmm23nJSFPkSufCVIBe
         JpM/CMj2m0BdB9P4o8CKzGVi0E+SkM+UtJBHVlM6qINbeJrucbos8ONZ8lmKkkQzWH1h
         /AqTcm0DLhxBVNkQip/OCrrIQPLCV1oBVGoeW+sq6DZhxbDVXsQ06PCRfPwcdDWGsUqg
         uHUv0Co3B2Q8G5OjAhwGmFO7OFKnCklZ7OFQuIzacLZ7TFnHEN5qBQY8MaZTLBxpbdr4
         AQBg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6jMN+rZRFKm+K5yfW/Zu68f6+RcMdSkee9gVJYqBm8FopxqLkvwfJ3OVjI3M/FkrRHQ6NiTYOjpQQ4/iCyY8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOQemnow4XekP+v7d7P2XO+v0e9pjQcldGrztQE4JPtqC4rN93
	/gRqnXY5mQpQmzOs0bb15yNTU7kWrhZjxlircUcA82ODYfnksvBVkW54
X-Gm-Gg: AfdE7clSYIGpvb0XdwO3yE9jx3JSKzmEIGK/rs+BgYg7nuR/YD+rwvNWI8n6n1l2Tvs
	yISmmgq+2ocX0MxM9+m3BtStQzWYtvq1mBIMk+5TDbx2H60YJS3eKk+p8o4mL1/uDViKYAqhK+I
	6HGvTUEZo4XphoIF2eYTlRU/IucOd21d+ovGevRFdjr0LE53fAXA3lP11etwD+EcBHs8EYktAuB
	+ILj622JCy1xJg+MX5ECQjFGIb4D05x8c2MkuOMiRLEKhEGYLEzCmO2V7+W+N9Zz1e0isrjOMUx
	29Lo5Lo2BHncSIZLdQ6nNb2E7stTzjYjBFS0mkQktVK8nhlUtI2VL6kuoDzcQF7efxMckxV27rd
	+6zQcRPW2lRKeCCYHjgTwXWQPlfM5HdNJ5wxAyG1tyBZ3NV044P+ahjzSmqEJ7DojqRi/i+PhlF
	rM2PcLs+UWGAadCQNob96d9TT8b3v6elG5blbYoHvSKgsZ+muX9J6BbfMrlg==
X-Received: by 2002:a05:6a00:a383:b0:847:8203:f530 with SMTP id d2e1a72fcca58-847c0795447mr9921830b3a.14.1783058245396;
        Thu, 02 Jul 2026 22:57:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:25 -0700 (PDT)
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
Subject: [PATCH v2 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:51 +0700
Message-ID: <20260703055355.244898-21-phucduc.bui@gmail.com>
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

