Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD3237FF49
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401044; cv=none; b=gfYe8YaSz53H4Q84O2PILd09pj38cXreBFzGXjpm+yni7YL4O5mXY4SdxHBZHVb7qqER1zaU2wcO2aw9WIO2OxbitJBV6S3pbhsCl9zmolF+JUf6Z2ODk1NnGKMS3IIlioZVlDn7SZnghw5k3HcTsslct1dCczWUMthdnC8R/yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401044; c=relaxed/simple;
	bh=MN7hjUlOeJc0FO8mu3UrzRrAKjy8hB3fiHLBiWptOh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocZLmcaj85Nz9v8pmPR+lP5q1gL2Z7x9o6tv/htng0YgnwjOxWSbKfsUsT2Ssk273PsSIbbm1OAJ+jJKCJLOve6xxz1auXZCpDN8OR8kMQvldwFVroP8tlT57wKj5iBrXYwF/HhwZyxHYRLpvbQM7pczTsp8UKzeTxUNpxuf86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/S9whzA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/S9whzA"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845eb7b96feso3610309b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401042; x=1784005842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=G/S9whzATwDbLrodHpaQynm3FZH5Q5Tt1S0Dbtn/rAAqtIFe5EbzL1AdIr32hhWT0Y
         DDVi3U1svWYzP6xdhniHALlJo4hHM6AtNqtePEjreZMyBPEHlGQmBjGSwdbR5r+ah/sw
         0jyAwVp6xmOUUT8ylXeRTFQlC6OM8qV0F1ExM7P6xx+qTGlh0LhehwT5Jg1G7ZUnbrrB
         A+ZnfzTV19qNGqpghvx6l14JhF6oqn71Nro9sBoh/5oOUY7AYHCi7rlUIRW2RRg+9+Lw
         X+Qhd/FWG4KxLIDqp0yxf5cyN0XStwIFp86RnT4X4ui1bh0KW4Yfer0vKt5bhXXRLeph
         RDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401042; x=1784005842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//ABcZnuHlA1g5iBkAP8i3Vry09H6XD9kKuii/9o6as=;
        b=PO3K0g6AUuZkJ8X2ZtfEL1U39ixQ0UnCr0iv09E/SE946v0bnt1o4paWVmFX8iaCQl
         mF+OYGMC/i8K1KqNl4YfxriV1pn2CaitrvOw8eQDUMceTl6nJDKzmaE1weAVxoQ4GU1r
         iSgtP5K7FjWXTCpAu29mwe/BY76eSPVgIuOXqa5QG0jjODq6k0fIrLpK3GhL6W1jI9fI
         NSwhljJcQsQMbhfNHfbueSJrsrwuwsDOMHQlktDVrVVo5UYY84KwWNdUvOUpa0uVN9Nr
         eqIzh0oT/r0ul3rSqoNuGDzy8us+oAtiJbpncccCTabFEus7Vf4+apEzyXOMI5gbYeep
         jpkA==
X-Forwarded-Encrypted: i=1; AHgh+RruGNKsoOIoyArSa1iyw8I1BPQPGzMIJOFTCB+8k6RnZsO0osurI6gFR6nwEicXac5xIYcawYRJkLUzrh1fZaI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywof1OuNVdSN3DA4ZuXKSItw4Id4H8U6HzHr9W+DOL0YC5rVNdG
	uOeQaLkkngy0GFVhtQu6CpeV5QgTqNRPLXn3yXtsIE8aOnOD1Oy/rFia
X-Gm-Gg: AfdE7clrccSG1OTU3VhQdrBkIQYciujJBSORFJgVNUPlG3qn0pHcGGmpoR11dyfJ9oA
	IExOaib9WsW6BXRkXr0gshVb0onk1qktmrpW5zZRV/k8Y1LJXoJ4Fc0WHehAvsjI13s67HVtEQR
	jmpr6x/Ia5JFOALXNAPcIniQmddsWYFD+3C47LKqB5K1aWcuddl/aHDCG4bGvmZCQFkBX+UfL5j
	frsr9FhsP/iZyMWLFGJwGOUOtjYNbGDY/+UkJCl0rLcGconOV/ynEyXDs4/BV+hps49Lpofw3dD
	JIMtyCsLGYk2mx8OyC/b9xfJV9mn7RFRXXIUzO8cvxGUml/AeW6OOokOZhOddgEB1WMH6QaHeTw
	/+qElWOTPjXGpMoP2saAMZ+OWMTYR80mfvbAgkkemb8OUlHIM9tunsZoG8XMnplKBZ2pdOl3eOw
	w45D/vXhY/2T7Kelzpq19ciKbxQnmG2D7JDgReC7AsvHtswEM=
X-Received: by 2002:a05:6a00:3409:b0:845:d284:9dfd with SMTP id d2e1a72fcca58-84826dfe4a6mr3637636b3a.55.1783401041829;
        Mon, 06 Jul 2026 22:10:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:10:41 -0700 (PDT)
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
Subject: [PATCH v3 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:43 +0700
Message-ID: <20260707051006.20058-2-phucduc.bui@gmail.com>
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
 sound/soc/codecs/ab8500-codec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 6e8ef9cd1b31..2cf96cbdd294 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -14,6 +14,7 @@
  *         for ST-Ericsson.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -989,9 +990,8 @@ static int sid_status_control_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ab8500_codec_drvdata *drvdata = dev_get_drvdata(component->dev);
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 	ucontrol->value.enumerated.item[0] = drvdata->sid_status;
-	mutex_unlock(&drvdata->ctrl_lock);
 
 	return 0;
 }
@@ -1014,7 +1014,7 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		return -EIO;
 	}
 
-	mutex_lock(&drvdata->ctrl_lock);
+	guard(mutex)(&drvdata->ctrl_lock);
 
 	sidconf = snd_soc_component_read(component, AB8500_SIDFIRCONF);
 	if (((sidconf & BIT(AB8500_SIDFIRCONF_FIRSIDBUSY)) != 0)) {
@@ -1025,7 +1025,8 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 		} else {
 			status = -EBUSY;
 		}
-		goto out;
+		dev_dbg(component->dev, "%s: Exit\n", __func__);
+		return status;
 	}
 
 	snd_soc_component_write(component, AB8500_SIDFIRADR, 0);
@@ -1043,9 +1044,6 @@ static int sid_status_control_put(struct snd_kcontrol *kcontrol,
 
 	drvdata->sid_status = SID_FIR_CONFIGURED;
 
-out:
-	mutex_unlock(&drvdata->ctrl_lock);
-
 	dev_dbg(component->dev, "%s: Exit\n", __func__);
 
 	return status;
-- 
2.43.0

