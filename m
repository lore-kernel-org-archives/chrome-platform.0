Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A349D3CCFC4
	for <chrome-platform@lists.linux.dev>; Mon, 27 Jul 2026 19:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181883; cv=none; b=RdyM8OhdMo2ouL1raXnamfTp4T2/w+w9QlT//xmjMz1B1B5ozzcXjJSYFQoo8MzM/uz5jWKdOUwVgq4unrB4SVxUQv5Y9oxKbaEMljFgG8K9rILnnl/w0ZQqd9HXp8mbW4aeFQK3DBwzK/WLUg+w6nbsQw880+GzIPp4YG7wpMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181883; c=relaxed/simple;
	bh=LHEp5xjNPXRmYTOl7iyUCGaVLVxa648GYyPPCRFkFXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IVLdHtBgZ0BEdImT6xeCLG0of0UmdVvDXwWBVAch139vZ0SzKq8pShiRGsSO701Ey4y5JQDTUldtCJlaNR0Xfl0PJAw0zW3uI1p/A43OhplRL+aUmyWkrt3m/is+Z+j5VzCWNJDaWegzj3IctIbt9qL6KRUBpPyiK8P4GeAM2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=aSWxgjzO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="aSWxgjzO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955de8797cso19396625e9.3
        for <chrome-platform@lists.linux.dev>; Mon, 27 Jul 2026 12:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1785181879; x=1785786679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5JSXCQoc1JHZ6Nq5YFbS6Dsa7OqY+l43Qmo2JkxGjUI=;
        b=aSWxgjzOx/kUvCyOj+wu7GuM6u6h1jEjAt4+zSPAK8RDcs8U4tvOOrb6pnzO4MpvxD
         w/GFpEi7Hlj2qzWSrEESh4Him2VkVB/Kqvwe6+V3j37IH0dDJYQDvQOdiQH0fda5ulNN
         IBvxoVI2I5alsrs6D0OdGeRh+xtGF/JbaPsaYHdCzJYWjc87eveNSYhLnaLjakgb5oxR
         Tkr397ztWID5CvEA3nAic/IMaZ+x/Ug1BadNeoe4tOlXLTaOLwh3weH5POg6Km7O+50R
         TbKvo802H3ou0NCHKqMKzXd1WDHPXuJVAokjOAcaNQuFn78xuF3Gh6FWTZjywd3oFfEP
         e1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785181879; x=1785786679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JSXCQoc1JHZ6Nq5YFbS6Dsa7OqY+l43Qmo2JkxGjUI=;
        b=XNzNjjv5ubNMBJNRbmOvGm+UYYU6j6CFzDnjQUKyPv1hks+iXTfEbS2vWI/FrhCU1W
         GE+UNlwS1a7l123ZhkKaNM0vyz3LCB0DU4PwWl+yANV2ILjxqbV+yGx9Bix9muQe/28b
         GlZxwnRRXgpYY00apYdnoOmNHEBqNgw5Ylgevw69CLfTMUA3f4eMPMcaplAVpClnw8Ic
         kNpx3Kz20nji22L/zHkHNwZqBpvsQItH5U1K6oiAtc/HSTtsJ3uiubRcjGrqyMEFC0Hb
         xjIzdOXeJsFUw1Mk6xS5GTtb9DmgXWnGomyHXy5HesfV4M5PQAGs0F2k76ssjE6iPg3y
         JYAA==
X-Forwarded-Encrypted: i=1; AHgh+RooqcZHUBt7+oPTjmyO4L1jTUbQ9cq8NnajK4CU/AGpmGkuiQ2bQH3rvYc1yV3eO2v+rWv4MWpq8f/bElBQXw0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8xSf7cODY/Quy2YM6R0Gvnl/Rp5k50BOoHhL+0aeG/ddtfQQv
	0WxHG8yq2usb/Di7km4ewg1G0NIlrBv7NbfbQQJRbsNQbECDJZtjZlQunT0M7dympg==
X-Gm-Gg: AR+sD10uipkOpQdSxE0nGu1uXRBSvqxq3Jgg6wQ71KGxV8OiCl/rNJJKEjmqTK42o8h
	b/MF3Q+yIUpj38aPrOkkVMlJHjWWSHeN4MaNbYanKZmcpjFIxC5wKVLxoKwuA3bobB+EseuCOr6
	AAncMZrqn+IuieS5OlRnCYsEL4fAPqjVgV4FGMaf7JahwLq9p3pMm82WGQwzfD/yEQ+y4OIHrbY
	EvGS7CfIhed6tARt6K+ogQCxfAvxgmbvHUo4b3NuTVElrujSltUvVHDJWoZKbZiTMPg48jn5G4d
	wu3xK359O/4jIpSM38Nx3tUdsBFCHFXSKeycuJuG/oT1PDF6VYXLhsGGsviU80ndgBepBlzAzMj
	brkXCdyx7OIVh8lcLzG671MqK5mXE3tafUJb/RoqpqTQ+CVrqXVAX9jT65HR95U1ay9OMBSkWYh
	hiCaUKqtSb7kft2o+PEvaWJCF2tvsY
X-Received: by 2002:a05:600c:a016:b0:495:63e6:5fb8 with SMTP id 5b1f17b1804b1-496b56fa3c4mr122769075e9.12.1785181878642;
        Mon, 27 Jul 2026 12:51:18 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bd9e980sm253362445e9.0.2026.07.27.12.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:51:17 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: tzungbi@kernel.org
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	Kees Cook <kees@kernel.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH v9 0/4] firmware: Add coreboot CFR firmware attributes driver
Date: Mon, 27 Jul 2026 20:51:10 +0100
Message-ID: <cover.1785181823.git.sean@starlabs.systems>
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

Changes in v9:
- Add the missing kstrtox.h include used by kstrtou32().
- Use a single kobject rollback path when setting registration fails.
- Split a few helper locals for readability, including the pending reboot
  device lookup and enum-value population.
- Avoid an intermediate void pointer cast while parsing numeric CFR options.
- Check the possible-values buffer length before computing each label length.

Changes in v8:
- Add a preparatory include-order cleanup before moving the firmware
  attributes class helper.
- Add direct includes for __packed and container_of(), use scoped cleanup for
  EFI names and the driver mutex, and document the efivar lock requirement on
  private helpers.
- Replace the duplicated CFR record walkers with one checked iterator that
  distinguishes malformed input from the end of a record list.
- Validate enum entries before accessing them and propagate malformed child
  records instead of treating them as absent.
- Restore the EFI variable after a failed runtime apply without retrying the
  failed firmware operation, and only emit a change event when the new EFI
  value remains stored.
- Document the possible-values size limit and why CFR entries without a usable
  runtime EFI variable are skipped.

Testing:
- x86_64 out-of-tree W=1 build of drivers/firmware/coreboot/coreboot-cfr.o.
- checkpatch --strict --git HEAD.
- v8 x86_64 and UML allmodconfig W=1 builds of the driver and helper.
- v8 runtime APM_CNT apply and reboot-needed behavior on a Star Labs Byte with
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
 drivers/platform/x86/Kconfig                  |    3 -
 drivers/platform/x86/Makefile                 |    2 -
 drivers/platform/x86/asus-armoury.c           |    2 +-
 .../x86/dell/dell-wmi-sysman/sysman.c         |    9 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    9 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    5 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    3 +-
 .../linux/firmware_attributes.h               |    6 +-
 28 files changed, 1257 insertions(+), 32 deletions(-)
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
 rename drivers/platform/x86/firmware_attributes_class.h => include/linux/firmware_attributes.h (60%)

