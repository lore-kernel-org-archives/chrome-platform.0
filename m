Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC5438497
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515073; cv=none; b=A1G0Lx5npeiR6z6SFdqJ8DBOH6hivCKALDLl52ZUTNR9fSWfcn6rZE3sUKS2I2b5nvs1KLAsysC0tVHEHc0qx6RO49/rWoKzcfOidiU7Q8rkPfAxSfESEPujnW0AKVvLNqFGGSOxCc+n2DHYHq+sK81GhRCqY2x+j6mq1LvF+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515073; c=relaxed/simple;
	bh=yfnMNacLdodpfRhW2bQZbE7pm8s0ri1caS058dgJKWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJqPVgEdD2zDaKbRaDEGpEbsLbIl9g9e43ilK9J1nZedvM/QsYRxNyr1dU1B1bh6nzgMmMaiTHEeZh8J6f2S4Y9+1P/9gT5RHuqc4XCsss1VqP5PMJ/STp7DECC9oTDiwPygEqvxC+9zZ3rQ4c+Ibd4fqKGFLsTnH5McobpxmHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV8RNpiW; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV8RNpiW"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3811e59df58so406192a91.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515071; x=1784119871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq5Iddla3Hd0Zh5qEYq/9fp7CsXU6/7TUOr0ybGJuLs=;
        b=nV8RNpiWAcmRoVzVnLrcU/WdrvMP2PEi9SuZpvx+mwkHOgEQCXql+U6r6oorV5cTPM
         iOjwWHBNKezU6p7zHzujaeXCNvzmPWFxZfgFO12mkYmhT7O3OYtPkyiCu4MuCyWTNxuk
         XulLt1BbsZliy7M2YX+ELZeLrS3ptufeFBECZ+I6e/OoeOgcF6r0Y7VnP9llCTPLQ1/h
         ECbbgUEK66DIZQ/buorSQgRs2sin+PYbpKOMbsMtefijhZfRJLudyAYeOT4aqakDvo+W
         7awT4yjJ1aUb4Z/XVI6tFME/HTlOwf4hEoTls8xYch8wZ7gCUVErXVu3qmdm3QQ/FZOi
         AWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515071; x=1784119871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sq5Iddla3Hd0Zh5qEYq/9fp7CsXU6/7TUOr0ybGJuLs=;
        b=caEG00mBimCaVomeCSdSbhNVx+THNTgsetpKn1BlWXfgsFUsGJ9nZ4n/Bu16AXl1Rb
         5SbW5JBcqs1KPEEXAonNmyW5Wc9L+VKkDcXnsIWQhVB8VOp75eL6HvoMXSHKe5pv3EUk
         aUAC+MQnXMaRqjmxjY+tISGHlLsQILmuU4i5QBuSlY9fxyqD0m1XDLqYn3RNDcoG/RtC
         8k+9NsYltrlUOTMqq6uz1Pr9ZxjyWr8d1KgwVpsEqe/3OcUMr6xCeY7w7f6LNpl1+ymV
         GYg7xZCsx5z1K7S6ZwGNVG/+xMHY11DgpVdX3Z4Qp2zou+XcTYPGRPe67P0vGEVRFT4w
         fxzA==
X-Forwarded-Encrypted: i=1; AHgh+RosheI+CUwKVSMb8f/xxdGQ/ZsedtDLFWNETztlgO0OX9Z3nZnt5y4ZjinnRRfjgYDvWSywfBzlORYUwVPPZak=@lists.linux.dev
X-Gm-Message-State: AOJu0YyW/8cXhZPtku/UK8wE60IDJwA88swV6nNDo9fVghcctkBzCsyC
	DyjdZmb0HI/XwM5EJ1dt67EGXN+D9EVAXSs0mwmi/SRrEAL2tD7eJFJL
X-Gm-Gg: AfdE7cmIrO2/hPhWyd1q4vQKzKb+ztM8+IYVE8Nghufzljbboz5+n835d/rDksbqMX9
	x6b5N+xwc5AsHONJ4BmQRV+TIQ1rm38QcmRLr9D46ERG0LSezPKAJicpdHptwpyd3DVjXed6IRG
	NGUu2pA8SzqlPzttemt/1Otl9ZBTy9Qtuj3MpFHgs5UV0BtZpKnTjbToKg4FbsqFwUFrpRzpKpC
	3LDrmC+/FamDPYCxM8qRN3FfbodiwWA1jhq4WCGhrOb2IhZZqNobgvf4SRTZxGSJ+AJoqjr6lf6
	kNpG0bcqj/S42x2CtCRCZJvQ3inLdng5jkMf3Ds1ScKjvzKEozaM7RA7DCLnP5jgsvyQPg7PdW9
	4hi3zHms6MQJ46m/ftUpVPOxGhcwDwvPJ52Maf/O/y/udcJLx9wKyvgCzT3cxgOYjKDJCwjVrBN
	gURxZW81Hl68M4onTKswASWzUJ5mlIFx+E+lH/9wuSdQeomUM=
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-389426976f8mr2543047a91.38.1783515071231;
        Wed, 08 Jul 2026 05:51:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:10 -0700 (PDT)
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
Subject: [PATCH v4 05/24] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:42 +0700
Message-ID: <20260708125002.202515-6-phucduc.bui@gmail.com>
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

