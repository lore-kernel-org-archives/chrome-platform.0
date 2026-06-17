Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B722642DFF1
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692495; cv=none; b=UgUXdQN5TBgtY6vOAwd4jEUxPNzSddTx6B2pBtzZlnoA9mv1NuezgGm4E29HXi94D5iWBbREaZJ2SVm4irnh7iX564Qjk8Xc9VpT6kU3k8py6Ky7GE13hS5krVEir2nJdQnOLNyvvumBHPFdOTe2f67fhKOxuTib6dlYfYrO03g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692495; c=relaxed/simple;
	bh=qLQobdW5gIrudjNz6FSShpfXoey+5PZTUBEUnyJC5w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vb86r9hQ9vGBUNn5mjdPzXG6+fNQl4nFqhfo6YXJgbsuhmHIj9+knHDSqR+oYevD3RS9OIwKD4v4l1OErZXObwp03r+PXw/Wl3drw2gzC/I5x2QGPxhieztxzBU598/yV1OBdUWVIVbw0i38GVKcKf91nVJh8rWePe+iaw4FRgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMJCjkeE; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMJCjkeE"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bcc877b4cso1623000eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692491; x=1782297291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVnNXvHB/XG4bW8ZUQAyPa266uqezYexJnyTVAcxD/4=;
        b=bMJCjkeEoOu0xq18Et9JhTdVLN60Wxc575ptg0OouOzubNlYmdIP2mCvLgOSzimXep
         kFCVf7duOV/vx8ZxHDQLI8I3aW8D8hEKyvqbsKhvZm5OTWkTV+qoz5bnzXkLt6w9aZKb
         lafQiuYAd38wo463fAZgHv5t2Nks0akcT8PLmN+Sm0KAUjbrpfxqK0Wy3qQBv7/w3fBu
         F52/RgsHHagnxg0MpRDHPDstAhLvMfIMkIVxu+lTH0SUj/Tdrbpo5qKVJmIF3YsymHvp
         +jgPCceHHHBatNe+jQ5SKMp2j0LYKa4km4613+/V2LBn0FDcyK/rftOKhclawgXxJWE/
         I9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692491; x=1782297291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVnNXvHB/XG4bW8ZUQAyPa266uqezYexJnyTVAcxD/4=;
        b=SZep/ct1SLMSGjIy9F2YJXWuKfO67gFMUXrORfGLM4KDbxlSjyD9TFv/dZ3BILU+rI
         hMVemKw88ln/TrKkSH9FgxLU53wJSG4+35U3aI3PkZ1H1+hPtPjGkLo71OgU0meyXVsK
         N9A1Baw8pPMUooQS88wGpvw9wiXCmx5Msr727KsnfMYJdWeUJ++ETqQNYG0fk3s7UuFb
         EECu3AW49qmksrLVGEfPXeCEGG9oUkgEOi7qfwvhhxvB0c751uKzotsGwnHKKd78KWNl
         tV/8yf5PjIZ6p826zUYEYJA/Z6UocLJWf30ly5CjnG9VSM70Y2J6EWkTz+cPvSb4JhQZ
         yaaQ==
X-Forwarded-Encrypted: i=1; AFNElJ96Ja0YCdi8p2jE6D7rl11+Ym8a0inZUV6ReMkGgOqbiqZd9L2EAHcUjWNjGtrivO82B4kmgeNagk+p1oeo9m8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEZOOeUnrDRAF29WzMTN7y5QNJrRWwYRg5qIbLJMkvF7Zddskr
	Eq1Hqwu1/eqljV/1jGZP4Y/uwmoV9YgxOR0G8ssOIBtRY7u56mL0OkZo
X-Gm-Gg: AfdE7cmtpE8n2RFp+ZmzjNWw4unDV0auNkmi5Ts+Juu0Yv7V4xVBUSbixR0kGi4t55U
	oTRdcYTS6f1O8+Gupp+A74yUj96Y+gA7GtkgCGdIwNQT3h/IvmoLAS6UbFoLh6tgXmKSp9QC8g0
	CzTOE7whVP7lR0fbaLLXtRhZ0WNOsTlhaMk6cfBOfnAFBLKDnp1DF2YbXurwWAgsEsJQstJ78MY
	ESu4LCLUSGHEJx6+XDmXpmKULn1pQIdSfYq22C+iUo9n/RVFnzxKZnlsPdlcZtPK7435DUibGiG
	Qrhh79d8A6teOEmT2C5VCqxEIkZiSEWhIzP/QTWxzqR/95Z4PpzubeYCJPqCh03IHSI5fa+IDlJ
	ojZeAJobfldaZbpOQA1wCzc0GQlXhGS9MqdmJjZ6bC26qlibSYeyGf50Hw4TK1L6c6Q4qUYMdXp
	LCmH/Xc95H+pj8wqtiVua+2C3kEx1BgsNgiAmshkqjmq6lOJ0=
X-Received: by 2002:a05:7300:230a:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-30bca0e33bfmr2065004eec.34.1781692490637;
        Wed, 17 Jun 2026 03:34:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:50 -0700 (PDT)
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
Subject: [PATCH 12/78] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:29 +0700
Message-ID: <20260617103235.449609-13-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs-amp-lib.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 371e99205b58..36da474f4370 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -83,10 +83,12 @@ static int cs_amp_write_cal_coeff(struct cs_dsp *dsp,
 	KUNIT_STATIC_STUB_REDIRECT(cs_amp_write_cal_coeff, dsp, controls, ctl_name, val);
 
 	if (IS_REACHABLE(CONFIG_FW_CS_DSP)) {
-		mutex_lock(&dsp->pwr_lock);
-		cs_ctl = cs_dsp_get_ctl(dsp, ctl_name, controls->mem_region, controls->alg_id);
-		ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
-		mutex_unlock(&dsp->pwr_lock);
+		scoped_guard(mutex, &dsp->pwr_lock) {
+			cs_ctl = cs_dsp_get_ctl(dsp, ctl_name,
+						controls->mem_region,
+						controls->alg_id);
+			ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
+		}
 
 		if (ret < 0) {
 			dev_err(dsp->dev, "Failed to write to '%s': %d\n", ctl_name, ret);
-- 
2.43.0

