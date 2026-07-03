Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE663364929
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058230; cv=none; b=RpO5T8fpQ7RUw/1bWtF+ZIPAfyMVz7XBGRW3eOxx6b7pYQdlEa27K3bSjkR/BjB3B46g9/DjdgVcU+PXzUYMvShQixQz41WoCF0Tou4uE73SQzYOcMMOihU5EfJTJ5rY06nOkNjetX4TdhdoCJIWOaL5rCmmIV0Chrw630RotYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058230; c=relaxed/simple;
	bh=AZ+/sprSGNWOJL5QjLJaSpFH0m8wxH+sukCBtJYoNfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcMD2Valq0LEUXBfU+PzMaYYG7Todsd2wFo2o1Fg0ihhc4gIwdncSp25JSt9JPsfU9glUzBIg5ftrNyHYRdVstW1IrM1iAVtmdeQNWK8yyx+KnEvuWlE5uxKSDC1k8xATjD/PDLXfuJh+WRU4+QOOlahwnHUaID0pGhBYTL6uDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jm9LzHFT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jm9LzHFT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-847a483e344so168428b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058228; x=1783663028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZrDdEV0nAN9w+kfhy3H3xNzSuMWcMiDn5csKMrOHzc=;
        b=jm9LzHFTBAypash9py4CXNVvpw0LkfpgB1lol5c0rdeM2zHiKjm/p3orzdOzNKezYp
         jTxWRSeGf6TCBuP2w6nphLMSSmoba7iUSTnikhmHyvbGKl3jt3fe8F454hTcfgzehIEW
         TpDx0Os6ugSCiBamy/Ze9MLPdo9TwjuprsBsfbZJFtLP/VI18N1ByGrUSOGrImzBxer1
         q7AwZaIuzFOQbgfhLsecdN3BLO7flU0G1oGwZfiNQYMur5rU7qLxlPF5xPsHsRx2nEcK
         /6fZnxXMfUism8YNVABXDZbq+YY722Zew8AsYE3hI0EEUlHgnvfOt9YrgO87lzLE5EYX
         DmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058228; x=1783663028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZrDdEV0nAN9w+kfhy3H3xNzSuMWcMiDn5csKMrOHzc=;
        b=IASzHTwxxr2J6zeFyphJTZn6JM1DgkyMDRiQc4vP7EpP6dnwQ3tUMPDgQCw1Ca9RK6
         lVMIEz6Sru4eao7A9UbpD/HkcuW2oiAAa9HSZbr7Eh5H267zgnSmXqFJU9/KP3jfjbVJ
         D0KrtZ1lDUzPFkRkbFAiiEp4SVpmbrGN1B2CjnmHFjlyQBlYPPUOtdEBjdQ/TEcYXdKV
         g0/APKGNFYOs3zPb5KOM0UvtdlZivmfj0/O2ju8FY8RlCpdU3eteFZpAUO3kYS/kdkJY
         yGysIrVpTdWMNlX/Ws4EItMzJG4pjuiY7r1/gFz+PGNuzeklr9n6GXjjIoYwwFkYWii1
         s07g==
X-Forwarded-Encrypted: i=1; AHgh+RoEpeZ1WGJ3zyamSJYprYlA99u9rjSNYHxH4R2cWOJV6NCc6lHT7Hhuf+Dy+QzPdokd0fmsVdzHWJ5vAt33KSw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXFk1bR8gx9Vj4jGlcI9/4CcDkkuz+OTXHU9wj4SRhZPvchNgq
	HNhEo/dpDzM5IdGVAWcCHhpkIk1Tm2HqAFD+cI+JZq7q2he7ZLN93WbX
X-Gm-Gg: AfdE7cn6TDW6HpqvktuJjxURPZu75jD/uPuDiaVG/LpdVP3gdSzIhjp2TAXrfS1m3Ua
	QxWrqb7DIhgHOhxhHBceHdAB62Ul4GTXdt+iYg0yG0moRrfHH+ibz0bG5rwxzXgivyC8FI/rq6s
	/Reytsexiu07BmqwBZMWu197uLXxR+qTkGJXyQX5VSwrs+WnWxnEB2QpdMpPaqBzcv/AJ70A0zM
	ntQ0qMpveXaAukQU3l7g+UihlC/PZ0OMbYM956teFKBep4FUQ/qmFevDQ9OA4+QN9gGBywvmGFV
	8HWvy4sbJrcYezPbiNcbWYUUcIt8zRDXUHKthNPU4GNwE31bBsTrpI33MHz14mMx9tTjDjyVYZi
	l+l6RjLB1DVyItxCEuJCkB8ZKyvKsVRyfopkSEaYhumjnq811/HuRSGynaHl0wAkY+Y3wjI1D0X
	DSLJth00rb9FrhoS0Kw54zgDpQ5yYH0Sz9oHD5TXIZEeo22QU=
X-Received: by 2002:a05:6a00:1708:b0:845:cf86:947e with SMTP id d2e1a72fcca58-847e18f5069mr2725220b3a.27.1783058227975;
        Thu, 02 Jul 2026 22:57:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:07 -0700 (PDT)
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
Subject: [PATCH v2 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:49 +0700
Message-ID: <20260703055355.244898-19-phucduc.bui@gmail.com>
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

