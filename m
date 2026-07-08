Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E1643E9C9
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515119; cv=none; b=UWZC2kQl57tptGmwfbZxs7zKi0BVKiuDt8nQ1j3mDU5Ncx8BFk65XOBXB3dKiaS9XoBSMfTO7hjLgXK1cij7o7tZNmCrzW7xrptPsHmfr2mRfeQi44PrIuNrRR/GM14Vop8LRr835V68ESiqlPYBRnm7XNBWo2YPutw7LOLg01g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515119; c=relaxed/simple;
	bh=l+jE/ICW3VwCjHs5/VwCJgnhBYlTFKeilmi/IdexrH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXEA9bwhCGi7ljuaVvJL5RZpSgsH+en7c63Sk5osK5N5xJl7PLV8cGvlDGWzaBMXbdR60Ba9ugn/Xijy++G7Zk50fQWVo8q3EfiB+PKnBMNSSZfD2gKa8ykHQrw8vAPFZiIx9VhEsoeH94d7XATOhPmTQ794DZjbSmRg7jzp818=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMN/Jh+z; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMN/Jh+z"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so545642a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515117; x=1784119917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYGM4NqjESQUWIB0GyhH+Inqu4fPaZ6H5/Lwh6w+p3g=;
        b=GMN/Jh+zVS3Qalx+QntS29iy97IIBdXjYr+ZcOEsVX7+ZD8nGVMGSLrALn3CEtD1YV
         HXoD3owxUe8930WaayoBNYQHy3vZ13ABbHpKCXlyM+/RLf+IYXlh9abtdjoghinc0q+C
         b05wrD4EjOrIR2Ub5Np39bquTXE5L7Q9SFUlqqMVhHq1KDY6uRask5Nj5MvhhCxbrpcA
         TSR23lHe9Ha18f5op4UmtB2Oq387VU0swlcsGD8gKHwzy2JntF1whpTpJV48/AxTJuYt
         NCk6TUImHk3Xtuv3qdaKfAIPET9FqApNKfR/bMRs4et75Wrf/r2ukN1RYmTxASXs/hps
         9dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515117; x=1784119917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nYGM4NqjESQUWIB0GyhH+Inqu4fPaZ6H5/Lwh6w+p3g=;
        b=YvCwnqtz9N+AbKGo2DocSanijvF+/v5HmhaOnlGaWPJUsuHmUN5Io3gSjA3TSvPHDw
         tvdoHwkzEKSaXqqbPkrFtLCaXf0ZlDSmzQp0s4Nx74OVSBGdjSju8kFr8lsjG9X8Yflr
         OSCfY5yug3trteQ90sU33qjwMI+iX8j87s2DuXAc9/O/s9Uq9ABMiuWSSAQ2fzmym9lU
         Hn5sf1L2wnlMqiTX8L1IHVY5AEduhIiVqvmNhuNCKf+VUxGQeFoULOVTPyoE8xLsJYEs
         xyFv9U+yaqmC2HNoW/035tLJniAo86vI3K8sYRAB+VIKuKFa/tViEb98YIDNR6CAzvDt
         tGAg==
X-Forwarded-Encrypted: i=1; AHgh+RpuTxUQRu01cy6RfyQxMFnm0HNzFkHNNhDjfHN88CVHYAEBB8Y8833If+9QQzW72mTKMtBCHgyCaJbpk0U7pik=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxFppv/+6C0ZV+RtRvkQxPxasVdXWHgsctA0jwwj8w8WHqH66G
	CxvFmhc7o1z0tX7PRrRAdVa44S0Kz5JAmIxj5t3G1I0ReP/FzYvSlUhj
X-Gm-Gg: AfdE7ckzI+LCiJAl8of3uKXjvD4bFaQWpq7WO8GjpWTkc4XQtn8Hri0lTS8+NUmyp4e
	70+j/GBlRu8rG6GmOndr44GKssVfz92cK0OcZUfbJiPD6YQzNkWT9psSVaUtqL++l7msbkc4ZgU
	xeZjUVPGJ/tNiAcrqQonqPOEt7m8vTAukh7EKzfwly189t4fV2aUKuD5yWGsx8hRS9u2VP/8P5l
	40gtoFvAOsxhzr49rXv7T3IS48qO/lNr3uQgA1wlq72jar9nzM6RCifzuy/UAcxrWDDVfvPmN6M
	0yQOBw0oHJGHegxCLcEhbmd32kDesQFu9ykGzx2v10qnOLL57WMQW8U3aL071/AhI3GTGpgG2/a
	MsuY4f4Id3XYuZzz8CoWHZoK412Sc62OI2wR90BhmQ84fHahXWOMwhLXGr9PHNrGAjsIaztahHe
	p7Y3bwOM1omhZB9rMnX5prQtUXkvVo0+mYyIGLO6K/cQE38Vs=
X-Received: by 2002:a17:90a:dfc7:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-38941acc3aamr2520904a91.21.1783515117105;
        Wed, 08 Jul 2026 05:51:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:51:56 -0700 (PDT)
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
Subject: [PATCH v4 11/24] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:48 +0700
Message-ID: <20260708125002.202515-12-phucduc.bui@gmail.com>
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
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cros_ec_codec.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 7dc5a7c3ca96..fd2d5d7f9276 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
@@ -608,10 +609,10 @@ static void wov_copy_work(struct work_struct *w)
 		container_of(w, struct cros_ec_codec_priv, wov_copy_work.work);
 	int ret;
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	if (!priv->wov_substream) {
 		dev_warn(priv->dev, "no pcm substream\n");
-		goto leave;
+		return;
 	}
 
 	if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_AUDIO_SHM))
@@ -624,8 +625,6 @@ static void wov_copy_work(struct work_struct *w)
 				      msecs_to_jiffies(10));
 	else if (ret)
 		dev_err(priv->dev, "failed to read audio data\n");
-leave:
-	mutex_unlock(&priv->wov_dma_lock);
 }
 
 static int wov_enable_get(struct snd_kcontrol *kcontrol,
@@ -895,12 +894,11 @@ static int wov_pcm_hw_params(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	priv->wov_substream = substream;
 	priv->wov_rp = priv->wov_wp = 0;
 	priv->wov_dma_offset = 0;
 	priv->wov_burst_read = true;
-	mutex_unlock(&priv->wov_dma_lock);
 
 	return 0;
 }
@@ -911,10 +909,10 @@ static int wov_pcm_hw_free(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
-	wov_queue_dequeue(priv, wov_queue_size(priv));
-	priv->wov_substream = NULL;
-	mutex_unlock(&priv->wov_dma_lock);
+	scoped_guard(mutex, &priv->wov_dma_lock) {
+		wov_queue_dequeue(priv, wov_queue_size(priv));
+		priv->wov_substream = NULL;
+	}
 
 	cancel_delayed_work_sync(&priv->wov_copy_work);
 
-- 
2.43.0

