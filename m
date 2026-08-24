Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08A8400E0D
	for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 15:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584153; cv=none; b=ItFGUSPhepaMWOwheLPP8s2v6AanhZXEw+taqzOPi8/SJmwIu3odjURr7ijcxsmZiK6ZSpvhnswP+inxVvK9EQf0c7mbFEJZ4R24S+GkSlxj2YHAdMRDCWjKCvycWhhx3r5aWZ+MtVXtV3NVC6dDp2mIcyQ0E10Gac+BtpRBfAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584153; c=relaxed/simple;
	bh=JQyRpI8j7w1b1klCJajkWAEryhwrrdGvQg42aPShEIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MibJ6urtQqYhKhk+LU5q5BsM9e55oAUwFG2iXy881+HcxWw9XKvgB7h5mw1YC+/RMQbyPl2fwvaTTStQBv5Qtzkmg5BGcOzqNjHZcTtD2LxuGg9VJMIJEIlg1/RRt9gKxMUBEKuv7ZmohKNjERJRKFZyUfcMv3nk1qZNDrTCD8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=yZz972Vp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="yZz972Vp"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so24539125e9.2
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787584148; x=1788188948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2r14PQPnRwiCu2pDxGMLEtZiP7xW2TLvpcZv4TNoYzM=;
        b=yZz972Vp4/K9+C7dgnKSVpRio0Ozt8QoBNXiXvsEVmEHizcbHZ+r9pPwgUXQcBMO4T
         MSOZVFq3d33THf2YhHG8+hmjUoLfndTmqq3qRgDcAK5bbXbCh1mUsRDhJkGGhRk0Izqp
         8EEZcewgf+oO7wCeaxKnCadBiMsiYjwSpxBNsInNHm8Ldegde3xKBPLRNcKpdpZC9KcJ
         uZoadNyTCuznsxAuhbCiVR9vGYAokRaL7ImZeUTuydOKrKyFfurTDPQfmyam4w+je/e+
         vypKC8sZfzBMnOJCwsLARZr0guQKjSgYWL1irL8j4RAcI3PoE6kdFei/EMQg85pdjRE7
         q0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584148; x=1788188948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2r14PQPnRwiCu2pDxGMLEtZiP7xW2TLvpcZv4TNoYzM=;
        b=S43Ti4DW+bbZ9krsTDNUmPx9NAlwUqB4fMBCSIelwtRPgzsYU4rU4QWsXFVsxq5QC+
         XQMNDoajw61kCVCP1QZVhuCCbJhIQ0npmSfcdSF2VeAqnFIlNCt2gAx4lRPVBtGoO5Mk
         cf6PH6J7im984StVMUM2mRqND2L751uu43eibhZKvk3KjM3Dz/RpC/Ia8xCtDpeGnNVv
         ftOvRwzCOH2i/aPTAr1nib/1F4HZi79y2f4IMu+PDzfzwonvSpdvTzCpYFUAf40hxKff
         9Z6sI05w1Cs+GNRZHoSW8F46CGqimJalx4a7sxwO00EPpbtsSjxozBXj05zXah+/n1hG
         fVNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQqnh0wA4IQrKii79s0K/qFynal0BAuQTNzeFD4jVIRmZm1EcP0AFxb0DEOu5s3tfuHzlFwR1Nrjam6vFKo0o=@lists.linux.dev
X-Gm-Message-State: AFuF++nDKR5aLEiHi4yGBVNMDwCKmYT4Vp5qszPoVqTLAh4RFK8aoIC/
	RAOTFkPl3zhwOBXvo8kFglXwEGX8SNvx61es+fKLgilvjCu8XgQUhoPzCuNmV7OCFw==
X-Gm-Gg: AR+sD11Wc3AgX9Vnj7dkoMLJAa2IyUthJo7Z9/1BwN5WgSBuA+bWXfnmubSnx6dBbVF
	ZboX27HfIXfVqs5IF1Yr6u//piNKW/9ohHcMu7kD4MvF6mFR7xzkzR8AZqdwEfIehQrMQp9CkZq
	XDCR0BQCu1k0wMU2Xes2ppcPhzneIqUFBqQTAiq8YQbUCE/ibgPbhCcqXzxGeee1FAFyfVZhdjG
	2t8VLKSqvpP4LQeA1Q2BzMamyyFWTbyONf/H6UxyU5Luaf4BsPyWX572kpbMAdgRsd2u1ubVq1w
	jRD47TkFJ9HazMLhk0fZP2S1gjf+AQFd9nEg6ka4X0/X2jqVgqqjlOQwhM7XQ8vcQ5s7eJYsE2y
	kMrSlJSEk3oBlLhHKawK6JBLfOPKHZvSagZzO9Yo/g0HI/QaL7zpSB/d16lkQtSH2xAwt6dPy2Q
	KyY3ZDCQ/8ksCfhgVy8lA5HEdZ+sfN2AHGKa9bdZzT3oU4MihaBVB/HVYBjFFmz9rmkCDPD1MDU
	iXxvgtiOzdHTZOqI3Tr3N7Rdpjt4X8=
X-Received: by 2002:a05:600c:4f09:b0:496:bffb:fb7b with SMTP id 5b1f17b1804b1-499b8457b10mr339689055e9.10.1787584147711;
        Mon, 24 Aug 2026 08:09:07 -0700 (PDT)
Received: from horizon.localdomain ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c8f382b1sm63920035e9.8.2026.08.24.08.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:09:07 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
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
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Kees Cook <kees@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	chrome-platform@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>
Subject: [PATCH v13 RESEND 0/5] coreboot CFR firmware attributes
Date: Mon, 24 Aug 2026 16:08:57 +0100
Message-ID: <cover.1787584107.git.sean@starlabs.systems>
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

