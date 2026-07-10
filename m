Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDAF3AE1B1
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783663974; cv=none; b=lkv2OhoYZ/JlaatnOPhbMdnYIm7fkezdZz0kxHfnfaPKLny212fNMYjKuHa3GkceCXpVqgJidpjAkzhdWPwTTfBstfz+jI6SBqYuOfn4hrDTcX/5FL5B6CLXcmrZ7h9ZuXDoV4ZSdj13ruAU/nL5GWgZVpOFNP74XGjJ505NI8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783663974; c=relaxed/simple;
	bh=eN0z7D1f93jXx/NdtUWbMH5xVVCrVVks8GLou67FKXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EByCVDWMiCWDyLHiUwMf4+yO2UhPhy1DjCjUNZSgoZRQ70b5ncchEYZfaOR+4hyao3/w/RMxwOr9d5hOpFbKlgakL+u4PmU6tGLxAg4YmV6REbVsjqx02gEiCrjxHxwalyfPTlx2s3nI7jt8q3OfmA/dR6EmHHdYa9uiRExPNic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=YwlX2jIV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="YwlX2jIV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so547202f8f.1
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jul 2026 23:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783663971; x=1784268771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1GphxbL4F1o+/8/pTQ4CBHXwwTUunPFVNs2pnN612I=;
        b=YwlX2jIVXcBkbenL4IaPFd8HiDeZtHFterIfDJaVNcTeGyqEIjWrDkwUZqA88rA2Ay
         q0ZdSEN4u0qsXJMkg6p+wCWYFmfKoLhA0o8NIzJikwpC1W8+dzEThhHBcfBpCoXSIO+f
         n6RSBCN1xbPL2qt6UUFhJ1tKuqYJykpKlC5xaiRU8HY5FQj+8PbeP7ba7WMl+M8OWuU7
         EllF0UoEMvnwGKKskXNwB1jJvHmwQXL1LZ+JL66hfx8TijUWxJ80KrvZI2VnpcR1R5KW
         +FwfEnpt1Qm/W8XsLsnbPY5NffFakHwV+hpAYZe1lUNy5nDU3Ct8n+Cjz2w03kmduUdh
         6/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783663971; x=1784268771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1GphxbL4F1o+/8/pTQ4CBHXwwTUunPFVNs2pnN612I=;
        b=IDTBnoewqfLuBfJRfquQyLciMJIpsz3SP3E/mkSdySnROnNL7e2G/po5B5+GaLnb3i
         OAJjMGI7FbK+inP802GFpYAly3ZEipaw5KA6+XP+WW6wgHStLeYy72mw5c/dvGDA6CnF
         36gzfBvqX4hlgXXv8tHokq1KfmxO76iA1MJ1s/kFFnrv3KpQpqXp9vcEGms8k+MJGC5H
         MniCO4ugtAyqYthAg4ENeJUzhmrUb+dtK1M1+3FGcY/z8UAmLEilq5dx3w3mjCpk0wrw
         F3FKc18iLFimiDc7Q60m5OKlqCWWZJGZtL9mKi2wzsKujdf1RrDcCkM1sUgwRqpPw+/V
         rv3A==
X-Forwarded-Encrypted: i=1; AHgh+RoVhsXiPK9ZTCJ9LdlETL7YfxN37NqpuAaAdJKTiCrIrMNmE8CZkgWw5ADI8rliQ0CrFgqKILW9UXNAlVUaCO4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOpadEHSd4RX3J61xvyHW6DTRgET4wqe5coS/KUqGJGYrs9Zw6
	aDpgyFgO/JQN5Pgvi8C+pWuff16xyiaG4NjCuHKnVOhx4FZ/UpAlX4/J5a1oj2HobQ==
X-Gm-Gg: AfdE7cm43xdKAZ/X8yPoNlBttIzjro/8o2hirmD4K20bYfxeJkeEWW2pl0eFWVWX5MI
	AOqDMOU1FLbXHytH7UzCBx9D4as1piqzz1vqHwRHsFH/7JHX88dmUN6A+/bjrJ/gQz7SD9nvVNK
	wqzRHqyAAc/je/R5JCZO69vlw1Ftd+BMMgOa1rxrXwYX9yZSa13n71N34wOoJpEtpu4xoBFSPBR
	/Im6u8d/3Ho4O1NeAubu4eW9GrwlaVgN7+MXO9nt3Uyl3NcSJfQH15HUoqZLF2iEepFPMxk7tEl
	D66f8BErslBO2iWhsVU4mtbfCsfIexofJ2ILKbAK1MdcIJv/2GmCkrmoK0wc4UBfkykQlNR3e8q
	zv7OWvQfTV1QOmHyF1L3xMFoIBaYuDxuEqJmcUQ1VzzN86JbM1E3DWLjEMYd0LXZ7ORuywpmTAZ
	38+c/m3gC4irb/Oe8P/33rL4a8YZ2b6Xd1JwfMuRY=
X-Received: by 2002:a05:600c:871a:b0:493:edde:33e2 with SMTP id 5b1f17b1804b1-493edde34cbmr50149425e9.32.1783663971028;
        Thu, 09 Jul 2026 23:12:51 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm110345675e9.3.2026.07.09.23.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:12:49 -0700 (PDT)
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
Subject: [PATCH v3 2/3] firmware: Rename google firmware directory to coreboot
Date: Fri, 10 Jul 2026 07:12:45 +0100
Message-ID: <4cc4e0c4b69aaea7e5af730ab72831a25ea1469e.1783663929.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783663929.git.sean@starlabs.systems>
References: <cover.1783663929.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index ec0a12121357..01344fc92253 100644
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
diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/coreboot/Makefile
similarity index 100%
rename from drivers/firmware/google/Makefile
rename to drivers/firmware/coreboot/Makefile
diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/coreboot/cbmem.c
similarity index 100%
rename from drivers/firmware/google/cbmem.c
rename to drivers/firmware/coreboot/cbmem.c
diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/coreboot/coreboot_table.c
similarity index 100%
rename from drivers/firmware/google/coreboot_table.c
rename to drivers/firmware/coreboot/coreboot_table.c
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/coreboot/coreboot_table.h
similarity index 100%
rename from drivers/firmware/google/coreboot_table.h
rename to drivers/firmware/coreboot/coreboot_table.h
diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/coreboot/framebuffer-coreboot.c
similarity index 100%
rename from drivers/firmware/google/framebuffer-coreboot.c
rename to drivers/firmware/coreboot/framebuffer-coreboot.c
diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/coreboot/gsmi.c
similarity index 100%
rename from drivers/firmware/google/gsmi.c
rename to drivers/firmware/coreboot/gsmi.c
diff --git a/drivers/firmware/google/memconsole-coreboot.c b/drivers/firmware/coreboot/memconsole-coreboot.c
similarity index 100%
rename from drivers/firmware/google/memconsole-coreboot.c
rename to drivers/firmware/coreboot/memconsole-coreboot.c
diff --git a/drivers/firmware/google/memconsole-x86-legacy.c b/drivers/firmware/coreboot/memconsole-x86-legacy.c
similarity index 100%
rename from drivers/firmware/google/memconsole-x86-legacy.c
rename to drivers/firmware/coreboot/memconsole-x86-legacy.c
diff --git a/drivers/firmware/google/memconsole.c b/drivers/firmware/coreboot/memconsole.c
similarity index 100%
rename from drivers/firmware/google/memconsole.c
rename to drivers/firmware/coreboot/memconsole.c
diff --git a/drivers/firmware/google/memconsole.h b/drivers/firmware/coreboot/memconsole.h
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
diff --git a/drivers/firmware/google/vpd_decode.c b/drivers/firmware/coreboot/vpd_decode.c
similarity index 100%
rename from drivers/firmware/google/vpd_decode.c
rename to drivers/firmware/coreboot/vpd_decode.c
diff --git a/drivers/firmware/google/vpd_decode.h b/drivers/firmware/coreboot/vpd_decode.h
similarity index 100%
rename from drivers/firmware/google/vpd_decode.h
rename to drivers/firmware/coreboot/vpd_decode.h
