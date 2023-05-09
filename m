Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444171990C
	for <chrome-platform@lists.linux.dev>; Tue,  9 May 2023 23:27:08 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-b9a776a5eb2so14784717276.0
        for <chrome-platform@lists.linux.dev>; Tue, 09 May 2023 16:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683674827; x=1686266827;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V+fD8linTA0LSh+JVF5ahtjgp06ow0gHxNPgRSr24DM=;
        b=TVsOmthLReq2QzBO5w2yLIoPZoFDlcVjUUOwqwDGDd9C/AreH4nRy0rFJ9OW6jP5el
         NMYqC/va2BVYCsMKgH/FItcug+IqQANr0pL+jZOxxKneLGcRUgLVA7YNBVrcOFS1T0Ti
         ahg5Sn9ERTi/6aklC9mxpRi0sIRrw6Gf/rkfLAftNjkDFkpps5joxJgSp7l3AiGRmYXf
         7kd3KG/Xl/4TMee9R+xRlr9zIxgmLBUvYxdnzK4np2Pj/fIMYcEILYRa6DcnzZcyWlYX
         fEKqq5fsVrA0XPu/i5sb3nLkpnIYPg/BPwL9/KII9xb+B+OBIAXWkXXLYQQNv+h+r+sb
         Isnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683674827; x=1686266827;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+fD8linTA0LSh+JVF5ahtjgp06ow0gHxNPgRSr24DM=;
        b=GGtKr6lbBH5aVQ+/2z8I4BTgnfGIwfMpeneFiUKUmSwjYkPqREfqYOwRXPj01jJ3LL
         3WdHrd86+wkSnSsbS2zSXNUCXQWLzJVmVJrrYX7QVcFqs4OEBZz9Mn0PSzB2mxehT2AJ
         YBQ5rgsDOrVU129Dfq17oLMMbCTE84vawwgkhr28xYeKKcAhIJWArJfZLZ4yJbR0greU
         5zrjo179Mf3Cl63xmIHA2kM6MA3RFzoK7RIKQfRtSfF8DrFGJ4lamyoS9PBhaz5QD6gZ
         F+c5PeNcXrnn73e1Z7G1YALhj7tceDlLXjaVtkfSsEGA+aR0+z9Fv+ES6nqNmxglA/Xw
         ZbDQ==
X-Gm-Message-State: AC+VfDwSUUIKKlPu+LD87RVcv4k0S5XKs3WYcpER7H8H/J/SbD8K6jZp
	oMaAXVuc+aRzvXiZ3aPxGxSM5rwJ+ghn7tjC4YIeWsAU/6lRxDEL9nE8WGM5KE2wFlBtYhBwQtD
	M9zIr12lhMlbGlb6TAPIyctTwfVl9S80pfIt+Q3JIvOp8f3B8G4RAuvH/RloEE69GraM9sqEQ6K
	qE4xM0ew==
X-Google-Smtp-Source: ACHHUZ5NiR4hK64z+DPhO4gYiEZ4FzgzMXwHmzwBBgpXq40v75PNAvpg+KEUFFuH+UIs1GUj6FKQ4kdvFvf0M6s=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a05:6902:188c:b0:b96:a18:1b4c with SMTP
 id cj12-20020a056902188c00b00b960a181b4cmr7370644ybb.13.1683674827228; Tue,
 09 May 2023 16:27:07 -0700 (PDT)
Date: Tue,  9 May 2023 23:26:24 +0000
In-Reply-To: <20230509231906.3118230-1-robbarnes@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230509231906.3118230-1-robbarnes@google.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230509232624.3120347-1-robbarnes@google.com>
Subject: [PATCH v4] platform/chrome: cros_ec: Report EC panic as uevent
From: Rob Barnes <robbarnes@google.com>
To: chrome-platform@lists.linux.dev
Cc: dnojiri@chromium.org, tzungbi@kernel.org, pmalani@chromium.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Create a uevent when an EC panic is detected. This will allow udev rules
to trigger when a panic occurs. For example, a udev rule could be added to
capture an EC coredump. This approach avoids the need to stuff all the
processing into the driver.

Signed-off-by: Rob Barnes <robbarnes@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>

---
Changelog since v3:
- Fix typos in commit message

Changelog since v2:
- Move variable declaration to top of function

Changelog since v1:
- Inline uevent call

drivers/platform/chrome/cros_ec_lpc.c | 3 +++
1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index b399f7cbf17be..c6920df1e95dd 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -16,6 +16,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
+#include <linux/kobject.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -315,6 +316,7 @@ static int cros_ec_lpc_readmem(struct cros_ec_device *ec, unsigned int offset,
 
 static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 {
+	static const char *env[] = { "ERROR=PANIC", NULL };
 	struct cros_ec_device *ec_dev = data;
 	bool ec_has_more_events;
 	int ret;
@@ -324,6 +326,7 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 	if (value == ACPI_NOTIFY_CROS_EC_PANIC) {
 		dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown is imminent!");
 		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+		kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char **)env);
 		/* Begin orderly shutdown. Force shutdown after 1 second. */
 		hw_protection_shutdown("CrOS EC Panic", 1000);
 		/* Do not query for other events after a panic is reported */
-- 
2.39.2

