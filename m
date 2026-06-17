Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523D23E8C74
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692851; cv=none; b=R7eDDcON3DkrYctmTVclCComvHxR8VTlehmTZ+e993s5tpPzWRnVcUwrMYJvdzj2RaPVx3G84QR8CMTJDpBZ0Fb0V/ln/UO/tcNkDCrwcZSkjJIhrFo5nTkdIbu5TNDnUTpEJFz9PRmmmKeKTw+cpdswzHFyHfcGFLW6HygnvM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692851; c=relaxed/simple;
	bh=LbnglVcFXXDZoUarsc01FNHGS9yskzxEqsNznHtbNZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSk1r3jErFSOUPakU0FQTpvgYXCLGN2H2MLY/mKGGvvRqHIYRMxizz3IIYE7rIYFMyzxJzeKXVK6Qixnm6XPCtWBvSBCIF3lklBscnLIjoiofpVOBCTOp5mQvMbYP5e7mUsTZRgh6DI0K1KgFTAJyfUmNaHGdxnU8hhlcXCL5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYKmtyGv; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYKmtyGv"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304d8362a58so604408eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692848; x=1782297648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWpi+WrLr0HzmCcxgPyTE3MUTCsBXdlrFvgGYBNgrFE=;
        b=jYKmtyGvM/fDYAJjpFEpV6surUUury4bTKUdNTGb1DXcH6428UUKztOYVVY0aV8w8e
         NYiL6/v10vNicPQRrJwK9omuf/05NfEo20MWnkf2Ma8MHY19lGCGki6EIPU0aKG+k78b
         jbCdkFA2pQMjWWvXzka7fcPBuwkVeisYCxVV62jd/QE/HFAHxKUW3DkJA48xnRauEuPZ
         jz0W7Jpr0Mbdg6wFIOEJ1dzZFnNCrC0g4WdcQMhEVeAKE7yuRbdLGCgkIyUVe2r6rfQY
         OITaDksMR1FuRtsmx6ybb8bo6SClQC/LqBMHG8PCgmRecmHOlPuowH/KYxdWZ5pPqJ22
         biHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692848; x=1782297648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eWpi+WrLr0HzmCcxgPyTE3MUTCsBXdlrFvgGYBNgrFE=;
        b=kBgjP8/NDCZiFNEnUL+e3IlORLl2/aWWY9wE7TQvErQCfhSnq8PISAtns8bSUb4gQa
         FouGBVIBaa5LXQN34VRJK1wmDfq1/UCPsDBX2nfULqrLQWOVlRHzdYftvO+spwr/IpA4
         bs72XqF1HEAXJLXfPusbDgEob7bTiLyROVIVpQQwFrEJRyWI7J0u6iJE4DEPzdCIp3JR
         8NTUZR+QwXrhoPjd2BdKlkg9q3NpS9NJ5rRoJpWtPCZas8elcGayRZzWfHkwCgqy88OF
         x6DQYxmUDRNwMRtQsBNIDwgQCq+YySvpxorsPeaAYfvUAuAG+EDIsRryhDwmAHbPphhp
         kePA==
X-Forwarded-Encrypted: i=1; AFNElJ+6YAJjpz5Q677KuBQ1XwdiKSJe5aEbHdjrIjYmaMHynu+A1MHJcsbew1L4kKnO+5C7W3K//x1asL+Snyksego=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7KJcePuN7XbF4vFTOtLkot4hHs/pC+JlvM24wMjfqZB1M3JH6
	FEh8J++Dh3ZeVn4iBbh4J9uQ4ImA5XZxd2TCPAKQ8bJLJAVmDA+4UAdY
X-Gm-Gg: AfdE7ckKNoyh7YKxZeOLD1fhLjfMk+yVwY+ksi3liUVtjGxcbreN0K4rpGRF7XPT19c
	3SBmJItuGQFvZ/DiinMHYphFUg4UtBCs+5mkWT+DsR6U/A3CnscrxrXhlaNX8HEQ1+k+fZ9WmmE
	PrSCzmLxtRDDWesjAsy3Vtpg3uv1K9zJbTIdDtpH07GRO5qa1nChOsGcJ1jsdJBhmY1VWjhOPK+
	cMhQX9DobHBPJzcRn73qy43oxPsT6qerJTdbg1+pHTh81zs1Og4U+0x/mPSosJIrHo8iWLohRex
	6pSmIQ170hWdMupt/x8ZEh/QJYaP0F5WSAB+ovq6DbSMjjoQI7htSHLPJi0jO7ahzouolWHRF9u
	ec8cXtOyDiEtuQome0OxGnAGtkqE24P5ptmH89G79HaU2iBbnGV9fxsN9/3HHNWPj3NdL1DRT8O
	w4j26MRkjVTeAZ3D+pt3iE4QlFtCDJugiIRjFZlkiyy350QZA=
X-Received: by 2002:a05:7300:ea06:b0:30b:7bc2:c70b with SMTP id 5a478bee46e88-30bcf0900aemr927511eec.9.1781692848447;
        Wed, 17 Jun 2026 03:40:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:48 -0700 (PDT)
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
Subject: [PATCH 50/78] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:07 +0700
Message-ID: <20260617103235.449609-51-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt721-sdca-sdw.c | 33 +++++++++++++++----------------
 sound/soc/codecs/rt721-sdca.c     |  3 +--
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 58606209316a..0ee78b28a3ce 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -315,7 +315,7 @@ static int rt721_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt721->disable_irq_lock);
+	guard(mutex)(&rt721->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt721->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -382,12 +382,9 @@ static int rt721_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt721->jack_detect_work, msecs_to_jiffies(280));
 
-	mutex_unlock(&rt721->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt721->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -467,13 +464,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt721_sdca->disable_irq_lock);
-	rt721_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt721_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt721_sdca->disable_irq_lock) {
+		rt721_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -495,13 +492,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt721->disable_irq_lock);
-		if (rt721->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt721->disable_irq = false;
+		scoped_guard(mutex, &rt721->disable_irq_lock) {
+			if (rt721->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt721->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt721->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 35960c225224..157269ba2723 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -289,7 +289,7 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 {
-	mutex_lock(&rt721->calibrate_mutex);
+	guard(mutex)(&rt721->calibrate_mutex);
 	if (rt721->hs_jack) {
 		sdw_write_no_pm(rt721->slave, SDW_SCP_SDCA_INTMASK1,
 			SDW_SCP_SDCA_INTMASK_SDCA_0);
@@ -309,7 +309,6 @@ static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 		rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_GE_REL_CTRL1, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt721->calibrate_mutex);
 }
 
 static int rt721_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

