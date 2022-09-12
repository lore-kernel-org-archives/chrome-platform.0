Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50F166E0
	for <chrome-platform@lists.linux.dev>; Mon, 12 Sep 2022 22:48:42 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id j11-20020a056a00234b00b005415b511595so4449896pfj.12
        for <chrome-platform@lists.linux.dev>; Mon, 12 Sep 2022 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=69eqzQldLaAKRphbYvjKq9UwxC3qVyQ1BnuwXpOP90k=;
        b=SmME0BoRudH8DEJT4v4/zsZ3xWJOz30HsCdv6NK/gwQLgnwxaE20doDBhiq1uGrL/Q
         n/AFLvKj7G5Qkcm4WCvGz9AExc2p38QVLZAsgZ/Uxgz4wzUuEDlgtEuQ8lFt7midKBbM
         53T4PwLEP5Q1mr0miEpX2RrlDptWi8e3bFLCz0I00ei2+lfbCV3hqYsImIfvPBIqSWpC
         nAt9f86oKWbs9ruvNhLnhXuQsJervZtGPvEA7Evq3/d1kEWzCwRJwe4kjsmf+R8FKawQ
         K5s/ABkk1n77LzD6wp633Hq6RfNJTCaxU/nEjRGusnm9um5co6dbyWJNO/fNEJ94FBrq
         zm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=69eqzQldLaAKRphbYvjKq9UwxC3qVyQ1BnuwXpOP90k=;
        b=0p0oLSouzbdR0aREl/9GqCP6/BQJKu06UeqvXAjkJz7X+YVQO/7rlLgKD4nEQqHczV
         uavZO621dHH7nqYufSiJRa3pfhkoC3OS8nFLwUC/A0FRaAwHzDAVnMUSx6BqCE5dD18S
         QkPVidfFBuSx9Ry5+oTEI08/qL6b4xMg5CBuR3Hszch80B+5PAYEEd43lWe1fEzEogQC
         pCMS6xlY+FGlcm//tY9ayM4Rp3UEhI9Q+l2pITCzgMfe3XV2naqVDEsbqn1agD70SU6M
         eOrFffSr9K17uo7jlsJ+2jiFMTV4jB1OeP7pLpfdG9Wqga7EE+hR4h+JttYlOx+OLfbg
         fjAA==
X-Gm-Message-State: ACgBeo3PulFgnPPE79okCdGhIgthVH5Gk3XU7HUBjAyVruSZHsMRR1N7
	2hexY/62qvUPwWmkhb0jR1iTo+dyrcE5/MeVzDfQDHxfnNQrxGWZRYoyjCfhL1howrIkOneg+tm
	xCH18zZwjfbkRiZTxH3OY1yC39oxIVpAFURsj7cm65jgk7Flt2oWCF8sgvDza0spO1Pzo0QxkCQ
	==
X-Google-Smtp-Source: AA6agR54JsXmsNxLeykhCovQYXLPwCyudwSKJ5KzmN5v6Pt0M/FYw9u1jAFxSPymtmO4mvSh0T1/Iv01d8c=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3f85])
 (user=jthies job=sendgmr) by 2002:a05:6a00:a04:b0:534:d8a6:40ce with SMTP id
 p4-20020a056a000a0400b00534d8a640cemr30258261pfh.15.1663022922073; Mon, 12
 Sep 2022 15:48:42 -0700 (PDT)
Date: Mon, 12 Sep 2022 22:47:45 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912224745.2716345-1-jthies@google.com>
Subject: [PATCH v2] platform/chrome: cros_ec: Notify the PM of wake events
 during resume
From: Jameson Thies <jthies@google.com>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, pmalani@chromium.org, bleung@chromium.org, 
	groeck@chromium.org, tzungbi@kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Update cros_ec_report_events_during_suspend to notify the PM of wake
events during resume by calling pm_wakeup_event.

Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- Updated wording in commit message from "Log" to "Notify PM of".
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

