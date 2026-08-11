Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62B644331E
	for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450844; cv=none; b=ZjEge3AciA0UQohUfZncoIBBjekIzqolbITPEbI2zEqhIUInbvTqVb7tHVBv/WkHtEjfJuNNNE48ZT12dPzbOCgN9zbO3WStj2kS3LndZ4zLP/u8RK93XNMxZjfE5lyQvIR7hHk1E88XHp+a/gHG24w0zBoR1hDj0/13QDGjZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450844; c=relaxed/simple;
	bh=FmJ253mDx04B3QJ1bIl+tfh8HdALdb4bRYDxE/DUlnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cEsTwcJnxLWMdKQgth1DDoDVpSPaBqq3Fbda94UrgpgcYwhvPmXA+VmX2HkCHShG6723jN2vE5iKOSE4kZVaWSYvt3j6JxyOUbtEljNWv/l6N0SDPgMAHKx3gM83NTawX21TthbGHaXeiiCQ8+VRemV27J9Z15e09gIjztVfLtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TU8Oyj40; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TU8Oyj40"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84867f07d63so3457656b3a.2
        for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450842; x=1787055642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7I9lwGzwg7czeq/kM88e0ae+cNOZS1aNNH4lK4EhTU=;
        b=TU8Oyj40xxC1CCdabwgJ2lf38ZV8DzdfbemcgfAt0ImOTj/eZdg+gDOjWVq4owXwsB
         W8K5G7HA1VyFdxLsZ1AfJJRUA5XZCVc9OgEPcqBAIXfbQpNfdYJtbkb1WhuwNPQE8R/N
         VQikiJ6pBPyuAYTVkVlllcIlZIXUv+7Rsrk8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450842; x=1787055642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7I9lwGzwg7czeq/kM88e0ae+cNOZS1aNNH4lK4EhTU=;
        b=R1QnMUrOmVm8r1lU72IyglEwX8vgSXjqxgIsdndTCJhBdefRnNOx+te2Vv+12GqRJ2
         opHiAf3ofeO8iErH5SkDA4nBlLbPiBP5lc28iol9YxRyPzdRrU1StLAxL7QVnFUI3nbA
         /rne//ycxtSVHrP1jsdtJQiHbJ+/6zfbi8jQA+b++DNs6k0QNUSZ4hOZ6mYkRBxgtvGR
         3auQZgjYfNuvMjRLaZhHYF8zlhghCTV4LhWQoVF2rCmSbJl7MCuF/ghCuDMhG/ooEoR/
         +6la+uX1c/h2IEmSLYYqIXh2aggXwuvlYJPNjUz0r4dJmcnH8f6sURL5o8hoWJulE8EB
         Ck0A==
X-Forwarded-Encrypted: i=1; AHgh+RrqKZlyhn56izmKbyneB0ej4MJ05d+zHyGymGIAcKn+nQYKccOP5i8g2alny7VCwfKHq1O7MsxBIyqbgcgpQl0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl5ukabtCZVlJqCXw45Lk4PYDAEPAIJUyKJFcVV/JgwQNuMk1y
	EK7hyYJM5zxozEfy5Qhxlf/YF8wD+Z6O9JhRzfqUTHiAOL1jbY/1vAcf7DORiZOgwg==
X-Gm-Gg: AR+sD10Uv6GOlEUbujmx+np/rDb/tGDJ3ZylkjAqrXTrKoYiQFsGLxKMvPcJ/htY6Ja
	41JLbLnXXHCk/VVGHBzND+wzbYcHoy1ACI5MfRpsj4bT17wkCJWKYLobqy1k1kyHjnXV3q/VDFI
	rLhaXVAUaG17Vk4/kYnkKiMjXTovW7BzUdBjV0a+3Qk8JQdevXvgIZyVe1qpf4PkW3W2UvDWWbQ
	qne8NI5YW41udUNLEScvfk7uOfor815qt2lr6M6FNUeg3SbEN/xtMjzViIooKoWWQO2JTUEDUJL
	tvch1be1OqkH80obO08+ORYzVMCM44MJLoPm/8wZpStswlN1NNRcOuU+vwBCB2q3YQKWjegMDV5
	6M4HG2hhpkM398njZEw3256QgBom3YFA3OhWdT6uQIa5Xg13ieXi7XqjAqW3Id+yxfRy37YRme9
	Ghr36qvwzureKFOZLqqPYj3SxGnqBbqoZfeSHoZ/hGzlTNRwky34XCM0aetFgSKz50pOIcd1CDt
	KyYOLALbQ45TAOokhbTNT6smsDBRwR4EIjpzmdfSEvkJQ==
X-Received: by 2002:a05:6a00:23d2:b0:845:c906:5ff5 with SMTP id d2e1a72fcca58-84fa8842ea1mr2725202b3a.30.1786450842194;
        Tue, 11 Aug 2026 05:20:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 2/9] Input: elan_i2c - sort include statements
Date: Tue, 11 Aug 2026 20:20:02 +0800
Message-ID: <20260811122011.3539250-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the include statements before adding new ones in the next change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
2.55.0.679.g6767b8d81c-goog

