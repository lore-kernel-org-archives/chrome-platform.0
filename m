Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6785A2C80
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 04:51:02 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id p16-20020a170902a41000b0014992c5d56bso932107plq.19
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 20:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=koQ2tHBjNS8/f2hzlZMkuTgOUCTplJaQ9J/1YczOYVg=;
        b=i8vNqQgcJj3UfDn3QYEYqFXf0Qh46q9yiKYDz/8T3NDL+SGuPipiju1MDYGk+GOT8g
         nrP7lk/MsJX5zDOiepdgryOIpHvqMap6P+t7gLaaLD4QzFh4Dih4oNS4kKb4M1EMzLLe
         Nq1i88yEoVPxrYQEIRD9yxeAkySqHAZOGBAxQSlnNtq87GLjdyfn/B+K5DISuD7kLAkH
         viZPhxDiGzD7sFrKxc2DCtauHHvEXBfXOtd++YiB59QJ10V5aGNGTwEAeKEF9/Ca0S3N
         c2TtALRCrr9dKmbmbeigQ2IV9Nqht4dBMjuEUH4NeIYGy3p/ydukrULLezz7N1n6BdSN
         LVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=koQ2tHBjNS8/f2hzlZMkuTgOUCTplJaQ9J/1YczOYVg=;
        b=Vu3deL6WXPa7mkGwzqDo3QXeXo0ljODK5lmzgE+IrL2tLbTTJQTk8ouZDQlz46Ib0Z
         yeagtIRxLIL3/YYeGLuv+iNwZHSzVh30CZ6jNBs418Gy/UpIQ61TcgsjfaoDpXYL2FEh
         4J5xFfqUSpezfIT5f1l4q1MW+QbpIwMg6jxlZHKEyD9o2j78TqK2kEsMu3WZ6Kfa28M6
         FKGPWKu3lIaoi4j/xBb+bb5wbCopert5qfaWvtSfEa/f2f2L7j6ooiRSLpvcOJ3iOimg
         8x7h+rF8VYUZ3VX6G287p0094rwVhRPTBcFfXt8WYn4I011A5zyy+/RdhB+x3fkkZRcq
         0fIQ==
X-Gm-Message-State: AOAM530nFGLjCvoShaJBx4Y3gOXFjtpsGRFO8ZEuh6Cg/v8iflL+YfK7
	Z7Kps2kWTOra+/mYlTm3msMcJIzstncl
X-Google-Smtp-Source: ABdhPJy6HT4kXGiOtOfWQWXFAaVyETsyOVTwJ7QyVelnSzuwjpMmRKsY7ETQn//vN2RvHeQ10Ffaan/HILA5
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
 (user=tzungbi job=sendgmr) by 2002:a17:90b:4c8e:: with SMTP id
 my14mr240462pjb.0.1644382261659; Tue, 08 Feb 2022 20:51:01 -0800 (PST)
Date: Wed,  9 Feb 2022 12:50:34 +0800
In-Reply-To: <20220209045035.380615-1-tzungbi@google.com>
Message-Id: <20220209045035.380615-6-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v2 5/6] platform/chrome: cros_ec: sort header inclusion alphabetically
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"

Sort header inclusion alphabetically.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_ec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index c2105621b368..008dc2fc5066 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -9,12 +9,12 @@
  * battery charging and regulator control, firmware update.
  */
 
-#include <linux/of_platform.h>
 #include <linux/interrupt.h>
-#include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/of_platform.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
+#include <linux/slab.h>
 #include <linux/suspend.h>
 
 #include "cros_ec.h"
-- 
2.35.0.263.gb82422642f-goog

