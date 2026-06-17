Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A794477E4E
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692617; cv=none; b=ALlCelpMG80qIVXjx7fDsXUxJj8U34BRvVtbnQUwddNFX3f9a6R2Bix/WHdch6YpO6H5IJd3C1IsAwEXKpXwoZpQmCLm3XwEMblg000H+d54dEzgRsdebPj7Nlm0yAKjdQ4hl7KB1EQZIX1/2MRdfr0Kxi7JZUV5/OHY1FbOIRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692617; c=relaxed/simple;
	bh=qnYG4ITutYzjVJqPrIAZHhjlBjgMFmBj8oHZiQsr4Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIuHh+SobG7UTBeBJTbJYyIwDGkC8iB+0XLl3be4YpdhD/cgl/nBiU8MdnFH+p9f147HjWdZ0SzXD9GBAfg/QD5sCr3y5elnKR3VochzCP2H2B4qDrVzOjmxleTu3fmgQ7kDcdHZwVZytwatedyXR7GYooNG8KMW/nyOIWk45Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UH8PDBp4; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UH8PDBp4"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30be4a661aeso103893eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692610; x=1782297410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEB/nJ+GbrXBchfLjo1ox4ZcZZOi5T3WM30Mb+CUID8=;
        b=UH8PDBp40ZMpp9yJB521musY1YqUCeyLS28llWna5hZIuuoSslj9wVX3T/LHmOHcBq
         tXXTH2pQMTd7XyBclh6EKF+60EoQiml2EYoaLVDp6rmBAQXHneXLqLOnUIV5ZsBaead2
         47I+05sjl173xChEMZyN9E9Xf713vjFHSByCIXkTTkHzcLg+BKeBOAMeTjuzbQZdeFAn
         p722+WrbxiaVaEEeq8Yp19z7FWsuv/s79/KTjGFMt3fNxQtd1k6O9MKwoR/5WQ8boY8G
         ayxfko0cmTu8DE3Fjjmoxv03W+jHXj0h9bazBTKUITi+PKCKBbckL8vI4q2q445eE4oA
         pc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692610; x=1782297410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEB/nJ+GbrXBchfLjo1ox4ZcZZOi5T3WM30Mb+CUID8=;
        b=TEcng3bVPvgrgywtjcnAU/ak+EGI2L8Qo2BB7hgxs/9qGgrxuSYE/YqTgIxumRV9M3
         DhQXrDcwcbzvbt63F+2hq5oDUoSAf8SE68gGF7PLe08wDF1quSCjGX/tLt3LTFKrd0hb
         1ZGftb8dYy133paszZtHFdNLXbKk3gACOh17Iyiy+0OFg7+6jc5cHwhONrcSym65bXBT
         BfSEpjNqXbpdIR4B6pi/hEb3havJDmV45b0ax6Imie4Xe3xujPzl59qouvxgeIGQseCq
         NihL3ous7xfHzd+J6fcKv48NISVm2HAokAnW5GHNkX2aR0BKj3TMTGAxAc7Kkj7sc+Kl
         Htrg==
X-Forwarded-Encrypted: i=1; AFNElJ9MoKbC+gIEUfXuSV1VkEO4Td6FY4mWz8YFBcnKKgsfd7vw1UtcCayADFXjedtNMyeFy7dH/4jS4ksdRpbkAz8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ7ZU1ik11aGd8hWEvb1MbvXjpLQf9I1bhWNr8EkARlk9ewlNv
	2HFaRCzzkhHi7Ppc/p4RIqOzy3qHsxDxsLcvWoJWPm4Yk8FPdUvJfhYF
X-Gm-Gg: AfdE7cmNTP39NOiGXlE+gmad5goFjSFuAJYmL7dg57PCIeQk/F/YeyXTDA7vLtCkl9A
	9E1/IMb/UGu1IH+oalCfYDPYzWTSumlI1UZM0/tiM9CRKUjotWgpod577744QpTfEA6Pcv9Zrcl
	BbhP09eCkTcEw7AqF52aoNfa0fpVn95hLrwmljm5K5oGFVoxyhgL7vsRMhcb5BG3JiIyaAINRXk
	mMP6ZxKRuIW47ezIGHsqvMRfLf1i/SeYh0/w8TEKWJwayK348OY8GMK83v26yE2reokSgWPNmvH
	P4os0N6KcRFTlhm6V3zDGSe4wYX5FdkFw1ZM4jfkT0AiPnWasWBzxVN1c9QfqBHhrk2GClfhTYM
	2rfoW8P7FfkG2DdH+C5IrmuMnU5lO0OqYcyNLfYBxtvtbkzhksgyCK0uUJK+5hu5H/xojGArCLM
	bBt2D5CigwbfBV207TmMlPsSwnL8eyG+k0SsKwrs1suUurI5g=
X-Received: by 2002:a05:7301:3c0a:b0:307:6e47:f881 with SMTP id 5a478bee46e88-30bc9f3aa8dmr1695525eec.16.1781692610135;
        Wed, 17 Jun 2026 03:36:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:49 -0700 (PDT)
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
Subject: [PATCH 25/78] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:42 +0700
Message-ID: <20260617103235.449609-26-phucduc.bui@gmail.com>
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
 sound/soc/codecs/da7213.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 4bf91ab2553a..384c79c7b5c0 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -216,13 +216,10 @@ static int da7213_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -230,13 +227,10 @@ static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -244,13 +238,10 @@ static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -258,13 +249,10 @@ static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -465,9 +453,8 @@ static int da7213_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7213->ctrl_lock);
+	scoped_guard(mutex, &da7213->ctrl_lock)
+		ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -499,12 +486,11 @@ static int da7213_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 	ret = regmap_raw_read(da7213->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7213->regmap, reg,
 				&val_new, sizeof(val_new));
-	mutex_unlock(&da7213->ctrl_lock);
 
 	if (ret < 0)
 		return ret;
-- 
2.43.0

