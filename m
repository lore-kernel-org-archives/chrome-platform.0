Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229D5404BFA
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692875; cv=none; b=Y09vhq3ybBcr3XrBGxFPm8q/yGW5x9BoL1vF0ANeRLOW0KdJQoqdT4Gb77JyOuJDs2K9TosTaiFvigNb4Qm2+Is0aTWH5pCdG8r7h1NEtpJl67jyrC42CHxfEZ38vHTWjDSyoA4L00nT7juasIwWN03k+L6i6Mqk3b3/yG8D+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692875; c=relaxed/simple;
	bh=dLcsmhfPTMCw3dE9DumePoMRCtlHGUVY/pwVPWnU2Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMEC5T2RgN++zZ0SZXeTA1N+aFg4H05W+KdJz4OPZ5P/q55Gxrgy3EKHpHvDuAlR6bCja5YsQcxFQHNqZCuOSLgwcCzzbiVzmtg/ADFokJ2tortUjsHan5m3ko0/s4RJPJBE7xFj6Wd813hH5hNVIUl3KFyEagPALNfh9DMABbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QR80R6k8; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QR80R6k8"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so152991eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692873; x=1782297673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=;
        b=QR80R6k8EC1eW9890L9Kr/t3GdbOU5Suvs8RIHpCVjAS9hIUpqbv6DqVeHx7al8CP/
         EfuQSrz5mn3l9xYzjY8wNpqVjhBakPeSrV2issylXe6bbXH4Ulttso+Ww3xsuKTur9cw
         MmmJdB/X4aEFSrPGWO0r6QhilC4Wt//+UHfQes90st+4S7/4b0XVg7E7u9eoPXWvSMYH
         OlTgLvXuDCMFxmH1HhF7TRURVMckbAS4IhLBR986tHl8e8bbeJoaxoY6M9CIINSQ3Is4
         kri9fhRmL0VFEO0y3GsC/c0TuucizSN8POUbpw2H4vJNnFO2xJQyWPSXlAVtFSkeS3J+
         JP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692873; x=1782297673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=;
        b=bRfTknEZzUAsP+rWMGU8ysFG4z/yUg+f8D8tJU/mG1vEhPzwKDdpHQjzDn7XlvFzPO
         F6deWch9AnzEZQ3YOXT9q1fbEsuLLxKCXaaNohZu21Y38YYnBLUHV/Glo3/1hEDsSLe7
         +jqGhvAwZqTrkp4cv8sW/LY+kLQhRex0VATOvq/W5oosWG4ZlE7vwwTsFjXgArP+7Ytw
         quQqn0Yrp+swsQXcFo2+d0PBPHnGEFnEVQyqQM5pApG5qAiPhGvh/j9KEKgmi1BZPshN
         ymV8u7M+duqtmW1rlM5fDjenDPhD520rnj+fbpzgkGjh9tydelnaAJi5ATxNjiqpfXsa
         wkfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8t6yH1NxTyoi6VQQx0e8qq0Ul2m64i/oYxLY1J8vqhByZLtHBSXQYGMoArBuLCu+oJyHnTH/iqeKR8S7bNV6s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIqW+P1Kf07GcvIhTd1BT1X+B6+iZOpE5tSLi2zd0g8Yaq8hco
	G3yqzKmZmp6E2A0704XGMnVggQ3ce5muBERFg8NzbpT1whcYhBkJ7bAF
X-Gm-Gg: AfdE7cmwODRVQHIRO3w3YTgGA8Q12Pp8ZHghMpfqa5MuTh3wNRTSZ7qnIQDStnRoxsi
	f/2TByVQn5w9ee+5egeO1TsSL116beD2Au7nZaO4lzVqmoiic9y/4g+Yr7DaFm1g6FToCh8V90A
	K6VQ3eOpLdkwvAXdEqXuxdqfLZJCoetYrU3jD+/wNLRSjGcvPIyAOKd9fGYgbNCI4G4iOs/9lSW
	ajZjlmLLxwBVdHNLh/s/L5cUz4du44URkG/f2u6pyet8UOFHIcmFt7YfaRD/SK/1WnH48ruegFx
	q0aXwV6x2fdECoAQsVfHCHZrPfp+52XAWP+D2gP7IN64lPKASIbGwBl0O5Wt3dPCEHTi+vGy8jB
	dP3OqaHVsTl1JTwCcfGTvjjT4mhsqpqw8Pl+PngUxhIisxyOkolucqgTfT7SGuJtr+0tbjddPBr
	SoQNt6QkVL24zvtvUTPIXyP0Mb695jRR382vCB2e3ruSC5DmQ=
X-Received: by 2002:a05:7301:60d:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-30bcf6002c1mr1306991eec.10.1781692873410;
        Wed, 17 Jun 2026 03:41:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:13 -0700 (PDT)
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
Subject: [PATCH 53/78] ASoC: codecs: sta350: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:10 +0700
Message-ID: <20260617103235.449609-54-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sta350.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 99c7f7ac807b..b1e2f346c647 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -306,9 +306,9 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
 	unsigned int cfud, val;
-	int i, ret = 0;
+	int i;
 
-	mutex_lock(&sta350->coeff_lock);
+	guard(mutex)(&sta350->coeff_lock);
 
 	/* preserve reserved bits in STA350_CFUD */
 	regmap_read(sta350->regmap, STA350_CFUD, &cfud);
@@ -325,8 +325,7 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	} else if (numcoef == 5) {
 		regmap_write(sta350->regmap, STA350_CFUD, cfud | 0x08);
 	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < 3 * numcoef; i++) {
@@ -334,10 +333,7 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta350->coeff_lock);
-
-	return ret;
+	return 0;
 }
 
 static int sta350_coefficient_put(struct snd_kcontrol *kcontrol,
-- 
2.43.0

