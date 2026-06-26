Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CBB3D566F
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454562; cv=none; b=lOOA2zfZeDOnvgcdynsT/+CEif04ADfiIeZOrde/R7LgfCJ/1jEeouA7x7/gHKrw0vV9PZn4tDGaqigqRCINaIAVO2tqT9Z4jrhd7mJDP32VOOs6ePehowz1Fik74NDb9VYAdJXLeJgIrc3T79N6GT+Cn97DuCBJv9eWyxUiXbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454562; c=relaxed/simple;
	bh=30u1yCFnqEUYv19yUdILx4u/FILeLQHTLXJbU/H9wec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hx/vVNLj6Mvgo1jDFqpJ3sBnzggoJy7Lmro5uorYZ15t7KEgJQ+jSph54JdUyj6viJb3JJ/9XC/tQH7QsfufvQBLUIIgwyfdOJ0k6WFigR0o+sLreQYON9Wrtsnj3PnOJcGQet8CYIBKRwJ/dfpx3PHM3tIy8YN/MH/8ePoMd6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8aCSAVe; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8aCSAVe"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37df72f4705so432475a91.3
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454560; x=1783059360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rD+jveY6wp1Qp2f/2vAi8iv6onv3PbIlpebXHAxGHGw=;
        b=T8aCSAVeFaTNTVe1rgcKWGfUpKi8elwW2roQKvuImAPdJO8kWzhu+GWykTJbMLuT4P
         xzW/E1x61xYlUaMjkJiluxPpzGDk/cZxCLEOAoHzBiRAWfZFMdbUlhsWk4KNwml/A/VF
         uVSPnDEkzXc0uhACSRE2onyAPrVxX9yYR65jDy6kSVq3CTUlHKv4DDjhV0Kd0v/PUPLY
         sJVEOJpY0V0MCd51dcbFLGDdPWf9GTmre3f18X8zFp0/TpxVTV+3tiSh/tQ2qPP8P3X3
         ViQjbWTqobofaC6xi/5IR4IUNw45IZ5hqV5DMwEBFIn+xzR63FaaumL8bU8GOGx4XtKv
         08bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454560; x=1783059360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rD+jveY6wp1Qp2f/2vAi8iv6onv3PbIlpebXHAxGHGw=;
        b=Z2tVaDA25x+EMKyMjUYXRKXoV8rYZ0lvkju1PVbXHlSQNpdnyYia87S8KzkYvNUW5p
         GAAy08QNybtLGn/wF1LKmRvnPaveh4eApPYDBqQ8XDCnoVDiyyeiQmNWoaTZUmeXObQI
         /xIoY+iGsxgFOVJLis1wA4PYb1/WCMbYO7U8xjhBZv6T94eW65CRysGaVubRIclswPsq
         dqfvnPWhr5TSAlwDc3xbTgDn+U7FIMjMdMu/OwAi/uHV5AE2AtLSc2fqEk1xagTZGqln
         c12iEw0i5Yz4CCvDwZD4NGv9IbW6s5M+UZ1pAAZk2QoNo23otCwR6L0NQjG657BygR2r
         vQ6w==
X-Forwarded-Encrypted: i=1; AHgh+RqINvPh5NSE4nXz3D7lc1SNUG8FjSWM8aQ6IP2FcKwZpfTENZLMsu+EWf+5Q8Vzwr8burmnTxJuUYaHsRzcWrM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoAHC2D+kYh0Vd9HBHXJsX7DUIQ2U9WR4Zzr9m3eMJVPT7lOWP
	H1v9JXDUmPi+yj9tk88f6B6bZ0yknUSOe/lVnCDvQZeAAIqehv8mfedx
X-Gm-Gg: AfdE7ck6Y/GwIgxgi6zUrZa6Tkpir3pb6WZ7F/ypo+fIm7efYCYc3hWtdIoKe/w1CPg
	s7ZVSG9J8Ks4Q/aCvwUE797jeFQEd5/Gi1ZcXQNtUtJnbGjq2+58Dh4gsF2x2KeK+/YqYnSbHg9
	5HAVBd/n9+XDnmS1QYYpAO+MLCq1VruvieqfRE7yl0MTGwFCu97tzDwUvMh9cRPcHSteH+A3RmZ
	DQc/GOtrX8xWaDxA6Rh84zJkb9xviiqrxVEZ+x4ml22s8FP3MjY1xsGa87mKYe7n98dZzNHhJEC
	AoTNrPXkgK4PpZHfRurXBDKJIBpdv7Rpxhjm1PkY34+2AVtqc4Q6F2i8rjQazKP9tRJj5bVU3SA
	NNMp3UY4qKKhueF3ia6glW/iA/NiTcIR5DyUmNizwJmq/nzXNUJRSwbVQEpMohvDXE40Y7IKfZ/
	+oe6msyP5QGglTsGVlKMBo88kaojeWKSosTHEAwA+cVYjq8Cg=
X-Received: by 2002:a17:90b:3c05:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-37dfa250f2dmr5532632a91.13.1782454560385;
        Thu, 25 Jun 2026 23:16:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:00 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:23 +0700
Message-ID: <20260626061329.23264-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l15.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..2f30dd834709 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1285,9 +1286,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1317,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

