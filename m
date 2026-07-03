Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4D63290D9
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 05:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058058; cv=none; b=O08FS7DFXACPKz84XygpAUqI/y50Cxx/GGtNLISnw7rGm2p8CKgs/RVElYXi45JGchK+HbFcLjyDzgwJJR0O/K4WEc+snFTaPmjPRoOyU9Zq8MIeWSn5FshTP8smb/xND37IL/VKbBRZPLmipAKoEsmz/L2nv3m5f402uvJmfVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058058; c=relaxed/simple;
	bh=UGkLrBuL5irW/Yht46QG6DEBFfiJYbXFRCF2TdC6c7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNqNimG5GyyR8CmFhArDMrWwdZ42HwnYSa0PFN67sy70MjerlB3HUZtQaefkFOSgqJZVZH7P+O9U1vCt3i8VWDrVgd1Mn1AAOdM5Ktsxu/bAfyRHoIK5FGQz1RH6MtaVZQS3xpmtEY/HHmamK6UhFi4chmtUDTrzRjlZ4jzXLL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkAcaAj/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkAcaAj/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-847a483e344so166975b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 22:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058055; x=1783662855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KcraQoI+SjGv7MwiOE2COsWrr3yT+rAbe2XY9Shc+ak=;
        b=kkAcaAj/FZ6tpQ3j4RTAzKw9pfwZFcUPkGMuhxgAtjynU9kPfGGx2h8/XLBYCBQ/61
         yqT/nGwFLahn+qSb2BY1NXG0iqpnkYjIZ7IF4ppf9Apg3XyUr24lm1UtT5B7n+e035tK
         0WIkA8TOo1tykODjLH24wCuM1Ek7jM04qlqzauFEOBu08+AO3yebUgNUXQ7PQv7Pw21u
         /CJQTQGlCOQW9zagieCtMPeSIRfsourECkarpdwYPMHv5piaJWBI9CtNf8vC/xW10/oG
         JsXxGi1Ge7nvJJgaCh7oQyJfxcddCsJnuLD01jI6olbYPMNy5+oMtEPnhJpfMnughXfg
         /2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058055; x=1783662855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcraQoI+SjGv7MwiOE2COsWrr3yT+rAbe2XY9Shc+ak=;
        b=iRsge0CY6MZW9VXfyV3v/vHNl5rOcvr79gGVIxXNwZPoQa8hJeNB0eaUZcqR9fZNvl
         n22GQRlArD5vmSXVfAXYM3AqlkjEwVEa1KgT3fzhuS5iZ6JLjjbyhApkiGOSHi/0CYpu
         A7dBxh8S1H9j2eYu4eBqqON/BqMnqQAv3AUMT4oKA+xyclATYmeAwL51vD1p2SqC+6Cm
         yGcEh47mvHuXNvmXqgxp+29rMq4Vk+Go9E3zpaZiX2WulZxDNzESKhTX+rXYC7GoM6s6
         FKCSv5IHIEkrgmQK0l9nM8f40VFNF2LGJTQwNdO9+LvcnPNwd/cHai6UMxSXGGogimPI
         A4jw==
X-Forwarded-Encrypted: i=1; AHgh+RqyKGjBZNQwjwWlsgT70ndl0neEj2EpVFMQZlPnRpMravrDqjQ0vwtvO1G9Ekz5qQUq1ptrwmpgIHTnbOADgGQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcbxIz2L5m+8OpRjZk3p0gw49GvJw2MhtRappKBLOVABnWOLQb
	OhYw2jybrQZN3Jp3f+JIagwfC3sdWWRRPAzCCK0k3eMZK3v+d+IcA61e
X-Gm-Gg: AfdE7clUDB24a0Zva/YGpdQnANDCGTT2SFAxWMA8uMD2pIZh7ihYj/aLtMW2lsFEaDm
	eN7rVd5CbkwKs5bA/Q/cmDfJW8OXrh3L7FpVIs2vi6d+4WcIKgaprD41GApqYrm8ru5NTTH9JgA
	+IJEVBdc4Fd/oL42x/yfDfQpoM9frqMiC5Nfj7/BxbzRGFN0CdYEiWRFNoxjUZCFDq7nkvleYKX
	JZDyoyYkddDWdCRvsMBoS4/iyfyMyhmYNiskshUp+QteFXXD6MYQPu4W0v5i3QT/WlF/KehTGt6
	ARgMTEbqdEcP34dAgD2+lR3I1mt6fMMs5XNjq2nWkeP10iL7F1USkHzR9i5D3nIoFZL/QnqUVYy
	nq0MCpi1rC7+oLVeC+xNTqR5/NodDym6HK98PbRZL2kHBIkERZd2AO0tZpyqyS56OffZKuNbz9w
	JlYxaIsbzisslrYRckQ9ZfbGN83m1MUkXMvMIenNUvoy2n40E=
X-Received: by 2002:a05:6a00:a253:b0:842:4982:82f with SMTP id d2e1a72fcca58-847e177a4ddmr2707503b3a.2.1783058055114;
        Thu, 02 Jul 2026 22:54:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:54:14 -0700 (PDT)
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
Subject: [PATCH v2 00/24] ASoC: codecs: Use guard() for mutex & spin lock - part 1 
Date: Fri,  3 Jul 2026 12:53:31 +0700
Message-ID: <20260703055355.244898-1-phucduc.bui@gmail.com>
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

link v1:
https://lore.kernel.org/all/20260626061329.23264-1-phucduc.bui@gmail.com/

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

 sound/soc/codecs/ab8500-codec.c           |  12 +--
 sound/soc/codecs/ak4613.c                 |  83 ++++++++-------
 sound/soc/codecs/arizona-jack.c           | 116 ++++++++++-----------
 sound/soc/codecs/arizona.c                |  26 ++---
 sound/soc/codecs/aw87390.c                |  10 +-
 sound/soc/codecs/aw88081.c                |  18 ++--
 sound/soc/codecs/aw88166.c                |  24 ++---
 sound/soc/codecs/aw88261.c                |  21 ++--
 sound/soc/codecs/aw88395/aw88395.c        |  24 ++---
 sound/soc/codecs/aw88395/aw88395_device.c |  40 +++-----
 sound/soc/codecs/aw88399.c                |  15 +--
 sound/soc/codecs/cros_ec_codec.c          |  18 ++--
 sound/soc/codecs/cs-amp-lib.c             |  11 +-
 sound/soc/codecs/cs35l56-shared.c         |  19 ++--
 sound/soc/codecs/cs42l42.c                |  54 +++++-----
 sound/soc/codecs/cs42l43-jack.c           | 120 ++++++++++------------
 sound/soc/codecs/cs42l43.c                |  16 +--
 sound/soc/codecs/cs42l84.c                |  10 +-
 sound/soc/codecs/cs43130.c                |  72 ++++++-------
 sound/soc/codecs/cs47l15.c                |  11 +-
 sound/soc/codecs/cs47l35.c                |  11 +-
 sound/soc/codecs/cs47l85.c                |  11 +-
 sound/soc/codecs/cs47l90.c                |  11 +-
 sound/soc/codecs/cs47l92.c                |  11 +-
 sound/soc/codecs/cs48l32.c                |  26 ++---
 sound/soc/codecs/cx2072x.c                |   5 +-
 26 files changed, 346 insertions(+), 449 deletions(-)

-- 
2.43.0

