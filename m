Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5710441A77C
	for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584155; cv=none; b=g29D74bpQaCkqkPjst6JFMkbwLucxH0KGrcoc8xDX6r7YRlg/fXSWEAu+NevjWf35VZZ22TG5JfwEBHQjPnM4ZUgkQ3+CWwJRna9XTzCRh4rRZE1dTfF7PrEZ1lJVZ4CBYQ/OuXW98cdJhsYU2vkNdPDlGGwENukogULJPhAK5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584155; c=relaxed/simple;
	bh=5F+9d6zSwaI23ajpCCP4JCHQTIKUiBdtuz68jRALsbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSItLh4lRs1UC1npn7xwaKAQMQxD/ZGZFr2QErM3b14fnBV+uSmyjjQx7XB1XwIv0n/ZvfwdCeA/4WlNbXA7RzO4K2EIAvs2KwUg/HjX1FCdfqn3J3qxL0zubpLXCCKoyK2OqR576gzLDP3ndbzN9KsD2D7OJt0s6FULD9vjnZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=SHmw7MIM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="SHmw7MIM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so28077005e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787584150; x=1788188950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyYlZFVCc06FCgom6L11YucB1au+iuvrVnF7FufZeZ4=;
        b=SHmw7MIMTniKMqcAXz90rfbq0ikH+lxy+n94b9DPdguahzwzlSxX2lrOTMsgb7nnXd
         5SUAsj3FJWVzOols2/iZb9DanZDfRnRH9YUGTJ2PLYYotcrxYfKi7wzwIhh3g46LSuA5
         g6z5xV6SzyDZgl5OLmIbDUbWrZ8kCkBPRJwkWyYkoTW7WkLx6yRR7U0aNyV9o64tjKrZ
         4qOmXtGuqMBjU94MPTjvgNs4E5xm7/7xYoM0WKyadtsozkoXGgNB4nQa+KRdyBHLfgcI
         Ds5v9a48E/rEKqIS4K3zIuGvgP/RCnpIL2q1ejqgADI9lDECM2CRSFNBhswgUsBQe+63
         FZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584150; x=1788188950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyYlZFVCc06FCgom6L11YucB1au+iuvrVnF7FufZeZ4=;
        b=qcF73fX+eOJ4xf/0KpeaVYYQBoZzM0aqYYt772ru5FoRqLvZ96s7RekLc9hdRkfhvE
         4KFQScKjn5VefW+ryI42tCguk/mzQSu1kMLAVdjdq8dJ8Cv8b2Cm0Jfg2RMtM8t0ebmG
         hgvb8ClT5PTpNvZ/arct7Vi6/ceJwp+JiIs5BURwTT9m9eDgNNiRXm7GfPF+Lo55Qjy3
         WnWLDy+6p9qvTblJ6yNw9sILDPjRicXckw59pVjzRaahHvCBPjW9uqjW+i6I1VtgW36o
         2kF3luSG1bEHnYotfPj+N8EJYmMg9Tcf1wZL/abK7uAG3kWPvoCgDFdiWirCCqLddOWl
         ycYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgQMQTwA6YlZSKPkRLVjWKX9Ckl4IneHhqdHghn/V2PW1DxFsiEWusSwDptLOSkPfl52Bxr7obvigJeKRSK80=@lists.linux.dev
X-Gm-Message-State: AFuF++lMZU1tCdeTt7PnDmq6BiI0W4Iew10rhxsXTw6oDqgbcQLnO9+u
	HjDlmteOXRCeUVNkwxV+2e4DYAs9SvnXiC7L2NZKkAt8tNBgpstPpMRGS6lveYReVQ==
X-Gm-Gg: AR+sD12/7q8oaLsWfqPeYFBwCexD6doiRsRHXga95ugEPTcdDdDp+lVkua6YF5g5XDO
	3HS72TrLGg71kfJJafgKdma48s8xVvVUOrZl2UuYNfCdntianSlEFwWZFckLhMBkCbVco6Vosch
	2Gt8c7k+rrdau9RfObmNjoBbQqLN8eMdcTbOPbWF954VlJL3WZcfPVVpAzkRyouI9FHCv7SoGAQ
	zBNsS2QaSozfU0xYWBcuCAR8C5n+NmHOhjbbgqJlGaF5KS2i7FlXvDvfTQxG5HvpxbCZXhnt5BO
	eP146qK9B8SDSWw2ORMmeo26+QOK9hKaTwXKc18XjBap0S54XIME0O9JqJoepMnKxt54937sASV
	y2O5LYMzsW6Yu299572UD3UGvEbggoPY5+E/nhj3Ttj+lSrbl31ecOLvKD004UtxfrHVPIoixct
	NFlYKB5huTEwAu/4O5M62IZID8uytkwg0Dg9cJIZ5pVgiJP5Vj8x99WEMH8KE+JyWQ+xjnlh649
	Jc9ttjhz/GWPm5zggmGgBM6mUOc6hsBd9Ba
X-Received: by 2002:a05:600c:c172:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-499b8464e46mr372310375e9.12.1787584150504;
        Mon, 24 Aug 2026 08:09:10 -0700 (PDT)
Received: from horizon.localdomain ([216.128.28.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c8f382b1sm63920035e9.8.2026.08.24.08.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:09:10 -0700 (PDT)
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
Subject: [PATCH v13 RESEND 1/5] platform/x86: Sort firmware attributes class includes
Date: Mon, 24 Aug 2026 16:08:58 +0100
Message-ID: <b967ec0f8adb69417a3d81ee5546e4a238e29e11.1787584107.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787584107.git.sean@starlabs.systems>
References: <cover.1787584107.git.sean@starlabs.systems>
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
 
