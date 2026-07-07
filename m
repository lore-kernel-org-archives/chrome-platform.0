Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81383822AA
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401281; cv=none; b=LmYIUKjATMSzX7i2RvFyIZm0+7UQ3F7tnOnt/pTG/MiLo6yjlkrvOYlVt7ZZxiIDHHQ028MI4Vtf/jQSNnuLIANJiVobHrywiMuZaGV5iJW3u49gJ2cI3ymQ/JILil/ZmYPaIoePDm/TT2a2rTa4Q+GYhqLkJiHtWkER59j0Ca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401281; c=relaxed/simple;
	bh=IDudHAnlR+Q9Pih9JQC9jPGTfVHcOirb50Q8pWm1ZCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GtsPYxUw7BC2cR2fs3RSzb+92TwO4a3DjoSGtxW+iTBjmtQIJNk1ZIF+C/z1kRNo+0DnRfjvNUHmfaSsxCpab5xmO9m638ZkU+niYSEgIgM6iVK5VvP8ahfWc/Y5Fu8/FcIOxiP8BxdrAe1eIFKlTV/8RorbR9neVOZ/IWFk3SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gcab3eGB; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gcab3eGB"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84592b55832so3699905b3a.3
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401279; x=1784006079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx4K3R7J14qevcRQlQ7H2imyxPOvHjyo+blKhtQwrsE=;
        b=Gcab3eGBt3qGM/XfiQk1CTmDRT5IWQ7HTGqQzLmEHac2wcpfs9NoXn+hxs9u2w0x/o
         7WjBh5Gfh+XvVnyjVtjkvQ0D6EfCFSjxbGYQwVqCxRx5Bt2gm8r0dTqHEqxFoDwDKoTD
         X85HxPzBiCH2he6mUyMIBzDbXRyb2nwqsCOhX6m0d5NmiPvN0WT/CAt3LZvbidwajJlb
         By76zNKjMjmmeOhO8o839U1Diuq4uieiWNpTrwp/xvLf27YAw6/2qh8wTcQ8OGu/ttcx
         Zd2o0TbSwPS0xoMDrMzik/Yat8zpcYpTNYL5lyYGroUYTPdQt+Y/L87qxoHgIB2RCM/a
         se6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401279; x=1784006079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jx4K3R7J14qevcRQlQ7H2imyxPOvHjyo+blKhtQwrsE=;
        b=FOrKEKjs6JiX5Vx3+2iGLR9HZarDe7wOE4Fzyiq9iX2Lmi1G9UxFrMQ2Olu3kO71bS
         b+xM8d8DREswvYNGwwOn+SZv8I2jmaTFG3xzyQCy2G0VTi0bzIXn5LRYRjwvuRlYsk3F
         UGCRogdYr4OXR+nxI7aKsbcvPNl3toOhll382NaGpe+ic+zg+h0LpMpJQfY3wNt86Qag
         QQa7e8bSvs1e7tKPtspPHXXOpMFUFNIbr93rk4D7ohpkcUDIgVoJObdlKgjAmk9yGlNe
         MxGzd5t3ZSZK520bo6mBTTaZpHaNGVQF24NudfAJcyqw6BPb9xF6Xpb0najo43GbCypw
         OH7g==
X-Forwarded-Encrypted: i=1; AHgh+RoxJi8sPLcwJErObhFwD9CcN5s2/+XJ+0uHqx+VimbS6QqbAGYiOqTPyOnNqIRim8DXy1eCluzwOP8bjElPfWE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7EAksAE6tTvMfTY4IOZ4y95dyrwMOv4rxBRmTwTvRbESfnya3
	NH/kIKru6oZM2tOP0l0AZm9JqDGSM3hwrmlumceDJxRSq9b8rLw+yZN2
X-Gm-Gg: AfdE7ck6kwxTH8WC1hQOS8fR3HbBvrh6sMx44R4vo/wAkmNAC0teDcIYUpgzNRc4YLB
	CJlaSssq4qTnSxW3eu663gmmV8NstLdc1PyeQZmqW1fi9qox7sPkFoizgG5PrXEIy6dy7ucJ8/6
	8+onR9ONHM2p4PhGHsg4a88nQgz2mbZWet5sE+7HbgLhqBWCD51HdYRGq5FCkHJrQflJfdlz66F
	sLCQ4RMAswaDwffjuwxOEmopiGuSu4v5ZvjPz0jGwRSb5Y6NHktI8+1y8dmzGBV6hqf6TnidvA2
	uM8rSGWJ5iAhRGgZ+EjyDlhoi92eJy8hmLAtgnljjcgoJJXIc31VMIxnnsNDw2DGyggIw8D2+5L
	gdezz94cYLgkewstD8CAfeJIDsancIkJjxZSlY+JS21mmzGltHW5tRNQycqqoDWBVMvhjP+w8kw
	/7aH6DT2DXBIAg0JJm1jaMOFOa1AEOimMDpbItIOLaK6TAyho=
X-Received: by 2002:a05:6a00:f94:b0:848:2f6e:e52d with SMTP id d2e1a72fcca58-8482f6f032bmr1452187b3a.65.1783401279348;
        Mon, 06 Jul 2026 22:14:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:14:39 -0700 (PDT)
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
Subject: [PATCH v3 24/24] ASoC: codecs: cs2072x: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:06 +0700
Message-ID: <20260707051006.20058-25-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cx2072x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804..908344ee5892 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
@@ -1408,7 +1409,7 @@ static int cx2072x_jack_status_check(void *data)
 	unsigned int type = 0;
 	int state = 0;
 
-	mutex_lock(&cx2072x->lock);
+	guard(mutex)(&cx2072x->lock);
 
 	regmap_read(cx2072x->regmap, CX2072X_PORTA_PIN_SENSE, &jack);
 	jack = jack >> 24;
@@ -1434,8 +1435,6 @@ static int cx2072x_jack_status_check(void *data)
 	/* clear interrupt */
 	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
 
-	mutex_unlock(&cx2072x->lock);
-
 	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
 		type, state);
 	return state;
-- 
2.43.0

