Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7733ACA64
	for <chrome-platform@lists.linux.dev>; Mon, 13 Jul 2026 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930407; cv=none; b=JV5zO/79xf59doMNtxu2eUTUmSFl0tUhCSpj2aDLivlALpLcVM/nDfXbed+qK8LnOvZMHRKLLR3uH/JegSlgoHTXkG6afA7j0B0SUDz36/3Hiu6Lp/I495NaNsv9lCyZ33eu8OUIx825yj3cEmNSp+d0H7UXrGPr1sVwcU0MyVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930407; c=relaxed/simple;
	bh=35oUoRW0DK5+n+ACxF4dgMpIlFiiBt5t+nhavC6fIq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jywoh61CCyxMjMhWQxSIV8kIJrdMCpN8bBVMO9pci4MyQqnrAscfyD0IMh2XKWr5LfQ6glELoGZei1Op5aziJiChP0YD+oiOI5QmKTdfzP+nVs+GZ51sgOoGeGU5g+o/hPSVu/dBmzRmq98VuUuY7TfVp2qni4qOVUKtU08/86I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=OtxZJFKj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="OtxZJFKj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493ba701891so26685905e9.3
        for <chrome-platform@lists.linux.dev>; Mon, 13 Jul 2026 01:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783930403; x=1784535203; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HV1xf7W0XqeDB+mrV0SGgj+8q7LrpAPrrGmlafpeAYk=;
        b=OtxZJFKjNXoJ7mQnXTZjDHOeeUm+NOmCIXKrDocdu1qb4rw5EJPr66VnBp3XWkv6YU
         bm9Z8tccFpfHSTwWexuDvLInTdR+C5eoy+mvk4SyqEW0QNG8O6E4Gut7NzlFg9keGN+c
         ZGMMv9sEwp21WaoCx6VvWErwmlOQ8LC1KBfVU6sK7Br+kMdBup1NKIWNVYEuvKoS7NSb
         4qBKUBnaSDWOD/gWo3LS6iJ6rwOXlexpStnn5gbgcN78Fr8LS6xIzgZICvVLZpRl/kyp
         QWpqLeJ+UUyIjAkYl56/Ar4WzUzuYzYUH5usIa9UtLXD9QFp9zkl64qDbSAFz0jyX6gb
         RADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930403; x=1784535203;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HV1xf7W0XqeDB+mrV0SGgj+8q7LrpAPrrGmlafpeAYk=;
        b=S3p2rXMLygpnjj+PiSCdgwGy7a9Tx9J2Wc6xdbevnbyrDbcEEbDvRyGKj5+OCnDVVY
         Lo47oZ32xzhw9S3NE7JI6lqshQ32IvZlfRoRw+wfuwLAnxxLYSexqbwB3MTkjd3VgeFw
         eVgg0WAdWsZ+j4Cu9l4GQfy1AvmTzisb2JivSaLDqOl5mQHonu9I8y9XFIJxPWC/dtR4
         hznSKMXr13PZTxaj86waYkeMBIDwek/TYdWUm65d4uRykfkJV4XhBrTuQRdAyJv6GukG
         OzH9yTOlOAfrnfWp+WsD5lJkEetB7CnVaV7qDgXwUi6otRiXMhDoO8cpfJDZAE3yeFie
         EkJw==
X-Forwarded-Encrypted: i=1; AHgh+RqrJUdjUZQPWSRbB0oOH0nBJtmxEzQCjfB3CVqMoBJE1pndCtMy+vngQrtBoS5GjuZNRTwFrpEmyIYaJtQ5nlY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQobC7FgwU8FKBPuMa952DxUANfqTwXOiD9JOzQZVv6CdWC+y5
	nhxmXomQ5GRemk1AMWKes5466p9J0yxnWjmlYzZ30VISQHctg6mR9jpHwRozfB/2Yw==
X-Gm-Gg: AfdE7ckKg5UMhqBUvsjEmI3zbPfSg8WZR3GjdfZlILiGhmKiJjktLFxAXx3mJs+vBNz
	0dgcrTH3MV4gkhdTid1bPZfQdzgftCu3ZALkyr/i8ejLcu97bXJO9rizp6ROA0szQR4gMNle9nc
	YgnGwT3o+71auU8DWUmreGvp9WKgdrib0rAYznzZoAT3dU48V9zfFAIWbn9IrZ89bRQsBjbw31S
	jbyu2VtUaFBs5u3b8WCslQ3Y1v3DeMC6QeT/KHeTXJe/2qRMII4l17WjkPmA/i3lvru7MlmAQxQ
	ni4ya2cv0QqzOf15DREC2D84LtQty1rx2ep/iWFwUqPX89x/MUJFFPZSbR6Tr9QgipXfdRrOetr
	H5rhv63rtR0JMAl7g5FKE53xWe9JPsyLdGf9w5W3/LDqY+QXlyzRlEuwFSo+mALmYG/CI7JLlqw
	EKdimGxPDBhrwOcQ36TcNpFLeWpTpFp60uDgXvk/sJljPymCIqjNi2G9iw
X-Received: by 2002:a05:600c:b90:b0:493:b967:178d with SMTP id 5b1f17b1804b1-493f881d05emr82844795e9.19.1783930403309;
        Mon, 13 Jul 2026 01:13:23 -0700 (PDT)
Received: from horizon.localdomain ([150.228.38.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73ae14sm343217885e9.11.2026.07.13.01.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:13:22 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	chrome-platform@lists.linux.dev
Subject: [PATCH v6 1/3] firmware: Move firmware attributes class helper
Date: Mon, 13 Jul 2026 09:13:15 +0100
Message-ID: <20260713081317.2954586-2-sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713081317.2954586-1-sean@starlabs.systems>
References: <20260713054526.2902319-1-sean@starlabs.systems>
 <20260713081317.2954586-1-sean@starlabs.systems>
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
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 MAINTAINERS                                              | 8 ++++++++
 drivers/firmware/Kconfig                                 | 3 +++
 drivers/firmware/Makefile                                | 1 +
 .../x86 => firmware}/firmware_attributes_class.c         | 2 +-
 drivers/platform/x86/Kconfig                             | 3 ---
 drivers/platform/x86/Makefile                            | 2 --
 drivers/platform/x86/asus-armoury.c                      | 2 +-
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c       | 9 +++++----
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c             | 9 +++++----
 drivers/platform/x86/lenovo/think-lmi.c                  | 5 +++--
 drivers/platform/x86/lenovo/wmi-other.c                  | 2 +-
 drivers/platform/x86/samsung-galaxybook.c                | 3 ++-
 .../linux/firmware_attributes.h                          | 6 +++---
 13 files changed, 33 insertions(+), 22 deletions(-)
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
index 495dc1e31d40..e6af93608ec5 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -20,6 +20,7 @@
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/firmware_attributes.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/kmod.h>
@@ -34,7 +35,6 @@
 #include <linux/sysfs.h>
 
 #include "asus-armoury.h"
-#include "firmware_attributes_class.h"
 
 #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
 
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index ab46a023cc34..963b3473991d 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -8,18 +8,19 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/align.h>
-#include <linux/fs.h>
 #include <linux/dmi.h>
-#include <linux/module.h>
+#include <linux/firmware_attributes.h>
+#include <linux/fs.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/nls.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/wmi.h>
+
 #include "dell-wmi-sysman.h"
-#include "../../firmware_attributes_class.h"
 
 #define MAX_TYPES  4
-#include <linux/nls.h>
 
 struct wmi_sysman_priv wmi_priv = {
 	.mutex = __MUTEX_INITIALIZER(wmi_priv.mutex),
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 27fd6cd21529..f13f21580acd 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -7,16 +7,17 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/errno.h>
+#include <linux/firmware_attributes.h>
 #include <linux/fs.h>
-#include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/nls.h>
 #include <linux/printk.h>
 #include <linux/string.h>
 #include <linux/wmi.h>
+
 #include "bioscfg.h"
-#include "../../firmware_attributes_class.h"
-#include <linux/nls.h>
-#include <linux/errno.h>
 
 MODULE_AUTHOR("Jorge Lopez <jorge.lopez2@hp.com>");
 MODULE_DESCRIPTION("HP BIOS Configuration Driver");
diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index e215e86e3db7..4437785aa1f2 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -13,14 +13,15 @@
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
+#include <linux/dmi.h>
 #include <linux/errno.h>
+#include <linux/firmware_attributes.h>
 #include <linux/fs.h>
 #include <linux/mutex.h>
 #include <linux/string_helpers.h>
 #include <linux/types.h>
-#include <linux/dmi.h>
 #include <linux/wmi.h>
-#include "../firmware_attributes_class.h"
+
 #include "think-lmi.h"
 
 static bool debug_support;
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index fbb32bf404f2..b175971bb308 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -33,6 +33,7 @@
 #include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/export.h>
+#include <linux/firmware_attributes.h>
 #include <linux/gfp_types.h>
 #include <linux/hwmon.h>
 #include <linux/idr.h>
@@ -50,7 +51,6 @@
 #include "wmi-capdata.h"
 #include "wmi-events.h"
 #include "wmi-helpers.h"
-#include "../firmware_attributes_class.h"
 
 #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
 
diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 6382af0b106c..3911f60c23ea 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/err.h>
+#include <linux/firmware_attributes.h>
 #include <linux/i8042.h>
 #include <linux/init.h>
 #include <linux/input.h>
@@ -27,8 +28,8 @@
 #include <linux/sysfs.h>
 #include <linux/uuid.h>
 #include <linux/workqueue.h>
+
 #include <acpi/battery.h>
-#include "firmware_attributes_class.h"
 
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

