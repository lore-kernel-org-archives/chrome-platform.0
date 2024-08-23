Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CFD1C8FB1
	for <chrome-platform@lists.linux.dev>; Fri, 23 Aug 2024 22:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724450844; cv=none; b=EA/iCsXUjLvx7f/XHylZXRZ9PUPCYtFepGYSU5g2ibPoT2g90FPSlwGiluTkjeZb2QjiG9RmLt4/r3DmNVNWue84d3YnyKygDfldcSHo2BT3lShqm06OuGthsYqGgE5fEXvYP85hBZim7sNLEjGBX0lHomgBLKttl4l+fi98qkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724450844; c=relaxed/simple;
	bh=3hw+CZqza9xuGv8IMOyhBwEUy4qPvlzZcseXAnIfo9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VlK3YNc6rw8wfg567HbaAXQbYoxnYdNzFFV7p5zQMc+R4J8MVR2fGMKiqlDAK2UOKHwnF0wX8btWZlbaNL7EyXh18wwnBGmTFU0KCX4d+fY+sdWs20iqX8mzKrVoAH66Ys/5+8r0Zb+ow+olttnGPnKsxmXr2c/ZLbnIlbED3mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 10c4aa32-619c-11ef-8232-005056bdfda7;
	Sat, 24 Aug 2024 01:07:19 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] iio: proximity: cros_ec_mkbp_proximity: Switch to including mod_devicetable.h for struct of_device_id definition
Date: Sat, 24 Aug 2024 01:07:18 +0300
Message-ID: <20240823220718.743596-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of.h was only included for this definition, so include the correct header
instead.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/iio/proximity/cros_ec_mkbp_proximity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/cros_ec_mkbp_proximity.c b/drivers/iio/proximity/cros_ec_mkbp_proximity.c
index 4df506bb8b38..cff57d851762 100644
--- a/drivers/iio/proximity/cros_ec_mkbp_proximity.c
+++ b/drivers/iio/proximity/cros_ec_mkbp_proximity.c
@@ -6,10 +6,10 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
-- 
2.46.0

