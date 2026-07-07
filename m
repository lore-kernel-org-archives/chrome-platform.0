Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA493815E2
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401154; cv=none; b=EGyctrYvnrGt65RtRhycHiN0wszlCSi4OiwBLngrNwfVXAOZAYumMRcJ8eSxwSbHxJJyPW4I+9LMdNiDDy6xb2/o4oY89ed8PKK9jxyvpLjY9YacLSiUKOSRNNykTAKHMnmHue+qL0pwRSJWUnHgQCr2CNGGBYTuD0druK+VzC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401154; c=relaxed/simple;
	bh=l+jE/ICW3VwCjHs5/VwCJgnhBYlTFKeilmi/IdexrH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTDsIWkJBs1OvuNv6nm0s5g+L7AMnQryUBwRQVFD29V8V962OwzORRDieb4Y286iALNWkGdl4egOz454zqa2XN5JihAxOXH34s/syVwqAxIWy3eM0K1zGPAZSi6Ja6Jr4lEUwt3VuiCZVCcyXFPbQIiaiw+q32JB/C/NuhMsn0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5Yudoyg; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5Yudoyg"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-847921eed4aso5135637b3a.3
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401153; x=1784005953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYGM4NqjESQUWIB0GyhH+Inqu4fPaZ6H5/Lwh6w+p3g=;
        b=l5Yudoygpyl7oXvIfyktawRCxnkmYl1sDWM1v98nGaSEvgLHBKyJkYU7jT3eNqO6L8
         ODvUvpIuSD4M6Of1J42ygQPNZlOUi+nU/+L7J27WblaCBC2EfZFA2I976/6doCaLWNBd
         djRSDjLkOZXN9rWMdc4gc25rV2568GbhllzObgMoFRSGoQuRsq2531INdI0oKpukSTBs
         Ed8+pNHthJrOUJi0l2OxoDB2pY0H7n7NgEnoG2531Rh79gDOMwNc/+KUj9t9dnXJWqqv
         k0bdJk9uDZBA9ohCnmP4QzALo+N48i4lRw3WQfYyI2p/Ry2gQWGYplNht5nYQ8Xn746a
         esWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401153; x=1784005953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nYGM4NqjESQUWIB0GyhH+Inqu4fPaZ6H5/Lwh6w+p3g=;
        b=GycQ2vql1RIkPKXiEt7dmnyvmRb8GNpAou6LUcy5WPUXdLzSYN97jTEzcB0dsnfyTY
         TK8tfJDPn5zSUcSgVyPCgsgQ946g2tcbVEA6no9i5YaaIUw9LfMNCbPb/5SfALE7siHR
         YaFUhfzv6ePRBn8RvZTNpG5+Ll93cdpRhnh9MCe9jLxdaJ8thl7x1vd6JwqlkGTfmtf9
         eFHG3/VP+VmE/Y0JVEQ0Awvqzg3d1tfb0IZnrIFYpGiT32aCPkuOdFsENcNjoZ5YnVkH
         9XJVPcFEkxBmUafC+ojCmgHO9Q1N9PN4xOtGA4AV4Iq6VrvIMIDXmoYcWKaU/inwTtqp
         +U6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrnh7zTlKC7lW3OSqKH87/JjiFDnlz/tjfqqoGnqPkPfeOSEEYjwQunJtHherPQx54mwCZ2cucc7m6/8rvfGug=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6Pq2yt9tExWjuAObmeQg22NUX0E7IVhG1n8RUca2IhGYB5U9u
	E24NZOUxMK+lMeC0oHY32P0ly13A+saQgnVtjZx+gzt5867dJJkvrZs0
X-Gm-Gg: AfdE7cnD10cygPZl/gWhlZoXOweLsDC6BesOW1+EWdVI/PG/0YzmBmGJKCjH/c+jQDz
	0k9kd5gusuql+qApPBy0UjGEl10auVgIcbuSo8kguZdN78zHJwdfxe7U1i7YQ9VkeXcQANUTkt3
	aTS7unYTQLl85JH9Sl6k49k24IMWSCrmYLhmGlw7SYocvVkW8v29VSLESHQTJMHkh9JBx1lnRjp
	XNcdzT+X2Sx2v2A1Qx8nNZxQ3ZUJtSK+XDa4Q5f3y8WZ+G2t6vrOf7uC45JDxaxPnu56aKQzEtU
	UWQU6VEbBcDRMWIKCLUCVrJM/VBbndp2quYXHpmtkQLHYROKg8YH0sanRjyqX5i4BJ5n10r8gAE
	Lxz+vwQigUFki3k+dWBGpg7XtEiVK6673JZgy0D2JG3ZtSz9DpwIpBNQ4CIQV3bCqfq7fmU5raK
	NutQZVL2lkVfjnjHuDe6kVkdYHvFlhQE4/9eRvW3N8KXdjTZc=
X-Received: by 2002:a05:6a00:bd81:b0:847:8650:69cd with SMTP id d2e1a72fcca58-84826dad939mr3557020b3a.33.1783401152996;
        Mon, 06 Jul 2026 22:12:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:32 -0700 (PDT)
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
Subject: [PATCH v3 11/24] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:53 +0700
Message-ID: <20260707051006.20058-12-phucduc.bui@gmail.com>
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

