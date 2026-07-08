Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D48451064
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 12:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515154; cv=none; b=OTsWtJJIOdJb4wkLlZK97LkDIewTuOy/Amw82e0aFhJ+6lPwyxgMIU+b+Qo5xQ+7GZ2IcRhqCovXhcjj5OW+Zu693M8STRfz3YdM30R/KMKZJPQgnI6/042apObcj5f4VIwrAj+guchYjabgPykHmkR6bcdEUtJhoRJ0NL2NhcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515154; c=relaxed/simple;
	bh=t0c54/72hct8lbrFEg8NJtCjqHP1Kp8F2lBkIgrtZPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUfHjQzKctI2QuepawxTI6FM5hHprnIQEqjPQrU+zagd/yypicZSEkHvFZ7oDo1pmIJEYqa0nwfoykpB6v8RLLoVOCA8YdWu3qNGYH3M6hi6GZb6vyXxMWM/fKwfvvO05hMg9xugMG5bFWNWEVsJtbAV3FR5GmcbEWECQBZmeYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My4sXujn; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My4sXujn"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so519665a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 05:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515153; x=1784119953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=My4sXujnmMiA61YrfT7AJ4kWaRyh3riL8zFH8R31XSlmKuYHq9B5cewErFz/pGCJep
         mqasMOITjb/W7SdisfWTivTiPql/M1/OLdEeTtqwipP1WFpl3/rfUggD/EZu7ZVyFh4n
         CGdrWCH255PVDhXwcmt9lXfyIoBmZqTOg6VcAEMgNP8LJjSCTx084K8NPKkdBHm0afrs
         CyRks75JaCnBZqbdJZN8UjvbJ4VgBOUeEZfMZN3VJ15kPURnDtJ2zkDdi+lZzd3ayfeF
         eX9vdn1XTuYLpVb4mf0xxPXhiwL767/NOp9NrXe7AgdrshYwzVmO3XgWiOFO3MNDk1mP
         URQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515153; x=1784119953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=pl/a5bEj0jkcVBTzBWlMVHRRQP52EHNDfvYpPj/wMEMyTG0sEU210AakibyA2fB0xJ
         QpuuwDbEHu3RptJTpzfAmbDhRGJXCJ9v5u29CDKwiF3+5Hk1ZNBVfHqvLrwFHRvc0t02
         8utys0n0WiJtKfIGoS68e4JlR6P4UtRj1d18I7z/heusLn7Cx/y0gHI4gw6bnH6CYwRx
         jyL7xjLAJGOed+4YkWjZzChUBRvfDqsUzHg4I8H1lJznCfdEHXXi0Rp1MlugSiDYloSS
         quEz0B9Wk4Mdk69pbAHkKuUt6+cBGA4WjZp8LAzrullLpPjrIab88eJVJXWFvU2f0Qoe
         Qtow==
X-Forwarded-Encrypted: i=1; AHgh+RrdSYxuYqg7SZ2cHGgEptYuEADnExkkzANKUCPsZjdL1Ewyn3sOQwn8rBZH1cNuyRxWyO8xNynVc7oWgUhMLic=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvMJKFBaX34fZ46QY8bmZiTr+SaAHzzXbg0ZW5XhjLNfMpmAQs
	8Wt2L1xkz/7QZM9uiDnbZjmjbOVggxs9OsfaFMQDjIoZdZyz76h/B/Sm
X-Gm-Gg: AfdE7ckOq/vnvcYRRb9ZtThhH3I/xRQYqmgHjM2GaiVN65VB0JBiB+2q3bJBGOcPee/
	YMDUyBt7uPZKmEidu8eii336nTLAoN15yVs3VbtW/+43vBodc3rRVeiMM2Qr/G7IIsN4Fbd2Acw
	5SQGCQtaGqIHQ+TJk+/pA26t8ICV0hFznB8Zv4ezZS715qTmLJxegMXnvX5kd0CMoMbsPp4kX4Z
	0XQeEAQPkoDVbfQ7GM2aFmvErCrp7tVt4vd5+5vgf2mOdGSnCCL01HCfaF8FPL5tjSTcmv9h+L5
	0zcVMcvt8kjfSLUx5TxkBkYgn0j5C5iywvjrH7OzjPznW1qdHzwaqL5ssbkQbtwGses6EgMyLAv
	h0xNHfkqloqi0tv9bpIDXcupuokgfF6RrRYuJX3vIBy+3RVA3yflWZmr/EyGhtc56DjaVa6Sx8m
	FvgIKQAAC/wjg6XmM0yjaLozW5udiEnAcAta46/4Jxz2F9TGk=
X-Received: by 2002:a17:90a:c2cb:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-389420ac578mr2725220a91.34.1783515153137;
        Wed, 08 Jul 2026 05:52:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:32 -0700 (PDT)
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
Subject: [PATCH v4 16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:53 +0700
Message-ID: <20260708125002.202515-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l84.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..36533a13319d 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -281,10 +282,9 @@ static int cs42l84_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l84_private *cs42l84 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	cs42l84->jack = jk;
 	snd_soc_jack_report(jk, cs42l84->hs_type, SND_JACK_HEADSET);
-	mutex_unlock(&cs42l84->irq_lock);
 
 	return 0;
 }
@@ -831,7 +831,7 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 	u8 current_ring_state;
 	int i;
 
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l84->regmap, irq_params_table[i].status_addr,
@@ -902,8 +902,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				break;
 			}
 
-			mutex_unlock(&cs42l84->irq_lock);
-
 			return IRQ_HANDLED;
 		}
 
@@ -919,8 +917,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l84->irq_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0

