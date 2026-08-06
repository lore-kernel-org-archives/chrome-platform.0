Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067634F7983
	for <chrome-platform@lists.linux.dev>; Thu,  6 Aug 2026 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048111; cv=pass; b=YZKI/O+SGXXWVM2Tsv9qP7ZprHXHv7kZmMRPaytWzqRx7gAEgAngF1aG4dJKAmsosl3qmUnKC4wDrJkGDs3bkzudLfUl/YwxXXnFHvanLXaPXE5T3hZ+AflwfeNyzn0oVa8wo6B3axQfCQ8IV+vuuL6n79dlihMRc6O4IK7RVkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048111; c=relaxed/simple;
	bh=xjyGYu6w8CU2vRHvhNRUuB7iPZmlc1EALiS991dExao=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=heqjf7c+DFrmblctcDbMYwW/tSgGpYIE1BJ6Dc6Kq9DqUJQNIDXHFXjgD7BzRgz79QNWvOoEhQOPPtHIQWDCXBbaMZ4Gm8aYXFb80fEljxdB3U/1wU1VZh/zHNGIf5uQC1i8+LOvuLRbufC5xFdLYHHqw0BqPoAg/LMkPFFecjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=I6Ig43/y; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="I6Ig43/y"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66843536f94so3595734d50.3
        for <chrome-platform@lists.linux.dev>; Thu, 06 Aug 2026 13:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786048108; cv=none;
        d=google.com; s=arc-20260327;
        b=GWwd3v2bX4tygT93prUzNimycxtSFku7WGyt1ldPMh01vahhU46fJL71RMsF8ILMpq
         2llHfvORumnrrZg6+Iqmc6WlwTYeZ+0zapMRN87BUTkt0zsmvlO3QLo0jYM+elvNZ7hZ
         9WDUJ0lKWMhNiwDOY6HCbu+2PshbrAhE3pkEK4MYAQuNS6WEBobUiQAo0JShKwilSuIF
         Rwq+cYpYCzAXE3+mkVWTJ+pREYoGTzN4392QrpvV4iJ02lG/TcKYGba2vgNYvL9SMQCU
         g4+48bEb6MefA5OSwpNMjHj1BtCYQ/bxQFxYUHuM2XOWv3YHL/ihwJ2YqUKMb7ld8mz/
         KrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Pl3lOHYD5u9a9DZft1poeG2yn48m4MRRkvM23CvELd0=;
        fh=QXk9vKEZPRp6ajGaPeXPYkBRjBwj/BlEtQF77F5bbdQ=;
        b=byt9P9i353n2kOs4Tk73XMUolYg1Q/yiOstvMSUjD0rpYHyXSo+DnwPUJyvJRtJDTU
         /HAA5eF+MWR/kpGWouhmFwQQGYyvf9unQSO7gwt2O3PNnUvF4sJ4JE+HtTW58dmAZm/9
         xl+Njrxnt3yXvQXi/8bt8pNHQgMgjQstiTrvJmNrvyw73blKvKpS8uZKYBBYANFzlSnx
         WANaqaRRM+y98Yokzes0dYe+Ml9mpDUriFoAgpCPRcNzC03bor9QS/ha2W6dh93PEP4G
         vK/8Zpv8KPUjcAfkuXnX+bC6OSNeapjOKARAeJ1eWtfuYCiuB/G5prD5BUo5/A3t+FnB
         mO5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1786048108; x=1786652908; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pl3lOHYD5u9a9DZft1poeG2yn48m4MRRkvM23CvELd0=;
        b=I6Ig43/y0yElse/66Snpy0GpKmoaci7n17Sy+Cs0tRPGojT9fplJso5E9npT3DNaEs
         LyuK4hOQSwovYMOHStc+hq9R0VI0RIhttcIeu9SdsxYwqK2JJz+03ziA/JFzhfr7CMm2
         vR1Yj7eF1Vt/Sb0olloSgtyO6Af6HAXionIMwGhWQRGd0l4h7qWB0H96qN8kRDywCJTd
         rnWfqZuCzoSOZ+maKrrPlbqpxEbwyEY8AO9yoYT/ZiEFq7xifdUMLS6lodO/LYjCH3Hn
         ekg1qlV9z14K7swyNRLtWxJNS+/HQzFkHGEjGha4N8fgJDUuyczq27kqLl2vI4kSBSXn
         /MBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786048108; x=1786652908;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pl3lOHYD5u9a9DZft1poeG2yn48m4MRRkvM23CvELd0=;
        b=p6ZFJiq+BJ4c88tOxD/rdhFnQmCuzO2o3+UUVUpRZxcm8gLiQ/SzO6E5nsaYqqQrrj
         g4MK95umk+OhVVBhzZH0OOHsgwiT+nCQEjxaFlXEfH8qnt4PIDUjm36a559mKvFPPZmI
         ZZmCUNw7ZmuBYd8yEr2jW1xb4mKwFmoE1M9/Iba2RCaGUilfE2C1X3fDqARyBjI3It52
         zJR6knqLZ/XRYflJm/1Mj4gFDz0NjOH3EtQv6sABvyhrQduL8oAW9edR7OVmE4YiLzQv
         8/gb2GeFi65khbKmfpzb67NglOlYc0vlLPlQQKphdNKDjjXbhN4aotgU4Ooc6zofaW5r
         EIjw==
X-Gm-Message-State: AOJu0YyeYKHRhCxE9ZVKyCZvMSVqE4fuL2TIBC+UUNrDSInqfeiPRNex
	KJEqjyYUQP832/2apaA1Z8DgUn5jQ51rYX7WXuxFt6HykxLBEuHQiUrnj5srvGQCQAU0r9cHyN5
	qrdjPOvX0AU4f5/qj8iLyMZS+Ah97Byc0Y8uFOMAGwgfOHGx7kAYKZg==
X-Gm-Gg: AR+sD13AWcYZ9gVfNlSDMcsnHNyVZoV3s18+SCIzAryZITDQPU4kF/mt8vMNiGLiEmc
	YHRMA2EES+drC7HLAUyNAAQVKO2v3XZ4F7hzbumSMusRNeFEoh6HqXftmdaQn+5t8xm73/NlljX
	MdnAvjYki2+AQAHxemI5hK84Kd+YxUE9FXTVO2yINrrZdqvN9fhfp4ociUh0Gnb/rW3kCY7y/Si
	OjnrSp+0BxBPGFtuGANUB5D4wOA+5/PojgESwYo4Pxw8M8N6icUc0KejpZoVpPm4KeR2t3KL14k
	EBontptpxwrBvjD4SB70kEtcX4dSip0/8bv8ihtGWRqhdysBQTFjOAx182R+OEmloaMT05dBIQ=
	=
X-Received: by 2002:a53:510c:0:b0:668:1c09:aef1 with SMTP id
 956f58d0204a3-6699a8f6b6bmr7594739d50.6.1786048107607; Thu, 06 Aug 2026
 13:28:27 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 13:28:26 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 13:28:26 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 6 Aug 2026 13:28:26 -0700
X-Gm-Features: AUfX_mwOaRxg95OuW9Ds8iNQvGKcieqxJPLMdtz6kfQAyNoKr3gXMq_u-wATIaU
Message-ID: <CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com>
Subject: [PATCH v12 3/4] firmware: Rename google firmware directory to coreboot
To: chrome-platform@lists.linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, 
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	josh@joshuagrisham.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	florian.fainelli@broadcom.com, chenhuacai@kernel.org, mst@redhat.com, 
	wenst@chromium.org, tzungbi@kernel.org, briannorris@chromium.org, 
	jwerner@chromium.org, tzimmermann@suse.de, javierm@redhat.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, krzysztof.kozlowski@oss.qualcomm.com, andersson@kernel.org, 
	geert@linux-m68k.org, dmitry.baryshkov@oss.qualcomm.com, arnd@arndb.de, 
	ebiggers@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com, 
	sven@kernel.org, u.kleine-koenig@baylibre.com, bhelgaas@google.com, 
	dakr@kernel.org, o-takashi@sakamocchi.jp, titouan.ameline@gmail.com, 
	kees@kernel.org, dri-devel@lists.freedesktop.org, oliver@liuxiaozhen.dev
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
index e6a8c271e79d..62ddee473f55 100644
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
