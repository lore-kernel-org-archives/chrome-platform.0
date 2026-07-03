Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F85C363C6B
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058265; cv=none; b=tydSzam2n4cORMhq++QgCn/4MoVPIPIGK0h8HRcLN6vAiAz9PwQ18OtRc+pEVI1qfjHFvWtJ/Egkyu9L0wFRmwvcAayDeVM/O2rlYiSVCjun8G98kpktMR4PNIBspwiZBuTLt11qYyV29WbSID8rBiOuKDtzzm6F2kuXhNq5KO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058265; c=relaxed/simple;
	bh=Ni3jeRHp4DlPy1RmzG7RK/kEkCNuXoOAzxu39VyTUzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAFjXKFggdUfjciUMyGbbmkAMICJ/Y9VD6nawYJ0pQgMcpKwLiMKs9uDF2c41OR+2YatcbeHWaTpcnAyAprw1MUegPQCJ3uz9EiGCOwaSbCMSLy6pjgmKLMbJ9FSf9Y/lOTPg7oODv5yPLeioOk/NpYuJc2vheAxEmySOYcieeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVr2mKjf; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVr2mKjf"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-842338c18e0so174358b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058263; x=1783663063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdRFOubd4wsuDFKn4A4oZMqcKCsz7f8Lmrh1PllTRso=;
        b=cVr2mKjfodMn0FSMV6nfRCAmglyusy1TtomPUe628HgRbpz9PoUY+ILOjGuFMWP2hQ
         kosxMpFDjtDQh+h/sGjrQdFlNaugB1il9j3HRN5A8zZFCIbiDtDdX4sNmqjusg+XQ2hA
         wotOa2KuS5CvMNcVDeT9W4QkxDc+OsD12c1XqXtDBySdBG4qwy8C0KYqYq/r+LQeudAn
         pVA3ToVl5BLhNHNRqbzzl9ZCkOzZX6g52MxZ+nYB029nEweGXn8bCek97udnHDZjJ/6c
         tE6Mbu1pTIJmnb60GjxPyk/hDTSADseVapuksQ62vnzzFy88MVjZWSHkNkHkEiIFuO2a
         hTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058263; x=1783663063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UdRFOubd4wsuDFKn4A4oZMqcKCsz7f8Lmrh1PllTRso=;
        b=HhC4p0YhRpRvhxSbCQ717dDZtvdcfs4GvmtHVdb8SibW7vT4pFHLaCBMMpwLI595y/
         w6jTtxi0trc0z8r0jbhzPgHN8W6m4rNnkbkPza7Z8Z2HqcjTVAuYa6wlr16EsRyTS4k1
         7Oi9uh7sLvtjqgWLIarUObz7XrtrMLUGYfiDqPV8q0/4Q/0sVr6kIizLB2LdM+Zdltmc
         wXBqNF+f5cqLhdFzkJhNtImUSeWpNcK+1EjjMr9Sn/Dw+OuQWUafaTGAuDqWaN2BMlR6
         IzyCldP3MNDBHUZceceMRPIV+Va/ydYQnwr3f+vxtIowfsfR3Q288OwtMDoMJ+fQLBYA
         onEA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9kNcfUiAr+oiDGhqptVmFHx2rAavT76ZxdJS4B/4JVMrSKzzR9LxBtDyT9qJDHGw+fBBpAhWvAblrbIELat0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxI6iJMDSnaxasphw6yLewuxfuF5lBJQMw19XUBzTGft2rR/jwJ
	xEG/k1CAIl2JNYLgPGX+haP4O/Qwi1jnRmCZtIK9VKHX6TGGIjLrN+qK
X-Gm-Gg: AfdE7ckfGA7uHJ82PsbwlPaY8jgFn6EJSBSrIMVyWZUqiOvW6+uVHKMmnMLvHseN0eJ
	x5gmusRKsx94YBBw4UKZ4yb4Y6ZDz1qyn5WOYp24ICBkNBKEtwPqaZDksO00Zh4HPrhvY7KRJTe
	z1qoeIAk6K5ke8FxX+RZWed1bhXBFfanvF+Xz/xxTMZA8LeYDD6Sdp8v3GpKCNggZhDzafbihDQ
	q9eopRpvY8csM+HVAzQ1es73CxVRQRMcMt7bZepM3SHJHXwnz9G2BOiZWif4cQDxLSz14uVZDNa
	TjIoWhuCqjcsBAsVYEzGPvnmotHFfDVqduyE2B2VU9jJC6SMk+s2vJja9AT/TWC/TRqY4T4N1MY
	1d6YDnXLUaJXAW+7Ta7i6j75XkxOAabi+Q0i1BhtREfQG7aaIEJLSkj6UulgfraaACAZp2QLveu
	7zSfLaWVv/bBYo5lBqhnKfAJMacGYeX2GM4jkEHx9yG/4tbZY=
X-Received: by 2002:a05:6a00:420d:b0:845:d286:1fa2 with SMTP id d2e1a72fcca58-847c0a399b8mr9016889b3a.49.1783058263154;
        Thu, 02 Jul 2026 22:57:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:42 -0700 (PDT)
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
Subject: [PATCH v2 22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:53 +0700
Message-ID: <20260703055355.244898-23-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l92.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..07bc303d9797 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1892,9 +1893,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1922,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0

