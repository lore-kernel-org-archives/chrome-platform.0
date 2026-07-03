Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08C032B100
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058067; cv=none; b=Jus7RPRIWkxKPJf9MK0uvrDDcKM9pYubpNPNXaUNlEu5I76yFjh2vj66fNlWp+UmQA/G4dxO+YONJIHmNdcuhQOT+3RqSsrFHZpwWBxHvSsjwlW/tH4q3J9f5U8MZv33DiMJLxHMwha/4nM64avIKvQ5vOQABChlhDMsrVbdO7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058067; c=relaxed/simple;
	bh=aeZjPmGhDWlaPCT1RRDfgeSEVWLZ95Hfqxv0L4cptwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CL8v7jVu1Swb1jSdy2GuhhFR7OAqLS8GWd8DIHZG5n1Ee1pCfzfFZKahZqeK/6uZzQ+L79lqdHtcIlH2Q9wQ8ok8VzRNOIxYGfKxhcI+EIQxDdkMTtRZyR2wVmoTsYXrql+9pOysGFCeAEw2bLcvqYKEsB9uxt0gdMxKv7Qm+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDBvVIm4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDBvVIm4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-847aa193d98so146343b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058065; x=1783662865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=CDBvVIm4a5yXYMkPgLhMWBGwoEsGRJwtJsYRBaa6du6POgZIUfj81S/vPVYZnWg4bM
         sMyG1kpzIPN5Z8HPaUtT3BclUHm1mkHhfNGQU4zhoAIu1SsqLxpe3nEEezRedz/f0tuJ
         lAPi1gIqqBEKaTGgH4bo531+L58YFGbzbHi5rKKx0oNdKGG8ca4iHEbszFL77TjYZmWQ
         fzS0CLTMICKdnufla6UcFB54S9zML8CU4YPnTf1Agzyhkz8iViK6knerWiUB8LF2x2cB
         FIssQNJ4pP55u1e+2/gd9AL6RM4cHCjmTbc8wFxqqhiBAJRAZLvYbVwQo4CElW4J8o3/
         gzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058065; x=1783662865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=Z9ff1NyWKXll4s2CoKd3oW+Gz8A9Qq8N0KTip+McZPqU+JTb+7mrb1lMJUFPkdYHuy
         F4l+HEwWScqvoJ9Z5JkfwGCoIx4BRijOAp4KBZyfXvjuaeRsNPTpjFnWp0OcftkdfVYz
         hfEabVQUk8SB9epjfFVbVqNLRV1Q/4Lpq9/7NaB1996iPs+LU3dMp070USM1HCo3R2sy
         nV7LwIvpuqJE4tpleq/g9dHU8Yj0d+fiHNC/8O3T2gsAzwS9bxr7gEajG4MMBctknHoG
         aZ56TCPJzzpy4ShBz8RwzeL4rh3w+YpVYnHPWE6406fMs/b43sDKp7kbtIV4kgmrwiJ1
         ricQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vkIJ3hAUs7gFTurFo7Kxkpmb8IOfiShuxehmLprWqYnhGH5QTT+IaRi4xypStQAc1ztiyxCE5UQs9LUhVq04=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5Bum56bt4wSkv2a+XxEOyp472Rj0kY4C81YY0ss0rZzaSA3mX
	KKM/LTq8XPIM7xC4DP+3TiVX/Os78e6+o1felii48xMjFOO5k0g67Qon
X-Gm-Gg: AfdE7cn94q/yMt3cMmOSWbq3dzCG4iDbN6WiRJhYcyh94EZYIIatU1UNYphEqwIK2dT
	OXNZfXsW7vBf8npVhfCJo7q2duORb2SUIaTgOEq1WdZnottckUjQQYjPNxXQ9TH0E6JcCSFcQ1w
	da/KtlBeKCSu8R+znNkBgvJcqb0XmEWVQQMemZTc7JofE1+kdJzYoP7REzcgoCNybNOxrpWkzVZ
	kXLyhXYbJgbta1plbsbZKfSwR+Z7Eu5rbuLcE/beOpoDPS8oeSgQ4M6ECB13n/7d+llTSzBWaVe
	JWnn48Oi3Zw1gduU914dZ+Ze1NSidz9exjgvUQps0xOiPtrgyBuG1IeW+XJ4EVTs+XC/2+uohBV
	3g2hawFXI/z/A8mdqSWLKZbqrck9N4l6ib/DqgzcUB/szfWaunIEdcdubLkfdGqO75uVYZ1pGw9
	QFHBfX01Y+ybnY/lK5le9fe6TOR9atWMRf3rWFHdwjboW31R4=
X-Received: by 2002:a05:6a00:992:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-847c0690f7dmr9119828b3a.11.1783058064965;
        Thu, 02 Jul 2026 22:54:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:54:24 -0700 (PDT)
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
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:32 +0700
Message-ID: <20260703055355.244898-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/ab8500-codec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..2cf96cbdd294 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -14,6 +14,7 @@
  *         for ST-Ericsson.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -989,9 +990,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1014,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1025,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1044,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0

