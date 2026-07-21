Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879734195A6
	for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620444; cv=none; b=QPoY+PvyhnZ1+nKrawvyGIrIgSKC99E/D9brffTJFxcEXmQGggSAfJlv4sUmxrXsFMEDoQ6/FXanp5nF61WQ0hbm+3fmAMatNtElahh9UIGCSZiWuu6J7tG8aMtyD+19FO2XTIBgrnq6NrZK8nlGbbHf33Kng469CsbbQk0ClSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620444; c=relaxed/simple;
	bh=XbhUMMlW4dlSM7JU/MuPyutK2kIopX7DVU5/wV0oYo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BkGujzO7O6slOnd6tqFO5xKSmXCEM7HSKsbinqX9n+ZhDbeDcAb9osdtl5djzdzCyXVZmgRRjp/7IoNi4KYFVLhZRFKHnsdDElgl2O+1gvxzqXyhyFth/pCZ0rHT0gzNyYOZWZ7DcqxJB81HBQdc1z6Mk/h7gnRqJV+cmkqXsNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hoDWR/zD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hoDWR/zD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc73e322dbso128758555ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 00:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620442; x=1785225242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UfUXCr53MVmAxCgEvl6p7BqmYW2167OMSThHKBq4o8=;
        b=hoDWR/zDNHtXneBaE/l3p3AgHQNEEGPiHHIP+vqvEFudukdkdFSb9jVSiZTMogkaE8
         FfY4o3n2YxBALlJ/a51EK6FzVtdT5idK2nH++OiLUke2Yba9n49OLDZhZw9LZ5IqPh4M
         U9MiKphFys9k2hHNYywHR8Y2bYzRZUp6A7sig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620442; x=1785225242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UfUXCr53MVmAxCgEvl6p7BqmYW2167OMSThHKBq4o8=;
        b=MHPNf40aXxZmfWhqOg8ycB1A3jPXVZ7jH6qmR+cOFtkKFJVrHdsGt8GJSNotaGD1+6
         HNZ4CVbqKKcRBDTUoDFpTiVeBeJWISnE+yTDuj8o2yKsnKUbjdztOEF8gFfSxfMJgx0x
         LJ8NnQaxCNCevijvwL2bmerJ/DrRAtDo0j67vUcMXpjuxAxg5UVCfofqPDc1s09TKoDk
         EehsH8SN/E8OZtvYzFrelDuteYcUCCfVfW3RZYIZmHy7Ir3cdITy7/4EgflRdpDc6DlK
         uSySFxF8PNflBiIwP0LCo7kS3LbWGsPgTa1u3Q7otPakNQ9hU//L9lW8TpuF4QvdX2Xv
         Kw8A==
X-Forwarded-Encrypted: i=1; AHgh+Rr8ZhAWbbntOBjzayIvBFnWSkOooLXOol4Q0DiMEyIcH09hBKCKJPo487fij7OjrK5+ycAvqgwvpV9z2ngrJyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx40737UptdFjV6NNcrvdRpWwjedfoi9UZOPzFNZK6Zb0hyVLew
	Q0GwxKbNwDUKubChYRKdiThXHxruxzvXI+tluHBSJrVHXLO1jM37K8DBVt3s11M0+A==
X-Gm-Gg: AR+sD13Aki/BZ3V3epQh5QDTy+bZPGX40SHaEjo5fGb/iV90mRGRSMcEpct/zQ/Y+zP
	ew/k12cboVJp0aXuMUvAvCWy0SzO2Wr26H5ioPynTzZtCOaGw8Un2BTVLNa2+bp3a3dGE2L2hCa
	oB/0fPZEkUsIKMNlxbLZQaYzQYYci4MX9XcbuSVIFRmY3zOHOgSQbzci16WGO9f2fLQ+G22fsYT
	r4WmO+8lTjhsgIfi2bzSOKICoIYrxV0CaRDw/EQCGlL4AJ88XLeuXkuO66/ilXCRXvXBL4pcxu3
	gAkxC5GF7Zk/sD29MR+mmd8Ep7CUzRdCivnQxx6mRlLXrwDnFw3iP+Y5reVTOb7TYQkUB6RH+0R
	ProQXNaCj3o3+8hUhvDLx3wyKQRGEXNS9VqhYtMLXNxnSAEsu6V1tHIpWlMY9XR4PoMOAtgZG0S
	3hSRPLaDb7C51OF26IdAQpV8Dv81gA5UHLO/7uCj7BtWPPccFHQxcq28szdNs=
X-Received: by 2002:a17:903:3c44:b0:2ca:ed41:d331 with SMTP id d9443c01a7336-2cf34a3f5c3mr188180995ad.45.1784620442019;
        Tue, 21 Jul 2026 00:54:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue, 21 Jul 2026 15:52:14 +0800
Message-ID: <20260721075226.2347933-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v3 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v2:
- Added new regulator "enable and wait" functions that wait until at
  least the given amount of time has passed since the regulator was
  last enabled.
- Converted patches to use the new functions
- New header inclusion cleanup patch for elan_i2c driver

This series fixes the trackpad descriptions on some MediaTek-based
Chromebooks: either the trackpad's supply was set as always-on to
workaround missing delays in the driver, or the delay and supply
are missing from the trackpad's device node.

v1 was just the first patch [1]. It has since grown to cover multiple
drivers and devices.


Patch 1 adds new "enable and wait" functions for single and bulk
regulator enable.

Patch 2 cleans up header inclusion for elan_i2c driver.

Patch 3 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. This uses the new "enable and wait"
regulator enable function.

Patch 4 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 5 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 6 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 7 adds the correct delay for probing trackpads for Hana devices
to the ChromeOS OF component prober.

Patch 8 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description.

Patch 9 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 3, 4, and 5 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers.

The DT changes must go in after all the driver changes land, especially
patch 3 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/


Chen-Yu Tsai (9):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - sort include statements
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  platform/chrome: of_hw_prober: Add delay for hana trackpads
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  8 +--
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |  2 +
 drivers/hid/i2c-hid/i2c-hid-of.c              |  9 ++--
 drivers/i2c/i2c-core-of-prober.c              | 25 ++++++---
 drivers/input/mouse/elan_i2c_core.c           | 23 ++++----
 .../platform/chrome/chromeos_of_hw_prober.c   |  4 +-
 drivers/regulator/core.c                      | 53 ++++++++++++++-----
 include/linux/regulator/consumer.h            | 21 +++++---
 include/linux/regulator/driver.h              |  2 +
 10 files changed, 96 insertions(+), 52 deletions(-)

-- 
2.55.0.229.g6434b31f56-goog

