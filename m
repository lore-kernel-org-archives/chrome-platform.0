Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052DE29CA
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:57:15 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id q11-20020a252a0b000000b0061e240c8fb3so79605ybq.22
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=JvULB6LG4OVJvYKRyYDkOucqyqSMXIuDjjLj+Rq8spQ=;
        b=Bw4eJyd7KJoXVt+EiaG0Xa52r1vTzXbZ/GRr8BO0GfPO5h6T/BjFCXXj27QF+/hsI0
         IZYeqSdVCGUHTvzBn4k9lb07vjWM5kG4xSRxsSyrNvs3IRrpl9iMNX6nXWqOE0f2JovM
         OSM2vnHHlotLF/hJO4VDf3svVWskXCsjEyMa02YRWuZ0NdS+WOfuK7l2suRkMaw3dkZd
         MOkPv23occyLoexGt4412FjvU2q6Udp0EWUejPpR7RJpheWAU7esT4hI4P1kqwX6CYk2
         3p13PaspOhyMDYScsLA8FWEMGjq/DlupPZ/3WddQxKHx7LCywAjpjL2eM7r9x7La+Ms6
         5r9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JvULB6LG4OVJvYKRyYDkOucqyqSMXIuDjjLj+Rq8spQ=;
        b=U5bCMu6yY3nBm4qf1yvNlQRyodyF7AwYJGhGvLnzp2fK1+9BM+So7RUMJdBYA4ymEt
         WJoZClBG87S7NA3yPQGEHJX18UCHKQd8sOb6O1bvbl0X+V4jI9P222M/c47xVFgKpX68
         vo83/dTvmG43cV4l8+ssTE/OVIelhP/aypheC9qOYuQBD0rLJ3MWW0zxL/WAqVJsfRfR
         kY5nVj1NLo1sGhEzAGQOYVUAgfDb0ouFRMc3hsMsLfLqty7GccqKsJAzWVHrrnv7s+8I
         nGD61rFpaBLMGkOSXvRC1NAFUmTx4hymsbVco7/iY6YwXfzbQMlRyNf35W8hY+CIRpQb
         xqfw==
X-Gm-Message-State: AOAM532skVc5E2M4Uepc9KetewLff8AaYuwlu7Jcil+FmpQOaDCut4E6
	HjcrG8LmP8xIkIdu2hHQluOnAcqH0iiU
X-Google-Smtp-Source: ABdhPJxrw25aqvwm55A0ykiMxJjW6ZuYkjFM3h+srhyA0NfV32vG3PZAK6hUYXqQNv4uaBh/mOTVVvcs6MbQ
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
 (user=tzungbi job=sendgmr) by 2002:a81:e405:: with SMTP id
 r5mr1367498ywl.428.1644400635110; Wed, 09 Feb 2022 01:57:15 -0800 (PST)
Date: Wed,  9 Feb 2022 17:56:58 +0800
In-Reply-To: <20220209095703.517608-1-tzungbi@google.com>
Message-Id: <20220209095703.517608-2-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209095703.517608-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v3 1/6] platform/chrome: cros_ec: fix error handling in cros_ec_register()
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"

Fix cros_ec_register() to unregister platform devices if
blocking_notifier_chain_register() fails.

Also use the single exit path to handle the platform device
unregistration.

Fixes: 42cd0ab476e2 ("platform/chrome: cros_ec: Query EC protocol version if EC transitions between RO/RW")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v2:
(https://patchwork.kernel.org/project/chrome-platform/patch/20220209045035.380615-2-tzungbi@google.com/)
- Fix grammar error in commit message.
- Change the code that don't rely on zeroed memory.
- Remove unnecessary `if` checks before calling platform_device_unregister().

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit message.
- Use IS_ERR_OR_NULL() in 1st patch.

 drivers/platform/chrome/cros_ec.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index fc5aa1525d13..15f599d721a1 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -245,18 +245,16 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		if (IS_ERR(ec_dev->pd)) {
 			dev_err(ec_dev->dev,
 				"Failed to create CrOS PD platform device\n");
-			platform_device_unregister(ec_dev->ec);
-			return PTR_ERR(ec_dev->pd);
+			err = PTR_ERR(ec_dev->pd);
+			goto exit;
 		}
 	}
 
 	if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
 		err = devm_of_platform_populate(dev);
 		if (err) {
-			platform_device_unregister(ec_dev->pd);
-			platform_device_unregister(ec_dev->ec);
 			dev_err(dev, "Failed to register sub-devices\n");
-			return err;
+			goto exit;
 		}
 	}
 
@@ -278,7 +276,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		err = blocking_notifier_chain_register(&ec_dev->event_notifier,
 						      &ec_dev->notifier_ready);
 		if (err)
-			return err;
+			goto exit;
 	}
 
 	dev_info(dev, "Chrome EC device registered\n");
@@ -291,6 +289,11 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 		cros_ec_irq_thread(0, ec_dev);
 
 	return 0;
+exit:
+	if (ec_dev->max_passthru)
+		platform_device_unregister(ec_dev->pd);
+	platform_device_unregister(ec_dev->ec);
+	return err;
 }
 EXPORT_SYMBOL(cros_ec_register);
 
-- 
2.35.0.263.gb82422642f-goog

