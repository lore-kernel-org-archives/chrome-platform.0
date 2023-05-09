Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A61991F
	for <chrome-platform@lists.linux.dev>; Tue,  9 May 2023 22:22:05 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-b9a7766d220so8117457276.2
        for <chrome-platform@lists.linux.dev>; Tue, 09 May 2023 15:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683670924; x=1686262924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5/wqQil+OG5LgPV5aW4IuNWJlumZUBT5olCnKryFix4=;
        b=uk/uhrCC4388CU0HTwGNP0sfPXbJnQ6+xRWOj/ZsgB+6atv84BliKcC9nwioferjfO
         LYlcc1tS2VH1mNx8nI4L+w///TxYsxAq+RAGdWKgIkzVmqWwGAlSA2PDU/LEQawxsCSD
         AdOKRiFMUuFehcMHkhwJdz6oN+HsZSGGs4MHIL1o3qpTPohGJz06hagoLRn9SNCA4ZTI
         FZ9lhc/p7Rk1NGuRFgdLKb7sB3XsZJShF8fbReYhMkEe+1jhWbgHy8HfxSq8h/tznCWw
         vGLC+n5b5VU+OHNypDeDsBFQ4688b9QaLTB81lwL8mHBrqe8RQVX8HQvSQKIZa1yllZx
         gBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683670924; x=1686262924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/wqQil+OG5LgPV5aW4IuNWJlumZUBT5olCnKryFix4=;
        b=XAfOdbr5VWHsnX6jHLI/rkvG928hqTAj+FnNAQV0PU9NzZ/exJIHy7nU14nIXUxTee
         1/FcobHdIZO8WkJAxjLpfgmJ69ApYFK5Dl4eBQepDD25Lc+LP3cIvN3zurFaD/nmZWZg
         +QHhcbnTAp9+T2yRDdWcRsG+sw3XZctQ7i44mhS0N4Iox+GbskRYCUouri798TIetBK3
         9XNmOgUmdDvAm3DGrpjD24TnzGUyT+xpOuJLpDcV2Jhe5Xi6m0/zFuSXwRER7mRX7gGl
         ehtN0bTqeXsd1Ol7ZBR49zPJ/mZ1fiOqlMF8Hapxuem4x2fewZw4QKT3dsQvlV2ZfWNK
         lILg==
X-Gm-Message-State: AC+VfDxqbeccjEWu68PKdXWLLyVXRlCv/9Ky/5u9ijeWpF5C+ftgfS+R
	suHftg3ME9PiVKq4n8mD04YCHWIk3BH/2fpA6dafKkfAHipH74ZUm1K61kMgKPC6R1HbqO82nHn
	lZpkFq0qxCmrP05CoL4eUeFxS1qt2J9k/ugnBw5N2foMOZ6OjnWhoMAUiJSHToKOo24JUezZ9qK
	pL4VhdgA==
X-Google-Smtp-Source: ACHHUZ6A5S/1/edS1QlifPisWbAg3tMO//ilASixmRa4If7quotBHRjD+ujgFUEuati00S7a7pk7MdYooxFlI1o=
X-Received: from robbarnes3.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6451])
 (user=robbarnes job=sendgmr) by 2002:a05:6902:11c9:b0:b9d:ed0f:b9db with SMTP
 id n9-20020a05690211c900b00b9ded0fb9dbmr9851205ybu.6.1683670924490; Tue, 09
 May 2023 15:22:04 -0700 (PDT)
Date: Tue,  9 May 2023 22:22:01 +0000
In-Reply-To: <CA+Dqm32q5oDiHgAFQzMi12H-hd+f=v-NL6F5Bx9r2Jh6THNZrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CA+Dqm32q5oDiHgAFQzMi12H-hd+f=v-NL6F5Bx9r2Jh6THNZrw@mail.gmail.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230509222201.3013970-1-robbarnes@google.com>
Subject: [PATCH v2] platform/chrome: cros_ec: Report EC panic as uevent
From: Rob Barnes <robbarnes@google.com>
To: chrome-platform@lists.linux.dev
Cc: dnojiri@chromium.org, tzungbi@kernel.org, pmalani@chromium.org, 
	Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

Create a uevent when an EC panic is detected. This will allow udev rules
to trigger when a panic occurs. E.g. a udev rule could be added to
capture an EC coredump. This approach avoids the need to stuff all the
processing into the driver.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---
Changlog since v1:
- Inline uevent call

 drivers/platform/chrome/cros_ec_lpc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index b399f7cbf17be..fbce9898dc7e1 100644
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
@@ -322,8 +323,11 @@ static void cros_ec_lpc_acpi_notify(acpi_handle device, u32 value, void *data)
 	ec_dev->last_event_time = cros_ec_get_time_ns();
 
 	if (value == ACPI_NOTIFY_CROS_EC_PANIC) {
+		static const char *env[] = { "ERROR=PANIC", NULL };
 		dev_emerg(ec_dev->dev, "CrOS EC Panic Reported. Shutdown is imminent!");
 		blocking_notifier_call_chain(&ec_dev->panic_notifier, 0, ec_dev);
+		/* Publish uevent for userspace handlers */
+		kobject_uevent_env(&ec_dev->dev->kobj, KOBJ_CHANGE, (char **)env);
 		/* Begin orderly shutdown. Force shutdown after 1 second. */
 		hw_protection_shutdown("CrOS EC Panic", 1000);
 		/* Do not query for other events after a panic is reported */
-- 
2.39.2

