Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C01A3624AE
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058273; cv=none; b=rxzJXNtXHcVi3ynOMq9oxWrPCLJTHcqGges5AdT/UVvJJQu2qd2nmVi4CnsN2ZNFg5koMf+82yl3pWqADfqe480DrDxQbMOUWF82vmOjUSUudZC+gzVVGLk0XnwF+n1pLgKqqVAL5Bq7qDiQtMHBlTpY1JYcbsVbdw+sWWvtKsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058273; c=relaxed/simple;
	bh=MHB+vjFfWlUHNNfYgxS6YYgiZANX31/DVhBYct0rLOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+mlB1zHI7uZ4pwfYjv7tvPwX8Ue8x1Npo+ScwJLALHuaPADP8ACbFsUS9cb3Psm76WXsSnN/Hi4mtdCLmP8ot5/hE5KCtsZNqWKFY71BHRJi3ukoA6tbHbpZeRk3dHNVi2rkeoyBpkdz9P8HNpcxYIuDeGG11Vlk2261Ue3wJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/V+GLXO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/V+GLXO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845ea8924fdso221245b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058271; x=1783663071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FzZIorP4Bzh+1kJvRnQPSqCkVRQdA0Z7VAbqDN1WCU=;
        b=O/V+GLXOA6uwMEzVz3OQh0+MQcOhe3kcba1wPygoz4JIxnMHk+i5EqxgNK9zkyJ2So
         ZXAbsNQUkjM03EzMCw4J/geYM5raxKU8KYyk8SiEVX0vee17kxmNs+5RdUInCDJ3zIBB
         0Eg/mmc2TGD4GXIEYTOJs12/bCylY4HMR/g6peak5P3RWIwOuoqLZIarekCLz3NbGwCM
         cta+T+qD9AICoTtrh8def6prdq3NuDOyxunvYOfqwlYymFMFg6eXL8wxqjjYatiWuoNE
         8BxOYKJD2dlGfNQ1OgGIWi8JlQt+0t3xAzrDU53MuFWaMMba9W+2RHa7GIPsdzbw0XaD
         o11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058271; x=1783663071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8FzZIorP4Bzh+1kJvRnQPSqCkVRQdA0Z7VAbqDN1WCU=;
        b=HHaXuZapDx3tifL7TbsS9wyD4K47PhGCuTn55Ej9WrnC3z1N1ZHFQc+xjsU4//PKiv
         +h59ZQzeYu0DK+C5sbKaUhKsR3Fgdn7zNTXGBOXoCJsxJwFQe0JVPI6Mtrv87ZnjDJQ9
         qZXiTogZUzv/+DZw7W6udIIby6fp60F/arvpvfFbDXDmnu5VulvZFPnWaHutJ8KfAUnc
         K5vfdydeDXanfoy8Oz6pyVhZhVuS80opsgNWAfhMl9pC7HLyjXGmgi9NVoTBHQnW9WVx
         IK0Bz+QygfQ3dbDjU0bqVALxiSHYvs/nGAoQ/MfQBoh0OtsuiEVxzhGFVwRatZrKMp2q
         SO4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/aAbs2+61czeTSpxgumHlyENzdnQSbNyoBa9b/JWFovADIQW8X1G804XAdDvbCuJNrZ1zOKMkroI+SA6CIEZ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzNB3J5g9bj4Yg7V6l3vuGyEkM4im+oXo0lBoK2ltoT0aoQt33
	m2Ipi2Z65grVwaGs15eazCLqiyNbiBl5GcKJ8zdfFe3IPs1t0EXxSS+w
X-Gm-Gg: AfdE7cnFaU3ahfSZAZeU31pH+GFea35BrJINfxkxVYy/NfNYZDEEQhChKE9TNARIeho
	FBEK4AU8cDkchp2CkQdmbGBHjQcJ6qGMlN9TgsFWInkwnjc3rtcc8abEiTmEmFHc3SIakL5nrwv
	02pft0E9iwwrcxnMPnZrrCiXJjnn36qRzjZokPapwr19H9LdzkXArtwXidll3xsTsIKKXV047s7
	9M4ETQut6a1gfbBKyzdCNuiQYWmM00vrpI4zLs2C/ep6q7hNkSqX7vGaRZWnNTsVZ0PZrz6CAEO
	4ycoqersZq5qhEM/9NvxLJO7bHFm0LNLjAZaeu6M6wI4ltFIlEb917fRldT74BOR5aZRT9qxh5z
	zG4Jwai1NLs2xianDM1PXlbbL554elWuICmitYmOw7GxLwt9PPLOsG2n1GqaB/1MmRZOukonehR
	BEidMnbi2KsXl4du7Kk7mjHvhjHF1lYBMBfVs7kQXeLeHUEo4=
X-Received: by 2002:a05:6a00:944d:b0:847:83bc:d2a4 with SMTP id d2e1a72fcca58-847c068623bmr7752438b3a.2.1783058271534;
        Thu, 02 Jul 2026 22:57:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:51 -0700 (PDT)
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
Subject: [PATCH v2 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:54 +0700
Message-ID: <20260703055355.244898-24-phucduc.bui@gmail.com>
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

