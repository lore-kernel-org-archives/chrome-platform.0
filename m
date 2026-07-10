Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180FB42EEC9
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701572; cv=pass; b=RVedzjztzgaSxZ7sDWd2+rHnOebMCBaeYSPmhmejsHiZMXX2N/jbF5BdMm86UoD8yQyDVe/TRZGP/jNJLCIMAFNqjPk5Tul3XhZV6vB5aarbahWs3GcyZgZ7exJuqYjO+vRvAglvZx+kNtWmfP97ZplJDEukKkK1LtFPrRHZCEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701572; c=relaxed/simple;
	bh=87hn7ATmRPc8ZcikRSW9cm57wsYMirr6i9sKKcfrpTk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qlUw310nrG19KHulwP3RTVccrk4j03JcHCNzYCpcsTlGFlaZUM5k8yJpH6D2XWF2dC1dJEIoC5Rd/tKNUyYMBjhugo5D1UlNJQE3W6w0zX0kpqp0U28X9KfK4EZcJgeIn9BdVYATU0Ins1gBVc5CY1hvcMNItbJ8TlI7k7Ynw3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=L+GfL+Pq; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="L+GfL+Pq"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81e8653aec4so5315567b3.3
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jul 2026 09:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783701568; cv=none;
        d=google.com; s=arc-20260327;
        b=kEdVKqQOwmqk/ut1fGA3jXU4T7dnXsyWg8ZczOfIEDU0PLX3K0VZn6JZbpRLjINOmx
         u2ANMMrYPSwmKqbmAQ/RINUaC2/ku6IieKvQdA0oSda+eS+MUhTyqz52axvuKrYxzSBC
         RvJM/Hskalr2Z/xKmdeYWpFkQpmNfCyJIksI48Fuh0bn6CeFpowMuSxqhR0h+60PqLz9
         3uDjPfrslL1eHwAruJ6FodBoYPSFrGkdVlW6Y11qOWqv50KI7RXZ5Gm17KO/MYWBh3fj
         wD7h4y/GEA308WrcczWVP1ZS4fPw99QAV0oLE11lNcjGImp3B6R10bSxmJCfe1wVk4j/
         6eCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=v504c+zhTg8lC67Dqba4ENAf7i07B7kuAHGn3h98w8g=;
        fh=m5of4wpRrDLD411v1EW67lYz82mnuUB+QNK9tUwZvJg=;
        b=V6cTzSsD+e6MDYpVNknLNbu7OMnlE7eqQ9NJd+cD28PDbVtAsFlqjyyu/FXrzJqH0D
         FnGQeZDSf6uFJbQcT9iWvPl5xAr3i5+xTZyupZNzt09srpY1aQNS5oFPmTgqFYtCSwJM
         XkjYRnl9o4FozkOmHwI8l1SNUXg1N4B/0CKn8kjANCssN2oyY1ZgFm9hrVXtdQjOUpBZ
         UA7kucdGO/Z2wZhcc8AV03IgPsUMjjp7GaBlT1QLkWuUHEYr6lxzEgPSYBqDHmyH4u3J
         UeH+PEUCFwNGyciDOHOgyWZkv9lkKjsIprOV9xIl1BNMT3fUJkRi2jexAVmHJBZIApYV
         QD4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783701568; x=1784306368; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v504c+zhTg8lC67Dqba4ENAf7i07B7kuAHGn3h98w8g=;
        b=L+GfL+PqjnVWytE9waD1zRP1pZSiqU93QIeYldYLeY01xqo5bTPuad3Su5nYfqtnwd
         KLQ2rXIDJBTmy77oVks3Z4AXguEu92ycDGUzQpxAR30nYs4Zr9b5X0601d2aWuILt7qB
         BHqu7WMlA31vTq5FXDHN3YTc9NX0BMgBeSEaxz1dyxAxLIZZxuvnq0z7XDAb5ZlrlIvx
         NTjsFeSbBTQNm1vEj5pQKZkmRUGM16W2lO5BMnhY7DWBMd1Cu5BKwT88TGnvMfMcBrId
         aC7sMm64HgouAruAbxCxgXaODoWBUEELCQ/JQnJLhq6rA7NmtrYU+JBHdRpFi/tS2LHN
         5fJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701568; x=1784306368;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v504c+zhTg8lC67Dqba4ENAf7i07B7kuAHGn3h98w8g=;
        b=MDIHzQ+szvubWzjVD2ogElCeRP+c7C7m/gP5E9ermQTH++OHoyIGfuJajaM9YcAtXL
         JRRbJF/eU180nIR8zda53eA2rV39gqpTK6Dwv+RW392xfKrwOBS9ZYzyanK+zY3ZSX9X
         wSRd0a9ODNKJKM9MNij/fjSUxeEC7NJEipJjHkztYtCQs8zXLTTwjPlU+9sXJkWejuxm
         ewLYkLbq//5iWz3WX+Pg9npIKIPSDF7YFp6SBeoGJf1vTQ/1sDvdRROMt+Wfs0rgijs7
         h71QNB1KLl8h8L93UauP1LD5MbEMv67q8uUl8pXvVlh46klA2UEtsO9hJnaaX/8mopSM
         9BhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYs9R5i/2vHNbn5wLdmJIdjsKfKAhtxrwFl5yNmfjMt63jEDPqMxdDa5INT5tM//wjkoyg4eXxjJAoUJWSdps=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/dzioN3wNHkc4ZD5dBbep7MxIvSdg4Zc9/9JUN0VNlAPLei0A
	5Y85U7cJW5NwHZrN+VIuuZoVX7A42izSr1Fz80U0IFJqTXq6vRWMFH/H3qaGG65NBRJXDbYYuB6
	bIZ6QxfiqaKvIcLZXzGfa97haZAs0s/NOPtjwYZLp
X-Gm-Gg: AfdE7ckHXmIsCA6n5TcEv84MB4nO/OsXQRSZ0eFUeOXirSLKUPa12ZvlnmKBUSWKz/J
	QsrnBqziIdfxtirzIBEXWV4dHXMNxf1gqMGSWxN2FhhfpLx1eiqYIj5jlam2DJRmKiRe1dgtcxm
	xzyxXWEQaiFsmUBTXBsAHJPbSdR1akOKE9oLuW01eyrqKB6j6c9Qk8Kg7S+25AlwH7qj7JOOUVD
	5tL0HXr0veWPllSEQKFMK2Tx6R6+xsvNDxW/NnqqfnI76IkCCurS/64uTwMq6HAcOf7jys1x9Lk
	BF18sKxNHweeFJBwWccihcDmy4s=
X-Received: by 2002:a05:690c:10d:b0:81d:5155:2149 with SMTP id
 00721157ae682-81dbe3425b3mr103094997b3.4.1783701567857; Fri, 10 Jul 2026
 09:39:27 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 09:39:27 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 09:39:27 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Fri, 10 Jul 2026 09:39:27 -0700
X-Gm-Features: AUfX_mwnVWaovJPEdIHNALTOpL0W_mwzBe_RV4qg2fKY66qa1CHSukJMaQ8tcJc
Message-ID: <CABtds-0uN8WW2SkDzwYf8cbQGZnx=Y8Nocs-ebMYB0KWOiX_Kw@mail.gmail.com>
Subject: [PATCH v4 0/3] firmware: Add coreboot CFR firmware attributes driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Move the firmware attributes class helper out of platform/x86, rename
the coreboot-table firmware driver directory from google to coreboot, and
add a coreboot CFR firmware attributes driver.

Changes in v4:
- Rebase onto current upstream/master.
- Add Mark's Reviewed-by to patch 1.
- Include <linux/device-id/coreboot.h> instead of
  <linux/mod_devicetable.h> in the CFR driver.

Sean Rhodes (3):
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  firmware: coreboot: Add CFR firmware attributes driver

 MAINTAINERS                                   |   18 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   19 +-
 .../firmware/{google => coreboot}/Makefile    |    1 +
 drivers/firmware/{google => coreboot}/cbmem.c |    0
 drivers/firmware/coreboot/coreboot-cfr.c      | 1068 +++++++++++++++++
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
 .../x86/dell/dell-wmi-sysman/sysman.c         |    2 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    2 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    2 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    2 +-
 .../linux/firmware_attributes.h               |    6 +-
 28 files changed, 1120 insertions(+), 25 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (83%)
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

Range-diff against v3:
1:  0d105cd2eb39 ! 1:  4a82d0a07612 firmware: Move firmware attributes
class helper
    @@ Commit message
         firmware drivers use the standard firmware-attributes ABI
without living
         under platform/x86.

    +    Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
         Signed-off-by: Sean Rhodes <sean@starlabs.systems>

      ## MAINTAINERS ##
2:  4cc4e0c4b69a = 2:  285b33f805dc firmware: Rename google firmware
directory to coreboot
3:  b12a36d80e48 ! 3:  5edcdb4635c2 firmware: coreboot: Add CFR
firmware attributes driver
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +#include <linux/kobject.h>
     +#include <linux/limits.h>
     +#include <linux/list.h>
    -+#include <linux/mod_devicetable.h>
    ++#include <linux/device-id/coreboot.h>
     +#include <linux/module.h>
     +#include <linux/mutex.h>
     +#include <linux/slab.h>
-- 
2.53.0
