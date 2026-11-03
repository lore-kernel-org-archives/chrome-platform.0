Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680664;
	b=eZSCa7cNm9/UxN1I89DN6cd6EItGZ2fxs6dKMUzBuX2JaKNI6sISmvvrdTBZeJ6S9Vk2
	 zKmNiyn2QhiOcUqpBLryo9DSsXyqf6/EzxRD34ihe5cKNwNsSS6/GWQk51J+DPZfLLENG
	 5IltQwlVDuBR+rUHjCdi28AI1Nr6sUfBCYPlEk5dKNaUdihQ3JHXT7GzSzEDesyCCx3yA
	 26p4NljJt9XcgcHzv7iHHvUKEsOeTcWLd/UEW3Inmga9Xch/iGruzkuCrhDl83U4gIbdd
	 1qNSUMiQj+l5kL3IGmje367kSvJV3F7lN82/1kxWp/25nkrfsmNcq5lCzAoeue9RV1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=;
	b=iNcahAYK0JejVHwezaqfMWXHVXFzciwYxpY6OO/ez76VuAT/CFNt2byk55xYO1T6OCIx
	 PnmvY0/KIYm9nfLlLSbktxdipHH76uJrU64PBkPu8bdrTM6sCBtps/Cg0qXhSwU72c79v
	 BHMfy+9HJlN+cNiROG0E4v3BvUOsPxr/dpk0NCR0IvBYs4T8Yphp4otRifIUSQTQ4Kpb+
	 v4/hzHzHTLb0apn9ZzBUIZ2i5ICn/EsS0DxW1A+eM1qwM2eC4QHtysWVuI4IgiOE7eZ5e
	 eopInY03LrkMRbTTBleOk/ZjOwOllY9Oo0ptbMpShG3wB5M8Bd5kgDwKPjjGTHpXcbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YTO1OIZ4;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99149606A327
	for <chrome-platform@lists.linux.dev>; Tue,  3 Nov 2026 04:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99149606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YTO1OIZ4
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2773535a91.3
        for <chrome-platform@lists.linux.dev>; Mon, 02 Nov 2026 20:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680663; x=1794285463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=;
        b=YTO1OIZ47qYsBw01TBEH/Se4cV4AIcQiGyxI2A01KwFZf6avnI9kZyQRdSMc8rgAMe
         1Ic7JMfewZjcMw3FCcY3sSmrEUN/EGYyLwKTRU6KOjgW/RUzyAggrQrmwIVqKkSGZy8F
         78EKLKkKPt3IANuOLYMJGD8jUsWWYj0GpD5eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680663; x=1794285463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6wjbZhTp6FgAt4yM4WvATTLzIXuOKHx2x55i4aYjqw=;
        b=FcHE3Fmtj2L5R0lKPoJ5yKYhc0OEDosdGhDNQZsh3HXH34f/EwcLWBL4kGLAHuH+LJ
         Jug+BbnokQx/cXcBA8O3WR0+fqCiCjNI00Trh3uWhjDy6hiU6w+WSJDaEME4JNSvPwAc
         QgSHJvycmgzxSd48gt9w4SaL/CJfvG06agAYfObRHIB9KfASWMvNxOgpJpM3A1IlGh8E
         zK2Lwkm32VUiyjak6hMZ30Z27zkHt9a3rYlOgbnGFjx6RrHuEk//vkJDIYOJiFbPQiTZ
         4hsw/92RChrT/2wqGE/hMiV2gUMO5YvzXORsUfHPebKI0heaLCmvH4aO7IIA+jeyHqu+
         DZuQ==
X-Forwarded-Encrypted: i=1; AKwUvBz59FuJfzzIwNg573wXfH4TvZE57kqYVR0kFzq33Xly/EV9QY6qnzqzb8wDX75SAug9e2R5PZld87hReXWcTVE=@lists.linux.dev
X-Gm-Message-State: APuU4Z84k9O8el0PutcAfoXWC75NMbeGvibVobxb3LJfcn56XYlMkw42
	L1HwRduhgst90HbS3m7XMivmnC4LQpLjq4RnlPwafu/mq4EXrKRqVtvsdbYOL2SmkQ==
X-Gm-Gg: AYBFou0iBJ/TNKdFqQlGDrmvQhcpZbI1bGXzyP5FsYD+z4MdravZrUgFvfo0vv2qm0e
	0hppgdpitdKMdugqB66sVJr920EHtRIiozYmSZs3+GlYtnIWZsjdQWoOWeueFc08oEnFhvsSSq2
	xwxBgtXwQTyeKatpasGXOhB57hGoWNumx8HUyFXaAj9obZQWt2P6qN/hm7epapkGGm2cArcbyCe
	LMLYdV83Ef+X84/u5hdq7UTV0fZTgiJ8UI9LsOD4QQStS9Tq7JRIZG6ajA2dv8uYZ9dPSb0SHAv
	eeQRH0Q2/tF/na2h+72hHsdZxI8jiQxv9QcpOqwWDQCFtvYMBfIZjO4wzdPR6zd7F7mKfjtyUF4
	JNBzqZL/7oXPE7K7zM+dmzW4+7HF6r0XrhoEbqtpC6zpLd6+zOQ8w5fCQ0zH1VHS+NkfbTPFeb4
	kZ9EmUD2Xsui41ZcXmagldCH62LmyWkhO5XEEiympMjw1+U350Lfg/UkriJTjz8hs2MYYagBnfQ
	+msWf3dTT1H6JAbIacphC6VSXNs8BWgyWxZqRt/07u7YIG+BqVeHVo2kye0ssJT6g1lnQ462MUp
	xKLdq/PN3TtA1k20Zm3IgS7fZsbfB2ZacFzIJBfVi5IojKWmoEnvyGS2g8wmkaei6Gb4D7uYpcM
	8MHLrPf8dnrIHyD6HmeDWohtCocD46NWr5A==
X-Received: by 2002:a17:90a:b890:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3ae8e5bdcc9mr6988054a91.5.1793680662787;
        Mon, 02 Nov 2026 20:37:42 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:41 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/8] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue,  3 Nov 2026 12:37:24 +0800
Message-ID: <20261103043734.2179858-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v7 of my Chromebook trackpad supply fixes and optimization
series.

Changes since v6:
- Patch 1 (regulator)
  - Fixed rust build
- Patch 5 (cleanup op)
  - Fixed missing parameter in cleanup op type declaration
  - Fixed typos in commit message and comments
- Link to v6:
  https://lore.kernel.org/all/20260901074930.764550-1-wenst@chromium.org/


Changes since v5:
- Patch 1 (regulator)
  - Correctly assign wait_us to all bulk consumers (Sashiko)
  - Check _regulator_is_enabled() > 0 to check for enabled regulators
    (Sashiko)
  - Lock regulator_dev on final _regulator_is_enabled() check in
    regulator_register() (Sashiko)
  - Make it clear that _regulator_is_enabled_recursive() assumes that
    supplies have been resolved (local AI review)
  - Consider supply's last_on timestamp for regulators that are already
    enabled or have no .is_enabled() ops (local AI review)
- Added noautosel tag for some patches
- Added patch to pass component probe success or not to cleanup callback
  (patch 5)
- Only defer regulator disable if a device was found (patch 6)
- Link to v5:
  https://lore.kernel.org/all/20260825041628.988369-1-wenst@chromium.org/

Changes since v4:
- Made regulator core try to set last_on timestamp for regulators that
  were left on by reset default or firmware, but not enabled in kernel
- Dropped two patches that were merged
- Link to v4:
  https://lore.kernel.org/all/20260811122011.3539250-1-wenst@chromium.org/

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

Patch 2 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. This uses the new "enable and wait"
regulator enable function.

Patch 3 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 4 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 5 makes the I2C component prober let the cleanup callback know
whether a component was found and enabled. Needed for the next patch
to only delay calling regulator_disable() if a component was enabled.

Patch 6 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 7 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description. Should not be backported without
the other driver patches.

Patch 8 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 2, 3, and 4 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers.

The DT changes must go in after all the driver changes land, especially
patch 2 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (8):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: Let cleanup op know if a device was found
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   8 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |   2 +
 drivers/hid/i2c-hid/i2c-hid-of.c              |   9 +-
 drivers/i2c/i2c-core-of-prober.c              |  34 +++--
 drivers/input/mouse/elan_i2c_core.c           |   7 +-
 drivers/regulator/core.c                      | 129 ++++++++++++++++--
 include/linux/i2c-of-prober.h                 |   7 +-
 include/linux/regulator/consumer.h            |  21 ++-
 include/linux/regulator/driver.h              |   2 +
 rust/helpers/regulator.c                      |   5 +-
 rust/kernel/regulator.rs                      |   2 +-
 12 files changed, 176 insertions(+), 51 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

