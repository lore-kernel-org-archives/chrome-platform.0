Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5313D3326
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454436; cv=none; b=JL/YcqmQwoPmP5gOMHSOYshuZPE16wdVQ3cQ4xloHchdFaQWapWaRq8N/em4EOWutUamUub323hGgz+ENiKDXT0nYo1gkrVgq8Lhn8h5bZn2Y89+WVO/Zn99pDGKtnKv/t6/gHjTO/CUG9vK6BtJWdJTBCn/hJGQNs8vzG/J7a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454436; c=relaxed/simple;
	bh=aeZjPmGhDWlaPCT1RRDfgeSEVWLZ95Hfqxv0L4cptwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eh0iR75/25AirDDX3niNfbu/Yt4zQXTKFtAJTGbrAsc7SOw1IsQ36VFzGhL4SFu3O1yYvaXYTi9uLIniQ4pCS2EPRQGJKhODNEMPUAdxUAByWbSm+2sLRWCgHlCa8lxf5lRNN41RkO9Va8PVRM/3d0768pJ5OMXls1bJOIYNDUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsDAzJH/; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsDAzJH/"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37df9f1ee33so283342a91.3
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454434; x=1783059234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=VsDAzJH//6TlRd5W2dQcqb5OjhG38NI1y2/4W05ui9tluAXQ4mahmHYoQe19zj+e8Q
         ndGCGrmt2m588dv2Xo24A33OP89mfHU+xxJKzmWfyb4sET4Vz/i3MGUkliEZtCBAYsCU
         9cxwyuQ/cbJKeit85/vuZQhE1gbq6oyE+3f5ItTlV58t4gQTsyMxtztnpiWyXW6JoaQB
         tGfO6dWfnY4TxGonN1t2T5+vcULIX2GgaEQeTLglRstprM0yFBXIUKLisMqtqUwlHBTh
         GoLmF5lwwELTtE+gt95J4IIL8swk3WL+Lscl85oTjJdmsc1gGHo8hKDRiAvytqonbcl5
         GLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454434; x=1783059234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wH3PeQGMbk7TOW2LRX9VqMPl97RF/TvWYaO8+1NfNuc=;
        b=iKJOro4bspaOUx+BIE0cdkUPU+TFEBv/f/cKvSTZ51QumCrDJQelRiFWMYKOh3d+Gg
         1h0M69tzYctet7n179VJESUwA9k5F7pQZFmQujzKmA8a6rFqnnq8xq+w77/LOvyM16Op
         zWEBaWoAa5ZeAIGsyIiqpnGnFecY5A1oE8PCjIMkVQPAa5dXgAaCdVshf5wJxL+vgjwc
         T6lXFb09uT5xYLMy1J3NKMF01Pk2oau+uxN+YwzIvA5R2RUGEV1Z//WOCl9OyUiIZ3Ir
         FYBWncqdhRiPy+yKCZqEJVAZeOiwgYJe6SGS1f2YrijFwx8xzJDWIY/ovqh94Gznx0pX
         RYBA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4oFVBS2+JuN6PTBgFdhUVr1QNxJzbUnBqtmOzEff93KP+cBnRqntmZ+A45KIYlnrWpPzDpSYe+vzVEkufNhw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCiZqHzjAi1c86x+AL3C0WiXC+9R3E5AVGSJzFtgMxPRFkxdO7
	8nA9Oy6J16yXWLKJ5UUGejQ+j+A5guwZpOCUzXUkX4z+uE5ZhAnj/w5F
X-Gm-Gg: AfdE7ckI043Iuhd3n9N3OYL+V04v9RAguQ/gVNHB4d6H3eHaJk4Trj5t2P4bFx4iSXO
	J6UUruR4l3zs5AlD1VErM/aXokGDJEM/kIXdKFOMloVXRHxZ3O3DxRCDGjmwRRNlILjel38oMH7
	lB6g/Ya0k+fQ5OhcMQiMPNoCRpXN15whmVk4uISuS52WfNKbVP+cSbRitwuhJZcs4vrad+OhIMB
	Hu+5DWQ3sCT1lGI42m/8AWmbcmiE6MSjXv1z73VmzDyp6v8QKQktRadzaCBj/ZFXi7eRqF9NIHQ
	FtfOaq1ez/TRzv45ep9RJpe2L95nmM3+Lh/fYmmVNAMzTdHkxX9UWvMuoc9uHU6od9sKx6Wv5Hw
	m6GcMG6/NYRFT2dq/MRy/2sW4dJjpHeIoPtSxMCAGUuZrxqC9Sk0BE8lZO2jNI1A56i+HFcxr6l
	4lL6o0z1tm/Q37QJ8J7OeNPyBKm2qnBvZtBBGy5qp6LEwe4Uw=
X-Received: by 2002:a17:90b:2707:b0:37d:f5e2:dff4 with SMTP id 98e67ed59e1d1-37dfa1ded31mr5302285a91.11.1782454434182;
        Thu, 25 Jun 2026 23:13:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:13:53 -0700 (PDT)
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
Subject: [PATCH 01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:06 +0700
Message-ID: <20260626061329.23264-2-phucduc.bui@gmail.com>
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

