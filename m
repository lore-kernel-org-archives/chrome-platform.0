Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F7336C592
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515049; cv=none; b=Dqmk9aooKvvUipq4RC4os2vXUM7Wr09+as+G5f8lZmgpSj2PZTX9+4wIOe/XMcBjV6PgXlBF9jIKhyjoe3qy+pCCbMvyPZRZILzDAK28/1MZrckMbKxY802oyYo29t8ZGkvsAu/maqeQ11f2yfGFlMoIKZ3ZRtVlJED7pMXElvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515049; c=relaxed/simple;
	bh=09+uHExlisne1jIooukG5gRoEn/YSMdFeZBQ6FKI5q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJM4qq1Sgb3AxwIoRouLG5E45MNgt1o3JhO9/+Qz5OaphEDz+NRPDDdXs//Yfe0Ihy33PFFzyxKf+dTAov57f7IBYn0MiFyEDh9/NoZ7t4cWrLegPCQEnITk3nfND+23Iu2oqNUZQvfi24ABl2sDhAAMMW3JJRNyec4K8J2AT4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oi0xHXFA; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oi0xHXFA"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so544462a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515047; x=1784119847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hagTq/6ZaI2+r9Hot5OPuLrYC79qm3HVss9ILqnQ1PI=;
        b=Oi0xHXFAHZOoDLZnIrrbv37BAWvTbiCaCnRgCQoFVjyc6bgv+wQvIFwLGUdvWvKuOD
         LoWgi6zE4WJ7/vKyKXK1bu8uHXgkEHVEV7eQnwymoUjIOXCuQAw31YwC7tPLKwkbQ0T3
         AHb8S64PrIOESOW99vnBydOStLXB0RC+I0gFssnsLKu10nj8fAZ8tU6peBScIPoEL06/
         oD5BKathhggWACDCh2NNTfabZ8OQzRzKTxlHxXwf6q3vqoGAbn/l0ZANcXC+lwIrJZqP
         zEyk7Yln3w6O/W6RCJ5QXdW298G3rvd54WmvdvVr0tuh6V17nVQ7D6vY8HEFTTi5m9Oq
         BFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515047; x=1784119847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hagTq/6ZaI2+r9Hot5OPuLrYC79qm3HVss9ILqnQ1PI=;
        b=c5diSY1Xp547X4OpMRQPYMJQM85jMVMMj3RlJHymUO4X3Az8Jo6r7yzeCls5HBWBO0
         tMcDvmrzVtgLrFbEnjjgaHW47HXvE57laM77XANqUF1PxK+OAsVkEfQc3d53jBUyWdmj
         Dup7AVRDea2nYMe6Uo/BpSuMG/4f/E8UNBaUQRoXoEfSCjDTPSWHgXJdpYlYwB9DyisO
         SUMhRNalxYpalcO/EXZVPtvwKSfv4wy8GpgbgPsW6shZ7oTTYZM+uLT8l9mzyQRSJ8yq
         s+bL4nyutEllAdpUSBaGBcqRe4tuBpuPMX05BXloUhb//35NUIRjko48STSxdBVBlB9e
         06aw==
X-Forwarded-Encrypted: i=1; AHgh+RrIVQy3++lE9du2ak8yPidh2HptNWUHnSsDD2q8MmPUn5higlzo+7sEEa69Z/uMCIwzUxlClYE7pOYKQ2RWydQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YywZYYw2TC42RJRERTyAoWP1vn0SgODy1z2DssUKNFmZa3pWwFm
	wW9cytIyQo5HBGUsht3vI09aeWFOjpE3Vb3D+ABOZ1ic4IUv8/TK59XW
X-Gm-Gg: AfdE7clM4SgR5EmD8uH+vnkQyLW9W4jahcTY4P0dIn6VgjvCHOcl0SJb/EVB8bO31bk
	bbMNJOVjYOr5ijaXEJjZxwFz4cJqsEwFs1XMduDSkqwxAwGBvxWWFMSZJoIvG/XzLVnv7t2emex
	C8ESdE1irW/Aq25DK5AnGPUGvTrD3d6X+9BCByKd07KZDKp2+Oag7+uZPvL1vs3SwHJRDNEkF2G
	3mw401EHw/ZIRcNLZJsluWh/6JWV2HBWJBCQpt2LdlSeas1Eibiyv6aFZ0pyD94oU8C13ziwU6n
	QcXpruFAp40ll1VzR0wNq1SvfTpzYlhdRS/U8vKO67z8/k4Ea1U3dXJXhzmfUt/RMMC9s3ltENp
	Yht1rg1Ju+DByHntYGWs3dS/Ow9NgC4xNHm/X2/c4Q1CddPbLbafoy5eKOZvotS+9ZdQD3YQL95
	ctyIhBLS1P0KvKRTSr+7Gl7L5FwnI/5SODCbviknU9tFiqmVg=
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr2917790a91.16.1783515047234;
        Wed, 08 Jul 2026 05:50:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:50:46 -0700 (PDT)
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
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 02/24] ASoC: codecs: ak4613: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:39 +0700
Message-ID: <20260708125002.202515-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
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

