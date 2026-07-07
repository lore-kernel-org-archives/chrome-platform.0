Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59996381B10
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401198; cv=none; b=DXkYYMAT34aO2Vsvpk+S6agUkI1YJ615GLBlO5jj7711A+1uJueDxonIxTxar1VsKIRqMkWds2P2STp6SMln9WnFQOwZGmGKPQgJenCGV9cZCC0PJPk7l+ebyVsCw8RyJMddx5SL3tT7y5Ep/fvR5/BKn8ro3b+K7iJFhZTHQ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401198; c=relaxed/simple;
	bh=t0c54/72hct8lbrFEg8NJtCjqHP1Kp8F2lBkIgrtZPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4gaXmSNj8ZAnaatT2paoaVwlXcoKID+m6CoCEIVQDbQYOj+Iv6jRinDbFVFEtgmWt3pFiRRh007VNwcII3BVDqqEdb3wE/WmyAhr9YGDz/oDB8oExU36imdMdFPpIAVfNhdsfQ/z6qpurmHJ65SfA33iCsiA379CZtv+oNfUHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLQv1IH9; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLQv1IH9"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84783bce476so2716419b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401196; x=1784005996; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=bLQv1IH9VnZCRerieahExPJ263xqH7RUT3+c27adKZbISL7gR3eAtHyxSKwm/sU2rU
         BupIC3uKrBqv0wl4F/ueE2i+9onwNVg6sM+OctCFc/AcGFGCQHRSXzrBZxG24eA1KXgK
         q2j2ByiEiyJ+qOuSc+IgDrd9xFpYkukrLnuxzmOKcChoERjfIJkaQGgHFGNsIDqVkE+h
         UudQaFCM0FZTJmaYJv4dOX55KT2Noa2JofjbVChA/G9/Gq2zA2L6MzpvSk6ujAAmIPYQ
         nbsDHkDPVpqaz3pV2ljnjrVnGK0imnuHE/crfuXeJzdJ4s6XPUltE4zyww09u/h1Kj00
         2dnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401196; x=1784005996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=ao5Ft6StiYK3omeUlWHRK/72uPBTGPAHeHjE2SMfPkXc1L+wLAe+02PY44I/JAYksD
         ChFvpsS6ydMETvfYTTXCFrE3T7gVokzTPVKKsRbkpWu52j08VjJQ/Z9qYfXR+l1/BfDB
         nafkYH6mcVIeIruNwHSPGghU89nsJaItOXYf/sOUpL+3OUOdcnYo3vuzzQ5aHfKUOH+Y
         304q4ZVDZW6XC/zRT4mUBA84AWbjW8vtSIX0NSCfgUrFhG+OO8ZI9wwfx4VAgTvD5OA6
         LotP7rA+UWpIDFWgaq9MaXNihgHCYxt29zK3Kb0PKa5EQ1xMVoGHoCGkfRNd2UF9v9ml
         wu1g==
X-Forwarded-Encrypted: i=1; AHgh+Rry/KKZDpkIy4EveAfz8bEmVWH84AivFSO4Li1T0CgEEt0Qb8yTCdOO1w8ZtwQCErFtFgHHAwhK22+57Stjxoc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbQEFXXIlnqzeadYQdLujQGSZXWZLZzZh7nmZFDiiWDS76cpXk
	FfF6CubEKKXTAIiaaPbOb2JoMGeUmIfPvVn4sHIYdrkJ1Z1cEpkdBY0A
X-Gm-Gg: AfdE7cm12ykulB0f7EtngouyFbhSoJD7JuDL+DLCmQ9fIalEB6+AaGr7TLQ1tv7VOQB
	IrJN5EKW3AYnwfEf4+HDDVrs8bTKxfSxCPze+sCPQVmLluQiL1GfHm6eYw791DNIgceVge75NxF
	17MSHRvEpSSg7EdqQrgsmpXukqc3QftoepGcKQFJqtgw6PtBnfEz4AwaBWcAA6XXkM68s3sq4yd
	1srgpmCtgp5a2BnyicWtfSqOyY6yRz0P4CF1BOkspoiHGkwBeGun0/uN5DG3dldFyUfW3ziDLyj
	bsNpEavIHwuo9EZqartG2Rqs7U6hDH0KdTr/EMYtN8cCDsZV6BcxPUayLmcovaf9WIzVh0RS/n4
	/td0gCUpjG/bsAbkHSX+MbdkvorRzho9kTYlg9Sx2Qb8sfyysPADLlhD8k3isi02gtpJESvL8p+
	lVUrWTKAuO5Qv8VYQeQ6pb9KJimXROn9V9YsEJnrkN/IGeblU=
X-Received: by 2002:a05:6a00:6c82:b0:846:c7f4:74d with SMTP id d2e1a72fcca58-84826ecc0acmr3396135b3a.41.1783401195584;
        Mon, 06 Jul 2026 22:13:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:13:15 -0700 (PDT)
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
Subject: [PATCH v3 16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:58 +0700
Message-ID: <20260707051006.20058-17-phucduc.bui@gmail.com>
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

