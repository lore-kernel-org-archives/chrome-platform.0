Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FC43655EA
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058112; cv=none; b=ZbEdhzhvItYVNwUJyj27APaG78NfVQo/CqkX1kw+NmFp6+K4U1aHtnbzwAKrtgrxOASouXvRIvXrovfImlWNnC4QRVLt9a6KapmsvlbXq6vtMUng/RLGumGJbsiOVdupZpxZbmMcCqhLE+xprW6+kSdc8K5Ip+y/xTMJI4ThX60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058112; c=relaxed/simple;
	bh=j0DXGRVUZGLFodFFZDuPh1GY1V1OX5hMwJceQFENsgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ws1tR0rsvdCy0og3RhKJGPu1mox+lGvuLkBpyBcilG7JBTsoAZb214WF+AFGMn2fMzvCks0DMoJ/jGpH3K6MfWq88oAEwDr+zJrGEujzNxisJFcwgq9oFazSGq4tMOvUQyT6vZavdrkzSi6CZUZncx9JIHze/HalnP1/ymF/bF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChtiFCBx; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChtiFCBx"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8423f236418so107814b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058110; x=1783662910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=ChtiFCBxceR9hrWKUSsKuXG++zW6S9rSwVdX2L/JrFZjPBOBQs0j+b4EVdSdZ7qItU
         djZBLWhzJpxOP1r63RMxXrw2uV+oqACyi4ohhfPGfQz1UFMju51ypcztecdQ8Byl8mx8
         gN02IubS4BqcRKHJL5Kmf4S41wyo3aDMOmj8nz3GJHkfeiil4gT87dMviKk9jJ0sk0Pn
         2hxIz2I0fRXg7JxiMy+uTGGuzaYJ/+in1+FnZNRC0YSgXsyMP7NOR9HfIP2BOe7lHTep
         SEPw5vk7ISsXwTFaJEy5she2pgpJ/fT+lic3sz5BVwQBtRZ4de3imBxsldSFmpqjOmjt
         cAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058110; x=1783662910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIImJGUCMEYSffIizPuc32WkGD23VTl/2TOsQS5Pw0s=;
        b=dS16TORatzz73soCw4w3Ve8ta1OrRFf7uXMI4xkb0COy1t8O1+vYfzfeKlV87GabTl
         amBnmybDImSHS53g5rYToD7EwzzJcOLbv13C9KVsToPrhhv06L5JDLH4HjHENzshQ9Si
         HSQbsksIOtCBwCs4BV/c+Hx3YOc0L052QRWIs0GnAOSMdSLYZXsUdJLvmCseiJESodOx
         DKz6Top5oY0wScqnSaCFkRkCyLGwg37omherzcwrrV+AqhfFIl8WpM5A5Z1cgTOYbD4N
         VJiQfuC2RATjhqi/ZHkJJ2U4yw5wjKuG2IvNhExnMvoWrbcKnwj+/vs9te+xhRcLF9ZC
         KZFw==
X-Forwarded-Encrypted: i=1; AHgh+RqQxpTpyeyB6A/S3vpR1Ql5P8eBwu058oU5988532jQP68aXjzDjwB+tfcJEgFGyC6/KJD4KgHGPUdALmgO0rA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvL3WUmyFxsLaMtD6q06/YUqDqtcoak01M4gAlj1dLKx4sLGKv
	tWbBXCcI8NGPq2IZXP8zwztyyN/LajLOhfPj4BpI1HslOgZJmFOs/JZk
X-Gm-Gg: AfdE7ckn9yA5gP6K6O/Bhvdem0hDjvUu7VzyUoVP44DfFhI6zManFDCi+6hRRapwlLe
	n5ets5fnGgbERvyiqXm3qfuc3jGd4oe8hlVfTXjc41tCaS4bQZZ1HGTHNZ4tF358HQ/+aey8gSP
	n1cg7rbzsAZ4uXxF6wRjSFB0KKFwS36U0I3W3Am/GaHjkTD0CJMylkGLUz4stz0MzSMjHseQXOg
	/mdvZ+YxWLAjjAP2GJBI9x+EIHT+t0MRY14rL1mwvOFlWH8LaBtTrnTb5mBiEZa7/sYmPny1yEx
	9/UQRjizmoIS4UnO10YDIDEX5WRREFDVXuzNu4lYGBeP+dXmGDgUKUkmQr3n70On24XCJES2gRt
	OVC3mvqASFL/5W2Ece/VLbVSVQY3NS341f3EOYO0OIbN0dvnPPm4CS4wDCiUmw0LRmlyOvB940X
	ctWWMU/YsmqhPp2QoSOI+ZClA7HwhFeQoO3mzOtPYR7BoLorg=
X-Received: by 2002:a05:6a00:4b47:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-847c5130544mr8170118b3a.34.1783058109959;
        Thu, 02 Jul 2026 22:55:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:55:09 -0700 (PDT)
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
Subject: [PATCH v2 06/24] ASoC: codecs: aw88081: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:37 +0700
Message-ID: <20260703055355.244898-7-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw88081.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index d5e886a8f106..a3cc027de606 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
@@ -763,9 +764,8 @@ static void aw88081_startup_work(struct work_struct *work)
 	struct aw88081 *aw88081 =
 		container_of(work, struct aw88081, start_work.work);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	aw88081_start_pa(aw88081);
-	mutex_unlock(&aw88081->lock);
 }
 
 static void aw88081_start(struct aw88081 *aw88081, bool sync_start)
@@ -942,11 +942,10 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	ret = aw88081_dev_set_profile_index(aw88081->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88081->lock);
 		return 0;
 	}
 
@@ -955,8 +954,6 @@ static int aw88081_profile_set(struct snd_kcontrol *kcontrol,
 		aw88081_start(aw88081, AW88081_SYNC_START);
 	}
 
-	mutex_unlock(&aw88081->lock);
-
 	return 1;
 }
 
@@ -1165,11 +1162,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	if (ret)
 		return ret;
 
-	mutex_lock(&aw88081->lock);
-	ret = aw88081_dev_init(aw88081, aw88081->aw_cfg);
-	mutex_unlock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 
-	return ret;
+	return aw88081_dev_init(aw88081, aw88081->aw_cfg);
 }
 
 static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
@@ -1178,7 +1173,7 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88081 *aw88081 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88081->lock);
+	guard(mutex)(&aw88081->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88081_start(aw88081, AW88081_ASYNC_START);
@@ -1189,7 +1184,6 @@ static int aw88081_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88081->lock);
 
 	return 0;
 }
-- 
2.43.0

