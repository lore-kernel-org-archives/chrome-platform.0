Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D773D566F
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454567; cv=none; b=l2eX7XPeHD1VIdSuagjIlxk5dLBTUIE6XpM8dDyAJmeedlmvdUH6+s/jNUXu2GdJjth0IUp87+NqlvoE++oWTN3gZAYy/DXL8GNXYHx+NZYSwHwtOfc32RowdH5o8gWtCDtISQNJDNgf+R2XNcvXbVsD/7sv8vCWJK1ZEuGaDAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454567; c=relaxed/simple;
	bh=4u5h0yVn9yjNIfqtU9rFyysttAZ5X//E9h3Qe2r+g+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J90VH4BLMFO+1AS6Qzrn6luD+/SsblohOU8QkTmLIu8s/Imm5WASxZ9NWj5PIeaDlWTwTYKIzzCqbJmJDLMUvnXJB2Ce+goZhU2lx9T/lwjkgMN4/E+uNhG2poKe5LQ94o74uV2wnzAk6tAwzglfPVerNvsieCVHeE78cHFLwg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHztHame; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHztHame"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37c6cd1ac98so478138a91.0
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454566; x=1783059366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m86tuCHiDSXFV1VRHqmj5im360M3DmbD2YS9wwBnIRI=;
        b=QHztHame0lD2k1SrK7H7FyPHyZM+SQ9Q7js9sr7mEmvNptxiNa5CMlG/H1bercpMCn
         CuxaqVxS07G0X3cLrU32O8T46rET5VUUj3bSkNmKcQcoyS3Kgkvvvc8mHLGtxZBg1+de
         3tVFArR5rMY3sctGsklEk/hlXSppDlRM6gpWBDcOXTD3zjqYYc8MsyH93TJyvUpKDVsu
         /mKdiWhceMIBPhF/h+9rN+0pKie5ZHa/u3zhE90L2pkrq7mwXi9Yn6LKy417MgJQUGqG
         v3WEQfHg/Z5sEUGygtWnx6fTOKUnr0TGCrvwvryvLu3LDw9wEWdHxH1/Ie2oZbVE4wCI
         s/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454566; x=1783059366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m86tuCHiDSXFV1VRHqmj5im360M3DmbD2YS9wwBnIRI=;
        b=eUN8udCXY82vT2N+ZO5mX/esw94bRN/BqUHLh6PXOZf50cPiYBSCI31HADPiEbjUlJ
         b6de3Jx9narlF0AZr8Fylzuh+6CEABpvEhSP1GVgOw6xj4srbWPgRVaoaxdBkFo67rLU
         huyvy3NrGmdJxUo/mqDi4EjAdm5GoruLuAxN5hf5GOIXx8p6NCKf+ObWrhfCMIj1NlZ6
         gmQbx1BPDpiv1Jkv0JdNZOgip9R8K71F5yclhtRkObkFZtOyMZpQbjolOIECrpazDlrQ
         y6qdLhoWbuWUbQEled1mgYzrWtlZRr41FaLvCmQCOIYpOLU+ONOAnhulfmmPqEnKlagw
         ecMg==
X-Forwarded-Encrypted: i=1; AHgh+RpVUkPRiKQsatRWO9beF09BYV3enyNhzxT1Is/3EOww/XIXI1QjfOj1YT2cWQxuBkbV0dg8p6OfwjfQtEmsntU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yygg2g6SbgPLzwMFYxBGd0oTNy7I0IzdNsg80afqE469V8fwiAB
	eHN/tu56oQvcO0vzsmvIPUrsh+NiGz0hAmhJiRMBkQ4u/Uf0F9IwWeHB
X-Gm-Gg: AfdE7ckkx3LZW+VHpyqAF0wtJbpzgkJAzgDYDoXLXssDbcIuqNwZlvB+pXYkSPyenzY
	zuoDttAjc8pBRylvtzCy3WUtvtC70qbPdS+zyWxvWUOQ/GgAYgLzKulqnUSw8cLSum4otXm3zue
	pn49hugN3WA65PlIvKmTsksKXIdICjvqwA5jlcq36K+Y8Ru7CkacFFFH42PTu0o9ek1ztnYKGBD
	ly3++Xax9NykeRQU9udcjJ/S1fMx069nEVKQTTDRxz49LKczaS/2tbuQUOYCyUOUEXQ4DaIVucv
	KZd2T4BvIxgvU62q8bK4An9HvfatJ9opLb+3A9HHUq1fc6DLcPls2Ov9ljQ9j2aliBB3nB7J4U5
	dp0o4rOLnU28Rvkj8/vhDHEitn5c0o3TwlBhP3ND5klpe5SSam4qVkAe453Rj24oBi4SMlXZzWm
	GWuWUY2+QjqnWPYT02JXKUnlgh5hSTN4SHx/qraSCmkhvFUg4=
X-Received: by 2002:a17:90b:3a47:b0:37c:6505:e7c3 with SMTP id 98e67ed59e1d1-37dfa274673mr5403834a91.22.1782454565637;
        Thu, 25 Jun 2026 23:16:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:05 -0700 (PDT)
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
Subject: [PATCH 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:24 +0700
Message-ID: <20260626061329.23264-20-phucduc.bui@gmail.com>
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

