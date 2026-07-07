Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0F8382295
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401138; cv=none; b=oFMmgwjJ3FNxrFzDC9feOgub62iIVH5tafdpM47ERRckhju6yMr1Ag+Psft/kEAKfB5ngW4TUqNxXABOixiamCGppYu0LjXDvCyJvQcE1WIk6uaxySn14qLrrj808rNi1I4kuWUqgZp1PeOOmsJUX6jHSDXnkSC6BPH7EnTD0/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401138; c=relaxed/simple;
	bh=kaJbbn2upoMFK9y8GsZkCZ3lIho5Hx36ztCGacwYJFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKvg5aQy3A1vQvSLu6vKXXsDtWEdavAT1j0P208LRtvW7Y6ppg64s7CiZ/vmsx2POwAgI8I2WcqHVQm+3SyUubziYRZPszQ5VOFw53Smk1inca6bFvMUYB41kVHGk1DisVjv9Hnk/cUpBNnP/dfc5nvgLJa9lHt6D+lmT3rWiLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlanRzC5; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlanRzC5"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8423f236418so2422705b3a.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401136; x=1784005936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5fcfthZ/NbXXJUvaBXv1+uV/zO5KEI/qMXqR8m5T6c=;
        b=TlanRzC5//F/MMEzJx2DT1kfbqScGXQ0vHCnsoMD2J1ng6oRXdH1178Z59s4mybt6+
         YHZVjeQbeI/c73ZaCc8Ye4flXcee94gjcLhJNPGmeh7jY6SzIylkJ10fdvJPcmnUVrC7
         MjZnNqUGcF4m3JBp8k8tiIwKKch7BLhaoyYv+kbggiw72fPd/SwoiIGl7G7sN8sB48sO
         zxXdYZ2gTRbUJauoGaRwhyXjZzFXRTmISNLwftRrVE8WLb4RI9D4WQvNxuJWkJJ0D286
         MamtkN/WdK7Z23hQ1CJOm2nDJkUPHVB/6fQeBfem4gNVFwxZOodOLBg4FLnSY/ciYhjd
         hnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401136; x=1784005936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m5fcfthZ/NbXXJUvaBXv1+uV/zO5KEI/qMXqR8m5T6c=;
        b=YcQtTKQvO/hsQuuylvltS+cNnMkWo0LNtOhVSb9WXq9ILv6OtAFCuJwPB2veN6i4KY
         bmzbg+s3k7SmHE/xKIgiT49nF2MOTIqTGh0Jh7ZAl9L+AL2EyzZgJfnRI9XhK8fXT7X6
         qWokjnc7dDyM9R7p7ug6CfJ2VPbEwxPhja92kChGHWFUOx+hiF6KnhgZoku1NRa7gzzR
         caPwT8GM+UgZy037e4ajlRhLFXViK4rsuOO6tSHWeyccYEAt+Qw56eVMQkJ18Q3q+ulp
         jHa872QwYmsm9+oWLb5Oh6qfXbHsHbqSbFMRMAwGrV0oaQ5HgseBSajJwosvv5KEXMfR
         XLwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPL1vBwCWfe82LMYoyW9EX2ou7cz85kG+9fUBDn/g3dS5XbRiEa2WZpF2Ht1Fy+p3RnAdo6rrW25SwR/DrltQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzuSKP+u1VeCpI3UxoxgYBQX03J8kXapftFmEw/UMrPwF9VWz4L
	TJ4mtW7Fs1192hGFaL5CfmWq1kmTMbzQC6X18WBpm/Li++POmVVpk8aV
X-Gm-Gg: AfdE7cmSbsMWWwtFQ09A9zXNxzQh8m4lB0MoAVmFpj3EZj9k9kitwdJkvPPkKakMFbH
	3tgxc+KBmG6BSK0RUOy6E5uDkL3DieTwTtUDkLRjp/5SnK350VI8XOcK0kI49H5sCGnhPufy+N5
	QyyC2VVQgjMRMA5xJl2Htd73uFbHI0NH8QMy7oMW9p7U72ILUzd8ILRwAnvD7rnj6+sdR9jWJSD
	tNdPPusrqbWlAkWqsMFUYIo1G2xxlq7tGDdubMQrx+ljf4WJliTqvhub9tdkKsz/GoYG9OYdCYY
	J1P59J+JCB2W0rPjRIa+p4OqcE2r7Hz2ZXtyZercs8w/WZ9SDsHvhwfmVYE2HlsMKlmAwpp2wJW
	9eLMp0kWcMmVA54UZ4OY5o4PXyh+KCMY2GnJFkaH4KVAhiYpa541nFJWO8LR9EEqVtmsCNWI669
	+XNj//50+kG5u8mrXwb6eArK7q/wKWUOFfVV0A9YZHl/IKxyU=
X-Received: by 2002:aa7:8883:0:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-84826c94d79mr3393470b3a.9.1783401136026;
        Mon, 06 Jul 2026 22:12:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:15 -0700 (PDT)
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
Subject: [PATCH v3 09/24] ASoC: codecs: aw88395: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:51 +0700
Message-ID: <20260707051006.20058-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88395/aw88395.c        | 24 ++++++--------
 sound/soc/codecs/aw88395/aw88395_device.c | 40 ++++++++---------------
 2 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index ee0e8bd8c54c..e9ff2c79ac15 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -8,6 +8,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
@@ -51,9 +52,8 @@ static void aw88395_startup_work(struct work_struct *work)
 	struct aw88395 *aw88395 =
 		container_of(work, struct aw88395, start_work.work);
 
-	mutex_lock(&aw88395->lock);
+	guard(mutex)(&aw88395->lock);
 	aw88395_start_pa(aw88395);
-	mutex_unlock(&aw88395->lock);
 }
 
 static void aw88395_start(struct aw88395 *aw88395, bool sync_start)
@@ -224,11 +224,10 @@ static int aw88395_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88395->lock);
+	guard(mutex)(&aw88395->lock);
 	ret = aw88395_dev_set_profile_index(aw88395->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret < 0) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88395->lock);
 		return 0;
 	}
 
@@ -237,8 +236,6 @@ static int aw88395_profile_set(struct snd_kcontrol *kcontrol,
 		aw88395_start(aw88395, AW88395_SYNC_START);
 	}
 
-	mutex_unlock(&aw88395->lock);
-
 	return 1;
 }
 
@@ -366,7 +363,7 @@ static int aw88395_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88395 *aw88395 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88395->lock);
+	guard(mutex)(&aw88395->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88395_start(aw88395, AW88395_ASYNC_START);
@@ -377,7 +374,6 @@ static int aw88395_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88395->lock);
 
 	return 0;
 }
@@ -495,12 +491,12 @@ static int aw88395_request_firmware_file(struct aw88395 *aw88395)
 
 	dev_dbg(aw88395->aw_pa->dev, "%s : bin load success\n", __func__);
 
-	mutex_lock(&aw88395->lock);
-	/* aw device init */
-	ret = aw88395_dev_init(aw88395->aw_pa, aw88395->aw_cfg);
-	if (ret < 0)
-		dev_err(aw88395->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88395->lock);
+	scoped_guard(mutex, &aw88395->lock) {
+		/* aw device init */
+		ret = aw88395_dev_init(aw88395->aw_pa, aw88395->aw_cfg);
+		if (ret < 0)
+			dev_err(aw88395->aw_pa->dev, "dev init failed");
+	}
 
 	return ret;
 }
diff --git a/sound/soc/codecs/aw88395/aw88395_device.c b/sound/soc/codecs/aw88395/aw88395_device.c
index 79c3135a4110..12d42d27560d 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.c
+++ b/sound/soc/codecs/aw88395/aw88395_device.c
@@ -8,6 +8,7 @@
 // Author: Ben Yi <yijiangtao@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/i2c.h>
 #include <linux/minmax.h>
@@ -70,7 +71,7 @@ int aw_dev_dsp_write(struct aw_device *aw_dev,
 	u32 reg_value;
 	int ret;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	switch (data_type) {
 	case AW_DSP_16_DATA:
 		ret = aw_dev_dsp_write_16bit(aw_dev, dsp_addr, dsp_data);
@@ -93,7 +94,6 @@ int aw_dev_dsp_write(struct aw_device *aw_dev,
 	/* clear dsp chip select state*/
 	if (regmap_read(aw_dev->regmap, AW88395_ID_REG, &reg_value))
 		dev_err(aw_dev->dev, "%s fail to clear chip state. Err=%d\n", __func__, ret);
-	mutex_unlock(&aw_dev->dsp_lock);
 
 	return ret;
 }
@@ -156,7 +156,7 @@ int aw_dev_dsp_read(struct aw_device *aw_dev,
 	u32 reg_value;
 	int ret;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	switch (data_type) {
 	case AW_DSP_16_DATA:
 		ret = aw_dev_dsp_read_16bit(aw_dev, dsp_addr, dsp_data);
@@ -179,7 +179,6 @@ int aw_dev_dsp_read(struct aw_device *aw_dev,
 	/* clear dsp chip select state*/
 	if (regmap_read(aw_dev->regmap, AW88395_ID_REG, &reg_value))
 		dev_err(aw_dev->dev, "%s fail to clear chip state. Err=%d\n", __func__, ret);
-	mutex_unlock(&aw_dev->dsp_lock);
 
 	return ret;
 }
@@ -1110,42 +1109,36 @@ static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
 #ifdef AW88395_DSP_I2C_WRITES
 	u32 tmp_len;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	ret = regmap_write(aw_dev->regmap, AW88395_DSPMADD_REG, base);
 	if (ret)
-		goto error_operation;
+		return ret;
 
 	for (i = 0; i < len; i += AW88395_MAX_RAM_WRITE_BYTE_SIZE) {
 		tmp_len = min(len - i, AW88395_MAX_RAM_WRITE_BYTE_SIZE);
 		ret = regmap_raw_write(aw_dev->regmap, AW88395_DSPMDAT_REG,
 					&data[i], tmp_len);
 		if (ret)
-			goto error_operation;
+			return ret;
 	}
-	mutex_unlock(&aw_dev->dsp_lock);
 #else
 	__be16 reg_val;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	/* i2c write */
 	ret = regmap_write(aw_dev->regmap, AW88395_DSPMADD_REG, base);
 	if (ret)
-		goto error_operation;
+		return ret;
 	for (i = 0; i < len; i += 2) {
 		reg_val = cpu_to_be16p((u16 *)(data + i));
 		ret = regmap_write(aw_dev->regmap, AW88395_DSPMDAT_REG,
 					(u16)reg_val);
 		if (ret)
-			goto error_operation;
+			return ret;
 	}
-	mutex_unlock(&aw_dev->dsp_lock);
 #endif
 
 	return 0;
-
-error_operation:
-	mutex_unlock(&aw_dev->dsp_lock);
-	return ret;
 }
 
 static int aw_dev_dsp_update_fw(struct aw_device *aw_dev,
@@ -1231,14 +1224,14 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 {
 	unsigned int reg_val;
 
-	mutex_lock(&aw_dev->dsp_lock);
+	guard(mutex)(&aw_dev->dsp_lock);
 	/* check the odd bits of reg 0x40 */
 	regmap_write(aw_dev->regmap, AW88395_DSPMADD_REG, AW88395_DSP_ODD_NUM_BIT_TEST);
 	regmap_read(aw_dev->regmap, AW88395_DSPMADD_REG, &reg_val);
 	if (reg_val != AW88395_DSP_ODD_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check reg 0x40 odd bit failed, read[0x%x] != write[0x%x]",
 				reg_val, AW88395_DSP_ODD_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
 
 	/* check the even bits of reg 0x40 */
@@ -1247,7 +1240,7 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 	if (reg_val != AW88395_DSP_EVEN_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check reg 0x40 even bit failed, read[0x%x] != write[0x%x]",
 				reg_val, AW88395_DSP_EVEN_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
 
 	/* check dsp_fw_base_addr */
@@ -1256,7 +1249,7 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 	if (reg_val != AW88395_DSP_EVEN_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check dsp fw addr failed, read[0x%x] != write[0x%x]",
 						reg_val, AW88395_DSP_EVEN_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
 
 	/* check dsp_cfg_base_addr */
@@ -1265,15 +1258,10 @@ static int aw_dev_check_sram(struct aw_device *aw_dev)
 	if (reg_val != AW88395_DSP_ODD_NUM_BIT_TEST) {
 		dev_err(aw_dev->dev, "check dsp cfg failed, read[0x%x] != write[0x%x]",
 						reg_val, AW88395_DSP_ODD_NUM_BIT_TEST);
-		goto error;
+		return -EPERM;
 	}
-	mutex_unlock(&aw_dev->dsp_lock);
 
 	return 0;
-
-error:
-	mutex_unlock(&aw_dev->dsp_lock);
-	return -EPERM;
 }
 
 int aw88395_dev_fw_update(struct aw_device *aw_dev, bool up_dsp_fw_en, bool force_up_en)
-- 
2.43.0

