Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598AB3C10
	for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 14:55:55 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id i11-20020a170902c94b00b001783ad0266eso3401726pla.22
        for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=cvJEnjTXhlWXDO7hFwpFHy53bcFzxR1mBtrl5AKvvps=;
        b=WHm/6D6ARpjPd/cEbWmZhCHS72PbANzTsxUSf4b7+nXr0kutRzr1TG9ZvI3Q6Ew4+o
         u4s4MgKcwejHN7wZz8QQVfM9DQth2kxFo/ZTeq/tlj+C5PQvu95GeX4lwVY/CXiW0vJk
         qKVS/u7l2clyrLlZMmpvEet2bARk8XwGjuGCEKViLqObSeBODiTFGzUpOGUKmPBQ3Bki
         6IFQEEUUbFx4rKoBQ+TYhiI+kaKogJCOTlguWFiGNeid0wD2bzzYu26osGPZs8HgIsdK
         mH6Kjdbjt7Bh0tZN1aU8D42KudrleRawLRywmhFwFZCOIwO8QFSA9s+e8/kgQLKyzdMN
         A1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=cvJEnjTXhlWXDO7hFwpFHy53bcFzxR1mBtrl5AKvvps=;
        b=zpe0nNflBtLZgLOYn7LSiu0u46KV0os89SlD2S6KXgookU8yx/YeZBGreanZBZHyvP
         lQUnFPw52YHy5BITEF0HFvNkzYRG+KrU3eSi02rSdEyaM/JPFvv1vJ2XxIdlly2iQCvH
         ih3951vaVkHU4Xu3hTdVQtn8xQE377s7U7My6TwvtcNmoD2K3d5/RUqrGJBv5UsB5nIC
         EtuS2Bj8VZ/+MTsayxlqU7Z+IPywCA+fo4I4pWkIRfIBrqRlYpsX0d5smjnnkVp4F9hn
         ZmnSvDOh/G1NxxD7PTooY/glEhUmP5BA2LTZWSmS13+D7U2HxgigWtMruqzGyD+NsCxJ
         TaFA==
X-Gm-Message-State: ACgBeo0Robz0Ugx1qiJsvITQSIBuNt2ujcjBs4N8frbzMww+g7llVk3P
	9eIiuiCSblUUEZQfnY6q0eIDpbtrW2BR8ghhHJ6Ryl/X7yKNjnslrZzDPJxmJoq25kwFaXxjCJm
	1PElmNWnuCoWOG+TtDrSv6NF+lQY+ty2nGLdYbomR6gbLtc3/Th367cAGFYA41Jk1TKOe8JcN7g
	==
X-Google-Smtp-Source: AA6agR7fODZawl72r3SMpSlBhegJYwwMxyYRozj9aUC7ch9LdPpMMVnRzuFBzMmDU2bRbz5cy4mtdWyADpE=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3f85])
 (user=jthies job=sendgmr) by 2002:aa7:9d9a:0:b0:53e:8bc5:afb7 with SMTP id
 f26-20020aa79d9a000000b0053e8bc5afb7mr30628956pfq.54.1663080954632; Tue, 13
 Sep 2022 07:55:54 -0700 (PDT)
Date: Tue, 13 Sep 2022 14:55:49 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913145549.2839948-1-jthies@google.com>
Subject: [PATCH v3] platform/chrome: cros_ec: Notify the PM of wake events
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
---

Changes since v1:
- Updated wording in commit message from "Log" to "Notify PM of".

Changes since v2:
- Removed Reviewed-by tag and provided more context for the update in
  the commit message.
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

