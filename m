Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FF23D34A2
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454457; cv=none; b=OYgFJfapxpsuHxMJfDTk43EZ7NNv+D5UThZM2WDQyFdki/h8CPtVbXzqvsA27aQ/hw9hedpKNvTi2VoxDZ3T2JJSvABfds2vqercpQxEcarL3E6yL3FHNAGtkWGx/00Wll1Gp1pdmmecjMo6WcwWnTqh0mAeW5zlXxxejHZBbG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454457; c=relaxed/simple;
	bh=XBo9TFWfRkkBDWeIBbEHSqFNAD+gQAnKPasD7gZlVgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Synb3tbtiPZP/nXbczoKtx01nLK5YQ7FQBJWDj8KZxnRJAAQdqX+26s+uEtyPS78bv9lx1Jv0mQGxnPgBnSGM0gKXH9PUm6l0v8N3E4DwNe+ou5UrGtlVu63LJHCoD1OT5j2sUjJK9Ior5Z6/X0ujUvrSbFUZxQ671t9ZxsIk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dk784RG0; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dk784RG0"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37d55e8d3e3so320539a91.0
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454455; x=1783059255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CvHhZDuh9KEqGXTaRtE+YpkRyUyzW6BE6haBhiMpzo=;
        b=dk784RG03mgZrtdZlqd2VPs7qjrnlaDvAcqKuglUCEwRvbDfkdy96KYql66Rto6bcb
         auyVg5yK2yTxNwkHekr3U0kB14r6CTQk3LRW9tV8BY+AvxcSQ3D6FQY2QH/TgzYAzAnD
         K7oTGWdbyNss2W4Cc/umwpkXuc+vjeVHamKAvk6r4jO+49UTFoqAaTXsscxhc8X/vs0A
         QLo7NTrZNUgrTK4yo8HFxpZ6h8etHMdatrsrv73TQXqPLBypMrLGRJGEdkU/R7XrPFzx
         yQmm3bQIXa9WHhWU7Sui9AmVlEqCkICYYio6d2upSQ50ZIb+c7zOFGfTAM3TEC1jlP5a
         Qcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454455; x=1783059255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CvHhZDuh9KEqGXTaRtE+YpkRyUyzW6BE6haBhiMpzo=;
        b=oMmfrO4IBJsBQ4FKfdEYW2YrR68EkYOzhnmYMdpPgm2UvhbhqDa/7MfWeJF1Y6/BzS
         X1Uq+DuYliuJOcvPr4d3ktWXFHxq7c1HA1QFd51MhcY9ugVPVs8kxOKsMcLyV/aUmsOZ
         5HgKtmUO+oepNAawVBCNbCMzFCTsCQHwk87aWcwZpdxpjgCETMb9J0pYZ2lFH1nsD/Bs
         GIWqHtA2UfPHE1CpJb2EocxJggOCEMtTcFGftZz9mfxdYwcFXmeisJ9RAgWtGunD1b7J
         klS5Ejkm9DaYleFWbyVvT2gF6qpg48h/pHhlpNHsMbTmjlO5KKSU4eGyORit7yLVZo1B
         mHAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoR7xafTSXsnCV3NvU/mXFrE/CsKhV+e8r8fuWOTSEizVrpLBcsfwkin2ybb9JEo2JrPPcD2FjJrX/dKGJYczw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ7td5CREeGYfjngbr3sP3tDdpo+vqqbneRlhPOVx77hZS16kH
	rGoB/P80CCfy8C8cOTq+5X4Ru7LLFep0e8SCviR7mRN5SKFn+7Q0n7rp
X-Gm-Gg: AfdE7cmn092/fyj0+oxWdhzEre4Pk9QVaDBZ5Vhh3wZNuEsbT/NpKw3v47ZY2OrVQwq
	7GUQLdvJ5QTmSqpjMgzJq2c3CywEY3hpSWGdc++9dxyQX1R2mIUE2GxGbCWBrpiTLpYB3eArohM
	rpdbvrv/bU1S6e6SbpBNZIPSG6tAWmX5Fy0f3O0NUfob/YONyqZkN3ccOIFL3cPbLh1XIlEzjro
	H7z/IIOEzG4Sv9k/Yw3tCPFOO85dgc5wIB3WzTcO9AICO/zBoqll1FgpFvQxg+2+X6uacjN1R/W
	hCreR7tYMOr83VNihsTDVX045/TxF4kNI0YXZo/B3TR40J7SFVzOkQtBQE3ShJAfJHQsC5ee3FR
	cW79Zgye1OW//xpR+v3LQCkgT/I4Q4+tTy2VDuU9DvcmIa87u0taWWxIdElyNex9/0L79fplZuP
	GwBKWOoQrllmTp1L5URQBJEJzvqhxUTvmj9Qk1CnWopPP9cDM=
X-Received: by 2002:a17:90b:2f87:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-37df9163af0mr4081576a91.12.1782454455461;
        Thu, 25 Jun 2026 23:14:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:15 -0700 (PDT)
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
Subject: [PATCH 05/24] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:10 +0700
Message-ID: <20260626061329.23264-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw87390.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..8150670fde2d 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
@@ -225,11 +226,10 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change\n");
-		mutex_unlock(&aw87390->lock);
 		return 0;
 	}
 
@@ -238,8 +238,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		aw87390_power_on(aw87390->aw_pa);
 	}
 
-	mutex_unlock(&aw87390->lock);
-
 	return 1;
 }
 
@@ -280,14 +278,12 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 		return ret;
 	}
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 
 	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret)
 		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
 
-	mutex_unlock(&aw87390->lock);
-
 	return ret;
 }
 
-- 
2.43.0

