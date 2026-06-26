Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF433D6473
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454583; cv=none; b=upw/AWebE7aHn0hEUAaxvlboZl8ZnlPrgSuUjQUllQGbVpLfH0+5g8+maumNWPjMeTE/c6M6QA2Lp+W2A4fD9bZyGK2IsK7rUNtHs1rVvRSSkhlbL4iNZqx1Bl6Dic1w1RVx3dp1eX+49E4QPqCJBHQtPC4Se4GhyRA2You0+x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454583; c=relaxed/simple;
	bh=dHVEgQtwHDKoTcZP1GtPLCEn5TCpT4LbHpwMrUJxxes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=No324vKdUyunAKSZAEbiSFGRwH8MnXv3wp+XW3u1RzbvazRw3aBkJsTWd3gT4GNyo7QP1cprJA7RYbe1m+Ikbm5J8fbcQdsXuiobOxXNGhgKHh5zj4m/rr+hpdQEY+0WaC12voUlmVezEV+czkXvmNz+DKbCWECEEwt6tJq/b/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=St6B0iDD; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="St6B0iDD"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so376240a91.1
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454581; x=1783059381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOWrg/LzI+sfMKMDm+nskCSh0mSa7CPZNcb2b72/26k=;
        b=St6B0iDDdaKeaZLb71s60EylAHQxBQamhhmXHZyIt6O7eBYrnMZ5ztnOD3E4Q7xHW8
         zONaMADhEM6dFVjBrCxcsZlt4U2gJfz8ruG2X06bZyKp4Bun4shUvi5FEYSVHsmhAgaS
         VxRyuoy7T/Pcmh10FxFnv046Tm5hdXW1vkgPpumjJiC17oJNn5lr6jcynV6u3nqDkH97
         UnnSuHWsQep/PgRnoTBZLBdIvNleorDSVmI1sbBIzJ49AvyOKhEyy2hRbTbG3BCvHmNk
         5uL6kCopLkVtJRJp1ToL092q1rlDOF61PnOKjWfkLGlKb4xUXd1kv+gcL2Iy5DgxFVLz
         kZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454581; x=1783059381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOWrg/LzI+sfMKMDm+nskCSh0mSa7CPZNcb2b72/26k=;
        b=futZ/vsbyEDzaTpSID7wa8ygktR6HqW9ILqS4Pkm3Lge5WjlA7zFEvEOr6Ls17UxcF
         kumgopjKIjirb9CYfb1S1ezlVSgbLr0L6dPsRHrVMGyyTL9C1xGxyOC0XJfh4zguwg+V
         bXS+eA1TR8t4paTJV0O97XDTwahATV64DZyOw8jMohYMalRNx9yqrr99cnU2uyg+9Pry
         4t8PaGyLzXRqsxXzKFXjYgQMDGo6FlcQKs3dDkCcqYtRR2By4U4469dKVu++ZXwVsA2n
         L/hfhSGb+WqntNR9k/piqtyswKCgOGKi33+bK9/ab7pqgREdD0rD0d0lNUiFNlsn0tCm
         7jqg==
X-Forwarded-Encrypted: i=1; AHgh+RpSvtRmI6/Qy1CiB0tJxPf+EG1QpJzsorV7W2ai/7RDq6Sk37wQz7OZaOtEWqXJwetqf2wvT5SRQ2C8kzFXzQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxM8FpkCqqucIGNfk+u/42a8vD38oidTZ8D2EKK7E3bcuLNALVy
	kLgCGUi2fzDKZci3cTEjEotnO1N6OO0nLyNkLh/SSrxDiHfIhtzEqnDK
X-Gm-Gg: AfdE7cmIIzQt8XGLKldnr6Hzb1q3ksbM7CE3zPAGeKlWNJsdjOWnwcorDRj3pjDO2qK
	39OphWyt111/ADjjw5mXUdt9XvGPkSB1Fd14X3Auzabtp9jtzjBZ718xC7wZLYwaLIW5FPEs5d+
	II2VpUWhIu3r7gMB9EnLk7ytD6DQ6BUL8vXa7pvvBWAL7u3LblbVXZBJ74O9WyyUb9m1OsshyWd
	Vn+VYP3IM4bd4EfK04UmZAfsfzcU7MmVZDyFWGK2FmEEzKLiYUdHHViRckFcr9hKkNnF+UWtp/Y
	F8/O/eOPfOzLdq6LbsD1e/Kdnz5xFJMRyrVG0KYs97oRdtbeWb6BiV2m1MG0TW1aVZ7dvr5/VUD
	yCOBv42N5MnfyZdQD222PYPxS/k3x/Q+d1TEb1IMhwdQPpYV+UwFU7UbP/YG7cXBKCPNaxOO4vM
	wGcSx0AdU+8VOAEYAAGIZTO/UmwxYWKyAdA4EJNZNzsNf7TxQ=
X-Received: by 2002:a17:90b:3d8f:b0:37d:9874:935f with SMTP id 98e67ed59e1d1-37dcd701ea1mr12987997a91.11.1782454581360;
        Thu, 25 Jun 2026 23:16:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:21 -0700 (PDT)
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
Subject: [PATCH 22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:27 +0700
Message-ID: <20260626061329.23264-23-phucduc.bui@gmail.com>
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

