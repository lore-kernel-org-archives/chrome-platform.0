Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EF138228A
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401270; cv=none; b=Jt2KBzLOvnpogCH9/oi9zWlnRUd6aNSTU3RA/UwBMS/PelQ1aE/Zb3tmVD7a/lz2i0H8V2Hr2ZxCf3qH26JmKe9MAYepMmn5lZVniJqFaPNaY/+jZ+Kmlcv8FRJZitrnFXnwY8uSR2zMdW53i3NmNliIU5y4ozuGuI6s9zMGPPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401270; c=relaxed/simple;
	bh=7j86E9nXxZplFGdBXN+J5/NJOmhWhrCy33LKfn8VhNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vh0EC8Cmwl0m9JCYWBUjQbVKa+5lYb6OwA4tQb4sCG0uXZ1DOOPHT63QSgsgw58b1wMw2bxgWeCX6YZYf7lvI27xACdJLxSfEdOtHM7naD1+S19+43njvkFZSK7mWclAk0pHpCeBcXAbPpYyBJ4k79ooTiw7c6R/HDTbbO77qX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr9WlBRD; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr9WlBRD"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-847968ca62fso3931506b3a.2
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401269; x=1784006069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp/veyII4HIQI9OcBqFYAzKDNTS/IeWDlODSVw1jz+w=;
        b=Pr9WlBRD/fVX+RVO8/QDSLN4l5WAc3OJy0uTiqpvj2yxlAOlkFyAveoaHwsKtZOq9+
         7xI50couzr8GP7jWGT9HNCm6eVQLE0AhORCmqHN9Xd/eqc3xS3s2v1nRrfTeBjSQjA25
         ICKgEcXKc8RGI5fOD+1QUPVTuG4f1bATZ3cjmlkYB6XtEMsDXfiR9S9hYxSlXZmumrFJ
         tnSh32ICnqZuRBtMD2cwlnS8fjerXxl1ilM162rvv430cuGyQR05imHYoy/Mui2mKDkx
         xc52riXuFgdeLnJUexI0hsGUnB8Clho8bEZCxSbeOZz+OJDZuFF6PxcLEibfe7WLgj9v
         WvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401269; x=1784006069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cp/veyII4HIQI9OcBqFYAzKDNTS/IeWDlODSVw1jz+w=;
        b=jG6zfl8ieqwiQeu1PuaStXq+ehmqIjajJaoVATVuV/hJvnxCUr4fKosTkG1Mesqicq
         ou6Y5/MoqohW/FoCKS+8eGYR8ceacAAof3TaAZvNPnHBxr2mds9fgWI8yl20M/TvFma7
         8dCGE49Q27A07q42ixVjpn6GaIRIri05Y73FdlwnbwRjMAI9GCEN31uo/wQJ8V0bqajv
         7HRvwwzFlq4hcoh3n+EV4T0GkctXKip2HscwY3LJrgK6jYZQA3Sy7edQYuRBBsBgcjHO
         /wzUGzIG1LbQheJi80764wlT4tfvJAdfXYA6UA063pIrdVBsSbYqUwf4/cZmFQgFs/5C
         uHWw==
X-Forwarded-Encrypted: i=1; AHgh+RqqVQu225nvRI7lZ5GC+7JqHSRKRAi7qhcmozNaC566gwfFTc8csxCuzjM3Vwwve1Rm3AojMJ5kbdf8xt76ocM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuZQQ7TH8pVge0x33xp2j73zseag/iEce7RV+OLxpw9iZBAZuR
	XQbGbY3gL86fDjXCsKjB0TlbG8RiWkjKWK7JWDt39jbtpHl8CtAPTNyZ
X-Gm-Gg: AfdE7cnCT2wP4wyNo80EPGbu7/VDoBo0JYohlmo7V4iKDH/Y/AgBdXASUFyYFIbyyWH
	G2Qv/LDhpbj4pKD/5Ffpxn92S96N7pqJ234wep46rXY3RUR9xgIwtP+gjaR1a2Xy5bhZMUb9h78
	GqaAXVMl94HR29B6oKrjNaisPPHyhgftpAfi5dTfQn+y+szBJFvY7QjWSWKswrKguCGNS1RR7mS
	LGRUnGECHJbl9wHoYUB1h9TbRjQoOp3+k53hQia/J/IRruQa+5X5sVABc9h2wHbz+gp0ay/urur
	cGJ0L0KcyLM8UmwWe/2rGUMQzQbtBKCOOpLySzkw7u88HDqoWAuN5HAtLo0tWk+icXSTzhbStet
	KLkGmw5YpzEy2vKkJcN2McxZu6XE1SHdRPqt1WnYcSIYidvwkpnMMOPUWqz8IGPThJAUH3Tnede
	HVRyJ1729wmhkGWgG5gU6MeaFMmh9pl3MSBEfnTOGMa640BQo=
X-Received: by 2002:a05:6a00:2d18:b0:847:871a:94ca with SMTP id d2e1a72fcca58-84826d24b26mr3505351b3a.41.1783401268848;
        Mon, 06 Jul 2026 22:14:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:14:28 -0700 (PDT)
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
Subject: [PATCH v3 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:05 +0700
Message-ID: <20260707051006.20058-24-phucduc.bui@gmail.com>
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

Changes in v2:
  Removed the unnecessary else block so update_bits() 
  is not called when no changes are needed. 

 sound/soc/codecs/cs48l32.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 086ed0f57a85..a9967771124e 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -8,6 +8,7 @@
 #include <dt-bindings/sound/cs48l32.h>
 #include <linux/array_size.h>
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
@@ -236,15 +237,13 @@ static int cs48l32_rate_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	int ret;
 
 	/* Prevent any mixer mux changes while we do this */
-	mutex_lock(&cs48l32_codec->rate_lock);
+	guard(mutex)(&cs48l32_codec->rate_lock);
 
 	/* The write must be guarded by a number of SYSCLK cycles */
 	cs48l32_spin_sysclk(cs48l32_codec);
 	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 	cs48l32_spin_sysclk(cs48l32_codec);
 
-	mutex_unlock(&cs48l32_codec->rate_lock);
-
 	return ret;
 }
 
@@ -2242,7 +2241,6 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 	struct cs48l32_dai_priv *dai_priv = &cs48l32_codec->dai[dai->id - 1];
 	unsigned int base = dai->driver->base;
 	unsigned int current_asp_rate, target_asp_rate;
-	bool change_rate_domain = false;
 	int ret;
 
 	if (clk_id == dai_priv->clk)
@@ -2284,19 +2282,15 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 
 		if ((current_asp_rate & CS48L32_ASP_RATE_MASK) !=
 		    (target_asp_rate & CS48L32_ASP_RATE_MASK)) {
-			change_rate_domain = true;
-
-			mutex_lock(&cs48l32_codec->rate_lock);
 			/* Guard the rate change with SYSCLK cycles */
-			cs48l32_spin_sysclk(cs48l32_codec);
-		}
-
-		snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
-					      CS48L32_ASP_RATE_MASK, target_asp_rate);
-
-		if (change_rate_domain) {
-			cs48l32_spin_sysclk(cs48l32_codec);
-			mutex_unlock(&cs48l32_codec->rate_lock);
+			scoped_guard(mutex, &cs48l32_codec->rate_lock) {
+				cs48l32_spin_sysclk(cs48l32_codec);
+				snd_soc_component_update_bits(component,
+							      base + CS48L32_ASP_CONTROL1,
+							      CS48L32_ASP_RATE_MASK,
+							      target_asp_rate);
+				cs48l32_spin_sysclk(cs48l32_codec);
+			}
 		}
 	}
 
-- 
2.43.0

