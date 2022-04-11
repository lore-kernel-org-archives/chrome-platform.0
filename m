Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E770185E
	for <chrome-platform@lists.linux.dev>; Mon, 11 Apr 2022 15:21:19 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b19so23509994wrh.11
        for <chrome-platform@lists.linux.dev>; Mon, 11 Apr 2022 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Av8EzP8d6KVoQi/yXwkBOAZabP9Xc8kXclRu9dT4+Lw=;
        b=MSW2higryDgsOhw0ZJDq4mbqycpFHp4ZK/5IKr30dVw+TG88282lZo+8u8kF2+sS/8
         t7IICscSNVmaDq9/jbHn0OPrQNhH/FUIc99pHP882qHAHVm/kjNMO4jfZ8UpZnnCK8yK
         7z+7lovGGpwh2g0cUNRsIxYVVn8En0/LjjELY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Av8EzP8d6KVoQi/yXwkBOAZabP9Xc8kXclRu9dT4+Lw=;
        b=DcBZFc8Y5/8Q/IpdwboWy3q5Vh9+z7l9vokDi5bizv3cMTCnb3sghlVKBj/07oXWO3
         JspL92Q9zdrOSz0tZuULbMj5yG0eBBj3wN/Mi2bLmREXobwIsfoJr2LxBF7bWf+iANis
         FtUXH3jh7p20vDyw0cB7Xu6d1Rdte4S0xzlY+06CSjEFQ8+bT8LlbCxzjRDzHRx+Cr4X
         LeVUIanHFJRH81VGaxgEzica4TReyV5xFe9HBQKuEUjhshBJP7Yi+fbegTlt2twq3KtQ
         A1ZrFuD59mU2YQF/H6QCpjnp330qubU7dUA7uBkLUnw5lFsYM0rUD0qQN/2OmnDgPTNM
         B9+Q==
X-Gm-Message-State: AOAM531jbm/TzovnrFP4opmKG11O0hYGz6+U6qfHl9pfHL0IuwhGpAaO
	QeCb8pGiWHGXbFy4O2uTOPxIIg==
X-Google-Smtp-Source: ABdhPJxPthidGCKrnPvf9IHSua1gxQPSnNJCQzeeFUq0J9nt1iiyJPKPkuaIafZ/E669DST2+ymPrA==
X-Received: by 2002:a05:6000:3ca:b0:207:a389:ca09 with SMTP id b10-20020a05600003ca00b00207a389ca09mr6481526wrg.628.1649690477827;
        Mon, 11 Apr 2022 08:21:17 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id bk1-20020a0560001d8100b002061d6bdfd0sm19512832wrb.63.2022.04.11.08.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:21:17 -0700 (PDT)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Baltieri <fabiobaltieri@chromium.org>
Subject: [PATCH v3 1/4] dt-bindings: add mfd/cros_ec definitions
Date: Mon, 11 Apr 2022 15:21:11 +0000
Message-Id: <20220411152114.2165933-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220411152114.2165933-1-fabiobaltieri@chromium.org>
References: <20220411152114.2165933-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dt-bindings include file for cros_ec devicetree definition, define
a pair of special purpose PWM channels in it.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 include/dt-bindings/mfd/cros_ec.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/mfd/cros_ec.h

diff --git a/include/dt-bindings/mfd/cros_ec.h b/include/dt-bindings/mfd/cros_ec.h
new file mode 100644
index 000000000000..3b29cd049578
--- /dev/null
+++ b/include/dt-bindings/mfd/cros_ec.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * DTS binding definitions used for the Chromium OS Embedded Controller.
+ *
+ * Copyright (c) 2022 The Chromium OS Authors. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_MFD_CROS_EC_H
+#define _DT_BINDINGS_MFD_CROS_EC_H
+
+/* Typed channel for keyboard backlight. */
+#define CROS_EC_PWM_DT_KB_LIGHT		0
+/* Typed channel for display backlight. */
+#define CROS_EC_PWM_DT_DISPLAY_LIGHT	1
+/* Number of typed channels. */
+#define CROS_EC_PWM_DT_COUNT		2
+
+#endif
-- 
2.35.1.1178.g4f1659d476-goog

