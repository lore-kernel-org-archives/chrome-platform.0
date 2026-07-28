Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C6C3DDB1A
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jul 2026 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226859; cv=none; b=W9RAV/CTSVN/rHy+mQi3zmY+zOcI++JIVUosofzGlVOrla5c4VmHPN4A3wAnHH5BhnSEmEtAWxae09SAjbOAQh26XwoAnuqZJSAM3LzThpJc9LJm36OID6iZ1HviaGImbGWZZ9LHp8UcBaHhpoO51eVMNSDK1AyuSQTPLJAT/dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226859; c=relaxed/simple;
	bh=ZMGN4prWDETUzkvX6AOxh9rcYuUBqEOMkLtkiQfmZoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4OJaVBWaki8NQUgCHuavkkPOfLFSdofUGpqCxXCMQGdCszWcop2/VqaSJ4rGEheLX2JsOCI5HO9JZthBs9T/LgVuGj+4XlF6qMTgUkoRs4G60T3rFNQ55fRxORLs+gWtHZ5sWehMEaQIQdBRZAOiP+dkiz5F9hEulnfaWKrKtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=AQShsUwL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="AQShsUwL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso18290135e9.3
        for <chrome-platform@lists.linux.dev>; Tue, 28 Jul 2026 01:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785226853; x=1785831653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wt5+bX0vwYVzRBQrHnjwiYNYQTzOad61TO1Roo1dBpE=;
        b=AQShsUwLUfF9Bd1WFYlnqsiE0TnUMotWBNWiL48iPIJw+l285/HX9syv9V6S4w+BJK
         eKpZXyVKlukI7fs2otxPhhBp/ATHeGqqvE7MxtLvYKaH0hW3n2P+PMNksHqFShbsGfK5
         cvEQ9z3O2JnVWvLuv8sNU/2rXsrVUAAeFzsl4v5TvoKGY310e3gbxlcrd3h5eZPGak8R
         7MNdkSs+PoyxB7qMX0Uf5q7m3P4VR44PehzFGqA7DS6e/7qcxI6ecnRZQoRucXgGeU0t
         lJ3LY3Ggv3Rw1AqnihGcfUU1kbugy5qJshxfKANO4BnzRni4pel9AEu7G2uN6eOhSRb/
         4Mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785226853; x=1785831653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wt5+bX0vwYVzRBQrHnjwiYNYQTzOad61TO1Roo1dBpE=;
        b=IgwqlvjMNGP9ze9KW1UIrdk3IPZc7cTyjehLHwW51bSbpSndOhBz2Uthdu0ffl5zlP
         X4NrlSqP34SfNv4NIaAC1W12afFTEzqpQZpTK6QftBDMaO3P/h+v+REuFaN5NrtGcfxm
         qK1L5qaOa8zvl65yO+IY9dQf7DVAQhEywG9lEBNfDmNm9TOvEeHkcKxNBL0PQNpB1sAD
         8M5czSjR4vtPTMfD5X8QMnIqSFlR2GAS226QOrzDKUqENuACHrcioz5omNkirQwnhMi5
         dkXF5V6k0Gd3bf5KKzC3RjVpWQVhOx6gzPg9/My9Bltlrg/nUwonK6Tk7wVbCpKcbex+
         4zaA==
X-Gm-Message-State: AOJu0YwYsGywyJuNMwnjuPAbwWgjlQsr2G5T5gZYZdLGyB7Rp6qjBiPx
	EmRbnX4JD/O7/m85ByjS76Ms0qpU7W27d+dtiOyz8o5Ax5iQNRAbXzdIA/BLrbyAVuncdl+9LGm
	EBjyfuAWm
X-Gm-Gg: AR+sD11QDtII56kxw451z3AslLwjjtBvZjMSlRCUNkrFbogXNAP1YUL0tHVO6tC30A3
	VQBQy+omyi31iHO9k+zYT1BZWqsbhtUnq2nJSE9uD3chcdnuUxwBxmlDe3/47b7zcs+Jh0OVTQW
	SFX5cdoTabx50MrKDy9tzwHscsOmB48l87PTWa7ZKvnGwBjry2d8e4ZCdJOTyKttikUHUegB98Q
	onzKu/ia3ca7IuOJjjEZh3ti/ET7D2o29jpyMMW54UYnXmF8ej9dprBuX8Z8ckP0KhLgB/823RK
	xrWw9HLOcJmq9OAMNvpV7cX24gFoJ3B7AW/gq5bORJTCwGWzEkZqgh+6ofO9EmzQLhDRJnFCbZl
	pLtQCzHrf4slmRb28BES0do4UsVa3Ns+Dha0BloeXnsdZ56vu9AFSjrgbyXk6USuDN2bs0T5aaD
	xHQD16IUSIKRF+aB8l48jMOOIbp4pGapwjxwnpxiDOh/tNww==
X-Received: by 2002:a05:600c:4687:b0:494:6baa:ccef with SMTP id 5b1f17b1804b1-496c64262b5mr14201095e9.11.1785226853260;
        Tue, 28 Jul 2026 01:20:53 -0700 (PDT)
Received: from horizon.localdomain ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b388d5b4sm208150465e9.3.2026.07.28.01.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:20:52 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Sean Rhodes <sean@starlabs.systems>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Oliver Lin <oliver@liuxiaozhen.dev>
Subject: [PATCH v10 0/4] coreboot CFR firmware attributes
Date: Tue, 28 Jul 2026 09:20:45 +0100
Message-ID: <cover.1785226809.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the firmware attributes class helper out of platform/x86,
renames the coreboot table firmware directory, and adds a coreboot CFR
firmware-attributes driver.

Changes in v10:
- Rename the generic firmware Kconfig symbols from GOOGLE_* to COREBOOT_* and
  keep the old names as transitional symbols, as suggested by Julius.
- Update the arm64 defconfig, DRM coreboot framebuffer dependency, and coreboot
  Makefile users to the new symbols.
- Keep the v9 driver fixes and helper include-order split.

GOOGLE_SMI, GOOGLE_MEMCONSOLE_X86_LEGACY and GOOGLE_VPD keep their existing
names because those drivers remain Google-specific.

Sean Rhodes (4):
  platform/x86: Sort firmware attributes class includes
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  firmware: coreboot: Add CFR firmware attributes driver

 MAINTAINERS                                   |   18 +-
 arch/arm64/configs/defconfig                  |    6 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   88 +-
 drivers/firmware/coreboot/Makefile            |   15 +
 drivers/firmware/{google => coreboot}/cbmem.c |    0
 drivers/firmware/coreboot/coreboot-cfr.c      | 1193 +++++++++++++++++
 .../{google => coreboot}/coreboot_table.c     |    0
 .../{google => coreboot}/coreboot_table.h     |    0
 .../framebuffer-coreboot.c                    |    0
 drivers/firmware/{google => coreboot}/gsmi.c  |    0
 .../memconsole-coreboot.c                     |    0
 .../memconsole-x86-legacy.c                   |    0
 .../{google => coreboot}/memconsole.c         |    0
 .../{google => coreboot}/memconsole.h         |    6 +-
 drivers/firmware/{google => coreboot}/vpd.c   |    0
 .../{google => coreboot}/vpd_decode.c         |    0
 .../{google => coreboot}/vpd_decode.h         |    0
 .../firmware_attributes_class.c               |    2 +-
 drivers/firmware/google/Makefile              |   14 -
 drivers/gpu/drm/sysfb/Kconfig                 |    2 +-
 drivers/platform/x86/Kconfig                  |    3 -
 drivers/platform/x86/Makefile                 |    2 -
 drivers/platform/x86/asus-armoury.c           |    2 +-
 .../x86/dell/dell-wmi-sysman/sysman.c         |    9 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    9 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    5 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    3 +-
 .../linux/firmware_attributes.h               |    6 +-
 31 files changed, 1328 insertions(+), 65 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (57%)
 create mode 100644 drivers/firmware/coreboot/Makefile
 rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
 create mode 100644 drivers/firmware/coreboot/coreboot-cfr.c
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
 rename drivers/{platform/x86 => firmware}/firmware_attributes_class.c (94%)
 delete mode 100644 drivers/firmware/google/Makefile
 rename drivers/platform/x86/firmware_attributes_class.h => include/linux/firmware_attributes.h (60%)

