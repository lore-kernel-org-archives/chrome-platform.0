Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE92837B3F9
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515041; cv=none; b=VWxvi4B8C5ltiUbQ7Zo28w2PW70z+LU1F5uG+0rVfyX2AvfEmbvzy2zzpu4ubLNsL+kYgIY3kpEq8+fWeIhh822yMwBribgD71qR7tX1IpwMdNfuYkAXlMgTjV+unrIBIfiBWJUJaf0KzOkw2rmgyOmG3LNkArvC4+KMu5VakdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515041; c=relaxed/simple;
	bh=MN7hjUlOeJc0FO8mu3UrzRrAKjy8hB3fiHLBiWptOh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOCzrJQYm6QRZSuJss3cd8SVDMbXXp/A/DAmoC/aTOW12eU5HjV34aZLhN4R9IaXpnhx2f9yzL9yzCx45PpI3YDg4nAf75ewwswMK8b9BCVCMO+yIh7AahD2oBWxKNdzVPsRz1UxPUR5oMrd3RUeHDy39No5lblStCafzeV82W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zdb5JNYI; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zdb5JNYI"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36b9d265355so638370a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515039; x=1784119839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=Zdb5JNYIwqiy+VM924D3A38UFsyQ236uwbzLmJK2OtKJ1P7uION0fKd3jYei7h6/Sm
         4vhI5yn8ntz9HmdHQVexZ1k3LLqnt1md3tM77Nfyxu1+J2CgifwSEB9h96FQeD9/UIG+
         3agrKK/uFQy/bcyb+yTsn6PtI/tUTZGzYOsJv6HWIgGZflaQvE4CIwGmW59mYSSSUCVN
         T7hr817lXm1fb21aAbV4PMElxFPAQSGfgnMGfzKJfZeSUds5CkJfMuLp3o5ZmWZc28Xp
         hmjU8+ivr36mDox3GM/t7L+eGdsw3AE8z2n1ic0YdhD1LY59NXNknPMCm7N7C5pJNpco
         /qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515039; x=1784119839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=CYYp8EOjNeamK3ILat7TAlKug8Pd3DJFNOJswSFSS3DL/FB+blzcgs9dsUFq82kpwJ
         iSXRHL+ZwIXeQJ+HKP5BM7hr4liTNQdHR/YgfvO7DSlMvOf+/jVYdTvecjvBJ2OqSVn5
         T0y3TkrCAGXQn5G7I2UUXQlbQonx0IVC0LJRg72Sz44DP87cGv3tA98F60qNo0VqztNG
         Sp/RhMpyoQgLssrcp0l8LLa2Kw8tAcOSC0Mrc21DfqOcArNhRaBUlSiKuzxAKa37lZmn
         uJh+7nQCAFCnaxtmHa5CspDrJPoz5DgtXw1PDKsatSc4lW32Hq0BL9rwDBqTvh5QH/Uf
         B5YA==
X-Forwarded-Encrypted: i=1; AHgh+RqLovCp/HJPxHny7nWcEDjJTe74+YKBH6eDAyXsymmFTwFLuHeuXVMmxgztjJvmRnzYMQSFWBMcWZ1gIRI/+jc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/8c/U/vMlGev1iTamZpHD6/FfSDtbljM8oxCHD9ma0ARd2E+l
	tNHZuAXAIkAGe6iPPhk0QgEwMmtWhJL5rB5g3Ryj6NVvO3Q2fqtH/+/1
X-Gm-Gg: AfdE7cmiKdwh30t2qrhb5pkUdnLAyF6IRS1fs+Fm8SfDfWhl+zMH+rGZ5IAbiN/ax2M
	uHaoTKUxA5qJtJI7niILeZuLCkXJRDLaXy7ePPNEmoJUF590WI0FOm/7GDckqu8UYB5Jzr7wDqA
	lRFKOvl9djxkUiBpLKorYxuAxBkmTaaj+tWbcSivjNweJG6S/S58LkwE1CXUhhEehJKEfZKaIch
	/UwZyroCYB1ElR0m8awfhYVYFcMkeTDcVCAMQZwSLiG2zQn+ohhwb/mE8+BtiHGqqTNtR7bwdn0
	O88tF4UXaoaFYK6lmysdjOrqjP2NMESjo0qYf7ElhXrePuA7FEILJkfKad+NKqSpy44W7L0DTi0
	9DkqKGdi+Se2093ZLimTk3/GT4uzNHojp+TEmZ8TYYw9cWfzp16Bgluayygl10/qRG/XvYE+A3G
	T156c15jGMzN6BAsF003nEw44GANEi2hbq8xlWkOkoHDxbT1w=
X-Received: by 2002:a17:90b:562d:b0:37d:7bb4:bffb with SMTP id 98e67ed59e1d1-3893fb6ffbbmr2457209a91.2.1783515039213;
        Wed, 08 Jul 2026 05:50:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:50:38 -0700 (PDT)
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
Subject: [PATCH v4 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:38 +0700
Message-ID: <20260708125002.202515-2-phucduc.bui@gmail.com>
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
 sound/soc/codecs/ab8500-codec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..2cf96cbdd294 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -14,6 +14,7 @@
  *         for ST-Ericsson.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -989,9 +990,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1014,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1025,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1044,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0

