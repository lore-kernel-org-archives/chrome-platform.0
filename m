Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F173D6473
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454525; cv=none; b=F+Eymxnr0JqPZQPf8d798kMkk+DP3sj1VTAmG0cnmRnZfZ48+AJUKONGo9Akthe1KfTVltah8+EiPonF6lgy2ZLsSqS8RG0Hk/TzrGqg9V4Wfge4acplqVmCEKNih0R0/wGOKVB6DkN/a3OXy6YTEnCMXV7Fj+5mRBogN+/IWE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454525; c=relaxed/simple;
	bh=sVJcDLSzvxVc07PKONwqwz7bpyreaHuk9mSCphbPjpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHOIgleoQRauomVsM4d7fwxRmU3w3V45FVKjBXxn27Nk7I1yVLZhOxod27z8EeZquDZ866Wxh0lPv0djbYFYPi6X5IiPzn5+iaLhoolRIX4fVAvca7EOWMO5hEdzZSJlcG+9/bfZZyPm+LcE8pAC4kZWsFyWmsvpXJsPuG3b46w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgHVXNaG; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgHVXNaG"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37e0d09be07so426335a91.3
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454523; x=1783059323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhB1hdZH1RXfYnuHTRXF1+iHxT1kM5V0IWS9nNClVhA=;
        b=DgHVXNaGe8DWsmBGtpSfNJYHw/of/Ayfa6hjLLzwdHjOzB3RDxoLHHa8QM7TszUm6A
         hvkefJ0s52HjwC+Z9BJrStNORw/tvU2Xd6pcKDslLApuYmS9kU8UGzf0YcOGcydmtg0C
         LTbpEnPvlyAHesbuiThaHezOwdf8S7GG4fsp/Yg7ylUrz6mly4llcRoGH8JlQ02GAd+3
         bBjlIFbcft6XwhCVanQOzW7qd0MRSUzmdZ3nIapU/JvHmIvObtCiyWHiBua1YWAgxtfH
         ipyMp0GgSe3QvJsls3EWHnhp9+3aNN64gdxKxZ5FKMM6PBRSK35gajxVhUJWYkLQL9SH
         1Xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454523; x=1783059323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OhB1hdZH1RXfYnuHTRXF1+iHxT1kM5V0IWS9nNClVhA=;
        b=KSQtsC3/DkEatchv1j6PJpiLpJJDqRGB3OAa5XsGiFXGL0nGvp5rZoa1ybwyNcLoK4
         eAtidNG/zZtlOme8g/gNDjdiJjAnKopCejqeqVJn/LDdM9RBy16fx2Qrvuw50CFS4S59
         1jYCbz9QRecJkxFjBLoP/QroIJ+30EavkGeG+bnH9xSK9Ucrfm2SYfXkfJWuG3gf9Ahl
         66tjYw2mfv0pQhs4Y6eCIU01iygX0eeDMdikD1JMumzYpLmeJdJ3dqsDRXeyePpu3Zp5
         EzILqrJo22V+arOcWan9tDFB34etN2gKJE1tqUwXwgKtWBWUAu8sKkN1Fr9gZhm0qSsk
         qt5g==
X-Forwarded-Encrypted: i=1; AHgh+Rq1y4E9pbn5Ygt1bOzs5+adFPFxI2k02sRzWvGukKrycXGcDz81UUJwgMWWHI/T+Z0hxTzLeiz8MWEz9KXVDBk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHR2qd8RJjcvtD2HYcFTG2rD+f7lndJq+FKIZujYtdvs5/viQ1
	BF8mtPogc7J6VItD+ZIwjaffCO9ynZmHM701r6Rz4AYGbvZVuWnOLxcZ
X-Gm-Gg: AfdE7clijSyRxihRHHg8bdgsDhNRuwHIKeqVhkASpaPEn9wi5TSuHxuE2dz4Sxbwf95
	VoEQwqT3st2vIimoXscT3P2XlBVZiN9Wy8S1IYtsK/swcF8xd4jGgL19Q5aa3nwkr/Qq8vap3t9
	LiDRlFiXW6Q4zgtjJc36b9Ob/39jjqASPZ7LP9bfY3h8XqTwwPux5/ysgEiAErYYrqEe9ciRubJ
	RdyKWEZrOhJ/pOnnmzdM/5VFfnJBpWsw7TFtnDi1Jm3cX3DTTCw1mfdBrj5MMjKc9WKIR+1aVtf
	5kpcncnAUAeZm2YUhVjOjlig0hMx+yo0t8JMHESA8r3O3EPzybdPDNzaujoR/s1RGKrZcYoIcLN
	/14wcWQ4bt8sFBcYvMwNt+52FZ6I9zoiW+0qA5JhcxV+ePa0Y0dnbTO2x3HTOVDv5d5ydV41yQe
	oHwR3tTlfCx8slt5l7J/PaoynkEoMSscGdEK09lcqWgtgKDi8jRwUgsOd0hg==
X-Received: by 2002:a17:90b:4ac2:b0:36b:8873:d96d with SMTP id 98e67ed59e1d1-37dfa1c3bb8mr5342482a91.11.1782454523127;
        Thu, 25 Jun 2026 23:15:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:22 -0700 (PDT)
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
Subject: [PATCH 11/24] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:16 +0700
Message-ID: <20260626061329.23264-12-phucduc.bui@gmail.com>
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

