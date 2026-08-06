Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0901B3EDAA9
	for <chrome-platform@lists.linux.dev>; Thu,  6 Aug 2026 20:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048054; cv=pass; b=IXNgz9jsYsNr4t+uPJ49KWSpTVoBa30npimP1FaKWk/uhK7TGUYC3u7FIkw2hDJLFJJY33CEq3ECVcKmDw+YTj/IxiTh5Eh716qUn87Id5WYVR6DumZAq1S5rcdFRQQtPvwdNdmIUmIScR5+Ziw8eG8OKiXIhZbNSEDqe6AjdTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048054; c=relaxed/simple;
	bh=YYL7vtprvWwxV6sKshg1wFVFWl5XwZYgAg9IlmhQ/Tw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=O1ofd4/cy4Rsb6Na08HYrnqYMBwd2VcnfO348YcP+9bKqlaC+bzLX+VkB9u58RvvP88SfI695yjR7JqvGjZRKmNFTr1OYtY1WP9k6Zc523Ka58NhOQVABXgf4ZetoSrkfoSBS02Auno3dA4TJeo2hhba1tYO+8us8rudTXOG2rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=qIfaSQKM; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="qIfaSQKM"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66804667af2so2388485d50.0
        for <chrome-platform@lists.linux.dev>; Thu, 06 Aug 2026 13:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786048051; cv=none;
        d=google.com; s=arc-20260327;
        b=M1K03SqblWnMNKkzbFx79T7bFF9iqbPn2U78h++/9bKOR918L52xPwOsw6rrVOCLqz
         oKMAMdkZWU2nc2xATqkb6ZWFUFJTzap+q+Rde9LXvvDQ248nIv8v9Q/atJwLWuYfuXnJ
         jkYW52xTdZCkcUAdVjBO5PLVcTfB0LLAXJr6nlApWvXXCWMhbYkgJPXn02pALnz+qhGs
         vLaUyH9DXz+YEMQG0016K1X3xlWEJlVJCvU6dNRKFo0BPDPlEwqkSQzptXgRi6g9qEyi
         hyRS+kPtXeA6hCZ259M02k/1SBdC0X3+uhHNyMNNt+6Wni78HYUaUpusfvOwhjgpmq6W
         SQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mUkz9z81fXtboTnN6qDHx4c3BdpFoqvqeB7Oo3Ns4+8=;
        fh=QXk9vKEZPRp6ajGaPeXPYkBRjBwj/BlEtQF77F5bbdQ=;
        b=o7lIbOtaJED0II6KYEr0fmko7ehzyxv0dLhwZfSWBKP2RoWjK1nxcKHmI0nfOWQk9F
         O3KLRJUsOQlLKncGZAFbNs7fVz/VWIMUfRd6ySzb2ZmI7mVxOBvz1YTEAo1Fc/iew7mX
         7wZU1EfnnzKgwul6EFHmCelXhowogK3CXNYKNw+qSrMxXLDLi/G5EwMNVh66VoWiwI1j
         SC/+sKNZBCJy8Qy2IJ2/E92cRfG6ODsRDtn84sdk6mrlKF7wwcHbYp09gFR+9SB520S7
         0bMiiJnzu1g7gkqr0aGHHUzhqd9XX+Q3K82JZRkjdL4h8gNGDtvTyhcVlTsZ8HGPT4g3
         MHSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1786048051; x=1786652851; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUkz9z81fXtboTnN6qDHx4c3BdpFoqvqeB7Oo3Ns4+8=;
        b=qIfaSQKMkjNJZPT5aTW+L8/+1w/cWe/0Zc19nqhSh60/kbitbjQwa02s+VNNSiAunp
         WDC6RChuiHvtaMj6BZenTHWoQf1I+1LexY+bgfxYz8OXVLa6iuSxCKRfUaZ6OK280OiW
         14sQtOq7XRVxrwl+vvYF5QHan10ERPhRUiqOOCn6MkI8+sMWrRtuPESheomRm9WSwrjf
         r0kZirf5Zt71z7Ij3GtqFQdSkGtvslnjFQi2ome4z+//oFTaRNDv5O8MPBSURiQ0CYmx
         kmb02qd1gVJ9qlAvVZadt+MoDSCbZGwXZsBiHflfL8rN1xupe94X3+oFLpMkvX0iHcmQ
         NF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786048051; x=1786652851;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mUkz9z81fXtboTnN6qDHx4c3BdpFoqvqeB7Oo3Ns4+8=;
        b=q6Am0fXvFsdRhlmFX86yFIUT9ntP9lwGX0XgswJ8iP7BvuD2Upb3HRW3iNxBtaC4OG
         F+LFeyz2lPWkdFaPtDf+jGXwFFE/t1GJ9xMSxzCxfU7rG3mIezwgNN2JiYR71pyn3/i/
         wyxxQzPZ/GR1hB8o0sGc5GsEVnpxDnAKKWM8gvIka9+iZu9GXKroGWqr3rbxehHHldap
         8JbSpDQQcfLst+kyr8CTrK5Yq4SheYQsvcWvBTQ1zRAP0r7lF9IHRi3yChxmCKgMg+xH
         uRGtztLpA8GmRT52D96z95gdoHXHT72yrIM1ThIZrexIjYXSligZC+uydU6+2ct0AiFS
         +ZFw==
X-Gm-Message-State: AOJu0YzhleUypAbwu8urLkFc7K68UrpwDHQzOTw5TnLdovBQsnaYYt9I
	ERAliNtWkfF9nVpqO7S/Iwv+vSN0aJwkvXGyLG7hn4t5iRndXV6Gck03RCJLwYeMhmx3G/ysbTs
	CC+Nf4gfqKO99EXCrUhHZja6wys/NAq3Esic/zkVGoDedlIveK8vA6g==
X-Gm-Gg: AR+sD1159mxLkAFhGCaOO4nPVcHaIksFQ20Ze+ACvuk8EJ75zAt2yjCovoqcSDo9nuE
	hKpKFrHmrFhS/QaWkCHcsQMd0nA/7WOhuz4APTBP3KI21a5EFwyEYaZoX/Q8oUFVTemgSO6T8vx
	1oAmoJZ6z+WFnEYvl3mQE7zrFHkZyz8bpA3wEpharLVqS83bzx6LTEwmbCaiIlt95xi2WAtnr8S
	xwI0kUlRTUeDqsDefCpozdDPNy+1ng2ooMCTPa12rFywiU5YCHpZbdP6gdGfw77ZbZRRr8A1W41
	YwOeUMaepDRJOu5S5LKRKiRlysasHASnWMM1SmuzDmEatSiA0ShymuWsBwhKzix9J3fjy1kUwG3
	UvO2r0E4z
X-Received: by 2002:a53:cd49:0:b0:664:dbfc:e46d with SMTP id
 956f58d0204a3-66ac2fafb9cmr2208972d50.35.1786048050724; Thu, 06 Aug 2026
 13:27:30 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 15:27:30 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 6 Aug 2026 15:27:29 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 6 Aug 2026 15:27:29 -0500
X-Gm-Features: AUfX_mzAUIcTps50AuX9XV0cmoM9F8eoNkrO6qV8e69hoMZI6prHfv4r-rievDE
Message-ID: <CABtds-2VsrCtqniHX=znRP-bzpWFTCYDK_Bb3xUgjyVj8Z80Nw@mail.gmail.com>
Subject: [PATCH v12 0/4] coreboot CFR firmware attributes
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

Changes in v12:
- Drop the v10 CONFIG_GOOGLE_* to CONFIG_COREBOOT_* renames after review
  feedback that the user-visible config churn is not justified.
- Drop the arm64 defconfig update and DRM coreboot framebuffer dependency
  update that only followed from the CONFIG symbol rename.
- Keep the directory rename, but preserve the existing CONFIG_GOOGLE_* symbols.
  CONFIG_COREBOOT_CFR remains the new symbol for the new CFR driver.
- Free invalid enum labels before returning an error from CFR enum parsing.

Changes in v11:
- Keep the scoped cleanup in the CFR driver, but use explicit goto cleanup for
  the nested sysfs group registration path.

Changes in v10:
- Renamed generic firmware Kconfig symbols from CONFIG_GOOGLE_* to
  CONFIG_COREBOOT_* and kept the old names as transitional symbols, as
  suggested by Julius. This was dropped again in v12.
- Updated arm64 defconfig and DRM coreboot framebuffer dependencies for the new
  symbols. These updates were dropped again in v12.
- Addressed the nested cleanup-path review on CFR attribute registration.

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
 drivers/firmware/coreboot/coreboot-cfr.c      | 1208 +++++++++++++++++
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
 28 files changed, 1272 insertions(+), 32 deletions(-)
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
