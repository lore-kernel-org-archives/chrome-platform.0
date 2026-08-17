Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC743CBE6D
	for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 21:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001801; cv=pass; b=Salwx6+GmXS/evOR7s1PzQNpSAueAOe81dC7r2ufv1N8U6sCkR4GlS9YV95ci6JHqd5kJ5I3VOxoAzt8RYPViEEivFgzNOqCblZtg2FmfuHM4f2Gsf6vJ6NpbJ79BUkbb3xn452h5zpFfHOpFS25698/U+7RwE8U3zpaeb3/1f8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001801; c=relaxed/simple;
	bh=c0HChJwQcolwumJkMaqBcRzS/VRhk6rvGSTr9tmYmvo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=daxt9m3PgE3nNGvHc0sA+BEzDS1CyDPAv9vcHNpxIQXRuvJwRKpUeuV8yiZRcDyqFxIELdX1zRYLCSpF7xZEHldAJzsg2jgAtCGS5d5C3P4yrJ1TDO/bDDg4hFbewGfC1TmCLCkKx+VKcDAkJ+mTqXvMN0Z931j6HG+ALJPDFtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=h4/hccF8; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="h4/hccF8"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66c67a73eb7so536977d50.0
        for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 14:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787001795; cv=none;
        d=google.com; s=arc-20260327;
        b=iERbhURmZy8Mqg+qDOmSQ3igLPWEu0ItulnqO58rJ3OgAzuoJ2Tui+qmartW6g03Yf
         9yA8H+HqDe5mJX6F/zW52cFCy+bzeoZYoS1nihXMPbOTofl5vwUyAmvBbuOwJ6mBC39f
         J7eoyNY976TNZIqQEJIbOVi6X2tRE2+vk8yxYq8dIOTSTbUgLdtxoBlYrDk4QjwXc6Pc
         ZbCNxD30GaMvvkNN0yClbNPTpB7u/Pyud4K71ioalp41o1/FQir28h0FklsFm9WI3je1
         LJwcFM0Gz54hX7Gc7ZV83sdtf4ml8F92z+mA3ygxx0xUXnl7aKjddwfvpB7LqpXRXMFs
         MWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+5PLKuMouYLJfuABukE9BfK1nd1YWhR9ndsRk8oKsV0=;
        fh=QXk9vKEZPRp6ajGaPeXPYkBRjBwj/BlEtQF77F5bbdQ=;
        b=IB8FveObncOKAOpSO9AIRcj0qo0YbrU1nldY0KATJyrB2I6DQrS2Gw6zBDggf539Vq
         t1xGKH1QqbfTfCgCuK3v98/Upbbym04dCbhqYbTiR+KhMeE5lR70lPdUum0D7KUum5fm
         B5rUDjMWVkOrSvg1zbeRfWgPQYE/NmuU7hOp48wVt8cImvx3NX9esA1G9dR9n9moJdgr
         huHHWfSSCIkehWS0O2U8iq3y7ehc+sN6rAwQKh2hhwaPXP9FWvWdQQSG+iyonrGCaLcV
         J8/+p7ATDI4zNcak+khB5D2TXhZGWavn7A5r8I41BcU6zP9e2KD25W3abvh/hQ4TXGpF
         /QCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787001795; x=1787606595; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5PLKuMouYLJfuABukE9BfK1nd1YWhR9ndsRk8oKsV0=;
        b=h4/hccF8DDHAJ3f6ncvbNRxal730QIbNILGVKglwU6oWadCaL2XKfZWJ/W+ay4J5qx
         uTVNviaBcftXMX+bQutSSeV8RsfbJDcyvWlwxU2XLdzOOXrVoGtzuLnNwAVqIDaN2Pen
         i/4z0xw9HG+bA2FP9vcMPp/wZHgwnsmoPKiesObG0zDn8EasJ5yWq02hJM9Gkh5zAEz/
         S4ooBtLdg/KnZLz5QP8Qo+5u5neD1O2qryXfxYssECWCOMoRGt1gEU+XawPhHmU0PCZN
         hQThogSn4+3lY7AsEdZYXPDHUL9I48068XkyZ4/X5HwGCwFyxaCBpB0PYNg+lWr9Q806
         MXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787001795; x=1787606595;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+5PLKuMouYLJfuABukE9BfK1nd1YWhR9ndsRk8oKsV0=;
        b=DKmu1dGL8UYMdeQ1ULDwMOCAow2LMlAB8OvqTFdVAcPVur3qgrc1hz1by2QMhWfH8G
         zBZo9Bvonhufpxs3rP22rr2p9X31GGY2KhCGeH4zuSxcigX/aqQvbebDBO6Hoo0DwyWL
         m8IgW31jLfkxses0zJRdMElVRHqZcLQOp0T4YzRlcsQVzBYENekYcf85CzXZh2mhEMdA
         y0lerPExB86t14YYEZsJhWinHc0pNEnfHpdcgKoXuEaxYJzSFEIrjWjZPh2Dk1x1PoCC
         Y4Bvj0harFdjdQwxd1xMsTz3NCMNjDTGcfhH42kXUeDfmBuZEmA55EfGzajU+KbnQZjg
         ezbw==
X-Gm-Message-State: AOJu0Yy064AUs23nqxsDO0gCcqwj6j55PJDwrHEMsDuYCHr3x4OlA390
	nkTMYueJbWR9bNrECeYcPFhypTpVaSpjumGfJcYMviP/9r8dRM8nqPlPaJ/A0a/Jlkw297peMZY
	xyEYLTukiCLChzQWPonXDria1LVlhD8mW+JpAvz+BeFzg1lMLNUzRgA==
X-Gm-Gg: AR+sD1103foDyJE6sNm2knSTuQmoF+ePeanAmwVZf0SZ/ufExk0xd1qU4uSoOwPDGpA
	I4kHaBAnGQ7Ybj6kOD5KLtGEKMxJeALmIKY4VBD/aSMsVZyM8uJV7xBh3Cr4o2vDFxt1iMA/Jhl
	xRtv4HASa52z5Mf2EvzAsJp3oRo37oKGAkXaEl3uPUa2tTDjKbBU4nrr2x/I8nu03d6CmL9a5yJ
	0UjzmbfYPQKLbz5gds5qrL0j5AmZHZunjymoFRVJlRKEl24DLjG9AAyFvQcUpSvdzO3wejJiM2M
	qbWrnpAkkFa6BEVsajJvQUnMJo9x26kPwb72+hNIDaNpudaI0WrAK6o4ekdWu0ewiIhp6w2p
X-Received: by 2002:a53:e648:0:b0:668:8d0:20c with SMTP id 956f58d0204a3-66cbc402e78mr562185d50.20.1787001795207;
 Mon, 17 Aug 2026 14:23:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:23:14 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:23:14 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Mon, 17 Aug 2026 14:23:14 -0700
X-Gm-Features: AcwNN1UEW_I4KbJipIcXlINKvUbDivRmFcqfha0Y1blx7Hp6TaEGXKNcQwcXyPM
Message-ID: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
Subject: [PATCH v13 0/5] coreboot CFR firmware attributes
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
 rename drivers/firmware/{google => corebot}/coreboot_table.h (100%)
 rename drivers/firmware/{google => corebot}/framebuffer-coreboot.c (100%)
 rename drivers/firmware/{google => corebot}/gsmi.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
 rename drivers/firmware/{google => corebot}/vpd.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
 rename drivers/{platform/x86 => firmware}/firmware_attributes_class.c (94%)
 delete mode 100644 drivers/firmware/google/Makefile
 rename drivers/platform/x86/firmware_attributes_class.h =>
include/linux/firmware_attributes.h (60%)

-- 
2.53.0
