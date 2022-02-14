Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E728F7E4
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 05:37:29 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id i205-20020a2522d6000000b00622c778ac7cso4357346ybi.3
        for <chrome-platform@lists.linux.dev>; Sun, 13 Feb 2022 21:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=RM7B/VP3RiMIbRxHXAkoswg4A5f1B95tqoOVGTsgT8Q=;
        b=TTbMKvwz6PseJb5lRAXLQiBv75QGAS10Z9JTQyCyZ32BBng4ecFDNGi05LGrA57+Fv
         +cgxTg66+Ae6IeLW50dDVi+h2CZqYrwt9erF1a+Qa3ZqUuQnXUpkEhOLGdZEDsmEtlOD
         aa4oKgzbTO7qdsYuMM9iefxLmoVMihDg2tb+VlAp/Hdb2c5gQwONJz1XJ01Jl5Ln9xl7
         jq4QV7B/naowDN69QoT8aNjnfHnCL5sbZxKazEBN2lAJpA8RKeNzdRDr0T2UqrxznoZr
         FC8aW/1Lq/VsZWV1tzNCy/EIcMbu6uaLKupmhBW6xUQeT0FcH85gsLXHR3nPNvCTJQ4R
         vDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RM7B/VP3RiMIbRxHXAkoswg4A5f1B95tqoOVGTsgT8Q=;
        b=katf43X9YcYjfmQbMEq21JuF90QlTQS5vlM7emwUfguAsxwgER2sfu4eY3hUYVazQW
         D2h8f5rTiGh6mn32CgxY1M/WcLvR+tyD4+pezpNWw7ISl9/HyzHUyVUZ2mAgJSplczIa
         76nv5IhdW19QDeCa2Ui1YJKwiKv3k2L6GYkMTA/O0zidOYqKiPDEuzskqXpG49HBkd0A
         AyD473GtstEVADVwXHnbmzw5w/BH6e/iw16ZpB3WpcVCSlK71VesQ2GvPTSGz4dihpKB
         z6YfbAg+sYw4nSGWvE/d+fXpfUqhq3C0rRvoocJeXFKmRC6m7hDb79QMRAqldBOLiNZ/
         j2Lw==
X-Gm-Message-State: AOAM531CSNKwmHtsUFihjHNsX0pk6mSu6PDoq/1WR5A2ePiHlMaynp5j
	RkcW+jwsbMC5i29QO+Fi2HFm2uJZVCuB
X-Google-Smtp-Source: ABdhPJx+13Gw/OOKY8khKfw7V8FFpvA8xTR4gZkToZpRpsfvFKIV+UFm7cr8RGYsxDkI86AyD9bMelqUh6+q
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:f315:f92d:e3d3:2539])
 (user=tzungbi job=sendgmr) by 2002:a25:e705:: with SMTP id
 e5mr786251ybh.216.1644817049075; Sun, 13 Feb 2022 21:37:29 -0800 (PST)
Date: Mon, 14 Feb 2022 13:36:42 +0800
In-Reply-To: <20220214053646.3088298-1-tzungbi@google.com>
Message-Id: <20220214053646.3088298-2-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220214053646.3088298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH 1/5] platform/chrome: cros_kbd_led_backlight: sort headers alphabetically
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_kbd_led_backlight.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_kbd_led_backlight.c b/drivers/platform/chrome/cros_kbd_led_backlight.c
index aa409f0201fb..f9587a562bb7 100644
--- a/drivers/platform/chrome/cros_kbd_led_backlight.c
+++ b/drivers/platform/chrome/cros_kbd_led_backlight.c
@@ -4,12 +4,12 @@
 // Copyright (C) 2012 Google, Inc.
 
 #include <linux/acpi.h>
-#include <linux/leds.h>
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-- 
2.35.1.265.g69c8d7142f-goog

