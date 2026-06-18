Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A1F3F0A8E
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781117; cv=none; b=dutwiyPS67l12vsHXTCg61e5X02eWsHjpMaESXuMXGuHBzQP8q9VX8XOL0br7Yw74dhWFok1husPzDuOT+uHpDpqUAo+VUCu3Segcv0XBDyheBApO6NP9hXrhpek3o2k81xvzl2AxWwgdfkJYGZT4iIep/m1pyZG30XxrQtTkDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781117; c=relaxed/simple;
	bh=AWgAFvAQViYaJeMV1jCt940qM9vOdEKhz9JyUk2u9dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPuXxx51O5GeSKXOxWKcumlQh0wwpYWI5lPmkWxKL6V3Pt9DmO+z6iiJpdleU6o7F/MiQ/+sAynyn0Q0iL7RXFBS4FHZ6PWM1/jdxJ+qViFHJqHNhSASVc9hUomvQUZoTZh7SIaYtqrA6CGmIQVV3RLnDjyWT5y5BmFIxmeQskk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEXvTmiW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEXvTmiW"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf1cda2b17so4854755ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781116; x=1782385916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=XEXvTmiWq/Qbb6J85qwN+YEcWEZJCpBSJubdv3XCjh38V/p7xDae8aW+Q0GyFIz2JW
         IDpoyR0VR2Csb+qa4PnHrfiPyW+NSpoJ0QXYSAbOictr0N591fZVc//1wg6J5sJWoUWw
         ZrgXlPuoDhEHuSiMVr0cOnFDjixoDyN8VqAMny64L5qkMdLhIdCPDm69sR0bahGYzxjq
         sPKL6VpbBwh4w4dXAmiNvAMMIGsdDvV57PMcKc9qOYsUsxF0cKRvJCTgCrtcsonGDK7v
         KMdK9KbhWsh/EjLuNcMKJmzx8CaUW/5hIALKDTPZ390j7wjGOFib7Dt5eRhpHuk8bAlN
         omkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781116; x=1782385916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rJ9NJmLKLeH+SQoR6J0LdprGbIfcBLY+F247SPRpjXU=;
        b=V+etMlhgJpipL5xFLyFjMauKUB7khF0xKHj7HpAiR6P3MlnSu1r8a5Baciz3CRN9+d
         UjRXmqiDj+HPNCAAKWDrGnndFHCF1SVhS7SetXbEe41puo+mLZf/F0Pll0vHVKHhuRY3
         z8uiuoKVfW8yK9U6ngswmwgi8iCnT2jIE7SQTN+jZlS63GQyfrTAiFRB4LlQsEXTlLv+
         ehWNzZYFNm0aG+SamGYwaAROhP92nmwsr1NUKpd9iDlu00fmeKlFPlaHw4ObIEnmo0CS
         YsPUobPyW3n4QKTtLlvf0zV98LfiQWAPmDTwqnixOSWa7nvURWPGYNC1Gu+x8AGi3sa9
         5E8w==
X-Forwarded-Encrypted: i=1; AFNElJ8TFgD8Tu97K3WntlxqgHCHKeZp8r5z9OItb+k/h3ny1uaIpXqGzT1jNJ7q6O3KN0uKnmTa+oA+jg8eqWCobDY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIiRHa3qf6qtzWyIzRb2E4mKEcm0HL7sZX1DL4Pus6F5Vb2Bl6
	VFVw3FyLmd+uvhEiJTEFReo3sL34N9BCghrANNqlu13nKvd7RXyj4rFJ
X-Gm-Gg: AfdE7ckoHGLRXRranhbIXuLFI7v/Vu+E3RULBltO6idRMtG10F/vvhHqGoPqF7Vh92S
	IeOfGeRnArnVMXkBvvJNCs82lDEvLbS6ggsyRehswBDYF+REg7Jv66SPfNQ11JhyfXug//HB9hQ
	dXQwdy5rXS3lE1F51pPlKHf5g3gwq5WMrRvxaYMZ4hpVB96I5KNMbLFPJBIeG1yZLtQQ8DkN2eM
	JixzWdJXsEWPTC5+d+nYGXMV2juwVH+EbSg2GPUDmNQhU0YCIqYSISky5P4BfEdw3ZIR4uI4vO8
	Gizv5SjKBDfAV/HWC1mrqsuFF8r5aSONHlqMEBrHRJtF/HeRki1OQ/1mmLmNprzVXsA/TuDNxwr
	wmd2pL4uUIyFjNG3lyKR3odJ4dyik0Dy6DxWNUySn51GrhnWCOjlsvC6Kw7MFOXk3bdru96yoRw
	R1VEaMxhMXVbhSoykcFwrkg6kl03MGvbuHa67KXJXh3V5IAhM=
X-Received: by 2002:a17:903:3510:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c6e00b0e69mr29505545ad.28.1781781115885;
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:55 -0700 (PDT)
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
Subject: [PATCH 78/78] ASoC: codecs: wsa88xx: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:27 +0700
Message-ID: <20260618110827.232983-22-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wsa883x.c | 10 ++++------
 sound/soc/codecs/wsa884x.c | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 468d2b38a22a..7d9e0ceba461 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1237,9 +1237,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = true;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = true;
 
 		switch (wsa883x->dev_mode) {
 		case RECEIVER:
@@ -1290,9 +1289,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA883X_GLOBAL_PA_EN_MASK, 0);
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK, 0);
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = false;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = false;
 		break;
 	}
 	return 0;
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 6c6b497657d0..89c560428a9e 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1701,9 +1701,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = true;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = true;
 
 		wsa884x_spkr_post_pmu(component, wsa884x);
 
@@ -1717,9 +1716,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
 
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = false;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = false;
 		break;
 	}
 
-- 
2.43.0

