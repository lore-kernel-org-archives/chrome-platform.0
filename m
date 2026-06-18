Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732443EC2DE
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781081; cv=none; b=EnZzgCz7GEbOaTvOKW6HLnWAe7aRaHSMMHdFtZjPSq3aty8umW9wes0AXIZXim08hAnxc/pxfzBp3nJvNaLpQb0QSmORxQINaiXVjq1/+r0BF4fsHZSq+FPXjkjNBsGYuXElrFq1UHspx6vHyPZZq/VX4vjtDrZIYaP02I7jbmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781081; c=relaxed/simple;
	bh=cWUAkEKedyEvWcXqXWHihLQEc3eXm0hRijmvJp5Fa/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHbwlaeqBAMYjqiAJFZJuXF/ONruvRO++IKO3xJL7fTY5C8NtIaWfrc02lBjVvaCP7MzkqenxTqSzDDYojcdX/k1tfZacdYkTJ+yJUQqkFUFJ9W00PHcuXjMh9h1431yPmRFAxfuRcefxntoVBhpnkhODXwLKRLCh+z2rIVMTeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ny4aYn0d; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ny4aYn0d"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso7467745ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781080; x=1782385880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=;
        b=ny4aYn0dhLesW8OLfoRinBLXJpRpI83qCYuo/CYvPygj2lDYZKAJQ7e1cFd9PsEOSA
         pgegdoWGxr8BmKcBiUNfDNR0Wmg0geio1wr7SncEg0uSVG5AwniYqiaCK5lqVF8l1niM
         zjdIFpdnar5RSumm9r1y0vUsPJCjWupa11Ff4FLHMR7qZa71ZXkTyhd8bRaxkdf4fdJX
         J3fJRoBpom7p9+DE9urDfIL1Kaph9W30NmkQV/bLxP34p9p3enMiaCzNrP7Tee7DITBQ
         6uIANZBGwMt1tWzobBEnY92Ii5mvbhCb7cpDZ9NRJZHwe04gl8q0r9Z3avkmLDbtivmS
         0JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781080; x=1782385880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajmHWU8IR5TpfwHKx/3DZ34C8KY0J7+sApJwYsPJ4Rk=;
        b=QquWvVL3aDRoa3pWgW0jbnIZFjQqCQrSAOMs9esBVfjs2wSV+VqqSI6fbvkieI9nSX
         UC7h78KqKXwVBf1AoveRbDCfK8MwU9gsMViWxNrDeW4Koi/X+9eWKGClKBTdjikFBAk3
         XuOiZrTGFMzwlcWgBIH9e6bNaErrFyIYjnb9e4jM1V67lbkCCUZx8KykMuV9SzoLyzXu
         HVeaYalvgL2Lp4/tw2z4KViXp74RRkoyqyI67btQBhpGy9yL4zl7pJspnoaTL2vdTCRS
         TbOlV1Bg+6bQnSSBQiYce0SwBrdMux5xpS0IUz/s6D/lz21x4fnBPSLbGHHVjnzbfdGz
         Gsow==
X-Forwarded-Encrypted: i=1; AFNElJ9osGVF88mJe42k+V4jL9KRPeOxaPZp0mRe5oi/uhn7Nxx4NNy0P3s2b5+awwdJgcBhevlLLStbhu5zj8Qd0jo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBBmojrTnw6Gbk0+9V0Zq7kJKrUv3iQ+gB6nfd0uM4bTQpGrKm
	pH0TVyPV3S8aFUNlBDIkP963WPfyElvCvDW0HBPD4okU4kRzOFu7+Zwz
X-Gm-Gg: AfdE7cm3RcSpFLbBl/l3iK0emmSrE+srk9chBQy1MxCpeTAQdYTn9HL9ex9Hhay1Ns9
	EHs/UHLFvgCctvk5ahbJa+JVik5JJJCVqhMhs+r0xe5RRvYwTRKV6+GSbUbFcpx3H0y1rBXCTKD
	oAm4xzl79WLNKdwrAooZJkqCcPmUnuHZA4OwNe6Eg/ZfSEvy3vIVEi/nx74prI3HKitP5BBm2os
	wR7ASW/iOt2DJk9tes6S7vdGp9Ri+IZ9mlE78tRyOWBEzy21BZNICnax1lx4kZ8eH6LHThj8pcT
	Vks6JeB+NLqfsbjwP9+vh80z2Vk9IfCuMVCwRB/n8JBzEF5B7A6BZbwrZ7tZR/B57sFEEVGAcMm
	PUOIU/+inBNnAf6oJY231WnyluySrq4FkLYBFDb3Qdsfu1J0rEZP0ixTvg+NGLwmPjiBi0pRe+j
	Uv55NHNDfjSiF0QKB9S8eSWOocl+X3RuWtxIqs5Gatbcfie/Q=
X-Received: by 2002:a17:902:d4d1:b0:2c6:a99a:52a9 with SMTP id d9443c01a7336-2c6bbf99280mr82302315ad.7.1781781079841;
        Thu, 18 Jun 2026 04:11:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:19 -0700 (PDT)
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
Subject: [PATCH 74/78] ASoC: codecs: wm8962: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:23 +0700
Message-ID: <20260618110827.232983-18-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8962.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index de18b1f85a32..6389990944ed 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -1568,7 +1568,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 	int dsp2_running = snd_soc_component_read(component, WM8962_DSP2_POWER_MANAGEMENT) &
 		WM8962_DSP2_ENA;
 
-	mutex_lock(&wm8962->dsp2_ena_lock);
+	guard(mutex)(&wm8962->dsp2_ena_lock);
 
 	if (ucontrol->value.integer.value[0])
 		wm8962->dsp2_ena |= 1 << shift;
@@ -1576,7 +1576,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 		wm8962->dsp2_ena &= ~(1 << shift);
 
 	if (wm8962->dsp2_ena == old)
-		goto out;
+		return ret;
 
 	ret = 1;
 
@@ -1587,9 +1587,6 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 			wm8962_dsp2_stop(component);
 	}
 
-out:
-	mutex_unlock(&wm8962->dsp2_ena_lock);
-
 	return ret;
 }
 
-- 
2.43.0

