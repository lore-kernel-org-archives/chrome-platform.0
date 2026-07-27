Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2777E3D7D87
	for <chrome-platform@lists.linux.dev>; Mon, 27 Jul 2026 19:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181885; cv=none; b=CCWV0WBFX/6S8rKURusZhZOo+QChYSFoQEnn3ksQY8lTC8gcv2rlFeQcRoOVqfKEeEC+4ZEyIOen1WwYIPBdUcanecKw+C+ytgBMG6F9VlCcEXHMC0KtUo0uG0E3RkzoaVKFOeXfphNi7XERzXtQV+rbU73qC4/5b1NT/MR8BGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181885; c=relaxed/simple;
	bh=5F+9d6zSwaI23ajpCCP4JCHQTIKUiBdtuz68jRALsbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2wDq7VXnF17AVxppbsg61ZGI6wrZRPwIyDgfP7u4W+ORVwxo8otOOWueCCF/t3CpHpWEA98WlwDgEG8PSwToOpWADyomC4F5pICqLdlHMxC1V4+hTr+U1DwleLVoldFiy1NHq8D0rY3T8JMNV6uZNQWalKsq4onpLVWVYaqLPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=QtJeWy6A; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="QtJeWy6A"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49557167508so30015115e9.1
        for <chrome-platform@lists.linux.dev>; Mon, 27 Jul 2026 12:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785181882; x=1785786682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyYlZFVCc06FCgom6L11YucB1au+iuvrVnF7FufZeZ4=;
        b=QtJeWy6AUUqBwQ2vlvXhUBlncGTfvyhDtIvFyqzzPNlYkzfw1GOmp6cB9ZV9H4JvGr
         IP0nU2SCvcnrdjCAKkA1ax51+eItW19tuQ70PBOxdPLj343MrWLIb6zAb6Vp7vYffs9j
         qObsJFr2IJ0UiJd78NGlw67MEFjGkfl88ZSpbMTQeYxb6yp8MkMs4JKtQatHxyfe8PtW
         jWbwWVbTimNS9WSj5oK6Pv1W4uSLxAk2EwB0ShIKj7/3VD52Cmh8j+0L6iLpAuacPQ2c
         1vEbAsIeZavG44JM23sW1rvIGv/Tkr+XXoTHdUjLDd3CfBvEKFpROfSRvCQGxy9T/k4K
         OGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181882; x=1785786682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyYlZFVCc06FCgom6L11YucB1au+iuvrVnF7FufZeZ4=;
        b=oJt4/wJKAZIbLoIRrukMF+rmbJQY/EZ9o/hj6AegCLSNuEtHbLoDgROW//lWgoTjJ4
         mO/hYdGD/7RrAOmZqdCd0muaGEJlM79tuCovrxU/FgUYd6Ae/whj5t6ZlFs+H7jQf5vQ
         Zln5kgo9W6rR355AtSLu8BdDqPDCTDiHBm2jtFQoW6uVdRTkoXRMqVQA4se/UuryXIef
         xH8flFQx41uXDfppZDTd2y8nS0Q20O8MqsP8tebkdeXVWPon5rGJYDHINax05xbaYQC2
         i1sWv9IzBth9sOL0UYXOe0rdeIXW4nwBBVhJTVc3EgmPySEpByMv90AC8YOIBOsC4GnK
         8APg==
X-Forwarded-Encrypted: i=1; AHgh+RrpjdfgD8nBktsPE9QUrKpZmXxmTD1TJ4sWD8i6anSxP7+9vEPGgEkH2BpqhX6bYksbRejoSgnGb2/3ZKvB0Ek=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8Lx2il5UGOerOc6SmBX5+eAPp/eKpyGQDRgNf2wyg4kigwnpF
	LUAo0zUpBuhaTw7hzj7PR/iYCbxyBHxTCfS+hGQRRCUn20ItZU1F7ekdTq1sO3VLcg==
X-Gm-Gg: AR+sD12ycc8JUUj+4udmx+a+/XKvozczvHajcmod+oGFXlXrY5QvAQdZyTEaR4q/iJp
	W4XGw+EzMOtIP7IDinfS+b8yqi3b9TB81VRO1ukXPB/3olR//5h3BCR88EToz2TlPhMc70rgeDP
	z5BeYhRVQSJAcYxk2L/wSRvXCi+poaOYsa6DpZSmDiNHMZR1avXG3oBuy4DYdfm8OmibbGcopYT
	l6mWI0cixgznOSB8jFBQzT4Jvz1g855KaoqOgB2laqb6YVAxcho7wfJbdO7/z/6jn/O8DmNwxfH
	Y1ErQ6f52Ytq5M+G/dlWDbNTcNwrzJx+t0yHLnp9fTvosR3URohVQ0fMyxOexJaRkMkCcspjI+N
	9JkKafyE0THHD/8md5yar6jTBkQWWvUMLIApCW6a+BLE55VD65Uu3WvmxPC4FuQg15k0WPN15NW
	qG8H50jOwP0GUsp8U8ARdscFZ7lfZE
X-Received: by 2002:a05:600c:1f8c:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-496c4f8e8f2mr5480875e9.11.1785181882273;
        Mon, 27 Jul 2026 12:51:22 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bd9e980sm253362445e9.0.2026.07.27.12.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:51:21 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: tzungbi@kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Joshua Grisham <josh@joshuagrisham.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Sean Rhodes <sean@starlabs.systems>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v9 1/4] platform/x86: Sort firmware attributes class includes
Date: Mon, 27 Jul 2026 20:51:11 +0100
Message-ID: <0e394ba36a3cef9117a2a32930254175c8c64a3e.1785181823.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785181823.git.sean@starlabs.systems>
References: <cover.1785181823.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move firmware_attributes_class.h into the main include block and sort the
affected includes. This lets the header move replace each include in place.

Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/platform/x86/asus-armoury.c                | 2 +-
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 9 +++++----
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       | 9 +++++----
 drivers/platform/x86/lenovo/think-lmi.c            | 5 +++--
 drivers/platform/x86/lenovo/wmi-other.c            | 2 +-
 drivers/platform/x86/samsung-galaxybook.c          | 3 ++-
 6 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 495dc1e31d40..f3d8c5a85762 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -20,6 +20,7 @@
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include "firmware_attributes_class.h"
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/kmod.h>
@@ -34,7 +35,6 @@
 #include <linux/sysfs.h>
 
 #include "asus-armoury.h"
-#include "firmware_attributes_class.h"
 
 #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
 
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index ab46a023cc34..4ff9003c6589 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -8,18 +8,19 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/align.h>
-#include <linux/fs.h>
 #include <linux/dmi.h>
-#include <linux/module.h>
+#include "../../firmware_attributes_class.h"
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
index 27fd6cd21529..1965a329be48 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -7,16 +7,17 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/errno.h>
+#include "../../firmware_attributes_class.h"
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
index e215e86e3db7..9e4b3e973de9 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -13,14 +13,15 @@
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
+#include <linux/dmi.h>
 #include <linux/errno.h>
+#include "../firmware_attributes_class.h"
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
index fbb32bf404f2..fdebaa0a9992 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -33,6 +33,7 @@
 #include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/export.h>
+#include "../firmware_attributes_class.h"
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
index 6382af0b106c..74103c00b0c8 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/err.h>
+#include "firmware_attributes_class.h"
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
 
