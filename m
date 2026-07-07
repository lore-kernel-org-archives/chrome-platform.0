Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B8B347537
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401224; cv=none; b=LHZNON1xF0Q72frWAOG+CFgbg7UTRFOrbuNYIU0bWGr8lw5OUNfxGii1pVPJR8ecd8MZygvTZ9xJgYTHAiN8YEnsna0PzYMaH4BoD+B9OmrJdhgcFRQckycQOzEz3aBAC3t/X6+wrgR5DgOUsit43IxV7yu+t7Gn26DSE26TgTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401224; c=relaxed/simple;
	bh=vOc7TQ5vfBLJU8SHQzzz8AAZi3kNOaHPDwAxiAGdE/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xn3Rw1/W6FT44Bay/jxhXyzMYuE2xUH3fXA5vbp4uvJES7oCVXNs29OfJ/AvcUEtKVhWTqG5gldLC+w8SXttEDd7E4MLKAhFiviSwBrRrhrRlvkSeT4CPBoerfyZ5UUxo/sWrxZ7fMgX+oEFfZU/VS1abTKQo4C2rTXZs0JZwlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dt45gAHw; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dt45gAHw"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8482074a000so1096049b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401221; x=1784006021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VEzG5HuVwarDh68lMfsN4eBrO01eCuF3pkdbDzIwbc=;
        b=Dt45gAHwhgXDz+WMgfxQBH8gsEN11G6Wq9NEyJ6oOcp12+W/WCMOW5DYV46kjtvwrf
         saSjAIdJa1k/EaYAOnuksbSFUlLoEVmdkCLYi+RNbGCFe4tk/xMwI4yg34Qvx9ED4syb
         AN20sqVTMM7IJjI/Kc+tuxkRRXR1CWrkegcKmfhN3qREVvdXB2GfcYRPWxfWKSvbnh10
         +aE4Ke3djp49cBpBh6uIFz7/2xkdJKTjO9VYth+Y/kKgFXM2vvR6H1h0XqJLczR9E90y
         FUd3ydKbICnZjjFSu0MP8yM5LFOXaUxIqYc6EuAEeIzsCbw2CX0BlqjnQRB0F6RY/x9o
         Ly/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401221; x=1784006021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VEzG5HuVwarDh68lMfsN4eBrO01eCuF3pkdbDzIwbc=;
        b=EC0zxOKC5Ep5YxgER5Vc89g/S2xePV9KZf/nHQa0e/oV3GqtkaBxtecBxFM32iFt5b
         8OzKSZKMbDaJaf2S3q/z5gflYXTVqJeBxIdKBo0Rv3S+iKfb83H1uappCO4lvoLTlrxT
         O4kKHv1xn3O8OQHkKG1iQINDlGe5bBJHEkyHeZn1uqR+dbiEj/9UFG6NXbevGtwMCYT8
         nOIbm55RVQQ+bPiHYgirblmwbQv0KKogSJkW9dhYlq+owV/I3kU5j3Ohk9ySH+ahCecF
         BPRklo9Zu6P34j71oetJx+3mIsY1VlqDA1Lt1AqQqfDuLbrhs2DaRTkGca0M4EC5Xe6p
         vAqg==
X-Forwarded-Encrypted: i=1; AHgh+RqmR96r3Pf+PXdFYGqzZD0oCOA9u7bhiaBxnqQzDd7LYBho9NHNvMvixs+hm3xNrsHXUHTBDENXHRxDwF5d2GI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXue67aMLugwiJ0/Vgt1WPhT+Yw7oGC7DWUGCbKCsSHH0OHoyq
	imk3cGxL77p+kg7XuP+OnJIl1TGiu6LMlGB51VlM1o1ZaW+jyUck+xlM
X-Gm-Gg: AfdE7ck82nSjWfS6kjNIuby5g5FqF5WepvVy0rNd4png5ET+SJIQb/8fVzCcyMPMMbd
	miJxjAewM+j7Y5bx3JuDSbXz2RQSRNbw4EtHCN+m/7bvZi60VSV/nG8/ti6D7AkX1p/8F1xKG98
	o1bEZd2FaIBwc/kUtC7crkONS3iX0AON9L6K2bVkeYyhyxKNEXUFiv5CKlxL+FnPWut5qRyz6JI
	9+CiyFIkoWwOWmpj1b/vsIw4aTHp/Hpl8cZ1y2Lw4I+74uj/rcWwxUMx0A3wJei9BYpqM6by8a+
	4lnSRCdPwdRCyaxy9wfm1nTyaVkURCIAOKy1EbRqURsn/YhgQ08g8U7cUchhlcCS0Nxi1umgQUN
	709oTrHtF4EyBykfpiR+MUFxGTOZhGRk1ZcPp7MvE4BiGltzESbXgigmuPpnyQLwhMuQXlL1b6C
	A6W6p15RZJQQx0/oAgyg8Km/DlTbcJajRkNvtZHHK5+zv+f9U=
X-Received: by 2002:a05:6a00:6f60:b0:848:2eac:bfb9 with SMTP id d2e1a72fcca58-8482eacc4a7mr1154620b3a.59.1783401221244;
        Mon, 06 Jul 2026 22:13:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:40 -0700 (PDT)
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
Subject: [PATCH v3 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:01 +0700
Message-ID: <20260707051006.20058-20-phucduc.bui@gmail.com>
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

