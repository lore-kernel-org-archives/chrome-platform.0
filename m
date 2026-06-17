Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB80F480DE8
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692681; cv=none; b=ltaWnY0DlPiF30jxAHQfk2P7TjmoQTRDh+W6ixdgQ8SpLBqoUvMK8G5EXL2ai6tbhQNGGYWQ2YY1VC+J+SediqOtfKNRcbC8qoGpXouPmZdyGcEKXR8Lu+GDjZVKYtK/N+3oldM62RJd1EL9FJEsCaGbFAGFIbcrQXs9rU1R8KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692681; c=relaxed/simple;
	bh=PkNTUMrO9A90ORm5UpNrg9J+YT1OSjZKeeLipJ8J31Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQNGB07kbB9pRfPYTgU7jp+8dQfxquIshlsTZ/7w6W4rTn6zt0KDoIYqAbDye0nOj7U0ggG2x2l/kt1Vi1DFzR7B5QOho9kYOpw+O+hnSYlQ2ihi3XCW2FUc+jYC49kgwZCpiDZnmK8uuTYI/GZVkkp2M+rYOgLwyT3wee9Ksiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAEnKijF; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAEnKijF"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-13988680a69so3585328c88.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692675; x=1782297475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=;
        b=CAEnKijFtXgAUoOrHG07ZsDwasp55fwiPcv29ijfkEBNjQnB3xLvu1h+AYRdYaZ7ru
         oWlJNTc+CcyBH2LOX0ikl8yvXQXI/shz4iCu4aR0KAWXMbW2u3VY39viI2/jhnfpLdvW
         d4WNuETGjIupZ5Dum3VhHM16wOtGcyFtLj5VKBr3c1seto8thcuaXMKvaDJ3WLZEWkhQ
         /gHTQj51mhD1DTrvSevayj575FA1tPMSY7nB30LFkr2HlTJFJyyYB5cyLnawrNJ3cc45
         Z5oPpeQQ6ad3UafdbdERB9inM3Ilk/lljm0m5ghNhe4/tlhfQvS7ko0KEI6AeGMKXQ+w
         lzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692675; x=1782297475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=;
        b=NmUP7S9nNcHiYDcelFFKrWwM94q7KU/W8B/+CBjPXHEdO0NK3iTe1l2//awMrfKqrq
         N+EV/0gPX8H//fWKIOcEnu2VbgPn57tb8upl8OvHapPc2taByPlNY82LgDwHh433vZ0q
         8jsYtDvZGFUr4TSfUA2xPzQS5JauargJoNykxh+lvQZNsZ4FsByrzPewDLeiPtznqhGY
         7TukbZwgw3ZXbeNPpZ2fxloPiN1fwTrmx5Uy2Vd1OceNkbtbHZh2mMHEujIIIVm7laXY
         VfOiuqXnrOxsuFyg4kiK/YWUCNqVIReqIQcr0T6QUHXIZD0kUodiM1lzUZKiqyXPhdlw
         SUDA==
X-Forwarded-Encrypted: i=1; AFNElJ/A/lX67YP4fo60PqDQ8kmih9Jj9l9Y2r534PmRgl0YDS96wmcrEm5m9RJRQ4NCFuLIpD96vdtaVqlqdJ3LsX8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCkGEC/4QMSpX7AIV3tjIwg6ScgKndFPvuV0zPToT3SwfIrkLt
	ciloF2SK8NXKbD7qUkOYxHmyh0RRjBim+4+yZ1br5v2liF7DUOgUfnQ3
X-Gm-Gg: AfdE7cmXjsc/NFCS0gla2jneKri2nShhgoUqBepReJq2surPcWQp3FyUYtnynh4rDpz
	twfdA25NznF6r91nEe31rgC01P5dD4VtbtlRcBzkzcoMv9ox01kGbMAiej765kPsyNS2lHvL5Ny
	QwyKEm6zQcjN3d8dj7hM99IlBqsl9o6B803te8uvmcW1NAqWnGTUpl4LCOKcKoZ5c6NX1RxJ48R
	jmSr+dBat2GVTDq0uik3CONrIXrSfz/JUUrjacusn7A1QC+3NAkw3Pll0ZkPk+9sqgKBpwQ1Gbe
	CPxagKZZUwQR/WgVlPqOtrIisCAW629qK3bOhtJ7SQ7TPtPrmmoCKI7ylN6ZwNZEdIsHqQrswVz
	gdihTl1vC8vBmF+K3p9ZxCSsCkiaXh7fbTWfq7dwdDoTyd6f17Zr93F3l925OaeD8HKkK0xydxR
	a3/OHLbHuJkAuL6UxAk7R25z1zThdsUwZp4c5mTx/cSOPXGp0=
X-Received: by 2002:a05:693c:2288:b0:304:de2b:446f with SMTP id 5a478bee46e88-30bca0aadf5mr1738283eec.28.1781692674617;
        Wed, 17 Jun 2026 03:37:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:54 -0700 (PDT)
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
Subject: [PATCH 32/78] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:49 +0700
Message-ID: <20260617103235.449609-33-phucduc.bui@gmail.com>
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
 sound/soc/codecs/hdmi-codec.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..608a0bf28887 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -452,31 +452,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (!((has_playback && tx) || (has_capture && !tx)))
 		return 0;
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
-		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	if (tx && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
-			goto err;
+			return ret;
 
 		snd_parse_eld(dai->dev, &hcp->eld_parsed,
 			      hcp->eld, sizeof(hcp->eld));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-			goto err;
+			return ret;
 
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
@@ -484,8 +483,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +500,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
-	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
+	scoped_guard(mutex, &hcp->lock)
+		hcp->busy = false;
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0

