Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2E32C80
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:57:35 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id q4-20020a170902f78400b0014d57696618so1396708pln.20
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dLsQ8j/eaK2sPDSE7zPtNw82onF6HQ/CZ66kA9Om+Gk=;
        b=XPBl8B9ZzeEwkJPR8kKU4tQaaToHgQ2GLkPMz4C43807C3EmjsPB0iiJGDM2atMX+X
         +lq6mDMSPwlGQuNDX6qZZmmNmqQ5igB3ilRjQa45w4tBTCb4Hi3RV9NM63M0b9rgQnzp
         5nw9WKLkZKdBVAw0zYI+2SeuVVS1X+dmIVv4xYuAc6Z+8PEJM+xms8yNsx5cuv5L7WKQ
         vS1+6u3y8Cvg9PZzc5Zx1bbwRSpSkgESIGy2GWdaplRRkACBM0zyAwTZxqLDwH8uHnK1
         seLssxyQ4i8xaAUpsY8+MAaDYjlIWPB0UH4pv1b6ao4H/lRRCrQ8xYoWFt2h91UKLRLI
         JjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dLsQ8j/eaK2sPDSE7zPtNw82onF6HQ/CZ66kA9Om+Gk=;
        b=mdlSlv5/cXRM2jwwZMwSyVYKCX4gHCrgn5i9cnDDo3WITSSovSyjFYwavxENk9O+t4
         rojFcwx20sHIsC7Qhcvm5+Wdx7K+/un6Uy1Wo/ZrGWO8Zc+QIWgqTUEhsEhBIqIwLxef
         p7vqoqVzjzE3rgNm7Js18QRX6M9YMXaKh+j8gz9fElDOl61vod7zVtkyYv1om1CQnIq+
         2JMVnc1DMK1o1oHWBFVy57cOzZjf2Kld/UFX3Rx6l08kfBtnJcE44teptFwhmNECe4cF
         Ocd5eDodp3WdkeSkQolJ1VdaWObYDPjn4qGK0kbzpyxleVKdEmB1cF8svhYaaJ2q4395
         zksQ==
X-Gm-Message-State: AOAM530GvCoZ0Dkd2RKdIViTw+aUzsDv7dtS0y/PQohwHOF4kBbG3GgF
	0shoTlq7aWNgC/6qymeJhLzjG4CDXqOc
X-Google-Smtp-Source: ABdhPJxMl2ZtqPjPLKT16DCq0O5wQvpOIQmB+UhYl8tFNm/+vg89f7FmCK5xv1dTmKzRvFd52SE8qH731ZCk
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
 (user=tzungbi job=sendgmr) by 2002:a17:902:f68a:: with SMTP id
 l10mr1330890plg.146.1644400655253; Wed, 09 Feb 2022 01:57:35 -0800 (PST)
Date: Wed,  9 Feb 2022 17:57:03 +0800
In-Reply-To: <20220209095703.517608-1-tzungbi@google.com>
Message-Id: <20220209095703.517608-7-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220209095703.517608-1-tzungbi@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v3 6/6] platform/chrome: cros_ec: append newline to all logs
From: Tzung-Bi Shih <tzungbi@google.com>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, tzungbi@google.com, pmalani@chromium.org
Content-Type: text/plain; charset="UTF-8"

To be consistent, append newline ("\n") to all logs.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
No changes from v2.

Changes from v1:
(https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
- Use imperative mood in commit message.

 drivers/platform/chrome/cros_ec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 2c4e81f3fef9..639d5a651b76 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -213,7 +213,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 						"chromeos-ec", ec_dev);
 		if (err) {
-			dev_err(dev, "Failed to request IRQ %d: %d",
+			dev_err(dev, "Failed to request IRQ %d: %d\n",
 				ec_dev->irq, err);
 			return err;
 		}
@@ -264,7 +264,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	 */
 	err = cros_ec_sleep_event(ec_dev, 0);
 	if (err < 0)
-		dev_dbg(ec_dev->dev, "Error %d clearing sleep event to ec",
+		dev_dbg(ec_dev->dev, "Error %d clearing sleep event to ec\n",
 			err);
 
 	if (ec_dev->mkbp_event_supported) {
@@ -336,7 +336,7 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
 
 	ret = cros_ec_sleep_event(ec_dev, sleep_event);
 	if (ret < 0)
-		dev_dbg(ec_dev->dev, "Error %d sending suspend event to ec",
+		dev_dbg(ec_dev->dev, "Error %d sending suspend event to ec\n",
 			ret);
 
 	if (device_may_wakeup(dev))
@@ -381,7 +381,7 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
 
 	ret = cros_ec_sleep_event(ec_dev, sleep_event);
 	if (ret < 0)
-		dev_dbg(ec_dev->dev, "Error %d sending resume event to ec",
+		dev_dbg(ec_dev->dev, "Error %d sending resume event to ec\n",
 			ret);
 
 	if (ec_dev->wake_enabled)
-- 
2.35.0.263.gb82422642f-goog

