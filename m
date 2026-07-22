Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89BD41DE0E
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 20:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750657; cv=pass; b=nvaHFCziAkxGXbIIejG/cxMWuKQhwBnmuJilc5AyIG9QZDTJURxRSZycWTDWeKVQ0H2lUkiQZA1Oia65tMA1+xYE+MzYzJ9cMl/zfxqXJako4nzd+MiBCtJ+j5mss+0Oc5mhfJraVzAf6pDbK3GRz8l9kG1ssmWz2NO/zmrpsMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750657; c=relaxed/simple;
	bh=VUoh6Zej1p/NgfTCKZAF7lVFg7MFBi7bdeaONLT2MU0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SLOkeV+yA45orUbem1ESuSCjMLhZ1d5iY+CIbEahspjgqnkFfPcqvwfDavvNGrId1IJYrPBDxVGKi00t3TxE/A21GsY/hI5nCJjVy3IELpkFXJLyqqDYeGVzBKTLrc6kPtQioI7i3zzcEPmb+bH5teB7mT6ZH9zmp9IrFiIL6r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=A2OwiH9/; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="A2OwiH9/"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-667923d86a7so7009696d50.0
        for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 13:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784750652; cv=none;
        d=google.com; s=arc-20260327;
        b=h8FlCwhIn/TB1OX9GE1F4LwW67rPdTx7whfGuhGR2uppzXSwdol+FAuFTY064pu8ce
         RhfJkoIYX0oSaMEPFRuxD+hl76TM2s4AZzYkYYL/dsd7Pns10VlzkGekiL0MyuzlyqKJ
         5YGibDvgfor6NWWhxcejGZElZ59AJhl9cZQJ3PEIvcnP1iXpQt973loc+V4CZJl+aRiQ
         FG2vsFrAvl68uLTLJL0HWkyzWji2pwuN4yKiYuygjwk+M9Xj7XCIhpTzK6k+voDKyQKa
         4r6oohMBT8qycVnWUg8JwVCxa04RakQm9EbSykbrCHh/1UGpUeNVJ5xcrk7+4aZBakWO
         ixww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=K3rg68Z7dZugwFf430EjqcxzoIsDG5+smUFg2Tob6vI=;
        fh=9nglM7YSHpYoZm24eHd9p9djpl7ieAz01KN/AEESjhQ=;
        b=kSYC6T+NgrxiV0w6XZw+pO1OFBlsbZgsQy2Jzw5+J4GLEhFroQIp4A79mPiC4nrvJt
         NMJ+U56IsWStYAyRSNv81UPYA1DrkV8GXJA0ALB5JqLMjmqnGT+YYir5wZAxRaMguMpS
         Ho96B35oVpiJcEG631xhFjj1AOsUauPqcyAqHMRjBsfg1DBzyACwK4a8tUq8yD00t8f0
         ldTvCs78MiKHiDacXYCIkf6FBh1ts7PMGa5qCXkVNVyQsUk0W8xRaxTMA+xwW2QE1hFW
         xuzLilXpF+Acdam2lziI2yKRpieKe2PA1wo4R+gtMWiTCP8z6oiXkmSbqD0Y0sk3zBkr
         zxag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1784750652; x=1785355452; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3rg68Z7dZugwFf430EjqcxzoIsDG5+smUFg2Tob6vI=;
        b=A2OwiH9/Gihsg16Msv7gCXX/T5PUItsvNrByaDOqj0oY2HUCWoHASv6f6FBidE71VR
         3bkq2Im6L72kl4C1wCY20AijJTJiZxiQwnKwQ7gUMHT6cRp04kleme08JuB+4PN2rxTt
         4TG525LB60xcYQwh5TQwG1Eh2HWxYMvJQef9OganhWxEnR+em9HaTBM6zivKbycEtwzE
         NYzJO4nj1ZbSc7QlhuMraLfZNA/6LAp6k252gbFRraqb5hXWzKyGMKzmiYHE5CHxMehH
         /DvPKvIO5O6WBlARDhAY63p9YjH9rVvo6v7FZqaZEwmKAVMT9XdVDSWCc+S1qEhnGGoC
         mh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750652; x=1785355452;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K3rg68Z7dZugwFf430EjqcxzoIsDG5+smUFg2Tob6vI=;
        b=Gr6c5mxtIw3FkUH1Ek+sK+iWC9Mxv3NjoPlCAAmxJZ1YFEQDaVnH3Q27g4xoAcmTYT
         GuEjRCAfRkuVOHgmvTxUySrjb5bJzzXsFsCQFIXD7DPglJyASUxqmU4b+Cj6xwEdT8QM
         kMhg0AFLFrAMtfOqj/sE5tK53nEiWBkyRg442dH2iN/IP4NcOwbqulH96+aBcvQ9BgQe
         JhuspIIU+epX+18rdHQzdUJM7sbY5bMfTzmPf8OSShsiaUDxbEa2rnIUP/7rTcBaHYsq
         /ccYlUuBB3wxiLBXF1koQvvIg9EgyaSk7d4LtNOcs6U1dpIeknehyO/FckJud+OzoMWC
         37Pg==
X-Forwarded-Encrypted: i=1; AHgh+RpxG0gt/2yKAFnSgq0ZYRq7Ut5AZy9PTaxjFze7dKdk1vZ+EteCwqkFPGHAFyDHDz0M+q3Sqj/Z19izuSxa3Xw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzftKHqdfryFd9QV0/7qFooBpf27cwFsqY8hZ5YQ8eiDVpysBox
	Wulch40l5LuhUluoccuMtV8Ut9zA5G0+DGB0DxBTZkMB96RizFvq+DTVtaTlUsqWY8sB3WGhI/q
	j4ydxgE3C3yZixcSrAsnufHocqVAh0bb71IvTCy0S
X-Gm-Gg: AR+sD10OKrq7qKj1BuTa+ifZ8HHHAhP9VVWXrlttxcMG5J3Rjl63iZA3qPG4nmIu/qB
	Xux4DHDQ4Y22iBzJoVAm0KySS5KwEaJUbZnbY2JD0qGB2ZcseHwgQqclKDNlBWOOdbPk5ShteHq
	ApMc1u4972rXnDoAMj6mclcFKLxT8SPk9a6/fBryioPbDqJi6nT7vTgpKLaFMSFfDdzdbhrzJdb
	uUjWDXdPTtUHE1GWRRtfZ0WGIOECTtzPv21G7qhatS/WYSbTqzhB/bcKlU5679jMqvVXjmK+/7A
	hD4gcU5+B9nMDow=
X-Received: by 2002:a05:690e:2510:10b0:667:f213:bbc3 with SMTP id
 956f58d0204a3-6688e8b4edbmr1297593d50.36.1784750652448; Wed, 22 Jul 2026
 13:04:12 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 13:04:12 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 13:04:11 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 22 Jul 2026 13:04:11 -0700
X-Gm-Features: AUfX_mxa4hqNsQNkqzfOIleXD9b6qvQy1FeR-OxSlkdigDwk68DoxXnuujytnxI
Message-ID: <CABtds-0wxc+f2H5YNHx16GA=23YqNwwyt=fpJ89T07JdN6WT+A@mail.gmail.com>
Subject: [PATCH v8 0/4] firmware: Add coreboot CFR firmware attributes driver
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

Move the firmware attributes class helper out of platform/x86, rename
the coreboot-table firmware driver directory from google to coreboot, and
add a coreboot CFR firmware attributes driver.

Changes in v8:
- Add a preparatory include-order cleanup before moving the firmware
  attributes class helper.
- Add direct includes for __packed and container_of(), use scoped cleanup
  for EFI names and the driver mutex, and document the efivar lock
  requirement on private helpers.
- Replace the duplicated CFR record walkers with one checked iterator that
  distinguishes malformed input from the end of a record list.
- Validate enum entries before accessing them and propagate malformed child
  records instead of treating them as absent.
- Restore the EFI variable after a failed runtime apply without retrying
  the failed firmware operation, and only emit a change event when the new
  EFI value remains stored.
- Document the possible-values size limit and why CFR entries without a
  usable runtime EFI variable are skipped.

Changes in v7:
- Restore the existing include order in converted platform/x86 drivers
  and add Oliver's Tested-by to the helper move.
- Use for loops for CFR record walks, document pointer-based value
  validation and intentionally ignored record types, and remove a
  redundant PAGE_SIZE check.
- Validate the CFR payload checksum before parsing it.
- Make EFI writes transactional, lock EFI reads, and expose settings
  read-only when EFI writes are unavailable.
- Skip settings beneath suppressed or dependency-gated forms, propagate
  enclosing read-only or inactive state, and bound CFR form nesting.
- Propagate transient probe failures, preserve APM token zero, and reject
  enumeration values that cannot fit in the sysfs output buffer.

Testing:
- x86_64 defconfig W=1 build of coreboot-cfr.o on upstream master.
- v7 x86_64 and UML allmodconfig W=1 builds of the driver and helper.
- Runtime APM_CNT apply and reboot-needed behavior on a Star Labs Byte with
  firmware 26.07 and Linux 6.17.

Sean Rhodes (4):
  platform/x86: Sort firmware attributes class includes
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  firmware: coreboot: Add CFR firmware attributes driver

 MAINTAINERS                                   |   18 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   20 +-
 .../firmware/{google => coreboot}/Makefile    |    1 +
 drivers/firmware/{google => coreboot}/cbmem.c |    0
 drivers/firmware/coreboot/coreboot-cfr.c      | 1185 +++++++++++++++++
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
 drivers/platform/x86/Kconfig                  |    3 -
 drivers/platform/x86/Makefile                 |    2 -
 drivers/platform/x86/asus-armoury.c           |    2 +-
 .../x86/dell/dell-wmi-sysman/sysman.c         |    9 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    9 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    5 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    3 +-
 .../linux/firmware_attributes.h               |    6 +-
 28 files changed, 1249 insertions(+), 32 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (82%)
 rename drivers/firmware/{google => coreboot}/Makefile (92%)
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
 rename drivers/platform/x86/firmware_attributes_class.h =>
include/linux/firmware_attributes.h (60%)

-- 
2.53.0
