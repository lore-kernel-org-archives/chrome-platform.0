Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A28360ED2
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058256; cv=none; b=E6Ylr8kussmCUsCbNdqzpeXot4gKjBbcaNRJ6x/dSeACLdi3AV8XjYXcx+oXAf9CWOATMkEdKstp3Sp8ggLH/9hyNYuVVp5CLTFC2slle3Mq6rgA15NY9zcCppZEgs4JkJXj5BY++GweDTI8KwwuyOrGJK5e5Pib9qOrb196ygQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058256; c=relaxed/simple;
	bh=KYo49UuYbgBO1m14OgkhHkjaRTQZTWjIzrum4/tkycM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pr2T2BYzbp2Ex/GFUmgPsr99ZwzF8vS7uF/ORw8l111smE0B07yAbZXt6F7ekedboeEgF3rU5uvBoqBbk3frSUz/CPfCC1aFvJfKbV9CWrEkMfejFLu1Z10xdp8rbQ7dTWQo3n30r9iP6gBQSy+FGUWdK5dutfLA/BPzGAGMLy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFyz1i0M; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFyz1i0M"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8453427d3f4so144052b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058255; x=1783663055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WCuIaAoOlEGlqla88ugURiuPnqOFGITdU7Oz8/QvOM=;
        b=LFyz1i0M9SlYyAaOj7UnXHYDoYzRqyXQXMy90PbGDiLRKT8FmLFzMoHoTdEqDOPQrQ
         0VDSt3s9yKNzAnZ3g4aZS3Z7a02fiwW+azekr0sBIxldA3+fADXrE/rD67+7n81fNPX0
         4PyQ30FougNlU2G0/kNz+8arCNCGiXEAAP8yGDjmmumuBNIq6FwITZz6Fgf5USQUQOg0
         ijpfMwL7mh0jM3W1gZYJc2cxEe5NQy8WFwcWICAgvzjOGQfueXcOFXCBWy17Qn+AO1lT
         PRtJaeTgLd2wl2AdzNl3Tb/2UI+p/re9mQbmEzGFOPa0Z6gMehAv/02aZ3PiBfwmtQq/
         +isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058255; x=1783663055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WCuIaAoOlEGlqla88ugURiuPnqOFGITdU7Oz8/QvOM=;
        b=kQqBMELnF6ow3WoGXQu7FQgFdZb92ol05C/KyITMge9b0L0r36Hj8jOGzieGM/JeDY
         va1kdhr4zNA9K7EGp57kCW7lZsXIwmhDKTRNT36OPBP26KaYq80i2GgKJ0mX/LDG+l5G
         BjHNhkMDFQKCQyNl+qTIOnR88EMCUr3lE/Hy1RIsADX7PeMY4baVWO7z7a45OjFKyyTS
         Cxp7vH28YzJJpxWz/MN/hpo6TCqSZ0DLuxXZjSAuEOXbYd/MflhW7sitcoGsKxBr6niG
         kjw5OpjSzVmRmlqxh3se+rCx9755aiYCSAvsQJ/RPQNBBu0yjyDUL7XrUf6ZwD0DBfqK
         hCVA==
X-Forwarded-Encrypted: i=1; AFNElJ/9q3xahkr5zb01KJbzZyE7lf2EVi1mQmsSJUEiCTH3i+nhSpSIId40CT2sMF5k/gO2dR22L4qfkJJ/IP/KIAs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4eXtPS5VEIhfwsFMV8F4j9R0Df66as4IAOvrFCr7c7Gysc2Sn
	nEil0Mtuhp+aFTA/C/xg45hno5V8vDIklBRfMsKjub1r9iYANWPrdiEy
X-Gm-Gg: AfdE7cn8yGP0PVmxCx1xAF5q/XZBC4O5pXhqQj78ULKRhjTqCGZQlbHJJ5uoFqxc27G
	PZEczzkap7C3vzSn8/uQ/6/Biui5RIyeZYal4/FHJ6vG7PmdK27JM46kWdT2Mc89xlD95AwUg3L
	Es0URgea001NNN86RSl/gh6gsY4OMZiiaN++fU1hqWHrEEf4bu8kgV95j6KWCRp8rY2Uxwpdtn8
	MiZEnql3q+bKQtZebSF7NvI2QNRB73DDNPpNFRCQXX2IowAP9Ge75E3n6wLa3Ljkji+/nM4Edkq
	RZZO/QeesvI2aFUK9LyC082ZljoCBaUAJXI7zWZ1oIGgnWLzfapKFeaC8baMfdWDIxmgZ6Ed4TE
	PQqRv6rX4RE8d7ZGyhxlqoxjF5dM/XGCMwqrY3U0fETF7F50caRaL8ArFvmLEdbmgZhSCYu0eJK
	/5A+X+TOBWgIZkwRhwpRj7IzYIs1Q6Of1saWwBTH7F6j+58IDU+yd9zpfuyQ==
X-Received: by 2002:a05:6a00:3c94:b0:845:cdc1:a803 with SMTP id d2e1a72fcca58-847c074e0d5mr8733259b3a.11.1783058254709;
        Thu, 02 Jul 2026 22:57:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:34 -0700 (PDT)
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
Subject: [PATCH v2 21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:52 +0700
Message-ID: <20260703055355.244898-22-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l90.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..6ce603bfd500 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2423,9 +2424,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2456,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0

