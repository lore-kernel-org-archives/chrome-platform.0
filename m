Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12047363C5B
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 16:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701614; cv=pass; b=ktc2DckVXa3fai4PLwYq93/6say1/j/Es1pxV+uq+6f4QVnDtWfeMlGBD08xhLS0AY5LRKBamdyn29X5Yg0X/NBfX4dCyAt0Wg2wIHs0Aw+C8bW27uebKGKxjG6cBlinBuUjkvtWulOSj1EL004znNBxGR6cfmVvEH7OGsNCaEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701614; c=relaxed/simple;
	bh=vX9dRgZiOib3WIdLa0aIly0qKS67zbaen72OeP0duog=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Le0ibfs7URwFZnj18q3658HNhiTB7lhrW8hUK65w239DRBjVRUNxDE9xOMpheR7bUG+ig+wtOhkb6pSWfnpyc3DgN5K82Dpu/04X+pWhgaTxTwU9x9R7ovVnJByt8oCAZ/FgklC+DkT3My6JsLkvyqcH8GF9c6iXUqM7svW4vUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=dzQLs7kA; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="dzQLs7kA"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81dfdbd86d1so11675507b3.1
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 09:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783701612; cv=none;
        d=google.com; s=arc-20260327;
        b=oko2nHon+hm4NlDgmfJdYJMjlB3GgOgy6nZuLGeN7mYdf+HIH+u0nSrn4FZvL9sly2
         KTyyKrEmMQdSjh8rp3/edZ8g75FXx6xl3HETMTUHuQiyo4BCqMIY6dNhUUi41cIjzxl+
         zv/fxmt/lPtwSJwyUObH6EXQWuPsix3mzcsjUIDUY6sgCFiUxusPTEMzcIYTFGH4ewxq
         VlMy9YwY6RMeCXB4QU+9F+as9KchKGYoy+fZLEbOqydiJd+cytHynZVEJkwzR92ec0tm
         evd3mIcnHdjlV5JJoCRK9jhJAa085K0T924QGD7XrTqNRR/fKjs+KoUFx5c1rhyOf9TF
         gmwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=op9wScPI33f2ZOlCY/RZbSVNoKYXZMr7L+XLezl5RMY=;
        fh=rL860Ngsx2C8NZgLxTWSQLfw7VnAXdAQjFYr1w4E4zU=;
        b=VkBIYpnHVtenQY/JTop588sbicj8i514IHod9F6mYR/v+GZQeGbdH4iIl/LxO8V0FZ
         aQx8LCjlsnhPqgOk5YRO4LqTTZFK2jFG3UcnfkSXtxGCxzUihPKApDzLz2ZIK+YLw0+4
         cHCICKRxyGKnI+UmJqm4jkXu/Ofz56ouk5Qes3kggJZ6woQCJC3i3zJw17kf5e7URbhM
         1IfN0TrlRfsSHFcETQslL8YBsjLKbfueFmxpHgrtFMG6xYyISEw/KqafVAKgz1RVewt/
         TOhA/7oeDeKBZQ5UQO8kOaqEpqTpvC1fNUnbG4A78Sr47ZnQdm02V2Qj1UqcbPpWOpyE
         V6Ww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783701612; x=1784306412; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=op9wScPI33f2ZOlCY/RZbSVNoKYXZMr7L+XLezl5RMY=;
        b=dzQLs7kAN86nSzOrWLf/oa1lkaVZ2aJ5oXVtMPNu2eIGZHbCykxb8Tfsgv/XTWDRzy
         9AAUevCWh2aVb5KBn4NDWP4+6TCW/c2wZ9RL587KOBOCgEC+E/yHQHEsJawfn/DcEF+b
         trSsAfa9cvUjIYklgVwgNfNkodliKk8p7bf3I/bDp+2Vit5PVJnWXiKRKeTLbOftE8fR
         A3Qx4jETHo8/zW3iy6+MFbKqg95j8ks0AX3ARRRewvdF9yRigrIW0yFqs+9PbrAGcHWW
         ANru9ZDdv23ey4AqhUzifGOr4zerYiGkOFrvKse4jLEBlxD/xfOjr1wlb7dTLxdqrMUn
         nvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701612; x=1784306412;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=op9wScPI33f2ZOlCY/RZbSVNoKYXZMr7L+XLezl5RMY=;
        b=S+eTPWk12ue3ZnvByKp5sJatXcgmzNAbWT62DqOlHST3MY2GzXukOpEC4V6f7ekcY8
         gxTjLI3v1xAnLFLtOXX5/NawHr2C5rjEOTjnGr5gs2jy2kC7DzM05I8bHnxQJVgjaf4B
         FB2Zyf67SEy6UFq77iLZfcZaWx61CgnEbyA+gk/03K03iu6g4Msw3Eg1PsB1DbIYW9YN
         U21SNCYjGB278+qRspwERhwEEe6/c5w63rtfJJc4RxMU/cwJNbluKLbCflvwDB0otgkp
         8ZeuUdzKMPZUbek93V/MzqdH6yOVDphU3FfL8qoVa+HmDQ3EXcsILxtQagcnQsWRj1ER
         Yncw==
X-Forwarded-Encrypted: i=1; AHgh+RoFgdUweFZEWuhIyCTiuMXEfTeJEGhMhRyq8YCg8grmkKJFajrhBiQHoD20p8V2UFB1xdD5s5AsMgJU+Q9qeCc=@lists.linux.dev
X-Gm-Message-State: AOJu0YycDBH7gWs8WGb9yn4rQkqy+Y7XXV+VSccQ8x/j7yPw9t2GJYE7
	bSSuQs5qTS9PLs/2xW/ag75P+y1Cs9mH6Srnykt1wjMKEygpX2WxMoNw7qwPxIg7HcntJvHcYKn
	E7cZs7mD02VveWxYpwMlKANYi7avW9TUTunU35nGe27lcdjWODavDtw==
X-Gm-Gg: AfdE7cn1XBWPf14tGUsLTjn7Mm7rsEOanLGZLrQv58b5iuM25ypRfg0FgrNXGz4b1Hy
	khtjvaPlBG2OAPvGLJjiWho/95vHXkAahBwXApfyHRisqMe+aAr4wTchRlixa5QE1VvI13CUC8s
	lXXf4lLzMWoQd+s4rx3X1pk63+xc0QMO7lpMJR4vubyEcGTN1Y98UbDtBlp9FPEuQydENoCMMNw
	KW9qOrLwJnMInVPXoDr9+iT3G9KdiyXFfUk2F7/P+sJysdexNqOSICgS5fyggaB3fqrZC/yMSbx
	FhciBNIWVT3rG98S87NqvCtxVCQ=
X-Received: by 2002:a05:690c:e20e:20b0:81e:45a6:bd4b with SMTP id
 00721157ae682-81e45a6beb8mr60026327b3.64.1783701612037; Fri, 10 Jul 2026
 09:40:12 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 09:40:11 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 09:40:11 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Fri, 10 Jul 2026 09:40:11 -0700
X-Gm-Features: AUfX_mzj-k4Cecw16XOoowahCa3WZP-cgVbjCZvyTHTeH3LzbO8RFPxq_txRErw
Message-ID: <CABtds-3w+8Ve52x8QQwES0jGe7y5O-vdRATwuqk8KnNkpd27yQ@mail.gmail.com>
Subject: [PATCH v4 2/3] firmware: Rename google firmware directory to coreboot
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

Most drivers in drivers/firmware/google are coreboot table drivers rather
than Google-specific firmware drivers. Rename the directory to coreboot
and update the Kconfig prompt, build path and maintainer entry.

Keep the existing CONFIG_GOOGLE_* symbols to avoid user configuration
churn in this mechanical move.

Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 MAINTAINERS                                                 | 4 ++--
 drivers/firmware/Kconfig                                    | 2 +-
 drivers/firmware/Makefile                                   | 2 +-
 drivers/firmware/{google => coreboot}/Kconfig               | 6 +++---
 drivers/firmware/{google => coreboot}/Makefile              | 0
 drivers/firmware/{google => coreboot}/cbmem.c               | 0
 drivers/firmware/{google => coreboot}/coreboot_table.c      | 0
 drivers/firmware/{google => coreboot}/coreboot_table.h      | 0
 .../firmware/{google => coreboot}/framebuffer-coreboot.c    | 0
 drivers/firmware/{google => coreboot}/gsmi.c                | 0
 drivers/firmware/{google => coreboot}/memconsole-coreboot.c | 0
 .../firmware/{google => coreboot}/memconsole-x86-legacy.c   | 0
 drivers/firmware/{google => coreboot}/memconsole.c          | 0
 drivers/firmware/{google => coreboot}/memconsole.h          | 6 +++---
 drivers/firmware/{google => coreboot}/vpd.c                 | 0
 drivers/firmware/{google => coreboot}/vpd_decode.c          | 0
 drivers/firmware/{google => coreboot}/vpd_decode.h          | 0
 17 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (94%)
 rename drivers/firmware/{google => coreboot}/Makefile (100%)
 rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
 rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
 rename drivers/firmware/{google => coreboot}/vpd.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 07bdba98b1b1..8cf2766d515d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11068,14 +11068,14 @@ S:	Maintained
 F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
 F:	drivers/net/ethernet/google

-GOOGLE FIRMWARE DRIVERS
+COREBOOT FIRMWARE DRIVERS
 M:	Tzung-Bi Shih <tzungbi@kernel.org>
 R:	Brian Norris <briannorris@chromium.org>
 R:	Julius Werner <jwerner@chromium.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
-F:	drivers/firmware/google/
+F:	drivers/firmware/coreboot/
 F:	include/linux/coreboot.h

 GOOGLE TENSOR SoC SUPPORT
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 78a239f8bbef..4df0a0ad18b8 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -293,7 +293,7 @@ endif # TURRIS_MOX_RWTM
 source "drivers/firmware/arm_ffa/Kconfig"
 source "drivers/firmware/broadcom/Kconfig"
 source "drivers/firmware/cirrus/Kconfig"
-source "drivers/firmware/google/Kconfig"
+source "drivers/firmware/coreboot/Kconfig"
 source "drivers/firmware/efi/Kconfig"
 source "drivers/firmware/imx/Kconfig"
 source "drivers/firmware/meson/Kconfig"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 385b6e8b7fc6..7a8fc3eeb3f0 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -30,7 +30,7 @@ obj-y				+= broadcom/
 obj-y				+= cirrus/
 obj-y				+= meson/
 obj-y				+= microchip/
-obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
+obj-$(CONFIG_GOOGLE_FIRMWARE)	+= coreboot/
 obj-y				+= efi/
 obj-y				+= imx/
 obj-y				+= psci/
diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/coreboot/Kconfig
similarity index 94%
rename from drivers/firmware/google/Kconfig
rename to drivers/firmware/coreboot/Kconfig
index b78c644fa253..b248bafe8b6b 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/coreboot/Kconfig
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig GOOGLE_FIRMWARE
-	bool "Google Firmware Drivers"
+	bool "coreboot firmware drivers"
 	default n
 	help
-	  These firmware drivers are used by Google servers,
-	  Chromebooks and other devices using coreboot firmware.
+	  These firmware drivers are used by devices running coreboot
+	  firmware, including Chromebooks and some Google servers.
 	  If in doubt, say "N".

 if GOOGLE_FIRMWARE
diff --git a/drivers/firmware/google/Makefile
b/drivers/firmware/coreboot/Makefile
similarity index 100%
rename from drivers/firmware/google/Makefile
rename to drivers/firmware/coreboot/Makefile
diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/coreboot/cbmem.c
similarity index 100%
rename from drivers/firmware/google/cbmem.c
rename to drivers/firmware/coreboot/cbmem.c
diff --git a/drivers/firmware/google/coreboot_table.c
b/drivers/firmware/coreboot/coreboot_table.c
similarity index 100%
rename from drivers/firmware/google/coreboot_table.c
rename to drivers/firmware/coreboot/coreboot_table.c
diff --git a/drivers/firmware/google/coreboot_table.h
b/drivers/firmware/coreboot/coreboot_table.h
similarity index 100%
rename from drivers/firmware/google/coreboot_table.h
rename to drivers/firmware/coreboot/coreboot_table.h
diff --git a/drivers/firmware/google/framebuffer-coreboot.c
b/drivers/firmware/coreboot/framebuffer-coreboot.c
similarity index 100%
rename from drivers/firmware/google/framebuffer-coreboot.c
rename to drivers/firmware/coreboot/framebuffer-coreboot.c
diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/coreboot/gsmi.c
similarity index 100%
rename from drivers/firmware/google/gsmi.c
rename to drivers/firmware/coreboot/gsmi.c
diff --git a/drivers/firmware/google/memconsole-coreboot.c
b/drivers/firmware/coreboot/memconsole-coreboot.c
similarity index 100%
rename from drivers/firmware/google/memconsole-coreboot.c
rename to drivers/firmware/coreboot/memconsole-coreboot.c
diff --git a/drivers/firmware/google/memconsole-x86-legacy.c
b/drivers/firmware/coreboot/memconsole-x86-legacy.c
similarity index 100%
rename from drivers/firmware/google/memconsole-x86-legacy.c
rename to drivers/firmware/coreboot/memconsole-x86-legacy.c
diff --git a/drivers/firmware/google/memconsole.c
b/drivers/firmware/coreboot/memconsole.c
similarity index 100%
rename from drivers/firmware/google/memconsole.c
rename to drivers/firmware/coreboot/memconsole.c
diff --git a/drivers/firmware/google/memconsole.h
b/drivers/firmware/coreboot/memconsole.h
similarity index 82%
rename from drivers/firmware/google/memconsole.h
rename to drivers/firmware/coreboot/memconsole.h
index aaff2b72b606..58899c2abaaa 100644
--- a/drivers/firmware/google/memconsole.h
+++ b/drivers/firmware/coreboot/memconsole.h
@@ -7,8 +7,8 @@
  * Copyright 2017 Google Inc.
  */

-#ifndef __FIRMWARE_GOOGLE_MEMCONSOLE_H
-#define __FIRMWARE_GOOGLE_MEMCONSOLE_H
+#ifndef __FIRMWARE_COREBOOT_MEMCONSOLE_H
+#define __FIRMWARE_COREBOOT_MEMCONSOLE_H

 #include <linux/types.h>

@@ -33,4 +33,4 @@ int memconsole_sysfs_init(void);
  */
 void memconsole_exit(void);

-#endif /* __FIRMWARE_GOOGLE_MEMCONSOLE_H */
+#endif /* __FIRMWARE_COREBOOT_MEMCONSOLE_H */
diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/coreboot/vpd.c
similarity index 100%
rename from drivers/firmware/google/vpd.c
rename to drivers/firmware/coreboot/vpd.c
diff --git a/drivers/firmware/google/vpd_decode.c
b/drivers/firmware/coreboot/vpd_decode.c
similarity index 100%
rename from drivers/firmware/google/vpd_decode.c
rename to drivers/firmware/coreboot/vpd_decode.c
diff --git a/drivers/firmware/google/vpd_decode.h
b/drivers/firmware/coreboot/vpd_decode.h
similarity index 100%
rename from drivers/firmware/google/vpd_decode.h
rename to drivers/firmware/coreboot/vpd_decode.h
-- 
2.53.0
