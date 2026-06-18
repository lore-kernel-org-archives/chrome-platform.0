Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4898A3EFFDE
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781014; cv=none; b=ol0BpUo7kdxaOPj2PKZ06ACVJndkb0aqe49x7eFeNCESnIAbBZpBBpyuytWWUNkux4FfqV7EvuT9/RHXDlXi43rDCRG2Zsn5JT9xsDp7AVSliC314NxRIWm1mrOB1nTcb7Czb1RUV+GcpThMCFgSqdp/OPMyA3WGgyWQbA4pQY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781014; c=relaxed/simple;
	bh=r7r9e6ypW8qX24PwRXoC+9CWtRWiGGy/uP12p3KkF1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K13IHjcKfvSSK9cwO5jR8RpdgODSWanuwloE0upgIKIxAZL5kLSdkWwHSy0oIHvsAzERMSOmr7+6965jKGbpyvJWyj9NFtIFXj8UqiKbrzelVlxLE2pxgGyKvMkOzh/6fLoKHEH/eaRVw8uW61RoekbFyyqYXwzlMEAYjrS7MSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn0mKlxw; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn0mKlxw"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c859878eb48so338324a12.0
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781012; x=1782385812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9U2r5uO0a4sNNWl3fg9q20Rk8WeevWmhUpMadyTlIYY=;
        b=Xn0mKlxwj2RYEq/HNkTkkPiGbhlS9B5B6Sjqkr988aURHyZXCtdvIutipEvpkhXiOb
         cT2208zwfvIt/UE2YARCb+wgdwZ84OovArAQfts5bDw9kS0/IFY3UoYPduXztYlpDjef
         b8uc3NIKTZsjFdtEyBsTJg92P1sg9RCkvRgT0O6b71EucXi++TkOWnJ5wcwUKOp16Bgp
         koZ92lxXbjime1e4tbfcpQrYxVLEech7nqm+G4FQucEXCgYLJTmc/TqN/xqkbMgVZ3mH
         YMXf1TZeCrsF1+PjOUj6lq5NFqtDBoYKK+uKgC43I+zRWz1UGRrkoZIvQqP0RHM5ejns
         dseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781012; x=1782385812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9U2r5uO0a4sNNWl3fg9q20Rk8WeevWmhUpMadyTlIYY=;
        b=pEE3d5KAVjkpsBNOZUip2bEbIMN84Mr2MW0l3wS8cyQMzoPELA4yHfBWIR1dBy2z9b
         FKriYD7mb8OhJw3MqvXJlMg8YwwaqzGR5TsJAYJykUR98x1S0byv729+6/4QRDvS1qo3
         crAoZFXwIL0WL5VVI56yQLvNWV8YPfvF245XFl7JgnW0ed4y2Dfn0AeJzMjFfBJsLZE8
         1zqGqLN3RzPVuKKiQam7QGojvEXP87UJUnh2XE0+revPK5y+ev0hwD4h/bef3SEMz/TK
         wqaTfABQOd+cC24K1huw8ubgQloQ9eJZ3NlHLaKUKGqjrt/WJWn0abYk/QDUuQaaPFIg
         kFKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9w5fVKfxaqgacuPzEu1bp94HdSPZmOAdjnzECxeDrjeaVtIJm1jmqyPxWmFyY0a2xlYUYaEsJNMYfv8EwotrQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhdqSb+vvAU2w0Kl7JkG7BmRv0oYRtSEjs5FtySfIOrzrigMpb
	vtG5XiLSpk5K+mXF2QFoQSk5k5x2x6KSFFWVE88CXeQhuuNH46Ry4ZEc
X-Gm-Gg: AfdE7cnJ669yQOyPNgavUcxQDlHRVr3ZHzIY1XZVLuWBhn0LL7CVfn3FLOPWtw//DGi
	055hsGDtlaF3JPweGONVyfH7lrPWCtSaHQ7CLneNEJb2KhFFeRA0Sn4LibJ/O4pvoA+vVx6NMRE
	AhZvGXXkt2Hkn5fqXdy8LMGSUtSm+vR5AuCIMXJMC+pFoOXuz4lgldHcDtxkJBYz8pPagJ/apvu
	h4xKAwPvvZtbjza5VBZclwAYhiXrjf1AOpTOEdglVkgP3wZoiH8NA6SCovfGvXVOed+947h+VKU
	ZGo+G5quehfPP5IvhSRNjAAwAm+peWeQSkPrJ08Wmmf9nvj31m3+La8iDs4QKmVMF9JsIHxgDhS
	Nc+RR7LiawtD4dIPEI5tPuh20bt5C8x6Z/r5RELW0XRPb+7jWPCY8Nxk1vc8FXoxLiq0WSNHXtv
	aYcBw5UqZziCgcgdhaNH7rMa5djv3fep8Ia4fzUAXNNGNg/zc=
X-Received: by 2002:a17:902:ec82:b0:2c0:b5c1:8e3e with SMTP id d9443c01a7336-2c6e472d580mr33156445ad.8.1781781011500;
        Thu, 18 Jun 2026 04:10:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:11 -0700 (PDT)
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
Subject: [PATCH 66/78] ASoC: codecs: wcd938x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:15 +0700
Message-ID: <20260618110827.232983-10-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd938x.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index c69e18667a85..9eef1ecec352 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1976,7 +1976,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd938x_priv *wcd938x =  snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1994,7 +1994,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd938x->micb_lock);
+	guard(mutex)(&wcd938x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2009,15 +2009,11 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD938X_MICB_VOUT_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD938X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2038,9 +2034,8 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd938x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

