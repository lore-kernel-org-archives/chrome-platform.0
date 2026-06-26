Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0053B14D0
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 06:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454530; cv=none; b=t342snRlUc/kU+nR9DCMwyN/EeAaehn5DvWFl3EongP9dJZe4HaTSw9lkIvtE1VQ58kZEF2MsVEnUsEPue8eVzWNW8H1HWAR12gIvQ9Ppg40Uq4vbogEvl/udoUAZ33/y90myqx60EG1RLqFeL3kfUEHe1I/qSGdv3KOWHbyRRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454530; c=relaxed/simple;
	bh=hFFYBp0rH2f/68QxLOjHm14ykzjK1pnK1FIOxrkKo3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fF53py3W+9Itx+UlKeJy70UZxpC6foGbMCq67+cpy8gdXe346jdpTZ6dQCFQb3zFIb6M5Sl7bdzT3cEhFNovseHzUE+nRvJ+28rze5X8vBFJGoBnb9qJoXBVie6yT/o2vCYRWlxUs8ROZHP4XWE/mKoNl2dhlt+iYc8LVGXUKrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOmzIMqV; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOmzIMqV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37d46e0d246so257593a91.2
        for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 23:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454528; x=1783059328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PG6vKQGWAHofKUNrPpKKi9BQXDIPvZJy9kMaVHXivck=;
        b=rOmzIMqVN0owNrcQ5fqneYxFG43vnY0MvgohcyGgUk3VuXlyTDGYLoNxEQ8WUk3nUN
         xE+9MZc2w5DxkcJpAHzq3zg2oly6gkRXeWjhf66SS75fJoucSx53AraoSQAce9nNwvCY
         u0iBSnyyNL9uZzDOInoWxA7TRC/UPIakfWh56NjavNFTl4HrD5C0auOuJ2EKhyMuZLnu
         +kKRQIHNDBh6EoLrSonKLZj9rS11YjJSIi2onLcFnBr7I5SjHx8hLTlGQKzkdc8OAiDl
         UOdbxiPudRSF51Bh4aKGlpcgaPXXynZZ17PRPIrkqjvyEOYd+/Ul2/0sNEPnKicjZkFt
         AJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454528; x=1783059328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PG6vKQGWAHofKUNrPpKKi9BQXDIPvZJy9kMaVHXivck=;
        b=O9MQMY7ZXBerbUgQ5/wAWSc6ejwr4dtEVhPqquZlac5gsWjjqq4et3ug6x3SjlYZHf
         PEF5hky2yovSHsKTBv0uM4Q19nAb9LB7GF5pTnkepOWrbXEgvgNJyu1j0SJyUpe44f5y
         bia1wdgk/pZ73cfh6mG2StRwu6cmrsGVFlE9IpC1lv5kuZ2Yzf9GmX6OfuMXlw6KG/oC
         jq9U8iLgJIney/yKtMMsVjLHnPWPPW9GqxTA7QJPH+XhgRmmpK4uQAiGLKcP2xx+/rzw
         /WvglsDtPjQ+sUL3POnl3QEWGggIy4BUpguRTiwwpva+AtySEYwe0ScC6ab37fUWc2Ni
         eZIw==
X-Forwarded-Encrypted: i=1; AHgh+RpDKjoiEREkPaxP+9edamjk9xweLqBHNxZud8cT1BLvf3K/bMuzRWWgM5SVjZmuT9IE1gkYvpwiPnBn1H/AGIs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUcPM/isDL+M7RkzVsPtFIyFNVoS83PyOVoCdwPOjtPSjHRvmN
	PJ0DO2lp50lFSN0Zea7NbdMjXM/srt6IauCOB5NW7sZ82A5JfkZaVn22
X-Gm-Gg: AfdE7clhzkdWeJSvX92hPM76/i7i5SS7W97qbEyOMJ4d+Cu/8o28JZdXel3Yn5xgfG/
	tc8LyMrawnh62WFDUnxohYx44N4J9wb6U3db5wDQeMhYZeNx7j7sfFtmqoKjOhTZ8dQo/aYl4Ia
	2Kck2H+4dpcyd7A59LNg8u4Cpb789wP/kmwFXpiHRci1bM9I+7K5txaQhyrHt3E7j9UuZhQHDQO
	qFZyM69gEIQoBjkkkBaFjPCxmqkxeN5w23q2KMS5tZBsW5PeOPdYCloljbLukBJULIROGCS+uEM
	nhMDnD+Z8WA5rYNxyiSmOR1elfEGxZRBITy1r0wSVZ9TfPpgfK9OJhKMpYKuyKQaHcjieIwAiU6
	t9JFdqh3FvHzDzFS98VE0ft/cutqtWrLXgBapDkRLIRSK8EA34p8yMvLsqKY2KQK9VemZIzjzxj
	x5kixDvu0oae9SwZKAqR6skzS3EGDbscvxw3d/hUtwJDyhmvw=
X-Received: by 2002:a17:90b:518d:b0:37e:1c8f:3dff with SMTP id 98e67ed59e1d1-37e1c8f3ea2mr302131a91.11.1782454528393;
        Thu, 25 Jun 2026 23:15:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:28 -0700 (PDT)
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
Subject: [PATCH 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:17 +0700
Message-ID: <20260626061329.23264-13-phucduc.bui@gmail.com>
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

