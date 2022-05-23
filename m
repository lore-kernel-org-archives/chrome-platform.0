Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9605B629
	for <chrome-platform@lists.linux.dev>; Mon, 23 May 2022 09:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9593C34117;
	Mon, 23 May 2022 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653296931;
	bh=sPsMNa6xJuOBGkIQpMmbCnLS4e+pUl2hEV+vBFGxYGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=es5fHf3IfoXFFBf4QCe+ASCKKFn9V0es2k6FoFrvTDA98CI05H6v0eKiQEqSaMlXq
	 yIEU8EXC814Ill8dlmZrFRwYHYgZG6ohpnnukzz1R17oKTTjR02WsJCVsLVUzexFjR
	 46eBPtWQxgRgqSQVeijmJCzEWdQxqj3sJChpt1GXpJdqGiQOykkxgjwgEIJ6Oo6UPj
	 MKaf8bg72ahSSo4FfPrTtJ2eJplLj2gOq8yz0fa8lcpRR26ZCbQ7PDNC0Kg+NJCrqU
	 XyTfKiiCJH0PbfCPh5C4b5C46nSqd8O1CExABwR0kcUJt9uyZSuEXqpIsimpWyQ0w4
	 lp2qbtBeUrxWw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org,
	robh+dt@kernel.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	tzungbi@kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 1/5] platform/chrome: cros_kbd_led_backlight: sort headers alphabetically
Date: Mon, 23 May 2022 17:08:18 +0800
Message-Id: <20220523090822.3035189-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220523090822.3035189-1-tzungbi@kernel.org>
References: <20220523090822.3035189-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be neat and reduce conflict possibility, sort the headers
alphabetically.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No changes from v3.

Changes from v2:
- Add commit message.
- Add R-b tag.

Changes from v1:
- Update email address accordingly.

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
2.36.1.124.g0e6072fb45-goog

