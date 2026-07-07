Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EA1378D72
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 05:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401034; cv=none; b=pdEvsmRS9Saqzu1Hg/gXIGe8uMBhtZPDIYwTOli5mVapmtCMyOTnEQVlfED/Q2fMzIyIzykQcOOkZow7p0l4NxV1NytR8Kxly6302Yt9wGpUTI0TZ8jh8x2l9ZF6nLNhtaUUJy4aZpMCA+0OjBv6MXs1ANZ01wPsNET64cqRPvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401034; c=relaxed/simple;
	bh=BisDHo1gHDak+rGDfU9Nkz2k1MaaDjZewmjMgDBoI4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LUknK4zhcjxS6R+bODFZHZbxWQWlEI4STgLuWTe/gb9YfvEuLpwRUv0yfCaU2XISZssI/bV5ocU0JW1fA+E8Qisvhch82mrdYDi2Ji2fgoXk2NyniqatedUU28V6FZa7Iw5LvT4AwXBR8EDs+muz+WM2haT12LhZW2LKTetMiEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kuy++kyj; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kuy++kyj"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8454160043aso3696128b3a.3
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 22:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401032; x=1784005832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjmFUecGWdo9lqtWqlxObyMes4CRt5uDc3GUmA57Qmg=;
        b=Kuy++kyjtkTTRPb4mJ6lGXKglyzx2UNpOSuDZuZ4lhDAcJyWXHdFGwBPFIVjR5FgnA
         +MN3ECPUoWiwXRVT6hvV+TjmirqFJBEfX5EozLvy4d8wWNCYNyPl3+hbytY0op7+NaMT
         epUGLvDX+UsGzNzD/mpIjJdjlW+mY0cGq5N8yHHdAPj+t00wUAwVBXYrmaoESFxPncO8
         kVZY3I+v8v2qbUbNnWon2Ww/mK6FbnNDdF04gxtKox/zkRz9OyalBIepRoXKSESisbV0
         DJMGAdx20ZcCo2kvvnFY+ueo9m59iWCa99SC9w8JTpD7JGNGtuHuHACjWfbQdeU4iEQf
         OGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401032; x=1784005832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjmFUecGWdo9lqtWqlxObyMes4CRt5uDc3GUmA57Qmg=;
        b=pq/StpFmZy4v/tzIBy17Q6theZsoq2yhLSww5vNnPPhKCuDsO1l4LPrirLxbEqyk64
         0j8Xo21usAykhmIo6yiBWrVUpNT4nxgdw2ZodoGkQ6uWg1Lzc8kxkHPmOK2dHV4S0Fn8
         L8XcmTLKWdmBcR3LlhB3SyuPPAJdy7FYwX0chkWkziAMFmJQ31bBty35DwOMm1utgclJ
         VQTT+NExpOWiSX0qsoluV/SFibiAZoeXK/eBY/MtGDeI2Ru3FA17mhz4uM/mGrelAncc
         npWnpKvG8VrKTXwFdvjfoUw/6+Z1k9OToPiKRsNJWRjdz+lpX0ALL9koJ4Faep4HFJk8
         lV5A==
X-Forwarded-Encrypted: i=1; AHgh+RqaECA1K1tcWe+KpMcs3hVxFKlbDLxs/uCSVvPIa4jDBnoejn0KVfGrXpBKaNR1XNfz64UUFXhVlZ1/WyQQCZw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQC7XuhPvQlBQK2TX9OTFOR7/fV3sIMdqw9RjRehzACSrZXBAC
	pUpIm8sGT25xcQJq+LJHGP5nJVoiuuPRzIrn1S0Fhat9x0mpeahq7H+P
X-Gm-Gg: AfdE7cnFg9UDpJ6eXFxD2hEWeYceKaDy9qzmrMkuWMlVurS9hyPZ+w8SpQ0HSi02dIn
	Zf8O7tE72BaU4XClNZw3Tmmwb+ZOQU5axDNUhdSKRJFfxCph0SrQkS5xBcXRHeem5hGjd5aU5Vv
	HqW3t0TU9JuIuIwGpGigtf4xUDHyB4cVw3Q/iqWuXESK7qk68+DzW0cmYpsU+KbeplwJKfntMkC
	zez81cx5b4ug4Rr4TZtBbOo1BLWeUQWsvQACX6ZE/VsiTni9/8cWwDND+kjFZcHEr13MqMP9elz
	3c6gqgjH54mZGHEfhtfXsRMSi7I1X/vYNImNgegQmiI7g5LZKd0ZKdq12PDkQxSY5ROMOLW/i8p
	7U04Fr9pyYfMBf7ZH3ULiEqCtiFxAx3BOUpW3sA4+TKDGGrHe7dFVkuvZrvwQggI1jN2ZfJalVU
	n/DgC7glXMFUY8CMOoQC+a495aP/6+S4ofl5LM5Hip2mg8P1g5d6L/SuCcIw==
X-Received: by 2002:a05:6a00:32ce:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-84826d69104mr3417418b3a.26.1783401032300;
        Mon, 06 Jul 2026 22:10:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:10:31 -0700 (PDT)
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
Subject: [PATCH v3 00/24] ASoC: codecs: Use guard() for mutex & spin lock - part 1 
Date: Tue,  7 Jul 2026 12:09:42 +0700
Message-ID: <20260707051006.20058-1-phucduc.bui@gmail.com>
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

This series converts mutex and spinlock handling in ASoC codec drivers
to use the guard() and scoped_guard() helpers.

This series is split out from a larger 78-patch series to improve
reviewability and allow for incremental review:
https://lore.kernel.org/all/20260617103235.449609-1-phucduc.bui@gmail.com/

The changes are purely refactoring and have no functional impact.

Compile-tested only.

Link v1:
https://lore.kernel.org/all/20260626061329.23264-1-phucduc.bui@gmail.com/
Link v2:
https://lore.kernel.org/all/20260703055355.244898-1-phucduc.bui@gmail.com/

Changes in v2:
 - Added Reviewed-by tags from Charles and Richard.
 - Incorporated Charles's review comments:
 +  cs48l32: Removed the unnecessary else block so update_bits() 
    is not called when no changes are needed. 
 +  cs42l43: Switched to a helper function to avoid code duplication, 
    while keeping the guard() conversion since it eliminates 12 goto 
    labels.
 +  arizona-jack: Reworked the code to use an if/else structure, 
    avoiding code duplication after removing the goto label.

Changes in v3:
 - Added Reviewed-by tags from Charles and Cezary.
 - Incorporated review comments from Richard, Charles, and Cezary:
 + Remove unnecessary blank lines in arizona-jack and cs35l56.
 + Remove temporary variables and return directly in cs42l43 and cs35l56.
 
Best regards,
Phuc

bui duc phuc (24):
  ASoC: codecs: ab8500: Use guard() for mutex locks
  ASoC: codecs: ak4613: Use guard() for mutex locks
  ASoC: codecs: arizona-jack: Use guard() cleanup helpers
  ASoC: codecs: arizona: Use guard() for mutex locks
  ASoC: codecs: aw87390: Use guard() for mutex locks
  ASoC: codecs: aw88081: Use guard() for mutex locks
  ASoC: codecs: aw88166: Use guard() for mutex locks
  ASoC: codecs: aw88261: Use guard() for mutex locks
  ASoC: codecs: aw88395: Use guard() for mutex locks
  ASoC: codecs: aw88399: Use guard() for mutex locks
  ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
  ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
  ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
  ASoC: codecs: cs42l42: Use guard() cleanup helpers
  ASoC: codecs: cs42l43: Use guard() and PM runtime scope helpers
  ASoC: codecs: cs42l84: Use guard() for mutex locks
  ASoC: codecs: cs43130: Use guard() for mutex locks
  ASoC: codecs: cs47l15: Use guard() for mutex locks
  ASoC: codecs: cs47l35: Use guard() for mutex locks
  ASoC: codecs: cs47l85: Use guard() for mutex locks
  ASoC: codecs: cs47l90: Use guard() for mutex locks
  ASoC: codecs: cs47l92: Use guard() for mutex locks
  ASoC: codecs: cs48l32: Use guard() for mutex locks
  ASoC: codecs: cs2072x: Use guard() for mutex locks

 sound/soc/codecs/ab8500-codec.c           |  12 +-
 sound/soc/codecs/ak4613.c                 |  83 +++++++------
 sound/soc/codecs/arizona-jack.c           | 117 +++++++++---------
 sound/soc/codecs/arizona.c                |  26 ++--
 sound/soc/codecs/aw87390.c                |  10 +-
 sound/soc/codecs/aw88081.c                |  18 +--
 sound/soc/codecs/aw88166.c                |  24 ++--
 sound/soc/codecs/aw88261.c                |  21 ++--
 sound/soc/codecs/aw88395/aw88395.c        |  24 ++--
 sound/soc/codecs/aw88395/aw88395_device.c |  40 +++----
 sound/soc/codecs/aw88399.c                |  15 +--
 sound/soc/codecs/cros_ec_codec.c          |  18 ++-
 sound/soc/codecs/cs-amp-lib.c             |  11 +-
 sound/soc/codecs/cs35l56-shared.c         |  22 ++--
 sound/soc/codecs/cs42l42.c                |  54 ++++-----
 sound/soc/codecs/cs42l43-jack.c           | 138 ++++++++++------------
 sound/soc/codecs/cs42l43.c                |  16 +--
 sound/soc/codecs/cs42l84.c                |  10 +-
 sound/soc/codecs/cs43130.c                |  72 +++++------
 sound/soc/codecs/cs47l15.c                |  11 +-
 sound/soc/codecs/cs47l35.c                |  11 +-
 sound/soc/codecs/cs47l85.c                |  11 +-
 sound/soc/codecs/cs47l90.c                |  11 +-
 sound/soc/codecs/cs47l92.c                |  11 +-
 sound/soc/codecs/cs48l32.c                |  26 ++--
 sound/soc/codecs/cx2072x.c                |   5 +-
 26 files changed, 353 insertions(+), 464 deletions(-)

-- 
2.43.0

