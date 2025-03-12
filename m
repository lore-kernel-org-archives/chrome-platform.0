Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C70E23ED7A
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776234; cv=none; b=tE+L8dmTpsW3gcEdkyjV9uNB3zEFYVcZF5/6f7gqmrZGq9Fo9ICHw3ezmrrYY1uSg9DWsqkwnVO/Cp/tkyfcULdpsHSBZJbn6joupqmfZrdK05zGz+VwDhnWYZlNfy8yXwxsTmQFaivJ3gOlGBu15pCGKgaIEIhE5zy/jFZkOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776234; c=relaxed/simple;
	bh=E5HHwUQ5W46oZ14AYATkIXSSrCcrAZBPe8OWfY2dZGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vekd/ncTJbKNeBPaMnyCp+5HsqtrSdAQADDvGqGx90vgBQ+dnVycsTqlU4AnQvDf5xB6Zl4Q3oMqYAwxKvcKVSfbPIGB0u/srXS6W+PDUdrP+qVIIT4at2NKGt9PGndaX+KwxEkqtyTY6GVzGPiXld5Rz9B3lsYf1FO+vKI8aPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cZzMfpI9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cZzMfpI9"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so13262302a91.3
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 03:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776232; x=1742381032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L51FLDBP/NVINxb14cO3l0go6Z1l639IzpDfowui3bI=;
        b=cZzMfpI9snIlaMWvAMPK9GJzoeD0IUGw0gx1BWHaBZq6MqzCTqZOdfx0bS91TNbE+y
         6W00C6RUxmafxm2kaZl+BF4qbHwcar/C0EkDYKSXEccaTctmCjM86s15l2AodwHjD6Iv
         oJbHAoFgeG1v0i6Om71TZzwiuYrrQ+ITQJIgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776232; x=1742381032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L51FLDBP/NVINxb14cO3l0go6Z1l639IzpDfowui3bI=;
        b=kGRagkDnsGwx7ZBDw3gm+phHCaDBZM2trZhbguDrM5uHoh6CBptQDsJcU5GtundJCO
         ELh/A7ocKO10aoI+0yOcasiEsfnO5QZIFuxpwhAI92DwqczC/Pc0/YV6M2GY4pAAs0Z1
         UfyfZeeG5tF3RiLdr8FQCWVPenI0DXAOjIXcsXW3CPkbDjw1NfRwk14GfsUHmkXDnMfy
         kGWhn75JkxExnPqIVdCdNJwwiFh7mFckSiUhMp9ptyKorRK4V9Wl8fZz++Qg5oVEizTS
         M0aO6T2nDKybpQhpuaab05woVlZmBqG4QhCXS0w2FHb6Ki5AR+b/xoVZfzc5AR3K9aSC
         I/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi8w28rUURaC+Bs0m3YxRhBb+wY9l6O0ClMduNLaseHQKRIt/mP15wzY7pFhExwrtBdQVJOeCcBGsOMZ9vnUY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNSZccVsQc3f9dEr6tGnxMxS38iNdY19mCytFI/+TOAZI3pTMR
	n6whERwzLCot2+NL9ZfTB4Hu8/+N4Cpgc5WrXtVHRwrAq+Nywl2quchHXNtaxw==
X-Gm-Gg: ASbGncsAy0sRLQ5oG4x9O4k7Jb1iRLqkwjUV+zQzZRDShxyadEGxt9miMkMH6UWd7mb
	Bqm4dW/Yevt/uJ9vxqQS9QIZh4TwFcIY772fbuXuRObAuLlCPjoXccS8oL5ng3Q6dd55mNX78cZ
	ssTR/HVB2riDz078Q93qUcNOYJ7d+nFFTS75OX+s8xmKZ2ISU5kGNHHh7U6AgbczjfBVCmTtpqh
	uWRXo15WP9GgZ7VktlOTHgdMyBrFAHVnxSJoeCDd27GkolBM9MtdViCx7Ziv2wfCiayoEJe/4gb
	n7mUmFnr6qzixetmT34fSpwqL53rKT+r/LxIpUBVYi89cr/GrX8fcNhe+C88Cis=
X-Google-Smtp-Source: AGHT+IFwYKsuYFk05Yb2ZLG7oOnOSu3sTQBXUECA3daxKB2RdxKe0gDbN37+1iCGZOUpVOTrPKRIXQ==
X-Received: by 2002:a17:90b:4f87:b0:2fe:b774:3ec8 with SMTP id 98e67ed59e1d1-2ff7cf13a91mr25942847a91.23.1741776232319;
        Wed, 12 Mar 2025 03:43:52 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:43:51 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/8] arm64: mediatek: mt8186-corsola: Consolidate and add new devices
Date: Wed, 12 Mar 2025 18:43:34 +0800
Message-ID: <20250312104344.3084425-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

Here's a follow up series of the I2C component probers for Chromebooks.
This series enables the component prober for the Corsola series of
devices, combines the two existing Voltorb SKUs, and adds a new
device, codename Squirtle.

Patch 1 adds a new HID-over-I2C touchscreen from Elan.

Patch 2 merges the Voltorb entries in the device tree bindings into one.

Patch 3 adds a new entry for the Squirtle device to the bindings.

Patch 4 fixes up the existing device trees for the component prober to
be active.

Patch 5 merges the device trees for the Voltorb device.

Patch 6 adds a device tree file for the Squirtle device, with I2C
components ready to be probed by the prober.

Patch 7 enables the prober to probe trackpads on some devices in the
Corsola family.

Patch 8 enables the prober to probe touchscreens on Squirtle.

Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (8):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
  dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
  dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
  arm64: dts: mediatek: mt8186-steelix: Mark second source components
    for probing
  arm64: dts: mediatek: mt8186: Merge Voltorb device trees
  arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
  platform/chrome: of_hw_prober: Support trackpad probing on Corsola
    family
  platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle

 .../devicetree/bindings/arm/mediatek.yaml     |   7 +-
 .../bindings/input/elan,ekth6915.yaml         |  29 ++++-
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
 .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
 .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
 ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
 .../platform/chrome/chromeos_of_hw_prober.c   |  29 +++++
 11 files changed, 185 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

-- 
2.49.0.rc0.332.g42c0ae87b1-goog

