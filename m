Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0743CECB
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515128; cv=none; b=LpnYN+DKNMQ+mERcGFbn9v6WSbzgH3u+KIRHJgk7CmFY3CzcCF1oJcRByhlz5AC2C4Id3qNd73ALwMCTRYeKi9YvX1Yh1fq8KIcYq5wS3VEjQXR3S+TIT8+TLkpcTE3uwzX384P3PKRKV1fud3NmV9F3z9PEXUAy1e/5riWxJeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515128; c=relaxed/simple;
	bh=/r6IWp2lq/IqX/xitXazGqvOEQK7A7aRycIG7RzU7kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBL182OIIpjRZsaVlcngM4QX5l0PZu9OX1rSU3MFxFUBYxQSShNZX1hKUOualbCYsZ+2lZwTGjoFRCBcVhclGxBwbQyBmS0m1Q7RM4q+ZT+eQuQuRj5NYjAmxLCYpzMv0d4PGKc8aENPt6vn5rr+iW4LJtCHtQ8l6w5lffPy/wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nr8gnD5O; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nr8gnD5O"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso508143a91.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515124; x=1784119924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=Nr8gnD5OH9VUZJ6ObpWzn6wVxvdWMRHDGSSrosOOumdZsbwAI+gDjBWbBtLQUNEio/
         z+sU+IRdcb6mxYAsR7Hx40QSpc3QQ1DNnxvEsMQhLiUNmTNyUnwgA1RakLBmbmoKa4rY
         k0G74ui0rC5ixOEd69x8zOLoUB/yv52ByUHy/b+XWjfz8XW9Y4QIEwSXK9cNb8jOTpx8
         falwb9EE92U9+kTo5pB+JOtoL6MOYigQwfQNUr3dT0DR3Epi5r//nz+0KyBddsW+O4oh
         2aqdmRcy81ar69HSGLV+sUzgyar+aCpRpFWzoWt9YwWrAM//Egb8a1Hl59/ZpVUffoeS
         CDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515124; x=1784119924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=M2s0WzpNZa2ueX7HpTxN4LW07eUMd1Bxnr9SCk/zTy45h3NGAEB4EeRWNyotFiZC/B
         A8fu4PhNCQiu21Gf1Jf3KH4V4PKT4wEfgXUk8s8+p1j4G5F60JY8vn8/zIadlpGHdL9I
         t6sUBCiQAQtrvWM1m9OFWf4owNmf8aKtGmVafxrndr2oTmVd5xxSkgln0RyT441uAkrC
         5gCKy8gqYbLwfcIn54jc2P7V37gwx3j4neDPHIK+30cC6HwZMTNhGPYLbMfPESPSqjEM
         9nQYxtJWOEkid4pmUed51vWlDw3yKUc4Akjp6dAY8J6Tza+Lu9v76dV2UzemELPF0ZUp
         NuDw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/jOYkKXda4MkHea4KirTClATEJjm23ahRmisD93cfqXHq5NZ+YEehFSBDL675ZZneoTrt5c9LBxNaeW1l+Bc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQtbbfip564qTQzEfKvjJY/sZtOUKPogImTy/6M9BtAp4zIcm0
	yQhN4G0xQtBdUlTMDYKpWDIXc0DNLHQqouhwOI6930i3IFsFw8PArr3j
X-Gm-Gg: AfdE7cm5GKjlY71Tpp74EZ+dIz+l1SLBOQXVHrkAdoB7lfcFDYnFpld2/xfsypyCSkA
	h2jbvDB32GwGcuvfOelAFwIRUFDRuzcJVy/LbRrD/v/B4L21N9nKwXe+bHCnkcueysjrgiSS4QA
	cavp78wxfIMk4lBlUMyUXaSN0zwoChpdMs9KvyfCBxAFOAq3sWTlXQXPqWRLytLrhfrv7zWE22s
	3/F0awvWue85tnoRbzY17/IQF1RvbUQ3VLp1WIjSnJMSqVmCqQ4WfHG6eLt8Kj0Z38emTfv27ME
	7AC/oQ+E+wZNyQouWoF9A5PF8c7S7gnFJFfV4/qTKs50w6YpM9VutLPYJRxI8EW6m2aZ3VXSw2f
	wJ+4jEEBPTqHWCSy3oAvfa+3yxLmE0l4i9XZOpDDwge7bvZPIVoGUmSOCgLuQLe0VeGQ0ZXGZ0H
	wgXmtMf1ivewawnlai0VuKm72UkzBq4dsRM+dS3b2OYTvw9K9C1O4bLbGW2Q==
X-Received: by 2002:a17:90b:2705:b0:387:872:7b87 with SMTP id 98e67ed59e1d1-3893fc69416mr2611311a91.13.1783515124243;
        Wed, 08 Jul 2026 05:52:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:04 -0700 (PDT)
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
Subject: [PATCH v4 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:49 +0700
Message-ID: <20260708125002.202515-13-phucduc.bui@gmail.com>
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
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs-amp-lib.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 371e99205b58..41a9a5b005c6 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -7,6 +7,7 @@
 
 #include <asm/byteorder.h>
 #include <kunit/static_stub.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/dev_printk.h>
 #include <linux/efi.h>
@@ -83,10 +84,12 @@ static int cs_amp_write_cal_coeff(struct cs_dsp *dsp,
 	KUNIT_STATIC_STUB_REDIRECT(cs_amp_write_cal_coeff, dsp, controls, ctl_name, val);
 
 	if (IS_REACHABLE(CONFIG_FW_CS_DSP)) {
-		mutex_lock(&dsp->pwr_lock);
-		cs_ctl = cs_dsp_get_ctl(dsp, ctl_name, controls->mem_region, controls->alg_id);
-		ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
-		mutex_unlock(&dsp->pwr_lock);
+		scoped_guard(mutex, &dsp->pwr_lock) {
+			cs_ctl = cs_dsp_get_ctl(dsp, ctl_name,
+						controls->mem_region,
+						controls->alg_id);
+			ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
+		}
 
 		if (ret < 0) {
 			dev_err(dsp->dev, "Failed to write to '%s': %d\n", ctl_name, ret);
-- 
2.43.0

