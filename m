Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190A813
	for <chrome-platform@lists.linux.dev>; Thu, 31 Mar 2022 12:58:24 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id p189so14228380wmp.3
        for <chrome-platform@lists.linux.dev>; Thu, 31 Mar 2022 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9w3ZU2FP1Rv3cljPhXS0CpszxfyekTzsqMLGoLCCSm8=;
        b=llpzdZ2QoUIy9Tl0HxXnxvtUoVjm9IgVG5PX86hpKe72UlB1I5Lq+qPkd3R+eHJoA2
         EhH3UJig8Z4xLiD+fmzidq5eoc0HkacxizCfKsEm2oLn90plB55zQ7pVM2DNmlvkKDI8
         RcyFXcCbhcSlE+Rq0X68yBVT3e6e2TbkzwYts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9w3ZU2FP1Rv3cljPhXS0CpszxfyekTzsqMLGoLCCSm8=;
        b=FIvytpkpjGwPro4NNqb0hyeCuWXvwnhEUe1CEg6a7ZVHMDdtcf9IMDwNy4jUzLHe2e
         hHavM3G0y9pYZhl+itpRCFyqV925PBBqkoaT8n9aGFwbOHNyUh/tOtZJUYuX8OPRLHH+
         yfZ6UhdPSUP224XkbQ1BCq6s+aoKAg/uSZH85Br01f69cw/9v2RuwdB0lTlvdP4YNYuy
         GoSP67hwI7HENn1CTGzvx7nf9gsiqdQ7PqRmuSMIShMwBtoq85OpxE6DJh0hEi0SAqIS
         VjAA69pWQMVZUwcpb4vGp4gKTh9HYv/zzi5HplXyN2JVdve3qBd5iW47mL9FUSWYtEHS
         PhGQ==
X-Gm-Message-State: AOAM532Yv/gjboZEzbSsqW0mo8OtretvOE0/xpWQd7ltyFlM+k9ls5+m
	+j1Oz/DYNOR2312CcAS+R9z7Kg==
X-Google-Smtp-Source: ABdhPJw/bvvxGSAdxaxfDR7i8xQQgyJ4xG4agDhOyHyIbNnyenaBkh8+NJdEuQEXlJHU37EUBxUwZQ==
X-Received: by 2002:a05:600c:378d:b0:38b:e12f:edde with SMTP id o13-20020a05600c378d00b0038be12feddemr4636148wmr.69.1648731502654;
        Thu, 31 Mar 2022 05:58:22 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id j16-20020a05600c191000b0038c9249ffdesm8230695wmq.9.2022.03.31.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 05:58:22 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: add mfd/cros_ec definitions
Date: Thu, 31 Mar 2022 12:58:15 +0000
Message-Id: <20220331125818.3776912-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
In-Reply-To: <20220331125818.3776912-1-fabiobaltieri@chromium.org>
References: <20220331125818.3776912-1-fabiobaltieri@chromium.org>
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
2.35.1.1021.g381101b075-goog

