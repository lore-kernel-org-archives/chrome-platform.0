Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859DD43744D
	for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620450; cv=none; b=WHs4RoCZuZ1WtSZB2uxPEptp8jICCJSBr8cUlIajz5Qf1U1YD2yR7M+pm2tiyqUr7QLUBYR/NxBKV5dmc4uEQPTC5lKXM4a+zXUNKa5w3x5+jF3PL7E5aM1yHBuXEDFAaAPyusGVHVH4sUumZHyEXMah+o17mKKqsr2lsVTeqT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620450; c=relaxed/simple;
	bh=2aTFqtE74mVxCKzF4QnPnvxUaPaVEshhhNvwJjbpygI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ju/5tSBJ4XH8R9RD5f8e6ExUwQy7RCNP7dSqWiN/Q8uq2XY2kkSona6qCmkwgnIL4gOPnoAYAvpANIqSGBo/1yYC4aLSeCTC4ZcZpucqJPccWMKcdJWhpGa7gMh5W75dioABNpG997x7VO7/F+M6SCQoxKkMqglr//Rrfl4J6T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OMZmNYSU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OMZmNYSU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacf197759so125162195ad.2
        for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 00:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620449; x=1785225249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGtEOhOpR/1OiCj9qufh1O1atPkJph2JTGUTc+kCL1E=;
        b=OMZmNYSU6Yfi0kn354neEjXPveRExvV1HiGWp6MfFz1KE/P/AmjcJWzyYeukq4TAdk
         nORJwINQX+nCF3c8PuRkmf8KyYjM16PHy/2jS8I/h42RNWrvqUgWVemTnGpdcqXiyv4B
         P4p9ZIFeCU61GQubRXlQNRwlqJpxZg3uIpGeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620449; x=1785225249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGtEOhOpR/1OiCj9qufh1O1atPkJph2JTGUTc+kCL1E=;
        b=iTxZb0QZwrniWfs8fb6cQdhKg2E6lfeW02MIyQBqkVgWuw02vJO0IVOabs4Et0D8kC
         uDDsZEM+3qVgaVfPcUj30ItVHQX5vFqxnq/Gz1ijb0YK7s2BPuSAg0TaRMk+Gnni7RcO
         I+8GXdRPSnDPMLRumYUi8Z1OD30B7A4pEHqdZGDZp7oyzsnMmc17RQ4XEjjaxSdmOIB/
         WmCsgxt7NFMIXrmb4FDudCHwpSL4jggPrEKzxVdsI7f8UyLV+7QVA7gnj4hXSujjdZoQ
         KaU1GhRAZDaeg15kv0LA651UnZRez6IQK7BUhSlXLrtMRpAJoBnAHa2fbHOt8A3YtegC
         P5Xw==
X-Forwarded-Encrypted: i=1; AHgh+RrI/6B3GuYRKKcK5xLJUxsTa4laUocWHNhSINs+HWPZLyYASW7rBqQgCuYjp93PUhpQH0aJnpdaGIVKp9BMfM8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8z74UxtzBNxNPsHtOkivw0MKAHVP8GkZ546HYGSXRzYUoSOY7
	IADbZxg1SZndx04ws5lS9PTdFL5wgJDRazpk90PN4KddF2cAzdVuttPEo2kIkK/Jug==
X-Gm-Gg: AR+sD11z5HxzSoD8TjRw/5i4ac6i8SPKzF/QAi3sJ+rz7JvERqyH8GlkMFzzVHpWKJA
	MqdLExrMGllhSL8FCu+FV9+5LA0upL0eWOAtCc+X8EDX8ExMY385YqDolirCzYkc6jlJ1UVeojF
	YvCeL/YkBOaJUXq6DfJbRvW6SkJ9xayJTJwBkdgBn8PBRCNa7x8k3kZWohLH1n11oZsau7T2WfR
	HE7j/KZRZj3gmCM3mV+1sDAOs/1h7AS/lsaH5a/lctnGckRW4j5UI/3GjxpgLg4vx5iCFVsv6dR
	e01gAbpBRFAMFk6ImcEqe6ehseMu+MjWIrzoYADLNgdl99qgP112lC9POekVmNHMMYcHzfFF2Rl
	meLJ95iIfJQAWUP4PGzzvsBz8ih5TM7kMgc1y+Anpdim8lBBKjIl4z6APFAQAUn58WKj2UCifrV
	tthjEyjVasezrnEHLg7rBeeAreygClOBVhfVhBbKSF1elzVc7dEfTY88U5bM0=
X-Received: by 2002:a17:902:e748:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2cf3494aebdmr189718205ad.23.1784620449012;
        Tue, 21 Jul 2026 00:54:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] Input: elan_i2c - sort include statements
Date: Tue, 21 Jul 2026 15:52:16 +0800
Message-ID: <20260721075226.2347933-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the include statements before adding new ones in the next change.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/input/mouse/elan_i2c_core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f93dd545d66b..9f024a435dbf 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -16,27 +16,27 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/string_choices.h>
-#include <linux/input.h>
-#include <linux/uaccess.h>
 #include <linux/jiffies.h>
-#include <linux/completion.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/string_choices.h>
+#include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
 #include "elan_i2c.h"
-- 
2.55.0.229.g6434b31f56-goog

