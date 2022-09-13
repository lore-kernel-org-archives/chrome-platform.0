Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA4670C
	for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 20:50:06 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id q22-20020a62e116000000b005428fb66124so4999044pfh.16
        for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 13:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=gy3bDNBw7VQytEVRKZxZzrTdbmTEWTGJEIGOvnabvxo=;
        b=MsIiTEcp0YKQ0q29PXoqrtM0XP78eU5bv/HJl7x4HzGd9dYG0kP/f4qqYx2Y6uYzoY
         5AbqkdzAhgmKSpUJxqX0Q+2TINrtybI03WTeO7PPJEGii/QTaZPDWNWQbAkVG95RwPxB
         pNN5fdf9XUlqBU+ojPKKznCDDWpTgI8Chdp4jSTdCqxUXMjg3thI+7oHCwp5cr2s42XR
         4xvMKpMA+jtmz13XBoq2KVAa5idLwm0OukMDv5oHBwTOKinPYoaO5/4ByCwSs7+hzZ3T
         9f2ehaWXoSF7eO5bHu8RzEEVC8UKYS0C6dcN5EyzxI7kEZEIN+IQvo43BkWd72iPNzjB
         RZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=gy3bDNBw7VQytEVRKZxZzrTdbmTEWTGJEIGOvnabvxo=;
        b=Ed31cFNiMOmYaDOil469uLixekvyK3BlKMBYhDOPDvTyrxYjlW6q+yv17L/iYtaBqx
         yvCHFen++QLNTRjfUSkmnTlo3r1jc/Q+8YiUnqGVOffNPQRmvRRM9xHhpB0QMEzlteXF
         GmwluoHabkBybWKT5dkP6v3TO47cdsqOnJF/OIT6t/ub3KLfW6j43QThPxTH8OfE+fvN
         +CvXhZpnaH+2l9cSf3NqcrTKgVrXb7vtyB/LhFk/7ejzvowp1znYiMgG34jIOwIa2mEe
         qktFJ8/H8Y7XiFRnxTx4qgZOBvksqI3dqRLyM9MX3ydj3b/Z3404wrzGSeEcQVj+lrBr
         w8RQ==
X-Gm-Message-State: ACgBeo27Pn32wFqW5iTLRnR3Edjfi1GLIPe9YcJkZcyajElCM4I4Kedx
	lkZ9Ug3NGEWdZ3GWUUeBHsBbcGPZ5E+B5ebKnTgPPBB1tHlyKt+QOj4zzslQsK2k3/GHnzoqNl9
	frbuzACe++7nWVjjzuA6qSLDHLl4NJiEMBxIZwkrh0IImymbgkpUIzrBPmfKekWjsgv1TXRbg7w
	==
X-Google-Smtp-Source: AA6agR7qXuSHYsLoYdDFCEwxGLsUWKVrpzzkU4qHYq5nHGq6bSMKbnk8HCDo45F5/DCYdGcKhlMvvmxiEd0=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3f85])
 (user=jthies job=sendgmr) by 2002:a05:6a00:1892:b0:540:acee:29e8 with SMTP id
 x18-20020a056a00189200b00540acee29e8mr27129067pfh.1.1663102206357; Tue, 13
 Sep 2022 13:50:06 -0700 (PDT)
Date: Tue, 13 Sep 2022 20:49:54 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913204954.2931042-1-jthies@google.com>
Subject: [PATCH v4] platform/chrome: cros_ec: Notify the PM of wake events
 during resume
From: Jameson Thies <jthies@google.com>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, pmalani@chromium.org, bleung@chromium.org, 
	groeck@chromium.org, tzungbi@kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

cros_ec_handle_event in the cros_ec driver can notify the PM of wake
events. When a device is suspended, cros_ec_handle_event will not check
MKBP events. Instead, received MKBP events are checked during resume by
cros_ec_report_events_during_suspend. But
cros_ec_report_events_during_suspend cannot notify the PM if received
events are wake events, causing wake events to not be reported if
received while the device is suspended.

Update cros_ec_report_events_during_suspend to notify the PM of wake
events during resume by calling pm_wakeup_event.

Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
---

Changes since v1:
- Updated wording in commit message from "Log" to "Notify PM of".

Changes since v2:
- Removed Reviewed-by tag and provided more context for the update in
  the commit message.

Changes since v3:
- Added reviewers back into commit message.
---
 drivers/platform/chrome/cros_ec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 8aace50d446d..110df0fd4b00 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -349,10 +349,16 @@ EXPORT_SYMBOL(cros_ec_suspend);
 
 static void cros_ec_report_events_during_suspend(struct cros_ec_device *ec_dev)
 {
+	bool wake_event;
+
 	while (ec_dev->mkbp_event_supported &&
-	       cros_ec_get_next_event(ec_dev, NULL, NULL) > 0)
+	       cros_ec_get_next_event(ec_dev, &wake_event, NULL) > 0) {
 		blocking_notifier_call_chain(&ec_dev->event_notifier,
 					     1, ec_dev);
+
+		if (wake_event && device_may_wakeup(ec_dev->dev))
+			pm_wakeup_event(ec_dev->dev, 0);
+	}
 }
 
 /**
-- 
2.37.2.789.g6183377224-goog

