Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64DD363C6B
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058239; cv=none; b=ez3MIcmCqdZ+nI/shXIYG8nConU2MSQSqzuajIWOtA7ZskfrKrNG566ybiTj9/faQAmxSE2aqEV7BeJLf0T2M/epLXXXoMWBaHOvytaQSe+lcq1TOCLUvbj9Svoaq4uHqQlao3s3y1jxY1wNMtFtgZw8jHtgJdJ+5dl4IXJK930=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058239; c=relaxed/simple;
	bh=eNcuc/oP52FaBehdpKbBur8a/vrnSG6dcxnBXNqCMeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSEDb45gH4FdxC6P+ISvIBpouWS/YmkI3xFXsbCbzsU2+8IVVyZstCVsWLV5EJN7imMoDLPS2MYzxxbQ7bZFlNGWQhf+5A6ANDSXPSNtsF0IoSx0a4nDdw+GlE1OlMPhoHFPFqBmJ9aAczCmVBm1lgOdgAqMrG+1fiWO2B8DzkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qed2wLyd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qed2wLyd"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8454160043aso194374b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058237; x=1783663037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+03ew57CH31VLupzCTVcOnSAUZ32zDQS046SVJqDWA=;
        b=qed2wLydfvYPgtjwuBO/FgNj9U5CHwXiBq9FY2LgWs3i0vAq7aQOXZfiw/SOVfFSQk
         CBBIRme92V5isY73Teg1qPuhXKxQ1nY7tyulBVN9J1j4niqdBXwehMrehhntuVSG8G6o
         paQPR6ngIIj2uNNzIcFukqg9IFgLoYZU8+QombAghk2m+rDKUVSb8UsoA67ELPHStj4r
         7EgCK5wrl7ew0eNyrUV5io6hgozISutJcPDAYXxRpGvqKLcU2VWJZcHAzXKIxH2hjPC0
         muEykblRFQjU3jcMrBnNB6DUvnrhuu8P5ygtRpYh4lsUPX2Mn0PZ9vlc68NPbpmqn+bc
         hkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058237; x=1783663037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+03ew57CH31VLupzCTVcOnSAUZ32zDQS046SVJqDWA=;
        b=PJ4YF8Nf21hUPH32VkgRtPOff0OTTYtE1EY0YWASiUCG7EzFjN7wmNBbzLK/62VLTO
         S5gwwbMaMdAC6jMXR7hIU4nbYGSrrOgjhTmmvRoECKP4IzM4v2tl1Ob1aAIcy+r/g/HL
         066oZC2KTf3jP5Gy6XsskHkB7H+CrJw0/g+FFyFy9bAer8WOLXm0ncQ2JpfcaRX22F4Q
         F0oZuPoD2i6AYQs503cPv2wmrpXUSok9SsFUrxIRKCEKjjEYcMmqXHV2p3guww5PEu7G
         y3DEVhRgyUR0ZYoRlC5a20zE9fT9M5AVjPyD8IEdLBc2wFnST5wDn6Jw8DbKr3zGZ00i
         zbCA==
X-Forwarded-Encrypted: i=1; AHgh+RoMiNlLTZ3euOsh+LooKNHFjuvHjzEayKkBVAYS3bjREiVAYbq+0O2C1AEjtYrGpA3HWxVXWRm2OLukke/tzsk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMdT681PLj9eRoVCL5STMCWkQRrbFHU6/pbb1GCwk+dizI2gIv
	V+Y0/ChGif0c6f+2SLuoOxHAibtNUMvlyPdis9ZIBV5q2B5Rq4AhO0N4
X-Gm-Gg: AfdE7ck6Y5G54hRCDiC+Vf/DnD7H1Q3fTGLl3wjAIeTUEFsfuwpICpG/Sg4rvHXt9Ku
	1l0yjEGQr2obwKJGlsCwtreGByuV84bJZIlWR47YLUZ/6+sR7YPoZAL0KiRbYExprJNwSdAic+l
	ysmuaNMRNqcXNbnB3mQfT3RHYW29eT4pulZ5mCbl6gD/FEDoOIWDW6C+FfJk9vrbZfnQc7ne3r5
	6DiRMk+5pry5KCGbfhrPVjX0hWO9XTY6DpwuErUwVygOxgt058VkFR8jAsUv47PTguU/0ehe4Mw
	oZ9pdFMYq5EUbaRc8kkYc51I7QM91TIw1KkpVKaT83FTCApVzGS1QD9w6/EbdtDHGO021LbA33P
	we4fMDu6lnUkTcViBifEGVwWC3GNcjkerixVrvWNs1+alMDCEEzW5kNaeVJ/6gXIkzy/hhdlIFU
	c6Y/1UAfnEPfnqMgDCV9YgQz7EnkvVXaDTSLWOD7woSl+0zxc=
X-Received: by 2002:a05:6a00:bd0e:b0:847:7f6a:c56d with SMTP id d2e1a72fcca58-847c096d1e1mr9587884b3a.30.1783058236898;
        Thu, 02 Jul 2026 22:57:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:16 -0700 (PDT)
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
Subject: [PATCH v2 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:50 +0700
Message-ID: <20260703055355.244898-20-phucduc.bui@gmail.com>
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

