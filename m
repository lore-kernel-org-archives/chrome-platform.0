Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ADB30DEAC
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058076; cv=none; b=oAQa/13tQS+T0rlGQA5+31bf9Kchef16ZPJvcc6Fo9RFXKsr2DkqnW9Fimwh2ABNC+wFmogaRIzl+dKf7SgXZALFf6ZXIDa2Ias/VqqvqexuNZBPuQJE2xWDoPnnQFjjPfJBV6vcEkIFW+pYQAAUF2Z5xro20R72RsfVdjuGCLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058076; c=relaxed/simple;
	bh=VBywIEI+mrkeBMiuQwNmf5i2jTPdGPDjHD+MzsDCtuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9dxRKWRp8zIEf74pvJ93kwAfmXR2Vk7h17gQcBjl4OtsWZSCO91L0JXXv5aVBEHwffE+Ta4Izfz4trZmna1snysd1y4EvGF5KCBMRal7kbIxJ9hPZGC18yp/ELO3AUv7Th9JsQpUzS0lUcmp2ltpaiq1A22vrAAI0gE+S4r6WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7ZYx3O5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7ZYx3O5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84794e800f4so98737b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058074; x=1783662874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4Mllffw4khwUVvJSV3KZtob20XT8yXXusLnJJ8LlWE=;
        b=c7ZYx3O53ot4ySCY04H7NA/MM4LXUTiYFuyS7BxamNWmAF2a9/gVm9oYdXZoQat+QH
         EK0N0pvZTEoIxh5xVgtHAxlmDlmnS/xI2fKRfPHSFnaGvXCZsqukNUsGEF25twPMQbmC
         p6TX+r340jhQOuu2NvAkl7xnqRki2ynO/jLyCItFTkJaC+jgd+9sjK6lOQE6kud17wCd
         gXUDx4Tw1hPQoOZkIndaTFP0nbNAdrCA1vmbr7IkrRS0zf8+DFKj8Fxs8RDr/03k6VeB
         ShClur+Ppt2e61M9XrFbovQJ5/cYj0ZGdL//OvgDgmgEAlSll4GWhOllXbWtNqJ74aqz
         3SZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058074; x=1783662874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r4Mllffw4khwUVvJSV3KZtob20XT8yXXusLnJJ8LlWE=;
        b=IY6cnWzgNQf0wb6yS5B32XejNCpBIpkj+r6dfYbk0lsZsdLy3EpigQly8Bpl1uCLI7
         c3XCZwSxuQSYw9lci3d4eMpfAXLteQnDogOUdFzlSyi7DRcf5Id7AuRbs6Eo8Ps+lH9R
         D2hGMOYx6HnAroxKYdqhHsrn9C9l9pvO8SPHnAo4XqD/xWePMROWH7hY5l+Lt3lZDGtu
         wdo0CaVopxBAW6WhjLDjtluVIyLpZI9Inr3B3ttm3H5x8cnaXUZBkgbz9ne/LqU+Y7oe
         jjLvINrOihQGZ6jT7pHt0Yk4GA3OOYorhhO5mBwUUJuRLvFDXXDprzNkWRPJo9Uky+LX
         lBBg==
X-Forwarded-Encrypted: i=1; AHgh+RqhMg3Ov6kWenMpAUg/3bTW0oe1+VqHmOUA/pm504oYY5Ujg7KS1nzI3C/38ZTTAOESiGqC2il4sLd43mhW+Cc=@lists.linux.dev
X-Gm-Message-State: AOJu0YytA8xJUHh79EQCv5a+mGcrrBBKHp4qxJ/NdBCdZJVsVEE3mioq
	S7O/vLMhPzloXacsJ0AiQynXaVdaHYi6EmvL+kSUgAjqiYXh+P4zFz1i
X-Gm-Gg: AfdE7ckXZMgz9RzLykypRm206Ic/FhdQSVXgSuq8OSqwQsHqWx1Zwi2L7kpprUWCaMN
	sr8PG5D8rPU/RZw2AurmaoyRx3WFA3PI1E9n1hUFpPZkZV9suPjcUz7DeQom5bEJVnoNtXm/cf9
	upeVkCCV4fvEoNeYE5s4K2beos4/dx8mFP1tY7dPOPol4vNBOgaBNwuXgLvuZrc8Jz3h+z6lk+h
	o9qwpXIR0pw1r/fEDMv1ZHGvUyLp7T0ZM8l+EbtNxLoZ8TeJNZho9v6wgAjp6dqno4Fd3EAS7UP
	mwrzJ1Oe2OyHod3hKGOyrpSnwcXPrKIzQV10FmOzs2gt8rJn0nryyuIIHkP+TsKaGlhq0XFduR7
	G1p3xxKQuBXYVUvM0HH4l59gPNlLg6oqhWrnxyuA3MJauwcCjxLfvIpFe0Dji9vKOFbKjQn7A5K
	0a+RMojBdSlubFA9RvKi+FtdlpLSOQmOE484m+Y4UfiUbj+tA=
X-Received: by 2002:a05:6a00:3c90:b0:847:93f3:a4b6 with SMTP id d2e1a72fcca58-847c506d4e9mr8520379b3a.17.1783058074207;
        Thu, 02 Jul 2026 22:54:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:54:33 -0700 (PDT)
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
Subject: [PATCH v2 02/24] ASoC: codecs: ak4613: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:33 +0700
Message-ID: <20260703055355.244898-3-phucduc.bui@gmail.com>
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
 sound/soc/codecs/ak4613.c | 83 +++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 3e0696b5abf5..be5306d07d40 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -95,6 +95,7 @@
  * see
  *	AK4613_ENABLE_TDM_TEST
  */
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -384,7 +385,7 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 	struct device *dev = component->dev;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	priv->cnt--;
 	if (priv->cnt < 0) {
 		dev_err(dev, "unexpected counter error\n");
@@ -392,7 +393,6 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	}
 	if (!priv->cnt)
 		priv->ctrl1 = 0;
-	mutex_unlock(&priv->lock);
 }
 
 static void ak4613_hw_constraints(struct ak4613_priv *priv,
@@ -507,10 +507,9 @@ static int ak4613_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	ak4613_hw_constraints(priv, substream);
 	priv->cnt++;
-	mutex_unlock(&priv->lock);
 
 	return 0;
 }
@@ -599,45 +598,47 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	 */
 	ret = -EINVAL;
 
-	mutex_lock(&priv->lock);
-	if (priv->cnt > 1) {
-		/*
-		 * If it was already working, use current priv->ctrl1
-		 */
-		ret = 0;
-	} else {
-		/*
-		 * It is not yet working,
-		 */
-		unsigned int channel = params_channels(params);
-		u8 tdm;
-
-		/* STEREO or TDM */
-		if (channel == 2)
-			tdm = AK4613_CONFIG_MODE_STEREO;
-		else
-			tdm = AK4613_CONFIG_GET(priv, MODE);
-
-		for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
-			const struct ak4613_interface *iface = ak4613_iface + i;
-
-			if ((iface->fmt == fmt) && (iface->width == width)) {
-				/*
-				 * Ctrl1
-				 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
-				 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
-				 *  <  tdm  > < iface->dif >
-				 */
-				priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
-				ret = 0;
-				break;
+	scoped_guard(mutex, &priv->lock) {
+		if (priv->cnt > 1) {
+			/*
+			 * If it was already working, use current priv->ctrl1
+			 */
+			ret = 0;
+		} else {
+			/*
+			 * It is not yet working,
+			 */
+			unsigned int channel = params_channels(params);
+			u8 tdm;
+
+			/* STEREO or TDM */
+			if (channel == 2)
+				tdm = AK4613_CONFIG_MODE_STEREO;
+			else
+				tdm = AK4613_CONFIG_GET(priv, MODE);
+
+			for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
+				const struct ak4613_interface *iface = ak4613_iface + i;
+
+				if (iface->fmt == fmt && iface->width == width) {
+					/*
+					 * Ctrl1
+					 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
+					 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
+					 *  <  tdm  > < iface->dif >
+					 */
+					priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
+					ret = 0;
+					break;
+				}
 			}
 		}
 	}
-	mutex_unlock(&priv->lock);
 
-	if (ret < 0)
-		goto hw_params_end;
+	if (ret < 0) {
+		dev_warn(dev, "unsupported data width/format combination\n");
+		return ret;
+	}
 
 	snd_soc_component_update_bits(component, CTRL1, FMT_MASK, priv->ctrl1);
 	snd_soc_component_update_bits(component, CTRL2, DFS_MASK, ctrl2);
@@ -645,10 +646,6 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, ICTRL, ICTRL_MASK, priv->ic);
 	snd_soc_component_update_bits(component, OCTRL, OCTRL_MASK, priv->oc);
 
-hw_params_end:
-	if (ret < 0)
-		dev_warn(dev, "unsupported data width/format combination\n");
-
 	return ret;
 }
 
-- 
2.43.0

