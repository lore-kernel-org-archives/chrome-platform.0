Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13002C80
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:57:31 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id gj12-20020a17090b108c00b001b89b5f3dd4so3495860pjb.6
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Dlw6zYxPk62QBxL93j+QBRqUzy/6DWY+PNzSwlT4tDU=;
        b=eJLEwFslJwUR1juU6MndzWRZLcz5rVv/AVv5CwdE3t1LBnVphGjmOZt1qnt7WM3//g
         JLYBCA7bOIxKhb+oKCP9ZkuJqEIG28KfogCmmxNKvr2xPF6LxMuM10Si8W+kqiZPmL6x
         SqQFd2kDs86lguLP+Yyelk8g+EOTbpQTWX+voPxkVaAgpK/ODPIXYlIDAiUgkLVf1c3/
         295o682L2ZwVW8gltOqCf4Aeq+81298BKqRju2gPFan3M7bGKHeQgCUX8ECOvgclqTOb
         JN/Tx3CtDNx6n4N5RAYbpFblO4DhGvlrlTVRGM4XO1pvEf67haedjxmhwVPBc4IOhcpy
         BQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Dlw6zYxPk62QBxL93j+QBRqUzy/6DWY+PNzSwlT4tDU=;
        b=ppXObUN7w+O1IiXVdOpk7Zg23pLnc4oFfLAEV06a5pRXn0DIw6YIZNYLISwRGBmcD8
         d5m3pQjHynMFL76i1ByF0F4LL3s5jk9An8eQlLtsQH0CCYCzTQvx8RnCsvOtzc8Ridqr
         xmN1G6zizT+HGtLR/MkHfv2tIGeaNco902Q56nEJqzxqjI3gU9eeIhsL+jYE62lKddMi
         3NPEXvYy0sRgOqGl+/BAjwzw2AvuVX99yFZCQ31VfAiRIZOB4O26x5mUCZJQHQvh4b0b
         Qc0Pnak2mD0XqqfTLibUwQVLHe+E0v6+IKx+c0w/v/rmiX2T4ZgUe0Whom8rA44M7NOI
         gg/w==
X-Gm-Message-State: AOAM533PzueMzc0ROfRGi5jgqXbcfjv5EgaTXRE7baN9BybMmKwxtq27
	T+wl9uD+ibGD4E8M4Xd9wBmFKSk0A8/s
X-Google-Smtp-Source: ABdhPJyBMZkH7GJpzRQh9H502XZ48l6fApcBU86LktWp4sCO/l37uSK7ZUmo+BWyifBzCrljc5tN285XDlp5
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
 (user=tzungbi job=sendgmr) by 2002:a17:90b:4c8e:: with SMTP id
 my14mr340888pjb.0.1644400651220; Wed, 09 Feb 2022 01:57:31 -0800 (PST)
Date: Wed,  9 Feb 2022 17:57:02 +0800
In-Reply-To: <20220209095703.517608-1-tzungbi@google.com>
Message-Id: <20220209095703.517608-6-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209095703.517608-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v3 5/6] platform/chrome: cros_ec: sort header inclusion alphabetically
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"

Sort header inclusion alphabetically.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
No changes from v2.

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit message.

 drivers/platform/chrome/cros_ec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 618b8b4c42ef..2c4e81f3fef9 100644
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

