Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4709381B10
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401163; cv=none; b=kE1Wxa7GAnB1PbU/2sPJ7HHtaFBNxUuneypMiIdEYTAHEoXmGN6NktxtYrlwMPuRV24RW0eLo2iZyiGw5LsmzvFuFNJ2LGjlPkQ5AvAGt1WUnavDheirrwQ+OyKywKet8AoE0CwLrKUBr7SYi5wakiMCUDFE+P4X2wwg2bfs5Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401163; c=relaxed/simple;
	bh=/r6IWp2lq/IqX/xitXazGqvOEQK7A7aRycIG7RzU7kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5zhOnZoY5q3u2efRte6B5JkPuBNM9sQ/KsvYtjS6F/cXohHyOozz086R60PHtgAy3YOTavUJ0Nmc/5pIdWZoZ3VOS+h89w0SAdTKMDezboTqAQ28dAJkmQMLemkC0EG7KpO5NN1VBpYnh347iHydWe7KVvu1NkejooqZqC70eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/RZDarV; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/RZDarV"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso3750673b3a.2
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401161; x=1784005961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=C/RZDarVF2z6ZckSbIJUaerJqH9jQTuwM9ZpKBOQ5jAjJCHFlT0kqY6IJOYbBHy/hY
         Ts+3uXEMqUMJvMA7JclYC3opAb4TGBDtQBY/LLRq+RQ5VQ3G+uTJ5chjtBEPQhsA+8ri
         e6q3w8c/9vn965LWaCI3J/lf5lvgXOzSzrJ1r/2gNs3IhCANGf0XTNsGUYbtQNItb8ze
         6CCCosTeoZ1hzxaMFPMqsKNTnm632/pfMpNlFX6bo4fJ64Q47ZUbXNZToNECn3zUhTYR
         p9jOzP7pDLTkIe9pergj7u+ujydfarVNfCA9SbndytYwCSy1T9uARoVc2EQSC8kxL5wS
         52Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401161; x=1784005961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=f+GLN4CyPALiIeH38+kmvWaHvKIYdU/eBBOHFlF9OqLykH2VJW30XaJ2UFrqye4qQG
         jQr59J2EBxXUArbvOzKZm7d98FijGQ+kxuM+TPUHF4PWe2w4YtZJdjb/5O79c0zqCUud
         hzs2y2I5eOqwY0HkCdnohd7K4yYrhPSL6m7GekCZTG+NfjSJXf5BRp2CoKfdfwzqPrlO
         vPF4M8mDfLhk6plowrwaMaHGly6zDzf/g5sWgxnioGMHfm1Sx4zKcLOtNjIoEy0u//vF
         aLGnObSZG6pdUVz9PR3WPl0Wlv0GttVIqzv8zosjo2GdG3Hxrz8lJ3JrYF2UEQXJdEFJ
         jMFg==
X-Forwarded-Encrypted: i=1; AHgh+RpUsosQ06Si0OKTInhXYhKpz8WzInBu4i8tJK6fNte26yviNejz9yOTX8KIacWm/h/Vq38XboAoK6L9wI2P3ro=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrFzcQ8xZjHng3+GqI7BgNVAr9K7Y6yPubXwKGAT1vGlW2XxXb
	YOXql+KrURDI8HY4uYtVObcqSB1Fz7yGFEOMgdu0Jlj1FoOdvY4dhISP
X-Gm-Gg: AfdE7clo4OJerxWUaw7n3a1R+YCPS6RS6faQxjWKllbG+zFN+gIGs58tYHjXJkey58B
	GpZNj6cfN6Yw2IGycT8Ch4FukqjC09/HC1PU7NFEzmSo3T2TF92W552sCjFUPlVaEh5Tz/M5zbZ
	JLkYtm3Xv/OrxgUB9yHvRBDf6pJVLoQsjV1OtADajwNN/4i0w5T7zwptMar2+CRtC2J7Wbx8Lql
	oUZcm45U47ykIwAeWXMuOKHRLXIOmGzLRulfnqHQ6VM6YgmObFiIIbL/N1AN84jjlRRlkB9nK9m
	3wfc414OE4zIcWpE49p6GPupKbZ69NLZiwwUqOH8lRN2c5ENGOOXMzJixrPI+HaGOX79tzV85id
	4mIgT4Pc1DKsBV0lcr/fkGsvHzzz/I7QQrnlbk1A7PZvWqugILdEPvVxwADe2FF3ROc6gvSjoK1
	CRKHA7+ZOpmiYlPo4voHwDeAkPJcCt9/p9tOslcufgYs6Xvto=
X-Received: by 2002:a05:6a00:8d8e:b0:845:c662:2be with SMTP id d2e1a72fcca58-84826ed02f3mr3771280b3a.42.1783401161134;
        Mon, 06 Jul 2026 22:12:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:40 -0700 (PDT)
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
Subject: [PATCH v3 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:54 +0700
Message-ID: <20260707051006.20058-13-phucduc.bui@gmail.com>
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

