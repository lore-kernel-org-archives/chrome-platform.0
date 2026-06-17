Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D950492183
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692800; cv=none; b=rmTI3MXnSxFbadqdG0NV87hRBrH7wARZH9IcxGpVeUSbi8JS1rk6E79j7pdeGxyLYW0j0VRBWbu9zaNXcfNjPMIGo3EbW9/p0spO92v64TvIEhoZTUqxRQ6pZiifNfiu6fEeLd4BbFgXtY8Ez5UXphYwxJS2tOTvJHahQnoMZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692800; c=relaxed/simple;
	bh=CfPSrFVheY2+VrZHiVHqixZx/q7uaP11RkObiCVMyqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHQTB67YZBEdlZ+hpxbi+C7UMnGydB767Hw6rSBQdxTLJYDyAx8QGvUHKqcgbLovUmGv9Hjp77JbmVMMfW2I+IYFrawNNAEIFPwyvsaCFSmAt8n5hGtJ5iVJhK+hu44el46TZsrqvniYP6QS/jLE7soZOzhQqj2MLNZhl2jYMJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWwSGbWk; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWwSGbWk"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304d8362a58so603921eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692796; x=1782297596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9NimHoJxrkt0fKeQ5nDtc/hHZTnOxU7Jn5N5pQIslE=;
        b=HWwSGbWkGM05qy2QVGsK0P0u1Ptd3gfJpK/7aE72HL625tfoV9vdCcU2KCnfjTOVcb
         QRpN38ze55foaTG5zKtwUOfaIstEL/MxO5wP4QuZCGUcDAT2AE5cvkkBMWsLeiCLYiyP
         CXPwqvRuj/TV+R+X24zT1bIyavncZADf60vdRXw0uG4M0QhvTpRJ3WRCmYDZxWqW49gG
         Qj8sZE2ZooYnV2vvcXxMAc6LPCbozQ98xQWcnyNpCAAIsnHVp1WxucqfnqumFjY3tiYH
         9eXUemfawVpJE6ox5dw461nn9Q4PpNOKG/dMCP+sHZP2vIffUgjzklsIZaJNQu0wAVNh
         nzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692796; x=1782297596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9NimHoJxrkt0fKeQ5nDtc/hHZTnOxU7Jn5N5pQIslE=;
        b=eizN+vvMaDUYXEY1VL0DG9OvjSKmAMfLYZ2fDUzxJ7/XthBBnEBHz0bPG9hGbLYwhD
         Y85gRl/3DUwzroAM2Cqxg1eVEAkg4lNa0rmjSrYv1sJJR1FVFYdqkENCwyJ+CKT/TKZN
         jsDCbI6kwpSI0mVs0w28aP+HlK+Jxe+F07lx3H8ur9aXZwnZimMGhNdYpyYU80oAzHDR
         aD9dTD2UoGs8UqMj5VIWzGOO4AppmiT5Q+0Fpd3V+HBAK2bU/47tKrXdhXFY2g8m5IFP
         VahKBVC8SKbG/3mFMpKHwkpJztTzXAKH9XBzUu8CXP6+mo+6Z8mNvpEW7bR+bFVPgscE
         wzlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Vp4ByibCIYHY3DGBKV4a4hukBRXIJkLFcbA3WxiKnXgevnrKcgPw2MwHmhkIHrmvwzL73oUf9ILv7t1FJSOY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzI7Nrx8eOUU7WNcTZ0wrZ7htd7Gc2D74uMwD1BwZHpCAdhobYp
	qbm+4ANZJbnjGUTLFEjS9tZnlJNkkZFZU1xZgbOXkM25KAhmvb5Vp/Us
X-Gm-Gg: AfdE7cl6QlbA13ujT4vjAxWDSp0FUMrW0ZP5hnszASCCdTu3qoWGGzNUFLSaFXPFRn9
	qV2bNGMEoMzLsgKepBFX45SQRMlt1/3b5z0xmCjcZTtNfomSw6yJJUe0bsEKERcgNZN7sJhLNf0
	0YtEMrAhb7YMADKcbFJ6wHiMzMy1FEKTBUdnnN/XJqpV0fbmnVVY59onOmv+kfWXLLr/lNJFFtk
	IYenoxsjehXD5VwYnyAaVKdIDEUhqhDNV+Ru1jW9t5OyWHGpg4HOdGjjxw5UXaPWHxbyTzkr0xD
	A4ghUh7l3RhaI1rbWaOEjVh1/Zfh3ve+IrrWeJ/BbjxTHRjBDacwr60kqhp6bY33Vg5VYdhLAdn
	q8+8xRTW6Hkvsp1380inzCHWwV7e6eciVsaSbnRJ7WKB/Ww3fYwkSnkRg72SBDcS5xjD8lyWXsQ
	IETpTKXbO82nJZxsyp2bWKBJRNDFhs2MVlgxtSk3w55pDWiiE9rWn0j4Dh/w==
X-Received: by 2002:a05:7300:3aa8:b0:30b:df3b:fe94 with SMTP id 5a478bee46e88-30bdf3c0705mr266574eec.3.1781692796467;
        Wed, 17 Jun 2026 03:39:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:56 -0700 (PDT)
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
Subject: [PATCH 44/78] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:01 +0700
Message-ID: <20260617103235.449609-45-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5668.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..1eba4d559c0f 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -986,7 +986,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1053,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2354,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2398,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0

