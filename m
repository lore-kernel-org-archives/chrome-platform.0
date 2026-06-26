Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B931E3D47CE
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454577; cv=none; b=tkOgnKUx5MlmEnfODgJ64i1xuUGw/nOfA72jJ/ZKEhqgu3bBkifLlvhNmZP0xhfb4sFJ4Iqt8N/ht80XpjNMk32ebRBT4O2MU6b2dgKqdpQdlZ33o2TOk3lxBGyLl1hCA0uRF9xuYwfxNqNME4tapcGRn089+62H4uAaTkWFWYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454577; c=relaxed/simple;
	bh=qdA4B3AKe8bxpcbruMbAhMcQrORASeDOpn/sYn+G5uM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpFOZbxK5dO2MFsh/HuWhG92gWLVs2H4BOwqENeztABgnVA0r82Li4G9D5QMYcxumlJVSPcUnrdbfIIhYqRctE1HRUEe6j94SZKYVBU6hRU4Bf/OQ2lXg5iZB8OYNfewaQQaubZvZJdFou9SduGKDUfMyOBpNwEX51BjjK+m434=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWipdQAz; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWipdQAz"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37d70036426so282568a91.3
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454576; x=1783059376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbPQ5ClieacCrQpT+0BcEXWXh5nAuhJ3UgaZWwx688k=;
        b=lWipdQAzWN51CLbRWCi8MpgvR4Ur75dtrMlnHBu3iw1UZRBYvXTomKI/kcHpLQuxmN
         l8EzyO50dy9MnYhCKjxD7qaAUJAbeIDV9yhc5PdG7v5rYBpHuL2VEeMDLPCqfLDa53jY
         vvFPl1o0tlTT3lSq0RD6WV4Oh+uTxDCUI9T/5rL3iuJSWjFie0auS7gC6bZEaXX7VtEM
         ihpg56oXUK8Movj5EwbbkPXnhbPmU7r7HRje+jmZH7W33dpRReTvJdHmuNCsm7vT/AGb
         xf8154Fw90mEnXY3nlUKAezrjP4R3VUXlcv/sHQA/1gBi9iXVf0jE/YVAJXAadKoB7at
         P2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454576; x=1783059376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AbPQ5ClieacCrQpT+0BcEXWXh5nAuhJ3UgaZWwx688k=;
        b=lqyb+5NKXuQ1oijmwBsNoscS2ZvlawJE8heQmmUP2ucOnw9mB2/oYycdFii5sQUQjW
         1LuZXWOKaMxuCl0JqNypwWg3r5JRMvsuSK83bx7RQW+MFcnTbRuGaSlRB84zK7I+B8fQ
         msGhAcndgHNwcue1i2c0eexDRHJua5auAmSGVyj3ylGArW5k+8wD2EhjIKZORR8f4Dne
         dWkBn8v7nLGhDfqsSP8ddyuR3be+Zjls4A6boMVIR/qaAl4I39RTkdh69IRkNWzkNCGL
         EEuDGw0H5Vddx5ZtbeWqGQRjDAJ4G7LtP7x61zOMbI27as+RNr15Kv9GyeCr0raDxV6d
         4Xmw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+PHDUYTgL0899ExB6VnTxhevRPMYuB/nh1QGD0TIrgij2WuvTOelmX+FQhnAvEEfO0LVvAGDOo1eWUlQ6rPg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjaJ2yVimw2SjNpIJXQ7W1dTa4SwrxA1qWMSjSZtlxMI3tFG2B
	c+3gvLkvf/E+7CfdOW4wEucYrJ3BEBHQtg4/GJeerxuY6tUf/uhvkcIK
X-Gm-Gg: AfdE7cmH5v5yEag52+seCif+0yX3mtxxEcJY/vp+l4WGNJAqjzpKmDbFbiVLjdcqCFi
	39LAO2YZIbaxaCn4y8vwhW+uToaKaRvJfqWGyjffQR1uREnBKuOTpS0nag2Mt+u4Lp7MVqiVB2+
	uc8MNpJkYX6LsJ02SpvV893xxYSLgFuAmucVHoRkB2cKH7Ydg494UApIV2jV46CBaPuO6EC9ta1
	xkEeij9/lDklUpIbdAQKO/9FGq6FHRfBd+GOpRW4nRNPea5eCWF1YSD0jPysxKRw1cRYf/g5hWq
	dwKmSlSG8ZWqSn9kLJ0xV2pmVvzAA5/ZK6HwtFeA1ybNIt/xN0wE9UTqZcbo8Sh3aa47Jl0Z3AZ
	/1APdzrBsI2rrmGLLz5ruWehf/HOevxj4miC5TuWgnYLGhddgrho60eHbGVSmu70T8JkrFj+ac2
	UgyNBu0KBh/co2s33Gd38YRlRHxzPzmIjikN1NlQENGUcMIhs=
X-Received: by 2002:a17:90b:5843:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-37dfa1ce3ebmr5512195a91.9.1782454576103;
        Thu, 25 Jun 2026 23:16:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:26 +0700
Message-ID: <20260626061329.23264-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l90.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..6ce603bfd500 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2423,9 +2424,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2456,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
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

