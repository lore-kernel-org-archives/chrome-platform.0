Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B192B23AC
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 08:03:36 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 128-20020a251286000000b0062234a636b0so2647545ybs.16
        for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 00:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=5qzVLz39P8G9OalJ4OG5+jRLXwbeqjg2qWS0xq1akwM=;
        b=Zt68xi5ETqf1AmcUeuq3ib3RwFunxoigHxeX4oruUT1ON8IYS1e5HH57S7oZhXaOsf
         lQUppbLjWJe645AnEI28KBFMw3wGt9d16s8XxdeHG0hgOfa9m0va4ZJsq+OvZrlF8iAE
         k9fg0a5WwdMak8ryMGAL4ruVOC8cZN/fqrcG8Zhv7AbqjpyxzODOHGCSvm5hmqZfhgEF
         SJQtMINdk8NoYNUcLD5VWvmhs2WOofypKOX4l/bFZtbiR0JWHaM1KvYa4LIvq+hnsK02
         FO1fere4I1Z2Oub7t3kwrVCYpZxwUGPnmFcYkZtBG/COKzdtk5R6ul3HMYFrTgB32c1x
         2cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=5qzVLz39P8G9OalJ4OG5+jRLXwbeqjg2qWS0xq1akwM=;
        b=ll+5s/g5zC8Bx4HuluyAaZThKUAxRXIssmA9ZQSFvN8wY0FqJ2qGOinpf9v2MJLMJ3
         L3Cl4nxbEXabSyQgTarLBKzJ3gjXVF4IIXffGVIa/S7jeWZlSqEOodi8haW0vACKR4V4
         oDC+wfRjWX4WuWDwsLnLN6LQ2e6WAPZSfyErop4QYcNs1S8O7fXjHCSunOJwTbwzrB6s
         LC1U6q4+Dp1eS5uk0Blw2QFbDrB4U3ufitN0i9PB7YkYV/aWXVCtBzm7RX+j99+GvOV4
         bT2clq1I8FQl4G2zs48sQvmuKqGWjp6oyHQ3EAsE9vB8w3+LprMGJqK20QIEd/N0x5Yh
         7ZSw==
X-Gm-Message-State: AOAM533g6JB6idXaYlRr73bmXb5aZEaNixtJexnP/7TGXYDKvSvozJSy
	E/yT7vooii9TqRmu8fGDdZyAQJGJZucw
X-Google-Smtp-Source: ABdhPJxuoL+5eeFURcGTKeIxlEdvNBxd1Inw7r0oDhOhJ1nc7+k4RTjtYrDB9xE1YHMUHY0ThoqlAGBTkHgf
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
 (user=tzungbi job=sendgmr) by 2002:a25:68cd:0:b0:619:8e35:2c3d with SMTP id
 d196-20020a2568cd000000b006198e352c3dmr1133711ybc.266.1644998615855; Wed, 16
 Feb 2022 00:03:35 -0800 (PST)
Date: Wed, 16 Feb 2022 16:03:05 +0800
In-Reply-To: <20220216080306.3864163-1-tzungbi@google.com>
Message-Id: <20220216080306.3864163-5-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220216080306.3864163-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v5 4/5] platform/chrome: cros_ec: sort header inclusion alphabetically
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, pmalani@chromium.org, tzungbi@google.com, 
	linux-kernel@vger.kernel.org, Guenter Roeck <groeck@google.com>
Content-Type: text/plain; charset="UTF-8"

Sort header inclusion alphabetically.

Reviewed-by: Guenter Roeck <groeck@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
No changes from v4.

Changes from v3:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220209095703.517608-6-tzungbi@google.com/)
- Add R-b tags.

No changes from v2.

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit message.

 drivers/platform/chrome/cros_ec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index a013fbceeb03..1e1a24a80d9f 100644
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
2.35.1.265.g69c8d7142f-goog

