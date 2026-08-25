Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83172D1931
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 04:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632412; cv=none; b=k57pFdpv3q9j1rwddJx6AHmrt3Iz45ZWIUg8nwn+R2K5x688aUVArrKInsqrPg1TgBvbkTsTdk7FKCpjHSBcCXIl0oLlfQ/hBIp0HXOjo+2AD09PBHVAR8VJ9uD6LBA3NSagSuumOEQ8RKfIT9CYZigAyN5mUYpJ5On/rIGDxqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632412; c=relaxed/simple;
	bh=naC7PasILh7V9am2ebalC0RbUKLTLStW+MGCGU/CcoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oeb+jpmGGf9pnNcKd+T3HwskOFy0sxJfuM6xEPFojp7Pe5rGSeHWdhjatdqWrWg2I5aSPQR8QbmNWOcPiURV6bUBRxZXlM6GjYsowRKmVkgPbvpxRdLMLib7YUVgRgnmL4oJj4jEg9YVrgCeO0s7CtU+bCXFivvGiM4Wg9hpIg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=giyYHbYt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="giyYHbYt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so393155a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 21:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632410; x=1788237210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJaZXX8cNoxV0uNCu7A5Ojv5p0WSmZqW9OZzrJevJb8=;
        b=giyYHbYtlL9lLXE0lcK/dhbLJ8jU/EoQTrJNML28VGpEDyEQqOKs31fBMz4VK5cLmC
         LoEfYFznwqhP7mUd99VciWh+n53kqNZJcOYHh+w3rkvx8CfEMwHQwWlREw4mkFdW7rwm
         PCfZKwsCwq9ytDB5OwbtvCIA3/TOODenpaySU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632410; x=1788237210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJaZXX8cNoxV0uNCu7A5Ojv5p0WSmZqW9OZzrJevJb8=;
        b=L40z8ONmOip8QtgzmSlFZEmelMjNY2gTMmQ0scIDRTxuojJEpdjoT1cKTwRdmvWlQJ
         xiAYx6X6v+A5zxr9fNHbqMUWj6Kut6CRz7uZQxuTvZHz+3tpK/eQ7h6HbgHd+RA3qfhC
         VEm3ip/ktOgoF+fDNORaDrbf/54+SFLHphvBAS8370IKhXGJCOTqs0thYCnipnW/hX7s
         KqqPKxc6s+4Cp5jNT8cD2Lo/Sm3FYZzcaNSnIYMH1QtxM3KTWWKFq1RY3lphA+xOTlkQ
         FjsAjodRiy+fptrKQ6dGuzuwxcwXy87XDQfpb7XchYnHZUGs07CVCLvm840WupK1NRAE
         twwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCvt0vWgRXgaAJzMER0GZImX+qKhNkoiG33hgodwOlTFmrxYxIzCs4AIoTxmSGOtDXMxoAhxR8G9m7xvue9ZM=@lists.linux.dev
X-Gm-Message-State: AFuF++m2qq7Xxr8/Joip892+36i+FwO6rRAgdeWfcD9Lx0dZZKxQT/cC
	obrdLjauEh8OYW+A6hVgpqu0GpHfSMIoBbIpXlziOlUtoAFwEaClaWrpYZbw7Gtj1g==
X-Gm-Gg: AR+sD10YKz5TELqWhMh7DVOHdG4QTFRrwtqU35b256Egc+oTs/HWhvTHW4S8021yly7
	dTAMRUbpkvdlsf5V62uKieImp8kbhE9RaGD2AtFN4Vr6R2xSLlDGye7EM3HoVjPJCTDXb4a1+LV
	h3UtIbbn8BlvHPhoNQu32WIIFxFHk91aq0ygwdYskrpl6geO3P+0wgPgUIbe7OglhUjYagth9gB
	yxaJMKS0z8YkPnkMM/1MYfdW/z6l8t9zn7pdvMV/24Tj+sYq8Yt7TLpuw24fAFTB8LgLHOOQn9O
	or96kc2U5e+ITbQ4fOJLGC6UVlzCG4feki1RfcgkGXUkdDjZN2VRl7l/4L7U20S2L4nBCF5TsnC
	3tzAlY06gq11o0uuXphsuKGHqo3qgk+iRSxZOQR0VWHZ/gMZMFHxCtU+MghMTpnt3IHhUTY5BgQ
	vdEmFwovyvwDpB22aRaRhXJIcus2sZJS8btG3laxOK50jRK9l1uFc8PKriaIeFh/0K9M1Zj3kdE
	L9bXZUn89uJnuPEKDBvyZJCKTzCFx4mssOX+4OM0APvmCM=
X-Received: by 2002:a17:90b:1b04:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-395c33406e0mr52907259a91.2.1787632409907;
        Mon, 24 Aug 2026 21:33:29 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:29 -0700 (PDT)
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
Subject: [PATCH v5 0/7] arm64: mediatek: Chromebook trackpad supply fixes
Date: Tue, 25 Aug 2026 12:16:18 +0800
Message-ID: <20260825041628.988369-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v5 of my Chromebook trackpad supply fixes and optimization
series.

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

Patch 5 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 6 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description.

Patch 7 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. Patches 2, 3, and 4 have build time dependencies
on patch 1. I suggest placing patch 1 on a separate immutable branch
or tag for the other maintainers to pull in. The three patches all have
different maintainers. Or if it's not too late, Mark could take patch
1 for v7.3-rc1 and the rest can go in later.

The DT changes must go in after all the driver changes land, especially
patch 2 that adds delays to the Elan trackpad driver. Otherwise the user
could potentially end up with a non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (7):
  regulator: core: Add "enable and wait" functions
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently
    long
  i2c: of-prober: skip post-power-on delay if powered on sufficiently
    long
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
 drivers/i2c/i2c-core-of-prober.c              |  25 ++--
 drivers/input/mouse/elan_i2c_core.c           |   7 +-
 drivers/regulator/core.c                      | 117 +++++++++++++++---
 include/linux/regulator/consumer.h            |  21 +++-
 include/linux/regulator/driver.h              |   2 +
 9 files changed, 149 insertions(+), 43 deletions(-)

-- 
2.55.0.860.g4b6b3295ed-goog

