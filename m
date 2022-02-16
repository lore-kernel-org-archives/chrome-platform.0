Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3C01B69
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 04:37:08 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id s11-20020a255e0b000000b0062277953037so1782094ybb.21
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 20:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=OKBUHG1lRWv0hIHjB+K86/IQNwkPb8MQNKlRJE3S5/M=;
        b=VUKQadDEbJa7NbTRkkm9nXOiw5f7n4c/vBTT4/HCJWwWVQPU0Hjj5/WouVFgkdx5r0
         5HaPzh3tug4Nku+8HqNjqBnLZItmom14x7t1m6cm4N0zVIgXoKyRrluJCmlSMKeqD/UK
         Za0giSQCOFnj+d6ofgO3QQVjdR+6tDdSU8xbQLEZ+Symgkh1gEcRuoNrkMxTUY1UIuWF
         MatIw38UqS1LYMThe7hED4+dLLc5p+CSgkFORU/SiXdNOewheb0cvViesjOGgoxcTlgO
         VAFKdNQRjz6+JUmG0cYis3eP8Nnwwxr4ZALSNHtrNuzM09shesfSvxvSGF39jKC0uDVj
         B+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=OKBUHG1lRWv0hIHjB+K86/IQNwkPb8MQNKlRJE3S5/M=;
        b=H064IKjIM25YMT9Tasuya1eQtZNJaDLQmE5O/oUklRD0OmBqRyAeDVsOFB8NNnvI1X
         y3jFogGkr8aFj6s2kFGDQxsNcLNBuK4+w17hKF+/16rdcyZAnarmXUlAsXoyXIx9Swow
         OluHg0N/KV2cLr5ruRSJN/m5YQ7fcYE/kYCylNvoLMETIdgtrpYWTI2X5M4a8uRyXxTB
         2uMKELKJ0F2Er4/a7abVtohGAyxZ+Y+FB4vYpRsPVUg+ul2EBAzM39pQ8YsFTpJFkmUU
         oJuY18k0wAj4oQHEQcURyaAbPz3yX4jDltpB0f6b44P4RioI08BPmtsh1YkxF+0UDwMh
         ZO4w==
X-Gm-Message-State: AOAM531S332+dWL1X3jl53o1w1LSfci78zP8Sm1aJS6r+8Nes/XC+dYt
	VHcscDUBeu3Co/ysbikIjBujlPvqt2j9
X-Google-Smtp-Source: ABdhPJzsgKkCNM0CwKrs5c/H0XxeTDPiDod5RuJfAv1iM/iFm/zfXxW9uh5NrhHf0S5CbIQ38ur+wObnWL3B
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
 (user=tzungbi job=sendgmr) by 2002:a81:49c8:0:b0:2d0:ad27:5be5 with SMTP id
 w191-20020a8149c8000000b002d0ad275be5mr895168ywa.27.1644986227331; Tue, 15
 Feb 2022 20:37:07 -0800 (PST)
Date: Wed, 16 Feb 2022 12:36:38 +0800
In-Reply-To: <20220216043639.3839185-1-tzungbi@google.com>
Message-Id: <20220216043639.3839185-5-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220216043639.3839185-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [PATCH v4 4/5] platform/chrome: cros_ec: sort header inclusion alphabetically
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org, 
	linux-kernel@vger.kernel.org, Guenter Roeck <groeck@google.com>
Content-Type: text/plain; charset="UTF-8"

Sort header inclusion alphabetically.

Reviewed-by: Guenter Roeck <groeck@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
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
index b6604a9ab315..a3921fe5813a 100644
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

