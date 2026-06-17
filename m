Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A849948BD2A
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692699; cv=none; b=pSsiHs2Abxt/r7+x1pzID38eQEK84D5DkXKKkpH96JV+9JwweMS1Akd35bPY/UDjImcbf4CYoZ13rSnQ5AIIadrPnpuwa6ZWa76F8aqEpAMPIWKsigtmqdegQtWGYNpBABo9J1RJ5fS+9SUEj+x0PPivG5uV1OrQKGnDqMud2sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692699; c=relaxed/simple;
	bh=nSAn+IvomI3poT2XfEpySfMVhSrZidmFTXRdJVEBP6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+gD0IasiIAwgKeNPUFr0zFrtu8UC+00blZBgP736wAjKdbuTul5sr2ZJYhxwVowAYU6I/tVLVoYWykPEnAdpbqfiCmnOlS0FmAWYl4pbP+EVJ/NUlia/o0lzmsQwFfK0XmN0H4im8cNyXID9//WneAfXShfkSxRXOqNPqbJbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdbHqxtw; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdbHqxtw"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30b6dad2382so6294422eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692693; x=1782297493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbx3ojyGvZm0HFvzH2fDjGYEhzXxcDovZmyIxDXeLB0=;
        b=mdbHqxtwlDK8eMjkQyW1KqCOg2Xzc+LEN11KpcimPAwbr5Nh706wp8YsfXC2i3IIn9
         xbBDJpR726iJ5vt17PA3gyt7g2COf2OSjMNZ04sD1vD+PWzLe85SdJxwfYkTzTdl3oVB
         LNZFe4HnDMUYszGZyaNQjIFLX5jaEsu9yubbwiSpBe2wKZv2em9rj/Q+brrPRjSMqYoh
         Q3OBthNf9jrrTbsQyXjsq10RHsaTdhqi0y+N1QxgXuzyq7GCXRmkn2lQmbs3qtl1sY77
         i4yF68pGt/DKCH35HKNK6Z5wMWpHw4m4A7myAyBstSC35vNoWZ+FY/XSS1cxrcH7U7RF
         xExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692693; x=1782297493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wbx3ojyGvZm0HFvzH2fDjGYEhzXxcDovZmyIxDXeLB0=;
        b=F41lQ11WHkWjin4cdpelTNRQDkpm3NlZPH/43zh3zOwrfXgKY7z6uOUV5qWY5JOAQO
         7cX0H7YrnJpJEXFJAiKbfpH96U9do/PltJPqQIqENs8uf/plY1d6ryBTc4LuVlMWqsFH
         x/96wu1HC9m5rRCk0+4z5yUfijPLa/UzJM25bAXOxzqpzkqMwcgiuRxUiGxImi4joQ1s
         JjwSpM6X0fTF1OMpSBWPIEFAhwyQ7xV4YQpW4K1C+XhhIsJOwp+APl1wd0zH1DI2pKDw
         wKLUnsmrPO2OUv/qTqpS1r4+vsjgdetAdUlw0lp83EM8WnlIMKvZDx7wh0MwZESMv6SZ
         bXtA==
X-Forwarded-Encrypted: i=1; AFNElJ+qSQr5Zukx9LF7O5VbZeff6mKXCaTGWgGwJFuY1aeGmmtimUsYfjc/aURwUHHnWj3xNO4nCVRXzFEFDfBfY1k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf/cqZZQDrU+sxzVh3W6iPqHGL9rkfBt5EceDpWnh2iRVc967L
	17Hb/0GYo5rZkWaLcnLtg3bmgvZUq+6SCXfwJiGEzXEjmsA9HuWQPC3u
X-Gm-Gg: AfdE7clWivJbrEbrL12YH49xoE5bIOz9hN0gKRy+VoNrTUggtd3FmcFsy3DtxfbLMPA
	p9EevWL0o8mvS4mplBVUqleb9/ppHQEj4sJUT4vmZzM8b1yQo4XJnJMIOJSAnNGWw5gky44zcRC
	TrqLYIpLma2UDUd3wQO1B0cOss86800l0LpLLpdDoHvUVHsCq1d874iHVUOHxioqQbEAVPgLGLm
	JQzN0sdMHVMG1Api2DX/gMcDV4qTkxI/yJxdScg9xStOQZHsqRy/XMhHcjypD26R3OMUVIPGxx9
	k/3qn9PZoWSdkukk2lgaOlwLYeVqTQvpBvit/pyxrVsbpx3JYJ+NrD7f2FiQ3+GScyx1QIT1v2t
	Pe7NRPukNi7hegQWcDaNuPRxQ8o/nm3K7zwoImQ+Cbnd5r3OsTrEC6Xft96uvLrIYwa2V2ocet7
	fMAVs8R4y1QYEB+2MbWGXWt6qRtZYzWIThevXpbo55KBrGR2U=
X-Received: by 2002:a05:7301:38a4:b0:304:e7c9:b528 with SMTP id 5a478bee46e88-30bcae4246bmr1408050eec.30.1781692692655;
        Wed, 17 Jun 2026 03:38:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:12 -0700 (PDT)
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
Subject: [PATCH 34/78] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:51 +0700
Message-ID: <20260617103235.449609-35-phucduc.bui@gmail.com>
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
 sound/soc/codecs/lpass-macro-common.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6e3b8d0897dd..c8c4a98fd765 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -71,21 +71,16 @@ EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
 void lpass_macro_set_codec_version(enum lpass_codec_version version)
 {
-	mutex_lock(&lpass_codec_mutex);
+	guard(mutex)(&lpass_codec_mutex);
 	lpass_codec_version = version;
-	mutex_unlock(&lpass_codec_mutex);
 }
 EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
 
 enum lpass_codec_version lpass_macro_get_codec_version(void)
 {
-	enum lpass_codec_version ver;
+	guard(mutex)(&lpass_codec_mutex);
 
-	mutex_lock(&lpass_codec_mutex);
-	ver = lpass_codec_version;
-	mutex_unlock(&lpass_codec_mutex);
-
-	return ver;
+	return lpass_codec_version;
 }
 EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);
 
-- 
2.43.0

