Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7E82C80
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 04:50:54 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id z15-20020a25bb0f000000b00613388c7d99so2479470ybg.8
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 20:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=nCp6s4nr1Xud5CTQ+VIlWSD+FKpfYJQlQboKMSin5u4=;
        b=PmG67QHwG12X6WVc59SCtrxEsxp0NHt+0/sf7IYEqhyTTLMpbAlGml2df2jy4f+wXy
         FgRtsss/i4V5TXdqoU6ZZK6MBTHSxXTEj3Y2kGpbXdRFFvCLKXA0+4lKwQrjFgYUedU2
         COLR/hXysFpfR0DHU1hAH5Uikip0iOb/shrOUC5FWbiGgQ39/2rm4M++N59C2sC2qOBr
         kzLx4O8JGLbV6xy5GMAJHxUo7ER+ncMHdno4AstS9qmwUpPmDbamqlBAqs7X0MhozUFm
         vQoJHqJsXKyxn/MqXwSDnrjYPpUCY+ejzTMrPcswJ7gSs3hnWCX84gLyEcSDPniUq+vy
         ZvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=nCp6s4nr1Xud5CTQ+VIlWSD+FKpfYJQlQboKMSin5u4=;
        b=B4yT7oHjlq8BpkXNWo6792uwY/XWE8WJxmDNmTxm2Wwy+NRBEpk3Q5IN0CeeAFlKIp
         N1fYZiXDP5Z5t8RlcyacVs6DnALzmuzyuhOMtRfrMkHJvjZ8QmNmjSlp6kuvRsy3VZGi
         tGQ+LS+G+CJ44rQiWWZHlGO/+yRTaL/VqjYQuuO5qGD5Zhcs+rVAHFYBG33bx0x1fA5M
         LBoYNXjZCdRNf3n/3IDj5jm2NiPukzZeF58U774S91J7iQ/tZVNf50zUn74fLSsvpHd1
         CEl4xpwsu9oxiKTD3bpac80u7WDgXTmT0TALOrba2fBXxq/cfdOMEdVb5S/8gKigIAfK
         qe6w==
X-Gm-Message-State: AOAM532k/+ALXf5UdUz8c6BDuh7n1O2ug1fTO2nRN9xowcJ41tCSOnm/
	1V857pOecm9bY5sxUJHkdkhNEVdk/Pgp
X-Google-Smtp-Source: ABdhPJyTV7Gw0YbC6bHqcu3AaOBFSpFFAPqYAOk8AQ9thEsV42gywCIoACXGz8SU3caIzyPvKsfbhYqRQtn4
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
 (user=tzungbi job=sendgmr) by 2002:a05:6902:8f:: with SMTP id
 h15mr603267ybs.537.1644382253743; Tue, 08 Feb 2022 20:50:53 -0800 (PST)
Date: Wed,  9 Feb 2022 12:50:32 +0800
In-Reply-To: <20220209045035.380615-1-tzungbi@google.com>
Message-Id: <20220209045035.380615-4-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v2 3/6] platform/chrome: cros_ec: determine `wake_enabled` in cros_ec_suspend()
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"

`wake_enabled` indicates cros_ec_resume() needs to call
disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().

Determine `wake_enabled` in cros_ec_suspend() instead of
reset-after-used in cros_ec_resume().

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_ec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 303af630c03e..a97a47ae0472 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -342,6 +342,8 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
 
 	if (device_may_wakeup(dev))
 		ec_dev->wake_enabled = !enable_irq_wake(ec_dev->irq);
+	else
+		ec_dev->wake_enabled = false;
 
 	disable_irq(ec_dev->irq);
 	ec_dev->suspended = true;
@@ -383,10 +385,9 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
 		dev_dbg(ec_dev->dev, "Error %d sending resume event to ec",
 			ret);
 
-	if (ec_dev->wake_enabled) {
+	if (ec_dev->wake_enabled)
 		disable_irq_wake(ec_dev->irq);
-		ec_dev->wake_enabled = 0;
-	}
+
 	/*
 	 * Let the mfd devices know about events that occur during
 	 * suspend. This way the clients know what to do with them.
-- 
2.35.0.263.gb82422642f-goog

