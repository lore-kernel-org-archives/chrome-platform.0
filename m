Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBC13D2FFC
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454462; cv=none; b=FMpQS17acagFwNKw4DIuIEteDHtqwKq38YujbxpCSjE+NScJhQXpDGu9+1JDAwO3Yp7V1eqNqkC4folqM35vGCLTnGgnAuSU8JHaaL8CniHKdnDW+tUYxozu2IbqVLdLNRubEwCB3/tJWk1p7J9QvXg4rm63BS9Se8zB7MAzLQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454462; c=relaxed/simple;
	bh=j0DXGRVUZGLFodFFZDuPh1GY1V1OX5hMwJceQFENsgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVIvOkzmcJzs/LUo568ZbV1CTHWhXLjG/2iuXbuPiEMiiKCHvh5YjZi0jYyRnnFllCzYjQq9lY1qkfkFhrFTz51a2X6592OeaVvSmu2XrEDVdXCiPhRm1tyU6yr9fDP1N+Ki10HncJ7LUITfvqZq1V1dq1yh6EaIKe9OVLnSsBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6Gv2llk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6Gv2llk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37dfcc2767eso743691a91.1
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454461; x=1783059261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=F6Gv2llkKOhvGQu57HIlSeW6Yj/Ee5mTC4XlMj8jQ2PMKCKHEnNrgCK5WDLSDWprN3
         x2cSBL2as3ZNBTqt1Nd/kr72hWdDrrs49/HFZ+mfbpyhK891jDansmSQUDgsmi0s24CB
         POs60Ytniy58206GYtSRxHP+snxQOgc0ZFXQExM4UAX7qKtRf4ZXgJDlTDsmNOtbqzEX
         qW0aM0j9cI+bHL5lQRlNrWrGHIGLg7oX6vdRKeFnwVIc0iz/u2AIapCX/VmjQkxKnd5H
         7IRWvW7J8TQB0xqo+a/4LE/90vSBW6Y1w8MOgwDRMdWQs/zD/oHo95NiPMYd7LqrPVJH
         8jVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454461; x=1783059261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=R2Akn5LOk30OAamAgKiNDJMV2BLJGWNpEr5jKcJZGg0HZ7qm7B7w0C9I2VKRYLZKzp
         E84VhKxkFQeG1LwQm6/giLEmTcmV/4B/RcFsf2kALoEgmplEcckNeS2mRk1YxENqhtsj
         i3VmL0W80Hke7e05IcJkXiLYHuA5guOt9ZmsSIZsf+tl4kuLbTiG85M6TfYDiUqBmQLJ
         8JrOrx9uVatZwCqtzlp9aR9pIg2i+K7nqGRrey07JUm2Wa33o+AouOzr5zO5cufF/mt8
         goYz4Xe6unkijscZ4E2ipJAB1IZ+vysJl9n6E2mPzEpMqxOpTjlZ4VbDbYy/FxK9XwxG
         5Fkg==
X-Forwarded-Encrypted: i=1; AHgh+RrA82c55B5gsKkT2KTGiihenAfnIEoLs0sEph5X4s3J5qXauTY/ZTl2bhPuCBLecRoAW3PI0jQ6XA4hY9QtAAo=@lists.linux.dev
X-Gm-Message-State: AOJu0YytasqCI0ry2osJJoCD2SYFHWX3/NZnukJ/R3Ba6mocgw9xprse
	6ANZP/DjwsL6tWJh847V0OLpizw9+R8AysQu7GcZS48RvE0AWTjo64Ha
X-Gm-Gg: AfdE7clsMpIxXrs8vvJvP1/zVLxr6Ya6RUkthMlFdUBT7N6Qx7PkNSxbXTs3LltDnjT
	QLC5INPmg3/5imUzoTXgWjgJdZ8hE82ZZC5nszu1wmLUDBvSrPOiHgRVSIyeL/3eSD9XSGWqWcq
	um2t6wiG4cbOiy+JPlxzfxPuuJHzSEX+1g8hHMXHzu0qEMkmcznOwA2mfIM/4FzkA2776+pksQT
	W4RdAK4ZNs24zOL3UB38EWw7pX83BSK4Nq7do4/hJ5/hOurHEzILTzrdVAJid8TNPo+2a+UDhqQ
	IS7hxA6hQx3nscW5QKX78fDCoec7z16vc5t/60D9RMavCcLUwTRTM38e5rEwfYUcFivMDC0VVcM
	mqekKUi/t8LWs8thOUyi1oqd4aT5eJkl7eINe8Za/kLqSH8/KnvHqjVpYOLakOgYPA8vI1WyuEB
	J3+aZR5Jk+B27incOa4F9kIPzbcNxoGqbyRz+8K/4k/0ErrKuQ73xMzMlvhw==
X-Received: by 2002:a17:90b:1b07:b0:36a:8519:a4e9 with SMTP id 98e67ed59e1d1-37dcd792db9mr13247012a91.18.1782454460950;
        Thu, 25 Jun 2026 23:14:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:14:20 -0700 (PDT)
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
Subject: [PATCH 06/24] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:11 +0700
Message-ID: <20260626061329.23264-7-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88081.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index d5e886a8f106..a3cc027de606 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
@@ -763,9 +764,8 @@ static void aw88081_startup_work(struct work_struct *work)
 	struct aw88081 *aw88081 =
 		container_of(work, struct aw88081, start_work.work);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	aw88081_start_pa(aw88081);
-	mutex_unlock(&aw88081->lock);
 }
 
 static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
@@ -942,11 +942,10 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	ret = aw88081_dev_set_profile_index(aw88081->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88081->lock);
 		return 0;
 	}
 
@@ -955,8 +954,6 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 		aw88081_start(aw88081, AW88081_SYNC_START);
 	}
 
-	mutex_unlock(&aw88081->lock);
-
 	return 1;
 }
 
@@ -1165,11 +1162,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	if (ret)
 		return ret;
 
-	mutex_lock(&aw88081->lock);
-	ret = aw88081_dev_init(aw88081, aw88081->aw_cfg);
-	mutex_unlock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 
-	return ret;
+	return aw88081_dev_init(aw88081, aw88081->aw_cfg);
 }
 
 static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
@@ -1178,7 +1173,7 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88081_start(aw88081, AW88081_ASYNC_START);
@@ -1189,7 +1184,6 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88081->lock);
 
 	return 0;
 }
-- 
2.43.0

