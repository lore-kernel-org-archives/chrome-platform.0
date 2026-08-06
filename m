Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AB04DB54E
	for <chrome-platform@lists.linux.dev>; Thu,  6 Aug 2026 20:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048090; cv=pass; b=HZmflQ13kyXVzJu2JCgpRpj1M1PWZ0yYIsgfbB9snyfcFtAZtMHcM6k9ujrOzwbNKa3lmVaL/QEZjiRy6eET5JrPcxRpjIEgy29S8h9QsjRTeSyyVIwuG8Niny10/J721717jGsvNtoQdfJSEm0Vd9yaiHkDYVqxzTehUBuC7xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048090; c=relaxed/simple;
	bh=ROaZ8CzEH4SWHZHxJd8Stpplpd2Wxac2/k/fgI1wXH8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZAaUGC4vUObEu5cBRmec/dOmKdSNmVX6SEwYOY0zqIwXegYMsHixzptNdXanusM81+1GFal7nzIr5OM60WD1jT0kwRdVF15+J9KEHI6soBukk+J4yPQUnlnqiK185Zbe0lBYb8zHLSKB4ljpRdzBKH5Nn5/lNQ6ZvGCHJ79IBqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=VcOkSJo1; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="VcOkSJo1"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66896892b6cso3927137d50.0
        for <chrome-platform@lists.linux.dev>; Thu, 06 Aug 2026 13:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786048084; cv=none;
        d=google.com; s=arc-20260327;
        b=MFiDxzHG9J1IHDvk9enPTcvuV1ukqfERjulg0Mhqpom55Z19DnnuZVGhtKboSnJBEh
         U1TKJU5INYJw5DFZqzAEpxDPDr/30IoRwDRzlDZunSrxy+bLZS3a6QPPMiXQ3/eL8sy3
         iuk1bAeNPiw3+JN6/fHg6QTZC33VdvgKr8D0Zk587hngrkyfrLmfpW49vDxsSsq6t1bq
         O2ozB1ROtT5DGhjrg/NNr7GMtK5NKmTDlKn5f6IiRmcPweQi7Cr3Te07v/FAfJcp5UOB
         BNWrleB4bN/7OX/JUXCBWf0BOG0JqdODH7JE0AfLvhVg1Z9f/aatX7XbX/PqJuAv6FQT
         x7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7U9/0YDtB0EZm+GYjdQn8v+EZny+DXzdIE7UlRBbf24=;
        fh=QXk9vKEZPRp6ajGaPeXPYkBRjBwj/BlEtQF77F5bbdQ=;
        b=CBu/Xp1GQVQFY1jILSIywjkjPdP97ZgR0SxQk8Hi3O/oG/tCyvul7PpUAAq3bEOo1n
         n8MicanYHVy2/74HTm82hw1uXMr7uDBz3KJjulJ8Ly0tdZyBfwozdMQWQGlEACr+stmj
         cQWjlH0/t93SU1J62r9N9yFTh+87IEWqtJUEuo/4rk339XOxCYhcvNgw6A5MCaDZvS82
         Z0VwJh/F7Q73N3fbyPmCLbnciNDu26DJXOhgsDbdlyq21n5VUrIBVuRVeL+LE8n4Oq3K
         0Ef6vC1YGVJcxKZzuO7dg8+IoSpFTdck3/sL7C1la+0u3WCO03mH4LlYPT2p43nP4KNb
         waoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1786048084; x=1786652884; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7U9/0YDtB0EZm+GYjdQn8v+EZny+DXzdIE7UlRBbf24=;
        b=VcOkSJo1RmJXvQGKIh7pkUtQRut1aMne/GzY03LevUsI3LoEJG3YY5FWh3u3sRYXS8
         me6Rpz5VtwG5ly5PWdQ8mfTKoI7LdXGMO27EmjJPU6+ivAgSx+87v3OFEDcqnSB5b348
         ZZdUuKwdzaEewGA9Z5ds+Tuv7vRzcV/ogA3S0nTbsG/+LJryjILsJfKeVJP8xiFfohab
         sTejQRV0gVA6ArufBE6koe3LiDbTYMCV4a8ZitGnwxltj9AQe3Svg9IdF/3NK9J2JM2k
         5aEhfo2YVG4KMlgMv7jAfA+/cnPEWmbbqtVR6Lt7LTOY9+gic/EDms3s/2R9HoUFLUpM
         UL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786048084; x=1786652884;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7U9/0YDtB0EZm+GYjdQn8v+EZny+DXzdIE7UlRBbf24=;
        b=M38092V1EOFnkbW7WWC42GFuQNw0ManYtcrKkFVN2yjWtx9RD0FzwHJuteNe3YUdA1
         F0uMMcVPOapLlXIDUkNyc+tNNms5kugwjCQaGX1tj0BMeQ5dI76hAQPlW4XEyP2b4gUk
         EXxIwto5ub/gCjBWC1M7ryM6TQh5ZG4my4c0mtDpOe0D0/FRUEUlLavX8e+sW0tq96E2
         eYiE8bo6yvSnP4N5HOcY2ASaxe53NmUO51TpGsA7mn6EqcLC4DEjv0c/vJC3AXptVhdy
         y5TNKPh8Q9HEJM7Oqhc2/Rkfx+H18xbqVoqGa+qiK6S11MivWJYboWgrtN6IAKDunR97
         FYng==
X-Gm-Message-State: AOJu0YzNNIrcXHfBLZyf/FT7H5bBNSLi6QiCIv8t/XztZa53gl7lX8ms
	JnSKFX9VB4pale78iui5EsMxAm4BK1sQZlN0e2Qsxg12IVVF2lq/O6O4JcIMR0D8s3RjYy1UXGD
	41AXSeWTXe1GZSdVe7G9JkPVYOoe/pM1jZ5JW5h90EbavziQ7YspRIw==
X-Gm-Gg: AR+sD11DgKLmHAOlwcpgskOVDSpai+10TxteEYZ2vJsySoiGdhw/eZS8Hc/uVhSjed7
	b3KM7zCye3mKzbkTOLDyvWjnSPBU6veRW1iJ0Ibo5lAuRsOZb2xJhLxRSBcExxprwzv4BZ9cwFN
	vJu7pzZCf/m5mdrmo8JyIoysd7RnATBA2vdZH/B0NR5JpClmNt288NWkjN1CqaEzO6vVt290Kmi
	nMBG0U2MMq+8B4nfQd70K836g+A7XZsZEhupIKcIQYlFjly/rAtaW+88FZWSuv4o5UKexbofPlq
	s8QeMz3NRwhm0vkuhgn2DjKtNi2qpJb951VxuyP5MPUJ1vWzNs6scFru5SUehs3p2u5mMsvuhlW
	dnAwPJaSxHrsmnYaR8nfD
X-Received: by 2002:a05:690e:1757:b0:668:973d:5ba0 with SMTP id
 956f58d0204a3-6699aaec1famr7717035d50.26.1786048083788; Thu, 06 Aug 2026
 13:28:03 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 13:28:02 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 13:28:02 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 6 Aug 2026 13:28:02 -0700
X-Gm-Features: AUfX_mxR1eLhUqYeWuAis8rIKkWeNZ942rZgSIBzeg-q9vYC4RMlefqMyPaKtVg
Message-ID: <CABtds-3qYvwy5Z435vR-21djf2dvoVYSuYgLSXH=hc0e97j2vQ@mail.gmail.com>
Subject: [PATCH v12 1/4] platform/x86: Sort firmware attributes class includes
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

diff --git a/drivers/platform/x86/asus-armoury.c
b/drivers/platform/x86/asus-armoury.c
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

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
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
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
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
diff --git a/drivers/platform/x86/lenovo/think-lmi.c
b/drivers/platform/x86/lenovo/think-lmi.c
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
diff --git a/drivers/platform/x86/lenovo/wmi-other.c
b/drivers/platform/x86/lenovo/wmi-other.c
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

diff --git a/drivers/platform/x86/samsung-galaxybook.c
b/drivers/platform/x86/samsung-galaxybook.c
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
