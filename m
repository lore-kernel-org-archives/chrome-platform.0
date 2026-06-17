Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5AE3B7750
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692487; cv=none; b=BEf3UzPcP6OQnOOmMsgfthudN0MmSuu5mea9zHevtQnWY9NiOGK8W13FehOknxGuq8d7Abr31Et5LEyDiWw2o3fbc1FsXIF/Etlg/0GNq9OIWb//8n6WFgLbCFFFaYHUeOJ5CyEZmBtXYhEa2XMkPFPkYYqWOW06LC4ixuXtb10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692487; c=relaxed/simple;
	bh=uNHjTev2hmfXRNq+0ljawWlrrdZPdtmV526ovzJ70zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=En8N6TmMM00sF0/v2JE+18+gQfBohsyzbayJhCTsPQJxQsATPQqszoKQ8nypXwg4kntPc+7FE2PYSkyzBSzVFPB4Cw39ph1Nu9D7Ob3ShvTgFdSRYElnB9JjJliNDHvZD5pL1FrT4A4nrA9kt2cPSaMZBgPf6BMYKtXGFRlyw/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpYjANLz; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpYjANLz"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5789830eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692482; x=1782297282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=;
        b=jpYjANLzWmZizWIKqPMErCYRNNDHpE7h6ispFk99ddnaLJWrLRHafZU/bIIjfJUcvV
         Ay7yAgwSmF6MxB8MOpk7iaQSMrBVSVfA/h5sopdW3f5eyhziBUHDYygoKrC8bEF7y31P
         HvM7QsqghFliu2VbOeoTmbzOcq9VKy87B/bDFd3wiyun6bJu+rPxADE6drLYJFFWZSGm
         /V+j+KDIeH4vqPzfzjUm1TKjknXJU+y7RuXtg1mMfo17XKpO39DB8A4WTYZQqPzwxCiA
         B+RawK797/Ob/HFU6sOxSdXJXMt32LUwxKQn9DNWamVEM2cH6ZPLfESZM5NP9V695nwB
         EZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692482; x=1782297282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=;
        b=XJ5MJGea/e3Jm/jwnArHpeLrPBfT2A91yzmJ37jXMV88eyE3JD/mslKwD8ePhNQ+Bg
         e8x56MjSReGTTFCCnFbcVscsldf3DKcuYk1ME7nEVjT2ekibi6hhqlmQ0Sd8ktEV1bzh
         z/snXE+80KQ0YcaUowD3uURWG3GiHVTGZ9AC4RSCRJEbZRzdX3mJLzuon0ZAFaKGFpTT
         0yz1wLKbaB2YMtSjDUpqTExOJ2DSnM6GuLiIFZ/n2S4m+Q87MmjpvH6U/aON2WWXe6Li
         VHHnD0/R5hrjtLKFXFB9hIaSeSDMQG/ZKHY2ofTlrhmJmtC42eMtUMpLZ6GOb+VrWgE2
         3ZMw==
X-Forwarded-Encrypted: i=1; AFNElJ9bWjDMmmpe7qFhYOqTM3eIIp1asBU4nS6xoHdZOhVE6x0FG7pEetD9xn3MXaZqbpv0zViy/i9goBQ7HsOSnDU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwA+cZkZBao1CLsVcT8IUZD0s/t5/GVkoWCA7DHGwMt36mwj52g
	s8jqE1i83WX8U+L79VRXw1ftR8Ud325keJgnWiHRrvd+MM1Q/90kAFA7
X-Gm-Gg: AfdE7cmVar5/3nx9bcDKyesmRvWyP6qrMmR/5mJmFI/GpHUm/927p6ITjfeVMiVExDQ
	X1g+k0kubg7PWN6PldP/4Ga/ADdPTG8smijdAih3TYciT+jyzsk8Dbww5/+OFF3kcEEcmEt+oMY
	4DorH1ENBFae13WfozF3U/3tR6gbCQ1gRvCZdXurugLZtXsjRGikId8TTNeqt5dvdOFQ1xhF2JV
	qTp4DZQr3UnBDuGoOixV8e2iHYJGt/YBiV6aLMtRPSruIeTCwJfoAZUS71gSjPrKK5GkUfLO2hJ
	vzijcCW4eKeeevOPSYyVZxjcoIJOP3E3k0Zyw/N3sSpTXfN1qkQYe7zPV9VuuxN45v5n7qiH2Us
	wS9e9qev33QqlxWEMHt+jB7EYfAv37M9wOOg6l1c5XLbGmtI2JM0ryxdS7wYnlOPEeYgJX2UcMj
	Pft28OchN0Sg6JaVvv0ro50gdF3SUj3HLXLSACg+DsaCrxRKw=
X-Received: by 2002:a05:7300:6d15:b0:2ed:b131:240e with SMTP id 5a478bee46e88-30bca0dabccmr1625180eec.23.1781692481713;
        Wed, 17 Jun 2026 03:34:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:41 -0700 (PDT)
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
Subject: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:28 +0700
Message-ID: <20260617103235.449609-12-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cros_ec_codec.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 7dc5a7c3ca96..c522bacf06de 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -608,10 +608,10 @@ static void wov_copy_work(struct work_struct *w)
 		container_of(w, struct cros_ec_codec_priv, wov_copy_work.work);
 	int ret;
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	if (!priv->wov_substream) {
 		dev_warn(priv->dev, "no pcm substream\n");
-		goto leave;
+		return;
 	}
 
 	if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_AUDIO_SHM))
@@ -624,8 +624,6 @@ static void wov_copy_work(struct work_struct *w)
 				      msecs_to_jiffies(10));
 	else if (ret)
 		dev_err(priv->dev, "failed to read audio data\n");
-leave:
-	mutex_unlock(&priv->wov_dma_lock);
 }
 
 static int wov_enable_get(struct snd_kcontrol *kcontrol,
@@ -895,12 +893,11 @@ static int wov_pcm_hw_params(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	priv->wov_substream = substream;
 	priv->wov_rp = priv->wov_wp = 0;
 	priv->wov_dma_offset = 0;
 	priv->wov_burst_read = true;
-	mutex_unlock(&priv->wov_dma_lock);
 
 	return 0;
 }
@@ -911,10 +908,10 @@ static int wov_pcm_hw_free(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
-	wov_queue_dequeue(priv, wov_queue_size(priv));
-	priv->wov_substream = NULL;
-	mutex_unlock(&priv->wov_dma_lock);
+	scoped_guard(mutex, &priv->wov_dma_lock) {
+		wov_queue_dequeue(priv, wov_queue_size(priv));
+		priv->wov_substream = NULL;
+	}
 
 	cancel_delayed_work_sync(&priv->wov_copy_work);
 
-- 
2.43.0

