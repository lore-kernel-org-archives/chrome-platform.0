Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0637F
	for <chrome-platform@lists.linux.dev>; Wed,  4 Jan 2023 01:15:30 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id g32-20020a635660000000b00478c21b8095so14687206pgm.10
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 17:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f9rrPHtsDc664z8TlUhfeZ6o7/ZdnXcwK2CIJxHNuXg=;
        b=lRbVHoFQeHjsrzoHSmWlciMBX0cP/lBE/dgu3vX7qZ+C6TtDOl1WXGf1EO6iOIFWvG
         CRNkt1xKVWral6U8KW+RYgoS1G3Pv5DaUYpKG0blqxPtaaaf6nVxiZKrXcSeUx0A0abL
         G8+UhncS76rk/5fXhKI5d+LNkzg9eARkJ+47lSatGGZKl+rGjYETyC/EsDVxLEU7BfAL
         hUgEQSDc+uRXWpr3EQltY0jbZb4jgx1mJVLdmY8r8VO42Pa4eKs3RbyfWny54L9Bjjke
         ibqy8svP21PduGY0TidtzmTYEcsGY4bTEOfcabj8x+ZbxZvHQL7swEkRB0u4GYeRt8kp
         ySOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9rrPHtsDc664z8TlUhfeZ6o7/ZdnXcwK2CIJxHNuXg=;
        b=5cqtMuElVHlJicK5iAUCzX7rpNStMEudHVgVM44SHIPbwcmHpC1jLzANjRwJ5+YsXH
         XOsHG+v967urN4CoojAWptDLc/b6jNOt9SblTfA1I1wRFNJemLRQAOs2HDZZFvQDb4hM
         BaxhnMrOmpSN+MCK8nv1vlSjamh5Ntc9DlZVLzxm5ANS9P0O44DQhTPSp9yyHzfVLq6M
         E3Z9f5IWv8PETuqhwL8pdmi/a9m/O6fNqZ4gdaiLzzIYuntVDua2/tQtcu36a5mdIEdg
         ekIKKmjvT3UxVslI5rzynfoavdAwqanpZWv5fycVFlXbO8uWbi1S6Gaa4CEra7yf5rON
         ktSQ==
X-Gm-Message-State: AFqh2koIVOaUqzexDzUH4u3kqyIZeB5PuKC8dKDTtavmtFgGF9/6H94W
	zZjrky2xN1ojp/UubU2AOnkU/RICklzyhsQ=
X-Google-Smtp-Source: AMrXdXtxmw9aguwDjJUz2htfsETgY4/yJbUjCtMyJXjunBRVCVyRNyKHSYsD8vefQjOZW6BtGbFgSctk+4wUdjk=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a62:6003:0:b0:575:e44e:3e0 with SMTP id
 u3-20020a626003000000b00575e44e03e0mr3301718pfb.53.1672794930240; Tue, 03 Jan
 2023 17:15:30 -0800 (PST)
Date: Wed,  4 Jan 2023 01:15:24 +0000
In-Reply-To: <20230104011524.369764-1-robbarnes@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230104011524.369764-1-robbarnes@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230104011524.369764-3-robbarnes@google.com>
Subject: [PATCH v3 2/2] platform/chrome: cros_ec: Shutdown on EC Panic
From: Rob Barnes <robbarnes@google.com>
To: groeck@chromium.org, pmalani@chromium.org
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dtor@chromium.org, Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

When an EC panic is reported, attempt an orderly shutdown.
Force a shutdown after a brief timeout if the orderly shutdown
fails for any reason.

Using the common hw_protection_shutdown utility function since
an EC panic has the potential to cause hw damage.

This is all best effort. EC should also force a hard reset after a
short timeout.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---

Changelog since v1:
- Split into two patches

 drivers/platform/chrome/cros_ec_lpc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index 5738f1d25091..3708fa75feb1 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -21,6 +21,7 @@
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
+#include <linux/reboot.h>
 #include <linux/suspend.h>
 
 #include "cros_ec.h"
@@ -323,6 +324,8 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 	if (value == ACPI_NOTIFY_CROS_EC_PANIC) {
 		dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown is imminent!");
 		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+		/* Begin orderly shutdown. Force shutdown after 1 second. */
+		hw_protection_shutdown("CrOS EC Panic", 1000);
 		/* Do not query for other events after a panic is reported */
 		return;
 	}
-- 
2.39.0.314.g84b9a713c41-goog

