Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FF63822B4
	for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 21:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001905; cv=pass; b=MbYpe2Ht13aRIyjwjL8rj3kx1Gytwa3fRiw23qi7ygWqzQXOCRWF0k7GNUaQ3+Q0ipqlhncrOwPc5r87r0noh8NIIxGsLrVyZZQ4mloerzx5/YQ4PEVahId44pedTxejRUPOulgTfmSyqnjIQCY2g6WWtumuVlkLDfLFBqV8ICk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001905; c=relaxed/simple;
	bh=IppDC7HdKodWjTBoSVL4c7NytYkiU2pxiZ108IcjzNM=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ex5cspKkrnQQgaiJIAXKbHZP6r15ETdlPo74b/qE+M2Amw1upiwZ5GPqNWQZdO7PD+4T9JY0mFb2vofuB0tVEQDGNY7O+UTkQCIjj7ZNdSWi9y34qSkWCsHr9xMNPXXn9SYIVVcSsfCPs96KU+mu5oMckfV6Jm8ILUapSlJdfYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=wyz/TvKm; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="wyz/TvKm"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-836c4474028so38966877b3.0
        for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 14:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787001903; cv=none;
        d=google.com; s=arc-20260327;
        b=AK7cW5ojabMDcLL7QPxJMdoqH70K5BcBX0KRA4mUWkwp1GDDuWdsy0gWjtIJseB2Ak
         iXmqW1LUB3mAGKAew6XiwXi8Jjk3x5iWZ/KoVqyAwYMyavzdvP9w/Oo80woAZK6fg1s4
         iEwPv5240abFhrlgLzw/BUG9Hl2mtmF5pOQQeuiFryhKoUUkg2mo8W51bXi6c0vsl6eF
         j/ipNdbRLZl3plZBgp7IXE2gjaJlsSyILPHcb03/D8o4oLySkmfwjrmTVljxSovbRuDt
         BJtAagChoG/XH9jey99ve3JKga9YDxHy1BrUtIewl6BWndkPI8ztZ8ZPzSjU/qV6uIkw
         farw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        fh=QXk9vKEZPRp6ajGaPeXPYkBRjBwj/BlEtQF77F5bbdQ=;
        b=Ya9kJYp+6qHiXY4NxvP2ouft/v+8z6Wv1tPHVIWOqbiXWoalo+fuHrhx/Yx85XTGZB
         JXv4n2lbbNEQiT3ihSJnthoegrCcLlOV2AbFY2qJvB/kbOUiMJtngemELR/6yZVc9ed8
         g+4a8umWhgZ0tBGcOxzvi5W+f1DJjZTNNQGIB4i30VZifZP+Nl4qGvKVlvVxglrTNxPW
         MFrhnqu0owXyg/0tXoeQ2T6kp3emQE4a2zLblUWhNL1asDFevvFknQadMzIZgT2awzWL
         jToJaQ3ByUYxCVJlfKuyG1DH8rjk0BmyTlI/N3IHe9SNcbv1ke0g3g0PQuC0PGnGbXzl
         nu+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787001903; x=1787606703; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        b=wyz/TvKmg2IHDHG3RuyiVW4moaxkr/18tmAOJfwRHVdtnsF5zRBlEh0c5hr6nf6kCx
         FeIetO1/d73xNZ/c7kxERK47xT5RyhmUF8Geb4G0+MXIb5y5THpWzUCSVJzK9uAyrZS5
         JrPmgguTVz9xKb5zQP584d8zPz7b28phqAMAyGcyn7GT2vt/N0T5PHQjE+uedBeaW6M9
         OWu0UVfJYWuObYvTCLdU58X/bAe7ThzXF6efekI5hueuXwHlbV/CblnyW6iuARY1gy9d
         U03MZUXIyG3R4Oqk20H49gWKKK03btTXZLJZT+zf3ckc5+Bo5tIwFTkvuC4xJHetFx9J
         RyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787001903; x=1787606703;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        b=iM8v9rM39rwsUvLNxfzyFqimtK6lFBxwZyVZp2lRvgCLrd+MlV34yKU2FuaeKam+Ok
         GTE77wLJio3PV9ootOdoMvEK6TDEA2OR33metXok4UuNArc62ayHhVrvgMV+2LAZaIvA
         aNaPNOi++UUTL/KF6i6p/e+xfXLTqmHU+XphKQDTQ+KJRm2gGNg06Y0OT+3dGZYnNoi+
         nyARza6f3l/AUGZcnKmnFOCvkDCBaYESWHpp8dX9z8yLvtmON5PBcKpJ1JpnzRyJzenJ
         7HYkoDue2GZawsR955zEs4Fsi8TN9pZQWfs37RP+U7tCs2tnpO9YsNoECAFZv87xH1sr
         xrYg==
X-Gm-Message-State: AOJu0Yz6RIWLIIu6KjCumgoN9psxZjBxPHPjquLxHWGILPBcV2/8cNA/
	glX2AUGqrsRkipLpcNegUOnKvi4iMzk7qHTRCsCHvtZ7dVFtRNiOxvq/VisPDJJRv30x0qY9Zby
	Ayw0t2kW/O4VgIEURNAm8z1Ty6MDDuOWbpGIv6RiT90OEr/V5zgmZVA==
X-Gm-Gg: AR+sD12b+/lF9JrdNrIPdN1uBW7ZA2RsogGEuLHTBh6MDflGp+GzKmLez4DIkHo/CAk
	1bOrwX6S5UhUQovSMHMa9YhyS2f19j7D81HjGXkcRr2AFtXX9e9BZ2kbJhfp3vgr7z4efj3U5zw
	4lo8JE1w/xBnc5L2AHwsV/iWz0pY/rhSXOdjByFXdRBYOOypF1haz9kYMco+mCNGVmRa/IKPxHr
	jNEHYNWBA2/w7qzBc00BcXhAT3KqPf/AMe7Hhv/K6gz6/Hdw7I8yrgez8My5zO4fmFqk3uLRGM0
	6CQdTEiafSfLR5aVTHPHHW7/+U+1eohlSPESeg9PfM5bXgxYiD3yhhThnfSt+4QWAA/ep1mX
X-Received: by 2002:a05:690e:1306:b0:664:eb8c:9e3c with SMTP id
 956f58d0204a3-66c72d0980bmr8736238d50.46.1787001902711; Mon, 17 Aug 2026
 14:25:02 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:25:02 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:25:01 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
References: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Mon, 17 Aug 2026 14:25:01 -0700
X-Gm-Features: AcwNN1W2nrfwJkcKJDJypHH8fsf07_HO4F3bBtgGI5y9ucOVgcOJe38ZwikfogY
Message-ID: <CABtds-3HuofWaoDbMHPBc34eivjtaYeBLb4qk+bDXmz59d=1Qg@mail.gmail.com>
Subject: [PATCH v13 1/5] platform/x86: Sort firmware attributes class includes
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

-- 
2.53.0
