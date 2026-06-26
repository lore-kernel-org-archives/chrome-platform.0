Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1E3D669A
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454587; cv=none; b=rfWUhLUhKrUF+oudvMgN5UfaChG0+DNDvNjQEway6bsmFtJxdf77TEoTzPR2WwnBssXd9WE+RJ/zh9yufMr/YNyURf3YDEL6fBQrHNPlU4nQS/xKIkZLVYDkRteRpC4aHZh01Bybkxcqz3VcfsMQDQFFQItuSCS/zdfpszJ9FZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454587; c=relaxed/simple;
	bh=w3jvLBlvAQpe6p5TRiEK5F7wPOafekRIEHEin4rETy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kdfKAad3g3r30uJAFXOPWkwUzHX/FXf/jA4vtfj26omhTjPFOdMd4vrB+T95iy/sJSix8yitUQy5TkoM4UtgPFXnMT6WI56ZoQ/9gojy3RnhWxkfr3LQxKhv72dBCWN0BdciSeZ7eL1z87cQI3ONKkIe6U+63FGGWwMaVSPhwbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heJ2XCZh; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heJ2XCZh"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37cae998401so277561a91.0
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454586; x=1783059386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAwcKFKT59MgIybmzJBQCtn8rBNm1HXg0BYQomquJmc=;
        b=heJ2XCZhzo84ZFwXMc9otL5wjZWglskFEOmaOBPZ0GKxexuNIE6pfa30UOAcxI47U5
         nz1Fgxupkah/UONf983M8l+Fswq9hVinB+hfN7bBncBKXmhlDGagEw2bybHm7h0Djzri
         bqLwC6cXecEwZPBBDb7gii6aVNboUppOTBCxlMOp1st7U+SJyL760N5ECrd+Iz3uE6IU
         wC2etE2oQ6l9LIsEP8OR/WgnF5tN1cBoSEPvBYnXjEbkZGnLHTaZJWLJys6O5nhDyMHQ
         G/kj4IZuWQhWbQ+5sjSS89xvyeC8Tg3Dt6id/b01Ja1voTKtmgPu3qRxSXITikAvS6+V
         hSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454586; x=1783059386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bAwcKFKT59MgIybmzJBQCtn8rBNm1HXg0BYQomquJmc=;
        b=hbPy8ABK98i2fmcFJLbGGPXHutHnHTaZCBiie0kG6a0N8YnW9R2xaeWPIopzc7wFxV
         orNzkquCXZOVV0hqS8V8NcNdg2BKC8dibFaW1JtfTjLxEm3fgOaElN5oiGXlm+0qzAut
         DN4q8bXcAcAHDhrt1uRkijcx4TVWg3Uy/mJ+v/aQ27DBjnaKKfeUnNgaq9BjtjnKZIvE
         ahMY4n66jFvnfMYEUSD+qAyyCiXR/4tyGjc+7/rq7iCxSGmj57bRFdp3gNmY6nOHIY20
         FOQhzMar2ioSJxdQkvXsHwT9zUtIFOHZQ7JhLlanh2kp1EqakqEyILjxOP4G5U9i7AYd
         JYOA==
X-Forwarded-Encrypted: i=1; AHgh+RqUQZol5HorFuSM19iDBi1cKJvLj0vXsEYtIRqpAgIyiYzEauUqA9W+jiTagbhvOftCvbaZva4V2xzCfZmdMF8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3CJuDWnX3S/irBFueWbhhX8QmdpPkQYI01AMOI2KVql+W0AcJ
	nU72A0lM2BiUqPp8LQds6WR0x9TqxERPxD0Rp4KpatxENAs78Qlvaz6o
X-Gm-Gg: AfdE7ckpC2HjsunKN9vdf8PG/eYGfKqeYQIfcrA4eutAVZzSez7v5kX9kOD2GaShMC/
	qWtN/oyqe8vU4cnqJfqpn/RGkKVVL+DCxomKwL4anzzbJzzSZg15evua4CcDFhQSmA5sp/T1BTR
	VqAuDZum6ogLzgr3PL64NppYniJzysOGeCMTFtw1VVJLA76KxgZNeoQ4LgHy0hBtUXGvJvTJmG5
	V/dxV2h9Al5Xq6B9E0nGk75vOZjKR7Wh29QGgBRnZINC8oQBg4Ngav8Dn6x0cPA8FpHNu2KXXgw
	eYuWhTh8OztrxUw1mCdqfLdnOz7/PUZbNeuNzG1Vz6qFuGh3lW+0k6OTvpdXb3sUROI2CxdsNYc
	bH3jOz+oG4lphH+yYv7v6KWdK+//QZXTXi9tX1G23bfNnl8Ch2MhCvgaD9P65XwMZttePLs9AyX
	gm+H0cK2VXr6NaTD9PN4RbbMQ+NDxd8o1okoSDRlJbFLz1TDM=
X-Received: by 2002:a17:90b:2703:b0:36d:b818:f848 with SMTP id 98e67ed59e1d1-37dfa1a521amr4929176a91.5.1782454585959;
        Thu, 25 Jun 2026 23:16:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:25 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:28 +0700
Message-ID: <20260626061329.23264-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs48l32.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 086ed0f57a85..275528aa48f6 100644
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
@@ -2284,19 +2282,18 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 
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
+		} else {
+			snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
+						      CS48L32_ASP_RATE_MASK, target_asp_rate);
 		}
 	}
 
-- 
2.43.0

