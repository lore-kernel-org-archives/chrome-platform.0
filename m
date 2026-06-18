Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D923F164F
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781058; cv=none; b=HJWRlSAHSua4+Pupya1LeDhSbSV3BtiYkKisLy+raPQNDwoiKiGqf38BOs6/T/mbfyCuXoTkeIH63UpFgSWVRMLAI6PWjEnWv/Du6otwJPFgg3Hh+tomBeptvFdBDXObtwtGXnJesIuvGqnKSDMJR7bFQ1OwgaQ2rTw3BfZd1Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781058; c=relaxed/simple;
	bh=Ua4hB6ZB7yjJO3B4WNFzsP6vzs4xxjJPlgY4HlGomMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOtkbJ3v6NVugTnt0bQzgpnUMk5K2bnfom58zk1/1/NsObpSngJq9I7HjS4KG01vG07XMeIn6xJXbnQBBc4Xe1nnFQNqfYAZWg2SP3hQrgv6cEDrn60i+bIOmdYN6Mqh3YjcWavBSTuIV9sUnREN7GlBldOmhuMYp/JHSdm7+Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdDpPFPp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdDpPFPp"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c3546924so7068225ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781055; x=1782385855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCcNg450A5ExAdoklD+/H48BhvI0tIIxQXlFkv59V9c=;
        b=VdDpPFPpTi7X/6BmcW+WQiAQrjPyHIO8cW7QmCzOySsn7+oTSEEvQppzrYjOLWM81L
         K0J2czUQiJ4z27pZ3FOCmMCktuBZGnU0tld99ElhPve6UCvcvt2Wjwjihml8Sm1YF0eW
         7rDZZPmQAhgfrokzOxCn60lF5z4d9FexNyqR4zPK394RefKr5b4W1uvosddnpzFgxiNX
         FRWaRTpSBoMUawX3qjWTtnU8uZ1Jtgp7dvOUFhKzPfMWUKZpj5CoannO94rR4KfSrSNR
         EoegD2s7tCHp1dv8btJ1Q+xwcU6Pb9ljBB8pTZTIrWOs7lA27xb3P1vOrWV27TPqTjpg
         3SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781055; x=1782385855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCcNg450A5ExAdoklD+/H48BhvI0tIIxQXlFkv59V9c=;
        b=VFXZMtqvWNeAYniTwHLrjL6WNE/kroXnt9giJX/i5aAQsDMRHjkrQ3X6ctLsGB+u74
         Zbb7krnx2I7Sl2Y8GBFhu8N5LuxB7MY7FJFZSIcfozN0aRrE65O4HYq/BuMq03PAzgrp
         rZO9T7Bk6wtcI83dFr28zX0Zs9m/zhZJlWcwKDwpKCzKDK2G92fIPOo/IN5SKn6nCQ2S
         wdfNKxQbU3gnT/ynWRpNmvrDNzOv/+Lc6vidYpPjpbZXNjqdfr/x6z1N+jl/ZSglbc4W
         MuFxb1chPbTgmPu5qS4NZ/aMR6GxYU4p5HRxSwgJZy3vZPCPsaYd5zcIc6bV2oBXIvkT
         fiFA==
X-Forwarded-Encrypted: i=1; AFNElJ9ryriRPK2kvWPUoq8tYpzAm3EEYi4IkPtBW7D3a5tn0PRKIVakPs9KihdadpPj5vCo97h/WthrUkUwJzvW7ds=@lists.linux.dev
X-Gm-Message-State: AOJu0YweYIlxHy5XlTX4yk6V56lZWSk90PKjdlfrTZ6JwyuGf3K7m26S
	uxU0V2rkvkiBJ+k57vx0luiVFDiA3MV+Hy8nZt42VRRJwuKZAMQccwHa
X-Gm-Gg: AfdE7cmgQmXbnzi6hjuuMfvXCv/fJc3FqxLkodCNxXy4Kh//4LOK/sBi+zXzQ0uqdiL
	1u9t5XADliCOt09wkDvWdmbqiS6bQ5IkfgbndBH1eaFNKMxeVJ1eZiWwqFCX34Hz1wvlpAeHH41
	c1HLnwysSno2QnTeaY1QgW0uOvw4bzAJRMpQEC8kyGuZ8KOkbDudi8Q7y0xZvZ/BoBeHUyTyihD
	RpQBtBWeY5/lcbUON7yOO4SESZlryZXZt69+VJMdveMHGAeXx8IaWrVv8rdmKsvLHpyU0ZBVweF
	SEOQcvCvA/r2TE6rD1JEjETOCwKjDLSh+cTgapPQPr6Udtgc03UuBGzanrZdEJ+9FC+ZEBJ+Z1P
	ExmClLSteC5bFino+JCI+q4aWgil5ZqsEsiJFb9mwOPKBVDL6qSle5s0joMW1gbozqCh3IGpyB0
	lIVtQKo3ks1hk57mKvmnXJaBT/5/O3WLgflKWR6fLxeGTpXEA=
X-Received: by 2002:a17:903:178b:b0:2c6:a487:f431 with SMTP id d9443c01a7336-2c6e5276170mr34746725ad.23.1781781054643;
        Thu, 18 Jun 2026 04:10:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:54 -0700 (PDT)
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
Subject: [PATCH 71/78] ASoC: codecs: wm8731: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:20 +0700
Message-ID: <20260618110827.232983-15-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8731.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index a2f0e2f5c407..ff004c9e01fb 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -115,7 +115,7 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8731->lock);
+	guard(mutex)(&wm8731->lock);
 	if (wm8731->deemph != deemph) {
 		wm8731->deemph = deemph;
 
@@ -123,7 +123,6 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 
 		ret = 1;
 	}
-	mutex_unlock(&wm8731->lock);
 
 	return ret;
 }
-- 
2.43.0

