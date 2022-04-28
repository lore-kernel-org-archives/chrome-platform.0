Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7469EC9
	for <chrome-platform@lists.linux.dev>; Thu, 28 Apr 2022 10:04:32 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q23so6059119wra.1
        for <chrome-platform@lists.linux.dev>; Thu, 28 Apr 2022 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IGhXnVH0ggOkw3OApNhk6r1wBoAuFoy4h6Is9/5uMkc=;
        b=eVRmZnZEGzasLOjDwCJhqMfwLwbT5pTUBZz6prR0DxyB7mVpuF5mXRRscz37OTa6Z6
         IWgu+Ynv9/cl2cdN4wSHOsVXgZJVCwTcuqwymlKwTuIvCSftKXKEsqQ9zbfpbJSLV5az
         hKI1onvYoOUpIqh1c5R75pCR06jDSYjWNR99w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IGhXnVH0ggOkw3OApNhk6r1wBoAuFoy4h6Is9/5uMkc=;
        b=PfT16d0LS9qQNDhn6ugd8Z4IPI5YME4DXo5vKC4sGo9eAXpmmmOiux0fu4eGIdTlov
         RimbcSq74IMko8XXRdEb0o9Cl46DR//e+s8tiU/Fnz2cHPmKFYLwX86tJDh7zJUj9cv/
         gwcNYh6n23nOd3pGopRuG0KsQV51LXI6h8qfyP4CuvCFiBUZ2HbXjtO3dj0JlIgKEaR1
         bp/mcNuapHEvSUM1vFo68ilF4Kj/RtHoYaWzBsHTzjvRvIE1eHQd5x/f8Y06OcXuLve4
         EclgEX+oe/n7VFm3PdH5OSB8cRz8B9w63hkumL3Cm8Gvzho/+VaB+ORc/ZDd7RAvCEZf
         RkPw==
X-Gm-Message-State: AOAM5314eoDWKWHdNqfmqaVowXgyPhFZyFUSbfWS9TwNfO8VsZhh3peH
	iw9CK26GLwyB5i2CTeL4HQYbPA==
X-Google-Smtp-Source: ABdhPJzjbUoBwlDopMyW33l1lxY0cYudO9Yi5cAIdOYzcQJ+ApQfht6chf1e6HDKMOFqWFP1chBB4g==
X-Received: by 2002:a5d:620c:0:b0:20a:b1dc:eabe with SMTP id y12-20020a5d620c000000b0020ab1dceabemr24962689wru.711.1651140271218;
        Thu, 28 Apr 2022 03:04:31 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id v5-20020a5d6785000000b0020a792848eesm15080449wru.82.2022.04.28.03.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 03:04:30 -0700 (PDT)
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
	Fabio Baltieri <fabiobaltieri@chromium.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/4] dt-bindings: add mfd/cros_ec definitions
Date: Thu, 28 Apr 2022 10:04:18 +0000
Message-Id: <20220428100421.247471-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220428100421.247471-1-fabiobaltieri@chromium.org>
References: <20220428100421.247471-1-fabiobaltieri@chromium.org>
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
Acked-by: Rob Herring <robh@kernel.org>
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
2.36.0.rc2.479.g8af0fa9b8e-goog

