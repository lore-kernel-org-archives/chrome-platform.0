Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50CF3976BC
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692860; cv=none; b=nKK45SMDbuoGVaeMXpcki5bxSfCs8c+hY4j1O4BC6uSYWFwIEvS95Q02BExwlehMWcrOCeAENUHAph9tVrAmi0hMrm+u/mSihsaNxkMqb6ihrphgPDg6cjpYvWyOEoy1BMJgN25yx3nzLYlTcQ5fY5uoZ+oOHfUQVlbPH46ewq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692860; c=relaxed/simple;
	bh=QkG7uMhxFhIgdfzJMdnxdGkaLUEDO6tHpYig6hGOA/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlQJw5sLmSjHF+PQOOYzw3r6Gu4oj11oRtY/ZhFySF7CweFieTyBHnX2MTYusc6OOttQtiDyRN+pnyedWfWb0i5Jvr9TJwO15RVAyP80iAP3fVVwQljrczhiw1Ran1ccBZ6XmUdD3yQe9qrVtPI3Z4aWPQaQHABk/I24dwUbPxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHHw5d32; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHHw5d32"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so2732220eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692857; x=1782297657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxB3SnelSJeC61Cb2O2sZ2DxgfCvfhJf77FHm8odZMc=;
        b=WHHw5d32HlHRbj2+F7NmJmNhnMhnZxxBQptuY9gOIE/VSNyonE2Aiz+CjnawMEcng8
         vU/EMKHz9W0jNdhWLGDC+Wr7R7AP5ezpnLE0lxrQgPwnvEZYna3sMkfcNvZxQSnl0nME
         dSoI19ON2/qRmFEGgi/8aP+TsrVQo8nGAYh/UyjN3bZP4rxxBrxpQZF0ij2AtYtfevQ6
         wQ2LEfjo1XoL+eA66NOs8ceTomEC/RmXkGtR2mtPHxm9c1GxyGLmDm7CTi117YawBo1Q
         PeBx+BvZbE5XFkhMMvgU2m2LbxSNxX18Qm/kKkd8sifHNL6dl3utDdlueKIsvWD9VLiY
         fOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692857; x=1782297657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kxB3SnelSJeC61Cb2O2sZ2DxgfCvfhJf77FHm8odZMc=;
        b=O5cbfODfrvBLuf69VVJhkCN0SoHQxsJRgeG8Px3tDIm3RIvk/kejeh0kPDPAccBbyI
         W/ebIGKR/KPV6iTuHXg78800G8UHiAXAOtuZxXNzBe7nZWz+C8B8xIu+ucMWBCAUmjCy
         WXj1XZXwzb6pGApE++wglmZ+ssAtsD1enrvPR8Rzey1yGfPrVIrOXAPq9Nx0NNmimcZ7
         LiFkeiG41KROioms6y5quKaPPNotXUYUmlKhXm3DdNVtc+ETzEU3Yz4Wj2mLVy0Z2B/n
         /PwtxZ++J2Y4POgbjjqiWq00zBiCvo/lWwX1Lr9FxHSeaSbyo+ybeHe8vQvFzU+w0suh
         A/3w==
X-Forwarded-Encrypted: i=1; AFNElJ+QoQYRCPaeos00n4blmZXGWLdR4muqrJNuHQS6wZZmp+bBDZdoqKy1m9IDuajykMqwLZFLMnmOjUdSATAtDDQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw389nVWquihJ6eK081MQndAX0E482KuNrqCiwfgHL9ov9BJp0p
	bqz25E6vf83xcRGwR0UNqlPCDpQb0bg9NEXxsdBYEFy0MyHvemmZht0h
X-Gm-Gg: AfdE7cmVDf6fay0yHVwNEdqsZBzicngDvBskPxN9lNw76RY6RRVXLL24S9IlsywrfV2
	BSbIlWFe4S/JHb9JWqV/NJdy5HRZPDqNArGbtc+fEE0TJ2VF5F6Ipiubf9npm5+kbnHSXUDKi+m
	8Z0AQCXVBp9AJ9LXQY5aUF/32ZbtFATxW3kLrMQ6aSHm94QrcCxfHqRhMX2mlMxc9J6PsPXarob
	CZD5yyrCIZSBiL0aFtNjfKrnIfwSrDvo+s+86QsLKuJ2TfsvszcngG0xFOsMcDWB+M4cbFzMsnY
	Z0sZtL01arNotglK0GDo+bKpNXopfLfRPcf61zwysa/kOhduj5vXTlX/7HMjeoCF8X2OniU30xt
	6I5E93ypbYROyyvy01a+03wRp6pbGTMkpnid9RwBmPRj0KIVks9O/XDcEdUKEwmwVZGcIO1d5f0
	5bt3HPKa275rUmnB00zhGRNuCm1mL2YxiCXWXM7v1DA7NsrOI=
X-Received: by 2002:a05:7301:10c5:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-30bc9cad496mr1423566eec.3.1781692856764;
        Wed, 17 Jun 2026 03:40:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:56 -0700 (PDT)
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
Subject: [PATCH 51/78] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:08 +0700
Message-ID: <20260617103235.449609-52-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt722-sdca-sdw.c | 33 +++++++++++++++----------------
 sound/soc/codecs/rt722-sdca.c     |  3 +--
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 0f76492ff915..ca5a4ee6ce9e 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -368,7 +368,7 @@ static int rt722_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt722->disable_irq_lock);
+	guard(mutex)(&rt722->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt722->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -432,12 +432,9 @@ static int rt722_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt722->jack_detect_work, msecs_to_jiffies(280));
 
-	mutex_unlock(&rt722->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt722->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -514,13 +511,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt722_sdca->disable_irq_lock);
-	rt722_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt722_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt722_sdca->disable_irq_lock) {
+		rt722_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -542,13 +539,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt722->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt722->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1b6729f363fc..5fb5dc2ee3b4 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -294,7 +294,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +317,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

