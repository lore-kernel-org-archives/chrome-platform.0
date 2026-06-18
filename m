Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED6231B823
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781098; cv=none; b=OvTVYxwfEqYhZ3XtnCsN3nP/pY6sJRB+7F+S84zifVqs4uSnYD0KsIp5Dqtr2orFU9xQF7ZfztX4NKTxnxwebvWkmvIiHMsFrJ/6dbR2PGxjosrCw+G2AKu9lHNC3ctmqvLNS7inu7FNONCNVFqswkInOwhZJvXvluRtxGoEy5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781098; c=relaxed/simple;
	bh=bLW2D0WmrIkzzwlGmVFMlDfU1k3KJHtIGoz6p5efmEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/4r0evbJZMR9OWmX/7CV4jRzSofQzNrmpt7Z+C37mPy9zUmSavv8W/ThDdf3l5HwWyweZUhdQ0u2r56CWgyUOZVkq8R496ZLMXZwNvmzLFgyUj0DOA7i2rJbYinkLFWkLtFYg/Rvx2rOmubs1/9XZI1i6ZdiyUK31JJawa2c5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4ef5EJF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4ef5EJF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c379e8ffso6934495ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781097; x=1782385897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=q4ef5EJFUniTjVdRn//9TyxVAWorjcc+2lqh6cu+K3C2PGu6UqJzD8q62LKiogQc1t
         jnhNcNC/rcTdCijeuAiJfE4v2PD0Rk9Q519Y/bd3SyUc8GOKozd3vCgn13yf32mM7000
         EdD7BUxD8odvHYrJALyvnx3zSz0vihFW5uAbbDkQJj3bb+zLKjdS5phcDTwH05VvUyWg
         7SU3IH2A+m0bqligXE/+U6+C51cFGNpO7lAnEyRkJZx3/2vKSwtSzm4KCB6HrB7jIa9a
         HRnm/al0PjGrnkbOFMwzVPGX+7VCowF2X83A3pOfQqCv/rDVSXGe4rNTFy4nqWLwgjKN
         fQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781097; x=1782385897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=mi7FEOdWi7iy8ipJ8h0vl2M6L+hW1cCUJ39kxoRxb+eHin2KtkKpguzWYk8SAfuKVK
         HblS7KTqayXWOu189Ce2QIsP1+L3CDWt0LLVAkfEHzkF9l4+bK7/opuprSnF0Bw8fHYh
         E784qqohGAxCitrMKIigj13dwFgOJNDJGxWSFB9vuggBhPsnt6PRp9MjjZzbABLewSwc
         ZHyk6U3580RwuQr/ggKJfONBOaaW9efI4icEIbX82MxqTnHTSGKktJ9tyfhy0L3aYrO4
         XMoZUxNRCorKEHWtHAcs+Iz1niR29gFfXpboH/yXqJcGRjZYeJcAypXngttYqu7CY+41
         WpHA==
X-Forwarded-Encrypted: i=1; AFNElJ+H6BBWYSEm2vSiPWBkIgCmkn3SkNPVeCpJLus5OlMn9OGFKwO+GHabgTcYgp9vvMweIt1VZNG1M7zKvJbmDw4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/GXChLuypTVUxGgUJhSQGy9SCTswWjCRUx/onTfyUs5w6rOlC
	JCTI4OcaozAz04IY8sXA3mw/nsGVIx53pYbNpFuiQXXHM3PaNMt+5cbN
X-Gm-Gg: AfdE7cmEb8y9AT1cNqMP+lXppChHoP2uddRI15EeskvY+3IO8Xevqg1jras3p4MaKkB
	F8bgN2Xr8pUYEQgPXesA+UedRaimSsrvfwlFSA6ZIBsApsape9i0QZRliSQzVor6EENoLw1A+3x
	xHWoKkE0ksCe/TqdVuFiIP3D4mVxgndLF3j3sQMttn7bYfFjAbKDcWbed8XHW9okEhJl3BRXnvP
	D/b/mD3+Rvz130/qArOpBodETA9DqKV9yafn8tZbS5eUsKw6WX2dlHYb3pEsZXkfAaLfbhLqKC3
	WlMhzumNAyS13SyYo5CHz4z/ifoI6vYAnQcfhVGBXfzyj55qa/pJGb9GUPRr8B89g/UaAorfgQg
	6PSALQQFq0m8m5H4H3fNNfWjhZMDR04rS86HxGwuNupKldHODjUu7k/A+jA2vVkMJ4pdf8gGZx0
	HsdqUCfJoS5h9bN9Vtw3KWuR0Efv5/9W+4fupcYrId3Y31deQ=
X-Received: by 2002:a17:902:d546:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c6e2472467mr40617785ad.0.1781781096866;
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 76/78] ASoC: codecs: wm971x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:25 +0700
Message-ID: <20260618110827.232983-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm9712.c | 4 +---
 sound/soc/codecs/wm9713.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 83cd42fa0c28..68ebf9d23865 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -229,7 +229,7 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = 1 << shift;
 
-	mutex_lock(&wm9712->lock);
+	guard(mutex)(&wm9712->lock);
 	old = wm9712->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9712->hp_mixer[mixer] |= mask;
@@ -251,8 +251,6 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9712->lock);
-
 	return change;
 }
 
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index b3bbecf074ee..d338b9a915d7 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -238,7 +238,7 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = (1 << shift);
 
-	mutex_lock(&wm9713->lock);
+	guard(mutex)(&wm9713->lock);
 	old = wm9713->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9713->hp_mixer[mixer] |= mask;
@@ -260,8 +260,6 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9713->lock);
-
 	return change;
 }
 
-- 
2.43.0

