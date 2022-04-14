Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE0417C2
	for <chrome-platform@lists.linux.dev>; Thu, 14 Apr 2022 09:28:36 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b19so6048985wrh.11
        for <chrome-platform@lists.linux.dev>; Thu, 14 Apr 2022 02:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Av8EzP8d6KVoQi/yXwkBOAZabP9Xc8kXclRu9dT4+Lw=;
        b=XW/DvwVmRs0u+HPVCBNJh0m4E34d8hn5teI5p4MFlw1AwT0QGpyDrvDYKeFL04RmRK
         jvJG4o7qAJeCTCf9MHamgs4HLvZ9Sp1qgwjYT6HwHxwOr7ayhQgJeTOVefciIbCRRfcN
         kAIWOaIp3+4P5k1D8vWT9Ug6Fw28yDxDjq/go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Av8EzP8d6KVoQi/yXwkBOAZabP9Xc8kXclRu9dT4+Lw=;
        b=vvP9A+zOoojhiAoRwSCWmMWjNp+CMg1oFccN9ZSxWQnkXY0czAuvskl+eJ98KvLcAI
         /EgDY8jb91lKhkYtNFvgfpa2031moGSLfWQu/k3aeFye44sMTSdX4RqcyBaMEf1C/8Ag
         MA5ts+z8JhlONsfoxe+w8V+8hZYz1XyvSyFHP/verIrjBZ/TdhTmsGt2uoghmR/D2kjJ
         ji6qqpHHI6jUx+Kyt8flJqPA5gR4Naw73d/93OkQzvkGo/F9njRe2zGo1Cvl6soTcSbn
         6UbiEi6LKlrg8xK4YikFMGu7+31OgPc7O1ZNhzPCu/XBVOLuFH/c37jio4flGTv2tKAs
         24eA==
X-Gm-Message-State: AOAM530IqdYaNzOFnPdGoqExxTgNv7TACP7XExK+aQVS2UPIi43c3IEC
	NWMZ1OykMaKAY6M8kCARJpovhA==
X-Google-Smtp-Source: ABdhPJwICPNoTiCyXovM+uFrLY1cRUMc9NSi0tZTBQi5obLIMnAkksH5rZ/OUVje2hYRLnI13kqUcw==
X-Received: by 2002:adf:d1c7:0:b0:205:dc0e:383a with SMTP id b7-20020adfd1c7000000b00205dc0e383amr1370718wrd.335.1649928514435;
        Thu, 14 Apr 2022 02:28:34 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id bg8-20020a05600c3c8800b0038e4c5967besm1698099wmb.3.2022.04.14.02.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 02:28:34 -0700 (PDT)
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
Subject: [PATCH v4 1/4] dt-bindings: add mfd/cros_ec definitions
Date: Thu, 14 Apr 2022 09:28:28 +0000
Message-Id: <20220414092831.3717684-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220414092831.3717684-1-fabiobaltieri@chromium.org>
References: <20220414092831.3717684-1-fabiobaltieri@chromium.org>
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

