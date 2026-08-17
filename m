Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8D0379C23
	for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 21:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003698; cv=none; b=OPwXZbL7XPW9NQ+6FyPkfxt9EUmBt/CwMdRygqjPb3Iua64pEW+eyd0gypmfVbaOhT+xn+WTUh9YZdPuFwlZK7zBgfDb0OhKnPRZ40vthQqHehmKUC6+VPLVnpbkwYg422NyqTsuisnr9EJjggIX9eOJcz0LcxF5l/QaEXkiGNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003698; c=relaxed/simple;
	bh=JQyRpI8j7w1b1klCJajkWAEryhwrrdGvQg42aPShEIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JwMr8o0eJZRZXjViXsXqIAd7um1wVWuV8DCjqUJ55ZuBTYX02jaAus1gHd6edD6zl1dFKWPTo0Df7YB5j5mMSmTfVqtXyLUD9qOfGskgGZnUsL9q2z3t9XNSJsPPJq7jLZVn1t/Iv9dxIZmuE6oSjRrE85aypHFEWLZp2Jmh26g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=A5DMlxIc; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="A5DMlxIc"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fde295992so261748f8f.0
        for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 14:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787003693; x=1787608493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2r14PQPnRwiCu2pDxGMLEtZiP7xW2TLvpcZv4TNoYzM=;
        b=A5DMlxIc8YdDgxWNB/r2pJBoEVJ3jCpXY+hnEqFWMHZTDUSLZ4HbgSEjVbVKx3aVgu
         ZFWYjFQotyDsOEzneqyBaAELgdPedrYCSgtGYGe9JRcji+oOvkjFFsPEOqsoep7B8dsv
         2S1xte9TSvDeVaLFQm72DqKbaknxtD6Jqewby8y7CDCRR0D8KHxW+UyQeN1YkZPKG7tb
         U66k1Hs5KBEl/9hVwNVv/sjaSKIp1DWRj1yG5D6f2VxNKLGZTjWCyFAvc0goHmJac8xw
         9FX32f77BbXwU4wffu9ygMEgZI9GUmsrUbfu0NkESoxEh8AYoxP4oPtD9g9xSRYwtz5J
         Nmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003693; x=1787608493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2r14PQPnRwiCu2pDxGMLEtZiP7xW2TLvpcZv4TNoYzM=;
        b=dWB611K7qstIUI+VdJ3jMHiAQ67GIeQj8jpvk7qIlFUQmhmoSVXZVcrY1Wv6cu7bZx
         HeyoQ4/o40nRs1NgTZtbj+/Q9BkHLF2x8Q3tWLdPxi1f8NZ48XM3Ry+NWgnDCtfPZiA4
         VPqLHrKR5TkxZaClDdymmyuFMdwSrpIaC6QnWavtg5pB8I2msijO58XUjUUCjGba4XTm
         zIAPfm57BCoZgxOo8U4tho8IGUXR/W/xJNxeoAhy9JAz7fD17EivwXkfZWXmg+ksrSem
         uuw7BJ+3uYJM5IkrK+lhBjuCJ4GQxkJ0CE+eOKoN7Q1kJOvvT05EIQ8R2qJR30uShWa8
         wqmg==
X-Gm-Message-State: AOJu0YzpPHgsGMRxkOk1VY0hPpd+vBMxu+XEXzTidezz0KibIPBv+DrS
	OVbNSXS2Y4EgZSueF0FD4adcbYGRL+YBNZUcnwVME+nhK/gV3drQEtk/+rAWwzC/aNnR31FF2pl
	G9JqQ0Q==
X-Gm-Gg: AR+sD11n9n6lKPwXbbFJFwCGe1OFJO7w63vKIVEwVehtMBPbK3QnpYGO/m5BtKIDs5Q
	1P9svXHX53EDHjNXztZBLlm1ToT2hNjdGHXSxCapUSmmmWGONwRs9AD4gB5Gx58bSCxQqE3CE44
	5MJeYbDh3uQ9o+Sc+QIs8BGFatH1q2t/WsRqbwM2Zc8zoH3Y5+Kl2qprIqjg1uZSIRil68MxQZb
	dxSCik4yZddw7cSNphAi4n6QZ8v8OxUAXZJSrw056xlrgNmsG8TqWfJTsSkTVzUmhcev16Q9XAb
	Q9v+MIU1dXpZUMg4iOCoAXY6Gq/gKSdj6TticQjZj4k7jklCFWth20OIgQnMSJjK8pCUdC2w/qR
	tYNWT2C8Wwn4f0gGDze8T6SwgL4PxYzIdx5mIRhmod2SgNDXs245cYHSwCuUMyfAeyXtYISVMtj
	kGOY1TVLv9JfqiWfsA2KTyjYIZb7y9GdcMshRBlt9OWnCI8DVTb3IdcvgSMNmn9G2b4mnLbTAtI
	J8+WIJi+VuIii3ogS2vhp1f
X-Received: by 2002:a05:6000:2413:b0:481:5a46:dbef with SMTP id ffacd0b85a97d-482a9da47cbmr4359471f8f.5.1787003693114;
        Mon, 17 Aug 2026 14:54:53 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b3f0sm6060954f8f.14.2026.08.17.14.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:54:52 -0700 (PDT)
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
Subject: [PATCH v13 RESEND 0/5] coreboot CFR firmware attributes
Date: Mon, 17 Aug 2026 22:54:46 +0100
Message-ID: <cover.1787003659.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending v13 because the previous send path corrupted several inline patch
bodies. No patch content changes.

Move the firmware attributes class helper out of platform/x86, rename the
coreboot-table firmware driver directory from google to coreboot, and add a
coreboot CFR firmware attributes driver.

Changes in v13:
- Rebase on current upstream master.
- Restore the CONFIG_GOOGLE_* to CONFIG_COREBOOT_* renames for generic
  coreboot firmware symbols, with the old names kept as transitional symbols.
  Julius clarified that the symbol names are part of the directory rename
  cleanup and should describe coreboot rather than Google. Update the matching
  Kconfig dependencies and Makefile gates to use the new symbols.
- Split the arm64 defconfig symbol update into a separate final patch, as
  requested by Krzysztof and Julius, instead of folding it into the rename.
- Move the COREBOOT FIRMWARE DRIVERS MAINTAINERS entry to its alphabetical
  position.
- Make the CFR APM_CNT runtime-apply dependency explicit with HAS_IOPORT
  instead of using an x86-only runtime branch.

Changes in v12:
- Temporarily kept the existing CONFIG_GOOGLE_* symbols and dropped the
  arm64 defconfig update after review feedback against the user-visible
  config rename. v13 supersedes this with transitional symbols and a split
  defconfig patch.
- Free invalid enum labels before returning an error from CFR enum parsing.

Changes in v11:
- Keep the scoped cleanup in the CFR driver, but use explicit goto cleanup for
  the nested sysfs group registration path.

Changes in v10:
- Rename generic firmware Kconfig symbols from CONFIG_GOOGLE_* to
  CONFIG_COREBOOT_* and keep the old names as transitional symbols, as
  suggested by Julius.
- Update arm64 defconfig and DRM coreboot framebuffer dependencies for the new
  symbols. In v13, the arm64 defconfig update is split into its own patch.
- Address the nested cleanup-path review on CFR attribute registration.

Changes in v9:
- Add the missing kstrtox.h include used by kstrtou32().
- Use a single kobject rollback path when setting registration fails.
- Split a few helper locals for readability, including the pending reboot
  device lookup and enum-value population.
- Avoid an intermediate void pointer cast while parsing numeric CFR options.
- Check the possible-values buffer length before computing each label length.

Changes in v8:
- Add a preparatory include-order cleanup before moving the firmware attributes
  class helper.
- Add direct includes for __packed and container_of(), use scoped cleanup for
  EFI names and the driver mutex, and document the efivar lock requirement on
  private helpers.
- Replace the duplicated CFR record walkers with one checked iterator that
  distinguishes malformed input from the end of a record list.
- Validate enum entries before accessing them and propagate malformed child
  records instead of treating them as absent.
- Restore the EFI variable after a failed runtime apply without retrying the
  failed firmware operation, and only emit a change event when the new EFI value
  remains stored.
- Document the possible-values size limit and why CFR entries without a usable
  runtime EFI variable are skipped.

Tested on a Star Labs Byte with firmware 26.07: runtime APM_CNT apply was
verified with power_led, and reboot-needed behavior was verified with
debug_level.

Sean Rhodes (5):
  platform/x86: Sort firmware attributes class includes
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  firmware: coreboot: Add CFR firmware attributes driver
  arm64: defconfig: Update coreboot firmware symbols

 MAINTAINERS                                   |   34 +-
 arch/arm64/configs/defconfig                  |    6 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   89 +-
 drivers/firmware/coreboot/Makefile            |   15 +
 drivers/firmware/{google => coreboot}/cbmem.c |    0
 drivers/firmware/coreboot/coreboot-cfr.c      | 1204 +++++++++++++++++
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
 31 files changed, 1348 insertions(+), 73 deletions(-)
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

