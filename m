Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0324D8DBE
	for <chrome-platform@lists.linux.dev>; Thu,  6 Aug 2026 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048099; cv=pass; b=D5q1Kc2K0ne6ua3LDSOODGUJbeUoJ1ELxWkjdf6hOP/SfacoR6aFMGPcCj9MuQlBaglnCi7wYNoMS3BwpXah4t86ZdwnLvIEOI03NNWyiNuG+gy4/NKy/5ZurMrqsvpxi2akSsj6cmZydI2rod2sTWigZnyOazKnkD3Y7AcXBAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048099; c=relaxed/simple;
	bh=Q8xsnxF3jEw/7SM10kKTcT1xfMbd107PgsOg74WP0cw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZYjKZlIe0i/eU5P5D2CKW0OrSBEHOMM0pRPWdP9MWXsdFVXPfAS2QFjyHVsFfykG/RhsCQd5Oz85lOzo5A8UvjPoOnDbHjmNob26Ba0Uhx+PVhhtqHnQzvv4lgYbHVs36I3UKJxomzIPM0Ywewy7sXcbABXxoHntsWtraywtWtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=PE8qLdbP; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="PE8qLdbP"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-667971437d6so3593119d50.2
        for <chrome-platform@lists.linux.dev>; Thu, 06 Aug 2026 13:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786048095; cv=none;
        d=google.com; s=arc-20260327;
        b=SnM9NfeF+Bhd7ZwjWzcL88nFfxuJguYwVLHQBjSDlQzfE4KbwvI5kaH81jODQJ4fyV
         KytiZPWedUv/M28YL62z1+WviRjYXhGS0+RNxM2XwqgcMHpWU30TJ8EnNUJf5mFXYsQZ
         /FCqVNGPP6DNirqrvt3/94c+F4GS0RvBGcgCLj8l0e/g4mlRYz1O1D3jzElzFKFQ+03o
         GHsS3NdAb2G7txWrukav1Kt6wmvqFMWAi3i4G4Q+2YPUPZBHBAIo8KRWXC2sBRTEdubA
         ugoWmluRvb2onYTZ0exsaLGvzsM8E5kabQOQzz0Dbbz2OZJVRvnIpyaomJgMg+WPg2Bv
         2Pdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=S6+EvfUzcdRKdEZLNQTWkgob6H9iavzA0+44dEG9fHY=;
        fh=QXk9vKEZPRp6ajGaPeXPYkBRjBwj/BlEtQF77F5bbdQ=;
        b=MRh+kUCgYNKy0jj9Ug1F/7BBpF/cmVbf+6sSpL3tLXrSjqWfNBWemfACzU15oW6JUw
         bFlj6gaJ7nFh9lpMlZuuV7GbY+96oOyYKKBV9Anaaucwkem0QCbvBQBg/GLP3siKXCKQ
         vS0DVa9qvPLJBTooLc0zgGgHIzhf/qKGOLW3i2pXaGU36kmZyyNZV0DreLmWLeoKYZbh
         jorFPvNOFMeT8sOi2b7Yl2U1hOYDkcvvsQsmJNCfHvbglITof+WlUBhSuLQKYw6lavLP
         zoXVcTQNJ0wARfrDWg5Voxy/UWxVntrqS+Xc7G7Bvm6bMlBgB/3SB2VO9wZ3dfFva+oG
         fwcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1786048095; x=1786652895; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6+EvfUzcdRKdEZLNQTWkgob6H9iavzA0+44dEG9fHY=;
        b=PE8qLdbPplP+NQ/LLMtxa5JLvc2g9Hge/SU2xMZZ8sFK6x5ZrUUJWf2WvtPooKgJKe
         oyP/hcbAa9CkSD1ri9vByAkgfiQuSzKWGuds64s6XMkJZPsrk2f2zqSGnMy3MNAAwvcC
         ye6Nn7Qhne3krw3qsqOScAsA+jAGWMEyZagAhgntumjgPtscA46doUoLO3XtPHhF42Au
         faQmTkk/xmJkt6O2F3FBSy/3GxL7cRHKZ7CfY5I3E4kaZ+caFswoieDGrC6yToQHXbdP
         9yTvStVXIHnS1YdiYG/Bzde75TqtWz9Rhmi/CLY0/d+fl34PzJOcEN5/D+LCgULSffFE
         Myyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786048095; x=1786652895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S6+EvfUzcdRKdEZLNQTWkgob6H9iavzA0+44dEG9fHY=;
        b=eDtY5K2osRC//sz0SnvvBQm/oVnFN4wDX1s4u7u08bUxUpm+SyU+7BMtJBPYYkhnHd
         oxKOZbUeoCsSKnePuUX/px+/0vED6hKTURPj+SyawGcrIf1Y5DPjPGfzW3r/zw4spkhA
         p9gbBqm4JNcKAYKCmZkpXwwq1x04Tfv9ngGRJ6ARF3rbcZNSxWS9jdCRMzuLOzGvbIkw
         Y1lI+R+hiG5s4Ps0JXKVm12RHlxrZTd2pfy84+KUd9uT88Vy0DB4DNlN93CoQXCxrpZq
         Cv9705lYpTGFTfmNsZ80vO3n2kpkxeCuLoFgJ4wcI69RmxKsVyKz5j5pbYJzOhSuctp9
         fPAQ==
X-Gm-Message-State: AOJu0YxzyFJr7qL2NzxHBxT7KgqqFBnZkcGIeKVSXbkqFdKQBkkCDFYX
	+y3EvHPD5ZU9YOEgOz7Sh4vBDGd9bekZd+dojm7xMm3KDvgJ7WmInE9PVFnR7cRqk+ovhARqVSw
	HYBUunYNhMx0lmGy9fndld3cjeOmv90GxQjvbZgK14a3R8SidDXo61w==
X-Gm-Gg: AR+sD135j94z0ujE2M55/FqoHRXvDC/ZvYhYWp/zgaXyHs60Vw9r1fYn8ZXevZhuIYQ
	QBKq2B0NzkUqfLi9IUgyBjX7/7TjMjZ8jvLO8OeOKh+qlDgtR4Lsy1d+DDA/UkgMTO4n5v4amiV
	s5i9mV9l2Mg0kbfGAKPpEPFZXSEkPR9BIoTbWI9yP4e9jC7qGkO4di+zQ4DEeCdmWIAn/MScqmX
	mNht/nz4BPaVZ8go34CuymvPNqMDdvmGkJ1/4BXhIOHsUfe249D5+0ljDtA0f3ShIXsZaU6vgEt
	Rprta6uRgyp1cPZbuniz4u+qa2I6vNEbCHbXOgteljeAMW/R2FckIHnpiKAnaoi4hfUaRUwGomH
	OakUo73m4
X-Received: by 2002:a05:690e:4548:10b0:667:fef9:364a with SMTP id
 956f58d0204a3-6699ab00b66mr8379032d50.44.1786048095063; Thu, 06 Aug 2026
 13:28:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 20:28:14 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 20:28:14 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 6 Aug 2026 20:28:14 +0000
X-Gm-Features: AUfX_mwSgC3XC75glDsSswFFwgcIHGZ5glc6wBS4jCc3mbERlVYji01wGOfvrYk
Message-ID: <CABtds-31q1yj0r=E7vrkv1LS21udzax22BVxf77W+uvPzqRO5Q@mail.gmail.com>
Subject: [PATCH v12 2/4] firmware: Move firmware attributes class helper
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
Content-Transfer-Encoding: quoted-printable

Move the firmware attributes class helper from drivers/platform/x86 to
drivers/firmware and expose its class declaration through a public Linux
header.

The helper is not x86-specific. Keeping it in firmware lets coreboot
firmware drivers use the standard firmware-attributes ABI without living
under platform/x86.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Oliver Lin <oliver@liuxiaozhen.dev>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 MAINTAINERS                                               | 8 ++++++++
 drivers/firmware/Kconfig                                  | 3 +++
 drivers/firmware/Makefile                                 | 1 +
 .../x86 =3D> firmware}/firmware_attributes_class.c          | 2 +-
 drivers/platform/x86/Kconfig                              | 3 ---
 drivers/platform/x86/Makefile                             | 2 --
 drivers/platform/x86/asus-armoury.c                       | 2 +-
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c        | 2 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c              | 2 +-
 drivers/platform/x86/lenovo/think-lmi.c                   | 2 +-
 drivers/platform/x86/lenovo/wmi-other.c                   | 2 +-
 drivers/platform/x86/samsung-galaxybook.c                 | 2 +-
 .../linux/firmware_attributes.h                           | 6 +++---
 13 files changed, 22 insertions(+), 15 deletions(-)
 rename drivers/{platform/x86 =3D> firmware}/firmware_attributes_class.c (9=
4%)
 rename drivers/platform/x86/firmware_attributes_class.h =3D>
include/linux/firmware_attributes.h (60%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f9472c1a090..e6a8c271e79d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10115,6 +10115,14 @@ F:	include/linux/firewire.h
 F:	include/uapi/linux/firewire*.h
 F:	tools/firewire/

+FIRMWARE ATTRIBUTES CLASS
+M:	Hans de Goede <hansg@kernel.org>
+M:	Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/firmware/firmware_attributes_class.c
+F:	include/linux/firmware_attributes.h
+
 FIRMWARE FRAMEWORK FOR ARMV8-A
 M:	Sudeep Holla <sudeep.holla@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 12dc70254842..78a239f8bbef 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -8,6 +8,9 @@ menu "Firmware Drivers"

 source "drivers/firmware/arm_scmi/Kconfig"

+config FW_ATTR_CLASS
+	tristate
+
 config ARM_SCPI_PROTOCOL
 	tristate "ARM System Control and Power Interface (SCPI) Message Protocol"
 	depends on ARM || ARM64 || COMPILE_TEST
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 4ddec2820c96..385b6e8b7fc6 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_FIRMWARE_MEMMAP)	+=3D memmap.o
 obj-$(CONFIG_MTK_ADSP_IPC)	+=3D mtk-adsp-ipc.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) +=3D raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+=3D qemu_fw_cfg.o
+obj-$(CONFIG_FW_ATTR_CLASS)	+=3D firmware_attributes_class.o
 obj-$(CONFIG_SYSFB)		+=3D sysfb.o
 obj-$(CONFIG_SYSFB_SIMPLEFB)	+=3D sysfb_simplefb.o
 obj-$(CONFIG_TH1520_AON_PROTOCOL) +=3D thead,th1520-aon.o
diff --git a/drivers/platform/x86/firmware_attributes_class.c
b/drivers/firmware/firmware_attributes_class.c
similarity index 94%
rename from drivers/platform/x86/firmware_attributes_class.c
rename to drivers/firmware/firmware_attributes_class.c
index 736e96c186d9..503ecc288086 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/firmware/firmware_attributes_class.c
@@ -3,7 +3,7 @@
 /* Firmware attributes class helper module */

 #include <linux/module.h>
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>

 const struct class firmware_attributes_class =3D {
 	.name =3D "firmware-attributes",
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b54b5212b204..beed14c38b54 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -926,9 +926,6 @@ config DASHARO_ACPI

 source "drivers/platform/x86/x86-android-tablets/Kconfig"

-config FW_ATTR_CLASS
-	tristate
-
 config INTEL_IMR
 	bool "Intel Isolated Memory Region support"
 	depends on X86_INTEL_QUARK && IOSF_MBI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 872ac3842391..cab20a4145e3 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -63,8 +63,6 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+=3D hp/
 # Hewlett Packard Enterprise
 obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o

-obj-$(CONFIG_FW_ATTR_CLASS)	+=3D firmware_attributes_class.o
-
 # IBM Thinkpad (before 2005)
 obj-$(CONFIG_IBM_RTL)		+=3D ibm_rtl.o
 obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps.o
diff --git a/drivers/platform/x86/asus-armoury.c
b/drivers/platform/x86/asus-armoury.c
index f3d8c5a85762..e6af93608ec5 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -20,7 +20,7 @@
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/errno.h>
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/kmod.h>
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 4ff9003c6589..963b3473991d 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -9,7 +9,7 @@

 #include <linux/align.h>
 #include <linux/dmi.h>
-#include "../../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 1965a329be48..f13f21580acd 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -8,7 +8,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

 #include <linux/errno.h>
-#include "../../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/platform/x86/lenovo/think-lmi.c
b/drivers/platform/x86/lenovo/think-lmi.c
index 9e4b3e973de9..4437785aa1f2 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -15,7 +15,7 @@
 #include <linux/array_size.h>
 #include <linux/dmi.h>
 #include <linux/errno.h>
-#include "../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/fs.h>
 #include <linux/mutex.h>
 #include <linux/string_helpers.h>
diff --git a/drivers/platform/x86/lenovo/wmi-other.c
b/drivers/platform/x86/lenovo/wmi-other.c
index fdebaa0a9992..b175971bb308 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -33,7 +33,7 @@
 #include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/export.h>
-#include "../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/gfp_types.h>
 #include <linux/hwmon.h>
 #include <linux/idr.h>
diff --git a/drivers/platform/x86/samsung-galaxybook.c
b/drivers/platform/x86/samsung-galaxybook.c
index 74103c00b0c8..3911f60c23ea 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -14,7 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/err.h>
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/i8042.h>
 #include <linux/init.h>
 #include <linux/input.h>
diff --git a/drivers/platform/x86/firmware_attributes_class.h
b/include/linux/firmware_attributes.h
similarity index 60%
rename from drivers/platform/x86/firmware_attributes_class.h
rename to include/linux/firmware_attributes.h
index d27abe54fcf9..d4026ba1fcc2 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/include/linux/firmware_attributes.h
@@ -2,11 +2,11 @@

 /* Firmware attributes class helper module */

-#ifndef FW_ATTR_CLASS_H
-#define FW_ATTR_CLASS_H
+#ifndef _LINUX_FIRMWARE_ATTRIBUTES_H
+#define _LINUX_FIRMWARE_ATTRIBUTES_H

 #include <linux/device/class.h>

 extern const struct class firmware_attributes_class;

-#endif /* FW_ATTR_CLASS_H */
+#endif /* _LINUX_FIRMWARE_ATTRIBUTES_H */
