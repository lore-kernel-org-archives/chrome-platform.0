Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34F93D5656
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454573; cv=none; b=QobHo5F5NrJBUJ/CsHdL/eNCsgi62T69f8MYfOkriTj4GPa95nKpF5GhZxw7+9NQnTNpgsF/SdSSYLjq3nmxoVGL1hjnGlblSBTkLiAQykReWu4PAKY8IWHRa1RkgdIfHCJtX7mELBSdKXJotK8F07qWaGID/VHvDXE5sPHwlIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454573; c=relaxed/simple;
	bh=T2eO/iN+fiv9eyBvJ231A8TDz5E91d0v4s1m9L9u8+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAvUTM8QL65I9MsjmixCfCmi8oS/ZTm4xgHeRXtWFoxAXhlIl2Ng/MqZTUswGP8dDlJDzww0CF4PiITHhJsocEVA53AUHesU+rYOzqSs5/TLsIhFlxE26QRdbykEhqDSD24+N61aJwgVxw8QLmMHLwJy53ruJ0c/316id+RW4Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBsHIjxo; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBsHIjxo"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37deb2d3a82so397815a91.1
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454571; x=1783059371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSnRj0RszHC9jOxwXFHVU4Untaa2IiDeNEezb4oQ4FQ=;
        b=FBsHIjxo8PPC6sSs5Pa1coE+qMMVDHQpIo5ykpJh34+C6kdbhgcL3qlouGrpwhbKuc
         DyxH7TD11SIE/tM3U7DM8haPDCjI1lbJ79mUWKtI/T7KCnM3/YQDKKZGvbSyF1TBdr7b
         ZgErhOcHGZqG/HfsNnD9WXoHMgOEixbLiia6FsvLZBAt5FAlQd5hOYNp/JNB8XGpKEx/
         4uwyFI/5RhFSQuGy/ZdyVlhJQtXw3CONKWe+RD8OqKX+yhWshgbLfOY6zm60Kj0/48/p
         tC5HP8yrqhbEdaSf4jolieVyEA2rFyh/UfDLUMJKB7AYfA4j+oE5ZNQ+FK7oWdct1+TR
         BPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454571; x=1783059371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSnRj0RszHC9jOxwXFHVU4Untaa2IiDeNEezb4oQ4FQ=;
        b=Y9rVGagzHbMUVMwHmCtV6MIvBTyX9a4LdzPzTF7LwA8RCszVXH+6qVHsqgNj7BAuTI
         9IRLJynrbmmQoTQRoxolxcb2Uwq0N2yrt9zpPhMJZy/M0AoP7fhSHuhH6tlOyQrcFL6w
         XSqhsUMBuE/ZGE+3CCz8KD7ercy4FJ2AD54gdsnArN2/ok9L13357QtyW9kc37jkKcnb
         IUN8YPRK9v7QFrlCn1ZsIpBv8oc6M0RYW6andmyCcJ9AXTMLinALtYWGrkiv48QWDPwD
         gxyO+L3dVmF0ATPWRi0Kt+yIP06LtfLvVVSc7oBS158sXZnLYVHXn2mEcnH9Vbnee6Xr
         dxkw==
X-Forwarded-Encrypted: i=1; AHgh+RqGgH47U/giYBCNoPUZl+R2zBQqFcd7AMd+titSq/vHhKLQeT9fvGJuLyi84i4LN3r08fwHgaFyK2jjnesDOZk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkH5mkrcAu/1arAUCdBIh08+sjQ2ODt5HTe+Jq4EJV1h4YyzQN
	J3XlQTrTk2HyZK8DrZl9FCm3rQj9slt+m5HsKlJSyGAVta88mtPVYEZw
X-Gm-Gg: AfdE7cnA8oaq+bX3GGvM09tu392rYuYFHNuqPyfq0YtiuE1qidKk3i18QmvkrotjLWI
	dpD/mO31XeonhaRTdzciVf8H4qR8f5RZodO7Ycp/aIre02E4PfDWB7UioA5kv0wI2tunH7SO2Xt
	/LK/90BxbREY+1wOXr3L2YtBy6X2nM/AihdtTNPMag5Z/cWqZbFDIfTwqR8mHA1VYMQew8nW/oA
	BrM0OEO4G6ZcpOBGDrhk9k8MkICXWbUpoDbZn2HlNnfIBCThV4mOG09qXE3qMhERbGW/hqtwN7I
	9Z16zdoQl8czpmOxmXt0SI00/HrEja9bEqEqI0UYY19eNQdRGe/Rk1XUCNkdNBl5vldB7eGqbSZ
	qV0KA3tRLBxGmLthGbaNOJPmbOlgyTg7UsKJ5YIHSQsNUtjpHHY7KzhxEq1TuX+Acg/xhf1J/Rs
	W0X1mkkMkd3oXmLQJDTZY5hgOeOFn7w1LdpW0v38dsflG4Cx8+OUFVsiFYxQ==
X-Received: by 2002:a17:90b:2804:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-37dfa1a522bmr5525074a91.4.1782454570910;
        Thu, 25 Jun 2026 23:16:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:10 -0700 (PDT)
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
Subject: [PATCH 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:25 +0700
Message-ID: <20260626061329.23264-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l85.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9ee60616c04c 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2504,9 +2505,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2537,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0

