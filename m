Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5875743C063
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692789; cv=none; b=OTYHUjtkA5ajWbzvtJ3o2JB0YBXgYknhvEbIx9F+JV8ZiUmMWBpT+91Y7Mh6jH7GMn4PiU9ridz/IyyuWh5RGS1vhHwAMKACuWT/CormoOft1kHY+pivgJVH6SXZCWf5v2gxYiSNgPg66JW74XgDBlcbjiELeju1G/KDm4FuLco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692789; c=relaxed/simple;
	bh=5JCNTsV1p32IiiWp8LevAgThvpw4U0A4EV+Xvmc/Vns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4i6c+XkP+5sf10jHoZDlFqlQG+Cx/QKrldsBEPNAKqamy9E0B/0SXdNW/t3qioufmNZW9N+K+qHu9rOH9rT9yp7AWAMAM+gzR8uSV5Q+luA591q8reWuz77u9eWEniXkj/PzPY/PicTVUtHl6kzJubola3GfDmDyrDF23re8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/OR22Qt; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/OR22Qt"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bd47b9f0fso484187eec.0
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692787; x=1782297587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8UzOcdKlzqr8WU+ZxDYdCm6hGtyTeRisevBsOozeA4=;
        b=X/OR22QtX6l3sJV+0x0bSlfkF8kMVayzNJMOnO68wgfAXoa5AzPYTTi7IkgztIhkKu
         fe1AXgmNeSZdfBE+fjoc+L7zOLX9PyBcq6JGs/GbuMc0OfbHIKtioo1VVh78Fi8NCo9Q
         bJP3y3a5vFs8qFy5HB3wJdZr3TOlP+IfG0qEpNg/hgOFdj7XNyN55s+JlC6MG5z/Z++e
         0zMFWcHIWnpZgd+FjH8/wJ90j2+RB3e5O3osfJ4gZcwHVeNNCQ04N80qToj/97V0B/14
         lKnQxyX+bJJNdqKe7zfBnyUcNNWbHFL8WFhGMLWG0YOmXapMQs0zjtLdy+R6+R4yN2xt
         rGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692787; x=1782297587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8UzOcdKlzqr8WU+ZxDYdCm6hGtyTeRisevBsOozeA4=;
        b=OGEkRF8KYICb76Co7H/4dK68Slk4icbdr34B+/3TmmawxeuuhqpygPdlOZTpNy37nB
         9e9MukZQfR3Ek8kWAh0L6o0d+YuGBQ/EEF1dJ8JC639PPnAvsAY6eWlz9o6WIRt46JuJ
         zwqoyjwNXI8qKb2M4irl4mOhRYKWMZlDfyAM9rCOwwipC/vvt5lnVqAWs9UbyY78WNsO
         TkyXIBm2kPDwhplxS0Xj4kSLM6t+q/PQmjEtiMFn0kHtJvMN1VRYheIwmQpekCXfFMOb
         QyIpScgLYMje/wVEE7/8Z27P6gRy2ObF0/jce+VQlqfHrbkoMGZPCoswW99u6MvAVRmu
         GDXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hK97XSXdmpPR6R6zjlQCk06ky3LlCxO5iLNA7Nl7zU1WBe3/8a7VSbdANs4hcOCCv+pbPEGxsMaSUp0PflEM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKE9MBbleexBytLJCD4ZPYMF9T9kEEGhjsr8kEhMvmDB6i8Ryb
	poK3WY+c0abPXmadhesEtqJua2WzDMIfyz58jxh5xhAKBQ9uewJd7bbZ
X-Gm-Gg: AfdE7cn8SyERuXT1Ku9ZWiNPyBwPyiWCaWA4xt/+NnNXVuIPz8vkmm7kgspeJMX12jK
	UhlaUt2dh2LpV1PgpuoYgfC9erONL3/HprERFF0yvLpExgV3TAd74EbVBLp/Yjc++uyG3kxj32p
	zXWJ2Hm5Uu/IrlL/+zKIMlLshF7+7xfaCnQSfNqPE4vqi3GXpXpDrgRs3MmlKn6j7SNoKNEnq6B
	aS9/pRaBDwjBqv1Hke4oVwo35hDyiwOv14p7ERlmCMdolS8lRka/LQHdBxsCyuYxjM7WexQh6xj
	V9ZkMZqfF+cT7tDu8bNcyzvIlPi1ErJghjg9CpqfGAleLeOk0FyI1wlUfk7tK7GEj24rXUG6o9F
	ALJVub1T6WerOj4VGPfTBhEPs4lQVLT7ODKReK/Vc5NyToWiczHM1HugQbF8MLeQ1/GzQ3veSg8
	91+MLg2sTu7icVtIlzFP4kG4doXQRXoyo6ydtOUbhO0BK8yPzz3eEGzqZaEA==
X-Received: by 2002:a05:7300:6402:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30bca09f522mr1864287eec.23.1781692787536;
        Wed, 17 Jun 2026 03:39:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 43/78] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:00 +0700
Message-ID: <20260617103235.449609-44-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5665.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 48f57cd0920d..9048632488ab 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1208,7 +1208,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5665->component, RT5665_AJD1_CTRL) & 0x0010;
 	if (!val) {
@@ -1274,8 +1274,6 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5665->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5665->jd_check_work);
-
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static const char * const rt5665_clk_sync[] = {
@@ -4564,7 +4562,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 {
 	int value, count;
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	regcache_cache_bypass(rt5665->regmap, true);
 
@@ -4637,7 +4635,6 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 
 out_unlock:
 	rt5665->calibration_done = true;
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static void rt5665_calibrate_handler(struct work_struct *work)
-- 
2.43.0

