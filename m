Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35535E1C1
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058165; cv=none; b=JZ0w8IKoRkQL/8XqCjR7fUmqNBHhQY9yi3daY4ZVqVAuO+i0Q+FL+pjhxu57v8FSZyE07Nf61GRszm3hYUgH/MZtigDg4hbIq1CZMO5hbNcUZhRFNo2ZMstTnkcYOrPgm0I4SYKqKeJj7p09U/JxQ8fBeZHEzI/8W9mlBi43RWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058165; c=relaxed/simple;
	bh=xf1+Y4i7DDOs0O8dNK+vscHsfEh8E3UCeUp4jxc9CWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMDGb1340AxGPbD2IoX1XPGLbg6Y8qWv3je4J3UniOovrOdy34I24wzcK0EY3QQRjp6ZKnKwJUm/5Z56rYIWILYBW1y11gz9DvuIkdLlRiEPl/8V7nfxRygQxXXXwG1i8dqeMPDTmgqTqB7uCcgt7XeNVXMtQxZMyrr6vNsuGhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ek/HzQeD; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ek/HzQeD"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8478fe07f0fso215664b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058164; x=1783662964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kik+twhWWss8HkFh8T4k8jwDqzG8SHK95ghDpc8SqKE=;
        b=Ek/HzQeDZgqtHrpeujHnxCfKuTCDQAzDZiKFcLUpx/qrHZIogffopVuUc9hAa7mABt
         WTs4E7Smf+8g8pA3Riu3wvQGqbgVkMk0QIYKZ6M0O3JElGafffbMuU8vFkzOrugTP2xe
         h/kaebg9ykSw3quCrNRM2Wtbl/1qhju5BnytF/nK8Jb50MNUQ7Qv3Yhrz+altoFFGsG+
         rfU09nGcveHRaHxiOxRLSXpSHx+FtkieRbO0QR4fZNMNKnAD7dSblA+4eokTrCNcnv2T
         +ZLzWfXfrX2s4bp6YNV2/i2JHbtwV9gm9TR+MHXNd0RDHB/b7bLhbMCY801Q4pZts7m5
         JCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058164; x=1783662964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kik+twhWWss8HkFh8T4k8jwDqzG8SHK95ghDpc8SqKE=;
        b=MkuQj1IWdO9LrmE7ZHcGTKc3R6sJGQML3ow8sLrDm98309n+hGTKKMqAXZByQjlLfZ
         BLIffT6nBU09NsMCpNzekHPWoH2/yr8oAu1nGoxW3xbft5raKGz99yHh1UMYZb6ivoNw
         3plBnoHereP4XCufMJf68cNg+z0kfKMrC5M2msiLVC0jjYpA2BvFVcbezRvqgWyEnEzY
         bEf1+fu2vEFlVKfp5rGB6S6FPnT7XCwuuzvqE870DpZMlOO3ynYEARM0GvblULXn86fb
         SPLPYLaINNuy+7ZXf6uan96+jK24/v7zcorHQDJe1WGu6aqYk1LbkvoZL7zt/1mqou58
         Cpug==
X-Forwarded-Encrypted: i=1; AFNElJ+V6mezZB5tpmIVx4xixnX7d+AejhjuiBCVx6NFwNhsMssEoIho4eUzCFkMXk4Yd7eC+hv61JI4NwuEy3ffvzE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgyA2gXHmVyWxzv+rBhUsXLNjg+IkZ0HULJoTcs+uisYLisBpw
	ACycFsgt8otNRpAGs9QyjIsIAn2IY39+YMtElPRQKEmE9RqAfqCSS/0t
X-Gm-Gg: AfdE7cnswSsGj4CUxBlAKlJeErH5sIBSNURgIXTYQruNQ9qeldQ2BMuyLiEqHE6cLT1
	SPCdiWucSB7kD9BQnURMpqFicNhoNLPhNTgdeox3zAvz/ppkpzfgdBcja11tHrJl9HyZXWa/OzX
	xkQUwvWMD9JaE3D3prhBp9xvP3OOHTboKo7at2YqOCve6BcpXBNW+SlfFvCWIJLcdjafzdcc5iz
	0Kv35c3Tb1wWVO8SF/FS4ltNuY+2jgPqpaQrqMTRg1rqugGGdS2+tb3MtMkUQdMks16DcZA/M8o
	zB1KeHwRyBGe3uC40T7fHjmwPg1lcMGmxdNrCD4Hz2Q6k7cJJTmBo9oPT8JtiQCSONYsaX6WEZ/
	fifUGgubNUQug/WCCJLlRPsFWPnMRzu5JndNkUpK0bWxcTpK6bw77C7CCtkiYxgSz1HbYoHX7SE
	VPs43YjMorNXLAmclGcTcYp1YrmttU6Uj0pFQBdnaD1v3MfZk=
X-Received: by 2002:a05:6a00:a113:b0:845:e2da:91a3 with SMTP id d2e1a72fcca58-847c082d14amr9241918b3a.30.1783058163603;
        Thu, 02 Jul 2026 22:56:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:56:03 -0700 (PDT)
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
Subject: [PATCH v2 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:43 +0700
Message-ID: <20260703055355.244898-13-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs-amp-lib.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 371e99205b58..41a9a5b005c6 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -7,6 +7,7 @@
 
 #include <asm/byteorder.h>
 #include <kunit/static_stub.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/dev_printk.h>
 #include <linux/efi.h>
@@ -83,10 +84,12 @@ static int cs_amp_write_cal_coeff(struct cs_dsp *dsp,
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

