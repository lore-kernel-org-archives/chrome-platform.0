Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DDE3F99E9
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692438; cv=none; b=UbAjxI6MRev7VsPK+v1rWvdjaW+npduV4kAfuswj7QkNpCKjqLcdi6XC7xaw6ATPwpn5gygH7mBxHEafcVm0tTj/ZVGBDVonffYwVNUNSwJcSN1qtfeFFomJQyrWR30CMg1jUWlvQ3oDATRFws6b6tcdPZJ8tMTUfSeU9fifcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692438; c=relaxed/simple;
	bh=S7IkiFODoPFXZtj5+rPYNsWBbtzbNnr/sTl4Y+gY4xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gU9z7jqh+u95XR5ok+8M7mojjmH5rfNomEP4/vJBEVh3Bqt8BspTuvZzRTvViZ3L+PVz285Fu0ZbFs4BHQrusqsUW6AXlsFex4hYFl9IPlYYdgmZtYN70HafzY2RsoJ1mDbr8VpyzbkG+J6IzwzsQ6gEzTzzlFa3zjdKTju3Zss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmYMjA0P; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmYMjA0P"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bd445db39so180803eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692436; x=1782297236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=;
        b=MmYMjA0PFXa92n29MR19qWN0Ux8RNMEJ2Z3O4ZIRdlFFtZhHrnQhroFDoHZXNvdNtJ
         UE19e/cFXy7bQ2bciHV3AkGjWrAwcvEyyDf10Cfs2W3PC7ba59NHiQ8Nj6NsL9G7xUQ0
         4Y9QOdIpwNT1Q/eK+yl8JeolBzWM3Q6Jh8q9nnavK50XiLYqqaAqflZvT+apffmVTXTG
         7yEPWTql6gvXCHDsEb6PcimiAduQMYYHFjqp3Wkgqe4RJliZm+N4lPFYt9m51We1ZCVf
         ngVA3HJuZfayMa7OH3foEAAMVMqBNWxFHREGnxecc0cd4Q68oIMh1u8SCjr86A6SxpRa
         8y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692436; x=1782297236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uLJVi2lQkwcQJakc7pftwG/u0GTIiX/FfTuiAYCAfco=;
        b=ouz2PcvDCCk/oRe+82QInCJPdKJ1qJLeOieUrUZZMK4JfnwAW5BipO/Eyt7/w6Oycq
         lseZIyx8USuOgwt9ZtcaTfGCbnN4yi1ZIkqJRBMP1p87WKioZCdJn9P3lr9kHu/ABmF7
         Vodq8iV6gwnp6jabB+MO4+Zgl6IIScl/zuQ7BPgbZuysZLZh0GBl8yWKLdT9htf27qcs
         SE0lbqphhOkDeiyJrwKfBlki9ibQ6buaOss/DN4vW9+W4CYre5z+HSJ3ekS3O6sNa55u
         2hgi5OiD22ZNKfos5duWdLByqbZgvf/G3yG6O6VU1152XbVpfEzAWm9I2NtVUJ6+LP/E
         z5Mg==
X-Forwarded-Encrypted: i=1; AFNElJ+YhMPyLTGISTOuzlS9S9Zd4jtAkQmnYpuF86DSSwOJJ70GHUv5riQ/WfqkKWMx4gbZIyvP2nSIKAk9GsN30ik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyarhjy5ipwXO0zVnrgQjwQKvwLA936X/Ng3MbaxfgSC9pgADKd
	BlZTCYQA0nind0i/f7mjPtU5NxaHwLt1JojpV/lE4Dfblcp+e/FkzSVN
X-Gm-Gg: AfdE7cnTrF4tVxyjbYsffbEyCwJvv/XWxgNs0t1DvRLIkVb21Mq4jauB+jvJT5fY07b
	2znDbkJdJ7k4B6glq3T+6Tvu1/+1kBH+ycUy6m2QxT67X9vnHBImjH9+BJ1OF26Hj0gUT56sl0e
	lKY22o17/HsGfyNSG9E96VgpzSoJDaf+BDU2/gji1/jBlqFXTc3Qp8c49/AQQ5nCafTIt/iy45t
	GoyjPdVy3wtTg1ouLgS11FZ8D0miXlWU9sQTHun+mMRp8NoeklJbl728oTZpWWHpYFQkjUu/Wmp
	uEj04ep8rrn0b+yCLaUGLIjQcBcOKoqbnaLOcPveuWmAMGenBp5OKsKBG8QrxFB1gDOiKzPu7YA
	nCE7E+axKwpFl8mKf6yKgCEKZhGLHz2GVS0NGUIBRYcDo1wtz4fsajowZGsnJi+S1EY1CVl1Sv8
	P62WRvWbUoTZUkQcIjhhj9x0/2eGCSBDiekr8gmzlWJpF2OHM=
X-Received: by 2002:a05:7300:da13:b0:304:56fc:775 with SMTP id 5a478bee46e88-30bcf567d78mr865158eec.21.1781692435786;
        Wed, 17 Jun 2026 03:33:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:55 -0700 (PDT)
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
Subject: [PATCH 06/78] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:23 +0700
Message-ID: <20260617103235.449609-7-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88081.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index d5e886a8f106..fce56a249a1f 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -763,9 +763,8 @@ static void aw88081_startup_work(struct work_struct *work)
 	struct aw88081 *aw88081 =
 		container_of(work, struct aw88081, start_work.work);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	aw88081_start_pa(aw88081);
-	mutex_unlock(&aw88081->lock);
 }
 
 static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
@@ -942,11 +941,10 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	ret = aw88081_dev_set_profile_index(aw88081->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88081->lock);
 		return 0;
 	}
 
@@ -955,8 +953,6 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 		aw88081_start(aw88081, AW88081_SYNC_START);
 	}
 
-	mutex_unlock(&aw88081->lock);
-
 	return 1;
 }
 
@@ -1165,11 +1161,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	if (ret)
 		return ret;
 
-	mutex_lock(&aw88081->lock);
-	ret = aw88081_dev_init(aw88081, aw88081->aw_cfg);
-	mutex_unlock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 
-	return ret;
+	return aw88081_dev_init(aw88081, aw88081->aw_cfg);
 }
 
 static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
@@ -1178,7 +1172,7 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88081_start(aw88081, AW88081_ASYNC_START);
@@ -1189,7 +1183,6 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88081->lock);
 
 	return 0;
 }
-- 
2.43.0

