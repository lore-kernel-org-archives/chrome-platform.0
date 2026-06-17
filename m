Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746ED3F5BFF
	for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 10:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692381; cv=none; b=sEhnKLFXV9kRXpQE8tSWH7jRTXJs/dtHNJpxGgvh2XuCK04ylrW6skINkPGqSijW65VJTLSJaH/FUXqTPb/LI/KTcLfumgL0+iGzB4zFE4QxENi01encU/SBHmWYdh29OyGD/V3t2NaQN9htCAEBK5W1lIQusECD25eTNxpDj6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692381; c=relaxed/simple;
	bh=UB/a7mDSvTJHdOqH8tC7wDihHMb6zdr57dJos5YfbBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DvrD29keGMzsxs0kET7yHV8WVriIEEClQFkOc4urrM0nh47hjpgBJSzrTWPYZI2oIZSpDDaAR//82R8H0A4ql4Fy++qgopqoKywLA0yoh9001UFRYopwRfyPsqjnFOAd71Ub/IW/ZgIvVYyD1p36z/QsQKmgSqfKic7TmIhsIug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kf+jGVqC; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf+jGVqC"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3042a388168so428890eec.1
        for <chrome-platform@lists.linux.dev>; Wed, 17 Jun 2026 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692379; x=1782297179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wU4tKY2KGJdHyXYk6dnV63C3KexEicox33mI2r9NjI=;
        b=kf+jGVqCSfWaTbdlyifaJBDlpWgVtpTno5I3NDsjQKxEiqNI6H66XFv62O//xSL+VO
         jdBKWmInnJouvCCw5pT9lJeCM7vK3jRAaM51dDBOF0z9OnwZNiBS/WCHSbBYtRmlFYsT
         X55ARm4ESF4vHvBw9EN8Hfak1vJwpIZe8mv/OVcBdZwPO/7eBCofiu+1sTllr4yaujij
         GAn2fvEqqs+q/5y1uJsEw25dHFOM4O8OtVyv7lea8qytaecKUjD4L1fXqV68rRHzJcvJ
         OdLaWV1KXeX0NFV3Mk6Gn24OuRn4QhKhOCG6XWfAhfu+ga9vUAZ8hB2Ozk3KDX3x+2hl
         y53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692379; x=1782297179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wU4tKY2KGJdHyXYk6dnV63C3KexEicox33mI2r9NjI=;
        b=Y5a7IWyXel1gc/VcGgjW55TWMs8+SJPbGyBFjNoBFnPtFgw7UbIuUxbkxCh2TFw38i
         o8vrzAOldAUO3xi1qbz3q+3L4QlQtrMdndNBCBTkldBIFwRSY/wbFK+dk31vX/xQU3cp
         X5M6qDGG7G6oTqlVQvNArfq8qwxFuGxiwuFEIa7qiGq7ig2DpxtQB/JajGMBfLa7iMvn
         Ca4eF8WYmZBI1lihzb42h+A85PDiKHEVUuFRD+lSVErjKzmf68xr+zK6d/zdKJhlPjxe
         Jn9n+8HYZKtCX3IFGNQqxt+3xW7a5bFjmMaLz/E0jnUtwmZXpheB6K55LpO//7q1Iaq+
         Wa2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+hAN274sGkKXtyxABe7uc1qNrjN1GsTggD3qrPknDR6YuITn4//KzgdzdBYadjhqW2tFKKjdDbblmTGAGSXUw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlWMS7IUjYNzVJpVIqQbBnIz97YJ0KVP5vlvRLn4/ykoToygPH
	jQ/kxUlu7tisJb0EMM7SIenaQkcY+MI2+hXbXutJNHt17fL4GzoLX+S0
X-Gm-Gg: AfdE7clu8U+9hVJRncCnQ6y2TkFLsND5IcFvrysp9kmVq2Wae/XscfUDp8vDt7YCnDY
	2XRtsQiX0UYPwiuWng/k1+pF7uRaO6tjt4LsP26WVwCrStXiWsmBR9UJC7cSDkTNMYhAWZOqxyj
	+SjydPNDR7uA9CGBYXN49eJqzzJW9ibg4qV5r57B+sQKGZxtllfYcTqivy3FlgorFLTQo+3gO3f
	Il09Am0jjr/qJqiEzJYzJfcLwPI9c9IE6lhksxOeDQu69nm7o1ss9VVY6rAN1kTzsx3CUzqKLar
	TEg7QrkXYvPu+MGqeenJcYt7BCDHOAx/mSfVWMtQpPFuoOp32NtaZ042wzQ/TQCeWtCXCYal0He
	j6TgbMR+te8a9e+28AMzqP1vPKMBJQOU7KHyBJYJ1OUVvHBcH9ZN112vT19c18kfMi4WuwrAgrh
	i7a4DW4NAz1mnnieg7nXhnXkDiP4AG5fKgOx+6whExqSel5zE=
X-Received: by 2002:a05:7301:6402:b0:30b:d209:dc18 with SMTP id 5a478bee46e88-30bd209ff68mr687132eec.10.1781692378517;
        Wed, 17 Jun 2026 03:32:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:32:58 -0700 (PDT)
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
Subject: [PATCH 00/78] ASoC: codecs: Use guard() for mutex & spin locks
Date: Wed, 17 Jun 2026 17:31:17 +0700
Message-ID: <20260617103235.449609-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in the ASoC codec
drivers to use guard() and scoped_guard() helpers.
The changes are purely refactoring and should have no functional
impact.

Compile tested only.

Best regards,
Phuc

bui duc phuc (78):
  ASoC: codecs: ab8500: Use guard() for mutex locks
  ASoC: codecs: ak4613: Use guard() for mutex locks
  ASoC: codecs: arizona-jack: Use guard() for mutex locks
  ASoC: codecs: arizona: Use guard() for mutex locks
  ASoC: codecs: aw87390: Use guard() for mutex locks
  ASoC: codecs: aw88081: Use guard() for mutex locks
  ASoC: codecs: aw88166: Use guard() for mutex locks
  ASoC: codecs: aw88261: Use guard() for mutex locks
  ASoC: codecs: aw88395: Use guard() for mutex locks
  ASoC: codecs: aw88399: Use guard() for mutex locks
  ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
  ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
  ASoC: codecs: cs35l56: Use guard() for mutex locks
  ASoC: codecs: cs42l42: Use guard() for mutex locks
  ASoC: codecs: cs42l43: Use guard() for mutex locks
  ASoC: codecs: cs42l84: Use guard() for mutex locks
  ASoC: codecs: cs43130: Use guard() for mutex locks
  ASoC: codecs: cs47l15: Use guard() for mutex locks
  ASoC: codecs: cs47l35: Use guard() for mutex locks
  ASoC: codecs: cs47l85: Use guard() for mutex locks
  ASoC: codecs: cs47l90: Use guard() for mutex locks
  ASoC: codecs: cs47l92: Use guard() for mutex locks
  ASoC: codecs: cs48l32: Use guard() for mutex locks
  ASoC: codecs: cs2072x: Use guard() for mutex locks
  ASoC: codecs: da7213: Use guard() for mutex locks
  ASoC: codecs: da7219: Use guard() for mutex locks
  ASoC: codecs: es8316: Use guard() for mutex locks
  ASoC: codecs: es8326: Use guard() for mutex locks
  ASoC: codecs: es9356: Use guard() for mutex locks
  ASoC: codecs: fs210x: Use guard() for mutex locks
  ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
  ASoC: codecs: hdmi-codec: Use guard() for mutex locks
  ASoC: codecs: idt821034: Use guard() for mutex locks
  ASoC: codecs: lpass-macro: Use guard() for mutex locks
  ASoC: codecs: madera: Use guard() for mutex locks
  ASoC: codecs: max98095: Use guard() for mutex locks
  ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
  ASoC: codecs: pcm512x: Use guard() for mutex locks
  ASoC: codecs: pcm6240: Use guard() for mutex locks
  ASoC: codecs: peb2466: Use guard() for mutex locks
  ASoC: codecs: rt5514-spi: Use guard() for mutex locks
  ASoC: codecs: rt5645: Use guard() for mutex locks
  ASoC: codecs: rt5665: Use guard() for mutex locks
  ASoC: codecs: rt5668: Use guard() for mutex locks
  ASoC: codecs: rt5677: Use guard() for mutex locks
  ASoC: codecs: rt5682: Use guard() for mutex locks
  ASoC: codecs: rt700: Use guard() for mutex locks
  ASoC: codecs: rt711: Use guard() for mutex locks
  ASoC: codecs: rt712: Use guard() for mutex locks
  ASoC: codecs: rt721: Use guard() for mutex locks
  ASoC: codecs: rt722: Use guard() for mutex locks
  ASoC: codecs: sigmadsp: Use guard() for mutex locks
  ASoC: codecs: sta350: Use guard() for mutex locks
  ASoC: codecs: sta32x: Use guard() for mutex locks
  ASoC: codecs: tas2781: Use guard() for mutex locks
  ASoC: codecs: tas2783: Use guard() for mutex locks
  ASoC: codecs: tas5805m: Use guard() for mutex locks
  ASoC: codecs: tas675x: Use guard() for mutex locks
  ASoC: codecs: tlv320dac33: Use guard() for mutex & spin locks
  ASoC: codecs: tscs42xx: Use guard() for mutex locks
  ASoC: codecs: tscs454: Use guard() for mutex locks
  ASoC: codecs: twl6040: Use guard() for mutex locks
  ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
  ASoC: codecs: wcd934x: Use guard() for mutex locks
  ASoC: codecs: wcd937x: Use guard() for mutex locks
  ASoC: codecs: wcd938x: Use guard() for mutex locks
  ASoC: codecs: wcd939x: Use guard() for mutex locks
  ASoC: codecs: wm0010: Use guard() for mutex & spin locks
  ASoC: codecs: wm2000: Use guard() for mutex locks
  ASoC: codecs: wm5102: Use guard() for mutex locks
  ASoC: codecs: wm8731: Use guard() for mutex locks
  ASoC: codecs: wm8903: Use guard() for mutex locks
  ASoC: codecs: wm8958: Use guard() for mutex locks
  ASoC: codecs: wm8962: Use guard() for mutex locks
  ASoC: codecs: wm8994: Use guard() for mutex locks
  ASoC: codecs: wm971x: Use guard() for mutex locks
  ASoC: codecs: wm_adsp: Use guard() for mutex locks
  ASoC: codecs: wsa88xx: Use guard() for mutex locks

 sound/soc/codecs/ab8500-codec.c           |  11 +-
 sound/soc/codecs/ak4613.c                 |  72 ++++---
 sound/soc/codecs/arizona-jack.c           | 194 +++++++++----------
 sound/soc/codecs/arizona.c                |  25 +--
 sound/soc/codecs/aw87390.c                |   9 +-
 sound/soc/codecs/aw88081.c                |  17 +-
 sound/soc/codecs/aw88166.c                |  23 +--
 sound/soc/codecs/aw88261.c                |  20 +-
 sound/soc/codecs/aw88395/aw88395.c        |  23 +--
 sound/soc/codecs/aw88395/aw88395_device.c |  39 ++--
 sound/soc/codecs/aw88399.c                |  14 +-
 sound/soc/codecs/cros_ec_codec.c          |  17 +-
 sound/soc/codecs/cs-amp-lib.c             |  10 +-
 sound/soc/codecs/cs35l56-shared.c         |   6 +-
 sound/soc/codecs/cs35l56.c                |  56 +++---
 sound/soc/codecs/cs42l42.c                | 222 +++++++++++-----------
 sound/soc/codecs/cs42l43-jack.c           |  57 +++---
 sound/soc/codecs/cs42l43.c                |  16 +-
 sound/soc/codecs/cs42l84.c                |   9 +-
 sound/soc/codecs/cs43130.c                |  96 +++++-----
 sound/soc/codecs/cs47l15.c                |  10 +-
 sound/soc/codecs/cs47l35.c                |  10 +-
 sound/soc/codecs/cs47l85.c                |  10 +-
 sound/soc/codecs/cs47l90.c                |  10 +-
 sound/soc/codecs/cs47l92.c                |  10 +-
 sound/soc/codecs/cs48l32.c                |  28 ++-
 sound/soc/codecs/cx2072x.c                |   4 +-
 sound/soc/codecs/da7213.c                 |  36 ++--
 sound/soc/codecs/da7219.c                 |  59 ++----
 sound/soc/codecs/es8316.c                 |  30 ++-
 sound/soc/codecs/es8326.c                 |  29 ++-
 sound/soc/codecs/es9356.c                 |  29 ++-
 sound/soc/codecs/fs210x.c                 |  86 +++------
 sound/soc/codecs/hdac_hdmi.c              | 116 ++++++-----
 sound/soc/codecs/hdmi-codec.c             |  16 +-
 sound/soc/codecs/idt821034.c              | 120 +++++-------
 sound/soc/codecs/lpass-macro-common.c     |  11 +-
 sound/soc/codecs/madera.c                 |  31 +--
 sound/soc/codecs/max98095.c               |  34 ++--
 sound/soc/codecs/mt6359-accdet.c          |  12 +-
 sound/soc/codecs/pcm512x.c                |  17 +-
 sound/soc/codecs/pcm6240.c                |  27 ++-
 sound/soc/codecs/peb2466.c                |  15 +-
 sound/soc/codecs/rt5514-spi.c             |  20 +-
 sound/soc/codecs/rt5645.c                 | 161 ++++++++--------
 sound/soc/codecs/rt5665.c                 |   7 +-
 sound/soc/codecs/rt5668.c                 |   9 +-
 sound/soc/codecs/rt5677-spi.c             |  35 ++--
 sound/soc/codecs/rt5677.c                 |  77 ++++----
 sound/soc/codecs/rt5682-sdw.c             |  23 ++-
 sound/soc/codecs/rt5682.c                 |   4 +-
 sound/soc/codecs/rt5682s.c                |  16 +-
 sound/soc/codecs/rt700-sdw.c              |  13 +-
 sound/soc/codecs/rt711-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt711-sdca.c             |   7 +-
 sound/soc/codecs/rt711-sdw.c              |  23 ++-
 sound/soc/codecs/rt711.c                  |  19 +-
 sound/soc/codecs/rt712-sdca-sdw.c         |  34 ++--
 sound/soc/codecs/rt712-sdca.c             |   7 +-
 sound/soc/codecs/rt721-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt721-sdca.c             |   3 +-
 sound/soc/codecs/rt722-sdca-sdw.c         |  33 ++--
 sound/soc/codecs/rt722-sdca.c             |   3 +-
 sound/soc/codecs/sigmadsp.c               |  16 +-
 sound/soc/codecs/sta32x.c                 |  12 +-
 sound/soc/codecs/sta350.c                 |  12 +-
 sound/soc/codecs/tas2781-comlib-i2c.c     |   4 +-
 sound/soc/codecs/tas2781-i2c.c            |  20 +-
 sound/soc/codecs/tas2783-sdw.c            |  89 +++++----
 sound/soc/codecs/tas5805m.c               |  15 +-
 sound/soc/codecs/tas675x.c                |   6 +-
 sound/soc/codecs/tlv320dac33.c            |  77 +++-----
 sound/soc/codecs/tscs42xx.c               |  44 ++---
 sound/soc/codecs/tscs454.c                | 106 ++++-------
 sound/soc/codecs/twl6040.c                |   4 +-
 sound/soc/codecs/wcd-mbhc-v2.c            | 142 +++++++-------
 sound/soc/codecs/wcd934x.c                |  46 ++---
 sound/soc/codecs/wcd937x.c                |  24 +--
 sound/soc/codecs/wcd938x.c                |  21 +-
 sound/soc/codecs/wcd939x.c                |  19 +-
 sound/soc/codecs/wm0010.c                 |  63 +++---
 sound/soc/codecs/wm2000.c                 |  27 +--
 sound/soc/codecs/wm5102.c                 |  12 +-
 sound/soc/codecs/wm8731.c                 |   3 +-
 sound/soc/codecs/wm8903.c                 |   3 +-
 sound/soc/codecs/wm8958-dsp2.c            |   9 +-
 sound/soc/codecs/wm8962.c                 |   7 +-
 sound/soc/codecs/wm8994.c                 |  51 ++---
 sound/soc/codecs/wm9712.c                 |   4 +-
 sound/soc/codecs/wm9713.c                 |   4 +-
 sound/soc/codecs/wm_adsp.c                |  87 +++------
 sound/soc/codecs/wsa883x.c                |  10 +-
 sound/soc/codecs/wsa884x.c                |  10 +-
 93 files changed, 1330 insertions(+), 1863 deletions(-)

-- 
2.43.0

