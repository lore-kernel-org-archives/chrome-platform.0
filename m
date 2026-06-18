Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B293F0770
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780979; cv=none; b=KDSZ31penYjjYWMuvU7bxi3hWCiI5ibLPA1+0e6I61CwLPSlBmX8eN2cuYEOTAFNeDyTPsQVUsFf4Uc/+GiEYAJJPKEwNcc2udL98U3tWZ3b3BM8GTqkB8s3pq8wJfhWOUaxar0Asu40S3Izq1fAvEQi7r5kbTi18ZRxpd4rtbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780979; c=relaxed/simple;
	bh=VveqHJbkYEX4uhQvFM0c21ksOyeuRsbn28lpWqPOOFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hN6S3ojwSD5jjjWOCudgspQtDcHsyQEopOxvk1866vo2ilolTfKb3khCuoARAQOhIMWe9TnJApJYb+HVW0sQwqmGSUksYtBBFEe97Zh/oSExOtNcUHr6WR9g0QSundc/zrRY4AjxVfEBFkeVbOUjl9lsrJiOVVnLN3GCkQw9eW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXIdc1/b; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXIdc1/b"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8894560c89so281955a12.0
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780977; x=1782385777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=bXIdc1/bq2Y3CCGk2j1dFj/dA5Ud0hV4JNRJ9IAyTnVwb8ooqh+vpIxSSfv0vKQtOM
         syCRGQ6nfj6QcVD+QuxMX1PBsLrZXr1n9WEwetn0Z9lR95DHraAH6faBCAQ94JN3a5CH
         xa3Gvfyb4mWMyHKQTxoiwHeFEU/tFGr1gpcr2VfxwOHgNjrhJOREBbzQ+vL9nHjC2haX
         caJfwP7T8ghNCIvzo5sVJiN0O0uhrcwit4kq5D/FH5wTuOSXuUl6RzQxYJ9nlSBlYAxt
         g85lm1EoepiugGfI3MzqaKhtANDU8ISyBj8WNzy2vLxUIV/Xd0/rtfAE/TiCQiu15gO3
         LWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780977; x=1782385777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=az5n2ndoPoVQU004SHXREJZ32txviXfT3AM2eiO9npizXqZyP/gdw8rdqNcShYtgW2
         xK0Dhh9HQF5Vd/gcw1FS7wcf/mqU8rsJkEiyp0DkOw4ZYeKbT9M9lIKAp2VyPUb4Ae9S
         BZQD6OismlmETLFscFdoQL6y6TlOLqpib/QBr259ojNL9jRsTzZPC2o7VXv8ptiSzuSd
         JIqHp0UldQPCt48NHAlE+U0qLLFCpdDcZVt3l6jcS9lSTsaPwz18Y5eAbe0zpRA59RK3
         WclX1afVLL4VHRt3wn4SPfYMLXqv0ZUbRiOW3uil3195xoC0WOi9WwIZjz6sTYOUeEDT
         MXWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pJtZf/EOgy8ONzDoQIgFZgmjXNBykE0Gmeomg4gHM1dIe/f7Z/YLOEohIKwh9SmrGI7jVw9P8MdoAb9BTe7A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxQuVRecdFRgH4bhjFuHeySR8YAwUzq5sb/QeKsYjFpUzBoYjM
	XUeXKPpjR5/yVUGsaNIqNbNHY15IYNMcmqqyAU/azC7no0WTlupkTH7K
X-Gm-Gg: AfdE7ckRuL1oBwJf1JIN1CrJRrwrwLcGnlxyu9pArQ/ht1Gmal4mmMiY5Osj5R9Xle7
	fwN02M9Meyzc6OxAxXa0tdDnPfG+Q5Dy97tlUrA23ioBXC4BsEMQ9CoGRLr23xboB273H3sMy17
	dKyuZX38a+nMGhHDisl9cmZK4cVvgmzYiQtmPYS/LH2s6BXrhHVJ34oHd1V7kvaTbZG3ipqzVwj
	ktkpofqlzoJJZWdO5nMXjqhbFlKGRv/gG9UwsT50Cnjkj+uK1aokh0petkKsJ3XxEuwcDSsxd1R
	tPVdJQjjEt0+ovxaehXYt9Xn4KYopksowIh3ON86kX7rrsH/hlIyJ/uXASTD+Kk/vM/eIv5TOtT
	Jmii6o4vrpkp27YoM/7HO5sPwvEG7Fa48kU8O2zFUP4RCfTDTq7jTOMUMWnQnSMRf58msx1Gplf
	5XGJWPlT+1FbPDcCi5H/PvwZId0YFCrLqlGoBC6hZsvPYN5KhBCU8ljrTXSQ==
X-Received: by 2002:a17:902:f547:b0:2c2:c0db:964a with SMTP id d9443c01a7336-2c6bc23d4c8mr89883015ad.26.1781780977509;
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
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
Subject: [PATCH 62/78] ASoC: codecs: twl6040: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:11 +0700
Message-ID: <20260618110827.232983-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/twl6040.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index e10c51092a35..6b18252fa8c6 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -273,7 +273,7 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 	int status;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	/* Sync status */
 	status = twl6040_read(component, TWL6040_REG_STATUS);
@@ -281,8 +281,6 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 		snd_soc_jack_report(jack, report, report);
 	else
 		snd_soc_jack_report(jack, 0, report);
-
-	mutex_unlock(&priv->mutex);
 }
 
 void twl6040_hs_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

