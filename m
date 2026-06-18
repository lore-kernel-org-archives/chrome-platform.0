Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D113F0A9A
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781073; cv=none; b=offVD6dsT73poS11XH1JGNHGhlUU5SbJwpx7Muv6QXwoxZEoHx1Jqn7pQ+ijXek8DYtGmiN6WtFh7I+tFCFTsB9XJH3XsB1DpQFu/rp+V3lBxdeF7yCzjo3huInDSZF+laVM8S1vkM3d8o+TjP1UgPBZ/gITnK25suSg8TKhhnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781073; c=relaxed/simple;
	bh=eziIqUM2ippJniFv9WY9EBHuapZTIBxPkHGk8fWEWcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOsgYQNTt/xYn1dI7YFzKgOsVJUx8ySoCMPoCyVLeBQyOzGs/1R10oETJviNKFK+DonCZlv+xdw+nVfu7eW2s+EtH8rhO2wOTZXbg2ISXtwBKCp0SMsIel/o7lwY6ZcDy/N7A9/KdqlyNqEdmuoUOfl1/cprppyBkmdWoFrvHI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwuJaInJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwuJaInJ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf125989f2so5413695ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781071; x=1782385871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=;
        b=fwuJaInJeUkLueZz5awCASghOBkkTfYwCR/gRLMUCOXqPsR3PVix5FG5oJaC+6XyEd
         s4STePeBShxF8eSmtm5RzcvWamuEwKI3/aQ/PYIZCM/6zkSn4l9pn+wR08nCmNOxta7h
         /2+QmNI+hoYYl3btjKtAQsKqwAZ9fiREqSZzTX7t5W/mRDo+SWCPUFN69orHzNn1Sc3q
         ibyo5CIRxVYRYQulZMxqkCww0A3MSc0MFc62Gw0s7p0EuwPnfYdiosI1i4qI/569CjmN
         h7u9wVIHT9lz9V7oVS1HDUjpZkvgRFQKF8MDdkV7tNiAM6MuXtdUVPK4YghdCxKVyRaU
         Bd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781071; x=1782385871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X7Gk2MVQct5THK96rI7Y9OiiMBLGh95mss34zi4U46Q=;
        b=NsLLW1Et+VAhdRFJbnlnjdrjNgxhoV1xk1e1GWJio8Vy0Nn3XYhK+NGEkz3QIj2jzR
         ArkP5Ax0pJFTEf2R4JeIU5EdsvEROjIjlSl0mhqPFVFzXGaOqvJM2BYCUquyC3emoGet
         2pe0/ncbOgRkOMesbnjBj75BOa2UKiUXO148JtKPyJgxg1ko5iwsouVh3So4nZSQ0Nbm
         F66IOjp29+o6e+rFa1VLFdp1z6xQB4LkhlwZX8iD/GIkINXafhFPosFcluSPgVwZiqRb
         VKPHXBJxM2Tht9FvozW9n3X0dwMNhj7n4hqdjqPNfsLeLC3XmwKTOvnvtGk00QD0uygC
         ebCg==
X-Forwarded-Encrypted: i=1; AFNElJ9URuIZf0/m+P0v0VxliMnRtG2C2fh/m84i9nDNYolYWrnGtZ+y2bOmkWtTANuB88RnKjrCwz778LDqz3wyosE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLx2frI9t1MSehuQUQWTbTuh8LcESv2dSGea1bJHiFzNQiAreI
	Rd6g5SSkPWF03lS1kD63lPOJuQfmYeKTf7dRbH78JEly2vZyccgmSOYn
X-Gm-Gg: AfdE7cmAoIBZJMOUGB+dFS/T9UA722/hPHJ2UvIvbHYA/l4gCcGeQtzWfHby3gu/IdP
	yiWRdid4Ddse0aghhClYkPC66UgQu8JicOWHKl1IQ3URRZxDCWMC37wV5HIaNT/QRkZquM6DO3x
	rtY63XbyoznIvRdcIa7YFMqI460r/PdEB/6eAe42WyrUcLMpBnSqzOeffE8u40J3B1V0uy1EQhc
	B61zj/vsvOU8nINWW7XgABH9CsP4Tp8vU09qiTqWNfosotz4ByRg4xVvk1I/RdJhH0eh/RxNmLK
	mIB3hGTjnY3QkzM4PKa4dqrvZCFlsroNxbTRxlGQATp+Soz3TsEsFlOCLrpEXZXV7XAFwMPS/pm
	pJZYj81uOqToVj7Ff3ByK+NpgUv0LzkSQ8EIFue28TCODRWNvjend+1tHmYDrwaxOqMDGu/3g2+
	pyMNqZS48SOPSTiLcSZz09/OnCyMN/Oux+jrYx01gU9i/8TQ4=
X-Received: by 2002:a17:902:ecc1:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c6bbfa1958mr84967955ad.8.1781781071349;
        Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:11 -0700 (PDT)
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
Subject: [PATCH 73/78] ASoC: codecs: wm8958: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:22 +0700
Message-ID: <20260618110827.232983-17-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8958-dsp2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 8ff0882732e7..b6e5f1beb2b4 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -864,9 +864,8 @@ static void wm8958_enh_eq_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "ENH_EQ", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->enh_eq = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -876,9 +875,8 @@ static void wm8958_mbc_vss_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC+VSS", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc_vss = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -888,9 +886,8 @@ static void wm8958_mbc_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
-- 
2.43.0

