Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C85F3EC2DE
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781064; cv=none; b=MYEWq9SDExI8JjgcUgvPqMFY0VAdNpKSqxlrSXHQxO0MTZIqtzqOYH7ikIlLjSMkSysNseaSv4fdRTVxnFjN77mHPLCmIj0xYlIsS6wlhvlQ96KcgIR5q/oJVeUUBquxIFeMZvqPJKANVyGB0QeCMgb0VFFkeZoRUSfJSukkzFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781064; c=relaxed/simple;
	bh=Aa2l9agGlZMpsb3Jajw4aEzL2RNOE2njupqBSV7PUtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kuWO4dYSlayJK16C47kYSJ572c9aGbC9RRvTCGlXIuVFD8CRaSYWppFwaVt/wA9GkrqUGFCz4FSk+Y14g/3Jf+lGS9mFXnBnMMrGkjyqJ9UD4hMbeHXTLCPyyJZGApwVpRU339QZF/Bbzork6KYl+bNJRotfIal+3tka7NS3lCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrM5V5VI; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrM5V5VI"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36c68964315so369783a91.2
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781063; x=1782385863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=;
        b=OrM5V5VIOkbwd16pySKETh0wpW0BBcOoD4xbJKv8Mr/D2zUKBWyc8/UYig7XWP4Ho+
         Q8k+oJgKSNAmf52ei1P0nThjsXTVksb6EyZmkKnsWlwFZaxuplpy4eHD0FWZ8PZzghlO
         jTQ4Slgs3vphflTlsQOrIbPoOf9VeD5niS/K+FyCAAiBPQfJdtcqM+OnH4D+Az1jHGSU
         WCZbwus0PYOJNVCXegqvnJ6k+0WJ4KYNfBpUx1fUkxS/IIgw6gWs6Q/1d4dapALUzRRd
         7HElYuBtv7fpiw28DRL+2pZOq2Ql/SiW+ObrgPkxNPPqqPjMeKEI1SXz7L+mG5TmouAC
         Uaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781063; x=1782385863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=;
        b=PppssrVYh+GTCzXt6VxVrIodBVN6t551x/IHbengM0hzDzBaibxpUaRVUn1MkyQjLY
         r2BWEQDWVBaSZmOylw95y1mWM2PDBlVzbmBqCPNPfG91v2yfIpEFy4MEzDsdwRg66mXM
         jyQFMhaA5J9ARj0AgLPpozpyrnanMH/WF0ALQzl0ihPNhBQwb8efBGfHkoB3Kanb/nbP
         8aryFkgjqpAJSUfz2n5wgcP+DMEAwbZLjCS9+XREqDSR5cHpKx70s7cGguDLyLW96Lv8
         lAUcQYmTx3DX7aE+sp77OeRugYueJTABNp43wnZn3U1Yqul+XKAz0f8ecluFiVHWeGl7
         xs3w==
X-Forwarded-Encrypted: i=1; AFNElJ/kXSj0g9/soY5AMQd1KwrqWeKvilJ1LdpbYRbAc2y6wqvO0sxBSJi/+c+vHaNIE4Awu5087jvbuKO0p3Zlh3g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlA2FBSIdRrowFC/tIupA62JWWZdb911tiab2FJ5TEqdWUvFqE
	z2+j4mVfkK4k00Q/d9p4J/CvhTAGSodXiQ6ZjId27eD6ceNzCv/8jApF
X-Gm-Gg: AfdE7clrkATPIoYnv0Fi0jC/lM92fj4ErZU4IU8UR7InUKcZkY7toXDnCzeoSwLHug3
	20bKLb7Ze9npwskZdwG5rfHVmHYaZTZ+Piyb83t/zDfElRazFZ3Gduh5xjT75Qa6WHQTes8x6YL
	BR3UvSzgo+K8wJL/o7MSI8+ItMmEcGgqpInxKPE6Coeg3j9E3u23ANZtQRhr86JiS8VOalI/mrI
	XC4nAqugxaljP9c94G+A7KNAwJnGroPzTtK4FPzCr1mKbPUuNU3MyZFFsXODlB84nL451Bb8FXi
	G45XaYADNBqSCyMABhlDyNMss6YzfP+ISGbAsovZu7iDlpEzJrUMQq5BhxQDXk6NNvpC7mv9Quh
	n/4dmcZNZtv/zQCm1I0CVwYaP8wrxWmCjR917YBhPxryNeOn0vQAXQIGEseQD56nBCT5vr4Hsu4
	tlobkTOGHnJjMZSy47xma6XxLlkyOakXU/V850mYvvmuL4My0=
X-Received: by 2002:a17:902:ec87:b0:2bf:1cda:29ce with SMTP id d9443c01a7336-2c6f340c89fmr22802915ad.6.1781781062990;
        Thu, 18 Jun 2026 04:11:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:02 -0700 (PDT)
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
Subject: [PATCH 72/78] ASoC: codecs: wm8903: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:21 +0700
Message-ID: <20260618110827.232983-16-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8903.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 320d7737699d..7c87e927836b 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -463,7 +463,7 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8903->lock);
+	guard(mutex)(&wm8903->lock);
 	if (wm8903->deemph != deemph) {
 		wm8903->deemph = deemph;
 
@@ -471,7 +471,6 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 
 		ret = 1;
 	}
-	mutex_unlock(&wm8903->lock);
 
 	return ret;
 }
-- 
2.43.0

