Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFFF1858
	for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 14:16:01 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id w4so2439260wrg.12
        for <chrome-platform@lists.linux.dev>; Wed, 20 Apr 2022 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=buTOea5hGyKVMycb2UNLHy/CmUKsfopnU76jMCLf+w0=;
        b=DiPpygcsv1FE9XrikGyg1icYH8Svlo4wHN7c1tle/5MzbK5V7gZZJq5zEs1zm+Tr0m
         hbQ7xTlZD3c3aGUWxVlvLu5rAiJ4fk64EfvWmQNbi2CZyH/3Eoq4iWQGbzXnWCaNJoUY
         vLauIkmYNo/D2ewIjUpwRwG4OF3kyDl7X8CP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=buTOea5hGyKVMycb2UNLHy/CmUKsfopnU76jMCLf+w0=;
        b=WylErCKTkeR9m098DyYAdAClW9+12LbMuMwxYwETt3sNiKCIyc1p2J3lsF2RoRJnrh
         whWzaI/2UfKqpZDkQ09lAlMyYF6B8FXNkVx4+DwsCXCL2RX+N1Sm6eQkg8JzHl6N9ynB
         2z6WxNDrsD4jauWAsRFHOnW5Va/LMmv56+8L/AHRrlqTTB0QorL3YWdZWO6YlfJTQrtR
         Cu839+5+6khrIw9e8AU0ZGSAVlVkIQZ9VkAmitChvf5PqBnJTHVqVRB+blILjKYqwyke
         cUUuolkLvpBcSNQk3mBmLI/ujvB9z/OXC+v0WmJMB9wj9JWtM9zkOKpiuBQdnKu8vzPI
         eozg==
X-Gm-Message-State: AOAM533djozFhc6A/xf+SFlgsXnCISlbZpbaMSlIUpgyxSqilZv481Nw
	EHgGhesov3zheaTCtWL0Rubhdg==
X-Google-Smtp-Source: ABdhPJyYIA6x9+f8e47TwQBEyU5CfA6Jc7fDHnsVuiVEE4Gn+yDN22VKV/egJHJ1ZcL3RtVt3ILCkg==
X-Received: by 2002:a5d:6e85:0:b0:207:a435:d9a7 with SMTP id k5-20020a5d6e85000000b00207a435d9a7mr15785389wrz.217.1650464159946;
        Wed, 20 Apr 2022 07:15:59 -0700 (PDT)
Received: from localhost.localdomain ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id v2-20020adf8b42000000b0020aa790a258sm12447wra.8.2022.04.20.07.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:15:59 -0700 (PDT)
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
Subject: [PATCH v5 1/4] dt-bindings: add mfd/cros_ec definitions
Date: Wed, 20 Apr 2022 14:15:53 +0000
Message-Id: <20220420141556.681212-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220420141556.681212-1-fabiobaltieri@chromium.org>
References: <20220420141556.681212-1-fabiobaltieri@chromium.org>
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
2.36.0.rc0.470.gd361397f0d-goog

