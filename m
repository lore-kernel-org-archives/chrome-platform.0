Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77613FB07A
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692581; cv=none; b=qcWvEVtzIc29e81WhWGvKW2N54vIS3lwx75PbsxQtpEAd5IRCkGoXppcuWOPGx8sS55kvOlm7foX7r5+0ecTqZnN5vIgQhqmvyUsoJ7K1RcfsOtGI+443EDRkV1Gd7oXoVXcoXRi0a8vu50crKYGocSKpUT5Yn9LnzO4jpTTKe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692581; c=relaxed/simple;
	bh=y8ow6yxkPBd9p6g+ra0bZiCZf15W/mXoZiP9ucube1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJQ1n63YjlBQ27h73uMQpv1tLgpTn8J9Ra5BFgw/UNc/zjqpnuw3ydXXUKeycgRYoab2/ooH5Pq2U7Tuf9qbCzhZ+s7+VxbRux5ckz7k+QvVwkWK5VnVaWIsXcdIr2cqT+9COrRB0/cH29GNvsbZBQzct4Df1rHcmIiyr3iE2Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoBJg5Cu; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoBJg5Cu"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304d8362a58so601778eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692574; x=1782297374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=ZoBJg5Cujg+Zub4oKc/SJWw8dHLELXqY9qylX+0rREMlglyjS1G7D53U62BLsczlx9
         ojcsoAni4arVNx8+4jjGWn7fH0YCVKjUX8k8I6h31pw5B1NnE+2tDvTSswfm2GbLqYMo
         tZWvDdXhxlqtOzJAw4zFM56+ZO2IFJrrpiSVuVxpnZ62AZ2sP8EJWAPIdw8gYphKNWOV
         nc4IY9KbAyvTT1kVfb6CBEkY5bOBCsWT3GVbEG9GfuMWpEO4wtKHTXwNqaoZsnopseMq
         9miCIK8VtxfJT+HEFgwohjFRY3+X7TULhm2ktbeAEKGF/qWvRlwSQp5Nbr/duiTbulW/
         OcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692574; x=1782297374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VnmSujrFqWboTKWLL+/g0m67QqjzB6NJpQ6VirC6qJo=;
        b=WiEGvSBOfAH4f+MIKhCbcllE97F/v1DgFNXZezJJDWlgnJENFskMAHibJ+ck4iQG3j
         +O6tTFfWHuVyOJ7heckoi7lOuYD+GuW/IvINKffDDJrWf7qo5wQe0XmByxg/c2P4Szmb
         UypbFjFURpohkfF0tjKXv1PMiiin2U8BCORgWGfnPkEuFT4ODvpl879j20NehSHY3iBt
         r+44dUCqEsv5RnX+h9yspER/YrQmTDfIBwyw+HUWPw0O7Kvou1CNHZDpPSCOajfr28mt
         AFgipGOhaEtdtV8meaM8RMyipcm+T7KxTxGPBzrjrZAqN/Hl8JR2vlpb0K0UZF3lk5Gb
         l6Kw==
X-Forwarded-Encrypted: i=1; AFNElJ8OoGGnIVNB9jSlBIcCQyO4KRP2rR9MNWnAs0/ypm8JLWXrfUAuatDPWLB+mDkJ4mpBCbaXzm8w8wu5FlO7kBM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuMKD3CjcRAJPA/wzw34pabMOwKQDEU+UJccRCVzuLyiQsB6/f
	fRR8zjX1uGqgNKwE++ouc6GZisOR4mfYzSoBFLT35Ll00Pd4i+Xl32t0
X-Gm-Gg: AfdE7ckAe7iGhS2YSLSwu267dP6U2whGc/CLqNvnYLBERykUBgeH/ftGBSw6pWQ3pKt
	g6Wl9tlh4dtwwT8eVVQo94/Z1JGixBkWSqh8RJBAmqQWynrBIJRjFeZYPXc/19uGqq6A6DnhAsw
	MnQplvRJctRe4QJ4/9/FILFzFsEBHxTXZP/A6e28xocGQ02BXSrTSW0j3GdbsQ1ZQ/NkGN7La8h
	bOOixbBR95K+82gji0tsae8kj2pXPXxvXPXzlcIKg1uPJBMUSKapoRJRsgTD/wP/emrWhjo3zws
	g0MdNQELzPTcpZL89l+qPecWO/T4so5ar1KvQMXhUwEHvbwdAsB5tZ+RuyjFKaatCTe/XafQnqj
	lTCMVfS9mntx7cRztuM46TMinuW3cKFVfZCE+CoTa0tbEsxtdut5iFnlazyBYH5JarlHhMIpCHt
	RmJ7Z40OKJkICKAbMzAfxtkgTOutdML68Awd07wccrtXPERSI=
X-Received: by 2002:a05:7301:7308:b0:30b:e524:77aa with SMTP id 5a478bee46e88-30be5247ae7mr89541eec.14.1781692574470;
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:14 -0700 (PDT)
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
Subject: [PATCH 21/78] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:38 +0700
Message-ID: <20260617103235.449609-22-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l90.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..978149245079 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2423,9 +2423,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2455,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0

