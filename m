Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F6035E1A3
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058157; cv=none; b=YDMsoabxzS88YbvZPnVEOTfAfTRcpx6HS9/bXIoNGFJBL75J1J8DPgZ9OUv2hOBV/MggxC+P5y68fVBN8fxhPzu2JjNo2wwmYfpeRw/boLdIa/ymDnXJC7Se7evbyFunONoFv7D2exFOiEbdcMk33k50cJFU5rA9nTYv6/p//U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058157; c=relaxed/simple;
	bh=sVJcDLSzvxVc07PKONwqwz7bpyreaHuk9mSCphbPjpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ia/OQ6ifUm6iskEo6vlVWxQX3124EBrTBIApNEnb4/Bl5svNRWOKJNLTKSaKOMtBp097jxg6QG/uZZe74ZLCkTz/Uu4JCulByAP8mPPItlkZUu/6kjEztgDoUtD5WhNSwEwH/Pg5lQa2C6IteguuDT6RV1h35i1ZjaOK9L0ENcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOp7MN1r; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOp7MN1r"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8478fe07f65so201182b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058155; x=1783662955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhB1hdZH1RXfYnuHTRXF1+iHxT1kM5V0IWS9nNClVhA=;
        b=oOp7MN1rnjL6BOuOtEGbKYZl7qJ3WDYHt5lHZnnyQHW/WLIT+0zGRQoSQcJFKux0JK
         ro8Wr37Ia97nJm+h3sXWszBXv0pZwMYs/fV+VpI+x5XBOmTNEPCWzsenW30gkNzG6SNd
         SoXhOBpiyk8YSTGoBKZOmwxdc2RnLVNRE/+xAeg6uv4JQicqmy+fRLcAQnDQBbbWFlMJ
         unTCSyfL89S4CIzwJV7IvaG7ChElFLK1bg4BxHYsZ3Hyb4Tq9M8C4RUtQOhCcbyyAPbm
         Ngyl7TQKagql254cYBysckjde/zKn/tz5mU7MtYfausXp/qLyQms/MUfus/lynSsKCds
         9S2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058155; x=1783662955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OhB1hdZH1RXfYnuHTRXF1+iHxT1kM5V0IWS9nNClVhA=;
        b=qeAAb3oJXt4uOxgUiw98faztX722fjvVMTMej00ETYJtpvMlgzlAmUv1eHLXEaaxXL
         W+Sv5xC61l82w8ePjmCxs8Woj5zc2HFl4rrl+CPyJeJsK85iURshOXhazkr//dPIPwAt
         w9DoC6NNw9oGNXFWYklaadZ6GJ8wIXViUS1yS5kW5pEhtmusQHHxJns+BINRa52ddeBe
         TMQaDMcsx1rRn1Ozbu2KmYs61UEO/wyDpEZX0cfY2sccLRfaVj1INmKEfldHCWVYYLrz
         aeyAgjl1jJx7ndrppKIy7fPPYifC6zWEa3thF/GeBLpOXHbi41bcqgCxOBYAjs7/RASQ
         dQ5g==
X-Forwarded-Encrypted: i=1; AHgh+RoILGCtZS0nJlCYMgIB1mdgqyQk5Du3T0IXYdFNv8j8V2fU9eK/eQFJDUVWmlJpb1JTX2DDGc4N0/iXgp7qkBk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAUMeV1zfqbSkac/DVRihoxSBHPeYijxqjAl6qPtbKNrJsdo0b
	lMfpjjVI1pl6S2/SAgjcL1jJ1BlF5yTA4UTNdByks9qEw4rGCJF5Jbt/
X-Gm-Gg: AfdE7cm3u9acOGcB436EeaxTg1c67Y1vzZ1TXWY/8sz5Sk6IEfwslBvHbmRl+gMDDjU
	rQAAW3ZY4deUTzxNyMEBfhVMOBdxYRVkoCJuKTPbrBz+sXqJAhdoZpZX9oVshXXYBCdJZyezPc7
	KouYZS1+MijStbqz8jIQPIn181szOKI91eyM8bj0jxmLLAXhX3/uCmSu+xBZ7B9vrjnARJyoPnr
	o4pjNZYoq1EjWKXpMersWmjLBu9CvMb+Vw/kKDk7P7kHWLa+1x5h9LBmOJl9j/+S3Sagf5gl35Q
	1eGsdOjTg5vv2EaRJ240qlAdJjZ1lbRvlMA42MBNzNLh/OeVbNTTFseQfLsy9IP/5WSg6RjgrF3
	/lH/mK/xfaN/Nr+GJMX2xKzOk3ZyGCnTn0runi+Jx+NYudaEZCuc/ZYfalhkiiIB2GLzXlymOJX
	yswAG4GlOmyidiVRAGkK90LFM8wp8U89PM9XdNnZjXBIRgsUI=
X-Received: by 2002:a05:6a00:b53:b0:843:468d:7804 with SMTP id d2e1a72fcca58-847c0879346mr9802024b3a.34.1783058155241;
        Thu, 02 Jul 2026 22:55:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:54 -0700 (PDT)
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
Subject: [PATCH v2 11/24] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:42 +0700
Message-ID: <20260703055355.244898-12-phucduc.bui@gmail.com>
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

