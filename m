Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08023BED38
	for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 21:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003702; cv=none; b=PyeLqAHcGMqc0QKk7sucKf5ZEIE4lwgnGudeEp1Jlnrcm5d2UsNE/WJD6ZdP0ZWHxx6KS7cLxTmU50pb0nLowhMmBgm7SFk1dYXRYFb0mdmzgFN8F0iwXgJ7e89pczGsen1M4uD7pBdz4ggqnHLIYJPKBEasJiqHKSCTVRUJ2GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003702; c=relaxed/simple;
	bh=evBeKKkJVTvBJKKhOYCY4qDw+suUNw7N1qE6ebU98jM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqC3mIrKXQwfFi0bAl8WTHypTzQh3vQNuGyQ3eKDtLsCCXePTtw4EjZ0xBk2Qh0r8LkKAuz3R+b0/4MNktCSXMB/7SIz2jfhnCiYQbquFn3L5J+bOFbv+44zF25TamF3+c7ebylIzgECe5d/RWx1YPzb/93CzxrNFKD59S4PRdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=YybWcSVB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="YybWcSVB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47362928f65so3778822f8f.2
        for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 14:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787003698; x=1787608498; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9x7uXMYzzPJu6LY6LMr/n8ilhZ5Lcr3gAl8Pm0/Hths=;
        b=YybWcSVBgZsMwFEIcNNT/Q4U8uGqe+Fku3n8SE94rdOPZxadnxM0BXpQTmqapkBSuL
         nXY1aLMN70DsddFaOjZIO+Y+5xtdJ8lp9eHVZh9JeqOYpBHPNyYeVuwS7XQOiPxGIVxN
         uG61/BrBHUrMlYxF2KPh1W3HMSO6NCjqe96tfBOjmb1qjF8YkaGce5UExGM/PQyEfdwh
         ajXMmwvpPgAFJmxrARqCtaCw/Iifg0kmB7iMszbT6DrHxdOerJdG7W6LXFY8flYGYCst
         6c1s77Q0IoL8Qyh6HItfIavsAhXDn4nFu0bnLszBlzQjXgqQfoSCIIaf3W/VDfYaNqgi
         bNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003698; x=1787608498;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9x7uXMYzzPJu6LY6LMr/n8ilhZ5Lcr3gAl8Pm0/Hths=;
        b=G4Mx90Cqr7OC8qDIoNnpmloTfdNasQtkcHjXRCN3pEYCOBgp6xl2NW8DQZEKwVcCaf
         HxBYQLWQv1IrSrzq2OaPBoi3HWnLvGYePt6ZQV/lXcHnAP0414j366TrZvO3JoQHXtwq
         g7JgnvrEYF7sOj14FLfLcwnYgQdq4T7wMv2sdcChBvdLU5gy2zBufki6mHzThq0nSnyj
         vbIjnIKe0x8ikkIZEaLsFw+9OSxmtUKBQv27m7o0TIRG3YXr2T9+X4D1XcSS8gOPK5OZ
         KuKzml5J//jTqB9l3tCsvXyzfWfdN3lilNQ7g/DJ6V41BpymTbP6RpiOy5Y1wK35YaqI
         OicA==
X-Gm-Message-State: AOJu0Yx8FbcuVpk7MIizqlBnhnNFGHevs+SBxmXLCotkCEYREJVTdttZ
	w1UuDjUWwdpzxt+Gy57AJR5iHdzRj89yXrLIgVWwt+TVL7tCNUtMRttcWS7t1mTAjNe1CKxLCUh
	p++RFCg==
X-Gm-Gg: AR+sD10K3gKJn8qGKCTwvNRJdbf2NeT+Ts6eTTaezAy0hpXXF3FUrsLDs+wmrGrcuic
	eNhRBTmPscg8gyxQ4sPTFo7rDVSZQX8PxbUE1oMVZ81+im4OTGNgiCHz/rNgRaJyI4j6yEpGI6f
	ukqb4tmGrz7TnSVYssnqLvIUKD+u1dVxiX+DpyEB1jMI1af26JJ+ah4eFgQfQ5bW10sDyDPMyRB
	ASu1AUkW9IKt/cQYH0DO9nAsqZEzaanEHl5/lzwvziQBdftXeu95DFpBFZVkCFkT5OR4s43dB3f
	hzF6vKaFcmzB/R5lDSChnTR87FkZfzJjCnbAQOO0bTOyB/pOBHVMFzOHzU81yz40fCUBLUlqAJu
	3zm53cqmlEiT2xRV2I0kvx9dcZUrZIbiPEHJaLGQXkwVyj8OfX7Dc+Z0LOS+w8de/faJMc5hCZe
	cC8ZhyN0KQroRtbeNGi+g83Pb+0XXR3Gl9+siVyiNCX5RVFmBQ5SZQIpo+ndYBB7m8KNdINtZ3H
	1vRXE+j9diI9A==
X-Received: by 2002:a05:6000:4210:b0:47f:9254:d453 with SMTP id ffacd0b85a97d-482a90782b2mr4754092f8f.8.1787003698061;
        Mon, 17 Aug 2026 14:54:58 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b3f0sm6060954f8f.14.2026.08.17.14.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:54:57 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: chrome-platform@lists.linux.dev
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
	Dell.Client.Kernel@dell.com,
	Sean Rhodes <sean@starlabs.systems>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	linux-kernel@vger.kernel.org,
	oliver@liuxiaozhen.dev
Subject: [PATCH v13 RESEND 3/5] firmware: Rename google firmware directory to coreboot
Date: Mon, 17 Aug 2026 22:54:49 +0100
Message-ID: <557d363a779c3c03bfe939dc2fefd6a4265fa7ad.1787003659.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787003659.git.sean@starlabs.systems>
References: <cover.1787003659.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most drivers in drivers/firmware/google are coreboot table drivers rather
than Google-specific firmware drivers. Rename the directory to coreboot
and update the Kconfig prompt, build path and maintainer entry.

Rename the generic firmware Kconfig symbols to CONFIG_COREBOOT_* at the
same time so new configurations describe the firmware interface rather
than one vendor. Keep the old CONFIG_GOOGLE_* names as transitional
symbols so existing configurations keep selecting the same drivers
during the rename.

Leave defconfig updates to a separate patch so the configuration churn
is easy to review independently.

Suggested-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 MAINTAINERS                                   | 20 ++---
 drivers/firmware/Kconfig                      |  2 +-
 drivers/firmware/Makefile                     |  2 +-
 drivers/firmware/{google => coreboot}/Kconfig | 74 ++++++++++++++-----
 .../firmware/{google => coreboot}/Makefile    | 10 +--
 drivers/firmware/{google => coreboot}/cbmem.c |  0
 .../{google => coreboot}/coreboot_table.c     |  0
 .../{google => coreboot}/coreboot_table.h     |  0
 .../framebuffer-coreboot.c                    |  0
 drivers/firmware/{google => coreboot}/gsmi.c  |  0
 .../memconsole-coreboot.c                     |  0
 .../memconsole-x86-legacy.c                   |  0
 .../{google => coreboot}/memconsole.c         |  0
 .../{google => coreboot}/memconsole.h         |  6 +-
 drivers/firmware/{google => coreboot}/vpd.c   |  0
 .../{google => coreboot}/vpd_decode.c         |  0
 .../{google => coreboot}/vpd_decode.h         |  0
 drivers/gpu/drm/sysfb/Kconfig                 |  2 +-
 18 files changed, 77 insertions(+), 39 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (64%)
 rename drivers/firmware/{google => coreboot}/Makefile (51%)
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
index caef5ab15a4c..6f3717a5a2e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6657,6 +6657,16 @@ F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 F:	tools/testing/selftests/cgroup/test_kmem.c
 F:	tools/testing/selftests/cgroup/test_memcontrol.c
 
+COREBOOT FIRMWARE DRIVERS
+M:	Tzung-Bi Shih <tzungbi@kernel.org>
+R:	Brian Norris <briannorris@chromium.org>
+R:	Julius Werner <jwerner@chromium.org>
+L:	chrome-platform@lists.linux.dev
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
+F:	drivers/firmware/coreboot/
+F:	include/linux/coreboot.h
+
 CORETEMP HARDWARE MONITORING DRIVER
 L:	linux-hwmon@vger.kernel.org
 S:	Orphan
@@ -11065,16 +11075,6 @@ S:	Maintained
 F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
 F:	drivers/net/ethernet/google
 
-GOOGLE FIRMWARE DRIVERS
-M:	Tzung-Bi Shih <tzungbi@kernel.org>
-R:	Brian Norris <briannorris@chromium.org>
-R:	Julius Werner <jwerner@chromium.org>
-L:	chrome-platform@lists.linux.dev
-S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
-F:	drivers/firmware/google/
-F:	include/linux/coreboot.h
-
 GOOGLE TENSOR SoC SUPPORT
 M:	Peter Griffin <peter.griffin@linaro.org>
 R:	André Draszik <andre.draszik@linaro.org>
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
index 385b6e8b7fc6..f8da96382680 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -30,7 +30,7 @@ obj-y				+= broadcom/
 obj-y				+= cirrus/
 obj-y				+= meson/
 obj-y				+= microchip/
-obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
+obj-$(CONFIG_COREBOOT_FIRMWARE)	+= coreboot/
 obj-y				+= efi/
 obj-y				+= imx/
 obj-y				+= psci/
diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/coreboot/Kconfig
similarity index 64%
rename from drivers/firmware/google/Kconfig
rename to drivers/firmware/coreboot/Kconfig
index b78c644fa253..d273bd836245 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/coreboot/Kconfig
@@ -1,13 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menuconfig GOOGLE_FIRMWARE
-	bool "Google Firmware Drivers"
+menuconfig COREBOOT_FIRMWARE
+	bool "coreboot firmware drivers"
+	default GOOGLE_FIRMWARE
 	default n
 	help
-	  These firmware drivers are used by Google servers,
-	  Chromebooks and other devices using coreboot firmware.
+	  These firmware drivers are used by devices running coreboot
+	  firmware, including Chromebooks and some Google servers.
+	  They include shared support for coreboot table entries and
+	  drivers for CBMEM, framebuffer, firmware console and VPD records.
 	  If in doubt, say "N".
 
-if GOOGLE_FIRMWARE
+if COREBOOT_FIRMWARE
 
 config GOOGLE_SMI
 	tristate "SMI interface for Google platforms"
@@ -19,9 +22,10 @@ config GOOGLE_SMI
 	  driver provides an interface for reading and writing NVRAM
 	  variables.
 
-config GOOGLE_CBMEM
+config COREBOOT_CBMEM
 	tristate "CBMEM entries in sysfs"
-	depends on GOOGLE_COREBOOT_TABLE
+	depends on COREBOOT_TABLE
+	default GOOGLE_CBMEM
 	help
 	  CBMEM is a downwards-growing memory region created by the
 	  Coreboot BIOS containing tagged data structures from the
@@ -34,9 +38,10 @@ config GOOGLE_CBMEM
 	  memory for each entry in sysfs under
 	  /sys/bus/coreboot/devices/cbmem-<id>.
 
-config GOOGLE_COREBOOT_TABLE
+config COREBOOT_TABLE
 	tristate "Coreboot Table Access"
 	depends on HAS_IOMEM && (ACPI || OF)
+	default GOOGLE_COREBOOT_TABLE
 	help
 	  This option enables the coreboot_table module, which provides other
 	  firmware modules access to the coreboot table. The coreboot table
@@ -44,42 +49,75 @@ config GOOGLE_COREBOOT_TABLE
 	  device tree node /firmware/coreboot.
 	  If unsure say N.
 
-config GOOGLE_MEMCONSOLE
+config COREBOOT_MEMCONSOLE_COMMON
 	tristate
-	depends on GOOGLE_MEMCONSOLE_X86_LEGACY || GOOGLE_MEMCONSOLE_COREBOOT
+	depends on GOOGLE_MEMCONSOLE_X86_LEGACY || COREBOOT_MEMCONSOLE
+	default GOOGLE_MEMCONSOLE
 
 config GOOGLE_MEMCONSOLE_X86_LEGACY
 	tristate "Firmware Memory Console - X86 Legacy support"
 	depends on X86 && ACPI && DMI
-	select GOOGLE_MEMCONSOLE
+	select COREBOOT_MEMCONSOLE_COMMON
 	help
 	  This option enables the kernel to search for a firmware log in
 	  the EBDA on Google servers.  If found, this log is exported to
 	  userland in the file /sys/firmware/log.
+	  This driver is limited to x86 systems that expose the legacy
+	  Google EBDA console format.
 
-config GOOGLE_FRAMEBUFFER_COREBOOT
+config COREBOOT_FRAMEBUFFER
 	tristate "Coreboot Framebuffer"
-	depends on GOOGLE_COREBOOT_TABLE
+	depends on COREBOOT_TABLE
+	default GOOGLE_FRAMEBUFFER_COREBOOT
 	help
 	  This option enables the kernel to search for a framebuffer in
 	  the coreboot table.  If found, it is registered with a platform
 	  device of type coreboot-framebuffer. Using the old device of
 	  type simple-framebuffer is deprecated.
 
-config GOOGLE_MEMCONSOLE_COREBOOT
+config COREBOOT_MEMCONSOLE
 	tristate "Firmware Memory Console"
-	depends on GOOGLE_COREBOOT_TABLE
-	select GOOGLE_MEMCONSOLE
+	depends on COREBOOT_TABLE
+	select COREBOOT_MEMCONSOLE_COMMON
+	default GOOGLE_MEMCONSOLE_COREBOOT
 	help
 	  This option enables the kernel to search for a firmware log in
 	  the coreboot table.  If found, this log is exported to userland
 	  in the file /sys/firmware/log.
+	  This is the coreboot-table backed variant of the firmware memory
+	  console driver.
 
 config GOOGLE_VPD
 	tristate "Vital Product Data"
-	depends on GOOGLE_COREBOOT_TABLE
+	depends on COREBOOT_TABLE
 	help
 	  This option enables the kernel to expose the content of Google VPD
 	  under /sys/firmware/vpd.
+	  VPD records carry firmware-provided key/value data used by
+	  Google devices.
+
+endif # COREBOOT_FIRMWARE
 
-endif # GOOGLE_FIRMWARE
+config GOOGLE_FIRMWARE
+	bool
+	transitional
+
+config GOOGLE_CBMEM
+	tristate
+	transitional
+
+config GOOGLE_COREBOOT_TABLE
+	tristate
+	transitional
+
+config GOOGLE_MEMCONSOLE
+	tristate
+	transitional
+
+config GOOGLE_FRAMEBUFFER_COREBOOT
+	tristate
+	transitional
+
+config GOOGLE_MEMCONSOLE_COREBOOT
+	tristate
+	transitional
diff --git a/drivers/firmware/google/Makefile b/drivers/firmware/coreboot/Makefile
similarity index 51%
rename from drivers/firmware/google/Makefile
rename to drivers/firmware/coreboot/Makefile
index 8151e323cc43..e681f274417a 100644
--- a/drivers/firmware/google/Makefile
+++ b/drivers/firmware/coreboot/Makefile
@@ -1,14 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_GOOGLE_SMI)		+= gsmi.o
-obj-$(CONFIG_GOOGLE_COREBOOT_TABLE)        += coreboot_table.o
-obj-$(CONFIG_GOOGLE_FRAMEBUFFER_COREBOOT)  += framebuffer-coreboot.o
-obj-$(CONFIG_GOOGLE_MEMCONSOLE)            += memconsole.o
-obj-$(CONFIG_GOOGLE_MEMCONSOLE_COREBOOT)   += memconsole-coreboot.o
+obj-$(CONFIG_COREBOOT_TABLE)               += coreboot_table.o
+obj-$(CONFIG_COREBOOT_FRAMEBUFFER)         += framebuffer-coreboot.o
+obj-$(CONFIG_COREBOOT_MEMCONSOLE_COMMON)   += memconsole.o
+obj-$(CONFIG_COREBOOT_MEMCONSOLE)          += memconsole-coreboot.o
 obj-$(CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY) += memconsole-x86-legacy.o
 
 # Must come after coreboot_table.o, as this driver depends on that bus type.
-obj-$(CONFIG_GOOGLE_CBMEM)		+= cbmem.o
+obj-$(CONFIG_COREBOOT_CBMEM)		+= cbmem.o
 
 vpd-sysfs-y := vpd.o vpd_decode.o
 obj-$(CONFIG_GOOGLE_VPD)		+= vpd-sysfs.o
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
diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
index 2559ead6cf1f..34d3fa8b30c9 100644
--- a/drivers/gpu/drm/sysfb/Kconfig
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -10,7 +10,7 @@ config DRM_SYSFB_HELPER
 config DRM_COREBOOTDRM
 	tristate "Coreboot framebuffer driver"
 	depends on DRM && MMU
-	depends on GOOGLE_FRAMEBUFFER_COREBOOT
+	depends on COREBOOT_FRAMEBUFFER
 	select APERTURE_HELPERS
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
