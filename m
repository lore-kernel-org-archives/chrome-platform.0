Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60813F1AC5
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 11:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781048; cv=none; b=eziYkpnh+kw67diKWziFjZZCYeM7khnzTTMvUatzEU0GsPQJFRV93k8vnKwmZvRX8fxKd/qvpM6YYMHxva1HO1EJrU53QLFr+KfaRGmb14FfWpz3Ub9t2x92rXfDWCtLUmZzxeZF4xGVUOUDa4WfVHRHKFIPw2hwsvlI09GWZKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781048; c=relaxed/simple;
	bh=um4XzRK/FYmWBzEASpvNytlSiXtvP8Pb9Nu/RJVt2Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwYRSuEMIWyXMG8Czk+akCpCkmR15kL+R3hXpLAdAfEhSkMmDn9i2S/Z5i3hgIpU6zqVpJeJudy1DUYMWGJAY3KYmd4XDcCCw/AK65Zh5YDkwHvO72jpSb1JVe6XdVgQ/kN5o0wNihgqzAJmRhVPj40wkwWFIZJcWMElR+n+02c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWBdRtrV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWBdRtrV"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c68190ade4so14541605ad.0
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781046; x=1782385846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McfH8rWJuuVUcm1G/yfvz4+Q+IQpATUYtGec2KxjrME=;
        b=PWBdRtrVN4tvA8ZpxZvLT3RsTIFlSxp2ntm3A4Ysc4bbkxBDB35ZPp0Cq6SnyhPqQ5
         lcUzCuU1YFz0/DKfocHIptPwB2clTzKexepx1xis281rBDRvevd1Evyaz/leXWYAS4dN
         VzbFeDMWpWu7mJ74YIDclPZM6WG8KJoq5JEEBD9U7ZXlRZJieAvxrYQbjepzLNgJT2hu
         2aBE55CSVhNpv3gAhvTlgLqOXRaVCPsT1eZ9Yt6WceA9B+VPuLgw5dgWQyFhdJfOrGXL
         Z0CU1SQYtc7doJRQkOuYGfThIIIP0bpoY7rb6ZGHs58aMhBU35w+nCJjf2Za2aoldaj7
         pnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781046; x=1782385846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=McfH8rWJuuVUcm1G/yfvz4+Q+IQpATUYtGec2KxjrME=;
        b=gDXF1D8/azN2g3UhMgNXTQGmtuih9sRKGNvX6jOKD49w8DGfaXoUfdHUsgf5jbrWkO
         axF1LPZl5O2/SVwCpuV4hPY6rOCrkfb7Peltm0FFNigx9pUAuHIF8PwwceT3+mVf+bji
         43t5+d/SGwDEkEvFvzCUmHmOea/t9fHrOvGrva/utDEbXzmJ/6pnzsxJvQtf0t2yd+y3
         DDhqzUY0PBBSYy+37SP9mwYbtoKZ9ED822662KKIItduuJuCFkYDMpHELMEMavdtTtuJ
         We42Ce5T94iNtHPwz3ZYYug0jDKCVnF+OjY9Em25CEyKygA70+FB87zos2zi+mbcx21O
         x5TQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dm1nHoqlpbfcAN7jtbxeestB80uo5Ejl149jQbjqAibwBJAPXoM4amzskYn+Vn07qJidLZ0D9I4pCFvRScRc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsbpxX6kDw0t5aWnwhbSnUcX/o5JNySVwT9foWrsJcVtlLJEOH
	Csm9HaYgTJvf5/6UE0iCDNuFUir4l9vEmXkZ33dnPtNXQWhp9mnImu7U
X-Gm-Gg: AfdE7cnVCYmXDxyMZeZtMTUAPoyzicN60DGmR/HWT6dH7y1un1uuBRd9iRUGcO1PZSq
	Nzw4FJJn3G7ZZaJ8PthzsMsZMgZwL8MRNs9lleY3L+5q0P7UdHQcfTkkdcE4WgTyr9O7f4znLOV
	qP+TeXPIHqA2x5SuE+h5FY1AYtbbtRXylSK/EqqtKAwaPV98z4OnwaTShQuznG9LmofP17G5Hv+
	RmPPmfqRrtKIM1+bOAZCxmjiW9y39+BNXLVCeyrkE2Pp0oufwDrBqVxHdxkT7mWJ4KF0pukszTh
	XF1GZYtURH27vq1U3FRHulCxFPyA79POdrPhLvZSPOgbXGrbUpxVYENENysXBbKAiaQQ9cFLZPQ
	Mr0JerVyrbf6VN+ARlCY4J/20bt36xIApVCzVIq7t7Ull++Qcz+IcOUsUHdz9/zAXTd66eLPPda
	nbGKQE+tictrF2b0eJ2MryzHrCZ6MyEsbyNaZXiD8gFrHpzmM=
X-Received: by 2002:a17:903:22cb:b0:2c2:343:88b0 with SMTP id d9443c01a7336-2c6de666d41mr28427805ad.19.1781781046290;
        Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
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
Subject: [PATCH 70/78] ASoC: codecs: wm5102: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:19 +0700
Message-ID: <20260618110827.232983-14-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm5102.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index b4d4137c05b4..d0b6707ce62e 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -667,10 +667,9 @@ static int wm5102_out_comp_coeff_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	put_unaligned_be16(arizona->dac_comp_coeff,
 			   ucontrol->value.bytes.data);
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -683,12 +682,11 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 	uint16_t dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
 	int ret = 0;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_coeff != dac_comp_coeff) {
 		arizona->dac_comp_coeff = dac_comp_coeff;
 		ret = 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return ret;
 }
@@ -699,9 +697,8 @@ static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	ucontrol->value.integer.value[0] = arizona->dac_comp_enabled;
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -717,12 +714,11 @@ static int wm5102_out_comp_switch_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] > mc->max)
 		return -EINVAL;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_enabled != ucontrol->value.integer.value[0]) {
 		arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
 		ret = 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return ret;
 }
-- 
2.43.0

