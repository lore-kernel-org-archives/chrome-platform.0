Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C533822AA
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401146; cv=none; b=Jrdk+++/95s0vAZeX5sYV3A/7hgIJe6cACfVy9BhO2JeezF7tcsVuGsTyluapw0RfUlGAl+1LG2ZgZU5Oxj8hRosHylNCuwGxYdP1HnjnZ66tStij3Xsf9NZxojkNnW+kz5KRLeAHlQilDGHl1QLS+0kCOvhPKTgEQosPY0H2uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401146; c=relaxed/simple;
	bh=sCVUN8gY1h9/nIWRmRiilIKO/UTVoTdwN5d1OfxbJo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbJC9xPRIuHLr7SliHmL49kY2ARwObhr8whKoNg4PP1IpY5Gbg9PjN72wAE9XEDR3q4QfvNQ1XLOUYrA0VYUtf1T2s7V/bxGiVAY5phxwk6JbHurqUCqtRf3N8WBIHgz8klSq7TLZL3NvHmDYx2e2XLwkdjwiEhAhO9U/buUz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8aB6WsT; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8aB6WsT"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-847e6f03df8so4559393b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401144; x=1784005944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwVA092wtCUoFLf5EkOcxNA70xG1xrrJyEkWDUrUIog=;
        b=T8aB6WsT0Iqt1XAVRElIiqTLXz69LqS3T8Eb4Ro0pQBtLtoilhQMu6V/Vux9bhO/JX
         A/L/+cimITlN310jJbirKRquO1J5oOaMT01Nq3SnY1wynCLJFpNMBMPjdKqO5rEIuBB5
         MVn9UmmrICmQo3Pc1Lqh6suypR8RNfJqRKyUHcrYCvFom8lrfLTX6Uy0+8G9wgBROfXL
         oQSB+oF/a5Jg+wKSJqOwSOX8C7dl/yuSxzX3ynzkvszO8Fhibx3r7QF7dj4/9KUQq1hn
         1l46V8XV78Gn5d9x4M4O1A+oH65zX3pYEFv1r9cw8YlpmtpZpCoXKKcVqXNs0uEG542I
         u7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401144; x=1784005944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwVA092wtCUoFLf5EkOcxNA70xG1xrrJyEkWDUrUIog=;
        b=Qruk2EuZNtcsr8yOoG8rawQSiqIiJoSdTSJG61gsU9gmQPNEEZMxG0Nh2QjU+OqiXh
         37PZdgwatnxVaD76WRZQWDe6K/23Ahwa4jLVrba3RVhclQ6f73x9Oc+zbcoT/T5aT+aG
         U81O1p1DKyyJZqEXTFHeS/HhT1/pbowTVytmB/KOu7r+kRoriMSJ/nt/txPuGf/GSa+4
         /Fd3V/2SVvf0QZJkJ4k1B0yDdSF0f2H8eqTieoRTo/TSLRIaK8ZzWZu2qJKg2XvroG9o
         swBbJnjP0taGYHSZseV9hqCsAOEZhzjNcbdPbztK81QHGLOpcGmzz0jqQweqeEPcHD40
         Oweg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5mrSICEwfz2733OQCP9qPll5p3t4wBlJJEPT7E4OnbJwq0dTb42oy51LdvTowbyLiuot3YbI+stl+ZPrBPd8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnM9e/UdUEeO1MF4e7kNaphQfiylZMALy6h9uBBEmU6FJu9LmM
	Kq+ZMHlO6jpuEnj+UxxVdhrvt/iIn3dbUKvPZqjAXrnatl3yk6l2BI3E
X-Gm-Gg: AfdE7ckAG7Ub/BZmBZHczvNenmJwkgbVBKhpYLrAs/bQm9vyWNyg/nd+GR1jDLx9NYP
	cuUtPb7t2mLdgGU54znJakEYKEUKvvhiJN6MvGF/ZQG/EuM8AgcrYhIK0wIT1gwAfrQBouorjcf
	59AdXIm7IxlEPYm7rGzP9yfzDQX0Sqd2EK21gR+ShaZuVnc9TOZbne3wwr0ozcSg7Si1GT4WH/H
	SKH//6mVgyQyhgtRdcy8Z1k8rXPQErbgG5RlG1MM2JQZK31bpot0tuxVa+FqMbvST/kFfJIfvF4
	FRuNLG3KhqEGQFF3/1km5YqR5FLNBJkT0kDAFu4W9pDa627OZ39DSN17YlUrWuBZOVKy3Mt/PeF
	xPGn/nI1mK6SaS/CynInFB3LOC17vFioYz6zsIN4WJbBCIZX5ggMGkX7H2drbssZAguzJGmSu9R
	WhPsWQKledfug1Az59dQ21aW/HxuYKkCe4VjbSSNVErJEhVGs=
X-Received: by 2002:a05:6a00:2e23:b0:845:d284:9e10 with SMTP id d2e1a72fcca58-84826e37c82mr3735337b3a.55.1783401144297;
        Mon, 06 Jul 2026 22:12:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:24 -0700 (PDT)
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
Subject: [PATCH v3 10/24] ASoC: codecs: aw88399: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:52 +0700
Message-ID: <20260707051006.20058-11-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88399.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index b2ec3503f7e2..67ea073abdb7 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -1140,9 +1141,8 @@ static void aw88399_startup_work(struct work_struct *work)
 	struct aw88399 *aw88399 =
 		container_of(work, struct aw88399, start_work.work);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	aw88399_start_pa(aw88399);
-	mutex_unlock(&aw88399->lock);
 }
 
 static void aw88399_start(struct aw88399 *aw88399, bool sync_start)
@@ -1702,11 +1702,10 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	ret = aw88399_dev_set_profile_index(aw88399->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88399->lock);
 		return 0;
 	}
 
@@ -1715,8 +1714,6 @@ static int aw88399_profile_set(struct snd_kcontrol *kcontrol,
 		aw88399_start(aw88399, AW88399_SYNC_START);
 	}
 
-	mutex_unlock(&aw88399->lock);
-
 	return 1;
 }
 
@@ -1939,12 +1936,11 @@ static int aw88399_request_firmware_file(struct aw88399 *aw88399)
 		return ret;
 	}
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	/* aw device init */
 	ret = aw88399_dev_init(aw88399, aw88399->aw_cfg);
 	if (ret)
 		dev_err(aw88399->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88399->lock);
 
 	return ret;
 }
@@ -1975,7 +1971,7 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88399->lock);
+	guard(mutex)(&aw88399->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88399_start(aw88399, AW88399_ASYNC_START);
@@ -1986,7 +1982,6 @@ static int aw88399_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88399->lock);
 
 	return 0;
 }
-- 
2.43.0

