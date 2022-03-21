Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE26369
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 14:32:34 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id p9so20929294wra.12
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jPNbf4VBXaKauQrD5GdOw/7C1sM2aDR3HnxDjhZ0elg=;
        b=K04KZ2llvCIBVjpLXRbj+FItZXFlk4ZVLcXMU/n3uOzyXQkjIt2p8UQRjAN1JRYeHw
         odN5bc3b7y61QwvNr5Voo9HYGe+n6sUBYkPIHRCLkL2b8MpipkOPtqLac92fMqy93U/2
         9Xve7ZthNZPcBZUKdMEkBljxtgCh7T6f6FGbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jPNbf4VBXaKauQrD5GdOw/7C1sM2aDR3HnxDjhZ0elg=;
        b=hcgejUBkePF+cF7hTZXkoDwZvq5tklOC1osZdLyPhwFuBQcSBKMqNsNvZ/6MW3gQYU
         S/UKwTZxVvYlOfvpojHC5UGv+Bgi19/zidXoG8/BoTThe6L0QIWk52+6Z4Lch5a4wKaE
         f3svdOafPpkB9ZRTOy9lQVwhwx9UCQ8ZiLjjCnwAsIkFItL6/pGjwaOdhkglxs1T/ZOw
         LP987SY81uDv43gUwcjqkGecQqvr7/MS1RT85M5yMej35VgF2+/fl4yRkB21AEwWsv49
         ENDI4rMDjCScDQy7v+QPRGcFrgjvFTpKMbkSpiDj3ldRKpujThW49L7ZcZi8/INX+O8J
         Po2g==
X-Gm-Message-State: AOAM5335cbvGQM3CXhzeB/Ti19hqfGySj4H6/AkHHjEKe3CAFYsSA1Ee
	wP9H3JfeEqK8g2OA9ofpOdiL0g==
X-Google-Smtp-Source: ABdhPJxAUNMAkxYkB4uOST35byIe9LqZT6SPgd/wDbe3ZFo/1vnlqpEDwMr6f9llJhrZuMausBRxrg==
X-Received: by 2002:adf:ea06:0:b0:203:ed67:6093 with SMTP id q6-20020adfea06000000b00203ed676093mr15652317wrm.596.1647873152722;
        Mon, 21 Mar 2022 07:32:32 -0700 (PDT)
Received: from fabiobaltieri-linux.lan ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c19cb00b00389efe9c512sm19092793wmq.23.2022.03.21.07.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 07:32:32 -0700 (PDT)
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
Subject: [PATCH 1/4] dt-bindings: add mfd/cros_ec definitions
Date: Mon, 21 Mar 2022 14:32:19 +0000
Message-Id: <20220321143222.2523373-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
In-Reply-To: <20220321143222.2523373-1-fabiobaltieri@chromium.org>
References: <20220321143222.2523373-1-fabiobaltieri@chromium.org>
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
index 000000000000..e02414eae622
--- /dev/null
+++ b/include/dt-bindings/mfd/cros_ec.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
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
2.35.1.894.gb6a874cedc-goog

