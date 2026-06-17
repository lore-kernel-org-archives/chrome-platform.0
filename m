Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C7F47799F
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692842; cv=none; b=rPlHVx4D0V8a3JA+s9AdCr8KPde5Wk+6MhZNhaPBuikx0B2s+ZwKwLhyALBT2xCMf4G9e7e4jJTTdeGycjg8F7rkANmDBD/6T3LIkDV2shKgk9Lum7Ux48ITMTBgXBmrNiEcmI7rUbS1RHUvBOR/LMFrkpBqnFM4RYJLTG/8WRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692842; c=relaxed/simple;
	bh=S6aLS5mgsSniYkFOaIn0mgYqQ7t9JX1w7TYL5UAjCLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IryDDUMlKwbDU3n1P9pN0MEHE39GKcAwi4Br6HSbuMF/TjUfcmWym+8iqzS9reDykvNm+NjDljt2G0J3PcMRXA8HW8rX5nWkwVGegu9r/SznQgZe6Ep+XzKL1fvGDmln6S3GYRD32p8ysbhnXU+hUbV+Y0RU7SU9/DXsrdbzd9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ncqd6pRy; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ncqd6pRy"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1384ebe7a10so1296049c88.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692840; x=1782297640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=;
        b=Ncqd6pRy1FsGtOpaoTf12COOfh+DLIDCyNlUCza4qg9ElB4sffucUYlSUhIX4B0E/i
         l+HUb9luUP6zsmdFKu7Qljb64YefQJUSvi7ux5UN1U4HhdilEpeloy32J/dUobCRIz3v
         esyxBqTNQLEE8gOuR3sRr0y9iM1oHBzSnhryHOT+UE2H7YkJmACr1FVvZCbAWHqNPo+X
         LyBJ5h+YpainumSRrAyS9E2rCz90tbJD9F57d3V6t1SDr6HgvAvgGeyLDuxGoBJc/ApN
         zClIgbODS1b9sQXVRS1olWuUlHPn7h+QgXP7imbb19XQv3SIxYzqww0ohpZkET63+iRz
         LZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692840; x=1782297640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=;
        b=iJtPtuagt23sfBBN4yO31cC9D67RorxeR0isMSNYQoB3VUZsMYUyv2zrOVPfPjh6CJ
         KSN2KE5XK4hsN0dYZsaeOfe+gWxxV7WuyxG5paS+m/EYtWCS19+4DCCT6i57Mz6OQzRI
         ftUaz84d7Vzx/ojo6Wnz3ojNHMDrb1Y0cmSJp4kmANVPsPoafbSUdR3on5w0nWz8gA/V
         WX7ODFvckUJ7zYKpoj0Y7Hc/DcgTwDTVt70CKZBrMmgSbE+YW16iZe+hZT9qrogCZ14t
         O4ReZppcELX1LNAJviN/t9X2SxdmGc7czGL5jj3rfbUhc4xENO9vVyLnW2WfAwlfl+NS
         841g==
X-Forwarded-Encrypted: i=1; AFNElJ/ZOrSjlIRN+/xaqeL+RUcNAkDrus8J4hNh+GaN42N3GljhPLBAWHAkvg7xwO16/r5GG7umIduAPVqCdXGqCbU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6Mk19muqzAf358rby6LgaIxrkSacLBgEqrTxHdSfernTs6QIm
	HyeKydiTM8CufKhsWgy7+jjdFkQaFdn42rjuT/6csn+nLIKFmI5VtG0UrbTm1Q==
X-Gm-Gg: AfdE7cnhQ4aGRab06HNjqiqt/R/4a+pRFBuYhZ84C7SBXd4kFS5r76sAGGU9dCGA7X0
	lG+cpDNqA9+FFJKBajsjinRrIE033tD29AfUXnBvBpG+ojWrhBzsvnuYEYHxoV5OiuaPPf5omD2
	XSis0mkiEjqY0gwdYwXteFwaWBy10Rcpgqm8APkU+Y6yVDakaaXUgcJFVyOnahRnaJP/swmhdE6
	gYS4oNWCWTd58y4jiF7NTtnTdbfpECLZzM8z3xr5X/nr9enc9//hKog//NDdz07iQbq0EmAnQNW
	tZFaJwBLir+VNWIw6dSdv12+Lo/oolrLEcDjrsC3iVyEZolb05Gw9d/OEC0Zex2A7PG5BPgGh2q
	jobNfskHGqe1aSmAjd3C9i0x10tOmDK4Yo9/GjIZxmsYyARjlWNEGPccR8OEgqeZYgR4ar3kz5W
	nrgnrHKc6mKDxobGINuh2K1B1zTEZto6pIW7Y9E1JwIGzvKRQVkvamwpRgcw==
X-Received: by 2002:a05:7300:a497:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-30bca0ed5a2mr1722160eec.29.1781692840150;
        Wed, 17 Jun 2026 03:40:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:39 -0700 (PDT)
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
Subject: [PATCH 49/78] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:06 +0700
Message-ID: <20260617103235.449609-50-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt712-sdca-sdw.c | 34 +++++++++++++++----------------
 sound/soc/codecs/rt712-sdca.c     |  7 ++-----
 2 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 581732180473..066d15399bd9 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -277,7 +277,7 @@ static int rt712_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt712->disable_irq_lock);
+	guard(mutex)(&rt712->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt712->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -341,12 +341,9 @@ static int rt712_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt712->jack_detect_work, msecs_to_jiffies(30));
 
-	mutex_unlock(&rt712->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt712->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -428,13 +425,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt712_sdca->disable_irq_lock);
-	rt712_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt712_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt712_sdca->disable_irq_lock) {
+		rt712_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -456,14 +453,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt712->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt712->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 4796fce084ff..5db478633f17 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -79,7 +79,7 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	/* Set HP-JD source from JD1 */
@@ -126,7 +126,6 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_DIGITAL_MISC_CTRL4, 0x0010);
 
-	mutex_unlock(&rt712->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -403,7 +402,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +449,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

