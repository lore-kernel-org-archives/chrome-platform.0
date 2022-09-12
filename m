Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411924C6C
	for <chrome-platform@lists.linux.dev>; Mon, 12 Sep 2022 21:33:58 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id f16-20020a17090a4a9000b001f234757bbbso4481581pjh.6
        for <chrome-platform@lists.linux.dev>; Mon, 12 Sep 2022 14:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=t92G0xsuXiQ+5p7MU78V80zQy5qz0xUQIUtG/cpaDJU=;
        b=UeaI/F7To/XvQq0UnOtlDhy7TWOfXA+1z9EGlyjpTrEGbBEhCamdHNFU0CfzdMi5hM
         UhkFcQ2RD3R+FgOB4U8CBTvdnoG/wllzgOr3V58B3j2wlkWlevRmSN5EL0TWqkNr2i3F
         LLQUWgJ67u+HYHc4rByBM8S6mYnUi6jWdR8UXOwwRGmp8Hra5JFxI3lZLyUBATyBU5Q4
         3xIaVZt4CD9ZST6ilr/j0ihwyAqxJBf0tmhInPLzi8SratP4dnV0s2tLmzFKzPhxJ5nF
         jDbz/hiWW5PVxahvFqDbp2mecyU/uMGuMRsfkkROn5aUjjz1WPFhe36xOruaoULwePmI
         O6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=t92G0xsuXiQ+5p7MU78V80zQy5qz0xUQIUtG/cpaDJU=;
        b=xPyogBF9vKrOFpuh4sR0REvUL4aLyvRCnHmFHAeYQI9jXhtToNtTLwQ7TnMXITZeFu
         9E2n1Dvyyrwia9Sjx66l30Pf5yOMljJvljIN+glPP5pEYKVaUBZIxyQ2cInPwzbUWDan
         1O7SpPKhkLD/y/NRORc4v9PFTEeCU4mdTHyCj+5tJx35/2QmyHFjoiRZdzyJfPt+1lEt
         ABp01uVq+AE9UlVjkbGW8NTZmmirEHD5BNBROzhxSqAZgSkny676Z8Uld68hyqkLmVQ2
         0lnLOTtm1mNEQpjw8BXXpWtes+UBBwacFHbhp4TUN5sYbdl+S3R1GFK5AoaKuGIy3DFz
         Cqdg==
X-Gm-Message-State: ACgBeo1X/EdDAo2tvXtKQgLfu15IeXtagRxP1QGcQucKrCHLbneYsNsq
	iHk7fosHdr6tz5KViLmaqHAZfjimg71+gMmYKLlnfqHQe6d9Q1O3d3hdfpva0WxSiX84pECsIp5
	xSD0ioEGsh2joUq8qeIKI20QC56HDTgoK5fRo25pQfIezdMcVHYyOqAWWbNlFBcp5JQRWOVULvg
	==
X-Google-Smtp-Source: AA6agR4Jn14x7CO49XIT60557aSMTJHu7eBX3x+qDQsf6nN0yuw8oVJdDIOQW/rtloP/L1LJ4bywP1FsqGY=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3f85])
 (user=jthies job=sendgmr) by 2002:a17:902:db0a:b0:178:2636:b6de with SMTP id
 m10-20020a170902db0a00b001782636b6demr10904990plx.58.1663018437527; Mon, 12
 Sep 2022 14:33:57 -0700 (PDT)
Date: Mon, 12 Sep 2022 21:33:34 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220912213334.2703872-1-jthies@google.com>
Subject: [PATCH] platform/chrome: cros_ec: Log wake events during resume
From: Jameson Thies <jthies@google.com>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, pmalani@chromium.org, bleung@chromium.org, 
	groeck@chromium.org, tzungbi@kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Update cros_ec_report_events_during_suspend to log wake events during
resume by calling pm_wakeup_event.

Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
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

