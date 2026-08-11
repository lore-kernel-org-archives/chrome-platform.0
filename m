Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0F643E09C
	for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450833; cv=none; b=drqrvEDRnK2wlJlETa2MYxXdBQXS0hzSYufiwbX1NsyfKL9KiSHgVaMVVAcNhprgqpfDHDccZK/yyktz8dAHx8869Y+gg+TtMcEwbRkFK7AEsTc+KQeiEk8KcQ05VabRpQt8+n0sPc4Oykr1KMxzI84hkY989IC7BMDrwpVcuOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450833; c=relaxed/simple;
	bh=z3+Ivh2jCKhd8EuEEzRHJUPYWNvKLd1Q/rinjxIyM9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DK1Hk/kSJDtV3sm5ZgorCE4NW6eBkqoO6KblfptsNmbPR2/fCKBq/Pe2ZPV9OR/oxebNrbmA3Pf3hQ4Hx/B91Uq0vfwLpn1DaH9vuCFgHJEdPGsySmUZjkcQJZJIUnOCb2rj6739zlKXwPO+R7fT6Ll4fvEIbE7tiSbetiCfkuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hFkJtkGX; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hFkJtkGX"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so479634b3a.0
        for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 05:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450831; x=1787055631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDHJIqp5FLLywri4WBqUbQEMXacNkK0ILuDy9FjFATE=;
        b=hFkJtkGX1nRMFdT8WACHgvXJ66t/dHrE8OxaC4n8ARQwL70aPcBz591/ArTrA0wq10
         q5hvRvUZaQcN0+tX1vV3MA/1skUmmz5761em9InQ2F50HBj2EPpKZ3BnSHyV4b2g1WT+
         4VmJbuIlZZurII8LIAqfAAGQ0eeot9c7uBMbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450831; x=1787055631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDHJIqp5FLLywri4WBqUbQEMXacNkK0ILuDy9FjFATE=;
        b=NrtMi5f6vtJZPWOjTOrB6PqQs6EIxKaL103beSfc+gwszGt/X4t7TwMvmbREY7aTZr
         2B7NnoxjRHQleMsUfW6tkZuVYqo5Ppyd+6mshlTsMCEC60PGsLKhATBIPH6oTiPZ54B2
         DJe6TTjq8u8MZyUGALHTBDd6Ihd2dOYQlVICzgAhjDahWyZ1+R1gSLLco49LDPEYA9mM
         JafKt2cd4gRsTd3HQlmJe4TGyKZ4V+w8+8+/C7ivNHrJJL+4mxzCYvUKFylzry+A9XjW
         ynGV3NZoQJCo7VTdkaOhRk9sMT/pcZraljdm53YX2oeZQruZpOcsT1qJ0nz25xUTyiCC
         75OQ==
X-Forwarded-Encrypted: i=1; AHgh+RrC+uWkD5l0bT5vVN/ls+ABOW3+3EiHPkFzbsvGcmMYx6pfWBYkm1k/0sdiwIY7qzAcrvp0p/A1bm4l45euveo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8RO7JIFVIYg7RW/gG6Z37/AcF6CP92V2JiKib+sxmr1MBEIwK
	nybMrWln1pDlPHT4x1M+WQ/EcBTjeudasPy85PIYtgYK3GiPGV9DigvuMg4J9/hhqA==
X-Gm-Gg: AR+sD10qdzP2iK+q49yh87nmLPlEkwDaBwjjSOkhPLW2EA9ypY2TBmOvbDwo08y2ha8
	ei6+VBE//ib8Z6mOYIy38/1YUWaWHJ8QtalzVrErCjnrmmkox6rwpmFQBrzFTi8u+hTLe0Z/giD
	6V9IMdTiE6itSM0f3Dy1aquq+5eqj63FUDZi/+DFHZkcZvnueGcgRDgRhIje4SybezCay+n2/dn
	yREjJR9qYaXVfCL+Z7cV0ep2LLtXOk+0wxvrWXjML7tCe9mPwVEc97lcpItypxCSUsI6ue7lvbM
	imFZmK/JhcDTRT/hhSDPQJZu1H+ix7+hcffT3v91zeRakkS6MxVyVY+kqQo0o5la6SfukqM3uLh
	Uym/XWQLIcNqhPGutZgYm7pdg1dtanp6ZZ7IKyYXHKqFQkc/XJRJI0oxbLh05tpEiIPwZTDzsVz
	5KYMlacjO/LNFmXkX5zFLAzPMDtCwT/b++WsjnELX2WvG7d43iUVMTzSa5wbiwsgwTXlPllNGQU
	+OzFoEuqUaVn6BtOI6G+N/hxt63vmU6TKAtbzxMk1p5Sw==
X-Received: by 2002:a05:6a00:9286:b0:848:63c9:ee39 with SMTP id d2e1a72fcca58-84fa8842387mr2815346b3a.12.1786450831335;
        Tue, 11 Aug 2026 05:20:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue, 11 Aug 2026 20:20:00 +0800
Message-ID: <20260811122011.3539250-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v4 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v3:
- Added __private modified to regulator_bulk_data.wait_us field and
  switched to ACCESS_PRIVATE accessor for the field (Andy)
- Moved wait outside regulator lock scope (Sashiko)
- Moved "remaining" value assignment closer to conditional (Andy)
- Fixed variable unit name in regulator_enable_and_wait() prototype
  (Andy, Sashiko)
- Added commit message section showing average delay needed for I2C
  prober (patch 6) (Andy)
- Link to v3:
  https://lore.kernel.org/all/20260721075226.2347933-1-wenst@chromium.org/

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
different maintainers. Or if it's not too late, Mark could take patch
1 for v7.3-rc1 and the rest can go in later.

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
 drivers/hid/i2c-hid/i2c-hid-of.c              |  9 ++-
 drivers/i2c/i2c-core-of-prober.c              | 25 ++++++--
 drivers/input/mouse/elan_i2c_core.c           | 23 ++++---
 .../platform/chrome/chromeos_of_hw_prober.c   |  4 +-
 drivers/regulator/core.c                      | 64 ++++++++++++++-----
 include/linux/regulator/consumer.h            | 21 ++++--
 include/linux/regulator/driver.h              |  2 +
 10 files changed, 105 insertions(+), 54 deletions(-)

-- 
2.55.0.679.g6767b8d81c-goog

