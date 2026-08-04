Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA324457DC
	for <chrome-platform@lists.linux.dev>; Tue,  4 Aug 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838399; cv=none; b=R79t5H5vsTyF9X2vzV4IAbRokOO3wQphfsBo5m0w+iLAWgV6RBq307nB7+HOkHjIkwWrMKXPjMmwp7JgHv9M/v5yCa+SYKxUCnHVoTrVB6ZRpwoxc8/+WGNCZoQRn4Rk6wfoipFU/soVfLPTY0SRRuaTDWHeTc9PKQSrXuPAg6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838399; c=relaxed/simple;
	bh=R4Rz3A3B0FYdVpxM4b2yW1U8TxbOL4wP+xDMOwkMtSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dy5RQRBCVtY4WbrGhelyAqoq11D8xJ6/h+la/UgOvhTXB0QsfV0R96qZyBXToMJcqiIi8x8/46mRH3XEvaQ256aUkqMlmHsLQdCZF/5ZdPN2KaDyrZRR7wH9gvsejMe2J7muyL6w4ceaSMX7mbUaEFqWjHHFXocZdrtQuwGVqB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=rD4/sI7s; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="rD4/sI7s"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso14676955e9.3
        for <chrome-platform@lists.linux.dev>; Tue, 04 Aug 2026 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785838394; x=1786443194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTO+yub/oHkWnNxE/PR+YPqKbJIe1H0uu4C2i4wSPEY=;
        b=rD4/sI7sqh/v8qNUBB2kDoFMsuWc5xKBE9AACqIo2GjCcj/H9g+S3f1PwDc/zbCqFJ
         35yNuSfz05SzPNmUl/dfouHPjgMWMd5JFA3bFKebKiV5zKatx5yRUIb+XPtEj48dqT4t
         WEIqIehLnMtinVX4UaDfCqZPoWXWT6P+iCILiT/bOVLwC3ibxcU1CCz7W0jdZsSKz39j
         XECmeNLYbr523tdpIj29LH9TRcfYS+2n5u5VFYn3pPFjV9Er2x6D4i1ajOR3CTk06Bxh
         vsWGzkfKSxCr3HxbkB1J/BVexsPO6/tCD8lek/NfDE1Eo27+C8iMrV6GtFWvi9uGeOPQ
         9q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785838394; x=1786443194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTO+yub/oHkWnNxE/PR+YPqKbJIe1H0uu4C2i4wSPEY=;
        b=Sl87hn5L4VZKuOy4Sf/umJJq6cTVYXmHZMWB9oU571Ozg09UqygFk7cLXI7TpW9aJL
         mSnOiHX/0eChveugc8qAj1HG6mGn/8HbqKewc8p4HDIzxWTX8e072E5e9HI+Vdn50MQH
         04JXR91R9+L77vQecX2M9w4DrYpaCpD1jKtwEjgkLtx4yVYETbdKe25kS7HAiox828fn
         1M8Ah5fLtlZTNq8DFdadg7vULFs8H3SvfJ139FH1roRMUjOxHq2QpnZNubjA3+xfwTmf
         59ZBg+1UGXTnbZZllZn/BPXVK0mfq49cE2pRPuxDpOo5nlsKdUNSA/VcMr0bPL4YyYjL
         fkvg==
X-Gm-Message-State: AOJu0YxmqB7TE+O0buZg8XVXyW4ha/+xQ1m0mJoK0TUaHmQ06ofLpz7Z
	RFtrMCJ5jHYZTDJ+yJl/uoFV5vbL+l2QIjw1gvWBsBmVxxIWcD2A2st9xRgQ2GWKn1Cjk7Aa3zt
	ZNuoxpYJf
X-Gm-Gg: AR+sD12AAL30PIDvLskv2ZzrAHH1jHWBBK9m6u/qjhaUfC6MSl48qBgtzjMEBYFlEY3
	SuEoApbK4JNmDlcKg1fpvO6MkJ7Ymp0WVN+raS8dYmVrQ4Kz9w7sK6PVsd52h5GndtPpn81ANyw
	iJoqsZ4iam9nFERAD4Vdz/0TEm3TSHlPFLdvgiTO+TwjxtEuMR0QEKBnQqzTTmMv3RKJHxrPJ2H
	LJvDEyY4/Bdy+S7+Q/NpI6maAd2+m9RA1IykyRT0cGbUQ9/NLiUTvmG3iS+64u18QInuQ+0JUVk
	rE1RmFNQraI875yWWerpx/uSkLqc9r3TqmGLNwnAIDnmhmCHA55cWwTddVbMv4xXAU1yT9hHmKQ
	dOu764gj5oNd9Cgqva7zY3ycXPF4nXqEKpb4ACoFBJANyusDFV3UMTt9hvn37KvkJYvnKC+pTag
	LzYlnKLpQasOuVGBG6gRpsQAD1YjaHA87diey9AgMAyheidIboYlgSxa9ZgLmClsZb57W/ChE9D
	EMWY8AfgnNyjH1TkwitjNUAc0Dpsy4i
X-Received: by 2002:a05:600d:6451:20b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-4980c66d950mr239212685e9.7.1785838393168;
        Tue, 04 Aug 2026 03:13:13 -0700 (PDT)
Received: from horizon.localdomain ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm67300275e9.4.2026.08.04.03.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 03:13:12 -0700 (PDT)
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
	Florian Fainelli <florian.fainelli@broadcom.com>,
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Oliver Lin <oliver@liuxiaozhen.dev>
Subject: [PATCH v11 0/4] coreboot CFR firmware attributes
Date: Tue,  4 Aug 2026 11:13:05 +0100
Message-ID: <cover.1785838269.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the firmware attributes class helper out of platform/x86, rename the
coreboot-table firmware driver directory from google to coreboot, and add a
coreboot CFR firmware attributes driver.

Changes in v11:
- Keep the scoped cleanup in the CFR driver, but use explicit goto cleanup for
  the nested sysfs group registration path.

Changes in v10:
- Address the nested cleanup-path review on CFR attribute registration.

Changes in v9:
- Add the missing kstrtox.h include used by kstrtou32().
- Use a single kobject rollback path when setting registration fails.
- Split a few helper locals for readability, including the pending reboot
  device lookup and enum-value population.
- Avoid an intermediate void pointer cast while parsing numeric CFR options.
- Check the possible-values buffer length before computing each label length.

Tested on a Star Labs Byte with firmware 26.07: runtime APM_CNT apply was
verified with power_led, and reboot-needed behavior was verified with
debug_level.

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
 drivers/firmware/coreboot/coreboot-cfr.c      | 1205 +++++++++++++++++
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
 31 files changed, 1340 insertions(+), 65 deletions(-)
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

