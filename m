Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45C73E5A19
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780934; cv=none; b=sK6LGskufbkc0cTkDIm0yqHJBa5zBecMCawlADHzCpHS47Mzsd29oyGOH+S5eZHRO/BvzeFa2cfCywpcRFqKibr9hsEH9kA7r371OCt87Ykh7mH8vV/xDbVgPUM49npXy3e+NpNSElW54cQoQbdSCzLFlCM9yGTEc02xYrcoWlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780934; c=relaxed/simple;
	bh=0yaQq+Grvu3FGJjYsD1MZsTbz1cHiqbNEJ6t3Xr8ZZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBaYAHJJpEcZC32C0OFQrcWRu8fOMjsDOMhelabrHgZ9xJzjUbSblWWx96HkwVNPZxBGBfOv48rBxL6rivu1qcxKjrwVhJU2kgRorZ7sADPRo9LhaCxMUxFSXtYPJz+7QLFiyCiZ60Wxtx3cd/FROvwtoUzDU+h7Pjfk+qnYWn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGbDW1Ek; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGbDW1Ek"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf22d29dabso5155605ad.2
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780932; x=1782385732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeDyrRSgLV/yx9S+U/FOT1rxO1cOlIi+l6TEpJj57t4=;
        b=KGbDW1EkPQzhT5F8kRP6I/5/8L1eZqGsnzk+X0AkUbo4jItVh6htknBjvAuhALOv1w
         pbpNoZlbL+2bB8C8qOdBULSmGTWn9PH0c9C/PkbE6ZRvOnZ5p4PA20jqukecscQNrM/y
         XmVpKKlr8E4lLWCyhmZZWIJxmlbw29VJapvwR6dV1LihzT3Lpb2qbRDXJZM4xMkCR9MH
         GEpx1rk9qhzdlRj6NHu7UZOZCqlO8ocvB89goSN7kqFhcP/ABhTy7DO9uK+delcY+AqA
         WDciqZ+ArEFsohU/fmJH1dZmsybsuOA+qgWAt9wY0qBC3aacigWDSXTx4duAPVXorC4a
         Zjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780932; x=1782385732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eeDyrRSgLV/yx9S+U/FOT1rxO1cOlIi+l6TEpJj57t4=;
        b=qr0TLqSVFA3cmwqBqcMA5F/6ToZEFQfnOyvY15RQN7RBCwa74NubhgYKyH8mLCmkKb
         7DSMp4gLA2xwfz9k8gtAj/r9FdtZ5XA93O6nyIG7CrZag9WOlsWNvfDmBCmYvmJicGZ7
         GKRMGwrqEiPILlvWGnOiXsbFsRjf79lqeVhWNQGD80lUXjFFlHuErp2zN6n4iI2hsvCm
         ZNNnhE03Tt9rtOf4tHSKEcGYstFGiPCO+df3SSAZSlvfaRH2+XfiOr30GCfiUR/mCzKX
         OCQteCU1jcpg6I1/PpBpYpdyfxCQstgSbYFXWZy4MGWAC358zkNtDxb9X3/0gwajkUm4
         z6JQ==
X-Forwarded-Encrypted: i=1; AFNElJ/25ZbWImpbl7LejpG2Aq8CnkbktH45bJDCOsyaSiWsX9E3o+GjZHtfzI7+jzZDpZ9CMNlSdUurXMj78QklheM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBHfYnE8kT4CoYqxaclZ5moJ4kq1QYoCw/XcS6VJXmTDFNi/BJ
	NBt89EAC0ay6gWpR37Rf4DbEMO9GIZ0poYFEAJSm96yTg4FJAkmPW+AA
X-Gm-Gg: AfdE7ckiGi0AxQrbmGCKGvqBPcIma8Z1p/2wWpinM1knz4gFWysNB634BI+Uhk/lK20
	LY2PoPWJm5pjWGU/0fgTCpDcInvPL1L51o7V4PX9QEo5mORDqnamunkLHbtqZGXsUluSf+/HGSW
	QEtAQU2UdpbSmPk+faaQ+v7GAufGR+v/4hCHvY/qKqwnWobVyoHzXr+sX6U79ZhGDwQDaLTsv8I
	+ctA3D5npeq5hKKNFLvdtWLP/URuoqP5kl7dqmk3XaByHFuZ14glIWYjk2JlUGvo0wFe2OnOlol
	BZkGOCDbANaiIJq5YWdz85FMYMaC64qW3999LPaFkr8rb2AtB8c3uo8qRjm2bfmQqM0xDJfmoER
	0hg+bMPo+Ge11B2w3iL332Ev7SKphjcNJN8XeR3y9/35LKMZoJcAodaqf7kU7NUt84de9CP9BbI
	blZBAlUf/NApWsugnYAS48EUuGC6UpbHLNufhqciiJ+f0dGCJLvapOQAH1lw==
X-Received: by 2002:a17:903:2447:b0:2c0:b5c1:8e22 with SMTP id d9443c01a7336-2c6f34218aamr24583345ad.12.1781780932102;
        Thu, 18 Jun 2026 04:08:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:08:51 -0700 (PDT)
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
Subject: [PATCH 57/78] ASoC: codecs: tas5805m: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:06 +0700
Message-ID: <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas5805m.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index bcc8cab8d667..f21670dab0f4 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -230,10 +230,9 @@ static int tas5805m_vol_get(struct snd_kcontrol *kcontrol,
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	ucontrol->value.integer.value[0] = tas5805m->vol[0];
 	ucontrol->value.integer.value[1] = tas5805m->vol[1];
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
@@ -255,7 +254,7 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 	      volume_is_valid(ucontrol->value.integer.value[1])))
 		return -EINVAL;
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	if (tas5805m->vol[0] != ucontrol->value.integer.value[0] ||
 	    tas5805m->vol[1] != ucontrol->value.integer.value[1]) {
 		tas5805m->vol[0] = ucontrol->value.integer.value[0];
@@ -267,7 +266,6 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 			tas5805m_refresh(tas5805m);
 		ret = 1;
 	}
-	mutex_unlock(&tas5805m->lock);
 
 	return ret;
 }
@@ -332,7 +330,7 @@ static void do_work(struct work_struct *work)
 
 	dev_dbg(&tas5805m->i2c->dev, "DSP startup\n");
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	/* We mustn't issue any I2C transactions until the I2S
 	 * clock is stable. Furthermore, we must allow a 5ms
 	 * delay after the first set of register writes to
@@ -345,7 +343,6 @@ static void do_work(struct work_struct *work)
 
 	tas5805m->is_powered = true;
 	tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 }
 
 static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
@@ -362,7 +359,7 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 		dev_dbg(component->dev, "DSP shutdown\n");
 		cancel_work_sync(&tas5805m->work);
 
-		mutex_lock(&tas5805m->lock);
+		guard(mutex)(&tas5805m->lock);
 		if (tas5805m->is_powered) {
 			tas5805m->is_powered = false;
 
@@ -379,7 +376,6 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 
 			regmap_write(rm, REG_DEVICE_CTRL_2, DCTRL2_MODE_HIZ);
 		}
-		mutex_unlock(&tas5805m->lock);
 	}
 
 	return 0;
@@ -414,14 +410,13 @@ static int tas5805m_mute(struct snd_soc_dai *dai, int mute, int direction)
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	dev_dbg(component->dev, "set mute=%d (is_powered=%d)\n",
 		mute, tas5805m->is_powered);
 
 	tas5805m->is_muted = mute;
 	if (tas5805m->is_powered)
 		tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
-- 
2.43.0

