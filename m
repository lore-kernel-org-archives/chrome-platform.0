Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24E3364045
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 20:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750731; cv=pass; b=uoJW0B1LdZF7d+KOjoJ4WbY/T5FMra/s3k3HdpB7MJUcc+QG6wDe8F2lwzSJbsRRNkiJZ3SgAjTb8GwG1OLGQ4BePpWdDVfCZywIZ37W+PHgAeZO/fan5A17K2ESTCadIFJUdlvsgMf2Tpu8HMNOTc6KcXKVvckm8JnZgmk+eEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750731; c=relaxed/simple;
	bh=IxYClJWT4i1RqJwNBxrT0irY7XxVoQ8l/y86jKl+r2w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uoxq3Odh5d9wZJcP7hLT4oDffG/3mTSHpMqNCEYRaPEfuybn75mgJ6yQ3iNTIBFrTgglihO/83mzQ9wbYPe77BIiKN5akGRveaUXGjxP7bJSYQ4yACv9WdMFdadc3EamqfhK8IGaLiHAAVYrhuU9yQQWQABr47EVqZ4y5nsx/bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=mhiJxg9p; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="mhiJxg9p"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6680ae2031fso8320892d50.3
        for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 13:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784750726; cv=none;
        d=google.com; s=arc-20260327;
        b=HDOhL/0SZ7SOF8gCz1qeYubNpYVvi/ABsOUHJcEJD2bxLlcNXB+PobfNCA0O8GDMTB
         TwOqW/3m+B8i9+UJ4CsWDwkkN1HFFGkNqWthv6FVJ4YbA6LisBRN3mjvYf2MRU6GJd25
         M9Fh80I8luivNo5BvZjuMPs8aMImG4r3Zh7/o8x5xOM7Rd1GWPtlXn5THjO/hfu77L89
         1QmJrIIHJ7v+EvVawRwcnhnihAWO9HMpSiLkxFn07OE/0IqWCxz8i5QmSY4OvWrvkJrR
         qJays1GJud0cUQkV/zaP3/fnO3fqiSuH/E+5kh9Ts6gy1i0QTGLvvt42LQjpJRYz0sJI
         0ktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=hlvWPCqElfG2Cldp43RMlu5ErGVRXjf05pzcHyrFQXk=;
        fh=LKo4UkAy8SCECgRbGtCfU3/MWmpJLphar6ExpFrVFJ8=;
        b=jXuA/c3XAohuP7dJxIbVTxRd2BKVH7BKGDqbhAXhZ1NW68N3qA/BXQO0MBiZWLGMJx
         oqm5TfHzAZd9M9nTbqWLGIdI8c0tDHFfH4rtiZE2iFzt6o5t9Kx1C1WvXCEHe83MGLxc
         h7A2HFkkGwQEBH4JoE2M7Z3pOxt6atTEz15eFlrDWfAw73WrBCxd1iuA+toBDSvJQzY7
         8XSxwkFkKi6b5byKQsUcJ3I7np7bL8MmokeTLjo47XMDla+k0GLRnUWSjCCEfssJVgQY
         O/B2Rk/fetUFZmou4UGLJzIS0OfB+LRD8Ze7pMMG9dChVLa3tFOAfQT7DAYNItxgeaAI
         IMLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1784750726; x=1785355526; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlvWPCqElfG2Cldp43RMlu5ErGVRXjf05pzcHyrFQXk=;
        b=mhiJxg9p+tmo14a+jznUexOSoKi4S+Yht61c9uzlcJmpdbTg0BIAdD9Nn03YkBnE5Z
         /YKu/UGfNqpzp4DQaEWdFQO2mUPbADcJ578PXaxG5h1T/xX3e6BlZspDnOphQFbj37a+
         5zMuMgQ2fno7xL6hTdjfhlTPcF+u8bktF09YT4K+B8wS9qtjyCucCMxRuZzobhh/UOoa
         e5WhUDuoaCL7Jfmlz2ukrjPoGvjtRqj/Wb7hXUr1fFXTtF9R8yvunvO7V5fAlcZf2IyA
         kp9PRroeKWVySGmke/M3NZ2dxqh5mww0LHgM83ikpTv5WUNMJYsvt4kKqMlq7WoTDnu+
         X1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750726; x=1785355526;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hlvWPCqElfG2Cldp43RMlu5ErGVRXjf05pzcHyrFQXk=;
        b=FTq9q0na/kUyq2ogw0IVCC0ekJ3qKVhCbNk18mpywZ/NFu/Au6jh3mb37oLLVitr8B
         lASZS2KlR9sRtVrqnXoMWVB6Lnjy1wcUuuZmsSZoObElah6lNEP1YkbAPVfEpmTxzLJ4
         p0afc9X9pKQvyL8A0yq090BOi/Leb+pxpKmJ68vkiiONe+XVxdIqgsf6QPI2tG3QbPJq
         F70mzu728qMSlCkQybocsu/sq8o+QDjDfn53dAqrH5ihxiPPiJDNpr5thsfSVYcE9RO1
         cDWlpQmSPGXsJ202wlN6F+cdnrNZlpxKDZkq4aF0sFM+MCyJ+BPMtXqB18hL+rP4lGnw
         YHMg==
X-Forwarded-Encrypted: i=1; AHgh+RptJ2H5Y923oLdIMPY2idJPoIDPlO+8Fy9NSIFPyJCFzapZlZhJHwSkXd+/HKnMEKrf1XcPNdnL9xM1SrzRz9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZKra7GflFHvtzCd1Rm2plQrp+uOrjnzBR5pnAXccuP0CR+XKA
	X/iWyRRv48wn+xmCi8KTInPcsq9EoyhspIx/U7EAOimqKrby8vF1b8LpXwGdcd1nhQPGGXFczgP
	2V+IvbsFDYwQOZ6S3scMJsiZIkNBobuAco61wOd8dJQvXpd1LF2nVow==
X-Gm-Gg: AR+sD11FFPKZTIzdpznVTm7aivetQdNOMjV9sv56ouj19j9pCoaJAgDe61NRFtZixGw
	J0HIhlF2KVwB3xaD4yl9RI0ptwHmh8J6leRWoWCrzEcahP3I5gVpF4/Zzyhw/sVLuFkMA1AqHNm
	9vRcbLS2WffII7bQIBjluvSu5FwOVfb6iEKhxsuHHGECjIAywA+jD4/ITHCBquy4GLnBeDVnVot
	+HzXtF175R0b2UuZ3q/E/WoVMaytaodq0y8WCd/61YLLCIZ1WMDKqBEEbwWd1LfroPvVhWR1JVt
	n8vzQmMVq3Unsm4=
X-Received: by 2002:a05:690e:4493:b0:667:f3d1:532 with SMTP id
 956f58d0204a3-668a4bd4c52mr21526d50.2.1784750725675; Wed, 22 Jul 2026
 13:05:25 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 16:05:24 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 16:05:24 -0400
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 22 Jul 2026 16:05:24 -0400
X-Gm-Features: AUfX_myFi27382ARKLrS-MqO9VeTB3v662HF8g9UI2IwT-Xw0VQwiRWZiYGye_Y
Message-ID: <CABtds-3xbpZhqPCPP4TS=xTaGeB+cBkjSfYM2vMbObBpX7KZZg@mail.gmail.com>
Subject: [PATCH v8 2/4] firmware: Move firmware attributes class helper
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
index 1ab8736850ea..3b21dc411b43 100644
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
--=20
2.53.0
