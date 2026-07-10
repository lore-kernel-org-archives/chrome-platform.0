Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5999437100
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701602; cv=pass; b=r/HOzIR4lRbpWYT0lAQKlvJHTxJQUxE1MowgimNB9S5jTJrIxnBDYT4RKb71Cmpn/ApvuPuWu3KTAL6/9mmSAtwERxGePQCLlmcjL5r9i1B0QzdG5KJ5IuSLk2+7ss7OPs+a64rqtR0vbImvYf3pZdatOm4CChDREvM3kZW811c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701602; c=relaxed/simple;
	bh=QexclfBzaqE3+S8dAciIHYGqYjO8GqJLBm6iskWgors=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GoTvnQj+/oTwiL5v7B1vGY7tR0LBniRco7LHl+uM5kMutmVmgTyMJyw6hsOYLKdFxksc1j8Ygwmr48v/OvQ5DXd06NnbOE1m/zKtIKsS1tHpXek4IRt49WHqx3uDlQXqqiICaKwj9JpW49H3GSDkg1UQLfDcaKhbJOg+QwuxSnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=wPhG79de; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="wPhG79de"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-80a123ef90aso18995987b3.0
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 09:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783701600; cv=none;
        d=google.com; s=arc-20260327;
        b=Kx3sQxFDt20rvpPBVUBRdSul/1i3k05SirNAtrvm/QUg+/W3Rc0bWLZ3i8OkESHHpy
         0mguAzDy+ZgUaYswh6kuysbQO6IJTHMdhujkQP5SVZcjO+hujposY98RNv8gth5wKk6h
         s4ThbuCzw47uOifMoXVGoNbzYyvnCBxKgsrPyN2SaDN+hNdzjoPJPBOKPtjyNe3uLIUC
         74bDlHEVquiU79K7d/i+pdm/njw9uTH2wGc4IbnbgOVjq2PjPVp03kHocVk9ev6MCqjK
         +t4+eGtdItWc88Y9uKCjSG4yLRNxTpSJl7nrhRdeV0okK/uuRSrF/2zWscRFEEniu1Tw
         LFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=dcii6k10Mp2MrepC25qtb7xjfJlvzdYUQ5m4akD9Fd0=;
        fh=J0Yz09xfuoRV+hrSNGl23wBVaiwdH3HdNeddNGxmTnk=;
        b=b9XEou197c9K+W1zw4uV7CCWfn5cceboE9uJo8W+0Tb8roHdCrRxRC8LH5q3k4vE6Z
         WY8SMOx6GJVxuzAl5qpNnCfSufzvQjaykZ16RpK6lYhGyp8Hx81hQwUaOLlSKRLVoMla
         ZlX66GLuE4j7BOw9gEgOUCB2vKfCTTPgwumlSlvGVxJDck+vCiQKBgM8jqUbYuYSlbO4
         k8jD6KjbVI4wywM4mnNJAEQw2rWOaTgI5bdtDkKIMHsaxFGHR9NcB5915Hzh9RJ7Fqej
         co2lUtocMweUp3yJvsj6f6tPkHpDcDIZVnsAztnFV/m/l86t4+ymJZkhnYz5M/tflhOS
         /cFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783701600; x=1784306400; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcii6k10Mp2MrepC25qtb7xjfJlvzdYUQ5m4akD9Fd0=;
        b=wPhG79deqD5i7trMASJ+I+XgzF1GHmYWk0okw+52Z3XWR6s+Nd19P2SqVc5mYj79PX
         wuZV+VSamfBraPSZHEE1moPa9OiaC7l70GLu21SMacetUD6y6ew6CbByVlwYayzsC8H2
         ++hXqX27l89+MFViyeDEhWPwC7h0oGskv5X04f5xiWAuJXpoafQM2W/zNqBff86gZBWN
         t/6Ugbj4zCECbHa9hkCUKyY6r1aS9nUgIEGJD28kouMkl0x7n0h1wc8NBwHAdrU3w4j0
         0MmMZeshpjkj+1hSWbg+xUCy1ibccGeILJEejykP1+vZ6qGmk/YlZ6tfd7I9/pjOQxRC
         jd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701600; x=1784306400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dcii6k10Mp2MrepC25qtb7xjfJlvzdYUQ5m4akD9Fd0=;
        b=fThfPoDXCW1VFYafX0Driq+0zA0zqEtfV+G5Fk6f5v9Y9eD2yD29kCO2c2v7ZWFmfQ
         +K+/MqO5+h7uHLRwczws/q0tpgCcYWiQWdIMyPGr2z7h4qeF53QQvBA70ePIZ0TvPTOY
         dknjTcuyYosZtmpc+akngFgkDX9fpPH8qrZIF3YLrvTAc/FxOPpyEik3mRiN1NtloGPi
         1916vJG3OkjTsq7hsm4OybGgPo/TKjl/XFS+1PRJtce6ZiVbhtjajAQ4LSM/vZKZmAqW
         nYz4mQjMcbo4rfXx6+xKh41XDq2Yf5Gvm0nFba+mZKl9NDYWxx2Y5ymAdUUaQMlPmsk6
         MrsA==
X-Forwarded-Encrypted: i=1; AHgh+RpVjkZsm3S6njERWOCq9wb+yF/64gDQOa7sj9qnqu5lnt1DA6vtEzCMoOH9aqSQ1/oreNJWuMav/tZygqzroA8=@lists.linux.dev
X-Gm-Message-State: AOJu0YymCOAVvSDlasFAINUrkUXLGNWLWwUw0cf2dAD2lk92a2ukQj3T
	m64k/5hvTKsgwZsd3jhXFRYsptzbYyjAuXaYbRTobVXg8J3YadVsiaRtgux26FOlwZ+EdXBbIGA
	/g72xnP+QdAfgZD+kwXn0hYBfpjqhzyXFsUFG5BSo
X-Gm-Gg: AfdE7clSqfUjOsv5gbcTdlVx6/hyVENTDBK2KkU1sKCxiicdPNxP6QwT2hIHxcETgHM
	EIr0TSkW0f3x71C5L+T3oe9zSxrGt4a9M8gMegkWvrFl8qRULaOgej7fpQtFGhrDhaQa4/eK9EJ
	NfhZOmRhW/sEUkl9/F5WXgoxXy1O13MtzyjC7DCtr5ICNJ+crZ74BCczUAnvfHZoKBxMKtvCMsF
	5fPf+w1MbcpZYL3zIj2NaEtfYxoOYt5wtM0bJfdjPnCf+qrEmqyDoW+Ndml67Ji7Ttw6A5pF3iF
	7a/BZMdO5xmHCqpaCCggQzfCURA=
X-Received: by 2002:a05:690c:39b:b0:7f0:38f7:6ca6 with SMTP id
 00721157ae682-81e7bb51942mr32207357b3.5.1783701599655; Fri, 10 Jul 2026
 09:39:59 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 11:39:59 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 11:39:59 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Fri, 10 Jul 2026 11:39:59 -0500
X-Gm-Features: AUfX_mwHkm41UZfzpbD_kZ-vBaOyV0lUUDkcHWV7JS5YE9EqlCPxnHY3uuVWlJ0
Message-ID: <CABtds-3_6LCymxnWXVswrGAYXaBL50Jh6oSBNe1rDmLTmUXh4Q@mail.gmail.com>
Subject: [PATCH v4 1/3] firmware: Move firmware attributes class helper
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Move the firmware attributes class helper from drivers/platform/x86 to
drivers/firmware and expose its class declaration through a public Linux
header.

The helper is not x86-specific. Keeping it in firmware lets coreboot
firmware drivers use the standard firmware-attributes ABI without living
under platform/x86.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
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
index f37a81950e25..07bdba98b1b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10114,6 +10114,14 @@ F:	include/linux/firewire.h
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
index 495dc1e31d40..93fac0d464d2 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -34,7 +34,7 @@
 #include <linux/sysfs.h>

 #include "asus-armoury.h"
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>

 #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index ab46a023cc34..85670be01647 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -16,7 +16,7 @@
 #include <linux/sysfs.h>
 #include <linux/wmi.h>
 #include "dell-wmi-sysman.h"
-#include "../../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>

 #define MAX_TYPES  4
 #include <linux/nls.h>
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 27fd6cd21529..44314ae4e5e3 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -14,7 +14,7 @@
 #include <linux/string.h>
 #include <linux/wmi.h>
 #include "bioscfg.h"
-#include "../../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include <linux/nls.h>
 #include <linux/errno.h>

diff --git a/drivers/platform/x86/lenovo/think-lmi.c
b/drivers/platform/x86/lenovo/think-lmi.c
index e215e86e3db7..a56f152b5f28 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -20,7 +20,7 @@
 #include <linux/types.h>
 #include <linux/dmi.h>
 #include <linux/wmi.h>
-#include "../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 #include "think-lmi.h"

 static bool debug_support;
diff --git a/drivers/platform/x86/lenovo/wmi-other.c
b/drivers/platform/x86/lenovo/wmi-other.c
index fbb32bf404f2..e9a2c4684e5f 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -50,7 +50,7 @@
 #include "wmi-capdata.h"
 #include "wmi-events.h"
 #include "wmi-helpers.h"
-#include "../firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>

 #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"

diff --git a/drivers/platform/x86/samsung-galaxybook.c
b/drivers/platform/x86/samsung-galaxybook.c
index 6382af0b106c..74b8c887dd79 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -28,7 +28,7 @@
 #include <linux/uuid.h>
 #include <linux/workqueue.h>
 #include <acpi/battery.h>
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>

 #define DRIVER_NAME "samsung-galaxybook"

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
