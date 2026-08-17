Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2663AEB2C
	for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 21:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003699; cv=none; b=dvMnkpGMD0qbFtAY3SinfkKpkp7+z3SHOFy/0tu2Qg966iHjRzhS0uGhOdHtb9HMHaV8teqs9BrJu30Jm4/wVBeVdfAX3wEwGvDaTky6Jhyv/z8XOjW11RuSShkuc96Y/PhkuAbQ1CVEUu/ueouK6x7G6BQidb4TGSNeohVBrI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003699; c=relaxed/simple;
	bh=5F+9d6zSwaI23ajpCCP4JCHQTIKUiBdtuz68jRALsbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpmhjF+eM6Ncbydbh+LOtkiglxadirYgTQWWvWWkaO/dfdTFCfur3dYvXgKjkSwopnzZaq0qn4PyoNkXa4/dQIurmdG2Eyq5k1X87Mp1dspCV8rAv9jx0NRsQW6Ngo2EEHrLt59Tff9Dbgt92aFsRYv+tSyUrImgbhu007BSdco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=cIQ4ma2c; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="cIQ4ma2c"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de008b020so210009f8f.1
        for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 14:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787003694; x=1787608494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyYlZFVCc06FCgom6L11YucB1au+iuvrVnF7FufZeZ4=;
        b=cIQ4ma2cnWvVXnBwEoIpLtt0bV6l1T/oVu0XutnRxTYGA9IqTscZ8tAGbkp01hltdf
         u5SNwzS7vaHdFYXfLFKi2Tdon7KOJMpDKExaxxlVtB/UCSFkTuZ5GfNYszViBcE2IOTE
         HCOl66sH8/P39I+9DBUitDzObvWwUfKdydN3W+IeApHUKBl2KzYEjFEi7joTzIoKvXkD
         YjTKiFrn5Y3fpX0BX92Vd+Lgev9G/+wNdTFxtCBlqSMjoWcQgBnOevL7U8YoWzISH7wp
         d92awaXtKWRuP2/f1vEcGseD+khNUXqrclAYaC2956pjZ5pf9ZyA8AtZ8EVR7r04qcO0
         aX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003694; x=1787608494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyYlZFVCc06FCgom6L11YucB1au+iuvrVnF7FufZeZ4=;
        b=pBLdOsE5uSKpH1L2QRWWNS+yEne3P+MQoaYj0dWzsk3YgwqdoGzOjBX//YJPE0QuLp
         piGkxEISV+yf9TdoMv6im4wVqe79cRAdjSrwi7bQLMuXhLA762eqS77+rzOYv61oOefW
         g7wHxuEbCBkEtSJm0UKLfRVLjbsvQPdYFmTCCMzDrYXRk8lIPFbEPPxNe5k2u19XKC2d
         roZFWkXZohMtAWfSs2G8tLj06FAhxLIsLbEXycT25iF9U5KvZCvZ9f2u2KBhi51lhDgg
         RZyAON7DT7WSlnvK+Qz+GMba6LcPaWb8V1P/dpkkhFwlUhX0bHdt0+2MWvntpWOKVyGI
         Hc2g==
X-Gm-Message-State: AOJu0Ywj4yxXtNNHlDIX7elnjDagvLCwnqwFAMAvMtVVqKqRoX4P7ilj
	daTTgRL3KHf0Up997YL5CZ80FCdr4zqji/4Tce1GCLsaxAt+uOLsAeg0ybB8kmvGVjJC8/Hghxy
	izzdZMw==
X-Gm-Gg: AR+sD12Mz+StA02DDggo9sl6OmMb/OsOWtwi2UPsQOBQT8CcIr8V5zGXsq+PvXNuwD1
	kJv8NexUKNyEY0UTYGsvBTNiPDYqri+DaL6ybuAeadeHhok4zWnkaGL90VbApZGf63WpDBYss8I
	6QwOn8uUjQyhXF9lQ3vOprzoedV+sGDp2grqeUjw6xwEzXC4039G48i0m1In0GZGxMkrqsWTYPz
	UftR5Dz5kNvkdXSiZqfMVutB9zdi5Fd55WWNFc/+RJbp4EO/WRnaR+DpotRbkMC0O5i2CUVdFzv
	W5VE76GJmg2ZzjpC0Qsl8WbiMNCUhGGjm8XOFHbJRjA5xS9MNQsSXDqxZhipZY7QmKWnTTv/Yn+
	20LoS9rbAAwR044svytTPG00gGHyZHJVQxOO+Zh0lxPutgVJterleM+XCDFmpptft+2wg9oh3Kd
	9j+cYjaOkib5GV673sMdtPBAv9Y6iucSt30rfCbMCjx6tV7OBS0oO7EB533dmNi2DBn5GIVojCK
	msIoQs2NZYHSw==
X-Received: by 2002:a05:6000:4028:b0:47f:fcff:6b05 with SMTP id ffacd0b85a97d-482aab887d9mr1314805f8f.13.1787003694601;
        Mon, 17 Aug 2026 14:54:54 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b3f0sm6060954f8f.14.2026.08.17.14.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:54:53 -0700 (PDT)
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
Subject: [PATCH v13 RESEND 1/5] platform/x86: Sort firmware attributes class includes
Date: Mon, 17 Aug 2026 22:54:47 +0100
Message-ID: <b967ec0f8adb69417a3d81ee5546e4a238e29e11.1787003659.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787003659.git.sean@starlabs.systems>
References: <cover.1787003659.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move firmware_attributes_class.h into the main include block and sort the
affected includes. This lets the header move replace each include in place.

Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/platform/x86/asus-armoury.c                | 2 +-
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 9 +++++----
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       | 9 +++++----
 drivers/platform/x86/lenovo/think-lmi.c            | 5 +++--
 drivers/platform/x86/lenovo/wmi-other.c            | 2 +-
 drivers/platform/x86/samsung-galaxybook.c          | 3 ++-
 6 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 495dc1e31d40..f3d8c5a85762 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -20,6 +20,7 @@
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include "firmware_attributes_class.h"
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/kmod.h>
@@ -34,7 +35,6 @@
 #include <linux/sysfs.h>
 
 #include "asus-armoury.h"
-#include "firmware_attributes_class.h"
 
 #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
 
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index ab46a023cc34..4ff9003c6589 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -8,18 +8,19 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/align.h>
-#include <linux/fs.h>
 #include <linux/dmi.h>
-#include <linux/module.h>
+#include "../../firmware_attributes_class.h"
+#include <linux/fs.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/nls.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/wmi.h>
+
 #include "dell-wmi-sysman.h"
-#include "../../firmware_attributes_class.h"
 
 #define MAX_TYPES  4
-#include <linux/nls.h>
 
 struct wmi_sysman_priv wmi_priv = {
 	.mutex = __MUTEX_INITIALIZER(wmi_priv.mutex),
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 27fd6cd21529..1965a329be48 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -7,16 +7,17 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/errno.h>
+#include "../../firmware_attributes_class.h"
 #include <linux/fs.h>
-#include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/nls.h>
 #include <linux/printk.h>
 #include <linux/string.h>
 #include <linux/wmi.h>
+
 #include "bioscfg.h"
-#include "../../firmware_attributes_class.h"
-#include <linux/nls.h>
-#include <linux/errno.h>
 
 MODULE_AUTHOR("Jorge Lopez <jorge.lopez2@hp.com>");
 MODULE_DESCRIPTION("HP BIOS Configuration Driver");
diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index e215e86e3db7..9e4b3e973de9 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -13,14 +13,15 @@
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
+#include <linux/dmi.h>
 #include <linux/errno.h>
+#include "../firmware_attributes_class.h"
 #include <linux/fs.h>
 #include <linux/mutex.h>
 #include <linux/string_helpers.h>
 #include <linux/types.h>
-#include <linux/dmi.h>
 #include <linux/wmi.h>
-#include "../firmware_attributes_class.h"
+
 #include "think-lmi.h"
 
 static bool debug_support;
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index fbb32bf404f2..fdebaa0a9992 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -33,6 +33,7 @@
 #include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/export.h>
+#include "../firmware_attributes_class.h"
 #include <linux/gfp_types.h>
 #include <linux/hwmon.h>
 #include <linux/idr.h>
@@ -50,7 +51,6 @@
 #include "wmi-capdata.h"
 #include "wmi-events.h"
 #include "wmi-helpers.h"
-#include "../firmware_attributes_class.h"
 
 #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
 
diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 6382af0b106c..74103c00b0c8 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -14,6 +14,7 @@
 #include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/err.h>
+#include "firmware_attributes_class.h"
 #include <linux/i8042.h>
 #include <linux/init.h>
 #include <linux/input.h>
@@ -27,8 +28,8 @@
 #include <linux/sysfs.h>
 #include <linux/uuid.h>
 #include <linux/workqueue.h>
+
 #include <acpi/battery.h>
-#include "firmware_attributes_class.h"
 
 #define DRIVER_NAME "samsung-galaxybook"
 
