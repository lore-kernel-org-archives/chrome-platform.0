Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DE8264FBD
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515206; cv=none; b=Bqqx2EQjgbRzV4gsbAffg6OW3BWEBQZBT+bbm0XATQnT83yqFeRaX4Yj7UH8qeekk8gK1cGWs9bk5ua9am4EPvAJXjSum/fgqlTxoZ4p8ZZ2qmbVUx1GcGf4E0Xp96BgpvYTx3MiQVXFZWNgxSjdHYvvenAzJUXVNLhl1m+/Uu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515206; c=relaxed/simple;
	bh=7j86E9nXxZplFGdBXN+J5/NJOmhWhrCy33LKfn8VhNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6tUjf1AREB5rPNdLd1W0i6ALMClrHZcce5DVJNo9l+ui9MEHKI/BejX8zmv7XmYhFvZf11hwTF6pIf7DY/Va/HQ5dlCfrU2Md77YZmnueJpGF1qFZIUh7SjbbgpftxI5Da4DuW+o+KVcwQORJ8rVjZI4UVqdUv3WvLDexzoZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMWpj8y7; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMWpj8y7"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38511175ad3so495519a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515204; x=1784120004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp/veyII4HIQI9OcBqFYAzKDNTS/IeWDlODSVw1jz+w=;
        b=LMWpj8y74ed3Si3HvhjpJ4S3wtNzV/BKbz3a+aD8jmdDTw3eIGayeGK4IB5aVXov16
         yvoLMWoW7hGWCPstA1l6zWrG4ccKcoLP7qtwAkkR51sJbbZnPCY9Qjb+i7u/1zF6waus
         GDqPx6czCpAgfuBf+LOqdE/ja7hcAXHOoa8pIaMus2OSEssv826LovPEpBqV8z7leQzB
         +Wal9mY8or7CqqvDo85XOLFrClMEUwBGJbpkCRM/wCBaF6x6h3l2mkNIG7Lt175R8Tyj
         exHeZ5LbvL4dW/hVyNT89xQEO/3nn9N/PEdzAi2GCFBeKkS84GO+6O9qC8tqIRAfLFY/
         CSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515204; x=1784120004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cp/veyII4HIQI9OcBqFYAzKDNTS/IeWDlODSVw1jz+w=;
        b=XA9E2gKcn4/cDa1uEtThPVDt+8VvBt1b/oIvGP8qccskkwZoEyfUGOsVKi4jyuL2+t
         anRuglM2jSr8ilnepsGtAfpgPApBi4SqPSc9Hiycwm2hpJRHSgf20jGD/2Fwuhyk6ay2
         BnvobASMPNsaqN0R2VpY7aoVWCQ0trumPY+KTAK9bpi9lwY3hU0O7S9M/olKWqTF/+Zh
         eqxlNrdi0WhhV/WOEYEkmLqfxSj5dtLabZtVLzB2BL1GEjh4gCniRvR9G/fCB9sypsFK
         3AnU6C9WAz4gB42J0aVg9IxcbZWDcq54Bj+Axx+gOBcMSv0I3IefO7sscRF3Q3QxJboP
         xdfg==
X-Forwarded-Encrypted: i=1; AHgh+RqZJQ9RK2V8MSIDpT4Eb55WxmIgvAe4VwjTwWJlsYzZihwnAETq3cXmeseOJAvUt6EsNeffSPv5lgJQ3Q60ghw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsBdJmF84oA9grTV3+cgR9P0w0NtG6Frjvi/1T6e0HOwCW65gA
	38eOY6wCe6bAjNlsVR3ivrG5rjOJcqHugPP5LIr+TwcskCAmbODUgPY+
X-Gm-Gg: AfdE7cmJpgmvafZXW4a7Q+6QdAhQy2lFUBf867/l4I7+6pYrlFxT6DVcJg/5Wi/NUzw
	a9jf2dazxIoDiMLO4MfXG0eB8v86sa9AAmmOei2sI06VI/qLl45YGBhM2VhZKndiRAIG5elHHV6
	fVH0CnpmsaJvcOsZwT+Kw9/HDy/+tZXxk+Ee7pLRDoGUS59jrbyAdUz3e/X/sq0ujQPH2Pwiy0j
	337/uZ0NoMIyiNShOnDi0nFCJ0jCqUxLnOv89yo4TeBdiZDnsPOJsBSIGtkDuHC9W5wFeN0Jb67
	CNYMQ5bu1uTupsBzoDNMCwUVo1BJ7VMGhdgfcxl/gsEV+jLTe2euOJMZytzHxfsFisW3uT4KhfY
	P27P/wTzr+ry4/QQ/NKCAjI66Q1nUXEFIv56fy7mxMN44ud6uoKt1vy73zvNXtJq7ONXnXmnP38
	Dq08HY+M5817VAyZtRgmCtC0YR7fW0cQWWTBodLztEKHHLKy8=
X-Received: by 2002:a17:90b:3d4d:b0:381:fa5:521f with SMTP id 98e67ed59e1d1-3893f694c2bmr2441929a91.3.1783515204398;
        Wed, 08 Jul 2026 05:53:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:24 -0700 (PDT)
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
Subject: [PATCH v4 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:50:00 +0700
Message-ID: <20260708125002.202515-24-phucduc.bui@gmail.com>
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

