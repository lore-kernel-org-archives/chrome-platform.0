Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D2E4028EE
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 20:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750728; cv=pass; b=sh2vW6StRpCEsibAuX92WBOVG/pSczDsIwcfOyH9ArU/R7wc8YQSUaFR3epqTIVWztd9ttTsKmuKE+goSj9uSi9tLOeyI7QDjBqnjOnMYnXP5EqXGfeeE0JYlJ1K/afIQYE7EIwwZ6+GRRNijJ1G24VtZ+pxgBozBO4UWfCmDdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750728; c=relaxed/simple;
	bh=IppDC7HdKodWjTBoSVL4c7NytYkiU2pxiZ108IcjzNM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BMNSA8qpHibnFwODP8oPPlPjut5RmIpiMk9tDZxUxlzfMbA35W88mL2eeEgQ+Y0ltIqqnJ7eRX23Pw7OYnj4ic7zYinGVNVqPpU0MCr7emQyyMq8ewDYbNohCzTHDEc47GWhhGxfQGqDWaQUDs5VMpVV3IEGeUyQfXWJvGm5X5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=lrNgBXG+; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="lrNgBXG+"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-668296d0ff3so7400615d50.0
        for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 13:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784750724; cv=none;
        d=google.com; s=arc-20260327;
        b=Z2SOePgzBI+ZP83V2z7BmByCaAv+dNeofqB8OMBn+LJFwY6kD87q+Tu1xDFHdrbvRJ
         ml01Fsih5Yt4xxyZ1anhxE9gY8/Wt2Tmg4MSmUQGvtOIrWWiz7+6csepsIuG5Im+aoDT
         E1FbvlVDECclxMbJcRGHCCetKFcH6NkXx088GKX6ig+mTux/oll0TClydWheisPwNcwU
         wl79B9wjShxr91EJqzSEWgvxs1Jaum5Q6EWHOOfWmegIBiBcBse06r88U5ta4z5VHmzj
         bsfpimEp8Lp7HeXerj+91V572tvX1d+dNKQpLnU0BrVphaJdxhziEZsF/Uv+d0Hhw77D
         KwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        fh=RPrmFgBERkfOMNlI/LA9C0hEWDoNhqGfcyUbysLehH0=;
        b=erFbyrQrpHnePONcHdsZdJaDrfcZkgwbcngVi32J+mLF2wVkXhCQxoZ5gbB0ARp1rQ
         NaRzX0cLJxiSKdR45Ofoh9y+Rs1xiWdjvE0tis7myDtXWW0YdciY3pnsprMTAcockPJL
         Wyv0ZOfQwJT0jaWeoyLDz1drZ6F4ofTYgjS7tzGW/M8JPvKphJPBfXAo2EWvZfoMedAK
         TPdBFLAlQUI+s6g+UOqOM9qsI9fxv/V5nq46kvJyRErXGzvPraEqpj2AIb1iTnQluHgr
         8rkn+75MnmxmStN77qgzNq+PIrN2nK1S1/i0VShTVciyyHANGeL34WP63Frn03IUmNe3
         1TLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1784750724; x=1785355524; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        b=lrNgBXG+4n4tKI8enimTtD9zvnhmN8vvRDMo88ndIIIfVfqNUFjCQdwqO1pWfdJdMw
         m6nmGnZMibDRwi6nbnwn69ys3OZ7PZtKpBadiOcRJk5LRxkY1+Gsadkhb99Qwq+b8HKD
         twQETgFeZDOtJRqpel2H8Dva6VAyQB68A6wStan6TWkq80jjtvP4iemW9S+qJSMjcqm4
         PL6TE3pJs1qPVc5Woxz619IMOlmNHIDg4aiU8Y6qqWL3+cuuBM6QEc4ZJnlkSaE3SBSu
         Q0y1gF+xq47hD17bUieRrgc2DvXGN+c196IvRin/fnHlY07geLhtwzXWnrxC4pywJ/uk
         rYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750724; x=1785355524;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uC+ZPkSmY48LELILJXdTqPOhnPXkVBcTQXLErnsNTc4=;
        b=j1fjYtfKWjSQ3X8wX92lPsBqp7VEpJHH1hNyW8eCSORtz0QZNi3weskKXWARbC0rGr
         uxsIX0evZO5crHJiMcdvpcHlFD0f+rlUBYmA9qho7Zi62EMR8LxDifP1jE+0WEBVoEuX
         nzjQpnsciRYDLKbUWs3puKNgpxC5GCfVRQKQDB4dSkU+QPNnCBgjTrgMIrLbIDwcOdlX
         B/rz9yWtBWiiambz/i4PmrqC0s4yAIJ0EXJ2Kkki4/0ofZ0PhEbYI4Al0WqlM3RZ4VvC
         HGiJH7Ayify9Znl74VdDq2BRuvkVBRf0WUcyJhm9UNcjST0wFjIXnSQpXQBfzIP8Jwvb
         ri7g==
X-Forwarded-Encrypted: i=1; AHgh+Rruems3PSgzK8HH0HnYPokAgASNYxFPXus8l5EmqL+rLoHsPs5UttqMsCJKkw2Wg+6vouF0Z9gnxhMLkXsXYk8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7E5daq2PdI3BOVT2bMJCA1YRTUCnc+m68CZLUfjJiI5gFHvt8
	wiUFpEuEl/Yd/hBA+ITLCdPR1IrOegmp9kvyj3X2NNYxNnq1KpNgYNt+mHxpdODQBHUNwwg1MPa
	kLmGWuRGVqTOw5DnqZPIKjAVS6WsmKHYkn9z1CLGE
X-Gm-Gg: AR+sD10moj7Wpd5MN8Qk7cy25sE5Uh8+VOjgX29QKRzBG92k9m4Y4fGMDz8oACiHm7f
	7ibjRxB5eR9kpzbLrpKfma+eXHC2q0HfcZk6gagpkaqLuJ92CI27fgxk0e8Uh92p+jPwmj31gkx
	ft6PjBHfibcReoegzS5xB/030V2cVQ4ZXuK3vXD2Tecw29MMaKFH7BfjyGTfsCBF7VIM6NYjlr2
	XgyLAMOoHQADd72RMK5scTTFkbBwOvtSFCuRAM9lEJkH9vFi3uHQLPaZcsn7aW8Fb6Vug6Q0JZb
	f9/13kJGeYWY/57u5110IK8HJw==
X-Received: by 2002:a05:690e:d50:b0:664:d494:f9eb with SMTP id
 956f58d0204a3-668a4d4ee1fmr22753d50.65.1784750724261; Wed, 22 Jul 2026
 13:05:24 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 16:05:23 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 16:05:23 -0400
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 22 Jul 2026 16:05:23 -0400
X-Gm-Features: AUfX_myvz1Vhc1ZZ4HyJnSBSVJ5I4BPsFXNEixqHfPBLlmaqy2W8EjZnGqGl6yg
Message-ID: <CABtds-3mgwnoV8P4nVFfro2v99_MfVomm4Uz5JyxuVAK=cfY-Q@mail.gmail.com>
Subject: [PATCH v8 1/4] platform/x86: Sort firmware attributes class includes
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
