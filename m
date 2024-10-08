Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D0B18CC09
	for <chrome-platform@lists.linux.dev>; Tue,  8 Oct 2024 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728372898; cv=none; b=UHD4W7YjOIOfWtkxHdDNqa7WB3tSeDjhQKmMeZ7BazuX9nOhkELPYT74Pzzi4UTiKN6SPKXfQnWOi5U3U9O0MtBx1/zSsQ6EV9MRoeK05pw+3WD3S7BDEJAxPSROI9A6WnxpVdJW16hU8ta/Z426BEEGltOY5UdV6Nu2voe9Shk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728372898; c=relaxed/simple;
	bh=abkj8J/cd/YrL9xVsq65KCJ+4jdcEgOC8IhHj1wq5TM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CsTsrzsoIOsghx2b7821Bs5s8euzWPGcJUPSzYn6j/tyTLr7HS2hpP9vfIIdV8tcoeuif6hJzcR2sDHauC2MlvOXB5thBQU/KSpsPikfPGCYsOE+MA9baTpuiv28txR2KvslPjAuAu3lO4jXC1quRPw2OExxpeZahFTxggD++A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oeaKkcl6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oeaKkcl6"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20b1335e4e4so52631535ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 08 Oct 2024 00:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728372896; x=1728977696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6nHUKBuE+voOY32aZewsgutm6Y+KsLTlhpOoXvIMf0=;
        b=oeaKkcl63u6DpJR9OU9i3ES3roVwzpVt99geCyTj64hnhcn/ZwgUmbFqrmrReLZP/8
         DsKhDNpNKdENMeKoO+nPKoRW1WPKiS16vLR+UcdkYzLXVbHRlcER1mw3akUt7tdNBgqW
         fd0f903L1UBZ3cQ1hiySwUyM+3X0uicpPuQC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372896; x=1728977696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6nHUKBuE+voOY32aZewsgutm6Y+KsLTlhpOoXvIMf0=;
        b=v7aqkjsY9WrUn2ElrXtrIsIHqT9spR4YUyT7nLoAEBwFcQylGEDYotfgtzpQBKB9Y7
         OXbox9yzwt4Rc4l2WQWuONogR/oLnBUw59uLRyv54c8ojKqPsM2hv/NTGPcgpqprAqlu
         DG1fBS+CxDl3vJsscjfFyM3b1IUZiMisD13IHY/25hU/gIP5AAq/BWhB0PQwwyIPdvm8
         /3wasoq/UEl3BOpc56e4uvGtr4nIDUasIijMiBCa+2KJVbXShH/e1LM3zvaWqAoDAObi
         xMvMUdd4kHf/w2OckQShPobULSi51HIYUrDAagNehZgaDrca5IHo5+btAL8SlxoIdOCl
         n49g==
X-Forwarded-Encrypted: i=1; AJvYcCX0sT3C/DUEk9uU1ZmU6HD9gsMdiKMk396/qRgRv/k7Txc9P9f6DZexYCK302pKrNKlmbAzEWwxiUzePLtaOro=@lists.linux.dev
X-Gm-Message-State: AOJu0YxptqwywFSZ04jfW5H3oLDMSLBIEgkZMwQCQL6wBKhBU2M2XTrt
	usf58drhB9Fg/OfwIo1GlTgHYcbAvCJcGAZ1hxae52IXYuAdKz9zR36PXVlCIQ==
X-Google-Smtp-Source: AGHT+IFr3DRuBViT/C80lNG8373cU4bgJJTs9BU1ot+zNY7t92dBMozwgyrX3MFCG4TiliIkIUEfUA==
X-Received: by 2002:a17:902:ea0f:b0:20b:a431:8f17 with SMTP id d9443c01a7336-20bff1c4055mr263290245ad.58.1728372896043;
        Tue, 08 Oct 2024 00:34:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13939bd7sm50121175ad.120.2024.10.08.00.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:34:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v8 0/8] platform/chrome: Introduce DT hardware prober
Date: Tue,  8 Oct 2024 15:34:19 +0800
Message-ID: <20241008073430.3992087-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v8 of my "of: Introduce hardware prober driver" series.
v8 mainly reduced the number of callbacks as Doug suggested, and
addressed all the review comments. The trackpad probing was converted
to use the simple helpers, however in practice it still behaves like
the dumb probing, since the regulator supply is marked as always on
in the DT, and the delay is set to 0 to preserve present behavior.

Changes since v7:
- Link to v7:
  https://lore.kernel.org/all/20240911072751.365361-1-wenst@chromium.org/
- Patch 2 "of: base: Add for_each_child_of_node_with_prefix()"
  - Collected Rob's Reviewed-by
- Patch 3 "i2c: core: Remove extra space in Makefile"
  - Collected Andi's Reviewed-by
- Patch 4 "i2c: Introduce OF component probe function"
  - Dropped log level of "enabling component" to debug
  - Dropped file name from header file
  - Reverted to __free() cleanup for i2c bus node
  - Corrected "failed-needs-probe" to "fail-needs-probe" in commit message
  - Fixed incorrectly positioned period ('.') in commit message
  - Expanded description of i2c_of_probe_component()
  - Expanded comment explaining check for "available" devices to note that
    if such a device is found then the i2c probe function becomes a no-op
  - Simplified check for "available" devices for-each loop
  - Expanded description of @free_resources_early callback to explicitly
    state that it is not called if no working components are found
  - Dropped !cfg check
  - Replaced "fail" with "fail-needs-probe" in i2c_of_probe_component()
    kernel doc
  - Combined callbacks (.get_resources with .enable; .cleanup with
    .free_resources_late); .free_resources_early renamed to .cleanup_early
- Patch 5 "i2c: of-prober: Add simple helpers for regulator support"
  - Reworded comment in i2c_of_probe_simple_get_supply() as suggested
    (Andy)
  - Dropped mention of time unit in struct i2c_of_probe_simple_opts
    kernel doc (Andy)
  - Added mention of common GPIO line usages ("enable" or "reset") in I2C
    OF component prober kernel doc (Doug)
  - Added check for non-zero delay before msleep() (Doug)
  - Combined callback helpers (.get_resources with .enable; .cleanup with
    .free_resources_late)
- Patch 6 "i2c: of-prober: Add GPIO support to simple helpers"
  - Dropped mention of time unit in struct i2c_of_probe_simple_opts
    kernel doc (Andy)
  - Added check for non-zero delay before msleep() (Doug)
  - Simplified GPIO name check and reverse conditional branches (Andy)
  - Added description about the supported power sequence
  - Switched GPIO usage to logical levels (Doug)
    - Changed some variable names and comments to fit
  - Added description of power sequence to struct i2c_of_probe_simple_opts
    (Doug)
  - Added comment saying i2c_of_probe_simple_put_gpiod() might be no-op
    (Doug)
  - Combined callbacks (.get_resources with .enable; .cleanup with
    .free_resources_late); renamed i2c_of_probe_simple_free_res_early() to
    i2c_of_probe_simple_cleanup_early()
- Patch 7 "platform/chrome: Introduce device tree hardware prober"
  - Corrected Makefile item order
  - Replaced "failed-needs-probe" with "fail-needs-probe" in commit message
  - Added include of "linux/of.h" for of_machine_is_compatible()
  - Switched to simple probe helpers for trackpads on Hana
- Patch 8 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and
	   trackpads as fail"
  - Mark touchscreen@40 as "fail-needs-probe" as well

The older changelog entries have been moved to the bottom of the cover
letter.


For the I2C component (touchscreens and trackpads) case from the
original series, the hardware prober driver finds the particular
class of device in the device tree, gets its parent I2C adapter,
and tries to initiate a simple I2C read for each device under that
I2C bus. When it finds one that responds, it considers that one
present, marks it as "okay", and returns, letting the driver core
actually probe the device.

This works fine in most cases since these components are connected
via a ribbon cable and always have the same resources. The prober
will also grab these resources and enable them.

The other case, selecting a display panel to use based on the SKU ID
from the firmware, hit a bit of an issue with fixing the OF graph.
It has been left out since v3.

Patch 1 adds of_changeset_update_prop_string(), as requested by Rob.

Patch 2 adds for_each_child_of_node_with_prefix(), as suggested by Andy.

Patch 3 cleans up some extra spaces in the i2c core Makefile

Patch 4 implements probing the I2C bus for presence of components as
a hookable helper function in the I2C core.

Patch 5 implements regulator supply support as a set of simple helpers
for the I2C component prober.

Patch 6 implements GPIO support for the I2C component prober simple
helpers.

Patch 7 adds a ChromeOS specific DT hardware prober. This initial
version targets the Hana Chromebooks, probing its I2C trackpads and
touchscreens.

Patch 8 modifies the Hana device tree and marks the touchscreens
and trackpads as "fail-needs-probe", ready for the driver to probe.


The regulator parts were merged separately with an immutable tag [1]. Rob
already gave his Reviewed-by for the OF bits, and I assume he is OK with
them going through a different branch. So I believe it is fine for
Wolfram to take all the patch except the last one through the I2C tree.
The last DTS patch can be merged through the MediaTek tree once the
driver bits land.


Thanks
ChenYu


[1] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/tag/?h=regulator-of-get-optional

Changes since v6:
- Link to v6:
  https://lore.kernel.org/all/20240904090016.2841572-1-wenst@chromium.org/
- Dropped patch "gpiolib: Add gpio_property_name_length()"
  No longer needed
- Dropped patch "regulator: Move OF-specific regulator lookup code to of_regulator.c"
  Already merged
- Patch 2 "of: base: Add for_each_child_of_node_with_prefix()"
  - Changed helper name to "for_each_child_of_node_with_prefix()"
- Patch 4 "regulator: Add of_regulator_get_optional() for pure DT regulator lookup"
  - Was "regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()"
  - Changed reference [1] to Link: tag
  - Rebased on top of commit 401d078eaf2e ("regulator: of: Refactor
    of_get_*regulator() to decrease indentation")
  - Exported of_regulator_get_optional()
  - Changed commit message to focus on "of_regulator_get_optional()"
  - Dropped change to of_regulator_bulk_get_all()
- Patch 5 "i2c: core: Remove extra space in Makefile"
  - Collected Andy's Reviewed-by
- Patch 6 "i2c: Introduce OF component probe function"
  - Correctly replaced for_each_child_of_node_scoped() with
    for_each_child_of_node_with_prefix()
  - Added namespace for exported symbols
  - Made the probe function a framework with hooks
  - Split out a new header file
  - Added MAINTAINERS entry
  - Reworded kernel-doc
  - Dropped usage of __free from i2c_of_probe_component() since error
    path cleanup is needed anyway
- Patch 7 "i2c: of-prober: Add simple helpers for regulator support"
  - Moved change of of_get_next_child_scoped() to
    of_get_next_child_with_prefix() to previous patch
  - Restructured into helpers for the I2C OF component prober
  - Reduced to only handle one regulator
  - Commit message updated
- Patch 8 "i2c: of-prober: Add GPIO support to simple helpers"
  - Restructured into helpers for the I2C OF component prober
  - Reduced to only handle one GPIO
  - Set GPIO to input on (failure) cleanup
  - Updated commit message
- Patch 9 "platform/chrome: Introduce device tree hardware prober"
  - Adapted to new I2C OF prober interface
  - Collected Acked-by tag

Changes since v5:
- Link to v5:
  https://lore.kernel.org/all/20240822092006.3134096-1-wenst@chromium.org/
- Patch 1 "of: dynamic: Add of_changeset_update_prop_string"
  - Collected Rob's reviewed-by
- Patch 2 "of: base: Add for_each_child_of_node_with_prefix_scoped()"
  - New patch
- Patch 3 "regulator: Move OF-specific regulator lookup code to of_regulator.c"
  - Fix kerneldoc format of of_regulator_dev_lookup()
  - Fix stub compile error for !CONFIG_OF in drivers/regulator/internal.h
- Patch 4 "regulator: Split up _regulator_get()"
  - Fixed kerneldoc "Return" section format for _regulator_get_common()
  - Slightly reworded return value description
- Patch 5 "regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()"
  - Used "dev_of_node(dev)" instead of "dev->of_node"
  - Replaced "dev_printk" with "dev_printk()" in kerneldoc mentions
  - Fixed kerneldoc "Return" section format for of_regulator_get_optional()
  - Fix @np parameter name in of_regulator_dev_lookup() kerneldoc
- Patch 6 "gpiolib: Add gpio_property_name_length()"
  - Changed function name to "gpio_get_property_name_length()"
  - Changed argument name to "propname"
  - Clarified return value for "*-<GPIO suffix>" case
  - Reworked according to Andy's suggestion
  - Added stub function
- Patch 7 "i2c: core: Remove extra space in Makefile"
  - New patch
- Patch 8 "i2c: Introduce OF component probe function"
  - Fixed indent in Makefile
  - Split regulator and GPIO TODO items
  - Reversed final conditional in i2c_of_probe_enable_node()
- Patch 9 "i2c: of-prober: Add regulator support"
  - Split of_regulator_bulk_get_all() return value check and explain
    "ret == 0" case
  - Switched to of_get_next_child_with_prefix_scoped() where applicable
  - Used krealloc_array() instead of directly calculating size
  - copy whole regulator array in one memcpy() call
  - Drop "0" from struct zeroing initializer
  - Split out regulator helper from i2c_of_probe_enable_res() to keep
    code cleaner when combined with the next patch
  - Added options for customizing power sequencing delay
  - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators()
  - Add i2c_of_probe_free_regulator() helper
- Patch 10 "i2c: of-prober: Add GPIO support"
  - Renamed "con" to "propname" in i2c_of_probe_get_gpiod()
  - Copy string first and check return value of strscpy() for overflow in
    i2c_of_probe_get_gpiod()
  - Add parenthesis around "enable" and "reset" GPIO names in comments
  - Split resource count debug message into two separate lines
  - Split out GPIO helper from i2c_of_probe_enable_res() to keep code
    cleaner following the previous patch
  - Adopted options for customizing power sequencing delay following
    previous patch
- Patch 11 "platform/chrome: Introduce device tree hardware prober"
  - Adapt to new i2c_of_probe_component() parameters
- Patch 12 "arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and
	    trackpads as fail"
  - None

See v5 cover letter for previous change logs.

Chen-Yu Tsai (8):
  of: dynamic: Add of_changeset_update_prop_string
  of: base: Add for_each_child_of_node_with_prefix()
  i2c: core: Remove extra space in Makefile
  i2c: Introduce OF component probe function
  i2c: of-prober: Add simple helpers for regulator support
  i2c: of-prober: Add GPIO support to simple helpers
  platform/chrome: Introduce device tree hardware prober
  arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads
    as fail

 MAINTAINERS                                   |   8 +
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  14 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |   4 +-
 drivers/i2c/Makefile                          |   7 +-
 drivers/i2c/i2c-core-of-prober.c              | 412 ++++++++++++++++++
 drivers/of/base.c                             |  35 ++
 drivers/of/dynamic.c                          |  44 ++
 drivers/platform/chrome/Kconfig               |  11 +
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_of_hw_prober.c   | 140 ++++++
 include/linux/i2c-of-prober.h                 | 134 ++++++
 include/linux/of.h                            |  13 +
 12 files changed, 818 insertions(+), 5 deletions(-)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c
 create mode 100644 include/linux/i2c-of-prober.h

-- 
2.47.0.rc0.187.ge670bccf7e-goog

