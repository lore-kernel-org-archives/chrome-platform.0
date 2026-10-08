Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB61C3B1EC0
	for <chrome-platform@lists.linux.dev>; Thu,  8 Oct 2026 17:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480141; cv=none; b=thSZaYtngDS1DpNUH8MAh9qTrAN4X0AQpyhGP4uxho7OyHeOeARX8UD3fkLDMFUZDzla4uV3USA2Y0k4hm4y4VWNOGryV5oob/2Fuolt4W0qUyoxFyEtkOpy57YJvChC06lN44UAytR5X7ogN3nJJLirnbEyXzNbVvo0N0++zxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480141; c=relaxed/simple;
	bh=HotJ/XzsCrodtQ2bbgDaQ9bwihLrz48HD6flurlhPq4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=otda29ak5l5J9bv4abRJZ8oQA70texlZXSdc8IXQeKLGQ5ibDMzusSYJZ+ahYDjO4hRs+H14X+uevIAXLFjZ/Ouz2tHwXrU3AgG7L45i+NdJ44/YsbR+MMkfysJnbHETSM/JEXaT7EyFmH4e/CxvurjoscjZPJLoOXakYGrNESU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--scollyer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EF8/gSTR; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--scollyer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EF8/gSTR"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso10378499eec.1
        for <chrome-platform@lists.linux.dev>; Thu, 08 Oct 2026 10:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791480139; x=1792084939; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M4k06tcFvRAnhumMOE48bxU4Vs2OeJgI9mhm6gdcYrE=;
        b=EF8/gSTRE97uJy4iG6WKNtSfK6ZPh80tIxfpwBpu/Aia0FCPyLqjILXHO0xk5P6jZ+
         VnlNrSrvB+R8r6iU/N997vZjlaDifZZ9NsdI71+dyT6/bOOupQmtr0fT7Mmrp3kY7flE
         uj8tv0HGtbh5OaVVLMcvOu3/Z0KxGetlIHGPuJMgs2stdPpnnaufH4eHC+VsD0eon7h5
         3FSOVVKWr8vQ6bKeyR7yr608iAsUrIjwnFe5tjEgVb5L8C0j75IkTdmCmRLIGJ7BA/fs
         LI3WLEC81CgCPJYurYy1bSeeIYVYvkJQzvQFMOc7P9GhDbMd5aWHy/LPJZzVvQMFHSJr
         VFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480139; x=1792084939;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4k06tcFvRAnhumMOE48bxU4Vs2OeJgI9mhm6gdcYrE=;
        b=DqqhnsNDpb56DmwfYqZ4ClSL+rW8iZSWnVX4/+czJiFMN4JXnHUuRHuoDboQTm9qT2
         4rdwVpk7lp+95nS6VZAAOSxcwBaCmvj1f2Z7Cab5pctZSpi3c5bHoxygNvoSYs9UtDxj
         Wmsa+X8gnkFDF3/CJVNmERZpWNTiJDjJANUPAWUCw+SOqDfnwoMv8tG+Crfz9hgwphRu
         BWK+Np6AORMknkFnxDbbZsm7erDGresl68sXY/V4zFxrKc9+QVJsQuuo0sPY8+0YFoRe
         8fLwrQvaC9WBfhk66Z0xDsArcsh26aj0jXPT9v7QJZbl4VdAlZ/zPYdc3UkuCG/j1upU
         PpYA==
X-Forwarded-Encrypted: i=1; AKwUvByi0AEKYfBG1ZHNWjxu3W3I4MRdJOYaXtekzodLpP4iRPndbp0JhAVxu8ZZlhM6kkDQ1aVJiCMiuvD7yGMoT20=@lists.linux.dev
X-Gm-Message-State: AFq9FYK+e74kxemeXf9VxL688TDLGHt8BITx2Kldiwoefdv7yiWNw8N+
	nsJbvIwfXLq/FRcIwaBNwjMlaTi46NvMzQQEdYvVox64MiKvQFuuTG/VW8rR4itxUJayIill0cN
	DUYohrKPPl3711Q==
X-Received: from dybmd2.prod.google.com ([2002:a05:7301:1802:b0:353:592a:df6f])
 (user=scollyer job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:fd18:b0:351:1ff2:d013 with SMTP id 5a478bee46e88-3515de6b0f6mr6718940eec.37.1791480138489;
 Thu, 08 Oct 2026 10:22:18 -0700 (PDT)
Date: Thu,  8 Oct 2026 10:22:08 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261008172208.1139281-1-scollyer@google.com>
Subject: [PATCH] platform/chrome: cros_ec: trigger kernel_restart on EC_HOST_EVENT_PANIC
From: Scott Collyer <scollyer@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Scott Collyer <scollyer@google.com>
Content-Type: text/plain; charset="UTF-8"

When an attached EC or ISH device reports an EC_HOST_EVENT_PANIC host
event, the EC/ISH subsystem has encountered a fatal exception.

Handle the EC_HOST_EVENT_PANIC event by:
1. Logging an emergency message (dev_emerg) with the device name.
2. Calling the panic notifier chain (panic_notifier).
3. Emitting a uevent (ERROR=PANIC) to userspace.
4. Triggering kernel_restart("CrOS EC Panic") to cleanly restart the AP
   so that panic logs are preserved and collected by crash reporting
   services across reboot.

Signed-off-by: Scott Collyer <scollyer@google.com>
---
 drivers/platform/chrome/cros_ec.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 1da79e3d215b..cee7018a2d7d 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -11,11 +11,13 @@
 
 #include <linux/cleanup.h>
 #include <linux/interrupt.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
+#include <linux/reboot.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
 
@@ -109,8 +111,10 @@ static irqreturn_t cros_ec_irq_handler(int irq, void *data)
  */
 static bool cros_ec_handle_event(struct cros_ec_device *ec_dev)
 {
+	static const char * const panic_env[] = { "ERROR=PANIC", NULL };
 	bool wake_event;
 	bool ec_has_more_events;
+	u32 host_event;
 	int ret;
 
 	ret = cros_ec_get_next_event(ec_dev, &wake_event, &ec_has_more_events);
@@ -123,9 +127,21 @@ static bool cros_ec_handle_event(struct cros_ec_device *ec_dev)
 	if (wake_event && device_may_wakeup(ec_dev->dev))
 		pm_wakeup_event(ec_dev->dev, 0);
 
-	if (ret > 0)
+	if (ret > 0) {
+		if (ec_dev->event_data.event_type == EC_MKBP_EVENT_HOST_EVENT) {
+			host_event = cros_ec_get_host_event(ec_dev);
+			if (host_event & EC_HOST_EVENT_MASK(EC_HOST_EVENT_PANIC)) {
+				dev_emerg(ec_dev->dev, "CrOS EC Panic Reported (%s). Reboot is imminent!\n",
+					  dev_name(ec_dev->dev));
+				blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+				kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE,
+						   (char **)panic_env);
+				kernel_restart("CrOS EC Panic");
+			}
+		}
 		blocking_notifier_call_chain(&ec_dev->event_notifier,
 					     0, ec_dev);
+	}
 
 	return ec_has_more_events;
 }
-- 
2.56.0.385.gd3acb90ef8-goog

