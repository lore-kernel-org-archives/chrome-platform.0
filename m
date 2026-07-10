Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5133A4F3D
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 06:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783663973; cv=none; b=hC0+DJEbeuakFEor8n1pyUXU6XPE85wu/++0G3PaAed5h1HwAeLI7VBbdTuNUxsR7BvLDFkK/974QKBbnHn2Q3NWeRyTqU8gbGi8bE7PN+4Z8nMqRx09D/drMmztOg11SMf/VW8YOcWlwjHxjsOx9LmzWslR0dAO00Ihqn8wJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783663973; c=relaxed/simple;
	bh=o2JaIZxaNBuDjdRx9i/qPZCQXI8t77buSJWiwEwOM2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKXF5Y5WVXd7PRlh0lCu3T3UtXOPYqjFpyVScICkrQwo9J33UjrWMTqZi2aNbQuZFU4bmtc8onMuWyNo0Iu6Nu1UqK50Zpip84ivi/CFpw6kXduXVMm5VQMDmvNvf56qm00PMznyDBY3/+YcfSPXwZKHgB9Rtqm9mJsiQyjeP6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=InTVF9l8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="InTVF9l8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c19bad03so4147725e9.2
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jul 2026 23:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783663970; x=1784268770; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nVrtrY7Lxcnr9VVq1BE+KMPhpmvVhZyMiMIHIgYA3DE=;
        b=InTVF9l8dotr0wcoO/IwNNMMFuYM9jnhc/5qQpUUTfhqwWqEs3leEursV9W/WQMsul
         b8TddBONYvepaKtVBLyQh+4jM7lwdYI+9jokk+X+dy8nrNWURX3hWYQiqryJnYhlgLth
         YJfWWr/jA55bgIA7ZiYT+V4M0P9p/OG+oqKqBdBWU9xhKNaYCQUksg/aG/AfpROz13vB
         AW2h6DUNIh/cfmvR//MsKmGtbxPm0Vjov4oAqA/QY2d218/+RugsUgo3NJtlokPYq2uj
         wPkqnc3QN1IHrxtDkpkL9aT7N10gxiKtbwAxOkesDnu/ME+xXOwy/GLSGG0bG/p/hN0W
         zWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783663970; x=1784268770;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVrtrY7Lxcnr9VVq1BE+KMPhpmvVhZyMiMIHIgYA3DE=;
        b=Y0BvogroBe1Fps70uzPw5y4HF6WG7LncYBEpcmcVNH6b8M5Xkn0GG+Ei7E1C9h73zb
         1q1g6yE06/37QA1b+DsDqZrsYh7OLNExOv4dt6pD4uOezVIxdbCwXspXYgYBn1UDiYUI
         mI+bvXCBQoKv7gJEwXhowDmYa95AJZBsqBC4OxUih1/CgwZqcEFb8KT0Zmm/wckGvxXm
         mBgD+ZIlVTmszBrTCHDajW5O87ytRKik6OzTsvs3/a0hoiOxJerS9MFBeAqQcxwC1R0V
         oboamKFGKCnlKiCx1L3IfbnBuRB31Sl1uCN/L+X/2C/scNmyegWTZT5A8aLVDzDcMTqP
         YgGg==
X-Forwarded-Encrypted: i=1; AHgh+RqVaaevBJlqgN+u39OGxzOf+sn/IKzI+rxtmn9N6/IJn6UNyVXcnSpM8obumyI8O/xA1jQnVEruuhvt01rAeHc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsjnfnCZGMW4jVWZWCrElccj5wOzog9aKb5EC7stkX5ycGFewu
	xA4WIUyXs8yV7CtYi9bLunEisKFqn+2eh83CWStmXsjYP8e+qSqrCVAsEYV6K9ZWQg==
X-Gm-Gg: AfdE7clXnyScZFsZmMEVGndtQJmxqHEEQpL/6Ezlxqza6yjyVj+66btLZ9fqj8tooNc
	uBLmeQpgO7ezccdEPm+jbIKcNoH0quRQfJiLWk2VKoGIAo61dU7dBYSYBMgrU6QW44nlTKI38rx
	k2GdIIWeDQlLMv0JV823/gwt95trOfyuzsjFAEwh0y9/tW1vTUV6Y+EcK/aimkawliMaVWvzM80
	HQNLtU02l9y6lWocD6pWP7b4Nl6IqirO0z9oV2Vi8c36vJCATOv/K5Gbk5U89KMt/lpIV8Jw2uR
	4w7LvB4z80d/bNoGQ63KTnCT1eBVyIlknUSLmjSmg0yCMV/jt4P7JoMFNnh6UQEMxxC1qshVnfQ
	8P87cgFFMAI3E8HmJNVXab6z1Kw1SwldRpK2un09PFYW8uJhWp5cQzXr/ZMaKmzOhFO2yuJBwnb
	noejuvsTx41cE5oLe8M2kVu8houpJKfeGPsimOgNw=
X-Received: by 2002:a05:600c:4fc6:b0:492:43d2:9e6e with SMTP id 5b1f17b1804b1-493e68391c1mr99079665e9.9.1783663969267;
        Thu, 09 Jul 2026 23:12:49 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm110345675e9.3.2026.07.09.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:12:48 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	Sean Rhodes <sean@starlabs.systems>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 1/3] firmware: Move firmware attributes class helper
Date: Fri, 10 Jul 2026 07:12:44 +0100
Message-ID: <0d105cd2eb39e1b418095ab6977d9a5e08385ed5.1783663929.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783663929.git.sean@starlabs.systems>
References: <cover.1783663929.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the firmware attributes class helper from drivers/platform/x86 to
drivers/firmware and expose its class declaration through a public Linux
header.

The helper is not x86-specific. Keeping it in firmware lets coreboot
firmware drivers use the standard firmware-attributes ABI without living
under platform/x86.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 MAINTAINERS                                               | 8 ++++++++
 drivers/firmware/Kconfig                                  | 3 +++
 drivers/firmware/Makefile                                 | 1 +
 .../x86 => firmware}/firmware_attributes_class.c          | 2 +-
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
 rename drivers/{platform/x86 => firmware}/firmware_attributes_class.c (94%)
 rename drivers/platform/x86/firmware_attributes_class.h => include/linux/firmware_attributes.h (60%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..ec0a12121357 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10114,6 +10114,14 @@ F:	include/linux/firewire.h
 F:	include/uapi/linux/firewire*.h
 F:	tools/firewire/
 
+FIRMWARE ATTRIBUTES CLASS
+M:	Hans de Goede <hansg@kernel.org>
+M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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
@@ -16,6 +16,7 @@ obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
 obj-$(CONFIG_MTK_ADSP_IPC)	+= mtk-adsp-ipc.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
+obj-$(CONFIG_FW_ATTR_CLASS)	+= firmware_attributes_class.o
 obj-$(CONFIG_SYSFB)		+= sysfb.o
 obj-$(CONFIG_SYSFB_SIMPLEFB)	+= sysfb_simplefb.o
 obj-$(CONFIG_TH1520_AON_PROTOCOL) += thead,th1520-aon.o
diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/firmware/firmware_attributes_class.c
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
 
 const struct class firmware_attributes_class = {
 	.name = "firmware-attributes",
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
@@ -63,8 +63,6 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+= hp/
 # Hewlett Packard Enterprise
 obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
 
-obj-$(CONFIG_FW_ATTR_CLASS)	+= firmware_attributes_class.o
-
 # IBM Thinkpad (before 2005)
 obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
 obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 495dc1e31d40..93fac0d464d2 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -34,7 +34,7 @@
 #include <linux/sysfs.h>
 
 #include "asus-armoury.h"
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes.h>
 
 #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
 
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
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
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
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
 
diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
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
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
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
 
diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
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
 
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/include/linux/firmware_attributes.h
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
