Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020B33CC300
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079774; cv=none; b=IcnkSb25st2ErXoj/5KrmQS2RgTuf4ikleLLTeZzW1Z5y8x53SaFjgPcvPmr0pHCN9jcokjrkt5fCw6f+UaFa1VlFs1EHRZlAGj6aHdY64T0nN1gsQibdQ437qZVLyPHCmGXgx1+L7dP8USUkOasNkdPRuHhqFBzbvteUq3a+50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079774; c=relaxed/simple;
	bh=rrXrFfcpgUSDXcQY8qvwp2yElhHCMUlGClGvoeo/dXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7m9pp3gBmQjnp3oQELcKmQBD7x1QIveGNYpjjQ5NhfSS3ShsDWSENIErPKzPnnXBrPd64oj6uq83pYI8nxs+ZOV46OMuwLT6pBF7gD33RO8QAk9Cyk4ncNtioZfDWcl+jLaIg8nwJUzXIlIlOdehowNUEFGHDQLWPCXNBuaxyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=moaoioPO; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="moaoioPO"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c96d2bebca3so288840a12.3
        for <chrome-platform@lists.linux.dev>; Fri, 03 Jul 2026 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079771; x=1783684571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0B1463+Qr0zm+lZPP190miffZziNrhNxavOC7rjqnck=;
        b=moaoioPOS+XhCzoTKHWLbcSPtTP9IM/KQlSRnGQTrQrTGsDb96pc7LO3eok6ciOZc0
         kcTfVgR166Vy9KzCqLyczRZQGiQQeJa/GEiMxRbmvaLTX2N4nhsBUrbLtVzi73IqRaEC
         r1Ls7HSAx9HgFZpry85Haz/SbYZxtjNGzB/Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079771; x=1783684571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0B1463+Qr0zm+lZPP190miffZziNrhNxavOC7rjqnck=;
        b=mJFNM0bcAJoYv+RsKk4ax8LgpYywgMvOBGl4PKuygwIK3ar9e9vYx+MjGDeMUglFIY
         h/sy7SoRkHpkmdFtEd1In8itULBI2K0zDmOExj2wpB06YB2k61GQuun0CIWJXcl9pj0X
         HRYNc9aCA1MK9mY7jMDNrm4w69lX6bRPdYkQ+mh0TXJcWgUPuLZ7GrhrXAaZyTy3ah7C
         We6ryA5WXfHfDlVPhMaYFGBw+UJ6DrclrGy6Rj0PaVv1TBqH/pvEJFZglfYg3iOLybNQ
         9YZmtsNOKfxMuDyqabv+lumlJRljmZVo9IU9Z5rMUW0fGBHjJfB7yOeFD6b0HZunwwP0
         yw1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ZhBKd1fbtjG7dHlzIRyl6Xb0ytGXxI14I3UMFyt8kyPObUWmskaKrihg2++6G9dRkGR5E1ullSznkgAeEmc0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0KdwlpekBdGw1fqkSGmJ3FVSLpSfcjozcmuV8DkCuAdFD4ng4
	vEecjxCf8DpZ5voVxEGykfKwKYLnIo1QGjIoQsJLGHo1/jdWdJaCYudET3XtBmomZw==
X-Gm-Gg: AfdE7cker1Li4x+a1RVqmWfbBPu/8xpW6E6dnr0l1Kd6pKKDxkx5uP+/acwIXvRlbp4
	TO1IHSAE07CKrArTrtWf3VZVJf6Z8QPfaznqw/D/0zOVHI5q80bsDRMvkveDzebYVynrEtubuWo
	HDeXPMYwy9GCuVWwrb3nl6JSOQwi0qPFdgte3MSI0CaqbeqwE6XXgw4yDl87HN3v7drEFzkapdC
	xSQbn/pDc5ese2HsrmaiFlFhN7zK/n5AQvFO5/VH0NVTj1O9AQvENAk/lrByIWNgsH3HEtRRHqZ
	fGY8++frOuem5SgQYhLnhFQmz91wDCbtMBc6JavrrXhEqGr2rhpD+4MVnx03+TSpnqMyduzVnPi
	rmPHX6CW+5ucn7ArzSroJklYCqyi58dbBLxudbOLnosiDOQd4RoMWUOI7umkeAumHqu2JFvf6Yy
	F3t0Zq6WoD/1y4M3uydQmige1+8dYmHJyUWDXi36Fdz78XpsCBEvDrqDdAkL5+ymmsoc135Q==
X-Received: by 2002:a05:6a20:1602:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3bfed505340mr13580575637.42.1783079771207;
        Fri, 03 Jul 2026 04:56:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
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
Subject: [PATCH v2 0/7] arm64: mediatek: Chromebook trackpad supply fixes
Date: Fri,  3 Jul 2026 19:55:53 +0800
Message-ID: <20260703115601.1323491-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This series fixes the trackpad descriptions on some MediaTek-based
Chromebooks: either the trackpad's supply was set as always-on to
workaround missing delays in the driver, or the delay and supply
are missing from the trackpad's device node.

v1 was just the first patch [1]. It has since grown to cover multiple
drivers and devices.


Patch 1 adds the correct enable delay after enabling the supply regulator
for the Elan trackpad to initialize. Compared to v1, the delay is now
skipped if the regulator was already enabled to avoid impacting boot
time or time before the trackpad is operational.

Patch 2 applies the same logic of skipping the power on delay to the
i2c-hid-of driver.

Patch 3 applies the same logic of skipping the power on delay to the
i2c OF component prober library.

Patch 4 adds a delay between when the device node found is enabled and
when regulator_disable() is called. This gives an asynchronously probing
driver some time to increment the enable count of their regulator
reference, thus keeping the device operational and allowing the driver
to skip the initialization delay.

Patch 5 adds the correct delay for probing trackpads for Hana devices
to the ChromeOS OF component prober.

Patch 6 removes the "always-on" setting from the trackpad supply for
Elm / Hana and adds the correct delay to the second source trackpad.
This corrects the hardware description.

Patch 7 adds the supply and power on delay properties to the Synaptics
trackpad on the Spherion device. Combined with previous driver changes
this should cause no actual functional changes or delays.


Please take a look. There are no build time dependencies between any
of the patches, but the DT changes must go in after all the driver
changes land, especially the first one adding delays to the Elan
trackpad driver. Otherwise one could potentially end up with a
non-functional trackpad on the device.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/

Chen-Yu Tsai (7):
  Input: elan_i2c - Wait for initialization after enabling regulator
    supply
  HID: i2c-hid-of: skip post-power-on delay if already powered on
  i2c: of-prober: skip post-power-on delay if already powered on
  i2c: of-prober: Defer regulator_disable() on successful probe in
    simple helper
  platform/chrome: of_hw_prober: Add delay for hana trackpads
  arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as
    always-on
  arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics
    trackpad's supply

 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  8 +----
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  1 -
 .../mediatek/mt8192-asurada-spherion-r0.dts   |  2 ++
 drivers/hid/i2c-hid/i2c-hid-of.c              |  8 ++++-
 drivers/i2c/i2c-core-of-prober.c              | 29 +++++++++++++++----
 drivers/input/mouse/elan_i2c_core.c           | 13 +++++++++
 .../platform/chrome/chromeos_of_hw_prober.c   |  4 +--
 7 files changed, 48 insertions(+), 17 deletions(-)

-- 
2.55.0.rc0.799.gd6f94ed593-goog

