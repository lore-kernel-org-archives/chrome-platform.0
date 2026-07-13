Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39463A7858
	for <chrome-platform@lists.linux.dev>; Mon, 13 Jul 2026 08:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930406; cv=none; b=d76BHna7vcdbWJmr07Tn0jk0xL3XZm6BCxMy26hkMmxhlJXglsBT+DBYl8w8mESoSj4/yZ1bBD0671CS/zSeYBwK8W1yIY2t6JJVJ1vAnFHr8RuzC03Yu32SyphXEYbQB1WFRV1XOiDkGX8KtC4NP5M2vtT+YwVB37bqFjATdbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930406; c=relaxed/simple;
	bh=hRvQrqQiaT77C24qSbN9FSfU+6cDdGETb6Ihl7Xd0tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJQOp+V+BEo9ncreIM4URGWaD7FT318TOK4krc2aojugcq4uYM7bb38QvbprWI0vQ91omx6nCtdxuCG6+ELfQkIH5VSD/mmOJx5oeVRZ1/jCd/4UwAOBXVpq6qvWRS7KpaWyZRJHCZn+37XZIzUpn8+toFBUneUJ6u3pJtAPxW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=b18ofppT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="b18ofppT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso20704285e9.1
        for <chrome-platform@lists.linux.dev>; Mon, 13 Jul 2026 01:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783930401; x=1784535201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PjPIm4ums30j8g3FxgvW5VOiT2yATydhPlXxinqrvQw=;
        b=b18ofppT9Tu7bAiYOI6bFDGAyBmnqyf46utgaSPSYY4v5SIlYo3RICas3M9kRk1WRR
         y8MCbiQJFtTXdKMoHTpGxBXQNsTt6Idhz01kzi/MG5NJ2/cJB6mntVyp8eJllSGnKtTp
         C2INNA9V0fYlns+DYm1ru8ZhucZRTqKFMVDtvIB1ZPlImFRoOSzjxNux7WY6X+Cy9VOr
         8wJsHOfpAxeU4KEOym1Dc9VNYHakTKhq3lll5IIEhBHKIp7yX+NrmNLmA2TOVFgU9hJX
         Qn+e+0DpvbWnbtXCEeiIweKFRgknglzS+bi6KUM5+bqN5pOLpA+g1MUSs2fpbdLQfzmZ
         Ajvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930401; x=1784535201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PjPIm4ums30j8g3FxgvW5VOiT2yATydhPlXxinqrvQw=;
        b=IhTQny1c3JjDZpRFEXO8jpYF2soFiLxTuH4gj94+ZrHQQ7b5c6DwHjS/whsG0SkYkF
         sU43bSqTmGsXy44Zt186VZ5P2gRAtltFUZswW6QZdbYGNUxCGU0Q2ClOkwswzu49eln2
         Hkf1nlP/hbQyUjQiP7GHmiCvFiZcrLDag6JIF/gNqB5dk22eY5oWxBze2JMXZXigKMb8
         y8EtaHeiszFH//gW/2u1rs3mEY59H7/+6G9TCbZstwPmCW04628i9d1DM1l4TOSEUjW5
         A+Q/1q066qPkbw8gOnttS7nFWMVNCc/RPpv409hEhit1S8aSXn8vEMrM8+FFb+bW8o80
         CbPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlEeThjmVLwplarQA4j7A0v6Rs3GeWTgBnzeiyajwWej2UYi1RRrCTQQDt5el3dbrZVkyslVUDjMcU34ZrKOQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXjut6gyG2x8Gmx1e+nQbezrAlX2Vs/9sV9WX6Oc69Bbf6rMWP
	7JmqaW+atyXF1pzzFcnyTgMdVxBjRU8M/EtY4zcVQu79yK4ommMvo1/LM/0gCicOzA==
X-Gm-Gg: AfdE7clZdAuNxeaCmn+nSwIpMOTjFlayqA3oL2qiIyU1dL2H5rPKq6imJ0TdZhS0byV
	LKZWZ/bOuAqr6pUtG9TL5Ng8noK4fDWJ/1e8tWEkIlew09SUhwr2LxEZy/bcm65eg6GGe8vid2t
	/22IAcwl8Mo0QcSqkxj3j5F6Ki2H62dDVUJDAu2RdbWQ8CHJEsiCkMN7LB4vbFJdqkXtvzIripo
	MUxrJVM4EaRrvbwHtwu970UYzoXA0WCl3rd4mZpSuc8IZ5h5xkX6eWSMO1BuGSh6HLyMWopCRg2
	mMuy9T9Ojioeg33PuMLBm6fJnt8IDmWnAL6dN4BRCTdkosW4VGeCBKm5G/W3KevQcqMT7XsEZcI
	RU0uz7cNlPXADH2FewJUzk9ki0fA0f3AACOyVUnnda93uiu8nwQK0Ggs4I8upAKgBdw3WJ2g2JC
	TKxEkSjZBL9hKXeumODjNUuif8pEgqHAUu89q+GnI7SpEHdpwv+S62o/rhxoVgDB4mqjU=
X-Received: by 2002:a05:600c:2e15:b0:493:eb71:5cc6 with SMTP id 5b1f17b1804b1-493f88280bamr47688225e9.27.1783930400868;
        Mon, 13 Jul 2026 01:13:20 -0700 (PDT)
Received: from horizon.localdomain ([150.228.38.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73ae14sm343217885e9.11.2026.07.13.01.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:13:20 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: tzungbi@kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	prasanth.ksr@dell.com,
	jorge.lopez2@hp.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	josh@joshuagrisham.com,
	briannorris@chromium.org,
	jwerner@chromium.org,
	tzimmermann@suse.de,
	javierm@redhat.com,
	kees@kernel.org,
	u.kleine-koenig@baylibre.com,
	mst@redhat.com,
	chenhuacai@kernel.org,
	wenst@chromium.org,
	florian.fainelli@broadcom.com,
	titouan.ameline@gmail.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	chrome-platform@lists.linux.dev
Subject: [PATCH v6 0/3] firmware: Add coreboot CFR firmware attributes driver
Date: Mon, 13 Jul 2026 09:13:14 +0100
Message-ID: <20260713081317.2954586-1-sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713054526.2902319-1-sean@starlabs.systems>
References: <20260713054526.2902319-1-sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the firmware attributes class helper out of platform/x86, rename
the coreboot-table firmware driver directory from google to coreboot, and
add a coreboot CFR firmware attributes driver.

Changes in v6:
- Move firmware_attributes.h into the sorted Linux include block in each
  converted platform/x86 driver.
- Add Derek's Reviewed-by to patch 1.

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
 drivers/firmware/coreboot/coreboot-cfr.c      | 1065 +++++++++++++++++
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
 28 files changed, 1128 insertions(+), 32 deletions(-)
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
 rename drivers/platform/x86/firmware_attributes_class.h => include/linux/firmware_attributes.h (60%)

Range-diff against v5:
1:  4a82d0a07612 ! 1:  02edc6d05059 firmware: Move firmware attributes class helper
    @@ Commit message
         under platform/x86.
     
         Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
    +    Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
         Signed-off-by: Sean Rhodes <sean@starlabs.systems>
     
      ## MAINTAINERS ##
    @@ drivers/platform/x86/Makefile: obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+= hp/
      obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
     
      ## drivers/platform/x86/asus-armoury.c ##
    +@@
    + #include <linux/dmi.h>
    + #include <linux/err.h>
    + #include <linux/errno.h>
    ++#include <linux/firmware_attributes.h>
    + #include <linux/fs.h>
    + #include <linux/kernel.h>
    + #include <linux/kmod.h>
     @@
      #include <linux/sysfs.h>
      
      #include "asus-armoury.h"
     -#include "firmware_attributes_class.h"
    -+#include <linux/firmware_attributes.h>
      
      #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
      
     
      ## drivers/platform/x86/dell/dell-wmi-sysman/sysman.c ##
     @@
    + #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
    + 
    + #include <linux/align.h>
    +-#include <linux/fs.h>
    + #include <linux/dmi.h>
    +-#include <linux/module.h>
    ++#include <linux/firmware_attributes.h>
    ++#include <linux/fs.h>
    + #include <linux/kernel.h>
    ++#include <linux/module.h>
    ++#include <linux/nls.h>
    + #include <linux/string.h>
      #include <linux/sysfs.h>
      #include <linux/wmi.h>
    ++
      #include "dell-wmi-sysman.h"
     -#include "../../firmware_attributes_class.h"
    -+#include <linux/firmware_attributes.h>
      
      #define MAX_TYPES  4
    - #include <linux/nls.h>
    +-#include <linux/nls.h>
    + 
    + struct wmi_sysman_priv wmi_priv = {
    + 	.mutex = __MUTEX_INITIALIZER(wmi_priv.mutex),
     
      ## drivers/platform/x86/hp/hp-bioscfg/bioscfg.c ##
     @@
    + 
    + #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
    + 
    ++#include <linux/errno.h>
    ++#include <linux/firmware_attributes.h>
    + #include <linux/fs.h>
    +-#include <linux/module.h>
    + #include <linux/kernel.h>
    ++#include <linux/module.h>
    ++#include <linux/nls.h>
    + #include <linux/printk.h>
      #include <linux/string.h>
      #include <linux/wmi.h>
    ++
      #include "bioscfg.h"
     -#include "../../firmware_attributes_class.h"
    -+#include <linux/firmware_attributes.h>
    - #include <linux/nls.h>
    - #include <linux/errno.h>
    +-#include <linux/nls.h>
    +-#include <linux/errno.h>
      
    + MODULE_AUTHOR("Jorge Lopez <jorge.lopez2@hp.com>");
    + MODULE_DESCRIPTION("HP BIOS Configuration Driver");
     
      ## drivers/platform/x86/lenovo/think-lmi.c ##
     @@
    + 
    + #include <linux/acpi.h>
    + #include <linux/array_size.h>
    ++#include <linux/dmi.h>
    + #include <linux/errno.h>
    ++#include <linux/firmware_attributes.h>
    + #include <linux/fs.h>
    + #include <linux/mutex.h>
    + #include <linux/string_helpers.h>
      #include <linux/types.h>
    - #include <linux/dmi.h>
    +-#include <linux/dmi.h>
      #include <linux/wmi.h>
     -#include "../firmware_attributes_class.h"
    -+#include <linux/firmware_attributes.h>
    ++
      #include "think-lmi.h"
      
      static bool debug_support;
     
      ## drivers/platform/x86/lenovo/wmi-other.c ##
    +@@
    + #include <linux/container_of.h>
    + #include <linux/device.h>
    + #include <linux/export.h>
    ++#include <linux/firmware_attributes.h>
    + #include <linux/gfp_types.h>
    + #include <linux/hwmon.h>
    + #include <linux/idr.h>
     @@
      #include "wmi-capdata.h"
      #include "wmi-events.h"
      #include "wmi-helpers.h"
     -#include "../firmware_attributes_class.h"
    -+#include <linux/firmware_attributes.h>
      
      #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
      
     
      ## drivers/platform/x86/samsung-galaxybook.c ##
     @@
    + #include <linux/acpi.h>
    + #include <linux/bits.h>
    + #include <linux/err.h>
    ++#include <linux/firmware_attributes.h>
    + #include <linux/i8042.h>
    + #include <linux/init.h>
    + #include <linux/input.h>
    +@@
    + #include <linux/sysfs.h>
      #include <linux/uuid.h>
      #include <linux/workqueue.h>
    ++
      #include <acpi/battery.h>
     -#include "firmware_attributes_class.h"
    -+#include <linux/firmware_attributes.h>
      
      #define DRIVER_NAME "samsung-galaxybook"
      
2:  285b33f805dc = 2:  d5d3d1334994 firmware: Rename google firmware directory to coreboot
3:  ce91f4da5510 = 3:  7a65c6b0e631 firmware: coreboot: Add CFR firmware attributes driver
-- 
2.53.0
