Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3807B376BEF
	for <chrome-platform@lists.linux.dev>; Fri, 17 Jul 2026 08:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278211; cv=none; b=ruiP0v84KMSNuSqzoKTe38bq0iAwU6KlBqg/9iVh3rFotGcjWPd9wARbYwgNTyj3/QJt+koXgfSbEMayVVh+pgyW0TZKLAOYDkxy5MTkqge5hHVDZ6VK/KxGFN1siX7IYF9YgCSiCdqKw11YIg5WH5x4Vmpi56ExGuqQXvAoZ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278211; c=relaxed/simple;
	bh=SlEoEkdqLh7hoM8IMAtG1tISwjgkZR9TWH9eZ/2nNls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o4fCfX4VsC3DnGvHw/oWfMk8m4otuPI1G50xX7qIVVmHQsWyinIknLaFcMVa9gOudT8w5c0RmSMF/5ooRph1cCFZs4VtsfyQKWx1Ptp/qaliHhY2YgSpywjKxTZ2AB1HNgVclMwa8PlAJdD85SmpIcE7Aerm/H9d73Kbt4+S7LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=0xjZq8ZY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="0xjZq8ZY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so20317035e9.2
        for <chrome-platform@lists.linux.dev>; Fri, 17 Jul 2026 01:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1784278206; x=1784883006; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KUChXml0ApNzEumm2gCr60jaGALK/ZhnPhXHzrUzRIY=;
        b=0xjZq8ZYpjqPIvgOXpcDc506QGh2DzSqupnx5b44kV846+VS3b9M3er7FAqANBO6rg
         QWy9dJ5BOobf0HCciJupE3N8FfFTpT6tZDGmOr32erv/ElcWfuV8gBlv5o0bX1zDgW75
         ShMkvRdCdctIWQPo64CqOgc/mUqEUvccT45H4U4+ZoaDlvbtrom4F/VvpkNHMBY3t5ba
         PfBRDkSRz5J9k80oewONi4ryXLVDLdDoCIbyC3TMdmkBPofvxy+adxqn/3ujD8E0B5W/
         x7i/I6KrllOjOG+DpPoXMt4XOU5jJLFn4f9j1zOih8+aLVUsNP5GJS9ly6Lq378QArbH
         5Nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278206; x=1784883006;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUChXml0ApNzEumm2gCr60jaGALK/ZhnPhXHzrUzRIY=;
        b=ga/zlAIW81qHMGhrmBTatbIjlBAt6m1L6XUjMkJw6sWSXxGw74RXxAf8HzB5llk8us
         4wrN73DcN9hsIXWoNO6ZrBYVBv88hQVYsssZxLLSylqgf/Q6lEBv5nW2JGqYMdBjS6gS
         320Md5SHskA/0RHhEw4iGV1gUgpIU83120X4OGHJ35MJiWx/JdEptx57ubFh6U6lr83i
         7LDd+FKvcU18Dnct3770oxpLtDlzPd+HpRFHOGkhKvDLymOz+alONwu8GGXX4+Hf16Od
         egVSaeU15B9kEj1a6zXG3ri4IzddZHnfqW0+C0Qy9SXObO7KXpeCH+RRbDIwYMhzLv6L
         wDxg==
X-Forwarded-Encrypted: i=1; AHgh+RolLOlj+BL5t7so7zSmThVZDMnNPdCbS6xTSYtvYHo4widauzFMdTSX0JO6Yc5d6EA0m0noA9WvSuXfVbo5yOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkSCxPb9TLCYnUqqF4P66jp7povdo/Fez/+191/Z5eupXWESm9
	Ub6vW6p04soI2cvffpUfQ2tSUtRBaAzQb+fJIPRStVD5YM53SGLufOlL+eISEWDvoQ==
X-Gm-Gg: AfdE7cmw0cPM5lRxrbdodqeSa2t3DBN4MPLjZh7RCUUQgpWVndLbwPnlrFO9WBIoaea
	eLHT9aIhcCOHwzUmsVSgQO7FgYusFonpcSZVTTbSpt+14wUw4WAtrqf1hjrdH1ZfzzpU4fOo+ZC
	5TsXUF8Pt9iuKd8eLxD81O4XKo4+VMbmmvKwdPaoHzvtCqdj2v8yt8eeY4DQYYM1wrps2VU7Kee
	MyaRDU+shCjKw7Zl4QFe9l+sF4vn1fecE7XhEGB5LW1qoVHn5GPwjPG/UBi/BKmmBf2qPYdBAzZ
	HC0IARhDHmoIviFUVJtrelJWFqPqlk4h3Yz8TNkXxAmzlxslm6WmIqNtII7/rDXKLmctyeB2XJJ
	VlqsHig5+YzsvVCW9yiQhLKBCjTLLatCkqGssZwFLPIi3ad6ek2iUHgoRvVoBBMZXgzUOMkpvUQ
	ZZfGCkmY9TEvoog0YJAaE6SkeSrBIQ
X-Received: by 2002:a05:600c:3587:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-4954a3d06d9mr17929655e9.2.1784278205957;
        Fri, 17 Jul 2026 01:50:05 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm33972955e9.2.2026.07.17.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:50:05 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: tzungbi@kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	prasanth.ksr@dell.com,
	jorge.lopez2@hp.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	josh@joshuagrisham.com,
	briannorris@chromium.org,
	jwerner@chromium.org,
	tzimmermann@suse.de,
	javierm@redhat.com,
	kees@kernel.org,
	u.kleine-koenig@baylibre.com,
	mst@redhat.com,
	chenhuacai@kernel.org,
	wenst@chromium.org,
	florian.fainelli@broadcom.com,
	titouan.ameline@gmail.com,
	oliver@liuxiaozhen.dev,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	chrome-platform@lists.linux.dev,
	Sean Rhodes <sean@starlabs.systems>
Subject: [PATCH v7 1/3] firmware: Move firmware attributes class helper
Date: Fri, 17 Jul 2026 09:50:01 +0100
Message-ID: <20260717085003.369496-2-sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717085003.369496-1-sean@starlabs.systems>
References: <20260717085003.369496-1-sean@starlabs.systems>
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

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Oliver Lin <oliver@liuxiaozhen.dev>
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
index f37a81950e25..07bdba98b1b1 100644
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
-- 
2.53.0

