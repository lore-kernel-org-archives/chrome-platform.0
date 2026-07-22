Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16ED420E98
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 20:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750729; cv=pass; b=H6qLLDQ1IdDG2c1ffTkIaeUsu+WlDCWJonaFhVALoECNB59Z7dQs82M9laNRBQaWvY09UsCDa1G3074VQnunZDyhaNcOT9/RZZzB+2t6d6hxD7xqlwX7L99ORz8X9VOikaLZ1lfHltRnL+aiVKlb+ceqrHNcabZd9OhCkVoMpXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750729; c=relaxed/simple;
	bh=rosODR14QE/6hZPV6hpVPxFB0tVG0HjNz7dnckxwIp4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=k5vwNQksPtCiEK7r1r/CgXhCS4w3+3R+5oB6zOACAdMRy/NONhwZDQvCxPY4SHZ13fuNfNvpTkdvyZYZICsLR90o2HP8Jiynib1FWu7QmI80+lG/BKeEBSqz/k+Jg/btzNIw+n9b5vyGBjidunv2mDBCAt7fbNWCCQtWB0XKHho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=mnCwQ2HZ; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="mnCwQ2HZ"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6682259cb3dso8493227d50.1
        for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 13:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784750727; cv=none;
        d=google.com; s=arc-20260327;
        b=QZr5eEjJWLhyISvOFmDyuJ6iMh2EyWMDqtFFEgPJBddDSPNluX+CjxTqswnDr/FWJX
         NrpGi2N4msAqSS66Kf/KhRu5Tyai2/sohnHO3dNG/K2L7myEjg1+GUIm3KZFYBO18Qzj
         uK3cEA8XDYMwyGRtUKGHT1ytPS69YQ3n5mG+C0Bjx9OwhoLkGX+Nj8LyGaF65EJPf50o
         hKG/X8V2VjKYE1AhjgJW+cJndxVm77MYn1p//odIH5eCIq74d2mGvRSJVbJMnR5JUk80
         9fRAC33PF3IIA2BmQ99kwXp7eeoUhK2nJJltAjFsczVpdvjAHzU8kQgoEDHIUigz1oeh
         Ei8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KSt/haMiwFzJHPncExHM5YpZ6MAG8AgE75RpNaOL6MY=;
        fh=saLkUx9jSgvX8BxULW/iL9USAvQDpXvVh9Fv30zMCsI=;
        b=Ig1kBnts6lG5tHzNJE16fYRt0bNmeGuEuPo++H4OEq+D/Skyqq2Lg9fZhGP6AH2xpV
         aPzyza1/MZPiBWLwrIdfu2sMoUifbnp0cegEkGOtgv90M61m+av8Rpxm0xaBTeXBfH+q
         MFxDb39aCEGcEMwIXz2v/ozWxyE70Ak6pi2Q1NQm+ex6DeIVfxKB2hZvJ4U+kEZLf1C4
         QJbPD/sTn30+yuWVWcM/IFE88UmbMkrNdfZXHhcO1uj8ZWWON5ftMUyxQHwvZh/gbfHI
         bqU1wEC/m5ntqcDs3xBSnQRquGDECzLJyRXRuib3Y0NhByXDH3SDEBf283ioBysUZpim
         0PTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1784750727; x=1785355527; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSt/haMiwFzJHPncExHM5YpZ6MAG8AgE75RpNaOL6MY=;
        b=mnCwQ2HZjDJ0ezNAwsLITMxbcyOa46BmEI7+U0FYnO12+QQVr7yHsuCBkqOhM2mTeP
         i3FS7x4QMWVTXiKsksFOYcQbGJUEwcxoybTCrC1itbNF9nGqrq5i/WLXfSI2SkC6JZ5l
         Ym2o+6nTN+yZL1EBAcwTuCx/nFvz27YbHoN69FYIKEVsm8WathwNG42TtOA1vGuYDWHU
         B9lGYVAA3fYS49XFd1WprpYgqAQMkg1VMGqe3vMo6V7ep5cLzJJ8b7seIgV1RJg0HLcj
         uQtXSXGLBiCB2k8zbG10B1GvWJJGVuRNLYc4Cl/giY4p/48Ra2Ca9QBLs2vnI4efqehk
         x6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750727; x=1785355527;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KSt/haMiwFzJHPncExHM5YpZ6MAG8AgE75RpNaOL6MY=;
        b=GiMbyWX3NnKE+BM9N25ABgepPo6H6RmJjaXtfyoqJnH8l3MMFg6oY8OBs5BLMzzelr
         g6gU5qaUOKerbgHzPeKmI/Wpt/6jGOGcd69KD3yHQBkLWk37FJ2YkEf0bsYMwFpF5LPT
         O7RxmQ1XxAx82U7RkqZN6yjmp17FoQtdzNuwMyKKV8Wh4D3FNvU+XuAN41K/H+WQhxQb
         eYBtb0ZdE6gOuzuEmrjN6VMofA7WOF/IIfoxCmF/+35IBeGYBC5OY5BJSH65HVafUaqX
         sYyZQoJ2saMk2sbx0IQDSxL9xbC6OXhrZ/U87PjjosmXEa9dvZrHZYLFzA6UuuRJH2bA
         CUsg==
X-Forwarded-Encrypted: i=1; AHgh+Rqd6pI4KycsJrbXI/ukSNXtiOunbbYtCIFOukkcr3P2SysqX1HpKmk2fO5jCo1XJNlu0pZTcNsXG+mVaILUC8Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhoPpX03bDpar7WEaKbLd/54in+0xM5X8+YYmYwRzZTsyyZqox
	D18vCvEQxBQehmDj6hQ7Udx8hMb9GnVtWHSIiPVG1E9E8lHsq5oehAC74pRH1onAUbv8WZLSnni
	fHMOnJAHwAwDvuDHjVu6MBc0DtwbQQ8F+IFxJhnED
X-Gm-Gg: AR+sD12UrmtT+AukdfUwuiELRLCQhVSGNCsA7ojSl9vGKND/AP1mETXQMTMJFHbJqwq
	CjOBbkTW1Af3eUNEhUuH2tZDF/CSD03NZNcLgA3yUeeQgzrcHEK/C/TPGUMHH9AdQSGB3yxH1Ow
	BCdhgw+aB35u8QzDvZ5rdFnIP0BhU+BQG0oKkGrpFAfxVrajNGS/JumjEhnon4X0Sea9BMB/V0x
	OAr6b8E6q1uA0hmM8ivf5erPzOvPZMOPzZ/dIWm32Pw7a3Hq4MtAzJDMZocSINfQScUbATPVbdp
	F0sctAz8NH9N12Y=
X-Received: by 2002:a05:690e:14f:b0:668:7e58:6fe9 with SMTP id
 956f58d0204a3-6688e5bffdbmr1125283d50.19.1784750726777; Wed, 22 Jul 2026
 13:05:26 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 13:05:26 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 13:05:26 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 22 Jul 2026 13:05:26 -0700
X-Gm-Features: AUfX_my9UKXk0h8rioGnf6FqwM-aWLzKxXHCNtyl62_XhENaQfbw2gQ-V8uXvZY
Message-ID: <CABtds-1i6o9EiBM_q=4PMXmDPobKx65A2jxEQXCi6O21kFrpfA@mail.gmail.com>
Subject: [PATCH v8 3/4] firmware: Rename google firmware directory to coreboot
To: tzungbi@kernel.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com, 
	luke@ljones.dev, denis.benato@linux.dev, prasanth.ksr@dell.com, 
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	josh@joshuagrisham.com, briannorris@chromium.org, jwerner@chromium.org, 
	tzimmermann@suse.de, javierm@redhat.com, kees@kernel.org, 
	u.kleine-koenig@baylibre.com, mst@redhat.com, chenhuacai@kernel.org, 
	wenst@chromium.org, florian.fainelli@broadcom.com, titouan.ameline@gmail.com, 
	oliver@liuxiaozhen.dev, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	chrome-platform@lists.linux.dev, sean@starlabs.systems
Content-Type: text/plain; charset="UTF-8"

Most drivers in drivers/firmware/google are coreboot table drivers rather
than Google-specific firmware drivers. Rename the directory to coreboot
and update the Kconfig prompt, build path and maintainer entry.

Keep the existing CONFIG_GOOGLE_* symbols to avoid user configuration
churn in this mechanical move.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 MAINTAINERS                                                 | 4 ++--
 drivers/firmware/Kconfig                                    | 2 +-
 drivers/firmware/Makefile                                   | 2 +-
 drivers/firmware/{google => coreboot}/Kconfig               | 6 +++---
 drivers/firmware/{google => coreboot}/Makefile              | 0
 drivers/firmware/{google => coreboot}/cbmem.c               | 0
 drivers/firmware/{google => coreboot}/coreboot_table.c      | 0
 drivers/firmware/{google => coreboot}/coreboot_table.h      | 0
 .../firmware/{google => coreboot}/framebuffer-coreboot.c    | 0
 drivers/firmware/{google => coreboot}/gsmi.c                | 0
 drivers/firmware/{google => coreboot}/memconsole-coreboot.c | 0
 .../firmware/{google => coreboot}/memconsole-x86-legacy.c   | 0
 drivers/firmware/{google => coreboot}/memconsole.c          | 0
 drivers/firmware/{google => coreboot}/memconsole.h          | 6 +++---
 drivers/firmware/{google => coreboot}/vpd.c                 | 0
 drivers/firmware/{google => coreboot}/vpd_decode.c          | 0
 drivers/firmware/{google => coreboot}/vpd_decode.h          | 0
 17 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (94%)
 rename drivers/firmware/{google => coreboot}/Makefile (100%)
 rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
 rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
 rename drivers/firmware/{google => coreboot}/vpd.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b21dc411b43..8c2634a8dc13 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11069,14 +11069,14 @@ S:	Maintained
 F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
 F:	drivers/net/ethernet/google

-GOOGLE FIRMWARE DRIVERS
+COREBOOT FIRMWARE DRIVERS
 M:	Tzung-Bi Shih <tzungbi@kernel.org>
 R:	Brian Norris <briannorris@chromium.org>
 R:	Julius Werner <jwerner@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
-F:	drivers/firmware/google/
+F:	drivers/firmware/coreboot/
 F:	include/linux/coreboot.h

 GOOGLE TENSOR SoC SUPPORT
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 78a239f8bbef..4df0a0ad18b8 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -293,7 +293,7 @@ endif # TURRIS_MOX_RWTM
 source "drivers/firmware/arm_ffa/Kconfig"
 source "drivers/firmware/broadcom/Kconfig"
 source "drivers/firmware/cirrus/Kconfig"
-source "drivers/firmware/google/Kconfig"
+source "drivers/firmware/coreboot/Kconfig"
 source "drivers/firmware/efi/Kconfig"
 source "drivers/firmware/imx/Kconfig"
 source "drivers/firmware/meson/Kconfig"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 385b6e8b7fc6..7a8fc3eeb3f0 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -30,7 +30,7 @@ obj-y				+= broadcom/
 obj-y				+= cirrus/
 obj-y				+= meson/
 obj-y				+= microchip/
-obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
+obj-$(CONFIG_GOOGLE_FIRMWARE)	+= coreboot/
 obj-y				+= efi/
 obj-y				+= imx/
 obj-y				+= psci/
diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/coreboot/Kconfig
similarity index 94%
rename from drivers/firmware/google/Kconfig
rename to drivers/firmware/coreboot/Kconfig
index b78c644fa253..b248bafe8b6b 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/coreboot/Kconfig
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig GOOGLE_FIRMWARE
-	bool "Google Firmware Drivers"
+	bool "coreboot firmware drivers"
 	default n
 	help
-	  These firmware drivers are used by Google servers,
-	  Chromebooks and other devices using coreboot firmware.
+	  These firmware drivers are used by devices running coreboot
+	  firmware, including Chromebooks and some Google servers.
 	  If in doubt, say "N".

 if GOOGLE_FIRMWARE
diff --git a/drivers/firmware/google/Makefile
b/drivers/firmware/coreboot/Makefile
similarity index 100%
rename from drivers/firmware/google/Makefile
rename to drivers/firmware/coreboot/Makefile
diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/coreboot/cbmem.c
similarity index 100%
rename from drivers/firmware/google/cbmem.c
rename to drivers/firmware/coreboot/cbmem.c
diff --git a/drivers/firmware/google/coreboot_table.c
b/drivers/firmware/coreboot/coreboot_table.c
similarity index 100%
rename from drivers/firmware/google/coreboot_table.c
rename to drivers/firmware/coreboot/coreboot_table.c
diff --git a/drivers/firmware/google/coreboot_table.h
b/drivers/firmware/coreboot/coreboot_table.h
similarity index 100%
rename from drivers/firmware/google/coreboot_table.h
rename to drivers/firmware/coreboot/coreboot_table.h
diff --git a/drivers/firmware/google/framebuffer-coreboot.c
b/drivers/firmware/coreboot/framebuffer-coreboot.c
similarity index 100%
rename from drivers/firmware/google/framebuffer-coreboot.c
rename to drivers/firmware/coreboot/framebuffer-coreboot.c
diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/coreboot/gsmi.c
similarity index 100%
rename from drivers/firmware/google/gsmi.c
rename to drivers/firmware/coreboot/gsmi.c
diff --git a/drivers/firmware/google/memconsole-coreboot.c
b/drivers/firmware/coreboot/memconsole-coreboot.c
similarity index 100%
rename from drivers/firmware/google/memconsole-coreboot.c
rename to drivers/firmware/coreboot/memconsole-coreboot.c
diff --git a/drivers/firmware/google/memconsole-x86-legacy.c
b/drivers/firmware/coreboot/memconsole-x86-legacy.c
similarity index 100%
rename from drivers/firmware/google/memconsole-x86-legacy.c
rename to drivers/firmware/coreboot/memconsole-x86-legacy.c
diff --git a/drivers/firmware/google/memconsole.c
b/drivers/firmware/coreboot/memconsole.c
similarity index 100%
rename from drivers/firmware/google/memconsole.c
rename to drivers/firmware/coreboot/memconsole.c
diff --git a/drivers/firmware/google/memconsole.h
b/drivers/firmware/coreboot/memconsole.h
similarity index 82%
rename from drivers/firmware/google/memconsole.h
rename to drivers/firmware/coreboot/memconsole.h
index aaff2b72b606..58899c2abaaa 100644
--- a/drivers/firmware/google/memconsole.h
+++ b/drivers/firmware/coreboot/memconsole.h
@@ -7,8 +7,8 @@
  * Copyright 2017 Google Inc.
  */

-#ifndef __FIRMWARE_GOOGLE_MEMCONSOLE_H
-#define __FIRMWARE_GOOGLE_MEMCONSOLE_H
+#ifndef __FIRMWARE_COREBOOT_MEMCONSOLE_H
+#define __FIRMWARE_COREBOOT_MEMCONSOLE_H

 #include <linux/types.h>

@@ -33,4 +33,4 @@ int memconsole_sysfs_init(void);
  */
 void memconsole_exit(void);

-#endif /* __FIRMWARE_GOOGLE_MEMCONSOLE_H */
+#endif /* __FIRMWARE_COREBOOT_MEMCONSOLE_H */
diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/coreboot/vpd.c
similarity index 100%
rename from drivers/firmware/google/vpd.c
rename to drivers/firmware/coreboot/vpd.c
diff --git a/drivers/firmware/google/vpd_decode.c
b/drivers/firmware/coreboot/vpd_decode.c
similarity index 100%
rename from drivers/firmware/google/vpd_decode.c
rename to drivers/firmware/coreboot/vpd_decode.c
diff --git a/drivers/firmware/google/vpd_decode.h
b/drivers/firmware/coreboot/vpd_decode.h
similarity index 100%
rename from drivers/firmware/google/vpd_decode.h
rename to drivers/firmware/coreboot/vpd_decode.h
-- 
2.53.0
