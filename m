Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDA346AEF0
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692825; cv=none; b=dtqkgCFKmhXKnbswaEk/0vrfQrqqRZAhxnoriiQE5cleVXAN/9dZo36yr5NG5bYUdx3Ab4GcAM87zm50Zb2I+UiFjB5v9r8jndZ4/YMr/cu3SiBEDC9nMfNPNE1jgM9R1hubA0NLvvo0dA0NV5jgoam7wTJL/D15tsMwxDl5vm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692825; c=relaxed/simple;
	bh=hnVgSVk2XjKkHVJ2nHstb4qGftdMio+vZ/e9nU127qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Job+zorKE1w2WYzX4mHYmEyNjale7xaZnI94COwK+MHtyBjzC4lAC9O/bMvPocDJ/mLEmKcfB9CV+ra/oLTAiBT1m2UF/LxUv94s06jRYCp42nhux8vzK8EmzkwgWREChVrMuDi7T8ZznuhufuZo7yLZqgM/1oEDeIGMMSpT7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUBXfVdN; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUBXfVdN"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5793815eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692824; x=1782297624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=YUBXfVdNjCNzSVHfNDT3P3EFlIlnhVV/AMLpCT2DWSwO1SOG/bK011G/w0PB9ejCdD
         LXucO+yn9oZr4CIRxFP2Liw8rry+Q+DbgKnv000/H/tJ4jX48GlphYEmShEoAF0nCbhH
         1gDikWPZ5MkopotCAs0krveNF+YvX6JPwRZ/d9v0nFSAyiUEA9IAj+73L07landOD/NG
         YqMNjTudDnRYuN6xKBWzNovAJVCmuU4StzGFDmkUlMH74NdI/yjm4v63ATbI2xeaGkpE
         NsokvC0rJkDsP7Mwf6GwWPAU4GSqVK24eBpY43Gl5EBSRo2xWHdIrZXm+l7BQjT3s6dZ
         tsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692824; x=1782297624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=PL+jDHH36bf+TodxG1tqOEFmnuOGkgi0TkwUEiULd2oWP0JaIdKAV6YpNw2EPXbCMR
         Rc076xtOJrbFmOPvBx9AGHw6J6dqHsbz8bkdWEh6ifRudLPK+Nnoivi26DiEFSOL4FY0
         ZVjsu6Jyv50F3Hir3aPtKvFYrzyLpi8x2dGdcsu+oHA81LXL1rMv1Do/uKqzhp6QYTT5
         /QsDPJqXLv4ZwyXhzrdYRqvUS6RvOyMGP2ZGpTlxOet00bCWpxgODG/RGoSAwbYPWaWo
         hJiy5aST2xZnUfJL9B2Ra3UHmmxeyA+AlOiuCSMDLoiX1qNgCV0ALMP/aBR6J2RuJQ34
         D4mw==
X-Forwarded-Encrypted: i=1; AFNElJ91rArCKbEyJlOEsZF0bxBq4m3euMaG5sT1qwBX8yQI8T7wDYWA/TlAq9sr2Huorju68gpBKSKv86SVWk2doFo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9NpmBcfOQjBhcWrr8y+haVskKNN/8deAM89SKS5Y8+L7cyZ2h
	zknsjNYrJ1+UKUm7TUMP/n5e99G2P93qbF7qN2O3oVSPoxv8f4YstfTM
X-Gm-Gg: AfdE7cklAj5kNQ5i0vfJvP7PtigrE5tC5sZmlrdISoiOKEUs+CQaAeWwUkWzay0O3kR
	oDQUOipTOtOmoEHTZpCTQz0sHvOfJhwE7YkhTxJO6Tp2k81JT3MOBPeL4a9pi/CWlDdDNUGoOK+
	cz8pxy/YZhiiQ6u+s9sleh3CZwnyf0UhhDyNF+AvfKvmrMOc2DZIWW/FAx/Xh7o6Ip/v5ngBpsa
	5yp9EIDz7b5zZnnEc7Zppp1DYxec0/+Ke6iqZbaedSR+M7W2Xis14v0HXbLk/3/CNZhzIK4AY8c
	AqPP9vsu8exHOKX0v8zLqdCYBzirBJ0jpgG0oXxxmyiAZIicKl1peDqn+hHqJ0B/GuIsJVTjwQg
	wcwO0fiQ4e5GmFVC4PWAweUVUi2M6v5IUjTtqixZVrJv9Mg7aTl8xSlRDx2t4Syt70hjc18xHoP
	sxnsgiPCuvm9sBc0xpDl8qZbIEe2XvpW9QE+khC/w0B2sTRKk40W/k1e3Cqg==
X-Received: by 2002:a05:7301:6583:b0:304:e59a:e3d1 with SMTP id 5a478bee46e88-30bca0e2049mr1526809eec.24.1781692823559;
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
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
Subject: [PATCH 47/78] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:04 +0700
Message-ID: <20260617103235.449609-48-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt700-sdw.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 30fcca210f05..8b15bbc31ac3 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -416,12 +416,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -502,11 +501,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0

