Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438FAA92E
	for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230387; cv=none; b=W6UZsKal6snbwdcNyAzncvst7MeqY1BvSIIP7Sc1OpqHtVYM7xRfRNlgG6I7oMAkZEzOBLZDEn3SgNR6qHfEVXNCemfSUrTNXR5TMzKh2WisUcSxVfRseLwE1Df4hSeALtP0A+eT4oGmw78R3g4Iq8OuMfQtsw7RqHYV+FJ8ydk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230387; c=relaxed/simple;
	bh=ixRYONgnygzUENQX+ohridJXTFmoDUomB21ryQ2dw9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sBoYQutsHnOgMHcb0EHtAtyZ93FbdFQx7h3uRtMcDBLflNFBs3S4CyIHcGz+zCBkefmYkJfvBs5uP+jgQ/iB8Ym+Lc331EkdGQRt3Qtl8KdECWpE8YS6cj/G1jjaqQB05NlSon37Yhxj6d2CJgog6neP4RJLtQSDrSV6Sv3ZkNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JZ+tcya8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JZ+tcya8"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2295d78b433so42969345ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 21 Apr 2025 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230385; x=1745835185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AOgrKhqWzlPfaierQD2uw1OzuGW6898QT6wOBkGCJE=;
        b=JZ+tcya8zAk1R3ijSdblDDd2VgTWP/8dl0CdbeerfNu+tsgSze69TRCa3coJsTSpLR
         BsPXRkAzibMwhUR9HCRitDXS1FLCTNiUPvsOq1v53epX5T5isP/8A4iJWhwsLPMvvj7k
         3k4hmbb8qiLwM0BBx04ILisFI577c0dFUS7ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230385; x=1745835185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AOgrKhqWzlPfaierQD2uw1OzuGW6898QT6wOBkGCJE=;
        b=jdTHCS20wg9UFmI12ocfLEu3bdgo6N2HlBHB+QcZ+LpODMqeERE01nQfz3xdaj/ebh
         s8Dw9UD+rjofCIWntGesDH/aP2WUsHfbsL4Z1cJHVGnhDdMcnEQXE370RdbsXh+u+OPM
         HTzMr7hQa0b/RkU0GcOmV5NdfhPpPEDlEAd4VYpjLhBzkoa8pJYwCaG2ykybSAhaOzmS
         6NrjK0hAS2sMFeuPzU4lqdurTxY3ibM8fL2CxUCWjEkP7tuSvhy8IiBx+Q9usG+b/QXh
         NqlEYEdWfRidalWbviJ8dxLM6+3K8/bG9xqDBIEv2LiPfxh5flbRAxgv7BmQoF8G/qrC
         ieBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5J6y0nj8Ce6vCtEXOkqtcYpLq7dztu+hHmjGW/Dvm/X7FNNEYYe6iHfKDrFg5BJo/i1RZbGlOMKTLQd3OCu0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJckoM0IxDW1b9FFmsbWntRUzAtOszbXI++U2Q4FGxWX8B1upl
	HuS3phWKh26tHfUvsj4LQ3WoUcQLlRHRdHh5CQdP/I1FLz5TWXzco28RZrvNbw==
X-Gm-Gg: ASbGncseGVgmO0G4Uw1FGAe53gUjytMv12DZZ7iKgbFTKZiat6ZOgQKDyOHcfot99M3
	YM5tPg29Y1Zkh1LYtT36CjHWe/4TYhF6yrs0mq9PjlDFcFYi7PUd3yK1yyj44PmAronEKkxXTEn
	Gi+NoqQ6aFi7XXqKcl9/XtOHMJ5ublXsqclnhjoQ4J3/D2KFm3H8S8Hxsh0NUQ6UfFruiG8HfJE
	owSlJVgQYVI9xkpGmXbJdd0iszlGcmQ1DmH08ooDBjh93/aroBtZNKTBM7tsETCX2N3OV0a/TPr
	smmaZrgKycydoUJzoKCV5RhAEkF1wnS0BXHctxBlW32zHgXLIAdb8YbMP5I=
X-Google-Smtp-Source: AGHT+IGnpHCEjIJrIXmHvs6VqUJ4pvMmeTt+m8C/FSrMMx0dcqiEAz4cygU8b09pUtOZGuXYRXJLmQ==
X-Received: by 2002:a17:903:19ed:b0:224:1c95:451e with SMTP id d9443c01a7336-22c53607dffmr160232245ad.33.1745230385598;
        Mon, 21 Apr 2025 03:13:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:05 -0700 (PDT)
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
Subject: [PATCH v2 0/8] arm64: mediatek: mt8186-corsola: Consolidate and add new devices
Date: Mon, 21 Apr 2025 18:12:38 +0800
Message-ID: <20250421101248.426929-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v2 of my "component probe for Corsola devices" series.

Changes since v1:
- Reworded commit message for Elan I2C-HID binding change
- Dropped I2C address constraint from Elan I2C-HID binding completely
- Dropped enum from new compatible string entry in Elan I2C-HID binding
- Picked up Rob's ack on two binding changes
- Rebased onto next-20250417, resolving conflicts with "spherion
  component prober" changes
- Link to v1:
  https://lore.kernel.org/all/20250312104344.3084425-1-wenst@chromium.org/

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
 .../bindings/input/elan,ekth6915.yaml         |  12 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
 .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
 .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
 ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
 .../platform/chrome/chromeos_of_hw_prober.c   |  29 +++++
 11 files changed, 167 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

-- 
2.49.0.805.g082f7c87e0-goog

